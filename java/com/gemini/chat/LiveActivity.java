package com.gemini.chat;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioRecord;
import android.media.AudioTrack;
import android.media.MediaRecorder;
import android.os.Bundle;
import android.os.Handler;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.LinkedList;

/**
 * Gemini Live: talk to a native-audio model. Microphone -> 16 kHz PCM -> Live API; 24 kHz PCM reply -> AudioTrack.
 * Both sides are transcribed; the model's words appear as the matching audio is played (not when it arrives).
 * While the user speaks, a second session (gemini-3.5-transcribe-live) streams their words into the text box.
 * Typed text can be sent too. Connections are resumed automatically (session resumption) when Google closes them. Finished turns are saved into the chat (extra "chat_id"; a new chat is created if -1),
 * and the chat's earlier text messages are given to the model as history.
 * Native widgets only, built in code (works from Android 2.1, 240x320 upwards).
 */
public class LiveActivity extends Activity {
    static final String[] LIVE_MODELS = {"gemini-3.8-live", "gemini-3.8-live-extended-thinking", "gemini-3.1-flash-live-preview"};
    static final String DEFAULT_LIVE_MODEL = "gemini-3.8-live";
    /** The 30 prebuilt voices (speech-generation guide), "Name -- style". */
    static final String[] VOICES = {"Zephyr -- Bright", "Puck -- Upbeat", "Charon -- Informative", "Kore -- Firm",
            "Fenrir -- Excitable", "Leda -- Youthful", "Orus -- Firm", "Aoede -- Breezy", "Callirrhoe -- Easy-going",
            "Autonoe -- Bright", "Enceladus -- Breathy", "Iapetus -- Clear", "Umbriel -- Easy-going", "Algieba -- Smooth",
            "Despina -- Smooth", "Erinome -- Clear", "Algenib -- Gravelly", "Rasalgethi -- Informative",
            "Laomedeia -- Upbeat", "Achernar -- Soft", "Alnilam -- Firm", "Schedar -- Even", "Gacrux -- Mature",
            "Pulcherrima -- Forward", "Achird -- Friendly", "Zubenelgenubi -- Casual", "Vindemiatrix -- Gentle",
            "Sadachbia -- Lively", "Sadaltager -- Knowledgeable", "Sulafat -- Warm"};
    static final String DEFAULT_VOICE = "Kore";
    static final String[] THINKING = {"low", "medium", "high"};
    /** Earlier chat text sent as history is capped (old phones, and the Live context is smaller). */
    private static final int HISTORY_MAX_CHARS = 24000;

    private final Handler ui = new Handler();
    private DatabaseHelper db;
    private long chatId;
    private String model, voice;
    private boolean handsFree;
    /** Settings > Mute voice: the reply is not played; its transcript is shown as soon as it arrives. */
    private boolean muted;
    /** Settings > Live text while speaking: stream the user's words into the text box. */
    private boolean liveText;

    private TextView status;
    private ScrollView scroll;
    private LinearLayout turns;
    private EditText input;
    private Button btnTalk, btnSend;

    private LiveSession session;      // the conversation
    private volatile int sessionGen;  // callbacks from older sessions are ignored
    private LiveSession tr;           // speech-to-text for the text box (may be null)
    private boolean connected;
    private int reconnects;           // automatic resumptions in a row (reset by a completed turn)
    private Mic mic;
    private Player player;
    private boolean destroyed, ending;

    // the user's turn: what the model heard, and what the transcriber shows while speaking
    private final StringBuffer heard = new StringBuffer(), spokenFinal = new StringBuffer();
    private String spokenInterim = "", typedPrefix = "";
    // the model's turn
    private TextView modelView;
    private final StringBuffer modelShown = new StringBuffer();
    private final LinkedList<Object[]> pendingText = new LinkedList<Object[]>(); // {Long frameTag, String text}
    private boolean modelTurnDone;
    /** From the model's first audio/text until its turn has played out: the (hands-free) mic stays muted. */
    private volatile boolean modelTurnActive;
    /** Hands-free: the mic reopens only after this time (a short tail after playback, for speaker echo). */
    private volatile long micOpenAfter;
    private static final long ECHO_TAIL_MS = 700;
    private boolean talking; // push-to-talk: recording / hands-free: mic on

