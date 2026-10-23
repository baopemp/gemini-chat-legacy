package com.gemini.chat;

import android.app.Activity;
import android.os.Build;

/** Newer-API calls made safely from code that also runs on Android 2.1 (reflection, so no VerifyError). */
public final class Compat {
    private Compat() {
    }

    /**
     * Android 3.0+ prepares the options menu once and caches it, so items whose visibility depends on
     * state (Delete This Chat / Delete All Chats) must be refreshed with invalidateOptionsMenu() (API 11).
     * On 2.x onPrepareOptionsMenu already runs every time the menu opens, so this does nothing there.
     */
    public static void invalidateMenu(Activity a) {
        if (a == null || Build.VERSION.SDK_INT < 11) return;
        try {
            Activity.class.getMethod("invalidateOptionsMenu").invoke(a);
        } catch (Exception ignored) {
        }
    }
}
