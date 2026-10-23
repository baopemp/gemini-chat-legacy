package com.gemini.chat;

import java.util.LinkedList;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class LiveSession implements Runnable {
    private static final int OUTBOX_MAX = 200;
    public static final int OUTPUT_RATE = 24000;
    public static final String TRANSCRIBE_MODEL = "gemini-3.5-transcribe-live";
    public static final String URL = "wss://generativelanguage.googleapis.com/ws/google.ai.generativelanguage.v1beta.GenerativeService.BidiGenerateContent";
    public final String apiKey;
    public volatile boolean goAway;
    public final boolean handsFree;
    public String[][] history;
    public volatile String lastHandle;
    private final Listener listener;
    public final String model;
    private volatile boolean ready;
    public String resumeHandle;
    private volatile boolean stopped;
    public final String systemText;
    public String thinkingLevel;
    public boolean transcribeOnly;
    public final String voice;
    public String url = URL;
    private final LiveSocket ws = new LiveSocket();
    private final LinkedList<String> outbox = new LinkedList<>();

    public interface Listener {
        void onAudio(byte[] bArr);

        void onClosed(String str);

        void onInputText(String str);

        void onInterimInput(String str);

        void onInterrupted();

        void onOutputText(String str);

        void onReady();

        void onTurnComplete();
    }

    public static LiveSession transcriber(String str, boolean z, Listener listener) {
        LiveSession liveSession = new LiveSession(str, TRANSCRIBE_MODEL, null, null, z, listener);
        liveSession.transcribeOnly = true;
        return liveSession;
    }

    public static boolean needsThinkingLevel(String str) {
        return str != null && str.indexOf("extended-thinking") >= 0;
    }

    public LiveSession(String str, String str2, String str3, String str4, boolean z, Listener listener) {
        this.apiKey = str;
        this.model = str2;
        this.voice = str3;
        this.systemText = str4;
        this.handsFree = z;
        this.listener = listener;
    }

    public String setupMessage() throws Exception {
        if (this.transcribeOnly) {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("model", this.model.startsWith("models/") ? this.model : "models/" + this.model);
            jSONObject.put("generationConfig", new JSONObject().put("responseModalities", new JSONArray().put("TEXT")));
            jSONObject.put("inputAudioTranscription", new JSONObject());
            if (!this.handsFree) {
                jSONObject.put("realtimeInputConfig", new JSONObject().put("automaticActivityDetection", new JSONObject().put("disabled", true)));
            }
            return new JSONObject().put("setup", jSONObject).toString();
        }
        JSONObject jSONObject2 = new JSONObject();
        jSONObject2.put("responseModalities", new JSONArray().put("AUDIO"));
        if (this.voice != null && this.voice.length() > 0) {
            jSONObject2.put("speechConfig", new JSONObject().put("voiceConfig", new JSONObject().put("prebuiltVoiceConfig", new JSONObject().put("voiceName", this.voice))));
        }
        if (this.thinkingLevel != null && this.thinkingLevel.length() > 0) {
            jSONObject2.put("thinkingConfig", new JSONObject().put("thinkingLevel", this.thinkingLevel));
        }
        JSONObject jSONObject3 = new JSONObject();
        jSONObject3.put("model", this.model.startsWith("models/") ? this.model : "models/" + this.model);
        jSONObject3.put("generationConfig", jSONObject2);
        if (this.systemText != null && this.systemText.trim().length() > 0) {
            jSONObject3.put("systemInstruction", new JSONObject().put("parts", new JSONArray().put(new JSONObject().put("text", this.systemText))));
        }
        jSONObject3.put("inputAudioTranscription", new JSONObject());
        jSONObject3.put("outputAudioTranscription", new JSONObject());
        if (this.resumeHandle != null) {
            jSONObject3.put("sessionResumption", new JSONObject().put("handle", this.resumeHandle));
        } else {
            jSONObject3.put("sessionResumption", new JSONObject());
            if (this.history != null && this.history.length > 0) {
                jSONObject3.put("historyConfig", new JSONObject().put("initialHistoryInClientContent", true));
            }
        }
        jSONObject3.put("contextWindowCompression", new JSONObject().put("slidingWindow", new JSONObject()));
        if (!this.handsFree) {
            jSONObject3.put("realtimeInputConfig", new JSONObject().put("automaticActivityDetection", new JSONObject().put("disabled", true)));
        }
        return new JSONObject().put("setup", jSONObject3).toString();
    }

    public String historyMessage() throws Exception {
        if (this.history == null || this.history.length == 0 || this.resumeHandle != null || this.transcribeOnly) {
            return null;
        }
        JSONArray jSONArray = new JSONArray();
        int i = 0;
        StringBuffer stringBuffer = null;
        String str = null;
        while (i <= this.history.length) {
            String str2 = i < this.history.length ? this.history[i][0] : null;
            String str3 = i < this.history.length ? this.history[i][1] : null;
            if (i < this.history.length) {
                if (str3 != null && str3.length() != 0 && ("user".equals(str2) || "model".equals(str2))) {
                    if (str2.equals(str)) {
                        stringBuffer.append("\n\n").append(str3);
                    }
                }
                i++;
            }
            if (str != null) {
                jSONArray.put(new JSONObject().put("role", str).put("parts", new JSONArray().put(new JSONObject().put("text", stringBuffer.toString()))));
            }
            if (str3 == null) {
                str3 = "";
            }
            stringBuffer = new StringBuffer(str3);
            str = str2;
            i++;
        }
        if (jSONArray.length() != 0) {
            return new JSONObject().put("clientContent", new JSONObject().put("turns", jSONArray).put("turnComplete", true)).toString();
        }
        return null;
    }

    public void start() {
        Thread thread = new Thread(this, "GeminiLive");
        thread.setDaemon(true);
        thread.start();
        Thread thread2 = new Thread(new Runnable() { // from class: com.gemini.chat.LiveSession.1
            @Override // java.lang.Runnable
            public void run() {
                LiveSession.this.writerLoop();
            }
        }, "GeminiLiveWriter");
        thread2.setDaemon(true);
        thread2.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void writerLoop() {
        String removeFirst;
        while (true) {
            synchronized (this.outbox) {
                while (!this.stopped && this.outbox.isEmpty()) {
                    try {
                        this.outbox.wait(500L);
                    } catch (InterruptedException e) {
                        return;
                    }
                }
                if (this.stopped) {
                    return;
                } else {
                    removeFirst = this.outbox.removeFirst();
                }
            }
            try {
                this.ws.send(removeFirst);
            } catch (Exception e2) {
                synchronized (this.outbox) {
                    this.outbox.clear();
                }
            }
        }
    }

    private void post(String str) {
        synchronized (this.outbox) {
            if (this.outbox.size() >= OUTBOX_MAX) {
                this.outbox.removeFirst();
            }
            this.outbox.add(str);
            this.outbox.notifyAll();
        }
    }

    public boolean isReady() {
        return this.ready && !this.stopped;
    }

    @Override // java.lang.Runnable
    public void run() {
        String receive;
        try {
            try {
                this.ws.connect(this.url, new String[]{"x-goog-api-key", this.apiKey}, 30000);
                this.ws.send(setupMessage());
                while (!this.stopped && (receive = this.ws.receive()) != null) {
                    dispatch(receive);
                }
                if (!this.stopped && this.ws.closeCode != 1000 && this.ws.closeCode != 0) {
                    r0 = "Closed (" + this.ws.closeCode + ")" + (this.ws.closeReason.length() > 0 ? ": " + this.ws.closeReason : "");
                } else if (!this.stopped && this.ws.closeReason.length() > 0) {
                    r0 = this.ws.closeReason;
                }
                this.ready = false;
                this.stopped = true;
                synchronized (this.outbox) {
                    this.outbox.notifyAll();
                }
                this.ws.close();
            } catch (Exception e) {
                r0 = this.stopped ? null : e.getMessage() != null ? e.getMessage() : e.toString();
                this.ready = false;
                this.stopped = true;
                synchronized (this.outbox) {
                    this.outbox.notifyAll();
                    this.ws.close();
                }
            }
            this.listener.onClosed(r0);
        } catch (Throwable th) {
            this.ready = false;
            this.stopped = true;
            synchronized (this.outbox) {
                this.outbox.notifyAll();
                this.ws.close();
                throw th;
            }
        }
    }

    void dispatch(String str) throws Exception {
        JSONObject optJSONObject;
        JSONObject jSONObject = new JSONObject(str);
        if (jSONObject.has("setupComplete")) {
            String historyMessage = historyMessage();
            if (historyMessage != null) {
                post(historyMessage);
            }
            this.ready = true;
            this.listener.onReady();
            return;
        }
        JSONObject optJSONObject2 = jSONObject.optJSONObject("serverContent");
        if (optJSONObject2 != null) {
            JSONObject optJSONObject3 = optJSONObject2.optJSONObject("interimInputTranscription");
            if (optJSONObject3 != null) {
                this.listener.onInterimInput(optJSONObject3.optString("text", ""));
            }
            JSONObject optJSONObject4 = optJSONObject2.optJSONObject("inputTranscription");
            if (optJSONObject4 != null && optJSONObject4.optString("text", "").length() > 0) {
                this.listener.onInputText(optJSONObject4.optString("text"));
            }
            JSONObject optJSONObject5 = optJSONObject2.optJSONObject("modelTurn");
            JSONArray optJSONArray = optJSONObject5 != null ? optJSONObject5.optJSONArray("parts") : null;
            for (int i = 0; optJSONArray != null && i < optJSONArray.length(); i++) {
                JSONObject optJSONObject6 = optJSONArray.optJSONObject(i);
                if (optJSONObject6 != null && !optJSONObject6.optBoolean("thought", false) && (optJSONObject = optJSONObject6.optJSONObject("inlineData")) != null && optJSONObject.optString("mimeType", "").startsWith("audio/")) {
                    this.listener.onAudio(B64.decode(optJSONObject.optString("data", "")));
                }
            }
            JSONObject optJSONObject7 = optJSONObject2.optJSONObject("outputTranscription");
            if (optJSONObject7 != null && optJSONObject7.optString("text", "").length() > 0) {
                this.listener.onOutputText(optJSONObject7.optString("text"));
            }
            if (optJSONObject2.optBoolean("interrupted", false)) {
                this.listener.onInterrupted();
            }
            if (optJSONObject2.optBoolean("turnComplete", false)) {
                this.listener.onTurnComplete();
                return;
            }
            return;
        }
        JSONObject optJSONObject8 = jSONObject.optJSONObject("sessionResumptionUpdate");
        if (optJSONObject8 != null) {
            String optString = optJSONObject8.optString("newHandle", "");
            if (!optJSONObject8.optBoolean("resumable", false) || optString.length() <= 0) {
                return;
            }
            this.lastHandle = optString;
            return;
        }
        if (jSONObject.has("goAway")) {
            this.goAway = true;
            return;
        }
        JSONObject optJSONObject9 = jSONObject.optJSONObject("error");
        if (optJSONObject9 != null) {
            throw new Exception(optJSONObject9.optString("message", optJSONObject9.toString()));
        }
    }

    private void sendRealtime(JSONObject jSONObject) {
        if (this.ready && !this.stopped) {
            try {
                post(new JSONObject().put("realtimeInput", jSONObject).toString());
            } catch (Exception e) {
            }
        }
    }

    public void sendText(String str) {
        try {
            sendRealtime(new JSONObject().put("text", str));
        } catch (Exception e) {
        }
    }

    public void sendAudio(byte[] bArr, int i, int i2, int i3) {
        try {
            sendRealtime(new JSONObject().put("audio", new JSONObject().put("mimeType", "audio/pcm;rate=" + i3).put("data", B64.encode(bArr, i, i2))));
        } catch (Exception e) {
        }
    }

    public void activityStart() {
        try {
            sendRealtime(new JSONObject().put("activityStart", new JSONObject()));
        } catch (Exception e) {
        }
    }

    public void activityEnd() {
        try {
            sendRealtime(new JSONObject().put("activityEnd", new JSONObject()));
        } catch (Exception e) {
        }
    }

    public void audioStreamEnd() {
        try {
            sendRealtime(new JSONObject().put("audioStreamEnd", true));
        } catch (Exception e) {
        }
    }

    public void stop() {
        this.stopped = true;
        this.ready = false;
        synchronized (this.outbox) {
            this.outbox.notifyAll();
        }
        Thread thread = new Thread(new Runnable() { // from class: com.gemini.chat.LiveSession.2
            @Override // java.lang.Runnable
            public void run() {
                LiveSession.this.ws.close();
            }
        });
        thread.setDaemon(true);
        thread.start();
    }
}