    static String voiceName(String entry) {
        int i = entry.indexOf(" -- ");
        return i > 0 ? entry.substring(0, i) : entry;
    }

    private int dp(float v) {
        return (int) (v * getResources().getDisplayMetrics().density + 0.5f);
    }

    // =========================================================================================
    // UI
    // =========================================================================================

    @Override
    protected void onCreate(Bundle b) {
        super.onCreate(b);
        MessageFormatter.applyPrefs(this);
        db = new DatabaseHelper(this);
        chatId = getIntent().getLongExtra("chat_id", -1L);
        SharedPreferences sp = getSharedPreferences(ChatActivity.PREFS, 0);
        model = sp.getString("live_model", DEFAULT_LIVE_MODEL);
        voice = sp.getString("live_voice", DEFAULT_VOICE);
        handsFree = sp.getBoolean("live_hands_free", false);
        muted = sp.getBoolean("live_muted", false);
        liveText = sp.getBoolean("live_text", true);
        updateTitle();
        setVolumeControlStream(AudioManager.STREAM_MUSIC);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                | WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);

        status = new TextView(this);
        status.setTextSize(13f);
        status.setPadding(dp(10), dp(4), dp(10), dp(4));
        status.setTextColor(0xFF9AA0A6);
        root.addView(status, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.FILL_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));

        scroll = new ScrollView(this);
        turns = new LinearLayout(this);
        turns.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(turns, new ScrollView.LayoutParams(ScrollView.LayoutParams.FILL_PARENT,
                ScrollView.LayoutParams.WRAP_CONTENT));
        root.addView(scroll, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.FILL_PARENT, 0, 1f));

        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(dp(2), dp(2), dp(2), 0);
        input = new EditText(this);
        input.setHint("Type or talk...");
        input.setMaxLines(3);
        row.addView(input, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        btnSend = new Button(this);
        btnSend.setText("Send");
        btnSend.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                sendTyped();
            }
        });
        row.addView(btnSend, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));
        root.addView(row, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.FILL_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));

        LinearLayout row2 = new LinearLayout(this);
        row2.setOrientation(LinearLayout.HORIZONTAL);
        row2.setPadding(dp(2), 0, dp(2), dp(2));
        btnTalk = new Button(this);
        btnTalk.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                onTalk();
            }
        });
        row2.addView(btnTalk, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 2f));
        Button end = new Button(this);
        end.setText("End");
        end.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                finish();
            }
        });
        row2.addView(end, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        root.addView(row2, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.FILL_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));

        setContentView(root);
        loadExisting();
        player = new Player(muted);
        player.start();
        connect(null);
    }

    @Override
    protected void onPause() {
        super.onPause();
        if (talking) stopTalking(true); // never keep the microphone open in the background
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        destroyed = true;
        ui.removeCallbacks(tick);
        stopTalking(false);
        sessionGen++;
        if (session != null) session.stop();
        if (tr != null) tr.stop();
        player.quit();
        finishModelTurn(true);
        finishUserTurn();
        db.close();
    }

    @Override
    public void finish() {
        ending = true;
        // save what is on screen first, so a chat created here is returned to ChatActivity
        finishUserTurn();
        finishModelTurn(true);
        Intent r = new Intent();
        r.putExtra("chat_id", chatId);
        setResult(RESULT_OK, r);
        super.finish();
    }

    /** "Live: <chat name>" (the chat's own title is not changed). */
    private void updateTitle() {
        setTitle("Live: " + (chatId == -1 ? "New chat" : db.getChatTitle(chatId)));
    }

    private void setStatus(String s) {
        if (!s.contentEquals(status.getText())) status.setText(s);
    }

    private void updateButtons() {
        boolean ok = connected;
        btnSend.setEnabled(ok);
        if (!ok) {
            btnTalk.setText("Reconnect");
            btnTalk.setEnabled(session == null);
        } else if (handsFree) {
            btnTalk.setText(talking ? "Mic: on (tap to mute)" : "Mic: off (tap to talk)");
            btnTalk.setEnabled(true);
        } else {
            btnTalk.setText(talking ? "Send speech" : "Talk");
            btnTalk.setEnabled(true);
        }
    }

    private void idleStatus() {
        if (!connected) return;
        String s;
        if (talking) s = handsFree ? "Listening (hands-free)..." : "Listening... tap \"Send speech\" when done";
        else s = handsFree ? "Tap the mic button and speak, or type" : "Tap Talk and speak, or type";
        setStatus(muted ? s + " (voice muted)" : s);
    }

    private TextView addTurnView(String role, String label, String text) {
        TextView tv = new TextView(this);
        tv.setText(MessageFormatter.format(this, role, label, text, System.currentTimeMillis(), null));
        MessageFormatter.styleView(tv, role);
        turns.addView(tv);
        scrollDown();
        return tv;
    }

    private void scrollDown() {
        scroll.post(new Runnable() {
            public void run() {
                scroll.scrollTo(0, turns.getMeasuredHeight());
            }
        });
    }

    /** Shows the chat's earlier messages. */
    private void loadExisting() {
        if (chatId == -1) return;
        Cursor c = db.getMessages(chatId);
        if (c == null) return;
        try {
            int iRole = c.getColumnIndex("role"), iContent = c.getColumnIndex("content"), iModel = c.getColumnIndex("model");
            int iTs = c.getColumnIndex("timestamp");
            while (c.moveToNext()) {
                String role = c.getString(iRole);
                if (!"user".equals(role) && !"model".equals(role)) continue;
                TextView tv = new TextView(this);
                tv.setText(MessageFormatter.format(this, role, c.getString(iModel), c.getString(iContent), c.getLong(iTs), null));
                MessageFormatter.styleView(tv, role);
                turns.addView(tv);
            }
        } finally {
            c.close();
        }
        scrollDown();
    }

    /** Text of the chat so far, newest kept when over the cap. */
    private String[][] history() {
        if (chatId == -1) return null;
        ArrayList<String[]> l = new ArrayList<String[]>();
        Cursor c = db.getMessages(chatId);
        if (c == null) return null;
        try {
            int iRole = c.getColumnIndex("role"), iContent = c.getColumnIndex("content");
            while (c.moveToNext()) {
                String role = c.getString(iRole), text = c.getString(iContent);
                if (("user".equals(role) || "model".equals(role)) && text != null && text.trim().length() > 0) {
                    l.add(new String[]{role, text});
                }
            }
        } finally {
            c.close();
        }
        int total = 0, from = l.size();
        while (from > 0 && total + l.get(from - 1)[1].length() <= HISTORY_MAX_CHARS) {
            total += l.get(from - 1)[1].length();
            from--;
        }
        if (from >= l.size()) return null;
        String[][] h = new String[l.size() - from][];
        for (int i = from; i < l.size(); i++) h[i - from] = l.get(i);
        return h;
    }

    // =========================================================================================
    // Sessions
    // =========================================================================================

    private String apiKey() {
        return getSharedPreferences(ChatActivity.PREFS, 0).getString("api_key", "").trim();
    }

    /** resumeHandle: continue the previous connection's conversation (null = new session with the chat history). */
    private void connect(String resumeHandle) {
        SharedPreferences sp = getSharedPreferences(ChatActivity.PREFS, 0);
        String key = apiKey();
        if (key.length() == 0) {
            Toast.makeText(this, "Please go to Settings to set API Key", Toast.LENGTH_LONG).show();
            setStatus("No API key");
            updateButtons();
            return;
        }
        String sys = TimeGrounding.apply(this, sp.getString("system_instruction", "").trim());
        final int gen = ++sessionGen;
        session = new LiveSession(key, model, voice, sys, handsFree, new Main(gen));
        if (LiveSession.needsThinkingLevel(model)) session.thinkingLevel = sp.getString("live_thinking", "low");
        if (resumeHandle != null) session.resumeHandle = resumeHandle;
        else session.history = history();
        setStatus(resumeHandle != null ? "Reconnecting..." : "Connecting to " + model + " (" + voice + ")...");
        updateButtons();
        session.start();
    }

    /** Resumes the conversation on a new connection (Google ends connections after about 10 minutes). */
    private void resume() {
        LiveSession old = session;
        String h = old != null ? old.lastHandle : null;
        if (h == null) return;
        sessionGen++; // ignore the old connection from now on
        if (talking) stopTalking(false);
        connected = false;
        old.stop();
        reconnects++;
        connect(h);
    }

    private void openTranscriber() {
        if (!liveText || tr != null || destroyed) return;
        Transcriber l = new Transcriber();
        tr = LiveSession.transcriber(apiKey(), true, l); // its own voice detection, in both modes
        l.self = tr;
        tr.start();
    }

    /** The conversation's callbacks (reader thread); ignored once a newer session exists. */
    private final class Main implements LiveSession.Listener {
        final int gen;

        Main(int gen) {
            this.gen = gen;
        }

        private boolean current() {
            return gen == sessionGen && !destroyed;
        }

        public void onReady() {
            ui.post(new Runnable() {
                public void run() {
                    if (!current()) return;
                    connected = true;
                    updateButtons();
                    idleStatus();
                    ui.removeCallbacks(tick);
                    ui.post(tick);
                    openTranscriber();
                }
            });
        }

        public void onClosed(final String error) {
            ui.post(new Runnable() {
                public void run() {
                    if (!current()) return;
                    LiveSession closed = session;
                    connected = false;
                    if (talking) stopTalking(false);
                    String h = closed != null ? closed.lastHandle : null;
                    boolean fatal = error != null && (error.indexOf("(1007)") >= 0 || error.indexOf("(1008)") >= 0);
                    if (!ending && h != null && !fatal && reconnects < 3) { // dropped or timed out: carry on
                        finishModelTurn(true);
                        reconnects++;
                        connect(h);
                        return;
                    }
                    session = null;
                    finishModelTurn(true);
                    finishUserTurn();
                    setStatus(error == null ? "Disconnected." : "Disconnected: " + error);
                    updateButtons();
                }
            });
        }

        public void onAudio(byte[] pcm) {
            if (gen != sessionGen) return;
            modelTurnActive = true;
            player.enqueue(pcm); // any thread
        }

        public void onInputText(final String delta) {
            ui.post(new Runnable() {
                public void run() {
                    if (!current()) return;
                    heard.append(delta);
                    updateBox();
                }
            });
        }

        public void onInterimInput(String text) {
        }

        public void onOutputText(final String delta) {
            final long tag = player.lastChunkStart();
            modelTurnActive = true;
            ui.post(new Runnable() {
                public void run() {
                    if (!current()) return;
                    finishUserTurn(); // the model is answering: the user's turn is final
                    modelTurnDone = false;
                    synchronized (pendingText) {
                        pendingText.add(new Object[]{Long.valueOf(tag), delta});
                    }
                }
            });
        }

        public void onTurnComplete() {
            ui.post(new Runnable() {
                public void run() {
                    if (!current()) return;
                    finishUserTurn();
                    modelTurnDone = true; // saved by tick() once the audio has played out
                    player.endOfTurn();
                    reconnects = 0;
                }
            });
        }

        public void onInterrupted() {
            if (gen != sessionGen) return;
            player.flush();
            ui.post(new Runnable() {
                public void run() {
                    if (!current()) return;
                    finishModelTurn(true);
                    modelTurnActive = false;
                }
            });
        }
    }

    /** Speech-to-text callbacks: the user's words go into the text box while they speak. */
    private final class Transcriber implements LiveSession.Listener {
        LiveSession self;

        public void onReady() {
        }

        public void onAudio(byte[] pcm) {
        }

        public void onInterimInput(final String text) {
            ui.post(new Runnable() {
                public void run() {
                    if (destroyed) return;
                    spokenInterim = text;
                    updateBox();
                }
            });
        }

        public void onInputText(final String text) {
            ui.post(new Runnable() {
                public void run() {
                    if (destroyed) return;
                    spokenFinal.append(text.trim()).append(' ');
                    spokenInterim = "";
                    updateBox();
                }
            });
        }

        public void onOutputText(String delta) {
        }

        public void onTurnComplete() {
        }

        public void onInterrupted() {
        }

        public void onClosed(String error) {
            ui.post(new Runnable() {
                public void run() {
                    if (tr == self) tr = null; // reopened on the next Talk (it also ends after ~10 minutes)
                }
            });
        }
    }

    /** The text box while speaking: typed text, then the user's words (transcriber, or what the model heard). */
    private void updateBox() {
        if (!liveText) return;
        String spoken = (spokenFinal.toString() + spokenInterim).trim();
        if (spoken.length() == 0) spoken = heard.toString().trim();
        String t = typedPrefix.length() > 0 && spoken.length() > 0 ? typedPrefix + " " + spoken : typedPrefix + spoken;
        if (!t.contentEquals(input.getText())) {
            input.setText(t);
            input.setSelection(t.length());
        }
    }

    /** Reveals model text in step with playback; saves the turn when its audio has finished. ~12 times a second. */
    private final Runnable tick = new Runnable() {
        public void run() {
            long played = player.playedFrames();
            boolean changed = false;
            synchronized (pendingText) {
                while (!pendingText.isEmpty() && ((Long) pendingText.getFirst()[0]).longValue() <= played) {
                    modelShown.append((String) pendingText.removeFirst()[1]);
                    changed = true;
                }
            }
            if (changed) showModel();
            boolean playing = player.isPlaying();
            if (modelTurnDone && !playing && pendingIsEmpty()) {
                finishModelTurn(false);
                modelTurnActive = false;
                micOpenAfter = System.currentTimeMillis() + ECHO_TAIL_MS;
            }
            if (connected) {
                // one state for the whole reply: short gaps in the audio (slow phone/network) are not "listening"
                if (modelTurnActive || playing) setStatus(muted ? "Model is answering..." : "Model is speaking...");
                else idleStatus();
                LiveSession s = session;
                if (s != null && s.goAway && !talking && !modelTurnActive && !playing) resume(); // before Google cuts it
            }
            ui.postDelayed(this, 80);
        }
    };

    private boolean pendingIsEmpty() {
        synchronized (pendingText) {
            return pendingText.isEmpty();
        }
    }

    private void showModel() {
        String t = modelShown.toString().trim();
        if (t.length() == 0) return;
        if (modelView == null) modelView = addTurnView("model", model, t);
        else modelView.setText(MessageFormatter.format(this, "model", model, t, System.currentTimeMillis(), null));
        scrollDown();
    }

    /** Saves the model's turn. now: reveal any text not yet played (interrupted / closing). */
    private void finishModelTurn(boolean now) {
        if (now) {
            synchronized (pendingText) {
                while (!pendingText.isEmpty()) modelShown.append((String) pendingText.removeFirst()[1]);
            }
            showModel();
        }
        String t = modelShown.toString().trim();
        if (t.length() > 0) {
            save("model", t);
            if (!destroyed) {
                // name the chat right after the first spoken exchange (not only when Live is closed)
                AutoNamer.maybeStart(this, db, chatId, new AutoNamer.Callback() {
                    public void onNamed(long id, String title) {
                        if (!destroyed && id == chatId) updateTitle();
                    }
                });
            }
        }
        modelShown.setLength(0);
        modelView = null;
        modelTurnDone = false;
    }

    /** The user's spoken turn becomes a message (what the model heard; the transcriber's text if it heard nothing). */
    private void finishUserTurn() {
        String t = heard.toString().trim();
        if (t.length() == 0) t = (spokenFinal.toString() + spokenInterim).trim();
        boolean hadSpeech = t.length() > 0;
        if (hadSpeech) {
            addTurnView("user", null, t);
            save("user", t);
        }
        heard.setLength(0);
        spokenFinal.setLength(0);
        spokenInterim = "";
        if (hadSpeech && liveText) {
            input.setText(typedPrefix); // the spoken words leave the box; anything typed before stays
            input.setSelection(input.getText().length());
        }
        typedPrefix = "";
    }

    private void save(String role, String text) {
        if (chatId == -1) {
            String title = text.replace('\n', ' ').trim(); // same rule as a typed first message
            if (title.length() > 25) title = title.substring(0, 25) + "...";
            chatId = db.createChat(title);
            updateTitle();
        }
        db.addMessage(chatId, role, text, "model".equals(role) ? model : null);
    }

    // =========================================================================================
    // Input
    // =========================================================================================

    private void sendTyped() {
        String t = input.getText().toString().trim();
        if (t.length() == 0 || session == null || !connected) return;
        InputMethodManager imm = (InputMethodManager) getSystemService(INPUT_METHOD_SERVICE);
        if (imm != null) imm.hideSoftInputFromWindow(input.getWindowToken(), 0);
        if (talking) stopTalking(false); // the box (typed + spoken words) is sent as text instead
        heard.setLength(0);
        spokenFinal.setLength(0);
        spokenInterim = "";
        typedPrefix = "";
        bargeIn();
        addTurnView("user", null, t);
        save("user", t);
        input.setText("");
        session.sendText(t);
    }

    /** The user takes the turn: stop the model's audio (the server cancels its answer when it hears/reads the user). */
    private void bargeIn() {
        if (modelTurnActive || player.isPlaying() || !pendingIsEmpty()) {
            player.flush();
            finishModelTurn(true);
            modelTurnActive = false;
        }
    }

    private void onTalk() {
        if (session == null) {
            reconnects = 0;
            connect(null);
            return;
        }
        if (!connected) return;
        if (talking) {
            stopTalking(true);
            return;
        }
        mic = new Mic();
        if (!mic.ok) {
            Toast.makeText(this, "Microphone not available.", Toast.LENGTH_LONG).show();
            mic = null;
            return;
        }
        bargeIn();
        micOpenAfter = 0;
        openTranscriber();
        typedPrefix = input.getText().toString().trim();
        if (!handsFree) session.activityStart();
        talking = true;
        mic.start();
        updateButtons();
        idleStatus();
    }

    /** send: tell the servers the speech ended (push-to-talk: answer now; hands-free: end of stream). */
    private void stopTalking(boolean send) {
        if (mic != null) {
            mic.quit();
            mic = null;
        }
        if (talking && send && session != null) {
            if (handsFree) session.audioStreamEnd();
            else session.activityEnd();
        }
        if (talking && tr != null) tr.audioStreamEnd(); // finalize the box text
        talking = false;
        updateButtons();
        idleStatus();
    }

    /** Hands-free echo guard: the mic is muted during the whole reply and briefly after it. */
    private boolean micMuted() {
        return handsFree && (modelTurnActive || System.currentTimeMillis() < micOpenAfter || player.isPlaying());
    }

    // =========================================================================================
    // Microphone: 16 kHz mono 16-bit (falls back to another rate; the API resamples), 100 ms chunks
    // =========================================================================================

    private final class Mic extends Thread {
        private static final int RATE_16K = 16000;
        AudioRecord rec;
        int rate;
        boolean ok;
        private volatile boolean running = true;

        Mic() {
            int[] rates = {RATE_16K, 8000, 11025, 22050, 44100};
            for (int i = 0; i < rates.length && rec == null; i++) {
                try {
                    int min = AudioRecord.getMinBufferSize(rates[i], AudioFormat.CHANNEL_CONFIGURATION_MONO,
                            AudioFormat.ENCODING_PCM_16BIT);
                    if (min <= 0) continue;
                    AudioRecord r = new AudioRecord(MediaRecorder.AudioSource.MIC, rates[i],
                            AudioFormat.CHANNEL_CONFIGURATION_MONO, AudioFormat.ENCODING_PCM_16BIT,
                            Math.max(min, rates[i] * 2 / 2)); // >= 0.5 s buffer
                    if (r.getState() == AudioRecord.STATE_INITIALIZED) {
                        rec = r;
                        rate = rates[i];
                    } else {
                        r.release();
                    }
                } catch (Exception ignored) {
                }
            }
            ok = rec != null;
        }

        void quit() {
            running = false;
        }

        public void run() {
            byte[] buf = new byte[rate / 10 * 2];
            try {
                rec.startRecording();
                while (running) {
                    int n = rec.read(buf, 0, buf.length);
                    if (n <= 0) continue;
                    if (micMuted()) continue; // hands-free: no echo cancellation on old phones
                    LiveSession s = session, t = tr;
                    if (s != null) s.sendAudio(buf, 0, n, rate);
                    if (t != null) t.sendAudio(buf, 0, n, rate);
                }
            } catch (Exception ignored) {
            } finally {
                try {
                    rec.stop();
                } catch (Exception ignored) {
                }
                rec.release();
            }
        }
    }

    // =========================================================================================
    // Speaker: 24 kHz mono 16-bit, streamed; counts frames so the transcript can follow the audio
    // =========================================================================================

    private final class Player extends Thread {
        private final LinkedList<byte[]> queue = new LinkedList<byte[]>();
        private AudioTrack track;
        private volatile boolean running = true;
        private int carry = -1;            // odd byte left from the previous chunk
        private long received;             // frames received since the last flush
        private long chunkStart;           // frame position where the latest chunk starts
        private long written;              // frames written to the track since the last flush
        private int headAtFlush;           // playback head right after the last flush (it may or may not reset)
        private int generation;            // bumped by flush(): a write that straddles a flush is not counted
        private long lastHead = -1, lastMove; // stall detection: an audio output that stops consuming must not
                                              // hold the transcript back forever
        /** Jitter buffer: from silence, start playing once this much is queued (or the turn ended / 600 ms passed). */
        private static final int PREBUFFER_FRAMES = LiveSession.OUTPUT_RATE * 3 / 10;
        private long queuedFrames, firstQueuedAt;
        private boolean turnEnded;

        Player(boolean muted) {
            if (muted) return; // no AudioTrack: everything counts as played at once
            try {
                int min = AudioTrack.getMinBufferSize(LiveSession.OUTPUT_RATE, AudioFormat.CHANNEL_CONFIGURATION_MONO,
                        AudioFormat.ENCODING_PCM_16BIT);
                if (min > 0) {
                    AudioTrack t = new AudioTrack(AudioManager.STREAM_MUSIC, LiveSession.OUTPUT_RATE,
                            AudioFormat.CHANNEL_CONFIGURATION_MONO, AudioFormat.ENCODING_PCM_16BIT,
                            Math.max(min, LiveSession.OUTPUT_RATE / 2 * 2), AudioTrack.MODE_STREAM); // >= 0.5 s
                    if (t.getState() == AudioTrack.STATE_INITIALIZED) track = t;
                    else t.release();
                }
            } catch (Exception ignored) {
            }
        }

        synchronized long lastChunkStart() {
            return chunkStart;
        }

        void enqueue(byte[] pcm) {
            synchronized (this) {
                int n = pcm.length + (carry >= 0 ? 1 : 0);
                byte[] b = new byte[n & ~1];
                int o = 0;
                if (carry >= 0 && b.length > 0) b[o++] = (byte) carry;
                int take = b.length - o;
                System.arraycopy(pcm, 0, b, o, take);
                carry = (n & 1) != 0 ? pcm[pcm.length - 1] & 0xFF : -1;
                if (b.length == 0) return;
                chunkStart = received;
                received += b.length / 2;
                if (track == null) {
                    written = received; // no audio output: text is shown immediately
                    return;
                }
                if (queue.isEmpty() && written <= playedFrames()) { // starting from silence
                    firstQueuedAt = System.currentTimeMillis();
                    turnEnded = false;
                }
                queue.add(b);
                queuedFrames += b.length / 2;
                notifyAll();
            }
        }

        /** Frames actually played since the last flush (no audio device: everything counts as played). */
        long playedFrames() {
            AudioTrack t = track;
            if (t == null) return Long.MAX_VALUE;
            synchronized (this) {
                long head = (t.getPlaybackHeadPosition() & 0xFFFFFFFFL) - (headAtFlush & 0xFFFFFFFFL);
                long now = System.currentTimeMillis();
                if (head != lastHead) {
                    lastHead = head;
                    lastMove = now;
                } else if (head < written && now - lastMove > 1500) {
                    return written; // stalled output (no device / emulator): treat as played
                }
                return Math.min(head, written);
            }
        }

        boolean isPlaying() {
            if (track == null) return false;
            synchronized (this) {
                return !queue.isEmpty() || playedFrames() < written;
            }
        }

        /** The model's turn is complete: play what is queued even if it is shorter than the jitter buffer. */
        void endOfTurn() {
            synchronized (this) {
                turnEnded = true;
                notifyAll();
            }
        }

        /** Barge-in: drop everything queued or buffered. */
        void flush() {
            synchronized (this) {
                queue.clear();
                queuedFrames = 0;
                generation++;
                carry = -1;
                received = chunkStart = written = 0;
                lastHead = -1;
                if (track != null) {
                    try {
                        track.pause();
                        track.flush();
                        track.play();
                    } catch (Exception ignored) {
                    }
                    headAtFlush = track.getPlaybackHeadPosition();
                }
            }
        }

        void quit() {
            running = false;
            synchronized (this) {
                notifyAll();
            }
        }

        public void run() {
            if (track == null) return;
            try {
                track.play();
                synchronized (this) {
                    headAtFlush = track.getPlaybackHeadPosition();
                }
                while (running) {
                    byte[] b;
                    int gen;
                    synchronized (this) {
                        while (running && queue.isEmpty()) wait(200);
                        if (!running) break;
                        // from silence: wait for a little audio first, so a slow phone/network doesn't stutter
                        if (written <= playedFrames() && queuedFrames < PREBUFFER_FRAMES && !turnEnded
                                && System.currentTimeMillis() - firstQueuedAt < 600) {
                            wait(30);
                            continue;
                        }
                        b = queue.removeFirst();
                        queuedFrames -= b.length / 2;
                        gen = generation;
                    }
                    int off = 0;
                    while (off < b.length && running) {
                        int n = track.write(b, off, b.length - off); // blocks while the track buffer is full
                        if (n <= 0) break;
                        off += n;
                    }
                    synchronized (this) {
                        if (gen == generation) {
                            if (written <= lastHead) lastMove = System.currentTimeMillis(); // resumed after idle
                            written += off / 2;
                        }
                    }
                }
            } catch (Exception ignored) {
            } finally {
                try {
                    track.stop();
                } catch (Exception ignored) {
                }
                track.release();
            }
        }
    }
}
