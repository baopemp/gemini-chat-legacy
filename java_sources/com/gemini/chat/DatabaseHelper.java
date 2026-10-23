package com.gemini.chat;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

/* loaded from: classes.dex */
public class DatabaseHelper extends SQLiteOpenHelper {
    private static final String DATABASE_NAME = "geminichat.db";
    private static final int DATABASE_VERSION = 3;

    public DatabaseHelper(Context context) {
        super(context, DATABASE_NAME, (SQLiteDatabase.CursorFactory) null, 3);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("CREATE TABLE chats (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, timestamp INTEGER, named INTEGER DEFAULT 0)");
        sQLiteDatabase.execSQL("CREATE TABLE messages (id INTEGER PRIMARY KEY AUTOINCREMENT, chat_id INTEGER, role TEXT, content TEXT, timestamp INTEGER, model TEXT, thoughts TEXT)");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        if (i < 2) {
            try {
                sQLiteDatabase.execSQL("ALTER TABLE messages ADD COLUMN model TEXT");
            } catch (Exception e) {
            }
        }
        if (i < 3) {
            try {
                sQLiteDatabase.execSQL("ALTER TABLE messages ADD COLUMN thoughts TEXT");
            } catch (Exception e2) {
            }
            try {
                sQLiteDatabase.execSQL("ALTER TABLE chats ADD COLUMN named INTEGER DEFAULT 0");
            } catch (Exception e3) {
            }
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onOpen(SQLiteDatabase sQLiteDatabase) {
        super.onOpen(sQLiteDatabase);
        if (!sQLiteDatabase.isReadOnly()) {
            addColumnIfMissing(sQLiteDatabase, "messages", "model", "TEXT");
            addColumnIfMissing(sQLiteDatabase, "messages", "thoughts", "TEXT");
            addColumnIfMissing(sQLiteDatabase, "chats", "named", "INTEGER DEFAULT 0");
        }
    }

    private static void addColumnIfMissing(SQLiteDatabase sQLiteDatabase, String str, String str2, String str3) {
        Throwable th;
        Cursor cursor;
        Cursor cursor2;
        Cursor cursor3 = null;
        try {
            cursor2 = sQLiteDatabase.rawQuery("PRAGMA table_info(" + str + ")", null);
        } catch (Exception e) {
            cursor2 = null;
        } catch (Throwable th2) {
            th = th2;
            cursor = null;
        }
        try {
            int columnIndex = cursor2.getColumnIndex("name");
            while (cursor2.moveToNext()) {
                if (str2.equals(cursor2.getString(columnIndex))) {
                    if (cursor2 != null) {
                        cursor2.close();
                        return;
                    }
                    return;
                }
            }
            cursor2.close();
            sQLiteDatabase.execSQL("ALTER TABLE " + str + " ADD COLUMN " + str2 + " " + str3);
            if (0 != 0) {
                cursor3.close();
            }
        } catch (Exception e2) {
            if (cursor2 != null) {
                cursor2.close();
            }
        } catch (Throwable th3) {
            th = th3;
            cursor = cursor2;
            if (cursor == null) {
                throw th;
            }
            cursor.close();
            throw th;
        }
    }

    private static String[] args(long j) {
        return new String[]{String.valueOf(j)};
    }

    private void touchChat(SQLiteDatabase sQLiteDatabase, long j, long j2) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("timestamp", Long.valueOf(j2));
        sQLiteDatabase.update("chats", contentValues, "id=?", args(j));
    }

    public long createChat(String str) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("title", str);
        contentValues.put("timestamp", Long.valueOf(System.currentTimeMillis()));
        return getWritableDatabase().insert("chats", null, contentValues);
    }

