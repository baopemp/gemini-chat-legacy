.class Lcom/gemini/chat/ChatActivity$2;
.super Ljava/lang/Object;
.source "ChatActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ChatActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/ChatActivity;


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 527
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$2;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2

    .prologue
    .line 529
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$2;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$200(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ChatActivity$GeminiTask;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$2;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$1100(Lcom/gemini/chat/ChatActivity;)Landroid/widget/Button;

    move-result-object v0

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$2;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v1}, Lcom/gemini/chat/ChatActivity;->access$1000(Lcom/gemini/chat/ChatActivity;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 530
    :cond_0
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .prologue
    .line 533
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .prologue
    .line 536
    return-void
.end method
