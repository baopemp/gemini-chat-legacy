package com.gemini.chat;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

/**
 * Small preview of an attached image, decoded from the "data:image/...;base64,..." string stored in the
 * message row. Has its own base64 decoder because android.util.Base64 only exists from API 8.
 */
public final class Thumbnail {
    private Thumbnail() {
    }

    /** Bitmap whose longer side is at most maxPx, or null (bad data, out of memory, ...). */
    public static Bitmap fromDataUri(String uri, int maxPx) {
        if (uri == null || maxPx <= 0) return null;
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
            Bitmap b = BitmapFactory.decodeByteArray(data, 0, data.length, opts);
            if (b == null) return null;
            int w = b.getWidth(), h = b.getHeight();
            float scale = Math.min(1f, (float) maxPx / Math.max(w, h));
            if (scale < 1f) {
                Bitmap scaled = Bitmap.createScaledBitmap(b, Math.max(1, (int) (w * scale)), Math.max(1, (int) (h * scale)), true);
                if (scaled != b) b.recycle();
                b = scaled;
            }
            return b;
        } catch (Throwable t) { // includes OutOfMemoryError on 256 MB devices
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
            int v;
            if (c >= 'A' && c <= 'Z') v = c - 'A';
            else if (c >= 'a' && c <= 'z') v = c - 'a' + 26;
            else if (c >= '0' && c <= '9') v = c - '0' + 52;
            else if (c == '+' || c == '-') v = 62;
            else if (c == '/' || c == '_') v = 63;
            else if (c == '=') break;
            else continue;
            buf = (buf << 6) | v;
            bits += 6;
            if (bits >= 8) {
                bits -= 8;
                out[o++] = (byte) (buf >> bits);
                buf &= (1 << bits) - 1;
            }
        }
        byte[] r = new byte[o];
        System.arraycopy(out, 0, r, 0, o);
        return r;
    }
}
