.class Lcom/gemini/chat/ChatActivity$1;
.super Ljava/lang/Object;
.source "ChatActivity.java"

# interfaces
.implements Lcom/gemini/chat/AutoNamer$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ChatActivity;->maybeAutoName()V
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
    .line 463
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$1;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onNamed(JLjava/lang/String;)V
    .locals 3

    .prologue
    .line 465
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$1;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$900(Lcom/gemini/chat/ChatActivity;)J

    move-result-wide v0

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$1;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-virtual {v0, p3}, Lcom/gemini/chat/ChatActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 466
    :cond_0
    return-void
.end method
