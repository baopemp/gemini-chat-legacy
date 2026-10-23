package com.gemini.chat;

import android.app.Activity;
import android.os.Bundle;
import android.os.Environment;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class FileExplorerActivity extends Activity {
    private ArrayAdapter<String> adapter;
    private File currentDir;
    private List<File> files;
    private boolean isChat;
    private boolean isExport;
    private List<String> items;
    private ListView listView;

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.isExport = getIntent().getBooleanExtra("isExport", false);
        this.isChat = getIntent().getBooleanExtra("isChat", false);
        File file = new File("/sdcard");
        if (file.exists() && file.isDirectory()) {
            this.currentDir = file;
        } else {
            this.currentDir = Environment.getExternalStorageDirectory();
        }
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(1);
        linearLayout.setBackgroundColor(-16777216);
        this.listView = new ListView(this);
        this.listView.setLayoutParams(new LinearLayout.LayoutParams(-1, 0, 1.0f));
        LinearLayout linearLayout2 = new LinearLayout(this);
        linearLayout2.setOrientation(0);
        linearLayout2.setBackgroundColor(-13421773);
        Button button = new Button(this);
        button.setText("Cancel");
        button.setOnClickListener(new View.OnClickListener() { // from class: com.gemini.chat.FileExplorerActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                FileExplorerActivity.this.finish();
            }
        });
        if (this.isExport) {
            Button button2 = new Button(this);
            button2.setText("Choose this folder");
            button2.setOnClickListener(new View.OnClickListener() { // from class: com.gemini.chat.FileExplorerActivity.2
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    ConfigManager.showSaveNameDialog(FileExplorerActivity.this, FileExplorerActivity.this.isChat, FileExplorerActivity.this.currentDir);
                }
            });
            linearLayout2.addView(button2);
        }
        linearLayout2.addView(button);
        linearLayout.addView(this.listView);
        linearLayout.addView(linearLayout2);
        setContentView(linearLayout);
        loadFiles();
        this.listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.gemini.chat.FileExplorerActivity.3
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                if (!((String) FileExplorerActivity.this.items.get(i)).equals(".. [Up]")) {
                    File file2 = (File) FileExplorerActivity.this.files.get(i);
                    if (file2.isDirectory()) {
                        FileExplorerActivity.this.currentDir = file2;
                        FileExplorerActivity.this.loadFiles();
                        return;
                    } else {
                        if (!FileExplorerActivity.this.isExport) {
                            ConfigManager.performImport(FileExplorerActivity.this, FileExplorerActivity.this.isChat, file2);
                            FileExplorerActivity.this.finish();
                            return;
                        }
                        return;
                    }
                }
                FileExplorerActivity.this.currentDir = FileExplorerActivity.this.currentDir.getParentFile();
                FileExplorerActivity.this.loadFiles();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadFiles() {
        this.items = new ArrayList();
        this.files = new ArrayList();
        if (this.currentDir.getParentFile() != null && !this.currentDir.getAbsolutePath().equals("/")) {
            this.items.add(".. [Up]");
            this.files.add(this.currentDir.getParentFile());
        }
        File[] listFiles = this.currentDir.listFiles();
        if (listFiles != null) {
            ArrayList<File> arrayList = new ArrayList();
            ArrayList<File> arrayList2 = new ArrayList();
            for (File file : listFiles) {
                if (!file.isHidden()) {
                    if (file.isDirectory()) {
                        arrayList.add(file);
                    } else {
                        arrayList2.add(file);
                    }
                }
            }
            Collections.sort(arrayList);
            Collections.sort(arrayList2);
            for (File file2 : arrayList) {
                this.items.add(file2.getName() + "/");
                this.files.add(file2);
            }
            for (File file3 : arrayList2) {
                this.items.add(file3.getName());
                this.files.add(file3);
            }
        }
        setTitle(this.currentDir.getAbsolutePath());
        this.adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, this.items);
        this.listView.setAdapter((ListAdapter) this.adapter);
    }
}
