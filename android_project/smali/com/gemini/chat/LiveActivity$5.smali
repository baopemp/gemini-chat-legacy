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
    .line 638
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

    .line 640
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2400(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveActivity$Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->playedFrames()J

    move-result-wide v4

    .line 642
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2800(Lcom/gemini/chat/LiveActivity;)Ljava/util/LinkedList;

    move-result-object v6

    monitor-enter v6

    move v1, v2

    .line 643
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

    .line 644
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$3400(Lcom/gemini/chat/LiveActivity;)Ljava/lang/StringBuffer;

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

    .line 645
    goto :goto_0

    .line 647
    :cond_0
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 648
    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$3500(Lcom/gemini/chat/LiveActivity;)V

    .line 649
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2400(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveActivity$Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->isPlaying()Z

    move-result v1

    .line 650
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2700(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-nez v1, :cond_2

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$3600(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 651
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0, v2}, Lcom/gemini/chat/LiveActivity;->access$1900(Lcom/gemini/chat/LiveActivity;Z)V

    .line 652
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0, v2}, Lcom/gemini/chat/LiveActivity;->access$2302(Lcom/gemini/chat/LiveActivity;Z)Z

    .line 653
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x2bc

    add-long/2addr v4, v6

    invoke-static {v0, v4, v5}, Lcom/gemini/chat/LiveActivity;->access$3702(Lcom/gemini/chat/LiveActivity;J)J

    .line 656
    :cond_2
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$3000(Lcom/gemini/chat/LiveActivity;)J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v0, v4, v6

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2300(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2700(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-nez v0, :cond_3

    if-nez v1, :cond_3

    .line 657
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$3700(Lcom/gemini/chat/LiveActivity;)J

    move-result-wide v6

    cmp-long v0, v4, v6

    if-ltz v0, :cond_3

    .line 658
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$3800(Lcom/gemini/chat/LiveActivity;)V

    .line 660
    :cond_3
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$800(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 662
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2300(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-nez v0, :cond_4

    if-eqz v1, :cond_b

    :cond_4
    iget-object v3, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$3900(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "Model is answering..."

    :goto_1
    invoke-static {v3, v0}, Lcom/gemini/chat/LiveActivity;->access$2200(Lcom/gemini/chat/LiveActivity;Ljava/lang/String;)V

    .line 664
    :goto_2
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1400(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveSession;

    move-result-object v0

    .line 665
    if-eqz v0, :cond_5

    iget-boolean v0, v0, Lcom/gemini/chat/LiveSession;->goAway:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1500(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2300(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-nez v0, :cond_5

    if-nez v1, :cond_5

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$4000(Lcom/gemini/chat/LiveActivity;)V

    .line 667
    :cond_5
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$4100(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveActivity$AudioMeterView;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 668
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2300(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-nez v0, :cond_6

    if-eqz v1, :cond_d

    .line 669
    :cond_6
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$4200(Lcom/gemini/chat/LiveActivity;)I

    move-result v0

    .line 670
    if-gtz v0, :cond_8

    iget-object v2, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v2}, Lcom/gemini/chat/LiveActivity;->access$2300(Lcom/gemini/chat/LiveActivity;)Z

    move-result v2

    if-nez v2, :cond_7

    if-eqz v1, :cond_8

    .line 671
    :cond_7
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v1}, Lcom/gemini/chat/LiveActivity;->access$4300(Lcom/gemini/chat/LiveActivity;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    and-int/lit8 v1, v1, 0x7

    invoke-static {v0, v1}, Lcom/gemini/chat/LiveActivity;->access$4302(Lcom/gemini/chat/LiveActivity;I)I

    .line 672
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$4300(Lcom/gemini/chat/LiveActivity;)I

    move-result v0

    const/4 v1, 0x4

    if-gt v0, v1, :cond_c

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$4300(Lcom/gemini/chat/LiveActivity;)I

    move-result v0

    mul-int/lit8 v0, v0, 0x6

    :goto_3
    add-int/lit8 v0, v0, 0x12

    .line 674
    :cond_8
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v1}, Lcom/gemini/chat/LiveActivity;->access$4100(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveActivity$AudioMeterView;

    move-result-object v1

    const v2, -0x7e366b

    invoke-virtual {v1, v0, v2}, Lcom/gemini/chat/LiveActivity$AudioMeterView;->update(II)V

    .line 682
    :cond_9
    :goto_4
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1200(Lcom/gemini/chat/LiveActivity;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v2, 0x50

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 683
    return-void

    .line 647
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 662
    :cond_a
    const-string v0, "Model is speaking..."

    goto/16 :goto_1

    .line 663
    :cond_b
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1000(Lcom/gemini/chat/LiveActivity;)V

    goto/16 :goto_2

    .line 672
    :cond_c
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$4300(Lcom/gemini/chat/LiveActivity;)I

    move-result v0

    rsub-int/lit8 v0, v0, 0x8

    mul-int/lit8 v0, v0, 0x6

    goto :goto_3

    .line 675
    :cond_d
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$1500(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$4400(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-nez v0, :cond_f

    .line 676
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$4500(Lcom/gemini/chat/LiveActivity;)I

    move-result v0

    .line 677
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v1}, Lcom/gemini/chat/LiveActivity;->access$4100(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveActivity$AudioMeterView;

    move-result-object v1

    if-lez v0, :cond_e

    :goto_5
    const v2, -0x754b08

    invoke-virtual {v1, v0, v2}, Lcom/gemini/chat/LiveActivity$AudioMeterView;->update(II)V

    goto :goto_4

    :cond_e
    const/16 v0, 0xc

    goto :goto_5

    .line 679
    :cond_f
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$5;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$4100(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveActivity$AudioMeterView;

    move-result-object v0

    const v1, -0xc3bfbd

    invoke-virtual {v0, v2, v1}, Lcom/gemini/chat/LiveActivity$AudioMeterView;->update(II)V

    goto :goto_4
.end method
