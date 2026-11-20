package com.gemini.chat;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Environment;
import android.text.ClipboardManager;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

/**
 * The chat screen. One full-width TextView per message inside a ScrollView (no bubbles).
 * Long-press a message for its actions (copy, edit, regenerate, delete, share, retry).
 * Since 0.8.6 this class is Java (compiled to smali by scripts/build_java.sh).
 */
public class ChatActivity extends Activity {
    static final String PREFS = "GeminiPrefs";
    /** Default model when none is saved (free-tier keys often get 503 on the larger models). */
    static final String DEFAULT_MODEL = "gemini-3.5-flash-lite";
    static final String API = "https://generativelanguage.googleapis.com/v1beta/models/";

    private static final int MENU_SETTINGS = 1, MENU_DELETE_CHAT = 2, MENU_ATTACH = 3, MENU_DETACH = 4, MENU_LIVE = 5,
            MENU_STOP_READING = 6;
    private static final int REQ_IMAGE = 100, REQ_LIVE = 101;
    private static final String HINT_IDLE = "Message Gemini...";

    // long-press actions
    private static final int A_COPY = 0, A_COPY_CODE = 1, A_SHARE = 2, A_EDIT = 3, A_REGEN = 4, A_DELETE = 5, A_RETRY = 6,
            A_THOUGHTS = 7, A_READ = 8, A_STOP_READ = 9;

    /** "Read Aloud" playback in progress (null when idle). */
    private ReadAloud reader;
    private final Handler handler = new Handler();

    private Button btnSend;
    private Button btnStop;
    private long chatId = -1;
    private GeminiTask currentTask = null;
    private DatabaseHelper dbHelper;
    private EditText etInput;
    private LinearLayout layoutChat;
    private ScrollView scrollChat;

    /** Attached image as a data: URI (converted on a background thread when picked), or null. */
    private String pendingImage;
    private AttachImageTask attachTask;
    private LinearLayout attachBar;
    private ImageView attachThumb;
    private TextView attachLabel;

    /** Inline status bar shown while Read Aloud TTS is active. */
    private LinearLayout readBar;
    private TextView readLabel;
    private TextView placeholderConfig;

    private final Runnable scrollDownRunnable = new Runnable() {
        public void run() {
            if (scrollChat != null && layoutChat != null) scrollChat.scrollTo(0, layoutChat.getMeasuredHeight());
        }
    };

    // =========================================================================================
    // Request
    // =========================================================================================

    // ---- pure helpers (static; unit-tested on the JVM) ----

    static String readAll(InputStream in) throws IOException {
        if (in == null) return "";
        BufferedReader r = new BufferedReader(new InputStreamReader(in, "UTF-8"));
        try {
            StringBuffer sb = new StringBuffer();
            char[] buf = new char[2048];
            int n;
            while ((n = r.read(buf)) != -1) sb.append(buf, 0, n);
            return sb.toString();
        } finally {
            r.close();
        }
    }

    static JSONObject toInlineData(String dataUri) throws JSONException {
        int semi = dataUri.indexOf(';');
        int comma = dataUri.indexOf(',');
        if (semi <= 5 || comma <= semi) return null;
        JSONObject d = new JSONObject();
        d.put("mimeType", dataUri.substring(5, semi));
        d.put("data", dataUri.substring(comma + 1));
        JSONObject o = new JSONObject();
        o.put("inlineData", d);
        return o;
    }

    static boolean retryable(int code) {
        return code == 500 || code == 502 || code == 503 || code == 504;
    }

    /**
     * Caps automatic retries so 503 high-demand spikes (e.g. gemini-4-hydrogen on the free tier)
     * do not hammer free-tier RPM into a 429 rate-limit ban. 429 is never retried.
     */
    static int maxRetriesFor(int code, String errorBody) {
        if (!retryable(code)) return 0;
        if (code == 503 && errorBody != null) {
            String lo = errorBody.toLowerCase();
            if (lo.indexOf("high demand") >= 0 || lo.indexOf("overloaded") >= 0 || lo.indexOf("unavailable") >= 0) {
                return 1;
            }
        }
        return 2;
    }

    /** Parses an integer Retry-After header (seconds) into clamped ms [2 s, 20 s], or -1 if absent/invalid. */
    static long parseRetryAfterMs(String header) {
        if (header == null) return -1L;
        String t = header.trim();
        if (t.length() == 0) return -1L;
        try {
            long sec = Long.parseLong(t);
            if (sec <= 0) return -1L;
            return Math.max(2000L, Math.min(20000L, sec * 1000L));
        } catch (NumberFormatException e) {
            return -1L;
        }
    }

    /** Respectful backoff with jitter; honors Retry-After and waits longer on 503 overload spikes. */
    static long retryDelayMs(int attempt, int code, String retryAfter, long jitterSeed) {
        long hdr = parseRetryAfterMs(retryAfter);
        if (hdr > 0) return hdr;
        int a = Math.max(1, attempt);
        long base = (code == 503 ? 4500L : 2000L) << Math.min(a - 1, 3);
        long jitterMax = code == 503 ? 1000L : 500L;
        long jitter = Math.abs(jitterSeed == Long.MIN_VALUE ? 0L : jitterSeed) % (jitterMax + 1L);
        return Math.min(20000L, base + jitter);
    }

    /** Adds concise user guidance on final 429/503 errors without losing the original status line. */
    static String friendlyError(int code, String msg) {
        if (msg == null) msg = "Error " + code;
        String lo = msg.toLowerCase();
        if (code == 429 && lo.indexOf("settings") < 0) {
            return msg + "\nTip: Rate limit reached. Wait a minute before retrying, or switch models in Settings.";
        }
        if (code == 503 && lo.indexOf("settings") < 0) {
            return msg + "\nTip: Model is busy right now. Wait a few seconds before retrying, or switch models in Settings.";
        }
        return msg;
    }

    /** Adaptive streaming UI refresh interval so long replies stay smooth on weak single-core CPUs. */
    static long streamIntervalMs(int charCount) {
        if (charCount < 800) return 250L;
        if (charCount < 2500) return 400L;
        if (charCount < 6000) return 600L;
        return 850L;
    }

    private class GeminiTask extends AsyncTask<String, Object, String> {
        private long currentChatId;
        private String usedModel = "";
        private HttpURLConnection conn = null;
        private boolean failed = false;
        private int lastCode = 0;
        private String lastRetryAfter = null;
        /** thinkingConfig: level (null = model default) and whether thought summaries are requested. */
        private String thinkingLevel;
        private boolean includeThoughts;
        /** Thought summary of the finished reply ("" if none). */
        private String thoughts = "";
        private long lastProgress;
        private final Object partialLock = new Object();
        private ReplyParser activeParser;

        GeminiTask(long chatId, String model) {
            this.currentChatId = chatId;
            this.usedModel = model != null ? model : "";
        }

        private String fail(String msg) {
            this.failed = true;
            return msg;
        }

