package com.gemini.chat;

import android.app.AlertDialog;
import android.app.ListActivity;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.os.Build;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;
import javax.net.ssl.HttpsURLConnection;

/* loaded from: classes.dex */
public class ChatListActivity extends ListActivity {
    private SimpleCursorAdapter adapter;
    private Cursor cursor;
    private DatabaseHelper dbHelper;

    @Override // android.app.Activity
    public boolean onContextItemSelected(MenuItem menuItem) {
        ContextMenu.ContextMenuInfo menuInfo = menuItem.getMenuInfo();
        if (!(menuInfo instanceof AdapterView.AdapterContextMenuInfo)) {
            return super.onContextItemSelected(menuItem);
        }
        AdapterView.AdapterContextMenuInfo adapterContextMenuInfo = (AdapterView.AdapterContextMenuInfo) menuInfo;
        final long j = adapterContextMenuInfo.id;
        if (menuItem.getItemId() != 1) {
            if (menuItem.getItemId() != 2) {
                return super.onContextItemSelected(menuItem);
            }
            new AlertDialog.Builder(this).setTitle("Delete Chat").setMessage("Are you sure you want to delete this chat?").setPositiveButton("Delete", new DialogInterface.OnClickListener() { // from class: com.gemini.chat.ChatListActivity.2
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i) {
                    ChatListActivity.this.dbHelper.deleteChat(j);
                    if (ChatListActivity.this.cursor != null) {
                        ChatListActivity.this.cursor.requery();
                    }
                    Compat.invalidateMenu(ChatListActivity.this);
                }
            }).setNegativeButton("Cancel", (DialogInterface.OnClickListener) null).show();
            return true;
        }
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Rename Chat");
        final EditText editText = new EditText(this);
        Cursor cursor = (Cursor) this.adapter.getItem(adapterContextMenuInfo.position);
        if (cursor != null) {
            String string = cursor.getString(cursor.getColumnIndex("title"));
            if (string == null) {
                string = "";
            }
            editText.setText(string);
            editText.setSelection(string.length());
        }
        builder.setView(editText);
        builder.setPositiveButton("Save", new DialogInterface.OnClickListener() { // from class: com.gemini.chat.ChatListActivity.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                String trim = editText.getText().toString().trim();
                if (trim.length() > 0) {
                    ChatListActivity.this.dbHelper.updateChatTitle(j, trim);
                    if (ChatListActivity.this.cursor != null) {
                        ChatListActivity.this.cursor.requery();
                    }
                }
                Compat.invalidateMenu(ChatListActivity.this);
            }
        });
        builder.setNegativeButton("Cancel", (DialogInterface.OnClickListener) null);
        builder.show();
        return true;
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.chat_list);
        try {
            int i = Build.VERSION.SDK_INT;
            if (i >= 16 && i <= 19) {
                HttpsURLConnection.setDefaultSSLSocketFactory(new TLSSocketFactory());
            }
        } catch (Exception unused) {
        }
        this.dbHelper = new DatabaseHelper(this);
        try {
            this.cursor = this.dbHelper.getChats();
            startManagingCursor(this.cursor);
            this.adapter = new SimpleCursorAdapter(this, R.layout.list_item, this.cursor, new String[]{"title"}, new int[]{android.R.id.text1});
            setListAdapter(this.adapter);
            registerForContextMenu(getListView());
        } catch (Exception e) {
        }
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        if (this.cursor != null) {
            try {
                this.cursor.requery();
            } catch (Exception e) {
            }
        }
        Compat.invalidateMenu(this);
    }

    @Override // android.app.Activity, android.view.View.OnCreateContextMenuListener
    public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenu.ContextMenuInfo contextMenuInfo) {
        super.onCreateContextMenu(contextMenu, view, contextMenuInfo);
        contextMenu.add(0, 1, 0, "Rename Chat");
        contextMenu.add(0, 2, 0, "Delete Chat");
    }

    @Override // android.app.ListActivity
    protected void onListItemClick(ListView listView, View view, int i, long j) {
        Intent intent = new Intent(this, (Class<?>) ChatActivity.class);
        intent.putExtra("chat_id", j);
        startActivity(intent);
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        menu.add(0, 1, 0, "New Chat").setIcon(android.R.drawable.ic_menu_add);
        menu.add(0, 2, 0, "Settings").setIcon(android.R.drawable.ic_menu_preferences);
        menu.add(0, 3, 0, "Delete All Chats").setIcon(android.R.drawable.ic_menu_delete);
        return true;
    }

    @Override // android.app.Activity
    public boolean onPrepareOptionsMenu(Menu menu) {
        MenuItem findItem = menu.findItem(3);
        if (findItem != null) {
            boolean z = false;
            if (this.cursor != null && this.cursor.getCount() > 0) {
                z = true;
            }
            findItem.setVisible(z);
        }
        return super.onPrepareOptionsMenu(menu);
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() == 1) {
            Intent intent = new Intent(this, (Class<?>) ChatActivity.class);
            intent.putExtra("chat_id", -1L);
            startActivity(intent);
            return true;
        }
        if (menuItem.getItemId() == 2) {
            startActivity(new Intent(this, (Class<?>) SettingsActivity.class));
            return true;
        }
        if (menuItem.getItemId() == 3) {
            new AlertDialog.Builder(this).setTitle("Delete All Chats").setMessage("Are you sure you want to delete ALL chats? This cannot be undone.").setPositiveButton("Delete All", new DialogInterface.OnClickListener() { // from class: com.gemini.chat.ChatListActivity.3
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i) {
                    ChatListActivity.this.dbHelper.deleteAllChats();
                    if (ChatListActivity.this.cursor != null) {
                        try {
                            ChatListActivity.this.cursor.requery();
                        } catch (Exception e) {
                        }
                    }
                    Compat.invalidateMenu(ChatListActivity.this);
                }
            }).setNegativeButton("Cancel", (DialogInterface.OnClickListener) null).show();
            return true;
        }
        return super.onOptionsItemSelected(menuItem);
    }

    @Override // android.app.ListActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        if (this.cursor != null) {
            this.cursor.close();
        }
        if (this.dbHelper != null) {
            this.dbHelper.close();
        }
    }
}
