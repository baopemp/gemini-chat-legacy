package com.gemini.chat;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.media.AudioRecord;
import android.media.AudioTrack;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import com.gemini.chat.AutoNamer;
import com.gemini.chat.LiveSession;
import java.util.ArrayList;
import java.util.LinkedList;

/* loaded from: classes.dex */
public class LiveActivity extends Activity {
    static final String DEFAULT_VOICE = "Kore";
    private static final long ECHO_TAIL_MS = 700;
    private static final int HISTORY_MAX_CHARS = 24000;
    private Button btnSend;
    private Button btnTalk;
    private long chatId;
    private boolean connected;
    private DatabaseHelper db;
    private boolean destroyed;
    private boolean ending;
    private boolean handsFree;
    private EditText input;
    private boolean liveText;
    private Mic mic;
    private volatile long micOpenAfter;
    private String model;
    private volatile boolean modelTurnActive;
    private boolean modelTurnDone;
    private TextView modelView;
    private boolean muted;
    private Player player;
    private int reconnects;
    private ScrollView scroll;
    private LiveSession session;
    private volatile int sessionGen;
    private TextView status;
    private boolean talking;
    private LiveSession tr;
    private LinearLayout turns;
    private String voice;
    static final String DEFAULT_LIVE_MODEL = "gemini-3.8-live";
    static final String[] LIVE_MODELS = {DEFAULT_LIVE_MODEL, "gemini-3.8-live-extended-thinking", "gemini-3.1-flash-live-preview"};
    static final String[] VOICES = {"Zephyr -- Bright", "Puck -- Upbeat", "Charon -- Informative", "Kore -- Firm", "Fenrir -- Excitable", "Leda -- Youthful", "Orus -- Firm", "Aoede -- Breezy", "Callirrhoe -- Easy-going", "Autonoe -- Bright", "Enceladus -- Breathy", "Iapetus -- Clear", "Umbriel -- Easy-going", "Algieba -- Smooth", "Despina -- Smooth", "Erinome -- Clear", "Algenib -- Gravelly", "Rasalgethi -- Informative", "Laomedeia -- Upbeat", "Achernar -- Soft", "Alnilam -- Firm", "Schedar -- Even", "Gacrux -- Mature", "Pulcherrima -- Forward", "Achird -- Friendly", "Zubenelgenubi -- Casual", "Vindemiatrix -- Gentle", "Sadachbia -- Lively", "Sadaltager -- Knowledgeable", "Sulafat -- Warm"};
    static final String[] THINKING = {"low", "medium", "high"};
    private final Handler ui = new Handler();
    private final StringBuffer heard = new StringBuffer();
    private final StringBuffer spokenFinal = new StringBuffer();
    private String spokenInterim = "";
    private String typedPrefix = "";
    private final StringBuffer modelShown = new StringBuffer();
    private final LinkedList<Object[]> pendingText = new LinkedList<>();
    private final Runnable tick = new Runnable() { // from class: com.gemini.chat.LiveActivity.5
        @Override // java.lang.Runnable
        public void run() {
            boolean z;
            long playedFrames = LiveActivity.this.player.playedFrames();
            synchronized (LiveActivity.this.pendingText) {
                z = false;
                while (!LiveActivity.this.pendingText.isEmpty() && ((Long) ((Object[]) LiveActivity.this.pendingText.getFirst())[0]).longValue() <= playedFrames) {
                    LiveActivity.this.modelShown.append((String) ((Object[]) LiveActivity.this.pendingText.removeFirst())[1]);
                    z = true;
                }
            }
            if (z) {
                LiveActivity.this.showModel();
            }
            boolean isPlaying = LiveActivity.this.player.isPlaying();
            if (LiveActivity.this.modelTurnDone && !isPlaying && LiveActivity.this.pendingIsEmpty()) {
                LiveActivity.this.finishModelTurn(false);
                LiveActivity.this.modelTurnActive = false;
                LiveActivity.this.micOpenAfter = System.currentTimeMillis() + LiveActivity.ECHO_TAIL_MS;
            }
            if (LiveActivity.this.connected) {
                if (LiveActivity.this.modelTurnActive || isPlaying) {
                    LiveActivity.this.setStatus(LiveActivity.this.muted ? "Model is answering..." : "Model is speaking...");
                } else {
                    LiveActivity.this.idleStatus();
                }
                LiveSession liveSession = LiveActivity.this.session;
                if (liveSession != null && liveSession.goAway && !LiveActivity.this.talking && !LiveActivity.this.modelTurnActive && !isPlaying) {
                    LiveActivity.this.resume();
                }
            }
            LiveActivity.this.ui.postDelayed(this, 80L);
        }
    };

