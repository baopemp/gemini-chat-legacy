.class Lcom/gemini/chat/ChatActivity$11;
.super Ljava/lang/Object;
.source "ChatActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ChatActivity;->showEditDialog(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/ChatActivity;

.field final synthetic val$et:Landroid/widget/EditText;

.field final synthetic val$hasImage:Z

.field final synthetic val$msgId:J


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatActivity;Landroid/widget/EditText;ZJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 1021
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$11;->this$0:Lcom/gemini/chat/ChatActivity;

    iput-object p2, p0, Lcom/gemini/chat/ChatActivity$11;->val$et:Landroid/widget/EditText;

    iput-boolean p3, p0, Lcom/gemini/chat/ChatActivity$11;->val$hasImage:Z

    iput-wide p4, p0, Lcom/gemini/chat/ChatActivity$11;->val$msgId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6

    .prologue
    .line 1023
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$11;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$11;->val$et:Landroid/widget/EditText;

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$3000(Lcom/gemini/chat/ChatActivity;Landroid/view/View;)V

    .line 1024
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$11;->val$et:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 1025
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/gemini/chat/ChatActivity$11;->val$hasImage:Z

    if-nez v1, :cond_0

    .line 1030
    :goto_0
    return-void

    .line 1026
    :cond_0
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$11;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v1}, Lcom/gemini/chat/ChatActivity;->access$000(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/DatabaseHelper;

    move-result-object v1

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity$11;->val$msgId:J

    invoke-virtual {v1, v2, v3, v0}, Lcom/gemini/chat/DatabaseHelper;->updateMessage(JLjava/lang/String;)V

    .line 1027
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$11;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$000(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/DatabaseHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$11;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v1}, Lcom/gemini/chat/ChatActivity;->access$900(Lcom/gemini/chat/ChatActivity;)J

    move-result-wide v2

    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity$11;->val$msgId:J

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/gemini/chat/DatabaseHelper;->deleteMessagesAfter(JJ)V

    .line 1028
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$11;->this$0:Lcom/gemini/chat/ChatActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$2700(Lcom/gemini/chat/ChatActivity;Z)V

    .line 1029
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$11;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$2800(Lcom/gemini/chat/ChatActivity;)V

    goto :goto_0
.end method
