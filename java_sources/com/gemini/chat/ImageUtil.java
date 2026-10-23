package com.gemini.chat;

import android.content.Context;
import android.os.Build;

/* loaded from: classes.dex */
public class ImageUtil {
    public static String uriToBase64(Context context, String str) {
        if (Build.VERSION.SDK_INT < 8) {
            return null;
        }
        return ImageUtilApi8.uriToBase64(context, str);
    }
}
