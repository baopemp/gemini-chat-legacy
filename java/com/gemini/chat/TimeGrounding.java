package com.gemini.chat;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;
import android.widget.CheckBox;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/**
 * "Time grounding": the only hidden system instruction. Each request gets the device's current
 * date/time (to the millisecond) appended to the user's own system instruction. Toggle: Settings > Time grounding
 * (SharedPreferences "GeminiPrefs" / "time_grounding", default on).
 */
public final class TimeGrounding {
    public static final String PREF_KEY = "time_grounding";
    static final String PREFS = "GeminiPrefs";

    private TimeGrounding() {
    }

    public static boolean isEnabled(Context c) {
        return c.getSharedPreferences(PREFS, 0).getBoolean(PREF_KEY, true);
    }

    /** User system instruction + grounding block (if enabled). Called on the request thread. */
    public static String apply(Context c, String userInstruction) {
        String base = userInstruction == null ? "" : userInstruction.trim();
        if (!isEnabled(c)) return base;
        String g = describe(System.currentTimeMillis(), TimeZone.getDefault());
        return base.length() == 0 ? g : base + "\n\n" + g;
    }

    private static String two(int v) {
        return v < 10 ? "0" + v : String.valueOf(v);
    }

    /**
     * "Current date and time: Thursday, 2026-10-22T23:06:27.791+07:00; Unix: 1792685187791ms"
     * (pure Java; unit-tested on the JVM)
     */
    public static String describe(long now, TimeZone tz) {
        Date date = new Date(now);
        SimpleDateFormat day = new SimpleDateFormat("EEEE", Locale.US);
        day.setTimeZone(tz);
        SimpleDateFormat iso = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", Locale.US);
        iso.setTimeZone(tz);
        int offMin = tz.getOffset(now) / 60000;
        int abs = Math.abs(offMin);
        String offset = (offMin >= 0 ? "+" : "-") + two(abs / 60) + ":" + two(abs % 60);
        return "Current date and time: " + day.format(date) + ", " + iso.format(date) + offset
                + "; Unix: " + now + "ms";
    }

    private static CheckBox checkbox(Activity a) {
        int id = a.getResources().getIdentifier("cb_time_grounding", "id", a.getPackageName());
        View v = id != 0 ? a.findViewById(id) : null;
        return v instanceof CheckBox ? (CheckBox) v : null;
    }

    /** Shows the saved state in the Settings checkbox (id cb_time_grounding). */
    public static void bindSetting(Activity a) {
        CheckBox cb = checkbox(a);
        if (cb != null) cb.setChecked(isEnabled(a));
    }

    /** Called by the Save Settings button, together with the other settings, before commit(). */
    public static void saveSetting(Activity a, SharedPreferences.Editor editor) {
        CheckBox cb = checkbox(a);
        if (cb != null) editor.putBoolean(PREF_KEY, cb.isChecked());
    }
}
