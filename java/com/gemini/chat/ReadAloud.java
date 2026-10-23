package com.gemini.chat;

import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioTrack;
import android.os.Handler;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * "Read aloud": speaks a reply with Gemini text-to-speech, in the voice chosen for Live.
 * Interactions API, streamed (SSE): {@code step.delta} events with {@code delta.type == "audio"} carry base64
 * 24 kHz mono 16-bit PCM ({@code audio/l16}), written to an AudioTrack as they arrive.
 * Docs: ai.google.dev/gemini-api/docs/speech-generation (checked 2026-10-23; all three models are on the free tier).
 */
final class ReadAloud extends Thread {
    static final String URL_INTERACTIONS = "https://generativelanguage.googleapis.com/v1beta/interactions";
    static final String[] MODELS = {"gemini-3.8-flash-lite-tts", "gemini-3.8-flash-tts", "gemini-3.1-flash-tts-preview"};
    static final String DEFAULT_MODEL = MODELS[0];
    static final int RATE = 24000;
    private static final int MAX_RETRIES = 2;

    /** Called on the UI thread when playback ends. error: null when finished or stopped. */
    interface Listener {
        void onDone(ReadAloud r, String error);
    }

    final long messageId;
    private final String key, model, voice, text;
    private final Handler ui;
    private final Listener listener;
    private volatile boolean stopped;
    private volatile HttpURLConnection conn;
    private volatile AudioTrack track;
    private long written; // frames written to the track
    private int carry = -1; // odd byte left over from the previous chunk

    ReadAloud(long messageId, String key, String model, String voice, String text, Handler ui, Listener listener) {
        this.messageId = messageId;
        this.key = key;
        this.model = model;
        this.voice = voice;
        this.text = text;
        this.ui = ui;
        this.listener = listener;
    }

    // ---- pure helpers (unit-tested on the JVM) ----

    static String requestBody(String model, String voice, String text) throws JSONException {
        JSONObject part = new JSONObject();
        part.put("type", "text");
        part.put("text", text);
        JSONObject turn = new JSONObject();
        turn.put("type", "user_input");
        turn.put("content", new JSONArray().put(part));
        JSONObject fmt = new JSONObject();
        fmt.put("type", "audio");
        fmt.put("mime_type", "audio/l16");
        fmt.put("sample_rate", RATE);
        JSONObject v = new JSONObject();
        v.put("voice", voice);
        JSONObject gen = new JSONObject();
        gen.put("speech_config", new JSONArray().put(v));
        JSONObject o = new JSONObject();
        o.put("model", model);
        o.put("input", new JSONArray().put(turn));
        o.put("response_format", fmt);
        o.put("generation_config", gen);
        o.put("stream", true);
        return o.toString();
    }

    /** One SSE event: base64 audio, or null (other event). Throws with "Error ..." for an in-stream error. */
    static String audioOf(String json) throws JSONException {
        JSONObject o = new JSONObject(json);
        JSONObject err = o.optJSONObject("error");
        if (err != null || "error".equals(o.optString("event_type"))) {
            String msg = err != null ? err.optString("message", "") : "";
            String code = err != null ? err.optString("code", "") : "";
            throw new JSONException("Error" + (code.length() > 0 ? " " + code : "") + ": " + msg);
        }
        if (!"step.delta".equals(o.optString("event_type"))) return null;
        JSONObject d = o.optJSONObject("delta");
        if (d == null || !"audio".equals(d.optString("type"))) return null;
        String data = d.optString("data", "");
        return data.length() > 0 ? data : null;
    }

    /** What is worth saying: the rendered text without emoji codes, code blocks or rules; tables as "key: value". */
    static String speakable(String markdown) {
        Markdown.Doc d = Markdown.parse(markdown, 0);
        int n = d.text.length();
        boolean[] drop = new boolean[n];
        for (int i = 0; i < d.spans.size(); i++) {
            Markdown.Span s = d.spans.get(i);
            if (s.type == Markdown.EMOJI || s.type == Markdown.CODE_BLOCK || s.type == Markdown.CODE_LANG
                    || s.type == Markdown.RULE) {
                for (int j = Math.max(0, s.start); j < Math.min(n, s.end); j++) drop[j] = true;
            }
        }
        StringBuffer sb = new StringBuffer(n);
        int newlines = 0;
        for (int i = 0; i < n; i++) {
            if (drop[i]) continue;
            char c = d.text.charAt(i);
            if (c == '\n') {
                if (++newlines > 2) continue;
            } else {
                newlines = 0;
            }
            sb.append(c);
        }
        return sb.toString().trim();
    }

    /** The server's error message for a failed request. */
    static String errorMessage(int code, String body) {
        try {
            JSONObject e = new JSONObject(body).optJSONObject("error");
            if (e != null && e.optString("message", "").length() > 0) return "Error " + code + ": " + e.optString("message");
        } catch (Exception ignored) {
        }
        return "Error " + code;
    }

    // ---- playback ----

    void stopReading() {
        stopped = true;
        final HttpURLConnection c = conn;
        if (c != null) {
            new Thread() { // closing a TLS socket writes to the network: not on the UI thread
                public void run() {
                    try {
                        c.disconnect();
                    } catch (Exception ignored) {
                    }
                }
            }.start();
        }
        AudioTrack t = track; // silence now; the writer may be blocked in write() until the buffer drains
        if (t != null) {
            try {
                t.pause();
                t.flush();
            } catch (Exception ignored) {
            }
        }
        interrupt();
    }

