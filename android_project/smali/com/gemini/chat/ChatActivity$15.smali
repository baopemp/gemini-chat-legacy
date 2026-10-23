.class Lcom/gemini/chat/ChatActivity$15;
.super Ljava/lang/Object;
.source "ChatActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ChatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/ChatActivity;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatActivity;Landroid/widget/EditText;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 1140
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$15;->this$0:Lcom/gemini/chat/ChatActivity;

    iput-object p2, p0, Lcom/gemini/chat/ChatActivity$15;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    .prologue
    .line 1142
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$15;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$15;->val$et:Landroid/widget/EditText;

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$3000(Lcom/gemini/chat/ChatActivity;Landroid/view/View;)V

    .line 1143
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$15;->val$et:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 1144
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 1147
    :goto_0
    return-void

    .line 1145
    :cond_0
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$15;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v1}, Lcom/gemini/chat/ChatActivity;->access$000(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/DatabaseHelper;

    move-result-object v1

    iget-object v2, p0, Lcom/gemini/chat/ChatActivity$15;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v2}, Lcom/gemini/chat/ChatActivity;->access$900(Lcom/gemini/chat/ChatActivity;)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3, v0}, Lcom/gemini/chat/DatabaseHelper;->updateChatTitle(JLjava/lang/String;)V

    .line 1146
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$15;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-virtual {v1, v0}, Lcom/gemini/chat/ChatActivity;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
