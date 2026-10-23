package com.gemini.chat;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

/* loaded from: classes.dex */
public final class Thumbnail {
    private Thumbnail() {
    }

    public static Bitmap fromDataUri(String str, int i) {
        int i2 = 1;
        if (str == null || i <= 0) {
            return null;
        }
        try {
            int indexOf = str.indexOf(44);
            if (indexOf < 0) {
                return null;
            }
            byte[] decodeBase64 = decodeBase64(str, indexOf + 1);
            if (decodeBase64.length == 0) {
                return null;
            }
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(decodeBase64, 0, decodeBase64.length, options);
            if (options.outWidth <= 0 || options.outHeight <= 0) {
                return null;
            }
            while (true) {
                if (options.outWidth / (i2 * 2) < i && options.outHeight / (i2 * 2) < i) {
                    break;
                }
                i2 *= 2;
            }
            BitmapFactory.Options options2 = new BitmapFactory.Options();
            options2.inSampleSize = i2;
            Bitmap decodeByteArray = BitmapFactory.decodeByteArray(decodeBase64, 0, decodeBase64.length, options2);
            if (decodeByteArray == null) {
                return null;
            }
            int width = decodeByteArray.getWidth();
            int height = decodeByteArray.getHeight();
            float min = Math.min(1.0f, i / Math.max(width, height));
            if (min >= 1.0f) {
                return decodeByteArray;
            }
            Bitmap createScaledBitmap = Bitmap.createScaledBitmap(decodeByteArray, Math.max(1, (int) (width * min)), Math.max(1, (int) (height * min)), true);
            if (createScaledBitmap != decodeByteArray) {
                decodeByteArray.recycle();
                return createScaledBitmap;
            }
            return createScaledBitmap;
        } catch (Throwable th) {
            return null;
        }
    }

    public static byte[] decodeBase64(String str, int i) {
        int i2;
        int i3;
        int length = str.length();
        byte[] bArr = new byte[Math.max(0, (((length - i) * 3) / 4) + 3)];
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        while (i < length) {
            char charAt = str.charAt(i);
            if (charAt >= 'A' && charAt <= 'Z') {
                i2 = charAt - 'A';
            } else if (charAt >= 'a' && charAt <= 'z') {
                i2 = (charAt - 'a') + 26;
            } else if (charAt >= '0' && charAt <= '9') {
                i2 = (charAt - '0') + 52;
            } else if (charAt == '+' || charAt == '-') {
                i2 = 62;
            } else if (charAt == '/' || charAt == '_') {
                i2 = 63;
            } else {
                if (charAt == '=') {
                    break;
                }
                i3 = i6;
                i++;
                i6 = i3;
            }
            i5 = (i5 << 6) | i2;
            i4 += 6;
            if (i4 >= 8) {
                i4 -= 8;
                i3 = i6 + 1;
                bArr[i6] = (byte) (i5 >> i4);
                i5 &= (1 << i4) - 1;
                i++;
                i6 = i3;
            }
            i3 = i6;
            i++;
            i6 = i3;
        }
        byte[] bArr2 = new byte[i6];
        System.arraycopy(bArr, 0, bArr2, 0, i6);
        return bArr2;
    }
}