        /** Builds the request from the chat's saved history (system rows skipped, same-role rows merged). */
        private String buildBody(String systemText) throws Exception {
            JSONObject root = new JSONObject();
            if (systemText != null && systemText.trim().length() != 0) {
                JSONObject t = new JSONObject();
                t.put("text", systemText);
                JSONArray parts = new JSONArray();
                parts.put(t);
                JSONObject si = new JSONObject();
                si.put("parts", parts);
                root.put("systemInstruction", si);
            }
            ArrayList<String> roles = new ArrayList<String>();
            ArrayList<StringBuffer> texts = new ArrayList<StringBuffer>();
            ArrayList<ArrayList<JSONObject>> images = new ArrayList<ArrayList<JSONObject>>();
            Cursor c = ChatActivity.this.dbHelper.getMessages(currentChatId);
            if (c != null) {
                try {
                    int iRole = c.getColumnIndex("role");
                    int iContent = c.getColumnIndex("content");
                    int iModel = c.getColumnIndex("model");
                    while (c.moveToNext()) {
                        String role = c.getString(iRole);
                        boolean user = "user".equals(role);
                        if (!user && !"model".equals(role)) continue;
                        String text = c.getString(iContent);
                        if (text == null) text = "";
                        JSONObject image = null;
                        if (user && iModel >= 0) {
                            String m = c.getString(iModel);
                            if (m != null && m.startsWith("data:image/")) image = toInlineData(m);
                        }
                        int last = roles.size() - 1;
                        if (last < 0 || !role.equals(roles.get(last))) {
                            roles.add(role);
                            texts.add(new StringBuffer());
                            images.add(new ArrayList<JSONObject>());
                            last++;
                        }
                        StringBuffer sb = texts.get(last);
                        if (text.length() > 0) {
                            if (sb.length() > 0) sb.append("\n\n");
                            sb.append(text);
                        }
                        if (image != null) images.get(last).add(image);
                    }
                } finally {
                    c.close();
                }
            }
            JSONArray contents = new JSONArray();
            for (int i = 0; i < roles.size(); i++) {
                JSONArray parts = new JSONArray();
                ArrayList<JSONObject> imgs = images.get(i);
                // a text part unless the turn is image-only (Gemini rejects empty text parts next to images)
                if (texts.get(i).length() > 0 || imgs.isEmpty()) {
                    JSONObject t = new JSONObject();
                    t.put("text", texts.get(i).toString());
                    parts.put(t);
                }
                for (int k = 0; k < imgs.size(); k++) parts.put(imgs.get(k));
                JSONObject turn = new JSONObject();
                turn.put("role", roles.get(i));
                turn.put("parts", parts);
                contents.put(turn);
            }
            root.put("contents", contents);
            if (thinkingLevel != null || includeThoughts) {
                JSONObject tc = new JSONObject();
                if (thinkingLevel != null) tc.put("thinkingLevel", thinkingLevel);
                if (includeThoughts) tc.put("includeThoughts", true);
                root.put("generationConfig", new JSONObject().put("thinkingConfig", tc));
            }
            return root.toString();
        }

        private String parseError(int code, String body) {
            String msg = body;
            try {
                JSONObject err = new JSONObject(body).optJSONObject("error");
                if (err != null) {
                    String m = err.optString("message", "");
                    if (m.length() != 0) msg = m;
                }
            } catch (Exception ignored) {
            }
            return fail("Error " + code + ": " + msg);
        }

        /** A complete (non-streamed) generateContent response. */
        private String parseResponse(String body) throws JSONException {
            ReplyParser r = new ReplyParser();
            r.feed(new JSONObject(body));
            return finish(r);
        }

        private String finish(ReplyParser r) {
            String err = r.error();
            if (err != null) return fail(err);
            thoughts = includeThoughts ? r.thoughtsForDisplay() : "";
            return r.answer();
        }

        void disconnect() {
            HttpURLConnection c = conn;
            if (c != null) {
                try {
                    c.disconnect();
                } catch (Exception ignored) {
                }
            }
        }

        /** Closing a TLS socket can write to the network: never call synchronously on the UI thread. */
        void disconnectAsync() {
            final HttpURLConnection c = conn;
            if (c == null) return;
            Thread t = new Thread(new Runnable() {
                public void run() {
                    try {
                        c.disconnect();
                    } catch (Exception ignored) {
                    }
                }
            });
            t.setDaemon(true);
            t.start();
        }

        /** Snapshot of {answerText, thoughts} streamed so far, read only when Stop is tapped. */
        String[] snapshotPartial() {
            synchronized (partialLock) {
                if (activeParser == null) return new String[]{"", ""};
                return new String[]{activeParser.text.toString(), activeParser.thoughts.toString()};
            }
        }

        /** params: apiKey, model, user system instruction, thinking level ("" = default), "1" = show thoughts */
        @Override
        protected String doInBackground(String... p) {
            String key = p[0].trim();
            String model = p[1];
            usedModel = model;
            thinkingLevel = ReplyParser.levelFor(model, p.length > 3 ? p[3] : null);
            includeThoughts = p.length > 4 && "1".equals(p[4]);
            String body;
            try {
                body = buildBody(TimeGrounding.apply(ChatActivity.this, p.length > 2 ? p[2] : ""));
            } catch (Exception e) {
                Log.e("Gemini", "buildBody failed", e);
                return fail("Exception: " + e.toString());
            }
            String result = null;
            int maxRetries = 2;
            for (int attempt = 0; ; attempt++) {
                if (isCancelled()) return null;
                if (attempt > 0) {
                    synchronized (partialLock) {
                        activeParser = null;
                    }
                    long waitMs = retryDelayMs(attempt, lastCode, lastRetryAfter, System.nanoTime());
                    int waitSec = (int) ((waitMs + 500L) / 1000L);
                    publishProgress((Object) new int[]{attempt, maxRetries, lastCode, waitSec});
                    try {
                        Thread.sleep(waitMs);
                    } catch (InterruptedException e) {
                        return null;
                    }
                    if (isCancelled()) return null;
                    failed = false;
                    publishProgress((Object) new String[]{"", ""}); // restore Thinking indicator on retry
                }
                result = request(key, model, body);
                if (failed && lastCode == 400 && thinkingLevel != null && result != null
                        && result.toLowerCase().indexOf("thinking") >= 0) {
                    // e.g. a "latest" alias or custom model without this level: once more with the model's default
                    thinkingLevel = null;
                    failed = false;
                    try {
                        body = buildBody(TimeGrounding.apply(ChatActivity.this, p.length > 2 ? p[2] : ""));
                    } catch (Exception e) {
                        return fail("Exception: " + e.toString());
                    }
                    result = request(key, model, body);
                }
                if (failed) maxRetries = Math.min(maxRetries, maxRetriesFor(lastCode, result));
                if (!(failed && retryable(lastCode) && attempt < maxRetries)) break;
            }
            if (failed && result != null) result = friendlyError(lastCode, result);
            return result;
        }

