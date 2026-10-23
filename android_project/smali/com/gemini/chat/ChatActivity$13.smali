.class Lcom/gemini/chat/ChatActivity$13;
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

.field final synthetic val$msgId:J


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatActivity;Landroid/widget/EditText;J)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 1042
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$13;->this$0:Lcom/gemini/chat/ChatActivity;

    iput-object p2, p0, Lcom/gemini/chat/ChatActivity$13;->val$et:Landroid/widget/EditText;

    iput-wide p3, p0, Lcom/gemini/chat/ChatActivity$13;->val$msgId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 1044
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$13;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$13;->val$et:Landroid/widget/EditText;

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$3000(Lcom/gemini/chat/ChatActivity;Landroid/view/View;)V

    .line 1045
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$13;->val$et:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1046
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 1047
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$13;->this$0:Lcom/gemini/chat/ChatActivity;

    const-string v1, "Empty reply not saved. Use Delete Message instead."

    invoke-static {v0, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 1048
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1053
    :goto_0
    return-void

    .line 1051
    :cond_0
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$13;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v1}, Lcom/gemini/chat/ChatActivity;->access$000(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/DatabaseHelper;

    move-result-object v1

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity$13;->val$msgId:J

    invoke-virtual {v1, v2, v3, v0}, Lcom/gemini/chat/DatabaseHelper;->updateMessage(JLjava/lang/String;)V

    .line 1052
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$13;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0, v4}, Lcom/gemini/chat/ChatActivity;->access$2700(Lcom/gemini/chat/ChatActivity;Z)V

    goto :goto_0
.end method
