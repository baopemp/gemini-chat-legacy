.class Lcom/gemini/chat/LiveActivity$Main$4;
.super Ljava/lang/Object;
.source "LiveActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/LiveActivity$Main;->onOutputText(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/gemini/chat/LiveActivity$Main;

.field final synthetic val$delta:Ljava/lang/String;

.field final synthetic val$tag:J


# direct methods
.method constructor <init>(Lcom/gemini/chat/LiveActivity$Main;JLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 449
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$Main$4;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iput-wide p2, p0, Lcom/gemini/chat/LiveActivity$Main$4;->val$tag:J

    iput-object p4, p0, Lcom/gemini/chat/LiveActivity$Main$4;->val$delta:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 451
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$4;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity$Main;->access$700(Lcom/gemini/chat/LiveActivity$Main;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 457
    :goto_0
    return-void

    .line 452
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$4;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2100(Lcom/gemini/chat/LiveActivity;)V

    .line 453
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$4;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0, v1}, Lcom/gemini/chat/LiveActivity;->access$2702(Lcom/gemini/chat/LiveActivity;Z)Z

    .line 454
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$4;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2800(Lcom/gemini/chat/LiveActivity;)Ljava/util/LinkedList;

    move-result-object v1

    monitor-enter v1

    .line 455
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$4;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2800(Lcom/gemini/chat/LiveActivity;)Ljava/util/LinkedList;

    move-result-object v0

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-wide v4, p0, Lcom/gemini/chat/LiveActivity$Main$4;->val$tag:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/gemini/chat/LiveActivity$Main$4;->val$delta:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 456
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