        /** streamGenerateContent (SSE): thought summaries and the answer are shown while they arrive. */
        private String request(String key, String model, String body) {
            lastCode = 0;
            lastRetryAfter = null;
            BufferedReader in = null;
            try {
                HttpURLConnection c = (HttpURLConnection) new URL(API + model + ":streamGenerateContent?alt=sse").openConnection();
                conn = c;
                c.setConnectTimeout(20000);
                c.setReadTimeout(180000);
                c.setRequestMethod("POST");
                c.setRequestProperty("Content-Type", "application/json; charset=utf-8");
                c.setRequestProperty("x-goog-api-key", key);
                c.setDoOutput(true);
                byte[] bytes = body.getBytes("UTF-8");
                c.setFixedLengthStreamingMode(bytes.length);
                OutputStream os = c.getOutputStream();
                try {
                    os.write(bytes);
                } finally {
                    os.close();
                }
                int code = c.getResponseCode();
                lastCode = code;
                if (isCancelled()) return null;
                if (code < 200 || code >= 300) {
                    lastRetryAfter = c.getHeaderField("Retry-After");
                    return parseError(code, readAll(c.getErrorStream()));
                }
                in = new BufferedReader(new InputStreamReader(c.getInputStream(), "UTF-8"), 8192);
                ReplyParser r = new ReplyParser();
                synchronized (partialLock) {
                    activeParser = r;
                }
                StringBuffer data = new StringBuffer();
                String line;
                streamError = null;
                while ((line = in.readLine()) != null && streamError == null) {
                    if (isCancelled()) return null;
                    if (line.startsWith("data:")) {
                        data.append(line.substring(line.length() > 5 && line.charAt(5) == ' ' ? 6 : 5));
                    } else if (line.length() == 0 && data.length() > 0) { // end of one SSE event
                        feedEvent(r, data.toString());
                        data.setLength(0);
                    }
                }
                if (data.length() > 0 && streamError == null) feedEvent(r, data.toString());
                if (isCancelled()) return null;
                if (streamError != null) return fail(streamError); // retried like an HTTP error (500/503...)
                return finish(r);
            } catch (Exception e) {
                if (isCancelled()) return null;
                Log.e("Gemini", "Request failed", e);
                return fail("Exception: " + e.toString());
            } finally {
                if (in != null) {
                    try {
                        in.close();
                    } catch (Exception ignored) {
                    }
                }
                disconnect();
                conn = null;
            }
        }

        /** Error object sent inside an already started stream ("Error 500: ..."), or null. */
        private String streamError;

        private void feedEvent(ReplyParser r, String json) throws JSONException {
            JSONObject o = new JSONObject(json);
            JSONObject err = o.optJSONObject("error"); // e.g. 500 INTERNAL after some thoughts were streamed
            if (err != null) {
                lastCode = err.optInt("code", 500);
                streamError = "Error " + lastCode + ": " + err.optString("message", "");
                return;
            }
            int len;
            synchronized (partialLock) {
                r.feed(o);
                len = r.text.length() + r.thoughts.length();
            }
            long now = System.currentTimeMillis();
            if (now - lastProgress >= streamIntervalMs(len)) {
                lastProgress = now;
                String th, tx;
                synchronized (partialLock) {
                    th = r.thoughts.toString();
                    tx = r.text.toString();
                }
                publishProgress((Object) new String[]{th, tx}); // one argument, not varargs
            }
        }

        @Override
        protected void onPreExecute() {
            setUiLoading(true);
            showStreaming(usedModel, "", "");
        }

        @Override
        protected void onProgressUpdate(Object... v) {
            if (currentTask != this) return;
            if (v[0] instanceof int[]) {
                int[] info = (int[]) v[0];
                removeStreaming(); // a retry starts the reply over
                etInput.setHint("Model is busy (" + info[2] + "), retry " + info[0] + "/" + info[1]
                        + " in " + info[3] + "s...");
            } else {
                String[] tt = (String[]) v[0];
                etInput.setHint("Model is generating...");
                showStreaming(usedModel, tt[0], tt[1]);
            }
        }

        @Override
        protected void onCancelled() {
            if (currentTask == this) currentTask = null;
        }

        @Override
        protected void onPostExecute(String result) {
            if (isCancelled() || isFinishing()) return;
            currentTask = null;
            removeStreaming();
            setUiLoading(false);
            if (result == null) return;
            if (failed) {
                addMessageToChat(-1L, "system", null, result, System.currentTimeMillis(), null, true);
            } else {
                long id = dbHelper.addMessage(currentChatId, "model", result, usedModel, thoughts);
                addMessageToChat(id, "model", usedModel, result, System.currentTimeMillis(), thoughts, true);
            }
            Compat.invalidateMenu(ChatActivity.this);
            scrollChatDown();
            if (!failed) maybeAutoName();
        }
    }

    // =========================================================================================
    // Auto-naming (Settings > Auto-name chats): one short request after the first reply
    // =========================================================================================

    static final String TITLE_MODEL = "gemini-3.5-flash-lite";

    /** The title request: the first exchange, cut to keep it small. */
    static String titleRequest(String user, String model) throws JSONException {
        String u = user.length() > 1500 ? user.substring(0, 1500) : user;
        String m = model.length() > 1500 ? model.substring(0, 1500) : model;
        String prompt = "Give this conversation a short title (2 to 6 words) in the language of the conversation. "
                + "Reply with the title only: no quotes, no markdown, no final period.\n\nUser: " + u + "\n\nAssistant: " + m;
        JSONObject root = new JSONObject();
        root.put("contents", new JSONArray().put(new JSONObject().put("role", "user")
                .put("parts", new JSONArray().put(new JSONObject().put("text", prompt)))));
        root.put("generationConfig", new JSONObject().put("maxOutputTokens", 300)
                .put("thinkingConfig", new JSONObject().put("thinkingLevel", "minimal")));
        return root.toString();
    }

