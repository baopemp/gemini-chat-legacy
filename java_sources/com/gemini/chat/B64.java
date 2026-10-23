package com.gemini.chat;

/* loaded from: classes.dex */
public final class B64 {
    private static final char[] ENC = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".toCharArray();
    private static final int[] DEC = new int[128];

    static {
        for (int i = 0; i < 128; i++) {
            DEC[i] = -1;
        }
        for (int i2 = 0; i2 < 64; i2++) {
            DEC[ENC[i2]] = i2;
        }
    }

    private B64() {
    }

    public static String encode(byte[] bArr, int i, int i2) {
        char[] cArr = new char[((i2 + 2) / 3) * 4];
        int i3 = i + i2;
        int i4 = 0;
        while (i3 - i >= 3) {
            int i5 = ((bArr[i] & 255) << 16) | ((bArr[i + 1] & 255) << 8) | (bArr[i + 2] & 255);
            int i6 = i4 + 1;
            cArr[i4] = ENC[i5 >>> 18];
            int i7 = i6 + 1;
            cArr[i6] = ENC[(i5 >>> 12) & 63];
            int i8 = i7 + 1;
            cArr[i7] = ENC[(i5 >>> 6) & 63];
            i4 = i8 + 1;
            cArr[i8] = ENC[i5 & 63];
            i += 3;
        }
        int i9 = i3 - i;
        if (i9 > 0) {
            int i10 = (i9 == 2 ? (bArr[i + 1] & 255) << 8 : 0) | ((bArr[i] & 255) << 16);
            int i11 = i4 + 1;
            cArr[i4] = ENC[i10 >>> 18];
            int i12 = i11 + 1;
            cArr[i11] = ENC[(i10 >>> 12) & 63];
            int i13 = i12 + 1;
            cArr[i12] = i9 == 2 ? ENC[(i10 >>> 6) & 63] : '=';
            int i14 = i13 + 1;
            cArr[i13] = '=';
        }
        return new String(cArr);
    }

    public static String encode(byte[] bArr) {
        return encode(bArr, 0, bArr.length);
    }

    public static byte[] decode(String str) {
        int length = str.length();
        byte[] bArr = new byte[((length / 4) * 3) + 3];
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        for (int i4 = 0; i4 < length; i4++) {
            char charAt = str.charAt(i4);
            if (charAt == '=') {
                break;
            }
            int i5 = charAt < 128 ? DEC[charAt] : -1;
            if (i5 >= 0) {
                i2 = (i2 << 6) | i5;
                i += 6;
                if (i >= 8) {
                    i -= 8;
                    bArr[i3] = (byte) (i2 >> i);
                    i3++;
                }
            }
        }
        byte[] bArr2 = new byte[i3];
        System.arraycopy(bArr, 0, bArr2, 0, i3);
        return bArr2;
    }
}
