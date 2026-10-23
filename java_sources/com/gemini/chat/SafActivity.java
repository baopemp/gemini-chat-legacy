package com.gemini.chat;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.widget.Toast;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

/* loaded from: classes.dex */
public class SafActivity extends Activity {
    private boolean isChat;
    private boolean isExport;

    private void performImportSaf(Uri uri) {
        InputStream inputStream = null;
        try {
            inputStream = getContentResolver().openInputStream(uri);
            ConfigManager.importFromStream(this, this.isChat, inputStream);
        } catch (Exception e) {
            Toast.makeText(this, "Import Failed", 1).show();
        }
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (Exception unused) {
            }
        }
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = getIntent();
        this.isChat = intent.getBooleanExtra("isChat", true);
        this.isExport = intent.getBooleanExtra("isExport", true);
        if (Build.VERSION.SDK_INT >= 19) {
            if (this.isExport) {
                Intent intent2 = new Intent("android.intent.action.CREATE_DOCUMENT");
                intent2.addCategory("android.intent.category.OPENABLE");
                boolean z = this.isChat;
                String str = (z ? "Chats_" : "Settings_") + new SimpleDateFormat("yyyy-MM-dd").format(new Date()) + (z ? ".db" : ".xml");
                intent2.setType("*/*");
                intent2.putExtra("android.intent.extra.TITLE", str);
                startActivityForResult(intent2, 1);
                return;
            }
            Intent intent3 = new Intent("android.intent.action.OPEN_DOCUMENT");
            intent3.addCategory("android.intent.category.OPENABLE");
            intent3.setType("*/*");
            startActivityForResult(intent3, 2);
            return;
        }
        finish();
    }

    @Override // android.app.Activity
    protected void onActivityResult(int i, int i2, Intent intent) {
        if (i2 == -1 && intent != null && intent.getData() != null) {
            Uri data = intent.getData();
            if (i == 1 && this.isExport) {
                performExportSaf(data);
            } else if (i == 2 && !this.isExport) {
                performImportSaf(data);
            }
        }
        finish();
    }

    /* JADX WARN: Removed duplicated region for block: B:55:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0088 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0080 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void performExportSaf(android.net.Uri r7) {
        /*
            r6 = this;
            r0 = 1
            r1 = 0
            boolean r3 = r6.isChat     // Catch: java.lang.Throwable -> L58 java.lang.Exception -> L5b
            java.io.File r4 = com.gemini.chat.ConfigManager.getInternalFile(r6, r3)     // Catch: java.lang.Throwable -> L58 java.lang.Exception -> L5b
            boolean r2 = r4.exists()     // Catch: java.lang.Throwable -> L58 java.lang.Exception -> L5b
            if (r2 == 0) goto L3f
            android.content.ContentResolver r2 = r6.getContentResolver()     // Catch: java.lang.Throwable -> L58 java.lang.Exception -> L5b
            java.io.OutputStream r7 = r2.openOutputStream(r7)     // Catch: java.lang.Throwable -> L58 java.lang.Exception -> L5b
            java.io.FileInputStream r2 = new java.io.FileInputStream     // Catch: java.lang.Exception -> L3d java.lang.Throwable -> L7a
            r2.<init>(r4)     // Catch: java.lang.Exception -> L3d java.lang.Throwable -> L7a
            r1 = 1024(0x400, float:1.435E-42)
            byte[] r1 = new byte[r1]     // Catch: java.lang.Throwable -> L37 java.lang.Exception -> L3a
        L21:
            int r3 = r2.read(r1)     // Catch: java.lang.Throwable -> L37 java.lang.Exception -> L3a
            if (r3 <= 0) goto L2c
            r4 = 0
            r7.write(r1, r4, r3)     // Catch: java.lang.Throwable -> L37 java.lang.Exception -> L3a
            goto L21
        L2c:
            java.lang.String r1 = "Exported successfully!"
            android.widget.Toast r1 = android.widget.Toast.makeText(r6, r1, r0)     // Catch: java.lang.Throwable -> L37 java.lang.Exception -> L3a
            r1.show()     // Catch: java.lang.Throwable -> L37 java.lang.Exception -> L3a
            r1 = r2
            goto L49
        L37:
            r0 = move-exception
            r1 = r2
            goto L7b
        L3a:
            r1 = move-exception
            r1 = r2
            goto L5d
        L3d:
            r2 = move-exception
            goto L5d
        L3f:
            java.lang.String r7 = "No internal file found to export"
            android.widget.Toast r7 = android.widget.Toast.makeText(r6, r7, r0)     // Catch: java.lang.Throwable -> L58 java.lang.Exception -> L5b
            r7.show()     // Catch: java.lang.Throwable -> L58 java.lang.Exception -> L5b
            r7 = r1
        L49:
            if (r1 == 0) goto L50
            r1.close()     // Catch: java.lang.Exception -> L4f
            goto L50
        L4f:
            r3 = move-exception
        L50:
            if (r7 == 0) goto L78
            r7.close()     // Catch: java.lang.Exception -> L56
            goto L57
        L56:
            r3 = move-exception
        L57:
            goto L78
        L58:
            r7 = move-exception
            r0 = r1
            goto L7e
        L5b:
            r7 = move-exception
            r7 = r1
        L5d:
            java.lang.String r2 = "Export Failed"
            android.widget.Toast r0 = android.widget.Toast.makeText(r6, r2, r0)     // Catch: java.lang.Throwable -> L7a
            r0.show()     // Catch: java.lang.Throwable -> L7a
            if (r1 == 0) goto L6e
            r1.close()     // Catch: java.lang.Exception -> L6c
            goto L6e
        L6c:
            r7 = move-exception
            goto L77
        L6e:
            if (r7 == 0) goto L78
            r7.close()     // Catch: java.lang.Exception -> L74
            goto L76
        L74:
            r7 = move-exception
            goto L77
        L76:
            goto L78
        L77:
            goto L79
        L78:
        L79:
            return
        L7a:
            r0 = move-exception
        L7b:
            r5 = r0
            r0 = r7
            r7 = r5
        L7e:
            if (r1 == 0) goto L86
            r1.close()     // Catch: java.lang.Exception -> L84
            goto L86
        L84:
            r0 = move-exception
            goto L8e
        L86:
            if (r0 == 0) goto L8e
            r0.close()     // Catch: java.lang.Exception -> L8c
            goto L8e
        L8c:
            r0 = move-exception
            goto L8e
        L8e:
            goto L91
        L90:
            throw r7
        L91:
            goto L90
        */
        throw new UnsupportedOperationException("Method not decompiled: com.gemini.chat.SafActivity.performExportSaf(android.net.Uri):void");
    }
}
