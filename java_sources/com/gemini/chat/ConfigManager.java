package com.gemini.chat;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.util.Log;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.channels.FileChannel;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

/* loaded from: classes.dex */
public class ConfigManager {
    private static File currentDir = Environment.getExternalStorageDirectory();

    final class Restarter implements Runnable {
        Restarter() {
        }

        @Override // java.lang.Runnable
        public void run() {
            System.exit(0);
        }
    }

    /* renamed from: -$$Nest$smshowFileChooser, reason: not valid java name */
    static /* bridge */ /* synthetic */ void m5$$Nest$smshowFileChooser(Activity activity, boolean z) {
        Intent intent = new Intent(activity, (Class<?>) FileExplorerActivity.class);
        intent.putExtra("isChat", z);
        intent.putExtra("isExport", false);
        activity.startActivity(intent);
    }

    /* renamed from: -$$Nest$smshowFolderChooser, reason: not valid java name */
    static /* bridge */ /* synthetic */ void m6$$Nest$smshowFolderChooser(Activity activity, boolean z) {
        Intent intent = new Intent(activity, (Class<?>) FileExplorerActivity.class);
        intent.putExtra("isChat", z);
        intent.putExtra("isExport", true);
        activity.startActivity(intent);
    }

    private static void deleteQuietly(String str, String str2) {
        new File(str + str2).delete();
    }

    public static File getInternalFile(Context context, boolean z) {
        return z ? context.getDatabasePath("geminichat.db") : new File(context.getFilesDir().getParentFile(), "shared_prefs/GeminiPrefs.xml");
    }

    public static void importFromStream(Activity activity, boolean z, InputStream inputStream) {
        File file = new File(activity.getCacheDir(), "import.tmp");
        boolean z2 = false;
        try {
            writeStream(inputStream, file);
            if (isValidBackup(activity, file, z)) {
                File internalFile = getInternalFile(activity, z);
                internalFile.getParentFile().mkdirs();
                if (z) {
                    String path = internalFile.getPath();
                    deleteQuietly(path, "-journal");
                    deleteQuietly(path, "-wal");
                    deleteQuietly(path, "-shm");
                }
                if (!file.renameTo(internalFile)) {
                    copyFile(file, internalFile);
                }
                z2 = true;
            } else {
                Toast.makeText(activity, z ? "That file is not a Gemini Chat history backup. Nothing was changed." : "That file is not a Gemini Chat settings backup. Nothing was changed.", 1).show();
            }
        } catch (Exception e) {
            Log.e("Gemini", "Import failed", e);
            Toast.makeText(activity, "Import Failed", 1).show();
            z2 = false;
        }
        file.delete();
        if (z2) {
            Toast.makeText(activity, "Imported! Restarting the app...", 1).show();
            new Handler().postDelayed(new Restarter(), 1500L);
        }
    }

    private static boolean isValidBackup(Context context, File file, boolean z) throws IOException {
        if (!z) {
            return file.length() <= 1048576 && readHead(file, 2048).indexOf("<map") >= 0;
        }
        if (!"SQLite format 3\u0000".equals(readHead(file, 16))) {
            return false;
        }
        SQLiteDatabase sQLiteDatabase = null;
        Cursor cursor = null;
        boolean z2 = false;
        try {
            sQLiteDatabase = SQLiteDatabase.openDatabase(file.getPath(), null, 17);
            cursor = sQLiteDatabase.rawQuery("SELECT count(*) FROM sqlite_master WHERE type='table' AND name IN ('chats','messages')", null);
            if (cursor.moveToFirst()) {
                if (cursor.getInt(0) == 2) {
                    z2 = true;
                }
            }
        } catch (Exception e) {
            z2 = false;
        }
        if (cursor != null) {
            cursor.close();
        }
        if (sQLiteDatabase != null) {
            sQLiteDatabase.close();
        }
        return z2;
    }

    public static void performImport(Activity activity, boolean z, File file) {
        FileInputStream fileInputStream = null;
        try {
            fileInputStream = new FileInputStream(file);
            importFromStream(activity, z, fileInputStream);
        } catch (Exception e) {
            Toast.makeText(activity, "Import Failed", 1).show();
        }
        if (fileInputStream != null) {
            try {
                fileInputStream.close();
            } catch (Exception unused) {
            }
        }
    }

    private static String readHead(File file, int i) throws IOException {
        byte[] bArr = new byte[i];
        FileInputStream fileInputStream = new FileInputStream(file);
        int i2 = 0;
        while (i2 < i) {
            try {
                int read = fileInputStream.read(bArr, i2, i - i2);
                if (read <= 0) {
                    break;
                }
                i2 += read;
            } finally {
                fileInputStream.close();
            }
        }
        return new String(bArr, 0, i2, "ISO-8859-1");
    }