    public void updateChatTitle(long j, String str) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("title", str);
        contentValues.put("named", (Integer) 1);
        contentValues.put("timestamp", Long.valueOf(System.currentTimeMillis()));
        getWritableDatabase().update("chats", contentValues, "id=?", args(j));
    }

    public Cursor getChats() {
        return getReadableDatabase().query("chats", new String[]{"id as _id", "title", "timestamp"}, null, null, null, null, "timestamp DESC");
    }

    public String getChatTitle(long j) {
        Cursor query = getReadableDatabase().query("chats", new String[]{"title"}, "id=?", args(j), null, null, null);
        if (query == null) {
            return "New chat";
        }
        try {
            return query.moveToFirst() ? query.getString(0) : "New chat";
        } finally {
            query.close();
        }
    }

    public boolean needsName(long j) {
        boolean z;
        Cursor query = getReadableDatabase().query("chats", new String[]{"named"}, "id=?", args(j), null, null, null);
        if (query == null) {
            return false;
        }
        try {
            if (query.moveToFirst()) {
                if (query.getInt(0) == 0) {
                    z = true;
                    query.close();
                    return z;
                }
            }
            z = false;
            query.close();
            return z;
        } catch (Throwable th) {
            query.close();
            throw th;
        }
    }

    public void setAutoTitle(long j, String str) {
        ContentValues contentValues = new ContentValues();
        if (str != null) {
            contentValues.put("title", str);
        }
        contentValues.put("named", (Integer) 1);
        getWritableDatabase().update("chats", contentValues, "id=?", args(j));
    }

    public String[] firstExchange(long j) {
        Cursor messages = getMessages(j);
        if (messages == null) {
            return null;
        }
        try {
            int columnIndex = messages.getColumnIndex("role");
            int columnIndex2 = messages.getColumnIndex("content");
            int columnIndex3 = messages.getColumnIndex("model");
            String str = null;
            String str2 = null;
            while (messages.moveToNext() && (str2 == null || str == null)) {
                String string = messages.getString(columnIndex);
                String string2 = messages.getString(columnIndex2);
                if (string2 == null) {
                    string2 = "";
                }
                if ("user".equals(string) && str2 == null) {
                    String string3 = messages.getString(columnIndex3);
                    if (string2.trim().length() <= 0) {
                        string2 = (string3 == null || !string3.startsWith("data:image/")) ? "" : "(sent an image)";
                    }
                    str2 = string2;
                } else if ("model".equals(string) && str2 != null && str == null) {
                    str = string2;
                }
            }
            return (str2 == null || str == null) ? null : new String[]{str2, str};
        } finally {
            messages.close();
        }
    }

    public void deleteChat(long j) {
        SQLiteDatabase writableDatabase = getWritableDatabase();
        writableDatabase.delete("messages", "chat_id=?", args(j));
        writableDatabase.delete("chats", "id=?", args(j));
    }

    public void deleteAllChats() {
        SQLiteDatabase writableDatabase = getWritableDatabase();
        writableDatabase.delete("messages", null, null);
        writableDatabase.delete("chats", null, null);
    }

    public long addMessage(long j, String str, String str2, String str3) {
        return addMessage(j, str, str2, str3, null);
    }

    public long addMessage(long j, String str, String str2, String str3, String str4) {
        SQLiteDatabase writableDatabase = getWritableDatabase();
        long currentTimeMillis = System.currentTimeMillis();
        ContentValues contentValues = new ContentValues();
        contentValues.put("chat_id", Long.valueOf(j));
        contentValues.put("role", str);
        contentValues.put("content", str2);
        contentValues.put("model", str3);
        if (str4 != null && str4.length() > 0) {
            contentValues.put("thoughts", str4);
        }
        contentValues.put("timestamp", Long.valueOf(currentTimeMillis));
        long insert = writableDatabase.insert("messages", null, contentValues);
        touchChat(writableDatabase, j, currentTimeMillis);
        return insert;
    }

    public Cursor getMessages(long j) {
        return getReadableDatabase().query("messages", new String[]{"id as _id", "role", "content", "timestamp", "model", "thoughts"}, "chat_id=?", args(j), null, null, "id ASC");
    }

    public void updateMessage(long j, String str) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("content", str);
        getWritableDatabase().update("messages", contentValues, "id=?", args(j));
    }

    public void deleteMessagesAfter(long j, long j2) {
        getWritableDatabase().delete("messages", "chat_id=? AND id>?", new String[]{String.valueOf(j), String.valueOf(j2)});
    }

    public void deleteMessagesFrom(long j, long j2) {
        getWritableDatabase().delete("messages", "chat_id=? AND id>=?", new String[]{String.valueOf(j), String.valueOf(j2)});
    }

    public void deleteMessage(long j) {
        getWritableDatabase().delete("messages", "id=?", args(j));
    }
}