    boolean isStopped() {
        return stopped;
    }

    public void run() {
        String error = null;
        try {
            for (int attempt = 0; ; attempt++) {
                int code = request();
                if (code == 0 || stopped) break;
                if (!ChatActivity.retryable(code) || attempt >= MAX_RETRIES || written > 0) {
                    error = lastError;
                    break;
                }
                Thread.sleep(2000L << attempt); // 2 s, 4 s
            }
            if (error == null && !stopped) drain();
        } catch (InterruptedException e) {
            // stopped
        } catch (Exception e) {
            if (!stopped) {
                Log.e("Gemini", "Read aloud failed", e);
                String m = e.getMessage();
                error = m != null && m.startsWith("Error") ? m : "Read aloud failed: " + e.toString();
            }
        } finally {
            releaseTrack();
        }
        final String err = stopped ? null : error;
        ui.post(new Runnable() {
            public void run() {
                listener.onDone(ReadAloud.this, err);
            }
        });
    }

    private String lastError;

    /** One attempt. 0 = audio streamed to the end; otherwise the HTTP status (message in lastError). */
    private int request() throws Exception {
        BufferedReader in = null;
        try {
            HttpURLConnection c = (HttpURLConnection) new URL(URL_INTERACTIONS).openConnection();
            conn = c;
            c.setConnectTimeout(30000);
            c.setReadTimeout(120000);
            c.setRequestMethod("POST");
            c.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            c.setRequestProperty("x-goog-api-key", key);
            c.setDoOutput(true);
            byte[] bytes = requestBody(model, voice, text).getBytes("UTF-8");
            c.setFixedLengthStreamingMode(bytes.length);
            OutputStream os = c.getOutputStream();
            try {
                os.write(bytes);
            } finally {
                os.close();
            }
            int code = c.getResponseCode();
            if (stopped) return 0;
            if (code < 200 || code >= 300) {
                lastError = errorMessage(code, ChatActivity.readAll(c.getErrorStream()));
                return code;
            }
            in = new BufferedReader(new InputStreamReader(c.getInputStream(), "UTF-8"), 8192);
            StringBuffer data = new StringBuffer();
            String line;
            while (!stopped && (line = in.readLine()) != null) {
                if (line.startsWith("data:")) {
                    data.append(line.substring(line.length() > 5 && line.charAt(5) == ' ' ? 6 : 5));
                } else if (line.length() == 0 && data.length() > 0) {
                    event(data.toString());
                    data.setLength(0);
                }
            }
            if (!stopped && data.length() > 0) event(data.toString());
            return 0;
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (Exception ignored) {
                }
            }
            conn = null;
        }
    }

    private void event(String json) throws JSONException {
        if ("[DONE]".equals(json.trim())) return;
        String b64 = audioOf(json);
        if (b64 != null) play(B64.decode(b64));
    }

    /** Writes PCM to the track (blocks while its buffer is full, which paces the download). */
    private void play(byte[] pcm) {
        if (stopped || pcm.length == 0) return;
        int n = pcm.length + (carry >= 0 ? 1 : 0);
        byte[] b = new byte[n & ~1];
        int o = 0;
        if (carry >= 0 && b.length > 0) b[o++] = (byte) carry;
        System.arraycopy(pcm, 0, b, o, b.length - o);
        carry = (n & 1) != 0 ? pcm[pcm.length - 1] & 0xFF : -1;
        if (b.length == 0) return;
        if (track == null) {
            int min = AudioTrack.getMinBufferSize(RATE, AudioFormat.CHANNEL_CONFIGURATION_MONO, AudioFormat.ENCODING_PCM_16BIT);
            AudioTrack t = new AudioTrack(AudioManager.STREAM_MUSIC, RATE, AudioFormat.CHANNEL_CONFIGURATION_MONO,
                    AudioFormat.ENCODING_PCM_16BIT, Math.max(min, RATE * 2), AudioTrack.MODE_STREAM); // >= 1 s
            if (t.getState() != AudioTrack.STATE_INITIALIZED) {
                t.release();
                throw new IllegalStateException("Error: audio output not available");
            }
            track = t;
            t.play();
        }
        track.write(b, 0, b.length);
        written += b.length / 2;
    }

    /** Waits until the queued audio has played (gives up if the output stops moving). */
    private void drain() throws InterruptedException {
        AudioTrack t = track;
        if (t == null) return;
        long lastHead = -1, lastMove = System.currentTimeMillis();
        while (!stopped) {
            long head = t.getPlaybackHeadPosition() & 0xFFFFFFFFL;
            if (head >= written) break;
            long now = System.currentTimeMillis();
            if (head != lastHead) {
                lastHead = head;
                lastMove = now;
            } else if (now - lastMove > 1500) {
                break; // stalled output (no device / emulator)
            }
            Thread.sleep(50);
        }
    }

    private void releaseTrack() {
        AudioTrack t = track;
        track = null;
        if (t == null) return;
        try {
            if (stopped) {
                t.pause();
                t.flush();
            }
            t.stop();
        } catch (Exception ignored) {
        }
        t.release();
    }
}
