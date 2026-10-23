.class Lcom/gemini/chat/ChatListActivity$2;
.super Ljava/lang/Object;
.source "ChatListActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ChatListActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/ChatListActivity;

.field final synthetic val$id:J


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatListActivity;J)V
    .locals 0

    .prologue
    .line 98
    iput-object p1, p0, Lcom/gemini/chat/ChatListActivity$2;->this$0:Lcom/gemini/chat/ChatListActivity;

    iput-wide p2, p0, Lcom/gemini/chat/ChatListActivity$2;->val$id:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    .prologue
    .line 100
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity$2;->this$0:Lcom/gemini/chat/ChatListActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatListActivity;->access$000(Lcom/gemini/chat/ChatListActivity;)Lcom/gemini/chat/DatabaseHelper;

    move-result-object v0

    iget-wide v2, p0, Lcom/gemini/chat/ChatListActivity$2;->val$id:J

    invoke-virtual {v0, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->deleteChat(J)V

    .line 101
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity$2;->this$0:Lcom/gemini/chat/ChatListActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatListActivity;->access$100(Lcom/gemini/chat/ChatListActivity;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity$2;->this$0:Lcom/gemini/chat/ChatListActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatListActivity;->access$100(Lcom/gemini/chat/ChatListActivity;)Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->requery()Z

    .line 102
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity$2;->this$0:Lcom/gemini/chat/ChatListActivity;

    invoke-static {v0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    return-void
.end method
