package com.gemini.chat;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.Bitmap;
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

    /** Attached image as a data: URI (converted when picked), or null. */
    private String pendingImage;
    private LinearLayout attachBar;
    private ImageView attachThumb;
    private TextView attachLabel;

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

    private class GeminiTask extends AsyncTask<String, Object, String> {
        /** HTTP codes worth retrying (Google: "retry with backoff"). 429 = quota: not retried. */
        private static final int MAX_RETRIES = 2;
        private long currentChatId;
        private String usedModel = "";
        private HttpURLConnection conn = null;
        private boolean failed = false;
        private int lastCode = 0;
        /** thinkingConfig: level (null = model default) and whether thought summaries are requested. */
        private String thinkingLevel;
        private boolean includeThoughts;
        /** Thought summary of the finished reply ("" if none). */
        private String thoughts = "";
        private long lastProgress;

        GeminiTask(long chatId) {
            this.currentChatId = chatId;
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
            for (int attempt = 0; attempt <= MAX_RETRIES; attempt++) {
                if (isCancelled()) return null;
                if (attempt > 0) {
                    publishProgress(Integer.valueOf(attempt));
                    try {
                        Thread.sleep(2000L << (attempt - 1)); // 2 s, 4 s
                    } catch (InterruptedException e) {
                        return null;
                    }
                    if (isCancelled()) return null;
                    failed = false;
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
                if (!(failed && retryable(lastCode))) break;
            }
            return result;
        }

        /** streamGenerateContent (SSE): thought summaries and the answer are shown while they arrive. */
        private String request(String key, String model, String body) {
            lastCode = 0;
            BufferedReader in = null;
            try {
                HttpURLConnection c = (HttpURLConnection) new URL(API + model + ":streamGenerateContent?alt=sse").openConnection();
                conn = c;
                c.setConnectTimeout(30000);
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
                if (code < 200 || code >= 300) return parseError(code, readAll(c.getErrorStream()));
                in = new BufferedReader(new InputStreamReader(c.getInputStream(), "UTF-8"), 8192);
                ReplyParser r = new ReplyParser();
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

        /** What has streamed so far (kept by Stop). */
        volatile String partialText = "", partialThoughts = "";

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
            r.feed(o);
            partialText = r.text.toString();
            partialThoughts = r.thoughts.toString();
            long now = System.currentTimeMillis();
            if (now - lastProgress >= 250) { // old phones: re-render at most 4 times a second
                lastProgress = now;
                publishProgress((Object) new String[]{r.thoughts.toString(), r.text.toString()}); // one argument, not varargs
            }
        }

        @Override
        protected void onPreExecute() {
            setUiLoading(true);
        }

        @Override
        protected void onProgressUpdate(Object... v) {
            if (currentTask != this) return;
            if (v[0] instanceof Integer) {
                removeStreaming(); // a retry starts the reply over
                etInput.setHint("Model is busy (" + lastCode + "), retry " + v[0] + "/" + MAX_RETRIES + "...");
            } else {
                String[] tt = (String[]) v[0];
                showStreaming(usedModel, tt[0], tt[1]);
            }
        }

        @Override
        protected void onCancelled() {
            if (currentTask == this) currentTask = null;
        }

        @Override
        protected void onPostExecute(String result) {
            if (isCancelled()) return;
            currentTask = null;
            removeStreaming();
            setUiLoading(false);
            if (result == null) return;
            if (failed) {
                addMessageToChat(-1L, "system", null, result, System.currentTimeMillis(), null);
            } else {
                long id = dbHelper.addMessage(currentChatId, "model", result, usedModel, thoughts);
                addMessageToChat(id, "model", usedModel, result, System.currentTimeMillis(), thoughts);
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

    private void showStreaming(String model, String thoughts, String text) {
        boolean atBottom = scrollChat.getScrollY() + scrollChat.getHeight() >= layoutChat.getHeight() - 8;
        if (streamView == null) {
            removePlaceholder();
            streamView = new TextView(this);
            MessageFormatter.styleView(streamView, "model");
            streamView.setLongClickable(false);
            layoutChat.addView(streamView);
        }
        streamView.setText(text.length() > 0
                ? MessageFormatter.format(this, "model", model, text, System.currentTimeMillis(), null)
                : MessageFormatter.formatThinking(this, model, thoughts));
        if (atBottom) scrollChatDown();
    }

    private void removeStreaming() {
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
        MessageFormatter.applyPrefs(this);
        renderedTextSp = MessageFormatter.TEXT_SP;
        setContentView(R.layout.main);
        etInput = (EditText) findViewById(R.id.et_input);
        btnSend = (Button) findViewById(R.id.btn_send);
        btnStop = (Button) findViewById(R.id.btn_stop);
        layoutChat = (LinearLayout) findViewById(R.id.layout_chat);
        scrollChat = (ScrollView) findViewById(R.id.scroll_chat);
        dbHelper = new DatabaseHelper(this);
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
                    String part = t.partialText.trim();
                    cancelTask();
                    setUiLoading(false);
                    if (part.length() > 0) { // keep what was written so far
                        String text = part + "\n\n*[Stopped]*";
                        String th = t.includeThoughts ? t.partialThoughts.trim() : "";
                        long id = dbHelper.addMessage(t.currentChatId, "model", text, t.usedModel, th);
                        addMessageToChat(id, "model", t.usedModel, text, System.currentTimeMillis(), th);
                    } else {
                        addMessageToChat(-1L, "system", null, "Request stopped by user.", System.currentTimeMillis());
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
        if (MessageFormatter.TEXT_SP != renderedTextSp) {
            renderedTextSp = MessageFormatter.TEXT_SP;
            if (chatId != -1 && currentTask == null) loadMessages(true);
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        stopReading(); // no audio from a screen that isn't shown
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        stopReading();
        cancelTask();
        if (dbHelper != null) dbHelper.close();
    }

    private void cancelTask() {
        removeStreaming();
        GeminiTask t = currentTask;
        if (t != null) {
            t.cancel(true);
            t.disconnect();
            currentTask = null;
        }
    }

    private boolean canSend() {
        return etInput.getText().toString().trim().length() > 0 || pendingImage != null;
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

    private void send() {
        hideKeyboard(etInput);
        String text = etInput.getText().toString().trim();
        if (prefs().getString("api_key", "").trim().length() == 0) {
            Toast.makeText(this, "Please go to Settings to set API Key", Toast.LENGTH_LONG).show();
            return;
        }
        if (text.length() == 0 && pendingImage == null) return;
        if (chatId == -1) {
            String title = text.length() == 0 ? "Image" : text.replace('\n', ' ').trim();
            if (title.length() > 25) title = title.substring(0, 25) + "...";
            chatId = dbHelper.createChat(title);
            setTitle(title);
            layoutChat.removeAllViews();
        }
        removePlaceholder();
        String image = pendingImage;
        long id = dbHelper.addMessage(chatId, "user", text, image);
        addMessageToChat(id, "user", image, text, System.currentTimeMillis());
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
        cancelTask();
        currentTask = new GeminiTask(chatId);
        currentTask.execute(key, sp.getString("model", DEFAULT_MODEL), sp.getString("system_instruction", "").trim(),
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
        pendingImage = dataUri;
        if (dataUri == null) {
            attachBar.setVisibility(View.GONE);
            attachThumb.setImageDrawable(null);
        } else {
            Bitmap b = Thumbnail.fromDataUri(dataUri, dp(40));
            attachThumb.setImageBitmap(b);
            int comma = dataUri.indexOf(',');
            long bytes = (dataUri.length() - comma - 1) * 3L / 4;
            attachLabel.setText("Image attached (" + Math.max(1, (bytes + 512) / 1024) + " KB)");
            attachBar.setVisibility(View.VISIBLE);
        }
        if (currentTask == null) btnSend.setEnabled(canSend());
        Compat.invalidateMenu(this);
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
        String dataUri = ImageUtil.uriToBase64(this, uri);
        if (dataUri == null) {
            Toast.makeText(this, "Could not read that image (only images are supported).", Toast.LENGTH_LONG).show();
            return;
        }
        setAttachment(dataUri);
    }

    // =========================================================================================
    // Message list
    // =========================================================================================

    private void showPlaceholder() {
        TextView tv = new TextView(this);
        tv.setText("Start chatting\nType a message below to start.");
        tv.setTextSize(16f);
        tv.setTextColor(0xFF888888);
        tv.setGravity(Gravity.CENTER);
        tv.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.FILL_PARENT,
                LinearLayout.LayoutParams.FILL_PARENT, 1f));
        tv.setTag("placeholder");
        layoutChat.addView(tv);
    }

    private void removePlaceholder() {
        if (layoutChat.getChildCount() == 1 && "placeholder".equals(layoutChat.getChildAt(0).getTag())) {
            layoutChat.removeAllViews();
        }
    }

    private void addMessageToChat(long id, String role, String model, String text, long timestamp) {
        addMessageToChat(id, role, model, text, timestamp, null);
    }

    private void addMessageToChat(long id, String role, String model, String text, long timestamp, String thoughts) {
        TextView tv = new TextView(this);
        ArrayList<String> codeBlocks = new ArrayList<String>();
        tv.setText(MessageFormatter.format(this, role, model, text, timestamp, codeBlocks));
        MessageFormatter.styleView(tv, role);
        tv.setOnLongClickListener(new MessageMenu(id, role, model, text, codeBlocks, thoughts));
        layoutChat.addView(tv);
    }

    /** Re-renders the chat from the database. keepScroll: stay where the user was (edits, deletes). */
    private void loadMessages(boolean keepScroll) {
        final int y = scrollChat.getScrollY();
        layoutChat.removeAllViews();
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
                            iThoughts != -1 ? c.getString(iThoughts) : null);
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
        scrollChat.post(new Runnable() {
            public void run() {
                scrollChat.scrollTo(0, layoutChat.getMeasuredHeight());
            }
        });
    }

    /** Role of the newest saved user/model row ("user", "model") or null when there is none. */
    private String lastSavedRole() {
        if (chatId == -1) return null;
        String last = null;
        Cursor c = dbHelper.getMessages(chatId);
        if (c != null) {
            try {
                int iRole = c.getColumnIndex("role");
                while (c.moveToNext()) {
                    String r = c.getString(iRole);
                    if ("user".equals(r) || "model".equals(r)) last = r;
                }
            } finally {
                c.close();
            }
        }
        return last;
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
                    loadMessages(false); // drop the old error lines (they aren't saved)
                    startRequest();
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
                if (reader == r) reader = null;
                if (error != null && !isFinishing()) Toast.makeText(ChatActivity.this, error, Toast.LENGTH_LONG).show();
            }
        });
        reader.start();
        Toast.makeText(this, "Reading aloud (" + voice + ")...", Toast.LENGTH_SHORT).show();
    }

    private void stopReading() {
        ReadAloud r = reader;
        reader = null;
        if (r != null) r.stopReading();
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
     * User message: drop everything after it and ask again.
     * Reply: drop it (and everything after it) and ask again from the messages before it.
     */
    private void regenerate(long msgId, String role) {
        if ("user".equals(role)) dbHelper.deleteMessagesAfter(chatId, msgId);
        else dbHelper.deleteMessagesFrom(chatId, msgId);
        if (lastSavedRole() == null) {
            loadMessages(false);
            Toast.makeText(this, "Nothing left to answer.", Toast.LENGTH_SHORT).show();
            return;
        }
        loadMessages(false);
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
                    dbHelper.updateMessage(msgId, s);
                    dbHelper.deleteMessagesAfter(chatId, msgId);
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
            boolean has = false;
            if (chatId != -1 && dbHelper != null) {
                Cursor c = dbHelper.getMessages(chatId);
                if (c != null) {
                    try {
                        has = c.getCount() > 0;
                    } finally {
                        c.close();
                    }
                }
            }
            del.setVisible(has);
        }
        MenuItem attach = menu.findItem(MENU_ATTACH);
        if (attach != null) {
            attach.setVisible(Build.VERSION.SDK_INT < 19 || Environment.MEDIA_MOUNTED.equals(Environment.getExternalStorageState()));
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
