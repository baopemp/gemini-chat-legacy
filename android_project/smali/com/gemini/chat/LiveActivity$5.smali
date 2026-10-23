.class Lcom/gemini/chat/LiveActivity$5;
.super Ljava/lang/Object;
.source "LiveActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/LiveActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/LiveActivity;


# direct methods
.method constructor <init>(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 540
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 542
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2400(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveActivity$Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->playedFrames()J

    move-result-wide v4

    .line 544
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2800(Lcom/gemini/chat/LiveActivity;)Ljava/util/LinkedList;

    move-result-object v6

    monitor-enter v6

    move v1, v2

    .line 545
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2800(Lcom/gemini/chat/LiveActivity;)Ljava/util/LinkedList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2800(Lcom/gemini/chat/LiveActivity;)Ljava/util/LinkedList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    const/4 v7, 0x0

    aget-object v0, v0, v7

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    cmp-long v0, v8, v4

    if-gtz v0, :cond_0

    .line 546
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$3200(Lcom/gemini/chat/LiveActivity;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2800(Lcom/gemini/chat/LiveActivity;)Ljava/util/LinkedList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    const/4 v7, 0x1

    aget-object v0, v0, v7

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move v1, v3

    .line 547
    goto :goto_0

    .line 549
    :cond_0
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 550
    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$3300(Lcom/gemini/chat/LiveActivity;)V

    .line 551
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2400(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveActivity$Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->isPlaying()Z

    move-result v1

    .line 552
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2700(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-nez v1, :cond_2

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$3400(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 553
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0, v2}, Lcom/gemini/chat/LiveActivity;->access$1900(Lcom/gemini/chat/LiveActivity;Z)V

    .line 554
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0, v2}, Lcom/gemini/chat/LiveActivity;->access$2302(Lcom/gemini/chat/LiveActivity;Z)Z

    .line 555
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x2bc

    add-long/2addr v2, v4

    invoke-static {v0, v2, v3}, Lcom/gemini/chat/LiveActivity;->access$3502(Lcom/gemini/chat/LiveActivity;J)J

    .line 557
    :cond_2
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$800(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 559
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2300(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-nez v0, :cond_3

    if-eqz v1, :cond_6

    :cond_3
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$3600(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "Model is answering..."

    :goto_1
    invoke-static {v2, v0}, Lcom/gemini/chat/LiveActivity;->access$2200(Lcom/gemini/chat/LiveActivity;Ljava/lang/String;)V

    .line 561
    :goto_2
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1400(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveSession;

    move-result-object v0

    .line 562
    if-eqz v0, :cond_4

    iget-boolean v0, v0, Lcom/gemini/chat/LiveSession;->goAway:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1500(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2300(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-nez v0, :cond_4

    if-nez v1, :cond_4

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$3700(Lcom/gemini/chat/LiveActivity;)V

    .line 564
    :cond_4
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1200(Lcom/gemini/chat/LiveActivity;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v2, 0x50

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 565
    return-void

    .line 549
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 559
    :cond_5
    const-string v0, "Model is speaking..."

    goto :goto_1

    .line 560
    :cond_6
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1000(Lcom/gemini/chat/LiveActivity;)V

    goto :goto_2
.end method