    private static void writeStream(InputStream inputStream, File file) throws IOException {
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        try {
            byte[] bArr = new byte[8192];
            while (true) {
                int read = inputStream.read(bArr);
                if (read == -1) {
                    fileOutputStream.getFD().sync();
                    return;
                }
                fileOutputStream.write(bArr, 0, read);
            }
        } finally {
            fileOutputStream.close();
        }
    }

    public static void startExport(Activity activity, boolean z) {
        if (Build.VERSION.SDK_INT >= 19) {
            Intent intent = new Intent(activity, (Class<?>) SafActivity.class);
            intent.putExtra("isChat", z);
            intent.putExtra("isExport", true);
            activity.startActivity(intent);
            return;
        }
        Intent intent2 = new Intent(activity, (Class<?>) FileExplorerActivity.class);
        intent2.putExtra("isChat", z);
        intent2.putExtra("isExport", true);
        activity.startActivity(intent2);
    }

    public static void startImport(Activity activity, boolean z) {
        if (Build.VERSION.SDK_INT >= 19) {
            Intent intent = new Intent(activity, (Class<?>) SafActivity.class);
            intent.putExtra("isChat", z);
            intent.putExtra("isExport", false);
            activity.startActivity(intent);
            return;
        }
        Intent intent2 = new Intent(activity, (Class<?>) FileExplorerActivity.class);
        intent2.putExtra("isChat", z);
        intent2.putExtra("isExport", false);
        activity.startActivity(intent2);
    }

