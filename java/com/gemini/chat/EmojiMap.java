package com.gemini.chat;

import android.content.Context;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;

/**
 * Emoji -> short code table (Emoji 18, see scripts/gen_emoji_table.py).
 * Old Android fonts have no glyphs for most emoji, so the renderer shows ":joy:" etc. instead.
 *
 * The table lives in assets/emoji.tsv and is loaded once, lazily (about 5,200 entries).
 * Lookup is longest-match at a position, so ZWJ families, flags and skin tones win over
 * their single-codepoint parts.
 */
public final class EmojiMap {
    private static HashMap<String, String> map;
    /** first UTF-16 unit of any key -> true; cheap pre-filter before substring lookups */
    private static boolean[] startUnits;
    private static int maxLen;

    private EmojiMap() {
    }

    public static synchronized void ensureLoaded(Context context) {
        if (map != null) return;
        InputStream in = null;
        try {
            in = context.getAssets().open("emoji.tsv");
            load(in);
        } catch (IOException e) {
            // degrade gracefully: no conversion instead of a crash
            map = new HashMap<String, String>();
            startUnits = new boolean[65536];
            maxLen = 0;
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException ignored) {
                }
            }
        }
    }

    /** Loads "emoji\tname" lines. Public for the JVM tests. */
    public static synchronized void load(InputStream in) throws IOException {
        BufferedReader r = new BufferedReader(new InputStreamReader(in, "UTF-8"), 8192);
        HashMap<String, String> m = new HashMap<String, String>(7000);
        boolean[] st = new boolean[65536];
        int ml = 0;
        String line;
        while ((line = r.readLine()) != null) {
            int tab = line.indexOf('\t');
            if (tab <= 0 || tab == line.length() - 1) continue;
            String key = line.substring(0, tab);
            m.put(key, line.substring(tab + 1));
            st[key.charAt(0)] = true;
            if (key.length() > ml) ml = key.length();
        }
        map = m;
        startUnits = st;
        maxLen = ml;
    }

    public static boolean isLoaded() {
        return map != null;
    }

    /** Length (UTF-16 units) of the longest emoji sequence starting at i, or 0. */
    public static int matchAt(CharSequence s, int i) {
        HashMap<String, String> m = map;
        if (m == null || maxLen == 0) return 0;
        char c = s.charAt(i);
        if (!startUnits[c]) return 0;
        int n = s.length();
        if (c < 0x80) {
            // keycaps (#, *, 0-9) only count when followed by U+FE0F or U+20E3
            if (i + 1 >= n) return 0;
            char d = s.charAt(i + 1);
            if (d != 0xFE0F && d != 0x20E3) return 0;
        }
        int max = Math.min(maxLen, n - i);
        for (int len = max; len >= 1; len--) {
            if (m.containsKey(s.subSequence(i, i + len).toString())) return len;
        }
        return 0;
    }

    public static String nameAt(CharSequence s, int i, int len) {
        HashMap<String, String> m = map;
        return m == null ? null : m.get(s.subSequence(i, i + len).toString());
    }

    /** Variation selectors and joiners left over after conversion would render as boxes. */
    public static boolean isInvisible(char c) {
        return c == 0xFE0F || c == 0xFE0E || c == 0x200D;
    }

    /** Plain-text conversion: every emoji becomes ":name:". */
    public static String convert(String s) {
        if (s == null || map == null) return s;
        StringBuilder out = null;
        int n = s.length();
        for (int i = 0; i < n; ) {
            int len = matchAt(s, i);
            if (len > 0) {
                if (out == null) out = new StringBuilder(n + 16).append(s, 0, i);
                out.append(':').append(nameAt(s, i, len)).append(':');
                i += len;
            } else {
                char c = s.charAt(i);
                if (isInvisible(c)) {
                    if (out == null) out = new StringBuilder(n).append(s, 0, i);
                } else if (out != null) {
                    out.append(c);
                }
                i++;
            }
        }
        return out == null ? s : out.toString();
    }
}
