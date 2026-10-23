package com.gemini.chat;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Gemini Live API session (BidiGenerateContent over WebSocket). Pure Java (no Android classes) so it can be tested on the
 * JVM; LiveActivity adds the microphone, the speaker and the UI.
 * <p>
 * Audio in: 16-bit little-endian mono PCM ("audio/pcm;rate=N", the API resamples). Audio out: 16-bit PCM, 24 kHz.
 * Turn-taking: push-to-talk (automatic activity detection off, activityStart/activityEnd) or hands-free (server VAD).
 * Both directions are transcribed (inputAudioTranscription / outputAudioTranscription).
 * <p>
 * transcribeOnly: a speech-to-text session (gemini-3.5-transcribe-live, TEXT modality) that streams interim transcripts
 * while the user is still speaking; LiveActivity feeds it the same microphone audio to fill the text box live.
 * <p>
 * Session resumption: the server sends resumption handles; a new session started with resumeHandle continues the same
 * conversation (used to survive Google's ~10-minute connection limit and network drops).
 */
public final class LiveSession implements Runnable {
    public static final String URL =
            "wss://generativelanguage.googleapis.com/ws/google.ai.generativelanguage.v1beta.GenerativeService.BidiGenerateContent";
    public static final int OUTPUT_RATE = 24000;
    /** Free speech-to-text Live model (ai.google.dev/gemini-api/docs/live-api/live-transcribe). */
    public static final String TRANSCRIBE_MODEL = "gemini-3.5-transcribe-live";

    /** Callbacks arrive on the session's reader thread. */
    public interface Listener {
        void onReady();

        void onAudio(byte[] pcm);

        /** Transcription of the user's speech (main model: once per utterance; transcriber: final text of an utterance). */
        void onInputText(String delta);

        /** Transcriber only: the current utterance so far (cumulative), while the user is still speaking. */
        void onInterimInput(String text);

        /** Transcription of the model's speech (incremental, arrives together with the audio it belongs to). */
        void onOutputText(String delta);

        void onTurnComplete();

        /** The user barged in: drop any queued audio. */
        void onInterrupted();

        /** Session ended. error == null for a normal close. */
        void onClosed(String error);
    }

    public String url = URL;
    public final String apiKey, model, voice, systemText;
    public final boolean handsFree;
    /** Optional earlier chat turns {role, text} sent as context before the first live turn (may be null). */
    public String[][] history;
    /** thinkingConfig.thinkingLevel ("low", "medium", "high"); required by gemini-3.8-live-extended-thinking. null = omit. */
    public String thinkingLevel;
    /** Speech-to-text only (no reply, no voice). */
    public boolean transcribeOnly;
    /** Continue an earlier session (from lastHandle); its history is already on the server. */
    public String resumeHandle;
    /** Latest resumable handle sent by the server (null until the first update). */
    public volatile String lastHandle;
    /** The server announced it will close the connection soon. */
    public volatile boolean goAway;

    /** A speech-to-text session for the live text box. */
    public static LiveSession transcriber(String apiKey, boolean handsFree, Listener l) {
        LiveSession s = new LiveSession(apiKey, TRANSCRIBE_MODEL, null, null, handsFree, l);
        s.transcribeOnly = true;
        return s;
    }

    /** Models that reject a session without a thinking level. */
    public static boolean needsThinkingLevel(String model) {
        return model != null && model.indexOf("extended-thinking") >= 0;
    }
    private final Listener listener;
    private final LiveSocket ws = new LiveSocket();
    private volatile boolean stopped;
    private volatile boolean ready;
    /** Outgoing messages. Android 3.0+ forbids socket writes on the UI thread, so one writer thread sends them all. */
    private final java.util.LinkedList<String> outbox = new java.util.LinkedList<String>();
    private static final int OUTBOX_MAX = 200; // ~20 s of microphone audio; older chunks are dropped if the link stalls

    public LiveSession(String apiKey, String model, String voice, String systemText, boolean handsFree, Listener l) {
        this.apiKey = apiKey;
        this.model = model;
        this.voice = voice;
        this.systemText = systemText;
        this.handsFree = handsFree;
        this.listener = l;
    }

    /** The first message of the session. */
    public String setupMessage() throws Exception {
        if (transcribeOnly) {
            JSONObject setup = new JSONObject();
            setup.put("model", model.startsWith("models/") ? model : "models/" + model);
            setup.put("generationConfig", new JSONObject().put("responseModalities", new JSONArray().put("TEXT")));
            setup.put("inputAudioTranscription", new JSONObject());
            if (!handsFree) {
                setup.put("realtimeInputConfig", new JSONObject().put("automaticActivityDetection",
                        new JSONObject().put("disabled", true)));
            }
            return new JSONObject().put("setup", setup).toString();
        }
        JSONObject gen = new JSONObject();
        gen.put("responseModalities", new JSONArray().put("AUDIO"));
        if (voice != null && voice.length() > 0) {
            gen.put("speechConfig", new JSONObject().put("voiceConfig",
                    new JSONObject().put("prebuiltVoiceConfig", new JSONObject().put("voiceName", voice))));
        }
        if (thinkingLevel != null && thinkingLevel.length() > 0) {
            gen.put("thinkingConfig", new JSONObject().put("thinkingLevel", thinkingLevel));
        }
        JSONObject setup = new JSONObject();
        setup.put("model", model.startsWith("models/") ? model : "models/" + model);
        setup.put("generationConfig", gen);
        if (systemText != null && systemText.trim().length() > 0) {
            setup.put("systemInstruction", new JSONObject().put("parts",
                    new JSONArray().put(new JSONObject().put("text", systemText))));
        }
        setup.put("inputAudioTranscription", new JSONObject());
        setup.put("outputAudioTranscription", new JSONObject());
        if (resumeHandle != null) {
            setup.put("sessionResumption", new JSONObject().put("handle", resumeHandle));
        } else {
            setup.put("sessionResumption", new JSONObject()); // ask for resumption handles
            if (history != null && history.length > 0) {
                // the server reads clientContent history first (until turnComplete) without answering it
                setup.put("historyConfig", new JSONObject().put("initialHistoryInClientContent", true));
            }
        }
        // sliding window: sessions are not cut off when the context fills up (audio-only limit is otherwise 15 min)
        setup.put("contextWindowCompression", new JSONObject().put("slidingWindow", new JSONObject()));
        if (!handsFree) {
            setup.put("realtimeInputConfig", new JSONObject().put("automaticActivityDetection",
                    new JSONObject().put("disabled", true)));
        }
        return new JSONObject().put("setup", setup).toString();
    }

    /** Earlier chat turns as initial history (historyConfig: not answered by the model), or null when there are none. */
    public String historyMessage() throws Exception {
        if (history == null || history.length == 0 || resumeHandle != null || transcribeOnly) return null;
        JSONArray turns = new JSONArray();
        String lastRole = null;
        StringBuffer acc = null;
        for (int i = 0; i <= history.length; i++) {
            String role = i < history.length ? history[i][0] : null, text = i < history.length ? history[i][1] : null;
            if (i < history.length) {
                if (text == null || text.length() == 0) continue;
                if (!"user".equals(role) && !"model".equals(role)) continue;
                if (role.equals(lastRole)) { // consecutive same-role messages become one turn (as in text chat)
                    acc.append("\n\n").append(text);
                    continue;
                }
            }
            if (lastRole != null) {
                turns.put(new JSONObject().put("role", lastRole).put("parts",
                        new JSONArray().put(new JSONObject().put("text", acc.toString()))));
            }
            lastRole = role;
            acc = new StringBuffer(text == null ? "" : text);
        }
        if (turns.length() == 0) return null;
        return new JSONObject().put("clientContent",
                new JSONObject().put("turns", turns).put("turnComplete", true)).toString();
    }

    public void start() {
        Thread t = new Thread(this, "GeminiLive");
        t.setDaemon(true);
        t.start();
        Thread w = new Thread(new Runnable() {
            public void run() {
                writerLoop();
            }
        }, "GeminiLiveWriter");
        w.setDaemon(true);
        w.start();
    }

    private void writerLoop() {
        while (true) {
            String m;
            synchronized (outbox) {
                while (!stopped && outbox.isEmpty()) {
                    try {
                        outbox.wait(500);
                    } catch (InterruptedException e) {
                        return;
                    }
                }
                if (stopped) return;
                m = outbox.removeFirst();
            }
            try {
                ws.send(m);
            } catch (Exception e) {
                // the socket is gone; the reader thread reports the close
                synchronized (outbox) {
                    outbox.clear();
                }
            }
        }
    }

    /** Queues a message for the writer thread (any thread, never blocks on the network). */
    private void post(String m) {
        synchronized (outbox) {
            if (outbox.size() >= OUTBOX_MAX) outbox.removeFirst();
            outbox.add(m);
            outbox.notifyAll();
        }
    }

    public boolean isReady() {
        return ready && !stopped;
    }

    public void run() {
        String error = null;
        try {
            ws.connect(url, new String[]{"x-goog-api-key", apiKey}, 30000);
            ws.send(setupMessage());
            String msg;
            while (!stopped && (msg = ws.receive()) != null) {
                dispatch(msg);
            }
            if (!stopped && ws.closeCode != 1000 && ws.closeCode != 0) {
                error = "Closed (" + ws.closeCode + ")" + (ws.closeReason.length() > 0 ? ": " + ws.closeReason : "");
            } else if (!stopped && ws.closeReason.length() > 0) {
                error = ws.closeReason;
            }
        } catch (Exception e) {
            if (!stopped) error = e.getMessage() != null ? e.getMessage() : e.toString();
        } finally {
            ready = false;
            stopped = true; // ends the writer thread
            synchronized (outbox) {
                outbox.notifyAll();
            }
            ws.close();
        }
        listener.onClosed(error);
    }

    void dispatch(String msg) throws Exception {
        JSONObject o = new JSONObject(msg);
        if (o.has("setupComplete")) {
            String h = historyMessage();
            if (h != null) post(h);
            ready = true;
            listener.onReady();
            return;
        }
        JSONObject sc = o.optJSONObject("serverContent");
        if (sc != null) {
            JSONObject iit = sc.optJSONObject("interimInputTranscription");
            if (iit != null) listener.onInterimInput(iit.optString("text", ""));
            JSONObject it = sc.optJSONObject("inputTranscription");
            if (it != null && it.optString("text", "").length() > 0) listener.onInputText(it.optString("text"));
            JSONObject mt = sc.optJSONObject("modelTurn");
            JSONArray parts = mt != null ? mt.optJSONArray("parts") : null;
            for (int i = 0; parts != null && i < parts.length(); i++) {
                JSONObject p = parts.optJSONObject(i);
                if (p == null || p.optBoolean("thought", false)) continue;
                JSONObject d = p.optJSONObject("inlineData");
                if (d != null && d.optString("mimeType", "").startsWith("audio/")) {
                    listener.onAudio(B64.decode(d.optString("data", "")));
                }
            }
            JSONObject ot = sc.optJSONObject("outputTranscription");
            if (ot != null && ot.optString("text", "").length() > 0) listener.onOutputText(ot.optString("text"));
            if (sc.optBoolean("interrupted", false)) listener.onInterrupted();
            if (sc.optBoolean("turnComplete", false)) listener.onTurnComplete();
            return;
        }
        JSONObject sru = o.optJSONObject("sessionResumptionUpdate");
        if (sru != null) {
            String h = sru.optString("newHandle", "");
            if (sru.optBoolean("resumable", false) && h.length() > 0) lastHandle = h;
            return;
        }
        if (o.has("goAway")) {
            goAway = true; // the server closes soon (connection time limit): LiveActivity resumes with lastHandle
            return;
        }
        JSONObject err = o.optJSONObject("error");
        if (err != null) throw new Exception(err.optString("message", err.toString()));
    }

    // ---- client -> server ---------------------------------------------------------------------

    private void sendRealtime(JSONObject body) {
        if (!ready || stopped) return;
        try {
            post(new JSONObject().put("realtimeInput", body).toString());
        } catch (Exception ignored) {
        }
    }

    /** Typed text (answered with audio + transcript). */
    public void sendText(String text) {
        try {
            sendRealtime(new JSONObject().put("text", text));
        } catch (Exception ignored) {
        }
    }

    /** Microphone audio: 16-bit LE mono PCM at the given sample rate. */
    public void sendAudio(byte[] pcm, int off, int len, int rate) {
        try {
            sendRealtime(new JSONObject().put("audio", new JSONObject()
                    .put("mimeType", "audio/pcm;rate=" + rate).put("data", B64.encode(pcm, off, len))));
        } catch (Exception ignored) {
        }
    }

    /** Push-to-talk: the user started speaking. */
    public void activityStart() {
        try {
            sendRealtime(new JSONObject().put("activityStart", new JSONObject()));
        } catch (Exception ignored) {
        }
    }

    /** Push-to-talk: the user finished speaking (the model answers now). */
    public void activityEnd() {
        try {
            sendRealtime(new JSONObject().put("activityEnd", new JSONObject()));
        } catch (Exception ignored) {
        }
    }

    /** Hands-free: the microphone was paused (lets server VAD finish the current utterance). */
    public void audioStreamEnd() {
        try {
            sendRealtime(new JSONObject().put("audioStreamEnd", true));
        } catch (Exception ignored) {
        }
    }

    public void stop() {
        stopped = true;
        ready = false;
        synchronized (outbox) {
            outbox.notifyAll();
        }
        // close() writes a close frame: never on the caller's (UI) thread
        Thread t = new Thread(new Runnable() {
            public void run() {
                ws.close();
            }
        });
        t.setDaemon(true);
        t.start();
    }
}
