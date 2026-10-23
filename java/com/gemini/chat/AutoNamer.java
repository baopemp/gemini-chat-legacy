package com.gemini.chat;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.AsyncTask;

import org.json.JSONObject;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Vector;

/**
 * Settings > Auto-name chats: after a chat's first reply (typed chat or Live), one small generateContent request
 * (ChatActivity.TITLE_MODEL) turns the first user message and reply into a short title. Each chat is named once
 * (chats.named); a failed request is tried again after the next reply.
 */
final class AutoNamer extends AsyncTask<String, Void, String> {
    interface Callback {
        void onNamed(long chatId, String title);
    }

    /** Chats with a request in flight (one per chat). */
    private static final Vector<Long> RUNNING = new Vector<Long>();

    private final DatabaseHelper db;
    private final long chatId;
    private final String key;
    private final Callback cb;

    private AutoNamer(DatabaseHelper db, long chatId, String key, Callback cb) {
        this.db = db;
        this.chatId = chatId;
        this.key = key;
        this.cb = cb;
    }

    /** Starts naming if it is on, the chat isn't named yet and it has a first exchange. Call on the UI thread. */
    static void maybeStart(Context c, DatabaseHelper db, long chatId, Callback cb) {
        if (chatId == -1) return;
        SharedPreferences sp = c.getSharedPreferences(ChatActivity.PREFS, 0);
        String key = sp.getString("api_key", "").trim();
        if (!sp.getBoolean("auto_name", true) || key.length() == 0) return;
        Long id = Long.valueOf(chatId);
        if (RUNNING.contains(id)) return;
        try {
            if (!db.needsName(chatId)) return;
            String[] ex = db.firstExchange(chatId);
            if (ex == null) return;
            RUNNING.add(id);
            new AutoNamer(db, chatId, key, cb).execute(ex[0], ex[1]);
        } catch (Exception ignored) {
        }
    }

    @Override
    protected String doInBackground(String... ex) {
        HttpURLConnection c = null;
        try {
            byte[] body = ChatActivity.titleRequest(ex[0], ex[1]).getBytes("UTF-8");
            c = (HttpURLConnection) new URL(ChatActivity.API + ChatActivity.TITLE_MODEL + ":generateContent").openConnection();
            c.setConnectTimeout(30000);
            c.setReadTimeout(60000);
            c.setRequestMethod("POST");
            c.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            c.setRequestProperty("x-goog-api-key", key);
            c.setDoOutput(true);
            c.setFixedLengthStreamingMode(body.length);
            OutputStream os = c.getOutputStream();
            try {
                os.write(body);
            } finally {
                os.close();
            }
            if (c.getResponseCode() != 200) return null; // busy/quota: tried again after the next reply
            ReplyParser r = new ReplyParser();
            r.feed(new JSONObject(ChatActivity.readAll(c.getInputStream())));
            return ChatActivity.cleanTitle(r.text.toString());
        } catch (Exception e) {
            return null;
        } finally {
            if (c != null) c.disconnect();
        }
    }

    @Override
    protected void onPostExecute(String title) {
        RUNNING.remove(Long.valueOf(chatId));
        if (title == null) return;
        try {
            if (!db.needsName(chatId)) return; // renamed by the user meanwhile
            db.setAutoTitle(chatId, title);
        } catch (Exception e) {
            return; // screen closed (database closed)
        }
        if (cb != null) cb.onNamed(chatId, title);
    }
}
