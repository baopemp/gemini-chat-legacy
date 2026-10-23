.class Lcom/gemini/chat/LiveActivity$Transcriber$3;
.super Ljava/lang/Object;
.source "LiveActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/LiveActivity$Transcriber;->onClosed(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/gemini/chat/LiveActivity$Transcriber;


# direct methods
.method constructor <init>(Lcom/gemini/chat/LiveActivity$Transcriber;)V
    .locals 0

    .prologue
    .line 527
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$Transcriber$3;->this$1:Lcom/gemini/chat/LiveActivity$Transcriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 529
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Transcriber$3;->this$1:Lcom/gemini/chat/LiveActivity$Transcriber;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Transcriber;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$3100(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveSession;

    move-result-object v0

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Transcriber$3;->this$1:Lcom/gemini/chat/LiveActivity$Transcriber;

    iget-object v1, v1, Lcom/gemini/chat/LiveActivity$Transcriber;->self:Lcom/gemini/chat/LiveSession;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Transcriber$3;->this$1:Lcom/gemini/chat/LiveActivity$Transcriber;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Transcriber;->this$0:Lcom/gemini/chat/LiveActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/gemini/chat/LiveActivity;->access$3102(Lcom/gemini/chat/LiveActivity;Lcom/gemini/chat/LiveSession;)Lcom/gemini/chat/LiveSession;

    .line 530
    :cond_0
    return-void
.end method
