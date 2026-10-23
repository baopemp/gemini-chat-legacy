package com.gemini.chat;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

/**
 * geminichat.db (version 3): chats(id, title, timestamp, named), messages(id, chat_id, role, content, timestamp, model, thoughts).
 * For user rows, `model` holds the attached image as a data: URI (or null).
 */
public class DatabaseHelper extends SQLiteOpenHelper {
    private static final String DATABASE_NAME = "geminichat.db";
    /** 3 (0.8.6): messages.thoughts (thought summary of a reply), chats.named (1 once auto-named). */
    private static final int DATABASE_VERSION = 3;

    public DatabaseHelper(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE chats (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, timestamp INTEGER, named INTEGER DEFAULT 0)");
        db.execSQL("CREATE TABLE messages (id INTEGER PRIMARY KEY AUTOINCREMENT, chat_id INTEGER, role TEXT, content TEXT, timestamp INTEGER, model TEXT, thoughts TEXT)");
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        if (oldVersion < 2) {
            try {
                db.execSQL("ALTER TABLE messages ADD COLUMN model TEXT");
            } catch (Exception ignored) {
            }
        }
        if (oldVersion < 3) {
            try {
                db.execSQL("ALTER TABLE messages ADD COLUMN thoughts TEXT");
            } catch (Exception ignored) {
            }
            try {
                db.execSQL("ALTER TABLE chats ADD COLUMN named INTEGER DEFAULT 0");
            } catch (Exception ignored) {
            }
        }
    }

    /**
     * Self-repair on every open: adds any column this version uses that is missing (e.g. a database left half-upgraded
     * by a test build, or restored from an older backup that still says version 3). Cheap: PRAGMA table_info.
     */
    @Override
    public void onOpen(SQLiteDatabase db) {
        super.onOpen(db);
        if (db.isReadOnly()) return;
        addColumnIfMissing(db, "messages", "model", "TEXT");
        addColumnIfMissing(db, "messages", "thoughts", "TEXT");
        addColumnIfMissing(db, "chats", "named", "INTEGER DEFAULT 0");
    }

    private static void addColumnIfMissing(SQLiteDatabase db, String table, String column, String type) {
        Cursor c = null;
        try {
            c = db.rawQuery("PRAGMA table_info(" + table + ")", null);
            int iName = c.getColumnIndex("name");
            while (c.moveToNext()) if (column.equals(c.getString(iName))) return;
            c.close();
            c = null;
            db.execSQL("ALTER TABLE " + table + " ADD COLUMN " + column + " " + type);
        } catch (Exception ignored) {
        } finally {
            if (c != null) c.close();
        }
    }

    private static String[] args(long a) {
        return new String[]{String.valueOf(a)};
    }

    private void touchChat(SQLiteDatabase db, long chatId, long now) {
        ContentValues v = new ContentValues();
        v.put("timestamp", Long.valueOf(now));
        db.update("chats", v, "id=?", args(chatId));
    }

    public long createChat(String title) {
        ContentValues v = new ContentValues();
        v.put("title", title);
        v.put("timestamp", Long.valueOf(System.currentTimeMillis()));
        return getWritableDatabase().insert("chats", null, v);
    }

    /** A title chosen by the user: auto-naming leaves the chat alone from now on. */
    public void updateChatTitle(long chatId, String title) {
        ContentValues v = new ContentValues();
        v.put("title", title);
        v.put("named", Integer.valueOf(1));
        v.put("timestamp", Long.valueOf(System.currentTimeMillis()));
        getWritableDatabase().update("chats", v, "id=?", args(chatId));
    }

    public Cursor getChats() {
        return getReadableDatabase().query("chats", new String[]{"id as _id", "title", "timestamp"},
                null, null, null, null, "timestamp DESC");
    }

    public String getChatTitle(long chatId) {
        String title = "New chat";
        Cursor c = getReadableDatabase().query("chats", new String[]{"title"}, "id=?", args(chatId), null, null, null);
        if (c != null) {
            try {
                if (c.moveToFirst()) title = c.getString(0);
            } finally {
                c.close();
            }
        }
        return title;
    }

