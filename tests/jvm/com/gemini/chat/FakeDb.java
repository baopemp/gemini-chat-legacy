package com.gemini.chat;

import android.database.Cursor;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.List;

/** Test double: getMessages() returns a Proxy Cursor over in-memory rows {role, content, model}. */
public class FakeDb extends DatabaseHelper {
    public static List<String[]> rows;
    public static int closed = 0;

    public FakeDb() { super(null); } // never called: instances come from Unsafe.allocateInstance

    @Override
    public Cursor getMessages(long chatId) {
        final String[] cols = {"role", "content", "model"};
        InvocationHandler h = new InvocationHandler() {
            int pos = -1;
            public Object invoke(Object p, Method m, Object[] a) {
                switch (m.getName()) {
                    case "getColumnIndex":
                        for (int i = 0; i < cols.length; i++) if (cols[i].equals(a[0])) return i;
                        return -1;
                    case "moveToNext": pos++; return pos < rows.size();
                    case "moveToFirst": pos = 0; return rows.size() > 0;
                    case "getString": return rows.get(pos)[(Integer) a[0]];
                    case "close": closed++; return null;
                    case "getCount": return rows.size();
                    default: throw new UnsupportedOperationException(m.getName());
                }
            }
        };
        return (Cursor) Proxy.newProxyInstance(FakeDb.class.getClassLoader(), new Class[]{Cursor.class}, h);
    }
}
