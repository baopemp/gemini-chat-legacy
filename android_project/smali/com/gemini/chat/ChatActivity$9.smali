.class Lcom/gemini/chat/ChatActivity$9;
.super Ljava/lang/Object;
.source "ChatActivity.java"

# interfaces
.implements Lcom/gemini/chat/ReadAloud$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ChatActivity;->readAloud(JLjava/lang/String;)V
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
    .line 992
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$9;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDone(Lcom/gemini/chat/ReadAloud;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 994
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$9;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$2200(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ReadAloud;

    move-result-object v0

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$9;->this$0:Lcom/gemini/chat/ChatActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$2202(Lcom/gemini/chat/ChatActivity;Lcom/gemini/chat/ReadAloud;)Lcom/gemini/chat/ReadAloud;

    .line 995
    :cond_0
    if-eqz p2, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$9;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-virtual {v0}, Lcom/gemini/chat/ChatActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$9;->this$0:Lcom/gemini/chat/ChatActivity;

    const/4 v1, 0x1

    invoke-static {v0, p2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 996
    :cond_1
    return-void
.end method
