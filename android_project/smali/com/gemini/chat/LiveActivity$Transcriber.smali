.class final Lcom/gemini/chat/LiveActivity$Transcriber;
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
    name = "Transcriber"
.end annotation


# instance fields
.field self:Lcom/gemini/chat/LiveSession;

.field final synthetic this$0:Lcom/gemini/chat/LiveActivity;


# direct methods
.method private constructor <init>(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 479
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$Transcriber;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/gemini/chat/LiveActivity;Lcom/gemini/chat/LiveActivity$1;)V
    .locals 0

    .prologue
    .line 479
    invoke-direct {p0, p1}, Lcom/gemini/chat/LiveActivity$Transcriber;-><init>(Lcom/gemini/chat/LiveActivity;)V

    return-void
.end method


# virtual methods
.method public onAudio([B)V
    .locals 0

    .prologue
    .line 486
    return-void
.end method

.method public onClosed(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 519
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Transcriber;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1200(Lcom/gemini/chat/LiveActivity;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/gemini/chat/LiveActivity$Transcriber$3;

    invoke-direct {v1, p0}, Lcom/gemini/chat/LiveActivity$Transcriber$3;-><init>(Lcom/gemini/chat/LiveActivity$Transcriber;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 524
    return-void
.end method

.method public onInputText(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 499
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Transcriber;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1200(Lcom/gemini/chat/LiveActivity;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/gemini/chat/LiveActivity$Transcriber$2;

    invoke-direct {v1, p0, p1}, Lcom/gemini/chat/LiveActivity$Transcriber$2;-><init>(Lcom/gemini/chat/LiveActivity$Transcriber;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 507
    return-void
.end method

.method public onInterimInput(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 489
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Transcriber;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1200(Lcom/gemini/chat/LiveActivity;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/gemini/chat/LiveActivity$Transcriber$1;

    invoke-direct {v1, p0, p1}, Lcom/gemini/chat/LiveActivity$Transcriber$1;-><init>(Lcom/gemini/chat/LiveActivity$Transcriber;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 496
    return-void
.end method

.method public onInterrupted()V
    .locals 0

    .prologue
    .line 516
    return-void
.end method

.method public onOutputText(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 510
    return-void
.end method

.method public onReady()V
    .locals 0

    .prologue
    .line 483
    return-void
.end method

.method public onTurnComplete()V
    .locals 0

    .prologue
    .line 513
    return-void
.end method
