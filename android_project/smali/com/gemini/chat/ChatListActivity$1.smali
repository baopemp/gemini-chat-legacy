.class Lcom/gemini/chat/ChatListActivity$1;
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

.field final synthetic val$input:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatListActivity;Landroid/widget/EditText;J)V
    .locals 1

    .prologue
    .line 81
    iput-object p1, p0, Lcom/gemini/chat/ChatListActivity$1;->this$0:Lcom/gemini/chat/ChatListActivity;

    iput-object p2, p0, Lcom/gemini/chat/ChatListActivity$1;->val$input:Landroid/widget/EditText;

    iput-wide p3, p0, Lcom/gemini/chat/ChatListActivity$1;->val$id:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    .prologue
    .line 84
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity$1;->val$input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 85
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 86
    iget-object v1, p0, Lcom/gemini/chat/ChatListActivity$1;->this$0:Lcom/gemini/chat/ChatListActivity;

    invoke-static {v1}, Lcom/gemini/chat/ChatListActivity;->access$000(Lcom/gemini/chat/ChatListActivity;)Lcom/gemini/chat/DatabaseHelper;

    move-result-object v1

    iget-wide v2, p0, Lcom/gemini/chat/ChatListActivity$1;->val$id:J

    invoke-virtual {v1, v2, v3, v0}, Lcom/gemini/chat/DatabaseHelper;->updateChatTitle(JLjava/lang/String;)V

    .line 87
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity$1;->this$0:Lcom/gemini/chat/ChatListActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatListActivity;->access$100(Lcom/gemini/chat/ChatListActivity;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity$1;->this$0:Lcom/gemini/chat/ChatListActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatListActivity;->access$100(Lcom/gemini/chat/ChatListActivity;)Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->requery()Z

    .line 89
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/ChatListActivity$1;->this$0:Lcom/gemini/chat/ChatListActivity;

    invoke-static {v0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    return-void
.end method
