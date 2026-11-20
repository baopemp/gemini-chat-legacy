.class Lcom/gemini/chat/ChatActivity$3;
.super Ljava/lang/Object;
.source "ChatActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/ChatActivity;
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
    .line 611
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 613
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$1202(Lcom/gemini/chat/ChatActivity;Z)Z

    .line 614
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$1300(Lcom/gemini/chat/ChatActivity;)Landroid/widget/TextView;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$500(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ChatActivity$GeminiTask;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$1400(Lcom/gemini/chat/ChatActivity;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-virtual {v0}, Lcom/gemini/chat/ChatActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 618
    :cond_0
    :goto_0
    return-void

    .line 615
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v1}, Lcom/gemini/chat/ChatActivity;->access$1500(Lcom/gemini/chat/ChatActivity;)I

    move-result v1

    rem-int/lit8 v1, v1, 0x3

    add-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$1502(Lcom/gemini/chat/ChatActivity;I)I

    .line 616
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$1300(Lcom/gemini/chat/ChatActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-object v2, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v2}, Lcom/gemini/chat/ChatActivity;->access$1600(Lcom/gemini/chat/ChatActivity;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v3}, Lcom/gemini/chat/ChatActivity;->access$1700(Lcom/gemini/chat/ChatActivity;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v4}, Lcom/gemini/chat/ChatActivity;->access$1500(Lcom/gemini/chat/ChatActivity;)I

    move-result v4

    invoke-static {v1, v2, v3, v4}, Lcom/gemini/chat/MessageFormatter;->formatWaiting(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 617
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$1800(Lcom/gemini/chat/ChatActivity;)V

    goto :goto_0
.end method
