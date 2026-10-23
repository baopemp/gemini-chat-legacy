package com.gemini.chat;

import android.content.ContentResolver;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.util.Base64;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

/* loaded from: classes.dex */
public class ImageUtilApi8 {
    public static String uriToBase64(Context context, String str) {
        InputStream inputStream = null;
        Bitmap bitmap = null;
        String str2 = null;
        try {
            Uri parse = Uri.parse(str);
            ContentResolver contentResolver = context.getContentResolver();
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inJustDecodeBounds = true;
            InputStream openInputStream = contentResolver.openInputStream(parse);
            BitmapFactory.decodeStream(openInputStream, null, options);
            openInputStream.close();
            inputStream = null;
            int i = options.outWidth;
            int i2 = options.outHeight;
            if (i > 0 && i2 > 0) {
                int i3 = 1;
                while (true) {
                    if (i / i3 <= 1024 && i2 / i3 <= 1024) {
                        break;
                    }
                    i3 *= 2;
                }
                BitmapFactory.Options options2 = new BitmapFactory.Options();
                options2.inSampleSize = i3;
                inputStream = contentResolver.openInputStream(parse);
                bitmap = BitmapFactory.decodeStream(inputStream, null, options2);
                if (bitmap != null) {
                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                    bitmap.compress(Bitmap.CompressFormat.JPEG, 75, byteArrayOutputStream);
                    str2 = "data:image/jpeg;base64," + Base64.encodeToString(byteArrayOutputStream.toByteArray(), 2);
                }
            }
        } catch (Throwable th) {
            str2 = null;
        }
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (Exception e) {
            }
        }
        if (bitmap != null) {
            bitmap.recycle();
        }
        return str2;
    }
}
