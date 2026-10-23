.class Lcom/gemini/chat/LiveActivity$Main$2;
.super Ljava/lang/Object;
.source "LiveActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/LiveActivity$Main;->onClosed(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/gemini/chat/LiveActivity$Main;

.field final synthetic val$error:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/gemini/chat/LiveActivity$Main;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 404
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iput-object p2, p0, Lcom/gemini/chat/LiveActivity$Main$2;->val$error:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 406
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity$Main;->access$700(Lcom/gemini/chat/LiveActivity$Main;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 423
    :goto_0
    return-void

    .line 407
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1400(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveSession;

    move-result-object v0

    .line 408
    iget-object v4, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v4, v4, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v4, v2}, Lcom/gemini/chat/LiveActivity;->access$802(Lcom/gemini/chat/LiveActivity;Z)Z

    .line 409
    iget-object v4, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v4, v4, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v4}, Lcom/gemini/chat/LiveActivity;->access$1500(Lcom/gemini/chat/LiveActivity;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v4, v4, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v4, v2}, Lcom/gemini/chat/LiveActivity;->access$1600(Lcom/gemini/chat/LiveActivity;Z)V

    .line 410
    :cond_1
    if-eqz v0, :cond_4

    iget-object v0, v0, Lcom/gemini/chat/LiveSession;->lastHandle:Ljava/lang/String;

    .line 411
    :goto_1
    iget-object v4, p0, Lcom/gemini/chat/LiveActivity$Main$2;->val$error:Ljava/lang/String;

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/gemini/chat/LiveActivity$Main$2;->val$error:Ljava/lang/String;

    const-string v5, "(1007)"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_2

    iget-object v4, p0, Lcom/gemini/chat/LiveActivity$Main$2;->val$error:Ljava/lang/String;

    const-string v5, "(1008)"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-ltz v4, :cond_3

    :cond_2
    move v2, v3

    .line 412
    :cond_3
    iget-object v4, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v4, v4, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v4}, Lcom/gemini/chat/LiveActivity;->access$1700(Lcom/gemini/chat/LiveActivity;)Z

    move-result v4

    if-nez v4, :cond_5

    if-eqz v0, :cond_5

    if-nez v2, :cond_5

    iget-object v2, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v2, v2, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v2}, Lcom/gemini/chat/LiveActivity;->access$1800(Lcom/gemini/chat/LiveActivity;)I

    move-result v2

    const/4 v4, 0x3

    if-ge v2, v4, :cond_5

    .line 413
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v1, v1, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v1, v3}, Lcom/gemini/chat/LiveActivity;->access$1900(Lcom/gemini/chat/LiveActivity;Z)V

    .line 414
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v1, v1, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v1}, Lcom/gemini/chat/LiveActivity;->access$1808(Lcom/gemini/chat/LiveActivity;)I

    .line 415
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v1, v1, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v1, v0}, Lcom/gemini/chat/LiveActivity;->access$2000(Lcom/gemini/chat/LiveActivity;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    move-object v0, v1

    .line 410
    goto :goto_1

    .line 418
    :cond_5
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0, v1}, Lcom/gemini/chat/LiveActivity;->access$1402(Lcom/gemini/chat/LiveActivity;Lcom/gemini/chat/LiveSession;)Lcom/gemini/chat/LiveSession;

    .line 419
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0, v3}, Lcom/gemini/chat/LiveActivity;->access$1900(Lcom/gemini/chat/LiveActivity;Z)V

    .line 420
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2100(Lcom/gemini/chat/LiveActivity;)V

    .line 421
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v1, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$2;->val$error:Ljava/lang/String;

    if-nez v0, :cond_6

    const-string v0, "Disconnected."

    :goto_2
    invoke-static {v1, v0}, Lcom/gemini/chat/LiveActivity;->access$2200(Lcom/gemini/chat/LiveActivity;Ljava/lang/String;)V

    .line 422
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$2;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$900(Lcom/gemini/chat/LiveActivity;)V

    goto/16 :goto_0

    .line 421
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Disconnected: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/gemini/chat/LiveActivity$Main$2;->val$error:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2
.end method
