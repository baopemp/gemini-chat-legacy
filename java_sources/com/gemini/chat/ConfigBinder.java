package com.gemini.chat;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Build;
import android.os.Environment;
import android.view.View;
import android.widget.TextView;

/* loaded from: classes.dex */
public class ConfigBinder {
    public static void bind(final Activity activity) {
        View findViewById = activity.findViewById(activity.getResources().getIdentifier("btn_backups", "id", activity.getPackageName()));
        if (findViewById != null) {
            if (Build.VERSION.SDK_INT >= 19 || Environment.getExternalStorageState().equals("mounted")) {
                findViewById.setOnClickListener(new View.OnClickListener() { // from class: com.gemini.chat.ConfigBinder.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view) {
                        ConfigBinder.showBackupMenu(activity);
                    }
                });
            } else {
                findViewById.setEnabled(false);
                ((TextView) findViewById).setText("Backups (No SD Card)");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void showBackupMenu(final Activity activity) {
        AlertDialog.Builder builder = new AlertDialog.Builder(activity);
        builder.setTitle("Backups");
        builder.setItems(new CharSequence[]{"Export Chat History", "Import Chat History", "Export Settings", "Import Settings"}, new DialogInterface.OnClickListener() { // from class: com.gemini.chat.ConfigBinder.2
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                if (i == 0) {
                    ConfigManager.startExport(activity, true);
                    return;
                }
                if (i == 1) {
                    ConfigManager.startImport(activity, true);
                } else if (i == 2) {
                    ConfigManager.startExport(activity, false);
                } else if (i == 3) {
                    ConfigManager.startImport(activity, false);
                }
            }
        });
        builder.show();
    }
}
