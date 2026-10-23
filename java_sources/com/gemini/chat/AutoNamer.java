package com.gemini.chat;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Vector;
import org.json.JSONObject;

/* loaded from: classes.dex */
final class AutoNamer extends AsyncTask<String, Void, String> {
    private static final Vector<Long> RUNNING = new Vector<>();
    private final Callback cb;
    private final long chatId;
    private final DatabaseHelper db;
    private final String key;

    interface Callback {
        void onNamed(long j, String str);
    }

    private AutoNamer(DatabaseHelper databaseHelper, long j, String str, Callback callback) {
        this.db = databaseHelper;
        this.chatId = j;
        this.key = str;
        this.cb = callback;
    }

    static void maybeStart(Context context, DatabaseHelper databaseHelper, long j, Callback callback) {
        String[] firstExchange;
        if (j != -1) {
            SharedPreferences sharedPreferences = context.getSharedPreferences("GeminiPrefs", 0);
            String trim = sharedPreferences.getString("api_key", "").trim();
            if (sharedPreferences.getBoolean("auto_name", true) && trim.length() != 0) {
                Long valueOf = Long.valueOf(j);
                if (!RUNNING.contains(valueOf)) {
                    try {
                        if (databaseHelper.needsName(j) && (firstExchange = databaseHelper.firstExchange(j)) != null) {
                            RUNNING.add(valueOf);
                            new AutoNamer(databaseHelper, j, trim, callback).execute(firstExchange[0], firstExchange[1]);
                        }
                    } catch (Exception e) {
                    }
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public String doInBackground(String... strArr) {
        Throwable th;
        HttpURLConnection httpURLConnection;
        HttpURLConnection httpURLConnection2;
        byte[] bytes;
        try {
            bytes = ChatActivity.titleRequest(strArr[0], strArr[1]).getBytes("UTF-8");
            httpURLConnection2 = (HttpURLConnection) new URL("https://generativelanguage.googleapis.com/v1beta/models/gemini-3.5-flash-lite:generateContent").openConnection();
        } catch (Exception e) {
            httpURLConnection2 = null;
        } catch (Throwable th2) {
            th = th2;
            httpURLConnection = null;
        }
        try {
            httpURLConnection2.setConnectTimeout(30000);
            httpURLConnection2.setReadTimeout(60000);
            httpURLConnection2.setRequestMethod("POST");
            httpURLConnection2.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            httpURLConnection2.setRequestProperty("x-goog-api-key", this.key);
            httpURLConnection2.setDoOutput(true);
            httpURLConnection2.setFixedLengthStreamingMode(bytes.length);
            OutputStream outputStream = httpURLConnection2.getOutputStream();
            try {
                outputStream.write(bytes);
                outputStream.close();
                if (httpURLConnection2.getResponseCode() != 200) {
                    if (httpURLConnection2 != null) {
                        httpURLConnection2.disconnect();
                    }
                    return null;
                }
                ReplyParser replyParser = new ReplyParser();
                replyParser.feed(new JSONObject(ChatActivity.readAll(httpURLConnection2.getInputStream())));
                String cleanTitle = ChatActivity.cleanTitle(replyParser.text.toString());
                if (httpURLConnection2 != null) {
                    httpURLConnection2.disconnect();
                }
                return cleanTitle;
            } catch (Throwable th3) {
                outputStream.close();
                throw th3;
            }
        } catch (Exception e2) {
            if (httpURLConnection2 != null) {
                httpURLConnection2.disconnect();
            }
            return null;
        } catch (Throwable th4) {
            th = th4;
            httpURLConnection = httpURLConnection2;
            if (httpURLConnection == null) {
                throw th;
            }
            httpURLConnection.disconnect();
            throw th;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onPostExecute(String str) {
        RUNNING.remove(Long.valueOf(this.chatId));
        if (str != null) {
            try {
                if (this.db.needsName(this.chatId)) {
                    this.db.setAutoTitle(this.chatId, str);
                    if (this.cb != null) {
                        this.cb.onNamed(this.chatId, str);
                    }
                }
            } catch (Exception e) {
            }
        }
    }
}
