.class public Lcom/gemini/chat/ChatListActivity;
.super Landroid/app/ListActivity;
.source "ChatListActivity.java"


# instance fields
.field private adapter:Landroid/widget/SimpleCursorAdapter;

.field private cursor:Landroid/database/Cursor;

.field private dbHelper:Lcom/gemini/chat/DatabaseHelper;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/gemini/chat/ChatListActivity;)Lcom/gemini/chat/DatabaseHelper;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    return-object v0
.end method

.method static synthetic access$100(Lcom/gemini/chat/ChatListActivity;)Landroid/database/Cursor;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity;->cursor:Landroid/database/Cursor;

    return-object v0
.end method


# virtual methods
.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/4 v1, 0x1

    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    instance-of v2, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    if-nez v2, :cond_0

    invoke-super {p0, p1}, Landroid/app/ListActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :cond_0
    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    iget-wide v2, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->id:J

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    if-ne v4, v1, :cond_3

    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v5, "Rename Chat"

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    new-instance v5, Landroid/widget/EditText;

    invoke-direct {v5, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iget-object v6, p0, Lcom/gemini/chat/ChatListActivity;->adapter:Landroid/widget/SimpleCursorAdapter;

    iget v0, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v6, v0}, Landroid/widget/SimpleCursorAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    if-eqz v0, :cond_2

    const-string v6, "title"

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    const-string v0, ""

    :cond_1
    invoke-virtual {v5, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v5, v0}, Landroid/widget/EditText;->setSelection(I)V

    :cond_2
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    const-string v0, "Save"

    new-instance v6, Lcom/gemini/chat/ChatListActivity$1;

    invoke-direct {v6, p0, v5, v2, v3}, Lcom/gemini/chat/ChatListActivity$1;-><init>(Lcom/gemini/chat/ChatListActivity;Landroid/widget/EditText;J)V

    invoke-virtual {v4, v0, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string v0, "Cancel"

    invoke-virtual {v4, v0, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move v0, v1

    goto :goto_0

    :cond_3
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v4, 0x2

    if-ne v0, v4, :cond_4

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v4, "Delete Chat"

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v4, "Are you sure you want to delete this chat?"

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v4, "Delete"

    new-instance v5, Lcom/gemini/chat/ChatListActivity$2;

    invoke-direct {v5, p0, v2, v3}, Lcom/gemini/chat/ChatListActivity$2;-><init>(Lcom/gemini/chat/ChatListActivity;J)V

    invoke-virtual {v0, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "Cancel"

    invoke-virtual {v0, v2, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move v0, v1

    goto :goto_0

    :cond_4
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6

    .prologue
    .line 25
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    const/high16 v0, 0x7f030000

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatListActivity;->setContentView(I)V

    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    const/16 v1, 0x13

    if-gt v0, v1, :cond_0

    new-instance v0, Lcom/gemini/chat/TLSSocketFactory;

    invoke-direct {v0}, Lcom/gemini/chat/TLSSocketFactory;-><init>()V

    invoke-static {v0}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    goto :goto_0

    .line 27
    :catch_0
    :goto_0
    new-instance v0, Lcom/gemini/chat/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/gemini/chat/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatListActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    .line 30
    :try_start_1
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    invoke-virtual {v0}, Lcom/gemini/chat/DatabaseHelper;->getChats()Landroid/database/Cursor;

    move-result-object v0

    iput-object v0, p0, Lcom/gemini/chat/ChatListActivity;->cursor:Landroid/database/Cursor;

    .line 31
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity;->cursor:Landroid/database/Cursor;

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatListActivity;->startManagingCursor(Landroid/database/Cursor;)V

    .line 33
    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "title"

    aput-object v1, v4, v0

    .line 34
    const/4 v0, 0x1

    new-array v5, v0, [I

    const/4 v0, 0x0

    const v1, 0x1020014

    aput v1, v5, v0

    .line 35
    new-instance v0, Landroid/widget/SimpleCursorAdapter;

    const v2, 0x7f030001

    iget-object v3, p0, Lcom/gemini/chat/ChatListActivity;->cursor:Landroid/database/Cursor;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/gemini/chat/ChatListActivity;->adapter:Landroid/widget/SimpleCursorAdapter;

    .line 36
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity;->adapter:Landroid/widget/SimpleCursorAdapter;

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatListActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 38
    invoke-virtual {p0}, Lcom/gemini/chat/ChatListActivity;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatListActivity;->registerForContextMenu(Landroid/view/View;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 42
    :goto_1
    return-void

    .line 39
    :catch_1
    move-exception v0

    goto :goto_1
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 56
    invoke-super {p0, p1, p2, p3}, Landroid/app/ListActivity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 57
    const/4 v0, 0x1

    const-string v1, "Rename Chat"

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 58
    const/4 v0, 0x2

    const-string v1, "Delete Chat"

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 59
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 120
    const-string v0, "New Chat"

    invoke-interface {p1, v2, v3, v2, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080033

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 121
    const/4 v0, 0x2

    const-string v1, "Settings"

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080049

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 122
    const/4 v0, 0x3

    const-string v1, "Delete All Chats"

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x108003c

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 123
    return v3
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 172
    invoke-super {p0}, Landroid/app/ListActivity;->onDestroy()V

    .line 173
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity;->cursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    if-eqz v0, :cond_1

    .line 174
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    invoke-virtual {v0}, Lcom/gemini/chat/DatabaseHelper;->close()V

    .line 176
    :cond_1
    return-void
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 2

    .prologue
    .line 113
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/gemini/chat/ChatActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 114
    const-string v1, "chat_id"

    invoke-virtual {v0, v1, p4, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 115
    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatListActivity;->startActivity(Landroid/content/Intent;)V

    .line 116
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 6

    .prologue
    const/4 v0, 0x1

    .line 141
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    if-ne v1, v0, :cond_0

    .line 142
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/gemini/chat/ChatActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 143
    const-string v2, "chat_id"

    const-wide/16 v4, -0x1

    invoke-virtual {v1, v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 144
    invoke-virtual {p0, v1}, Lcom/gemini/chat/ChatListActivity;->startActivity(Landroid/content/Intent;)V

    .line 167
    :goto_0
    return v0

    .line 146
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 147
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/gemini/chat/SettingsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/gemini/chat/ChatListActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 149
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_2

    .line 150
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Delete All Chats"

    .line 151
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Are you sure you want to delete ALL chats? This cannot be undone."

    .line 152
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Delete All"

    new-instance v3, Lcom/gemini/chat/ChatListActivity$3;

    invoke-direct {v3, p0}, Lcom/gemini/chat/ChatListActivity$3;-><init>(Lcom/gemini/chat/ChatListActivity;)V

    .line 153
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Cancel"

    const/4 v3, 0x0

    .line 163
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 164
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 167
    :cond_2
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 3

    .prologue
    .line 128
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 129
    if-eqz v1, :cond_1

    .line 130
    const/4 v0, 0x0

    .line 131
    iget-object v2, p0, Lcom/gemini/chat/ChatListActivity;->cursor:Landroid/database/Cursor;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/gemini/chat/ChatListActivity;->cursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 132
    const/4 v0, 0x1

    .line 134
    :cond_0
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 136
    :cond_1
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 46
    invoke-super {p0}, Landroid/app/ListActivity;->onResume()V

    .line 47
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity;->cursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    .line 49
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->requery()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    :cond_0
    :goto_0
    invoke-static {p0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    return-void

    .line 50
    :catch_0
    move-exception v0

    goto :goto_0
.end method
