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

/* loaded from: classes.dex */
public final class TimeGrounding {
    static final String PREFS = "GeminiPrefs";
    public static final String PREF_KEY = "time_grounding";

    private TimeGrounding() {
    }

    public static boolean isEnabled(Context context) {
        return context.getSharedPreferences(PREFS, 0).getBoolean(PREF_KEY, true);
    }

    public static String apply(Context context, String str) {
        String trim = str == null ? "" : str.trim();
        if (isEnabled(context)) {
            String describe = describe(System.currentTimeMillis(), TimeZone.getDefault());
            return trim.length() == 0 ? describe : trim + "\n\n" + describe;
        }
        return trim;
    }

    private static String two(int i) {
        return i < 10 ? "0" + i : String.valueOf(i);
    }

    public static String describe(long j, TimeZone timeZone) {
        Date date = new Date(j);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EEEE", Locale.US);
        simpleDateFormat.setTimeZone(timeZone);
        SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", Locale.US);
        simpleDateFormat2.setTimeZone(timeZone);
        int offset = timeZone.getOffset(j) / 60000;
        int abs = Math.abs(offset);
        return "Current date and time: " + simpleDateFormat.format(date) + ", " + simpleDateFormat2.format(date) + ((offset >= 0 ? "+" : "-") + two(abs / 60) + ":" + two(abs % 60)) + "; Unix: " + j + "ms";
    }

    private static CheckBox checkbox(Activity activity) {
        int identifier = activity.getResources().getIdentifier("cb_time_grounding", "id", activity.getPackageName());
        View findViewById = identifier != 0 ? activity.findViewById(identifier) : null;
        if (findViewById instanceof CheckBox) {
            return (CheckBox) findViewById;
        }
        return null;
    }

    public static void bindSetting(Activity activity) {
        CheckBox checkbox = checkbox(activity);
        if (checkbox != null) {
            checkbox.setChecked(isEnabled(activity));
        }
    }

    public static void saveSetting(Activity activity, SharedPreferences.Editor editor) {
        CheckBox checkbox = checkbox(activity);
        if (checkbox != null) {
            editor.putBoolean(PREF_KEY, checkbox.isChecked());
        }
    }
}
