package com.gemini.chat;

/** Standard Base64 (RFC 4648) for API 7, which has no android.util.Base64. Decoder skips whitespace/invalid chars. */
public final class B64 {
    private static final char[] ENC = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".toCharArray();
    private static final int[] DEC = new int[128];

    static {
        for (int i = 0; i < 128; i++) DEC[i] = -1;
        for (int i = 0; i < 64; i++) DEC[ENC[i]] = i;
    }

    private B64() {
    }

    public static String encode(byte[] b, int off, int len) {
        char[] out = new char[(len + 2) / 3 * 4];
        int o = 0, end = off + len, i = off;
        while (end - i >= 3) {
            int v = (b[i] & 0xFF) << 16 | (b[i + 1] & 0xFF) << 8 | (b[i + 2] & 0xFF);
            out[o++] = ENC[v >>> 18];
            out[o++] = ENC[(v >>> 12) & 63];
            out[o++] = ENC[(v >>> 6) & 63];
            out[o++] = ENC[v & 63];
            i += 3;
        }
        int rest = end - i;
        if (rest > 0) {
            int v = (b[i] & 0xFF) << 16 | (rest == 2 ? (b[i + 1] & 0xFF) << 8 : 0);
            out[o++] = ENC[v >>> 18];
            out[o++] = ENC[(v >>> 12) & 63];
            out[o++] = rest == 2 ? ENC[(v >>> 6) & 63] : '=';
            out[o++] = '=';
        }
        return new String(out);
    }

    public static String encode(byte[] b) {
        return encode(b, 0, b.length);
    }

    public static byte[] decode(String s) {
        int n = s.length();
        byte[] out = new byte[n / 4 * 3 + 3];
        int o = 0, acc = 0, bits = 0;
        for (int i = 0; i < n; i++) {
            char c = s.charAt(i);
            if (c == '=') break;
            int v = c < 128 ? DEC[c] : -1;
            if (v < 0) continue;
            acc = (acc << 6) | v;
            bits += 6;
            if (bits >= 8) {
                bits -= 8;
                out[o++] = (byte) (acc >> bits);
            }
        }
        byte[] r = new byte[o];
        System.arraycopy(out, 0, r, 0, o);
        return r;
    }
}