    /** Model output -> a clean one-line title, or null if unusable. */
    static String cleanTitle(String s) {
        if (s == null) return null;
        s = s.trim();
        int nl = s.indexOf('\n');
        if (nl >= 0) s = s.substring(0, nl).trim();
        if (s.startsWith("Title:") || s.startsWith("title:")) s = s.substring(6).trim();
        StringBuffer b = new StringBuffer();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '*' || c == '#' || c == '`' || c == '"' || c == '\u201C' || c == '\u201D') continue;
            b.append(c);
        }
        s = b.toString().trim();
        while (s.endsWith(".") || s.endsWith(":")) s = s.substring(0, s.length() - 1).trim();
        if (s.length() == 0) return null;
        if (s.length() > 40) s = s.substring(0, 40).trim() + "...";
        return s;
    }

    private void maybeAutoName() {
        AutoNamer.maybeStart(this, dbHelper, chatId, new AutoNamer.Callback() {
            public void onNamed(long id, String title) {
                if (id == chatId) setTitle(title);
            }
        });
    }

    /** The reply being streamed (not long-pressable until it is finished and saved). */
    private TextView streamView;
    private String streamModel = "", streamThoughts = "", streamText = "";
    private int thinkingDots = 1;
    private boolean pulseScheduled;

    private final Runnable thinkingPulse = new Runnable() {
        public void run() {
            pulseScheduled = false;
            if (streamView == null || currentTask == null || streamText.length() > 0 || isFinishing()) return;
            thinkingDots = (thinkingDots % 3) + 1;
            streamView.setText(MessageFormatter.formatWaiting(ChatActivity.this, streamModel, streamThoughts, thinkingDots));
            scheduleThinkingPulse();
        }
    };

    private void scheduleThinkingPulse() {
        if (pulseScheduled) return;
        pulseScheduled = true;
        handler.postDelayed(thinkingPulse, 450);
    }

    private void stopThinkingPulse() {
        pulseScheduled = false;
        handler.removeCallbacks(thinkingPulse);
    }

    private void showStreaming(String model, String thoughts, String text) {
        boolean atBottom = scrollChat.getScrollY() + scrollChat.getHeight() >= layoutChat.getHeight() - 8;
        streamModel = model != null ? model : "";
        streamThoughts = thoughts != null ? thoughts : "";
        streamText = text != null ? text : "";
        if (streamView == null) {
            removePlaceholder();
            streamView = new TextView(this);
            MessageFormatter.styleView(streamView, "model");
            streamView.setLongClickable(false);
            layoutChat.addView(streamView);
            thinkingDots = 1;
        }
        if (streamText.length() > 0) {
            stopThinkingPulse();
            streamView.setText(MessageFormatter.formatStreaming(this, streamModel, streamText));
        } else {
            streamView.setText(MessageFormatter.formatWaiting(this, streamModel, streamThoughts, thinkingDots));
            scheduleThinkingPulse();
        }
        if (atBottom) scrollChatDown();
    }

    private void removeStreaming() {
        stopThinkingPulse();
        streamText = "";
        streamThoughts = "";
        if (streamView != null) {
            layoutChat.removeView(streamView);
            streamView = null;
        }
    }

    // =========================================================================================
    // Lifecycle
    // =========================================================================================

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EmojiMap.preloadAsync(this);
        MessageFormatter.applyPrefs(this);
        renderedTextSp = MessageFormatter.TEXT_SP;
        setContentView(R.layout.main);
        etInput = (EditText) findViewById(R.id.et_input);
        btnSend = (Button) findViewById(R.id.btn_send);
        btnStop = (Button) findViewById(R.id.btn_stop);
        layoutChat = (LinearLayout) findViewById(R.id.layout_chat);
        scrollChat = (ScrollView) findViewById(R.id.scroll_chat);
        dbHelper = new DatabaseHelper(this);
        buildReadBar();
        buildAttachBar();

        chatId = getIntent().getLongExtra("chat_id", -1L);
        if (chatId != -1) {
            setTitle(dbHelper.getChatTitle(chatId));
            loadMessages(false);
        } else {
            setTitle("New chat");
            showPlaceholder();
        }

        etInput.addTextChangedListener(new TextWatcher() {
            public void afterTextChanged(Editable s) {
                if (currentTask == null) btnSend.setEnabled(canSend());
            }

            public void beforeTextChanged(CharSequence s, int a, int b, int c) {
            }

            public void onTextChanged(CharSequence s, int a, int b, int c) {
            }
        });
        btnSend.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                send();
            }
        });
        btnStop.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                GeminiTask t = currentTask;
                if (t != null) {
                    String[] snap = t.snapshotPartial();
                    String part = snap[0].trim();
                    String th = t.includeThoughts ? snap[1].trim() : "";
                    cancelTask();
                    setUiLoading(false);
                    if (part.length() > 0) { // keep what was written so far
                        String text = part + "\n\n*[Stopped]*";
                        long id = dbHelper.addMessage(t.currentChatId, "model", text, t.usedModel, th);
                        addMessageToChat(id, "model", t.usedModel, text, System.currentTimeMillis(), th, true);
                        Compat.invalidateMenu(ChatActivity.this);
                    } else {
                        addMessageToChat(-1L, "system", null, "Request stopped by user.", System.currentTimeMillis(), null, true);
                    }
                    scrollChatDown();
                }
            }
        });
    }

    /** Text size the messages were rendered with (Settings may change it). */
    private float renderedTextSp;

    @Override
    protected void onResume() {
        super.onResume();
        MessageFormatter.applyPrefs(this);
        updatePlaceholderConfig();
        if (MessageFormatter.TEXT_SP != renderedTextSp) {
            renderedTextSp = MessageFormatter.TEXT_SP;
            if (chatId != -1 && currentTask == null) loadMessages(true);
        }
        if (streamView != null && currentTask != null && streamText.length() == 0) scheduleThinkingPulse();
    }

    @Override
    protected void onPause() {
        super.onPause();
        stopThinkingPulse();
        stopReading(); // no audio from a screen that isn't shown
    }

    @Override
    public void onLowMemory() {
        super.onLowMemory();
        Thumbnail.clearCache();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        stopThinkingPulse();
        stopReading();
        cancelAttachTask();
        cancelTask();
        if (dbHelper != null) dbHelper.close();
    }

    private void cancelTask() {
        removeStreaming();
        GeminiTask t = currentTask;
        if (t != null) {
            t.cancel(true);
            t.disconnectAsync();
            currentTask = null;
        }
    }

    private void cancelAttachTask() {
        AttachImageTask t = attachTask;
        if (t != null) {
            t.cancel(true);
            attachTask = null;
        }
    }

    private boolean canSend() {
        return attachTask == null && (etInput.getText().toString().trim().length() > 0 || pendingImage != null);
    }

    private SharedPreferences prefs() {
        return getSharedPreferences(PREFS, 0);
    }

    // =========================================================================================
    // Sending
    // =========================================================================================

    private void hideKeyboard(View v) {
        InputMethodManager imm = (InputMethodManager) getSystemService(INPUT_METHOD_SERVICE);
        if (imm != null) imm.hideSoftInputFromWindow(v.getWindowToken(), 0);
    }

    private boolean hasApiKey() {
        if (prefs().getString("api_key", "").trim().length() > 0) return true;
        Toast.makeText(this, "Please go to Settings to set API Key", Toast.LENGTH_LONG).show();
        return false;
    }

    private void send() {
        hideKeyboard(etInput);
        String text = etInput.getText().toString().trim();
        if (!hasApiKey()) return;
        if (text.length() == 0 && pendingImage == null) return;
        removePlaceholder();
        if (chatId == -1) {
            String title = text.length() == 0 ? "Image" : text.replace('\n', ' ').trim();
            if (title.length() > 25) title = title.substring(0, 25) + "...";
            chatId = dbHelper.createChat(title);
            setTitle(title);
            layoutChat.removeAllViews();
        }
        String image = pendingImage;
        long now = System.currentTimeMillis();
        long id = dbHelper.addMessage(chatId, "user", text, image);
        addMessageToChat(id, "user", image, text, now, null, true);
        setAttachment(null);
        etInput.setText("");
        scrollChatDown();
        startRequest();
    }

    /** Sends the chat's saved history as it is now (after send, edit, regenerate or retry). */
    private void startRequest() {
        SharedPreferences sp = prefs();
        String key = sp.getString("api_key", "").trim();
        if (key.length() == 0) {
            Toast.makeText(this, "Please go to Settings to set API Key", Toast.LENGTH_LONG).show();
            return;
        }
        String model = sp.getString("model", DEFAULT_MODEL);
        cancelTask();
        currentTask = new GeminiTask(chatId, model);
        currentTask.execute(key, model, sp.getString("system_instruction", "").trim(),
                sp.getString("thinking_level", ""), sp.getBoolean("show_thoughts", true) ? "1" : "0");
    }

    private void setUiLoading(boolean loading) {
        etInput.setEnabled(!loading);
        if (loading) {
            etInput.setHint("Model is generating...");
            btnSend.setVisibility(View.GONE);
            btnStop.setVisibility(View.VISIBLE);
        } else {
            etInput.setHint(HINT_IDLE);
            btnStop.setVisibility(View.GONE);
            btnSend.setVisibility(View.VISIBLE);
            btnSend.setEnabled(canSend());
        }
    }

    // =========================================================================================
    // Attachment (native widgets, built in code: thumbnail + label + "Remove")
    // =========================================================================================

    private int dp(float v) {
        return (int) (v * getResources().getDisplayMetrics().density + 0.5f);
    }

    private void buildReadBar() {
        readBar = new LinearLayout(this);
        readBar.setOrientation(LinearLayout.HORIZONTAL);
        readBar.setGravity(Gravity.CENTER_VERTICAL);
        readBar.setBackgroundDrawable(new LayerDrawable(new Drawable[]{
                new ColorDrawable(0xFF1B2420),
                new MessageFormatter.RoleBar(MessageFormatter.ROLE_MODEL, Math.max(2, dp(3)))}));
        readBar.setPadding(dp(10), dp(4), dp(4), dp(4));
        readBar.setVisibility(View.GONE);

        readLabel = new TextView(this);
        readLabel.setTextSize(13f);
        readLabel.setTextColor(MessageFormatter.ROLE_MODEL);
        readLabel.setSingleLine(true);
        readBar.addView(readLabel, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        Button stop = new Button(this, null, android.R.attr.buttonStyleSmall);
        stop.setText("Stop");
        stop.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                stopReading();
            }
        });
        readBar.addView(stop, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT));

        LinearLayout root = (LinearLayout) scrollChat.getParent();
        root.addView(readBar, root.getChildCount() - 1, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.FILL_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
    }

    private void buildAttachBar() {
        attachBar = new LinearLayout(this);
        attachBar.setOrientation(LinearLayout.HORIZONTAL);
        attachBar.setGravity(Gravity.CENTER_VERTICAL);
        attachBar.setPadding(dp(6), dp(4), dp(2), 0);
        attachBar.setVisibility(View.GONE);

        attachThumb = new ImageView(this);
        attachThumb.setScaleType(ImageView.ScaleType.CENTER_CROP);
        attachBar.addView(attachThumb, new LinearLayout.LayoutParams(dp(40), dp(40)));

        attachLabel = new TextView(this);
        attachLabel.setTextSize(14f);
        attachLabel.setPadding(dp(8), 0, dp(4), 0);
        attachLabel.setSingleLine(true);
        attachBar.addView(attachLabel, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        Button remove = new Button(this, null, android.R.attr.buttonStyleSmall);
        remove.setText("Remove");
        remove.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                setAttachment(null);
            }
        });
        attachBar.addView(remove, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT));

        // tap the preview or label to pick a different image
        View.OnClickListener change = new View.OnClickListener() {
            public void onClick(View v) {
                pickImage();
            }
        };
        attachThumb.setOnClickListener(change);
        attachLabel.setOnClickListener(change);

        // the input row is the last child of main.xml's root; the bar goes just above it
        LinearLayout root = (LinearLayout) scrollChat.getParent();
        root.addView(attachBar, root.getChildCount() - 1, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.FILL_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
    }

    private void setAttachment(String dataUri) {
        setAttachment(dataUri, null);
    }

    private void setAttachment(String dataUri, Bitmap predecodedThumb) {
        cancelAttachTask();
        pendingImage = dataUri;
        if (dataUri == null) {
            attachBar.setVisibility(View.GONE);
            attachThumb.setImageDrawable(null);
        } else {
            Bitmap b = predecodedThumb != null ? predecodedThumb : Thumbnail.fromDataUri(dataUri, dp(40));
            attachThumb.setImageBitmap(b);
            int comma = dataUri.indexOf(',');
            long bytes = (dataUri.length() - comma - 1) * 3L / 4;
            attachLabel.setText("Image attached (" + Math.max(1, (bytes + 512) / 1024) + " KB)");
            attachBar.setVisibility(View.VISIBLE);
        }
        if (currentTask == null) btnSend.setEnabled(canSend());
        Compat.invalidateMenu(this);
    }

    /** Decodes, downscales, and Base64-encodes a picked image off the UI thread (prevents ANRs on weak CPUs). */
    private final class AttachImageTask extends AsyncTask<String, Void, Object[]> {
        private final int thumbPx;

        AttachImageTask(int thumbPx) {
            this.thumbPx = thumbPx;
        }

        @Override
        protected Object[] doInBackground(String... params) {
            String dataUri = ImageUtil.uriToBase64(ChatActivity.this, params[0]);
            if (dataUri == null || isCancelled()) return null;
            Bitmap thumb = Thumbnail.fromDataUri(dataUri, thumbPx);
            return new Object[]{dataUri, thumb};
        }

        @Override
        protected void onPostExecute(Object[] res) {
            if (attachTask != this || isCancelled() || isFinishing()) return;
            attachTask = null;
            if (res == null) {
                setAttachment(null);
                Toast.makeText(ChatActivity.this, "Could not read that image (only images are supported).",
                        Toast.LENGTH_LONG).show();
                return;
            }
            setAttachment((String) res[0], (Bitmap) res[1]);
        }
    }

    private void pickImage() {
        Intent i = new Intent(Build.VERSION.SDK_INT >= 19 ? "android.intent.action.OPEN_DOCUMENT"
                : Intent.ACTION_GET_CONTENT);
        i.setType("image/*");
        i.addCategory(Intent.CATEGORY_OPENABLE);
        try {
            startActivityForResult(i, REQ_IMAGE);
        } catch (Exception e) {
            Toast.makeText(this, "No app available to pick an image.", Toast.LENGTH_LONG).show();
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQ_LIVE) {
            // the live screen saves its turns into this chat (or creates one for a new chat)
            long id = data != null ? data.getLongExtra("chat_id", -1L) : -1L;
            if (chatId == -1 && id != -1) chatId = id;
            if (chatId != -1) {
                setTitle(dbHelper.getChatTitle(chatId));
                loadMessages(false);
                maybeAutoName(); // a chat started in Live
            }
            return;
        }
        if (requestCode != REQ_IMAGE || resultCode != RESULT_OK || data == null) return;
        String uri = data.getDataString();
        if (uri == null) return;
        cancelAttachTask();
        pendingImage = null;
        attachThumb.setImageDrawable(null);
        attachLabel.setText("Attaching image...");
        attachBar.setVisibility(View.VISIBLE);
        if (currentTask == null) btnSend.setEnabled(false);
        attachTask = new AttachImageTask(dp(40));
        attachTask.execute(uri);
    }

    // =========================================================================================
    // Message list & empty welcome view
    // =========================================================================================

    /** Crisp four-point Gemini star emblem drawn in pure API-7 Canvas (zero bitmap memory). */
    private static final class SparkleView extends View {
        private final Paint pMain = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint pSub = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path pathMain = new Path();
        private final Path pathSub = new Path();

        SparkleView(ChatActivity ctx) {
            super(ctx);
            pMain.setColor(MessageFormatter.ROLE_USER);
            pMain.setStyle(Paint.Style.FILL);
            pSub.setColor(MessageFormatter.ROLE_MODEL);
            pSub.setStyle(Paint.Style.FILL);
        }

        private static void buildStar(Path out, float cx, float cy, float r) {
            out.reset();
            float k = r * 0.24f;
            out.moveTo(cx, cy - r);
            out.quadTo(cx + k, cy - k, cx + r, cy);
            out.quadTo(cx + k, cy + k, cx, cy + r);
            out.quadTo(cx - k, cy + k, cx - r, cy);
            out.quadTo(cx - k, cy - k, cx, cy - r);
            out.close();
        }

        @Override
        protected void onSizeChanged(int w, int h, int oldw, int oldh) {
            float s = Math.min(w, h);
            buildStar(pathMain, w * 0.44f, h * 0.54f, s * 0.38f);
            buildStar(pathSub, w * 0.78f, h * 0.24f, s * 0.16f);
        }

        @Override
        protected void onDraw(Canvas c) {
            c.drawPath(pathMain, pMain);
            c.drawPath(pathSub, pSub);
        }
    }

    private String activeConfigSummary() {
        SharedPreferences sp = prefs();
        String model = sp.getString("model", DEFAULT_MODEL);
        String lvl = sp.getString("thinking_level", "");
        String label = "Default";
        for (int i = 0; i < SettingsActivity.THINKING_VALUES.length; i++) {
            if (SettingsActivity.THINKING_VALUES[i].equals(lvl)) {
                label = SettingsActivity.THINKING_LABELS[i];
                break;
            }
        }
        return model + " \u00B7 " + label;
    }

    private void updatePlaceholderConfig() {
        if (placeholderConfig != null) placeholderConfig.setText(activeConfigSummary());
    }

    private void showPlaceholder() {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setGravity(Gravity.CENTER);
        box.setPadding(dp(20), dp(16), dp(20), dp(16));
        box.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.FILL_PARENT,
                LinearLayout.LayoutParams.FILL_PARENT, 1f));
        box.setTag("placeholder");

        SparkleView star = new SparkleView(this);
        int sz = dp(38);
        LinearLayout.LayoutParams slp = new LinearLayout.LayoutParams(sz, sz);
        slp.bottomMargin = dp(8);
        box.addView(star, slp);

        TextView title = new TextView(this);
        title.setText("Gemini Chat");
        title.setTextSize(17f);
        title.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        title.setTextColor(0xFFFFFFFF);
        title.setGravity(Gravity.CENTER);
        box.addView(title);

        TextView sub = new TextView(this);
        sub.setText("Type a message below or open Menu for Live Voice.");
        sub.setTextSize(13f);
        sub.setTextColor(MessageFormatter.TEXT_MUTED);
        sub.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams subLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        subLp.topMargin = dp(4);
        box.addView(sub, subLp);

        placeholderConfig = new TextView(this);
        placeholderConfig.setText(activeConfigSummary());
        placeholderConfig.setTextSize(12f);
        placeholderConfig.setTextColor(MessageFormatter.ACCENT);
        placeholderConfig.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams cfgLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        cfgLp.topMargin = dp(8);
        box.addView(placeholderConfig, cfgLp);

        layoutChat.addView(box);
    }

    private void removePlaceholder() {
        if (layoutChat.getChildCount() == 1 && "placeholder".equals(layoutChat.getChildAt(0).getTag())) {
            layoutChat.removeAllViews();
            placeholderConfig = null;
        }
    }

    private void addMessageToChat(long id, String role, String model, String text, long timestamp) {
        addMessageToChat(id, role, model, text, timestamp, null, false);
    }

    private void addMessageToChat(long id, String role, String model, String text, long timestamp, String thoughts,
                                  boolean animate) {
        TextView tv = new TextView(this);
        ArrayList<String> codeBlocks = new ArrayList<String>();
        tv.setText(MessageFormatter.format(this, role, model, text, timestamp, codeBlocks));
        MessageFormatter.styleView(tv, role);
        tv.setOnLongClickListener(new MessageMenu(id, role, model, text, codeBlocks, thoughts));
        layoutChat.addView(tv);
        if (animate) {
            AlphaAnimation fade = new AlphaAnimation(0f, 1f);
            fade.setDuration(160);
            tv.startAnimation(fade);
        }
    }

    /** Re-renders the chat from the database. keepScroll: stay where the user was (edits, deletes). */
    private void loadMessages(boolean keepScroll) {
        final int y = scrollChat.getScrollY();
        layoutChat.removeAllViews();
        placeholderConfig = null;
        stopThinkingPulse();
        streamView = null;
        boolean any = false;
        Cursor c = null;
        try {
            if (chatId != -1) c = dbHelper.getMessages(chatId);
            if (c != null && c.moveToFirst()) {
                int iId = c.getColumnIndex("_id"), iRole = c.getColumnIndex("role"), iModel = c.getColumnIndex("model");
                int iContent = c.getColumnIndex("content"), iTs = c.getColumnIndex("timestamp");
                int iThoughts = c.getColumnIndex("thoughts");
                do {
                    addMessageToChat(c.getLong(iId), c.getString(iRole), iModel != -1 ? c.getString(iModel) : null,
                            c.getString(iContent), iTs != -1 ? c.getLong(iTs) : 0L,
                            iThoughts != -1 ? c.getString(iThoughts) : null, false);
                    any = true;
                } while (c.moveToNext());
            }
        } catch (Exception e) {
            Log.e("Gemini", "Error loading messages", e);
        } finally {
            if (c != null) c.close();
        }
        if (!any) showPlaceholder();
        Compat.invalidateMenu(this);
        if (keepScroll) {
            scrollChat.post(new Runnable() {
                public void run() {
                    scrollChat.scrollTo(0, y);
                }
            });
        } else {
            scrollChatDown();
        }
    }

    private void scrollChatDown() {
        scrollChat.removeCallbacks(scrollDownRunnable);
        scrollChat.post(scrollDownRunnable);
    }

    /** Role of the newest saved user/model row ("user", "model") or null when there is none. */
    private String lastSavedRole() {
        return chatId == -1 ? null : dbHelper.getLastSavedRole(chatId);
    }

    // =========================================================================================
    // Long-press menu
    // =========================================================================================

    private final class MessageMenu implements View.OnLongClickListener, DialogInterface.OnClickListener {
        final long id;
        final String role, model, text, thoughts;
        final ArrayList<String> codeBlocks;
        ArrayList<String> labels;
        int[] actions, args; // args: the code block of a "Copy Code Block" item

        MessageMenu(long id, String role, String model, String text, ArrayList<String> codeBlocks, String thoughts) {
            this.id = id;
            this.thoughts = thoughts == null ? "" : thoughts;
            this.role = role;
            this.model = model;
            this.text = text == null ? "" : text;
            this.codeBlocks = codeBlocks;
        }

        private void add(String label, int action) {
            add(label, action, 0);
        }

        private void add(String label, int action, int arg) {
            labels.add(label);
            actions[labels.size() - 1] = action;
            args[labels.size() - 1] = arg;
        }

        public boolean onLongClick(View v) {
            labels = new ArrayList<String>();
            actions = new int[12 + codeBlocks.size()];
            args = new int[actions.length];
            boolean saved = id != -1;
            boolean user = "user".equals(role), reply = "model".equals(role);
            if (reader != null) add("Stop Reading", A_STOP_READ);
            if (reply && text.trim().length() > 0 && (reader == null || reader.messageId != id)) add("Read Aloud", A_READ);
            if (thoughts.length() > 0) add("Show Thought Process", A_THOUGHTS);
            add("Copy Entire Message", A_COPY);
            for (int i = 0; i < codeBlocks.size(); i++) add("Copy Code Block " + (i + 1), A_COPY_CODE, i);
            if (saved && user) {
                add("Regenerate", A_REGEN);
                add("Edit Message", A_EDIT);
            } else if (saved && reply) {
                add("Edit Message", A_EDIT);
                add("Regenerate", A_REGEN);
            }
            if (!user) add("Share Message", A_SHARE);
            if (!saved && currentTask == null && "user".equals(lastSavedRole())) add("Retry", A_RETRY);
            if (saved) add("Delete Message", A_DELETE);
            new AlertDialog.Builder(ChatActivity.this)
                    .setTitle("Message Options")
                    .setItems(labels.toArray(new String[labels.size()]), this)
                    .show();
            return true;
        }

        public void onClick(DialogInterface d, int which) {
            switch (actions[which]) {
                case A_COPY:
                    copy(text, "Copied to clipboard");
                    break;
                case A_COPY_CODE:
                    copy(codeBlocks.get(args[which]), "Code block copied");
                    break;
                case A_READ:
                    readAloud(id, text);
                    break;
                case A_STOP_READ:
                    stopReading();
                    break;
                case A_SHARE: {
                    Intent i = new Intent(Intent.ACTION_SEND);
                    i.setType("text/plain");
                    i.putExtra(Intent.EXTRA_TEXT, text);
                    startActivity(Intent.createChooser(i, "Share Message"));
                    break;
                }
                case A_EDIT:
                    showEditDialog(id, role, model, text);
                    break;
                case A_REGEN:
                    regenerate(id, role);
                    break;
                case A_DELETE:
                    confirmDelete(id);
                    break;
                case A_RETRY:
                    retryLast();
                    break;
                case A_THOUGHTS:
                    showThoughts(model, thoughts);
                    break;
            }
        }
    }

    // =========================================================================================
    // Read Aloud (text-to-speech in the Live voice)
    // =========================================================================================

    private void readAloud(long msgId, String markdown) {
        String key = prefs().getString("api_key", "").trim();
        if (key.length() == 0) {
            Toast.makeText(this, "Please go to Settings to set API Key", Toast.LENGTH_LONG).show();
            return;
        }
        String say = ReadAloud.speakable(markdown);
        if (say.length() == 0) {
            Toast.makeText(this, "Nothing to read in this message.", Toast.LENGTH_SHORT).show();
            return;
        }
        stopReading();
        SharedPreferences sp = prefs();
        String voice = sp.getString("live_voice", LiveActivity.DEFAULT_VOICE);
        String model = sp.getString("tts_model", ReadAloud.DEFAULT_MODEL);
        reader = new ReadAloud(msgId, key, model, voice, say, handler, new ReadAloud.Listener() {
            public void onDone(ReadAloud r, String error) {
                if (reader == r) {
                    reader = null;
                    if (readBar != null) readBar.setVisibility(View.GONE);
                    Compat.invalidateMenu(ChatActivity.this);
                }
                if (error != null && !isFinishing()) Toast.makeText(ChatActivity.this, error, Toast.LENGTH_LONG).show();
            }
        });
        reader.start();
        if (readBar != null) {
            readLabel.setText("Reading aloud (" + voice + ")...");
            readBar.setVisibility(View.VISIBLE);
        }
        Compat.invalidateMenu(this);
    }

    private void stopReading() {
        ReadAloud r = reader;
        reader = null;
        if (readBar != null) readBar.setVisibility(View.GONE);
        if (r != null) {
            r.stopReading();
            Compat.invalidateMenu(this);
        }
    }

    /** The model's thought summary, rendered like a reply, in a scrollable dialog. */
    private void showThoughts(String model, final String thoughts) {
        ScrollView sv = new ScrollView(this);
        TextView tv = new TextView(this);
        tv.setText(MessageFormatter.formatBody(this, thoughts));
        MessageFormatter.styleView(tv, "model");
        tv.setLongClickable(false);
        sv.addView(tv);
        new AlertDialog.Builder(this)
                .setTitle("Thought Process" + (model != null && model.length() > 0 ? " (" + model + ")" : ""))
                .setView(sv)
                .setPositiveButton("Close", null)
                .setNeutralButton("Copy", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface d, int w) {
                        copy(thoughts, "Thoughts copied");
                    }
                })
                .show();
    }

    private void copy(String s, String toast) {
        ClipboardManager cm = (ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
        cm.setText(s);
        Toast.makeText(this, toast, Toast.LENGTH_SHORT).show();
    }

    /**
     * User message: drop everything after it, update its timestamp to now, and ask again.
     * Reply: drop it (and everything after it), update the preceding user message's timestamp, and ask again.
     */
    private void regenerate(long msgId, String role) {
        if (!hasApiKey()) return;
        stopReading();
        if ("user".equals(role)) {
            dbHelper.deleteMessagesAfter(chatId, msgId);
            dbHelper.touchMessageTimestamp(chatId, msgId, System.currentTimeMillis());
        } else {
            dbHelper.deleteMessagesFrom(chatId, msgId);
            long lastUser = dbHelper.getLastMessageId(chatId, "user");
            if (lastUser != -1) dbHelper.touchMessageTimestamp(chatId, lastUser, System.currentTimeMillis());
        }
        if (lastSavedRole() == null) {
            loadMessages(false);
            Toast.makeText(this, "Nothing left to answer.", Toast.LENGTH_SHORT).show();
            return;
        }
        loadMessages(false);
        startRequest();
    }

    /** Retries after a failed reply: refreshes the last user message timestamp and re-sends. */
    private void retryLast() {
        if (!hasApiKey()) return;
        stopReading();
        long lastUser = dbHelper.getLastMessageId(chatId, "user");
        if (lastUser != -1) dbHelper.touchMessageTimestamp(chatId, lastUser, System.currentTimeMillis());
        loadMessages(false); // drop the old error lines (they aren't saved)
        startRequest();
    }

    private void confirmDelete(final long msgId) {
        new AlertDialog.Builder(this)
                .setTitle("Delete Message")
                .setMessage("Delete this message? Later messages are kept.")
                .setPositiveButton("Delete", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface d, int w) {
                        dbHelper.deleteMessage(msgId);
                        loadMessages(true);
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    /**
     * Reply: "Save" only rewrites it (the edited text becomes the model's side of the history).
     * User message: "Resend" saves, drops the later messages and asks again; "Save" only rewrites it.
     */
    private void showEditDialog(final long msgId, String role, String model, String current) {
        final boolean user = "user".equals(role);
        final boolean hasImage = user && model != null && model.startsWith("data:image/");
        final EditText et = new EditText(this);
        et.setText(current);
        et.setSelection(et.getText().length());
        et.setGravity(Gravity.TOP);
        // keep the dialog's buttons on screen for long replies (e.g. 240x320): scroll inside the field
        int lines = (int) (getResources().getDisplayMetrics().heightPixels * 0.4f / Math.max(1, et.getLineHeight()));
        et.setMaxLines(Math.max(3, lines));
        et.setVerticalScrollBarEnabled(true);

        AlertDialog.Builder b = new AlertDialog.Builder(this).setTitle(user ? "Edit Message" : "Edit Reply").setView(et);
        if (user) {
            b.setPositiveButton("Resend", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface d, int w) {
                    hideKeyboard(et);
                    String s = et.getText().toString().trim();
                    if (s.length() == 0 && !hasImage) return;
                    if (!hasApiKey()) return;
                    stopReading();
                    dbHelper.updateMessage(msgId, s);
                    dbHelper.deleteMessagesAfter(chatId, msgId);
                    dbHelper.touchMessageTimestamp(chatId, msgId, System.currentTimeMillis());
                    loadMessages(false);
                    startRequest();
                }
            });
            b.setNeutralButton("Save", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface d, int w) {
                    hideKeyboard(et);
                    String s = et.getText().toString().trim();
                    if (s.length() == 0 && !hasImage) return;
                    dbHelper.updateMessage(msgId, s);
                    loadMessages(true);
                }
            });
        } else {
            b.setPositiveButton("Save", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface d, int w) {
                    hideKeyboard(et);
                    String s = et.getText().toString();
                    if (s.trim().length() == 0) {
                        Toast.makeText(ChatActivity.this, "Empty reply not saved. Use Delete Message instead.",
                                Toast.LENGTH_LONG).show();
                        return;
                    }
                    dbHelper.updateMessage(msgId, s);
                    loadMessages(true);
                }
            });
        }
        b.setNegativeButton("Cancel", null);
        b.show();
    }

    // =========================================================================================
    // Options menu
    // =========================================================================================

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // our own menu-style mic (res/drawable-*/ic_menu_live.png); Android has no public menu mic icon
        int live = getResources().getIdentifier("ic_menu_live", "drawable", getPackageName());
        menu.add(0, MENU_LIVE, 0, "Live Voice").setIcon(live != 0 ? live : android.R.drawable.ic_btn_speak_now);
        menu.add(0, MENU_STOP_READING, 0, "Stop Reading").setIcon(android.R.drawable.ic_lock_silent_mode);
        menu.add(0, MENU_SETTINGS, 0, "Settings").setIcon(android.R.drawable.ic_menu_preferences);
        menu.add(0, MENU_DELETE_CHAT, 0, "Delete This Chat").setIcon(android.R.drawable.ic_menu_delete);
        if (Build.VERSION.SDK_INT >= 8) {
            menu.add(0, MENU_ATTACH, 0, "Attach Image").setIcon(android.R.drawable.ic_menu_add);
            menu.add(0, MENU_DETACH, 0, "Remove Image").setIcon(android.R.drawable.ic_menu_close_clear_cancel);
        }
        return true;
    }

    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        MenuItem stop = menu.findItem(MENU_STOP_READING);
        if (stop != null) stop.setVisible(reader != null);
        MenuItem del = menu.findItem(MENU_DELETE_CHAT);
        if (del != null) {
            del.setVisible(chatId != -1 && dbHelper != null && dbHelper.hasMessages(chatId));
        }
        MenuItem attach = menu.findItem(MENU_ATTACH);
        if (attach != null) {
            attach.setVisible(Build.VERSION.SDK_INT >= 19 || Environment.MEDIA_MOUNTED.equals(Environment.getExternalStorageState()));
            attach.setTitle(pendingImage == null ? "Attach Image" : "Change Image");
        }
        MenuItem detach = menu.findItem(MENU_DETACH);
        if (detach != null) detach.setVisible(pendingImage != null);
        return super.onPrepareOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case MENU_SETTINGS:
                startActivity(new Intent(this, SettingsActivity.class));
                return true;
            case MENU_DELETE_CHAT:
                if (chatId == -1) {
                    finish();
                    return true;
                }
                new AlertDialog.Builder(this)
                        .setTitle("Delete Chat")
                        .setMessage("Are you sure you want to delete this chat?")
                        .setPositiveButton("Delete", new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface d, int w) {
                                stopReading();
                                dbHelper.deleteChat(chatId);
                                finish();
                            }
                        })
                        .setNegativeButton("Cancel", null)
                        .show();
                return true;
            case MENU_ATTACH:
                pickImage();
                return true;
            case MENU_STOP_READING:
                stopReading();
                return true;
            case MENU_LIVE: {
                stopReading();
                cancelTask();
                setUiLoading(false);
                Intent i = new Intent(this, LiveActivity.class);
                i.putExtra("chat_id", chatId);
                startActivityForResult(i, REQ_LIVE);
                return true;
            }
            case MENU_DETACH:
                setAttachment(null);
                return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
