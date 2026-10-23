.class final Lcom/gemini/chat/LiveActivity$Main;
.super Ljava/lang/Object;
.source "LiveActivity.java"

# interfaces
.implements Lcom/gemini/chat/LiveSession$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/LiveActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Main"
.end annotation


# instance fields
.field final gen:I

.field final synthetic this$0:Lcom/gemini/chat/LiveActivity;


# direct methods
.method constructor <init>(Lcom/gemini/chat/LiveActivity;I)V
    .locals 0

    .prologue
    .line 373
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 374
    iput p2, p0, Lcom/gemini/chat/LiveActivity$Main;->gen:I

    .line 375
    return-void
.end method

.method static synthetic access$700(Lcom/gemini/chat/LiveActivity$Main;)Z
    .locals 1

    .prologue
    .line 370
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity$Main;->current()Z

    move-result v0

    return v0
.end method

.method private current()Z
    .locals 2

    .prologue
    .line 378
    iget v0, p0, Lcom/gemini/chat/LiveActivity$Main;->gen:I

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v1}, Lcom/gemini/chat/LiveActivity;->access$500(Lcom/gemini/chat/LiveActivity;)I

    move-result v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$600(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onAudio([B)V
    .locals 2

    .prologue
    .line 420
    iget v0, p0, Lcom/gemini/chat/LiveActivity$Main;->gen:I

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v1}, Lcom/gemini/chat/LiveActivity;->access$500(Lcom/gemini/chat/LiveActivity;)I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 423
    :goto_0
    return-void

    .line 421
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/gemini/chat/LiveActivity;->access$2302(Lcom/gemini/chat/LiveActivity;Z)Z

    .line 422
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2400(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveActivity$Player;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/gemini/chat/LiveActivity$Player;->enqueue([B)V

    goto :goto_0
.end method

.method public onClosed(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 396
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1200(Lcom/gemini/chat/LiveActivity;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/gemini/chat/LiveActivity$Main$2;

    invoke-direct {v1, p0, p1}, Lcom/gemini/chat/LiveActivity$Main$2;-><init>(Lcom/gemini/chat/LiveActivity$Main;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 417
    return-void
.end method

.method public onInputText(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 426
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1200(Lcom/gemini/chat/LiveActivity;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/gemini/chat/LiveActivity$Main$3;

    invoke-direct {v1, p0, p1}, Lcom/gemini/chat/LiveActivity$Main$3;-><init>(Lcom/gemini/chat/LiveActivity$Main;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 433
    return-void
.end method

.method public onInterimInput(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 436
    return-void
.end method

.method public onInterrupted()V
    .locals 2

    .prologue
    .line 466
    iget v0, p0, Lcom/gemini/chat/LiveActivity$Main;->gen:I

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v1}, Lcom/gemini/chat/LiveActivity;->access$500(Lcom/gemini/chat/LiveActivity;)I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 475
    :goto_0
    return-void

    .line 467
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2400(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveActivity$Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->flush()V

    .line 468
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1200(Lcom/gemini/chat/LiveActivity;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/gemini/chat/LiveActivity$Main$6;

    invoke-direct {v1, p0}, Lcom/gemini/chat/LiveActivity$Main$6;-><init>(Lcom/gemini/chat/LiveActivity$Main;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public onOutputText(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 439
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2400(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveActivity$Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->lastChunkStart()J

    move-result-wide v0

    .line 440
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/gemini/chat/LiveActivity;->access$2302(Lcom/gemini/chat/LiveActivity;Z)Z

    .line 441
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v2}, Lcom/gemini/chat/LiveActivity;->access$1200(Lcom/gemini/chat/LiveActivity;)Landroid/os/Handler;

    move-result-object v2

    new-instance v3, Lcom/gemini/chat/LiveActivity$Main$4;

    invoke-direct {v3, p0, v0, v1, p1}, Lcom/gemini/chat/LiveActivity$Main$4;-><init>(Lcom/gemini/chat/LiveActivity$Main;JLjava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 451
    return-void
.end method

.method public onReady()V
    .locals 2

    .prologue
    .line 382
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1200(Lcom/gemini/chat/LiveActivity;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/gemini/chat/LiveActivity$Main$1;

    invoke-direct {v1, p0}, Lcom/gemini/chat/LiveActivity$Main$1;-><init>(Lcom/gemini/chat/LiveActivity$Main;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 393
    return-void
.end method

.method public onTurnComplete()V
    .locals 2

    .prologue
    .line 454
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1200(Lcom/gemini/chat/LiveActivity;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/gemini/chat/LiveActivity$Main$5;

    invoke-direct {v1, p0}, Lcom/gemini/chat/LiveActivity$Main$5;-><init>(Lcom/gemini/chat/LiveActivity$Main;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 463
    return-void
.end method
