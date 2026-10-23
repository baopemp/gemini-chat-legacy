.class Lcom/gemini/chat/LiveActivity$Main$5;
.super Ljava/lang/Object;
.source "LiveActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/LiveActivity$Main;->onTurnComplete()V
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
    .line 462
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$Main$5;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 464
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$5;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity$Main;->access$700(Lcom/gemini/chat/LiveActivity$Main;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 469
    :goto_0
    return-void

    .line 465
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$5;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2100(Lcom/gemini/chat/LiveActivity;)V

    .line 466
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$5;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/gemini/chat/LiveActivity;->access$2702(Lcom/gemini/chat/LiveActivity;Z)Z

    .line 467
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$5;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2400(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveActivity$Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->endOfTurn()V

    .line 468
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$5;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/gemini/chat/LiveActivity;->access$1802(Lcom/gemini/chat/LiveActivity;I)I

    goto :goto_0
.end method
