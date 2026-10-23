.class Lcom/gemini/chat/ChatListActivity$3;
.super Ljava/lang/Object;
.source "ChatListActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ChatListActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/ChatListActivity;


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatListActivity;)V
    .locals 0

    .prologue
    .line 153
    iput-object p1, p0, Lcom/gemini/chat/ChatListActivity$3;->this$0:Lcom/gemini/chat/ChatListActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity$3;->this$0:Lcom/gemini/chat/ChatListActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatListActivity;->access$000(Lcom/gemini/chat/ChatListActivity;)Lcom/gemini/chat/DatabaseHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gemini/chat/DatabaseHelper;->deleteAllChats()V

    .line 156
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity$3;->this$0:Lcom/gemini/chat/ChatListActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatListActivity;->access$100(Lcom/gemini/chat/ChatListActivity;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 158
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity$3;->this$0:Lcom/gemini/chat/ChatListActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatListActivity;->access$100(Lcom/gemini/chat/ChatListActivity;)Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->requery()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity$3;->this$0:Lcom/gemini/chat/ChatListActivity;

    invoke-static {v0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    return-void

    .line 159
    :catch_0
    move-exception v0

    goto :goto_0
.end method