    /** Auto-naming: true when the chat has not been named yet. */
    public boolean needsName(long chatId) {
        Cursor c = getReadableDatabase().query("chats", new String[]{"named"}, "id=?", args(chatId), null, null, null);
        if (c == null) return false;
        try {
            return c.moveToFirst() && c.getInt(0) == 0;
        } finally {
            c.close();
        }
    }

    /** Sets the auto-generated title (keeps the chat's position in the list). */
    public void setAutoTitle(long chatId, String title) {
        ContentValues v = new ContentValues();
        if (title != null) v.put("title", title);
        v.put("named", Integer.valueOf(1));
        getWritableDatabase().update("chats", v, "id=?", args(chatId));
    }

    /** First user and first model message text {user, model}, or null when the chat has no reply yet. */
    public String[] firstExchange(long chatId) {
        String user = null, model = null;
        Cursor c = getMessages(chatId);
        if (c == null) return null;
        try {
            int iRole = c.getColumnIndex("role"), iContent = c.getColumnIndex("content"), iModel = c.getColumnIndex("model");
            while (c.moveToNext() && (user == null || model == null)) {
                String role = c.getString(iRole), text = c.getString(iContent);
                if (text == null) text = "";
                if ("user".equals(role) && user == null) {
                    String m = c.getString(iModel);
                    user = text.trim().length() > 0 ? text : (m != null && m.startsWith("data:image/") ? "(sent an image)" : "");
                } else if ("model".equals(role) && user != null && model == null) {
                    model = text;
                }
            }
        } finally {
            c.close();
        }
        return user != null && model != null ? new String[]{user, model} : null;
    }

    public void deleteChat(long chatId) {
        SQLiteDatabase db = getWritableDatabase();
        db.delete("messages", "chat_id=?", args(chatId));
        db.delete("chats", "id=?", args(chatId));
    }

    public void deleteAllChats() {
        SQLiteDatabase db = getWritableDatabase();
        db.delete("messages", null, null);
        db.delete("chats", null, null);
    }

    public long addMessage(long chatId, String role, String content, String model) {
        return addMessage(chatId, role, content, model, null);
    }

    public long addMessage(long chatId, String role, String content, String model, String thoughts) {
        SQLiteDatabase db = getWritableDatabase();
        long now = System.currentTimeMillis();
        ContentValues v = new ContentValues();
        v.put("chat_id", Long.valueOf(chatId));
        v.put("role", role);
        v.put("content", content);
        v.put("model", model);
        if (thoughts != null && thoughts.length() > 0) v.put("thoughts", thoughts);
        v.put("timestamp", Long.valueOf(now));
        long id = db.insert("messages", null, v);
        touchChat(db, chatId, now);
        return id;
    }

    /** Rows in insertion order (id). Caller closes the cursor. */
    public Cursor getMessages(long chatId) {
        return getReadableDatabase().query("messages", new String[]{"id as _id", "role", "content", "timestamp", "model", "thoughts"},
                "chat_id=?", args(chatId), null, null, "id ASC"); // ids only grow; the clock may jump
    }

    public void updateMessage(long msgId, String content) {
        ContentValues v = new ContentValues();
        v.put("content", content);
        getWritableDatabase().update("messages", v, "id=?", args(msgId));
    }

    /** Deletes every message of the chat newer than msgId (msgId itself is kept). */
    public void deleteMessagesAfter(long chatId, long msgId) {
        getWritableDatabase().delete("messages", "chat_id=? AND id>?",
                new String[]{String.valueOf(chatId), String.valueOf(msgId)});
    }

    /** Deletes msgId and every newer message of the chat (used by "Regenerate" on a reply). */
    public void deleteMessagesFrom(long chatId, long msgId) {
        getWritableDatabase().delete("messages", "chat_id=? AND id>=?",
                new String[]{String.valueOf(chatId), String.valueOf(msgId)});
    }

    public void deleteMessage(long msgId) {
        getWritableDatabase().delete("messages", "id=?", args(msgId));
    }
}
