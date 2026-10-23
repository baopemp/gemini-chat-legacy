package com.gemini.chat;

import android.content.Context;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;

/* loaded from: classes.dex */
public final class EmojiMap {
    private static HashMap<String, String> map;
    private static int maxLen;
    private static boolean[] startUnits;

    private EmojiMap() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v2 */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r0v4, types: [java.io.IOException] */
    /* JADX WARN: Type inference failed for: r0v5, types: [java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r0v8, types: [java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r0v9, types: [java.io.IOException] */
    public static synchronized void ensureLoaded(Context context) {
        synchronized (EmojiMap.class) {
            if (map == null) {
                ?? e = 0;
                e = 0;
                try {
                    try {
                        e = context.getAssets().open("emoji.tsv");
                        load(e);
                    } finally {
                        if (e != 0) {
                            try {
                                e.close();
                            } catch (IOException e2) {
                            }
                        }
                    }
                } catch (IOException e3) {
                    map = new HashMap<>();
                    startUnits = new boolean[65536];
                    maxLen = 0;
                    if (e != 0) {
                        try {
                            e.close();
                        } catch (IOException e4) {
                            e = e4;
                        }
                    }
                }
            }
        }
    }

    public static synchronized void load(InputStream inputStream) throws IOException {
        int i = 0;
        synchronized (EmojiMap.class) {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"), 8192);
            HashMap<String, String> hashMap = new HashMap<>(7000);
            boolean[] zArr = new boolean[65536];
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine != null) {
                    int indexOf = readLine.indexOf(9);
                    if (indexOf > 0 && indexOf != readLine.length() - 1) {
                        String substring = readLine.substring(0, indexOf);
                        hashMap.put(substring, readLine.substring(indexOf + 1));
                        zArr[substring.charAt(0)] = true;
                        if (substring.length() > i) {
                            i = substring.length();
                        }
                    }
                } else {
                    map = hashMap;
                    startUnits = zArr;
                    maxLen = i;
                }
            }
        }
    }

    public static boolean isLoaded() {
        return map != null;
    }

    public static int matchAt(CharSequence charSequence, int i) {
        HashMap<String, String> hashMap = map;
        if (hashMap == null || maxLen == 0) {
            return 0;
        }
        char charAt = charSequence.charAt(i);
        if (!startUnits[charAt]) {
            return 0;
        }
        int length = charSequence.length();
        if (charAt < 128) {
            if (i + 1 >= length) {
                return 0;
            }
            char charAt2 = charSequence.charAt(i + 1);
            if (charAt2 != 65039 && charAt2 != 8419) {
                return 0;
            }
        }
        for (int min = Math.min(maxLen, length - i); min >= 1; min--) {
            if (hashMap.containsKey(charSequence.subSequence(i, i + min).toString())) {
                return min;
            }
        }
        return 0;
    }

    public static String nameAt(CharSequence charSequence, int i, int i2) {
        HashMap<String, String> hashMap = map;
        if (hashMap == null) {
            return null;
        }
        return hashMap.get(charSequence.subSequence(i, i + i2).toString());
    }

    public static boolean isInvisible(char c) {
        return c == 65039 || c == 65038 || c == 8205;
    }

    public static String convert(String str) {
        if (str != null && map != null) {
            StringBuilder sb = null;
            int length = str.length();
            int i = 0;
            while (i < length) {
                int matchAt = matchAt(str, i);
                if (matchAt > 0) {
                    if (sb == null) {
                        sb = new StringBuilder(length + 16).append((CharSequence) str, 0, i);
                    }
                    sb.append(':').append(nameAt(str, i, matchAt)).append(':');
                    i += matchAt;
                } else {
                    char charAt = str.charAt(i);
                    if (isInvisible(charAt)) {
                        if (sb == null) {
                            sb = new StringBuilder(length).append((CharSequence) str, 0, i);
                        }
                    } else if (sb != null) {
                        sb.append(charAt);
                    }
                    i++;
                }
            }
            return sb != null ? sb.toString() : str;
        }
        return str;
    }
}