    static /* synthetic */ int access$1808(LiveActivity liveActivity) {
        int i = liveActivity.reconnects;
        liveActivity.reconnects = i + 1;
        return i;
    }

    static String voiceName(String str) {
        int indexOf = str.indexOf(" -- ");
        return indexOf > 0 ? str.substring(0, indexOf) : str;
    }

    private int dp(float f) {
        return (int) ((getResources().getDisplayMetrics().density * f) + 0.5f);
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        MessageFormatter.applyPrefs(this);
        this.db = new DatabaseHelper(this);
        this.chatId = getIntent().getLongExtra("chat_id", -1L);
        SharedPreferences sharedPreferences = getSharedPreferences("GeminiPrefs", 0);
        this.model = sharedPreferences.getString("live_model", DEFAULT_LIVE_MODEL);
        this.voice = sharedPreferences.getString("live_voice", DEFAULT_VOICE);
        this.handsFree = sharedPreferences.getBoolean("live_hands_free", false);
        this.muted = sharedPreferences.getBoolean("live_muted", false);
        this.liveText = sharedPreferences.getBoolean("live_text", true);
        updateTitle();
        setVolumeControlStream(3);
        getWindow().addFlags(128);
        getWindow().setSoftInputMode(18);
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(1);
        this.status = new TextView(this);
        this.status.setTextSize(13.0f);
        this.status.setPadding(dp(10.0f), dp(4.0f), dp(10.0f), dp(4.0f));
        this.status.setTextColor(-6643546);
        linearLayout.addView(this.status, new LinearLayout.LayoutParams(-1, -2));
        this.scroll = new ScrollView(this);
        this.turns = new LinearLayout(this);
        this.turns.setOrientation(1);
        this.scroll.addView(this.turns, new FrameLayout.LayoutParams(-1, -2));
        linearLayout.addView(this.scroll, new LinearLayout.LayoutParams(-1, 0, 1.0f));
        LinearLayout linearLayout2 = new LinearLayout(this);
        linearLayout2.setOrientation(0);
        linearLayout2.setPadding(dp(2.0f), dp(2.0f), dp(2.0f), 0);
        this.input = new EditText(this);
        this.input.setHint("Type or talk...");
        this.input.setMaxLines(3);
        linearLayout2.addView(this.input, new LinearLayout.LayoutParams(0, -2, 1.0f));
        this.btnSend = new Button(this);
        this.btnSend.setText("Send");
        this.btnSend.setOnClickListener(new View.OnClickListener() { // from class: com.gemini.chat.LiveActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                LiveActivity.this.sendTyped();
            }
        });
        linearLayout2.addView(this.btnSend, new LinearLayout.LayoutParams(-2, -2));
        linearLayout.addView(linearLayout2, new LinearLayout.LayoutParams(-1, -2));
        LinearLayout linearLayout3 = new LinearLayout(this);
        linearLayout3.setOrientation(0);
        linearLayout3.setPadding(dp(2.0f), 0, dp(2.0f), dp(2.0f));
        this.btnTalk = new Button(this);
        this.btnTalk.setOnClickListener(new View.OnClickListener() { // from class: com.gemini.chat.LiveActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                LiveActivity.this.onTalk();
            }
        });
        linearLayout3.addView(this.btnTalk, new LinearLayout.LayoutParams(0, -2, 2.0f));
        Button button = new Button(this);
        button.setText("End");
        button.setOnClickListener(new View.OnClickListener() { // from class: com.gemini.chat.LiveActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                LiveActivity.this.finish();
            }
        });
        linearLayout3.addView(button, new LinearLayout.LayoutParams(0, -2, 1.0f));
        linearLayout.addView(linearLayout3, new LinearLayout.LayoutParams(-1, -2));
        setContentView(linearLayout);
        loadExisting();
        this.player = new Player(this.muted);
        this.player.start();
        connect(null);
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        if (this.talking) {
            stopTalking(true);
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        this.destroyed = true;
        this.ui.removeCallbacks(this.tick);
        stopTalking(false);
        this.sessionGen++;
        if (this.session != null) {
            this.session.stop();
        }
        if (this.tr != null) {
            this.tr.stop();
        }
        this.player.quit();
        finishModelTurn(true);
        finishUserTurn();
        this.db.close();
    }

    @Override // android.app.Activity
    public void finish() {
        this.ending = true;
        finishUserTurn();
        finishModelTurn(true);
        Intent intent = new Intent();
        intent.putExtra("chat_id", this.chatId);
        setResult(-1, intent);
        super.finish();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateTitle() {
        setTitle("Live: " + (this.chatId == -1 ? "New chat" : this.db.getChatTitle(this.chatId)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setStatus(String str) {
        if (!str.contentEquals(this.status.getText())) {
            this.status.setText(str);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateButtons() {
        boolean z = this.connected;
        this.btnSend.setEnabled(z);
        if (!z) {
            this.btnTalk.setText("Reconnect");
            this.btnTalk.setEnabled(this.session == null);
        } else if (this.handsFree) {
            this.btnTalk.setText(this.talking ? "Mic: on (tap to mute)" : "Mic: off (tap to talk)");
            this.btnTalk.setEnabled(true);
        } else {
            this.btnTalk.setText(this.talking ? "Send speech" : "Talk");
            this.btnTalk.setEnabled(true);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void idleStatus() {
        String str;
        if (this.connected) {
            if (this.talking) {
                str = this.handsFree ? "Listening (hands-free)..." : "Listening... tap \"Send speech\" when done";
            } else {
                str = this.handsFree ? "Tap the mic button and speak, or type" : "Tap Talk and speak, or type";
            }
            if (this.muted) {
                str = str + " (voice muted)";
            }
            setStatus(str);
        }
    }

    private TextView addTurnView(String str, String str2, String str3) {
        TextView textView = new TextView(this);
        textView.setText(MessageFormatter.format(this, str, str2, str3, System.currentTimeMillis(), null));
        MessageFormatter.styleView(textView, str);
        this.turns.addView(textView);
        scrollDown();
        return textView;
    }

    private void scrollDown() {
        this.scroll.post(new Runnable() { // from class: com.gemini.chat.LiveActivity.4
            @Override // java.lang.Runnable
            public void run() {
                LiveActivity.this.scroll.scrollTo(0, LiveActivity.this.turns.getMeasuredHeight());
            }
        });
    }

    private void loadExisting() {
        Cursor messages;
        if (this.chatId != -1 && (messages = this.db.getMessages(this.chatId)) != null) {
            try {
                int columnIndex = messages.getColumnIndex("role");
                int columnIndex2 = messages.getColumnIndex("content");
                int columnIndex3 = messages.getColumnIndex("model");
                int columnIndex4 = messages.getColumnIndex("timestamp");
                while (messages.moveToNext()) {
                    String string = messages.getString(columnIndex);
                    if ("user".equals(string) || "model".equals(string)) {
                        TextView textView = new TextView(this);
                        textView.setText(MessageFormatter.format(this, string, messages.getString(columnIndex3), messages.getString(columnIndex2), messages.getLong(columnIndex4), null));
                        MessageFormatter.styleView(textView, string);
                        this.turns.addView(textView);
                    }
                }
                messages.close();
                scrollDown();
            } catch (Throwable th) {
                messages.close();
                throw th;
            }
        }
    }

    private String[][] history() {
        if (this.chatId == -1) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        Cursor messages = this.db.getMessages(this.chatId);
        if (messages == null) {
            return null;
        }
        try {
            int columnIndex = messages.getColumnIndex("role");
            int columnIndex2 = messages.getColumnIndex("content");
            while (messages.moveToNext()) {
                String string = messages.getString(columnIndex);
                String string2 = messages.getString(columnIndex2);
                if ("user".equals(string) || "model".equals(string)) {
                    if (string2 != null && string2.trim().length() > 0) {
                        arrayList.add(new String[]{string, string2});
                    }
                }
            }
            messages.close();
            int size = arrayList.size();
            int i = 0;
            while (size > 0 && ((String[]) arrayList.get(size - 1))[1].length() + i <= 24000) {
                int length = ((String[]) arrayList.get(size - 1))[1].length() + i;
                size--;
                i = length;
            }
            if (size >= arrayList.size()) {
                return null;
            }
            String[][] strArr = new String[arrayList.size() - size][];
            for (int i2 = size; i2 < arrayList.size(); i2++) {
                strArr[i2 - size] = (String[]) arrayList.get(i2);
            }
            return strArr;
        } catch (Throwable th) {
            messages.close();
            throw th;
        }
    }

    private String apiKey() {
        return getSharedPreferences("GeminiPrefs", 0).getString("api_key", "").trim();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void connect(String str) {
        SharedPreferences sharedPreferences = getSharedPreferences("GeminiPrefs", 0);
        String apiKey = apiKey();
        if (apiKey.length() == 0) {
            Toast.makeText(this, "Please go to Settings to set API Key", 1).show();
            setStatus("No API key");
            updateButtons();
            return;
        }
        String apply = TimeGrounding.apply(this, sharedPreferences.getString("system_instruction", "").trim());
        int i = this.sessionGen + 1;
        this.sessionGen = i;
        this.session = new LiveSession(apiKey, this.model, this.voice, apply, this.handsFree, new Main(i));
        if (LiveSession.needsThinkingLevel(this.model)) {
            this.session.thinkingLevel = sharedPreferences.getString("live_thinking", "low");
        }
        if (str != null) {
            this.session.resumeHandle = str;
        } else {
            this.session.history = history();
        }
        setStatus(str != null ? "Reconnecting..." : "Connecting to " + this.model + " (" + this.voice + ")...");
        updateButtons();
        this.session.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void resume() {
        LiveSession liveSession = this.session;
        String str = liveSession != null ? liveSession.lastHandle : null;
        if (str != null) {
            this.sessionGen++;
            if (this.talking) {
                stopTalking(false);
            }
            this.connected = false;
            liveSession.stop();
            this.reconnects++;
            connect(str);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openTranscriber() {
        if (this.liveText && this.tr == null && !this.destroyed) {
            Transcriber transcriber = new Transcriber();
            this.tr = LiveSession.transcriber(apiKey(), true, transcriber);
            transcriber.self = this.tr;
            this.tr.start();
        }
    }

    private final class Main implements LiveSession.Listener {
        final int gen;

        Main(int i) {
            this.gen = i;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public boolean current() {
            return this.gen == LiveActivity.this.sessionGen && !LiveActivity.this.destroyed;
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onReady() {
            LiveActivity.this.ui.post(new Runnable() { // from class: com.gemini.chat.LiveActivity.Main.1
                @Override // java.lang.Runnable
                public void run() {
                    if (Main.this.current()) {
                        LiveActivity.this.connected = true;
                        LiveActivity.this.updateButtons();
                        LiveActivity.this.idleStatus();
                        LiveActivity.this.ui.removeCallbacks(LiveActivity.this.tick);
                        LiveActivity.this.ui.post(LiveActivity.this.tick);
                        LiveActivity.this.openTranscriber();
                    }
                }
            });
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onClosed(final String str) {
            LiveActivity.this.ui.post(new Runnable() { // from class: com.gemini.chat.LiveActivity.Main.2
                @Override // java.lang.Runnable
                public void run() {
                    boolean z = false;
                    if (Main.this.current()) {
                        LiveSession liveSession = LiveActivity.this.session;
                        LiveActivity.this.connected = false;
                        if (LiveActivity.this.talking) {
                            LiveActivity.this.stopTalking(false);
                        }
                        String str2 = liveSession != null ? liveSession.lastHandle : null;
                        if (str != null && (str.indexOf("(1007)") >= 0 || str.indexOf("(1008)") >= 0)) {
                            z = true;
                        }
                        if (LiveActivity.this.ending || str2 == null || z || LiveActivity.this.reconnects >= 3) {
                            LiveActivity.this.session = null;
                            LiveActivity.this.finishModelTurn(true);
                            LiveActivity.this.finishUserTurn();
                            LiveActivity.this.setStatus(str == null ? "Disconnected." : "Disconnected: " + str);
                            LiveActivity.this.updateButtons();
                            return;
                        }
                        LiveActivity.this.finishModelTurn(true);
                        LiveActivity.access$1808(LiveActivity.this);
                        LiveActivity.this.connect(str2);
                    }
                }
            });
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onAudio(byte[] bArr) {
            if (this.gen == LiveActivity.this.sessionGen) {
                LiveActivity.this.modelTurnActive = true;
                LiveActivity.this.player.enqueue(bArr);
            }
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onInputText(final String str) {
            LiveActivity.this.ui.post(new Runnable() { // from class: com.gemini.chat.LiveActivity.Main.3
                @Override // java.lang.Runnable
                public void run() {
                    if (Main.this.current()) {
                        LiveActivity.this.heard.append(str);
                        LiveActivity.this.updateBox();
                    }
                }
            });
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onInterimInput(String str) {
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onOutputText(final String str) {
            final long lastChunkStart = LiveActivity.this.player.lastChunkStart();
            LiveActivity.this.modelTurnActive = true;
            LiveActivity.this.ui.post(new Runnable() { // from class: com.gemini.chat.LiveActivity.Main.4
                @Override // java.lang.Runnable
                public void run() {
                    if (Main.this.current()) {
                        LiveActivity.this.finishUserTurn();
                        LiveActivity.this.modelTurnDone = false;
                        synchronized (LiveActivity.this.pendingText) {
                            LiveActivity.this.pendingText.add(new Object[]{Long.valueOf(lastChunkStart), str});
                        }
                    }
                }
            });
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onTurnComplete() {
            LiveActivity.this.ui.post(new Runnable() { // from class: com.gemini.chat.LiveActivity.Main.5
                @Override // java.lang.Runnable
                public void run() {
                    if (Main.this.current()) {
                        LiveActivity.this.finishUserTurn();
                        LiveActivity.this.modelTurnDone = true;
                        LiveActivity.this.player.endOfTurn();
                        LiveActivity.this.reconnects = 0;
                    }
                }
            });
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onInterrupted() {
            if (this.gen == LiveActivity.this.sessionGen) {
                LiveActivity.this.player.flush();
                LiveActivity.this.ui.post(new Runnable() { // from class: com.gemini.chat.LiveActivity.Main.6
                    @Override // java.lang.Runnable
                    public void run() {
                        if (Main.this.current()) {
                            LiveActivity.this.finishModelTurn(true);
                            LiveActivity.this.modelTurnActive = false;
                        }
                    }
                });
            }
        }
    }

    private final class Transcriber implements LiveSession.Listener {
        LiveSession self;

        private Transcriber() {
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onReady() {
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onAudio(byte[] bArr) {
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onInterimInput(final String str) {
            LiveActivity.this.ui.post(new Runnable() { // from class: com.gemini.chat.LiveActivity.Transcriber.1
                @Override // java.lang.Runnable
                public void run() {
                    if (!LiveActivity.this.destroyed) {
                        LiveActivity.this.spokenInterim = str;
                        LiveActivity.this.updateBox();
                    }
                }
            });
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onInputText(final String str) {
            LiveActivity.this.ui.post(new Runnable() { // from class: com.gemini.chat.LiveActivity.Transcriber.2
                @Override // java.lang.Runnable
                public void run() {
                    if (!LiveActivity.this.destroyed) {
                        LiveActivity.this.spokenFinal.append(str.trim()).append(' ');
                        LiveActivity.this.spokenInterim = "";
                        LiveActivity.this.updateBox();
                    }
                }
            });
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onOutputText(String str) {
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onTurnComplete() {
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onInterrupted() {
        }

        @Override // com.gemini.chat.LiveSession.Listener
        public void onClosed(String str) {
            LiveActivity.this.ui.post(new Runnable() { // from class: com.gemini.chat.LiveActivity.Transcriber.3
                @Override // java.lang.Runnable
                public void run() {
                    if (LiveActivity.this.tr == Transcriber.this.self) {
                        LiveActivity.this.tr = null;
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateBox() {
        if (this.liveText) {
            String trim = (this.spokenFinal.toString() + this.spokenInterim).trim();
            if (trim.length() == 0) {
                trim = this.heard.toString().trim();
            }
            String str = (this.typedPrefix.length() <= 0 || trim.length() <= 0) ? this.typedPrefix + trim : this.typedPrefix + " " + trim;
            if (!str.contentEquals(this.input.getText())) {
                this.input.setText(str);
                this.input.setSelection(str.length());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean pendingIsEmpty() {
        boolean isEmpty;
        synchronized (this.pendingText) {
            isEmpty = this.pendingText.isEmpty();
        }
        return isEmpty;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showModel() {
        String trim = this.modelShown.toString().trim();
        if (trim.length() != 0) {
            if (this.modelView == null) {
                this.modelView = addTurnView("model", this.model, trim);
            } else {
                this.modelView.setText(MessageFormatter.format(this, "model", this.model, trim, System.currentTimeMillis(), null));
            }
            scrollDown();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void finishModelTurn(boolean z) {
        if (z) {
            synchronized (this.pendingText) {
                while (!this.pendingText.isEmpty()) {
                    this.modelShown.append((String) this.pendingText.removeFirst()[1]);
                }
            }
            showModel();
        }
        String trim = this.modelShown.toString().trim();
        if (trim.length() > 0) {
            save("model", trim);
            if (!this.destroyed) {
                AutoNamer.maybeStart(this, this.db, this.chatId, new AutoNamer.Callback() { // from class: com.gemini.chat.LiveActivity.6
                    @Override // com.gemini.chat.AutoNamer.Callback
                    public void onNamed(long j, String str) {
                        if (!LiveActivity.this.destroyed && j == LiveActivity.this.chatId) {
                            LiveActivity.this.updateTitle();
                        }
                    }
                });
            }
        }
        this.modelShown.setLength(0);
        this.modelView = null;
        this.modelTurnDone = false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void finishUserTurn() {
        String trim = this.heard.toString().trim();
        if (trim.length() == 0) {
            trim = (this.spokenFinal.toString() + this.spokenInterim).trim();
        }
        boolean z = trim.length() > 0;
        if (z) {
            addTurnView("user", null, trim);
            save("user", trim);
        }
        this.heard.setLength(0);
        this.spokenFinal.setLength(0);
        this.spokenInterim = "";
        if (z && this.liveText) {
            this.input.setText(this.typedPrefix);
            this.input.setSelection(this.input.getText().length());
        }
        this.typedPrefix = "";
    }

    private void save(String str, String str2) {
        if (this.chatId == -1) {
            String trim = str2.replace('\n', ' ').trim();
            if (trim.length() > 25) {
                trim = trim.substring(0, 25) + "...";
            }
            this.chatId = this.db.createChat(trim);
            updateTitle();
        }
        this.db.addMessage(this.chatId, str, str2, "model".equals(str) ? this.model : null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendTyped() {
        String trim = this.input.getText().toString().trim();
        if (trim.length() != 0 && this.session != null && this.connected) {
            InputMethodManager inputMethodManager = (InputMethodManager) getSystemService("input_method");
            if (inputMethodManager != null) {
                inputMethodManager.hideSoftInputFromWindow(this.input.getWindowToken(), 0);
            }
            if (this.talking) {
                stopTalking(false);
            }
            this.heard.setLength(0);
            this.spokenFinal.setLength(0);
            this.spokenInterim = "";
            this.typedPrefix = "";
            bargeIn();
            addTurnView("user", null, trim);
            save("user", trim);
            this.input.setText("");
            this.session.sendText(trim);
        }
    }

    private void bargeIn() {
        if (this.modelTurnActive || this.player.isPlaying() || !pendingIsEmpty()) {
            this.player.flush();
            finishModelTurn(true);
            this.modelTurnActive = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onTalk() {
        if (this.session == null) {
            this.reconnects = 0;
            connect(null);
            return;
        }
        if (this.connected) {
            if (this.talking) {
                stopTalking(true);
                return;
            }
            this.mic = new Mic();
            if (!this.mic.ok) {
                Toast.makeText(this, "Microphone not available.", 1).show();
                this.mic = null;
                return;
            }
            bargeIn();
            this.micOpenAfter = 0L;
            openTranscriber();
            this.typedPrefix = this.input.getText().toString().trim();
            if (!this.handsFree) {
                this.session.activityStart();
            }
            this.talking = true;
            this.mic.start();
            updateButtons();
            idleStatus();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void stopTalking(boolean z) {
        if (this.mic != null) {
            this.mic.quit();
            this.mic = null;
        }
        if (this.talking && z && this.session != null) {
            if (this.handsFree) {
                this.session.audioStreamEnd();
            } else {
                this.session.activityEnd();
            }
        }
        if (this.talking && this.tr != null) {
            this.tr.audioStreamEnd();
        }
        this.talking = false;
        updateButtons();
        idleStatus();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean micMuted() {
        return this.handsFree && (this.modelTurnActive || System.currentTimeMillis() < this.micOpenAfter || this.player.isPlaying());
    }

    private final class Mic extends Thread {
        private static final int RATE_16K = 16000;
        boolean ok;
        int rate;
        AudioRecord rec;
        private volatile boolean running = true;

        Mic() {
            int[] iArr = {RATE_16K, 8000, 11025, 22050, 44100};
            for (int i = 0; i < iArr.length && this.rec == null; i++) {
                try {
                    int minBufferSize = AudioRecord.getMinBufferSize(iArr[i], 2, 2);
                    if (minBufferSize > 0) {
                        AudioRecord audioRecord = new AudioRecord(1, iArr[i], 2, 2, Math.max(minBufferSize, (iArr[i] * 2) / 2));
                        if (audioRecord.getState() == 1) {
                            this.rec = audioRecord;
                            this.rate = iArr[i];
                        } else {
                            audioRecord.release();
                        }
                    }
                } catch (Exception e) {
                }
            }
            this.ok = this.rec != null;
        }

        void quit() {
            this.running = false;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            byte[] bArr = new byte[(this.rate / 10) * 2];
            try {
                this.rec.startRecording();
                while (this.running) {
                    int read = this.rec.read(bArr, 0, bArr.length);
                    if (read > 0 && !LiveActivity.this.micMuted()) {
                        LiveSession liveSession = LiveActivity.this.session;
                        LiveSession liveSession2 = LiveActivity.this.tr;
                        if (liveSession != null) {
                            liveSession.sendAudio(bArr, 0, read, this.rate);
                        }
                        if (liveSession2 != null) {
                            liveSession2.sendAudio(bArr, 0, read, this.rate);
                        }
                    }
                }
                try {
                    this.rec.stop();
                } catch (Exception e) {
                }
                this.rec.release();
            } catch (Exception e2) {
                try {
                    this.rec.stop();
                } catch (Exception e3) {
                }
                this.rec.release();
            } catch (Throwable th) {
                try {
                    this.rec.stop();
                } catch (Exception e4) {
                }
                this.rec.release();
                throw th;
            }
        }
    }

    private final class Player extends Thread {
        private static final int PREBUFFER_FRAMES = 7200;
        private long chunkStart;
        private long firstQueuedAt;
        private int generation;
        private int headAtFlush;
        private long lastMove;
        private long queuedFrames;
        private long received;
        private AudioTrack track;
        private boolean turnEnded;
        private long written;
        private final LinkedList<byte[]> queue = new LinkedList<>();
        private volatile boolean running = true;
        private int carry = -1;
        private long lastHead = -1;

        Player(boolean z) {
            if (!z) {
                try {
                    int minBufferSize = AudioTrack.getMinBufferSize(24000, 2, 2);
                    if (minBufferSize > 0) {
                        AudioTrack audioTrack = new AudioTrack(3, 24000, 2, 2, Math.max(minBufferSize, 24000), 1);
                        if (audioTrack.getState() == 1) {
                            this.track = audioTrack;
                        } else {
                            audioTrack.release();
                        }
                    }
                } catch (Exception e) {
                }
            }
        }

        synchronized long lastChunkStart() {
            return this.chunkStart;
        }

        void enqueue(byte[] bArr) {
            int i = 1;
            synchronized (this) {
                int length = (this.carry >= 0 ? 1 : 0) + bArr.length;
                byte[] bArr2 = new byte[length & (-2)];
                if (this.carry < 0 || bArr2.length <= 0) {
                    i = 0;
                } else {
                    bArr2[0] = (byte) this.carry;
                }
                System.arraycopy(bArr, 0, bArr2, i, bArr2.length - i);
                this.carry = (length & 1) != 0 ? bArr[bArr.length - 1] & 255 : -1;
                if (bArr2.length != 0) {
                    this.chunkStart = this.received;
                    this.received += bArr2.length / 2;
                    if (this.track == null) {
                        this.written = this.received;
                        return;
                    }
                    if (this.queue.isEmpty() && this.written <= playedFrames()) {
                        this.firstQueuedAt = System.currentTimeMillis();
                        this.turnEnded = false;
                    }
                    this.queue.add(bArr2);
                    this.queuedFrames += bArr2.length / 2;
                    notifyAll();
                }
            }
        }

        long playedFrames() {
            if (this.track == null) {
                return Long.MAX_VALUE;
            }
            synchronized (this) {
                long playbackHeadPosition = (r0.getPlaybackHeadPosition() & 4294967295L) - (this.headAtFlush & 4294967295L);
                long currentTimeMillis = System.currentTimeMillis();
                if (playbackHeadPosition != this.lastHead) {
                    this.lastHead = playbackHeadPosition;
                    this.lastMove = currentTimeMillis;
                } else if (playbackHeadPosition < this.written && currentTimeMillis - this.lastMove > 1500) {
                    return this.written;
                }
                return Math.min(playbackHeadPosition, this.written);
            }
        }

        boolean isPlaying() {
            if (this.track != null) {
                synchronized (this) {
                    r0 = !this.queue.isEmpty() || playedFrames() < this.written;
                }
            }
            return r0;
        }

        void endOfTurn() {
            synchronized (this) {
                this.turnEnded = true;
                notifyAll();
            }
        }

        void flush() {
            synchronized (this) {
                this.queue.clear();
                this.queuedFrames = 0L;
                this.generation++;
                this.carry = -1;
                this.written = 0L;
                this.chunkStart = 0L;
                this.received = 0L;
                this.lastHead = -1L;
                if (this.track != null) {
                    try {
                        this.track.pause();
                        this.track.flush();
                        this.track.play();
                    } catch (Exception e) {
                    }
                    this.headAtFlush = this.track.getPlaybackHeadPosition();
                }
            }
        }

        void quit() {
            this.running = false;
            synchronized (this) {
                notifyAll();
            }
        }

        /* JADX WARN: Code restructure failed: missing block: B:34:0x0097, code lost:
        
            r1 = 0;
         */
        /* JADX WARN: Code restructure failed: missing block: B:36:0x0099, code lost:
        
            if (r1 >= r0.length) goto L99;
         */
        /* JADX WARN: Code restructure failed: missing block: B:38:0x009d, code lost:
        
            if (r6.running == false) goto L100;
         */
        /* JADX WARN: Code restructure failed: missing block: B:39:0x009f, code lost:
        
            r3 = r6.track.write(r0, r1, r0.length - r1);
         */
        /* JADX WARN: Code restructure failed: missing block: B:40:0x00a7, code lost:
        
            if (r3 > 0) goto L67;
         */
        /* JADX WARN: Code restructure failed: missing block: B:41:0x00ca, code lost:
        
            r1 = r1 + r3;
         */
        /* JADX WARN: Code restructure failed: missing block: B:43:0x00a9, code lost:
        
            monitor-enter(r6);
         */
        /* JADX WARN: Code restructure failed: missing block: B:46:0x00ac, code lost:
        
            if (r2 != r6.generation) goto L62;
         */
        /* JADX WARN: Code restructure failed: missing block: B:48:0x00b4, code lost:
        
            if (r6.written > r6.lastHead) goto L61;
         */
        /* JADX WARN: Code restructure failed: missing block: B:49:0x00b6, code lost:
        
            r6.lastMove = java.lang.System.currentTimeMillis();
         */
        /* JADX WARN: Code restructure failed: missing block: B:50:0x00bc, code lost:
        
            r6.written = (r1 / 2) + r6.written;
         */
        /* JADX WARN: Code restructure failed: missing block: B:51:0x00c4, code lost:
        
            monitor-exit(r6);
         */
        @Override // java.lang.Thread, java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void run() {
            /*
                Method dump skipped, instructions count: 212
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.gemini.chat.LiveActivity.Player.run():void");
        }
    }
}
