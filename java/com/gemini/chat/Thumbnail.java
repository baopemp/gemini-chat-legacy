package com.gemini.chat;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Small preview of an attached image, decoded from the "data:image/...;base64,..." string stored in the
 * message row. Uses RGB_565 (half the memory of ARGB_8888), a small bounded LRU cache so reloading a chat
 * never re-decodes bitmaps on the UI thread, and a table-driven Base64 decoder (API 7 has no android.util.Base64).
 */
public final class Thumbnail {
    private static final int CACHE_MAX = 12;
    private static final LinkedHashMap<String, Bitmap> CACHE = new LinkedHashMap<String, Bitmap>(16, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Bitmap> eldest) {
            return size() > CACHE_MAX;
        }
    };

    private static final byte[] DEC = new byte[128];

    static {
        for (int i = 0; i < 128; i++) DEC[i] = -1;
        for (int i = 'A'; i <= 'Z'; i++) DEC[i] = (byte) (i - 'A');
        for (int i = 'a'; i <= 'z'; i++) DEC[i] = (byte) (i - 'a' + 26);
        for (int i = '0'; i <= '9'; i++) DEC[i] = (byte) (i - '0' + 52);
        DEC['+'] = 62;
        DEC['-'] = 62;
        DEC['/'] = 63;
        DEC['_'] = 63;
    }

    private Thumbnail() {
    }

    /** Clears cached preview bitmaps (e.g. on low-memory callbacks on 256 MB devices). */
    public static void clearCache() {
        synchronized (CACHE) {
            CACHE.clear();
        }
    }

    private static String cacheKey(String uri, int maxPx) {
        int n = uri.length();
        char mid = n > 0 ? uri.charAt(n >>> 1) : 0;
        char last = n > 0 ? uri.charAt(n - 1) : 0;
        return uri.hashCode() + ":" + n + ":" + mid + ":" + last + ":" + maxPx;
    }

    /** Bitmap whose longer side is at most maxPx, or null (bad data, out of memory, ...). */
    public static Bitmap fromDataUri(String uri, int maxPx) {
        if (uri == null || maxPx <= 0) return null;
        String key = cacheKey(uri, maxPx);
        synchronized (CACHE) {
            Bitmap cached = CACHE.get(key);
            if (cached != null && !cached.isRecycled()) return cached;
        }
        try {
            int comma = uri.indexOf(',');
            if (comma < 0) return null;
            byte[] data = decodeBase64(uri, comma + 1);
            if (data.length == 0) return null;
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(data, 0, data.length, bounds);
            if (bounds.outWidth <= 0 || bounds.outHeight <= 0) return null;
            int sample = 1;
            while (bounds.outWidth / (sample * 2) >= maxPx || bounds.outHeight / (sample * 2) >= maxPx) sample *= 2;
            BitmapFactory.Options opts = new BitmapFactory.Options();
            opts.inSampleSize = sample;
            opts.inPreferredConfig = Bitmap.Config.RGB_565;
            opts.inDither = true;
            Bitmap b = BitmapFactory.decodeByteArray(data, 0, data.length, opts);
            if (b == null) return null;
            int w = b.getWidth(), h = b.getHeight();
            float scale = Math.min(1f, (float) maxPx / Math.max(w, h));
            if (scale < 1f) {
                Bitmap scaled = Bitmap.createScaledBitmap(b, Math.max(1, (int) (w * scale)), Math.max(1, (int) (h * scale)), true);
                if (scaled != b) b.recycle();
                b = scaled;
            }
            synchronized (CACHE) {
                CACHE.put(key, b);
            }
            return b;
        } catch (Throwable t) { // includes OutOfMemoryError on 256 MB devices
            clearCache();
            return null;
        }
    }

    /** Standard or URL-safe base64 from index `from`; whitespace ignored, stops at '='. */
    public static byte[] decodeBase64(String s, int from) {
        int n = s.length();
        byte[] out = new byte[Math.max(0, (n - from) * 3 / 4 + 3)];
        int o = 0, buf = 0, bits = 0;
        for (int i = from; i < n; i++) {
            char c = s.charAt(i);
            if (c == '=') break;
            int v = c < 128 ? DEC[c] : -1;
            if (v < 0) continue;
            buf = (buf << 6) | v;
            bits += 6;
            if (bits >= 8) {
                bits -= 8;
                out[o++] = (byte) (buf >> bits);
                buf &= (1 << bits) - 1;
            }
        }
        if (o == out.length) return out;
        byte[] r = new byte[o];
        System.arraycopy(out, 0, r, 0, o);
        return r;
    }
}
