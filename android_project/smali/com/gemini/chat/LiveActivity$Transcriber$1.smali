.class Lcom/gemini/chat/LiveActivity$Transcriber$1;
.super Ljava/lang/Object;
.source "LiveActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/LiveActivity$Transcriber;->onInterimInput(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/gemini/chat/LiveActivity$Transcriber;

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/gemini/chat/LiveActivity$Transcriber;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 573
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$Transcriber$1;->this$1:Lcom/gemini/chat/LiveActivity$Transcriber;

    iput-object p2, p0, Lcom/gemini/chat/LiveActivity$Transcriber$1;->val$text:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 575
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Transcriber$1;->this$1:Lcom/gemini/chat/LiveActivity$Transcriber;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Transcriber;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$600(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Transcriber$1;->this$1:Lcom/gemini/chat/LiveActivity$Transcriber;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Transcriber;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2900(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Transcriber$1;->this$1:Lcom/gemini/chat/LiveActivity$Transcriber;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Transcriber;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$3000(Lcom/gemini/chat/LiveActivity;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 578
    :cond_0
    :goto_0
    return-void

    .line 576
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Transcriber$1;->this$1:Lcom/gemini/chat/LiveActivity$Transcriber;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Transcriber;->this$0:Lcom/gemini/chat/LiveActivity;

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Transcriber$1;->val$text:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/gemini/chat/LiveActivity;->access$3102(Lcom/gemini/chat/LiveActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 577
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Transcriber$1;->this$1:Lcom/gemini/chat/LiveActivity$Transcriber;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Transcriber;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2600(Lcom/gemini/chat/LiveActivity;)V

    goto :goto_0
.end method
