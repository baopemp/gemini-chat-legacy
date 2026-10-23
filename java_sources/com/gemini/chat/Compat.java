package com.gemini.chat;

import android.app.Activity;
import android.os.Build;

/* loaded from: classes.dex */
public final class Compat {
    private Compat() {
    }

    public static void invalidateMenu(Activity activity) {
        if (activity != null && Build.VERSION.SDK_INT >= 11) {
            try {
                Activity.class.getMethod("invalidateOptionsMenu", new Class[0]).invoke(activity, new Object[0]);
            } catch (Exception e) {
            }
        }
    }
}
