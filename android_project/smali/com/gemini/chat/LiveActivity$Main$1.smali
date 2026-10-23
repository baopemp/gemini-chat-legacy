.class Lcom/gemini/chat/LiveActivity$Main$1;
.super Ljava/lang/Object;
.source "LiveActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/LiveActivity$Main;->onReady()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/gemini/chat/LiveActivity$Main;


# direct methods
.method constructor <init>(Lcom/gemini/chat/LiveActivity$Main;)V
    .locals 0

    .prologue
    .line 390
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$Main$1;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 392
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$1;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity$Main;->access$700(Lcom/gemini/chat/LiveActivity$Main;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 399
    :goto_0
    return-void

    .line 393
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$1;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/gemini/chat/LiveActivity;->access$802(Lcom/gemini/chat/LiveActivity;Z)Z

    .line 394
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$1;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$900(Lcom/gemini/chat/LiveActivity;)V

    .line 395
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$1;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1000(Lcom/gemini/chat/LiveActivity;)V

    .line 396
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$1;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1200(Lcom/gemini/chat/LiveActivity;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Main$1;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v1, v1, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v1}, Lcom/gemini/chat/LiveActivity;->access$1100(Lcom/gemini/chat/LiveActivity;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 397
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$1;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1200(Lcom/gemini/chat/LiveActivity;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Main$1;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v1, v1, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v1}, Lcom/gemini/chat/LiveActivity;->access$1100(Lcom/gemini/chat/LiveActivity;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 398
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$1;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1300(Lcom/gemini/chat/LiveActivity;)V

    goto :goto_0
.end method