    private static void showFolderChooser(final Activity activity, final boolean z) {
        if (!currentDir.exists()) {
            currentDir = Environment.getExternalStorageDirectory();
        }
        File[] listFiles = currentDir.listFiles();
        final ArrayList arrayList = new ArrayList();
        arrayList.add(".. [Up]");
        if (listFiles != null) {
            for (File file : listFiles) {
                if (file.isDirectory() && !file.isHidden()) {
                    arrayList.add(file.getName() + "/");
                }
            }
        }
        Collections.sort(arrayList);
        AlertDialog.Builder builder = new AlertDialog.Builder(activity);
        builder.setTitle("Select Folder: " + currentDir.getName());
        builder.setItems((CharSequence[]) arrayList.toArray(new String[0]), new DialogInterface.OnClickListener() { // from class: com.gemini.chat.ConfigManager.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                if (i == 0) {
                    if (ConfigManager.currentDir.getParentFile() != null) {
                        ConfigManager.currentDir = ConfigManager.currentDir.getParentFile();
                    }
                    ConfigManager.m6$$Nest$smshowFolderChooser(activity, z);
                } else {
                    ConfigManager.currentDir = new File(ConfigManager.currentDir, ((String) arrayList.get(i)).substring(0, r2.length() - 1));
                    ConfigManager.m6$$Nest$smshowFolderChooser(activity, z);
                }
            }
        });
        builder.setPositiveButton("Choose This Folder", new DialogInterface.OnClickListener() { // from class: com.gemini.chat.ConfigManager.2
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                ConfigManager.showSaveNameDialog(activity, z, ConfigManager.currentDir);
            }
        });
        builder.setNegativeButton("Cancel", (DialogInterface.OnClickListener) null);
        builder.show();
    }

    public static void showSaveNameDialog(final Activity activity, final boolean z, final File file) {
        AlertDialog.Builder builder = new AlertDialog.Builder(activity);
        builder.setTitle("Save As");
        final EditText editText = new EditText(activity);
        editText.setInputType(1);
        String format = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        String str = z ? "Chats_" : "Settings_";
        String str2 = z ? ".db" : ".xml";
        String str3 = str + format + str2;
        editText.setText(str3);
        editText.setSelection(0, str3.length() - str2.length());
        LinearLayout linearLayout = new LinearLayout(activity);
        linearLayout.setPadding(20, 20, 20, 20);
        linearLayout.addView(editText, new LinearLayout.LayoutParams(-1, -2));
        builder.setView(linearLayout);
        builder.setPositiveButton("Save", new DialogInterface.OnClickListener() { // from class: com.gemini.chat.ConfigManager.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                ConfigManager.performExport(activity, z, new File(file, editText.getText().toString()));
                activity.finish();
            }
        });
        builder.setNegativeButton("Cancel", (DialogInterface.OnClickListener) null);
        builder.show();
    }

    private static void showFileChooser(final Activity activity, final boolean z) {
        if (!currentDir.exists()) {
            currentDir = Environment.getExternalStorageDirectory();
        }
        File[] listFiles = currentDir.listFiles();
        ArrayList arrayList = new ArrayList();
        arrayList.add(".. [Up]");
        final ArrayList arrayList2 = new ArrayList();
        arrayList2.add(currentDir.getParentFile());
        String str = z ? ".db" : ".xml";
        if (listFiles != null) {
            for (File file : listFiles) {
                if (file.isDirectory() && !file.isHidden()) {
                    arrayList.add(file.getName() + "/");
                    arrayList2.add(file);
                }
            }
            for (File file2 : listFiles) {
                if (file2.isFile() && !file2.isHidden() && file2.getName().toLowerCase().endsWith(str)) {
                    arrayList.add(file2.getName());
                    arrayList2.add(file2);
                }
            }
        }
        AlertDialog.Builder builder = new AlertDialog.Builder(activity);
        builder.setTitle("Select File: " + currentDir.getName());
        builder.setItems((CharSequence[]) arrayList.toArray(new String[0]), new DialogInterface.OnClickListener() { // from class: com.gemini.chat.ConfigManager.4
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                if (i == 0) {
                    if (ConfigManager.currentDir.getParentFile() != null) {
                        ConfigManager.currentDir = ConfigManager.currentDir.getParentFile();
                    }
                    ConfigManager.m5$$Nest$smshowFileChooser(activity, z);
                } else {
                    File file3 = (File) arrayList2.get(i);
                    if (file3.isDirectory()) {
                        ConfigManager.currentDir = file3;
                        ConfigManager.m5$$Nest$smshowFileChooser(activity, z);
                    } else {
                        ConfigManager.performImport(activity, z, file3);
                    }
                }
            }
        });
        builder.setNegativeButton("Cancel", (DialogInterface.OnClickListener) null);
        builder.show();
    }

    public static void performExport(Activity activity, boolean z, File file) {
        try {
            File internalFile = getInternalFile(activity, z);
            if (!internalFile.exists()) {
                Toast.makeText(activity, "No internal file found to export", 1).show();
            } else {
                copyFile(internalFile, file);
                Toast.makeText(activity, "Exported to: " + file.getName(), 1).show();
            }
        } catch (Exception e) {
            Toast.makeText(activity, "Export Failed", 1).show();
        }
    }

    private static void copyFile(File file, File file2) throws Exception {
        FileChannel fileChannel;
        FileOutputStream fileOutputStream;
        FileInputStream fileInputStream;
        FileOutputStream fileOutputStream2;
        FileChannel channel;
        FileChannel fileChannel2 = null;
        try {
            fileInputStream = new FileInputStream(file);
            try {
                fileOutputStream2 = new FileOutputStream(file2);
                try {
                    channel = fileInputStream.getChannel();
                } catch (Throwable th) {
                    th = th;
                    fileOutputStream = fileOutputStream2;
                    fileChannel = null;
                }
            } catch (Throwable th2) {
                th = th2;
                fileChannel = null;
                fileOutputStream = null;
            }
        } catch (Throwable th3) {
            th = th3;
            fileChannel = null;
            fileOutputStream = null;
            fileInputStream = null;
        }
        try {
            fileChannel2 = fileOutputStream2.getChannel();
            channel.transferTo(0L, channel.size(), fileChannel2);
            if (channel != null) {
                try {
                    channel.close();
                } catch (Exception e) {
                }
            }
            if (fileChannel2 != null) {
                try {
                    fileChannel2.close();
                } catch (Exception e2) {
                }
            }
            try {
                fileInputStream.close();
            } catch (Exception e3) {
            }
            try {
                fileOutputStream2.close();
            } catch (Exception e4) {
            }
        } catch (Throwable th4) {
            th = th4;
            fileOutputStream = fileOutputStream2;
            fileChannel = fileChannel2;
            fileChannel2 = channel;
            if (fileChannel2 != null) {
                try {
                    fileChannel2.close();
                } catch (Exception e5) {
                }
            }
            if (fileChannel != null) {
                try {
                    fileChannel.close();
                } catch (Exception e6) {
                }
            }
            if (fileInputStream != null) {
                try {
                    fileInputStream.close();
                } catch (Exception e7) {
                }
            }
            if (fileOutputStream != null) {
                try {
                    fileOutputStream.close();
                    throw th;
                } catch (Exception e8) {
                    throw th;
                }
            }
            throw th;
        }
    }
}
