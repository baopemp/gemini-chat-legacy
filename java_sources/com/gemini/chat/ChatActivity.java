package com.gemini.chat;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.text.ClipboardManager;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
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
import com.gemini.chat.AutoNamer;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public class ChatActivity extends Activity {
    static final String API = "https://generativelanguage.googleapis.com/v1beta/models/";
    private static final int A_COPY = 0;
    private static final int A_COPY_CODE = 1;
    private static final int A_DELETE = 5;
    private static final int A_EDIT = 3;
    private static final int A_REGEN = 4;
    private static final int A_RETRY = 6;
    private static final int A_SHARE = 2;
    private static final int A_THOUGHTS = 7;
    static final String DEFAULT_MODEL = "gemini-3.5-flash-lite";
    private static final String HINT_IDLE = "Message Gemini...";
    private static final int MENU_ATTACH = 3;
    private static final int MENU_DELETE_CHAT = 2;
    private static final int MENU_DETACH = 4;
    private static final int MENU_LIVE = 5;
    private static final int MENU_RENAME = 6;
    private static final int MENU_SETTINGS = 1;
    static final String PREFS = "GeminiPrefs";
    private static final int REQ_IMAGE = 100;
    private static final int REQ_LIVE = 101;
    static final String TITLE_MODEL = "gemini-3.5-flash-lite";
    private LinearLayout attachBar;
    private TextView attachLabel;
    private ImageView attachThumb;
    private Button btnSend;
    private Button btnStop;
    private long chatId = -1;
    private GeminiTask currentTask = null;
    private DatabaseHelper dbHelper;
    private EditText etInput;
    private LinearLayout layoutChat;
    private String pendingImage;
    private float renderedTextSp;
    private ScrollView scrollChat;
    private TextView streamView;

    static String readAll(InputStream inputStream) throws IOException {
        if (inputStream == null) {
            return "";
        }
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        try {
            StringBuffer stringBuffer = new StringBuffer();
            char[] cArr = new char[2048];
            while (true) {
                int read = bufferedReader.read(cArr);
                if (read == -1) {
                    return stringBuffer.toString();
                }
                stringBuffer.append(cArr, A_COPY, read);
            }
        } finally {
            bufferedReader.close();
        }
    }

    static JSONObject toInlineData(String str) throws JSONException {
        int indexOf = str.indexOf(59);
        int indexOf2 = str.indexOf(44);
        if (indexOf <= 5 || indexOf2 <= indexOf) {
            return null;
        }
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("mimeType", str.substring(5, indexOf));
        jSONObject.put("data", str.substring(indexOf2 + 1));
        JSONObject jSONObject2 = new JSONObject();
        jSONObject2.put("inlineData", jSONObject);
        return jSONObject2;
    }

    static boolean retryable(int i) {
        return i == 500 || i == 502 || i == 503 || i == 504;
    }

    private class GeminiTask extends AsyncTask<String, Object, String> {
        private static final int MAX_RETRIES = 2;
        private long currentChatId;
        private boolean includeThoughts;
        private long lastProgress;
        private String streamError;
        private String thinkingLevel;
        private String usedModel = "";
        private HttpURLConnection conn = null;
        private boolean failed = false;
        private int lastCode = ChatActivity.A_COPY;
        private String thoughts = "";
        volatile String partialText = "";
        volatile String partialThoughts = "";

        GeminiTask(long j) {
            this.currentChatId = j;
        }

        private String fail(String str) {
            this.failed = true;
            return str;
        }

        private String buildBody(String str) throws Exception {
            int i;
            String string;
            JSONObject jSONObject = new JSONObject();
            if (str != null && str.trim().length() != 0) {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("text", str);
                JSONArray jSONArray = new JSONArray();
                jSONArray.put(jSONObject2);
                JSONObject jSONObject3 = new JSONObject();
                jSONObject3.put("parts", jSONArray);
                jSONObject.put("systemInstruction", jSONObject3);
            }
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            ArrayList arrayList3 = new ArrayList();
            Cursor messages = ChatActivity.this.dbHelper.getMessages(this.currentChatId);
            if (messages != null) {
                try {
                    int columnIndex = messages.getColumnIndex("role");
                    int columnIndex2 = messages.getColumnIndex("content");
                    int columnIndex3 = messages.getColumnIndex("model");
                    while (messages.moveToNext()) {
                        String string2 = messages.getString(columnIndex);
                        boolean equals = "user".equals(string2);
                        if (equals || "model".equals(string2)) {
                            String string3 = messages.getString(columnIndex2);
                            String str2 = string3 == null ? "" : string3;
                            JSONObject inlineData = (!equals || columnIndex3 < 0 || (string = messages.getString(columnIndex3)) == null || !string.startsWith("data:image/")) ? null : ChatActivity.toInlineData(string);
                            int size = arrayList.size() - 1;
                            if (size < 0 || !string2.equals(arrayList.get(size))) {
                                arrayList.add(string2);
                                arrayList2.add(new StringBuffer());
                                arrayList3.add(new ArrayList());
                                i = size + 1;
                            } else {
                                i = size;
                            }
                            StringBuffer stringBuffer = (StringBuffer) arrayList2.get(i);
                            if (str2.length() > 0) {
                                if (stringBuffer.length() > 0) {
                                    stringBuffer.append("\n\n");
                                }
                                stringBuffer.append(str2);
                            }
                            if (inlineData != null) {
                                ((ArrayList) arrayList3.get(i)).add(inlineData);
                            }
                        }
                    }
                } finally {
                    messages.close();
                }
            }
            JSONArray jSONArray2 = new JSONArray();
            for (int i2 = ChatActivity.A_COPY; i2 < arrayList.size(); i2++) {
                JSONArray jSONArray3 = new JSONArray();
                ArrayList arrayList4 = (ArrayList) arrayList3.get(i2);
                if (((StringBuffer) arrayList2.get(i2)).length() > 0 || arrayList4.isEmpty()) {
                    JSONObject jSONObject4 = new JSONObject();
                    jSONObject4.put("text", ((StringBuffer) arrayList2.get(i2)).toString());
                    jSONArray3.put(jSONObject4);
                }
                for (int i3 = ChatActivity.A_COPY; i3 < arrayList4.size(); i3++) {
                    jSONArray3.put(arrayList4.get(i3));
                }
                JSONObject jSONObject5 = new JSONObject();
                jSONObject5.put("role", arrayList.get(i2));
                jSONObject5.put("parts", jSONArray3);
                jSONArray2.put(jSONObject5);
            }
            jSONObject.put("contents", jSONArray2);
            if (this.thinkingLevel != null || this.includeThoughts) {
                JSONObject jSONObject6 = new JSONObject();
                if (this.thinkingLevel != null) {
                    jSONObject6.put("thinkingLevel", this.thinkingLevel);
                }
                if (this.includeThoughts) {
                    jSONObject6.put("includeThoughts", true);
                }
                jSONObject.put("generationConfig", new JSONObject().put("thinkingConfig", jSONObject6));
            }
            return jSONObject.toString();
        }

        private String parseError(int i, String str) {
            try {
                JSONObject optJSONObject = new JSONObject(str).optJSONObject("error");
                if (optJSONObject != null) {
                    String optString = optJSONObject.optString("message", "");
                    if (optString.length() != 0) {
                        str = optString;
                    }
                }
            } catch (Exception e) {
            }
            return fail("Error " + i + ": " + str);
        }

        private String parseResponse(String str) throws JSONException {
            ReplyParser replyParser = new ReplyParser();
            replyParser.feed(new JSONObject(str));
            return finish(replyParser);
        }

        private String finish(ReplyParser replyParser) {
            String error = replyParser.error();
            if (error != null) {
                return fail(error);
            }
            this.thoughts = this.includeThoughts ? replyParser.thoughtsForDisplay() : "";
            return replyParser.answer();
        }

        void disconnect() {
            HttpURLConnection httpURLConnection = this.conn;
            if (httpURLConnection != null) {
                try {
                    httpURLConnection.disconnect();
                } catch (Exception e) {
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public String doInBackground(String... strArr) {
            String trim = strArr[ChatActivity.A_COPY].trim();
            String str = strArr[1];
            this.usedModel = str;
            this.thinkingLevel = ReplyParser.levelFor(str, strArr.length > 3 ? strArr[3] : null);
            this.includeThoughts = (strArr.length <= 4 || !"1".equals(strArr[4])) ? ChatActivity.A_COPY : true;
            try {
                String buildBody = buildBody(TimeGrounding.apply(ChatActivity.this, strArr.length > 2 ? strArr[2] : ""));
                String str2 = null;
                for (int i = ChatActivity.A_COPY; i <= 2; i++) {
                    if (isCancelled()) {
                        return null;
                    }
                    if (i > 0) {
                        publishProgress(Integer.valueOf(i));
                        try {
                            Thread.sleep(2000 << (i - 1));
                            if (isCancelled()) {
                                return null;
                            }
                            this.failed = false;
                        } catch (InterruptedException e) {
                            return null;
                        }
                    }
                    str2 = request(trim, str, buildBody);
                    if (this.failed && this.lastCode == 400 && this.thinkingLevel != null && str2 != null && str2.toLowerCase().indexOf("thinking") >= 0) {
                        this.thinkingLevel = null;
                        this.failed = false;
                        try {
                            buildBody = buildBody(TimeGrounding.apply(ChatActivity.this, strArr.length > 2 ? strArr[2] : ""));
                            str2 = request(trim, str, buildBody);
                        } catch (Exception e2) {
                            return fail("Exception: " + e2.toString());
                        }
                    }
                    if (!this.failed || !ChatActivity.retryable(this.lastCode)) {
                        break;
                    }
                }
                return str2;
            } catch (Exception e3) {
                Log.e("Gemini", "buildBody failed", e3);
                return fail("Exception: " + e3.toString());
            }
        }

        /* JADX WARN: Code restructure failed: missing block: B:62:0x0138, code lost:
        
            if (r5.length() <= 0) goto L67;
         */
        /* JADX WARN: Code restructure failed: missing block: B:64:0x013c, code lost:
        
            if (r8.streamError != null) goto L67;
         */
        /* JADX WARN: Code restructure failed: missing block: B:65:0x013e, code lost:
        
            feedEvent(r4, r5.toString());
         */
        /* JADX WARN: Code restructure failed: missing block: B:67:0x0149, code lost:
        
            if (isCancelled() == false) goto L72;
         */
        /* JADX WARN: Code restructure failed: missing block: B:68:0x014b, code lost:
        
            if (r2 == null) goto L71;
         */
        /* JADX WARN: Code restructure failed: missing block: B:72:0x014d, code lost:
        
            r2.close();
         */
        /* JADX WARN: Code restructure failed: missing block: B:76:0x015a, code lost:
        
            if (r8.streamError == null) goto L78;
         */
        /* JADX WARN: Code restructure failed: missing block: B:77:0x015c, code lost:
        
            r0 = fail(r8.streamError);
         */
        /* JADX WARN: Code restructure failed: missing block: B:78:0x0162, code lost:
        
            if (r2 == null) goto L77;
         */
        /* JADX WARN: Code restructure failed: missing block: B:82:0x0164, code lost:
        
            r2.close();
         */
        /* JADX WARN: Code restructure failed: missing block: B:85:0x016e, code lost:
        
            r0 = finish(r4);
         */
        /* JADX WARN: Code restructure failed: missing block: B:86:0x0172, code lost:
        
            if (r2 == null) goto L81;
         */
        /* JADX WARN: Code restructure failed: missing block: B:90:0x0174, code lost:
        
            r2.close();
         */
        /* JADX WARN: Removed duplicated region for block: B:129:0x012b A[EXC_TOP_SPLITTER, SYNTHETIC] */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        private java.lang.String request(java.lang.String r9, java.lang.String r10, java.lang.String r11) {
            /*
                Method dump skipped, instructions count: 455
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.gemini.chat.ChatActivity.GeminiTask.request(java.lang.String, java.lang.String, java.lang.String):java.lang.String");
        }

        private void feedEvent(ReplyParser replyParser, String str) throws JSONException {
            JSONObject jSONObject = new JSONObject(str);
            JSONObject optJSONObject = jSONObject.optJSONObject("error");
            if (optJSONObject != null) {
                this.lastCode = optJSONObject.optInt("code", 500);
                this.streamError = "Error " + this.lastCode + ": " + optJSONObject.optString("message", "");
                return;
            }
            replyParser.feed(jSONObject);
            this.partialText = replyParser.text.toString();
            this.partialThoughts = replyParser.thoughts.toString();
            long currentTimeMillis = System.currentTimeMillis();
            if (currentTimeMillis - this.lastProgress >= 250) {
                this.lastProgress = currentTimeMillis;
                publishProgress(new String[]{replyParser.thoughts.toString(), replyParser.text.toString()});
            }
        }

        @Override // android.os.AsyncTask
        protected void onPreExecute() {
            ChatActivity.this.setUiLoading(true);
        }

        @Override // android.os.AsyncTask
        protected void onProgressUpdate(Object... objArr) {
            if (ChatActivity.this.currentTask == this) {
                if (objArr[ChatActivity.A_COPY] instanceof Integer) {
                    ChatActivity.this.removeStreaming();
                    ChatActivity.this.etInput.setHint("Model is busy (" + this.lastCode + "), retry " + objArr[ChatActivity.A_COPY] + "/2...");
                } else {
                    String[] strArr = (String[]) objArr[ChatActivity.A_COPY];
                    ChatActivity.this.showStreaming(this.usedModel, strArr[ChatActivity.A_COPY], strArr[1]);
                }
            }
        }

        @Override // android.os.AsyncTask
        protected void onCancelled() {
            if (ChatActivity.this.currentTask == this) {
                ChatActivity.this.currentTask = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(String str) {
            if (!isCancelled()) {
                ChatActivity.this.currentTask = null;
                ChatActivity.this.removeStreaming();
                ChatActivity.this.setUiLoading(false);
                if (str != null) {
                    if (this.failed) {
                        ChatActivity.this.addMessageToChat(-1L, "system", null, str, System.currentTimeMillis(), null);
                    } else {
                        ChatActivity.this.addMessageToChat(ChatActivity.this.dbHelper.addMessage(this.currentChatId, "model", str, this.usedModel, this.thoughts), "model", this.usedModel, str, System.currentTimeMillis(), this.thoughts);
                    }
                    Compat.invalidateMenu(ChatActivity.this);
                    ChatActivity.this.scrollChatDown();
                    if (!this.failed) {
                        ChatActivity.this.maybeAutoName();
                    }
                }
            }
        }
    }

    static String titleRequest(String str, String str2) throws JSONException {
        if (str.length() > 1500) {
            str = str.substring(A_COPY, 1500);
        }
        if (str2.length() > 1500) {
            str2 = str2.substring(A_COPY, 1500);
        }
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("contents", new JSONArray().put(new JSONObject().put("role", "user").put("parts", new JSONArray().put(new JSONObject().put("text", "Give this conversation a short title (2 to 6 words) in the language of the conversation. Reply with the title only: no quotes, no markdown, no final period.\n\nUser: " + str + "\n\nAssistant: " + str2)))));
        jSONObject.put("generationConfig", new JSONObject().put("maxOutputTokens", 300).put("thinkingConfig", new JSONObject().put("thinkingLevel", "minimal")));
        return jSONObject.toString();
    }

    static String cleanTitle(String str) {
        if (str == null) {
            return null;
        }
        String trim = str.trim();
        int indexOf = trim.indexOf(10);
        if (indexOf >= 0) {
            trim = trim.substring(A_COPY, indexOf).trim();
        }
        if (trim.startsWith("Title:") || trim.startsWith("title:")) {
            trim = trim.substring(6).trim();
        }
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = A_COPY; i < trim.length(); i++) {
            char charAt = trim.charAt(i);
            if (charAt != '*' && charAt != '#' && charAt != '`' && charAt != '\"' && charAt != 8220 && charAt != 8221) {
                stringBuffer.append(charAt);
            }
        }
        String trim2 = stringBuffer.toString().trim();
        while (true) {
            if (!trim2.endsWith(".") && !trim2.endsWith(":")) {
                break;
            }
            trim2 = trim2.substring(A_COPY, trim2.length() - 1).trim();
        }
        if (trim2.length() == 0) {
            return null;
        }
        return trim2.length() > 40 ? trim2.substring(A_COPY, 40).trim() + "..." : trim2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void maybeAutoName() {
        AutoNamer.maybeStart(this, this.dbHelper, this.chatId, new AutoNamer.Callback() { // from class: com.gemini.chat.ChatActivity.1
            @Override // com.gemini.chat.AutoNamer.Callback
            public void onNamed(long j, String str) {
                if (j == ChatActivity.this.chatId) {
                    ChatActivity.this.setTitle(str);
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showStreaming(String str, String str2, String str3) {
        CharSequence formatThinking;
        boolean z = this.scrollChat.getScrollY() + this.scrollChat.getHeight() >= this.layoutChat.getHeight() + (-8) ? true : A_COPY;
        if (this.streamView == null) {
            removePlaceholder();
            this.streamView = new TextView(this);
            MessageFormatter.styleView(this.streamView, "model");
            this.streamView.setLongClickable(false);
            this.layoutChat.addView(this.streamView);
        }
        TextView textView = this.streamView;
        if (str3.length() > 0) {
            formatThinking = MessageFormatter.format(this, "model", str, str3, System.currentTimeMillis(), null);
        } else {
            formatThinking = MessageFormatter.formatThinking(this, str, str2);
        }
        textView.setText(formatThinking);
        if (z) {
            scrollChatDown();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void removeStreaming() {
        if (this.streamView != null) {
            this.layoutChat.removeView(this.streamView);
            this.streamView = null;
        }
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        MessageFormatter.applyPrefs(this);
        this.renderedTextSp = MessageFormatter.TEXT_SP;
        setContentView(R.layout.main);
        this.etInput = (EditText) findViewById(R.id.et_input);
        this.btnSend = (Button) findViewById(R.id.btn_send);
        this.btnStop = (Button) findViewById(R.id.btn_stop);
        this.layoutChat = (LinearLayout) findViewById(R.id.layout_chat);
        this.scrollChat = (ScrollView) findViewById(R.id.scroll_chat);
        this.dbHelper = new DatabaseHelper(this);
        buildAttachBar();
        this.chatId = getIntent().getLongExtra("chat_id", -1L);
        if (this.chatId != -1) {
            setTitle(this.dbHelper.getChatTitle(this.chatId));
            loadMessages(false);
        } else {
            setTitle("New chat");
            showPlaceholder();
        }
        this.etInput.addTextChangedListener(new TextWatcher() { // from class: com.gemini.chat.ChatActivity.2
            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable editable) {
                if (ChatActivity.this.currentTask == null) {
                    ChatActivity.this.btnSend.setEnabled(ChatActivity.this.canSend());
                }
            }

            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            }
        });
        this.btnSend.setOnClickListener(new View.OnClickListener() { // from class: com.gemini.chat.ChatActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ChatActivity.this.send();
            }
        });
        this.btnStop.setOnClickListener(new View.OnClickListener() { // from class: com.gemini.chat.ChatActivity.4
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                GeminiTask geminiTask = ChatActivity.this.currentTask;
                if (geminiTask != null) {
                    String trim = geminiTask.partialText.trim();
                    ChatActivity.this.cancelTask();
                    ChatActivity.this.setUiLoading(false);
                    if (trim.length() <= 0) {
                        ChatActivity.this.addMessageToChat(-1L, "system", null, "Request stopped by user.", System.currentTimeMillis());
                    } else {
                        String str = trim + "\n\n*[Stopped]*";
                        String trim2 = geminiTask.includeThoughts ? geminiTask.partialThoughts.trim() : "";
                        ChatActivity.this.addMessageToChat(ChatActivity.this.dbHelper.addMessage(geminiTask.currentChatId, "model", str, geminiTask.usedModel, trim2), "model", geminiTask.usedModel, str, System.currentTimeMillis(), trim2);
                    }
                    ChatActivity.this.scrollChatDown();
                }
            }
        });
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        MessageFormatter.applyPrefs(this);
        if (MessageFormatter.TEXT_SP != this.renderedTextSp) {
            this.renderedTextSp = MessageFormatter.TEXT_SP;
            if (this.chatId == -1 || this.currentTask != null) {
                return;
            }
            loadMessages(true);
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        cancelTask();
        if (this.dbHelper != null) {
            this.dbHelper.close();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cancelTask() {
        removeStreaming();
        GeminiTask geminiTask = this.currentTask;
        if (geminiTask != null) {
            geminiTask.cancel(true);
            geminiTask.disconnect();
            this.currentTask = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean canSend() {
        return this.etInput.getText().toString().trim().length() > 0 || this.pendingImage != null;
    }

    private SharedPreferences prefs() {
        return getSharedPreferences(PREFS, A_COPY);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideKeyboard(View view) {
        InputMethodManager inputMethodManager = (InputMethodManager) getSystemService("input_method");
        if (inputMethodManager != null) {
            inputMethodManager.hideSoftInputFromWindow(view.getWindowToken(), A_COPY);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void send() {
        hideKeyboard(this.etInput);
        String trim = this.etInput.getText().toString().trim();
        if (prefs().getString("api_key", "").trim().length() == 0) {
            Toast.makeText(this, "Please go to Settings to set API Key", 1).show();
            return;
        }
        if (trim.length() != 0 || this.pendingImage != null) {
            if (this.chatId == -1) {
                String trim2 = trim.length() == 0 ? "Image" : trim.replace('\n', ' ').trim();
                if (trim2.length() > 25) {
                    trim2 = trim2.substring(A_COPY, 25) + "...";
                }
                this.chatId = this.dbHelper.createChat(trim2);
                setTitle(trim2);
                this.layoutChat.removeAllViews();
            }
            removePlaceholder();
            String str = this.pendingImage;
            addMessageToChat(this.dbHelper.addMessage(this.chatId, "user", trim, str), "user", str, trim, System.currentTimeMillis());
            setAttachment(null);
            this.etInput.setText("");
            scrollChatDown();
            startRequest();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startRequest() {
        SharedPreferences prefs = prefs();
        String trim = prefs.getString("api_key", "").trim();
        if (trim.length() == 0) {
            Toast.makeText(this, "Please go to Settings to set API Key", 1).show();
            return;
        }
        cancelTask();
        this.currentTask = new GeminiTask(this.chatId);
        GeminiTask geminiTask = this.currentTask;
        String[] strArr = new String[5];
        strArr[A_COPY] = trim;
        strArr[1] = prefs.getString("model", "gemini-3.5-flash-lite");
        strArr[2] = prefs.getString("system_instruction", "").trim();
        strArr[3] = prefs.getString("thinking_level", "");
        strArr[4] = prefs.getBoolean("show_thoughts", true) ? "1" : "0";
        geminiTask.execute(strArr);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setUiLoading(boolean z) {
        this.etInput.setEnabled(!z ? true : A_COPY);
        if (z) {
            this.etInput.setHint("Model is generating...");
            this.btnSend.setVisibility(8);
            this.btnStop.setVisibility(A_COPY);
        } else {
            this.etInput.setHint(HINT_IDLE);
            this.btnStop.setVisibility(8);
            this.btnSend.setVisibility(A_COPY);
            this.btnSend.setEnabled(canSend());
        }
    }

    private int dp(float f) {
        return (int) ((getResources().getDisplayMetrics().density * f) + 0.5f);
    }

    private void buildAttachBar() {
        this.attachBar = new LinearLayout(this);
        this.attachBar.setOrientation(A_COPY);
        this.attachBar.setGravity(16);
        this.attachBar.setPadding(dp(6.0f), dp(4.0f), dp(2.0f), A_COPY);
        this.attachBar.setVisibility(8);
        this.attachThumb = new ImageView(this);
        this.attachThumb.setScaleType(ImageView.ScaleType.CENTER_CROP);
        this.attachBar.addView(this.attachThumb, new LinearLayout.LayoutParams(dp(40.0f), dp(40.0f)));
        this.attachLabel = new TextView(this);
        this.attachLabel.setTextSize(14.0f);
        this.attachLabel.setPadding(dp(8.0f), A_COPY, dp(4.0f), A_COPY);
        this.attachLabel.setSingleLine(true);
        this.attachBar.addView(this.attachLabel, new LinearLayout.LayoutParams(A_COPY, -2, 1.0f));
        Button button = new Button(this, null, android.R.attr.buttonStyleSmall);
        button.setText("Remove");
        button.setOnClickListener(new View.OnClickListener() { // from class: com.gemini.chat.ChatActivity.5
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ChatActivity.this.setAttachment(null);
            }
        });
        this.attachBar.addView(button, new LinearLayout.LayoutParams(-2, -2));
        View.OnClickListener onClickListener = new View.OnClickListener() { // from class: com.gemini.chat.ChatActivity.6
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ChatActivity.this.pickImage();
            }
        };
        this.attachThumb.setOnClickListener(onClickListener);
        this.attachLabel.setOnClickListener(onClickListener);
        ((LinearLayout) this.scrollChat.getParent()).addView(this.attachBar, r0.getChildCount() - 1, new LinearLayout.LayoutParams(-1, -2));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAttachment(String str) {
        this.pendingImage = str;
        if (str == null) {
            this.attachBar.setVisibility(8);
            this.attachThumb.setImageDrawable(null);
        } else {
            this.attachThumb.setImageBitmap(Thumbnail.fromDataUri(str, dp(40.0f)));
            this.attachLabel.setText("Image attached (" + Math.max(1L, (((((str.length() - str.indexOf(44)) - 1) * 3) / 4) + 512) / 1024) + " KB)");
            this.attachBar.setVisibility(A_COPY);
        }
        if (this.currentTask == null) {
            this.btnSend.setEnabled(canSend());
        }
        Compat.invalidateMenu(this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void pickImage() {
        Intent intent = new Intent(Build.VERSION.SDK_INT >= 19 ? "android.intent.action.OPEN_DOCUMENT" : "android.intent.action.GET_CONTENT");
        intent.setType("image/*");
        intent.addCategory("android.intent.category.OPENABLE");
        try {
            startActivityForResult(intent, REQ_IMAGE);
        } catch (Exception e) {
            Toast.makeText(this, "No app available to pick an image.", 1).show();
        }
    }

    @Override // android.app.Activity
    protected void onActivityResult(int i, int i2, Intent intent) {
        String dataString;
        super.onActivityResult(i, i2, intent);
        if (i == REQ_LIVE) {
            long longExtra = intent != null ? intent.getLongExtra("chat_id", -1L) : -1L;
            if (this.chatId == -1 && longExtra != -1) {
                this.chatId = longExtra;
            }
            if (this.chatId != -1) {
                setTitle(this.dbHelper.getChatTitle(this.chatId));
                loadMessages(false);
                maybeAutoName();
                return;
            }
            return;
        }
        if (i == REQ_IMAGE && i2 == -1 && intent != null && (dataString = intent.getDataString()) != null) {
            String uriToBase64 = ImageUtil.uriToBase64(this, dataString);
            if (uriToBase64 == null) {
                Toast.makeText(this, "Could not read that image (only images are supported).", 1).show();
            } else {
                setAttachment(uriToBase64);
            }
        }
    }

    private void showPlaceholder() {
        TextView textView = new TextView(this);
        textView.setText("Start chatting\nType a message below to start.");
        textView.setTextSize(16.0f);
        textView.setTextColor(-7829368);
        textView.setGravity(17);
        textView.setLayoutParams(new LinearLayout.LayoutParams(-1, -1, 1.0f));
        textView.setTag("placeholder");
        this.layoutChat.addView(textView);
    }

    private void removePlaceholder() {
        if (this.layoutChat.getChildCount() == 1 && "placeholder".equals(this.layoutChat.getChildAt(A_COPY).getTag())) {
            this.layoutChat.removeAllViews();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addMessageToChat(long j, String str, String str2, String str3, long j2) {
        addMessageToChat(j, str, str2, str3, j2, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addMessageToChat(long j, String str, String str2, String str3, long j2, String str4) {
        TextView textView = new TextView(this);
        ArrayList arrayList = new ArrayList();
        textView.setText(MessageFormatter.format(this, str, str2, str3, j2, arrayList));
        MessageFormatter.styleView(textView, str);
        textView.setOnLongClickListener(new MessageMenu(j, str, str2, str3, arrayList, str4));
        this.layoutChat.addView(textView);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x00ca  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00c6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void loadMessages(boolean r21) {
        /*
            Method dump skipped, instructions count: 224
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.gemini.chat.ChatActivity.loadMessages(boolean):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void scrollChatDown() {
        this.scrollChat.post(new Runnable() { // from class: com.gemini.chat.ChatActivity.8
            @Override // java.lang.Runnable
            public void run() {
                ChatActivity.this.scrollChat.scrollTo(ChatActivity.A_COPY, ChatActivity.this.layoutChat.getMeasuredHeight());
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String lastSavedRole() {
        Cursor messages;
        String str = null;
        if (this.chatId != -1 && (messages = this.dbHelper.getMessages(this.chatId)) != null) {
            try {
                int columnIndex = messages.getColumnIndex("role");
                while (messages.moveToNext()) {
                    String string = messages.getString(columnIndex);
                    if ("user".equals(string) || "model".equals(string)) {
                        str = string;
                    }
                }
            } finally {
                messages.close();
            }
        }
        return str;
    }

    private final class MessageMenu implements View.OnLongClickListener, DialogInterface.OnClickListener {
        int[] actions;
        final ArrayList<String> codeBlocks;
        final long id;
        ArrayList<String> labels;
        final String model;
        final String role;
        final String text;
        final String thoughts;

        MessageMenu(long j, String str, String str2, String str3, ArrayList<String> arrayList, String str4) {
            this.id = j;
            this.thoughts = str4 == null ? "" : str4;
            this.role = str;
            this.model = str2;
            this.text = str3 == null ? "" : str3;
            this.codeBlocks = arrayList;
        }

        private void add(String str, int i) {
            this.labels.add(str);
            this.actions[this.labels.size() - 1] = i;
        }

        @Override // android.view.View.OnLongClickListener
        public boolean onLongClick(View view) {
            this.labels = new ArrayList<>();
            this.actions = new int[this.codeBlocks.size() + 9];
            boolean z = this.id != -1 ? true : ChatActivity.A_COPY;
            boolean equals = "user".equals(this.role);
            boolean equals2 = "model".equals(this.role);
            if (this.thoughts.length() > 0) {
                add("Show Thought Process", 7);
            }
            add("Copy Entire Message", ChatActivity.A_COPY);
            for (int i = ChatActivity.A_COPY; i < this.codeBlocks.size(); i++) {
                add("Copy Code Block " + (i + 1), 1);
            }
            if (z && equals) {
                add("Regenerate", 4);
                add("Edit Message", 3);
            } else if (z && equals2) {
                add("Edit Message", 3);
                add("Regenerate", 4);
            }
            if (!equals) {
                add("Share Message", 2);
            }
            if (!z && ChatActivity.this.currentTask == null && "user".equals(ChatActivity.this.lastSavedRole())) {
                add("Retry", 6);
            }
            if (z) {
                add("Delete Message", 5);
            }
            new AlertDialog.Builder(ChatActivity.this).setTitle("Message Options").setItems((CharSequence[]) this.labels.toArray(new String[this.labels.size()]), this).show();
            return true;
        }

        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface dialogInterface, int i) {
            switch (this.actions[i]) {
                case ChatActivity.A_COPY /* 0 */:
                    ChatActivity.this.copy(this.text, "Copied to clipboard");
                    break;
                case Markdown.BOLD /* 1 */:
                    ChatActivity.this.copy(this.codeBlocks.get(i - 1), "Code block copied");
                    break;
                case Markdown.ITALIC /* 2 */:
                    Intent intent = new Intent("android.intent.action.SEND");
                    intent.setType("text/plain");
                    intent.putExtra("android.intent.extra.TEXT", this.text);
                    ChatActivity.this.startActivity(Intent.createChooser(intent, "Share Message"));
                    break;
                case Markdown.BOLD_ITALIC /* 3 */:
                    ChatActivity.this.showEditDialog(this.id, this.role, this.model, this.text);
                    break;
                case Markdown.STRIKE /* 4 */:
                    ChatActivity.this.regenerate(this.id, this.role);
                    break;
                case Markdown.CODE /* 5 */:
                    ChatActivity.this.confirmDelete(this.id);
                    break;
                case Markdown.LINK /* 6 */:
                    ChatActivity.this.loadMessages(false);
                    ChatActivity.this.startRequest();
                    break;
                case 7:
                    ChatActivity.this.showThoughts(this.model, this.thoughts);
                    break;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showThoughts(String str, final String str2) {
        ScrollView scrollView = new ScrollView(this);
        TextView textView = new TextView(this);
        textView.setText(MessageFormatter.formatBody(this, str2));
        MessageFormatter.styleView(textView, "model");
        textView.setLongClickable(false);
        scrollView.addView(textView);
        new AlertDialog.Builder(this).setTitle("Thought Process" + ((str == null || str.length() <= 0) ? "" : " (" + str + ")")).setView(scrollView).setPositiveButton("Close", (DialogInterface.OnClickListener) null).setNeutralButton("Copy", new DialogInterface.OnClickListener() { // from class: com.gemini.chat.ChatActivity.9
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                ChatActivity.this.copy(str2, "Thoughts copied");
            }
        }).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void copy(String str, String str2) {
        ((ClipboardManager) getSystemService("clipboard")).setText(str);
        Toast.makeText(this, str2, A_COPY).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void regenerate(long j, String str) {
        if ("user".equals(str)) {
            this.dbHelper.deleteMessagesAfter(this.chatId, j);
        } else {
            this.dbHelper.deleteMessagesFrom(this.chatId, j);
        }
        if (lastSavedRole() == null) {
            loadMessages(false);
            Toast.makeText(this, "Nothing left to answer.", A_COPY).show();
        } else {
            loadMessages(false);
            startRequest();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void confirmDelete(final long j) {
        new AlertDialog.Builder(this).setTitle("Delete Message").setMessage("Delete this message? Later messages are kept.").setPositiveButton("Delete", new DialogInterface.OnClickListener() { // from class: com.gemini.chat.ChatActivity.10
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                ChatActivity.this.dbHelper.deleteMessage(j);
                ChatActivity.this.loadMessages(true);
            }
        }).setNegativeButton("Cancel", (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showEditDialog(final long j, String str, String str2, String str3) {
        boolean equals = "user".equals(str);
        final boolean z = equals && str2 != null && str2.startsWith("data:image/");
        final EditText editText = new EditText(this);
        editText.setText(str3);
        editText.setSelection(editText.getText().length());
        editText.setGravity(48);
        editText.setMaxLines(Math.max(3, (int) ((getResources().getDisplayMetrics().heightPixels * 0.4f) / Math.max(1, editText.getLineHeight()))));
        editText.setVerticalScrollBarEnabled(true);
        AlertDialog.Builder view = new AlertDialog.Builder(this).setTitle(equals ? "Edit Message" : "Edit Reply").setView(editText);
        if (equals) {
            view.setPositiveButton("Resend", new DialogInterface.OnClickListener() { // from class: com.gemini.chat.ChatActivity.11
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i) {
                    ChatActivity.this.hideKeyboard(editText);
                    String trim = editText.getText().toString().trim();
                    if (trim.length() != 0 || z) {
                        ChatActivity.this.dbHelper.updateMessage(j, trim);
                        ChatActivity.this.dbHelper.deleteMessagesAfter(ChatActivity.this.chatId, j);
                        ChatActivity.this.loadMessages(false);
                        ChatActivity.this.startRequest();
                    }
                }
            });
            view.setNeutralButton("Save", new DialogInterface.OnClickListener() { // from class: com.gemini.chat.ChatActivity.12
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i) {
                    ChatActivity.this.hideKeyboard(editText);
                    String trim = editText.getText().toString().trim();
                    if (trim.length() != 0 || z) {
                        ChatActivity.this.dbHelper.updateMessage(j, trim);
                        ChatActivity.this.loadMessages(true);
                    }
                }
            });
        } else {
            view.setPositiveButton("Save", new DialogInterface.OnClickListener() { // from class: com.gemini.chat.ChatActivity.13
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i) {
                    ChatActivity.this.hideKeyboard(editText);
                    String editable = editText.getText().toString();
                    if (editable.trim().length() != 0) {
                        ChatActivity.this.dbHelper.updateMessage(j, editable);
                        ChatActivity.this.loadMessages(true);
                    } else {
                        Toast.makeText(ChatActivity.this, "Empty reply not saved. Use Delete Message instead.", 1).show();
                    }
                }
            });
        }
        view.setNegativeButton("Cancel", (DialogInterface.OnClickListener) null);
        view.show();
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        int identifier = getResources().getIdentifier("ic_menu_live", "drawable", getPackageName());
        MenuItem add = menu.add(A_COPY, 5, A_COPY, "Live Voice");
        if (identifier == 0) {
            identifier = android.R.drawable.ic_btn_speak_now;
        }
        add.setIcon(identifier);
        menu.add(A_COPY, 6, A_COPY, "Rename Chat").setIcon(android.R.drawable.ic_menu_edit);
        menu.add(A_COPY, 1, A_COPY, "Settings").setIcon(android.R.drawable.ic_menu_preferences);
        menu.add(A_COPY, 2, A_COPY, "Delete This Chat").setIcon(android.R.drawable.ic_menu_delete);
        if (Build.VERSION.SDK_INT >= 8) {
            menu.add(A_COPY, 3, A_COPY, "Attach Image").setIcon(android.R.drawable.ic_menu_add);
            menu.add(A_COPY, 4, A_COPY, "Remove Image").setIcon(android.R.drawable.ic_menu_close_clear_cancel);
        }
        return true;
    }

    @Override // android.app.Activity
    public boolean onPrepareOptionsMenu(Menu menu) {
        boolean z;
        Cursor messages;
        MenuItem findItem = menu.findItem(6);
        if (findItem != null) {
            findItem.setVisible(this.chatId != -1 ? true : A_COPY);
        }
        MenuItem findItem2 = menu.findItem(2);
        if (findItem2 != null) {
            if (this.chatId == -1 || this.dbHelper == null || (messages = this.dbHelper.getMessages(this.chatId)) == null) {
                z = A_COPY;
            } else {
                try {
                    z = messages.getCount() > 0 ? true : A_COPY;
                } finally {
                    messages.close();
                }
            }
            findItem2.setVisible(z);
        }
        MenuItem findItem3 = menu.findItem(3);
        if (findItem3 != null) {
            findItem3.setVisible((Build.VERSION.SDK_INT < 19 || "mounted".equals(Environment.getExternalStorageState())) ? true : A_COPY);
            findItem3.setTitle(this.pendingImage == null ? "Attach Image" : "Change Image");
        }
        MenuItem findItem4 = menu.findItem(4);
        if (findItem4 != null) {
            findItem4.setVisible(this.pendingImage == null ? A_COPY : true);
        }
        return super.onPrepareOptionsMenu(menu);
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case Markdown.BOLD /* 1 */:
                startActivity(new Intent(this, (Class<?>) SettingsActivity.class));
                return true;
            case Markdown.ITALIC /* 2 */:
                if (this.chatId == -1) {
                    finish();
                    return true;
                }
                new AlertDialog.Builder(this).setTitle("Delete Chat").setMessage("Are you sure you want to delete this chat?").setPositiveButton("Delete", new DialogInterface.OnClickListener() { // from class: com.gemini.chat.ChatActivity.14
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialogInterface, int i) {
                        ChatActivity.this.dbHelper.deleteChat(ChatActivity.this.chatId);
                        ChatActivity.this.finish();
                    }
                }).setNegativeButton("Cancel", (DialogInterface.OnClickListener) null).show();
                return true;
            case Markdown.BOLD_ITALIC /* 3 */:
                pickImage();
                return true;
            case Markdown.STRIKE /* 4 */:
                setAttachment(null);
                return true;
            case Markdown.CODE /* 5 */:
                cancelTask();
                setUiLoading(false);
                Intent intent = new Intent(this, (Class<?>) LiveActivity.class);
                intent.putExtra("chat_id", this.chatId);
                startActivityForResult(intent, REQ_LIVE);
                return true;
            case Markdown.LINK /* 6 */:
                final EditText editText = new EditText(this);
                editText.setSingleLine(true);
                editText.setText(this.dbHelper.getChatTitle(this.chatId));
                editText.setSelection(editText.getText().length());
                new AlertDialog.Builder(this).setTitle("Rename Chat").setView(editText).setPositiveButton("Save", new DialogInterface.OnClickListener() { // from class: com.gemini.chat.ChatActivity.15
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialogInterface, int i) {
                        ChatActivity.this.hideKeyboard(editText);
                        String trim = editText.getText().toString().trim();
                        if (trim.length() != 0) {
                            ChatActivity.this.dbHelper.updateChatTitle(ChatActivity.this.chatId, trim);
                            ChatActivity.this.setTitle(trim);
                        }
                    }
                }).setNegativeButton("Cancel", (DialogInterface.OnClickListener) null).show();
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }
}
