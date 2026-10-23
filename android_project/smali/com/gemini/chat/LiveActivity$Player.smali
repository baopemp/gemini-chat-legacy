.class final Lcom/gemini/chat/LiveActivity$Player;
.super Ljava/lang/Thread;
.source "LiveActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/LiveActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Player"
.end annotation


# static fields
.field private static final PREBUFFER_FRAMES:I = 0x1c20


# instance fields
.field private carry:I

.field private chunkStart:J

.field private firstQueuedAt:J

.field private generation:I

.field private headAtFlush:I

.field private lastHead:J

.field private lastMove:J

.field private final queue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<[B>;"
        }
    .end annotation
.end field

.field private queuedFrames:J

.field private received:J

.field private volatile running:Z

.field final synthetic this$0:Lcom/gemini/chat/LiveActivity;

.field private track:Landroid/media/AudioTrack;

.field private turnEnded:Z

.field private written:J


# direct methods
.method constructor <init>(Lcom/gemini/chat/LiveActivity;Z)V
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 796
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$Player;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 780
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    .line 782
    iput-boolean v7, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    .line 783
    const/4 v0, -0x1

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    .line 789
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->lastHead:J

    .line 797
    if-eqz p2, :cond_1

    .line 810
    :cond_0
    :goto_0
    return-void

    .line 799
    :cond_1
    const/16 v0, 0x5dc0

    const/4 v1, 0x2

    const/4 v2, 0x2

    :try_start_0
    invoke-static {v0, v1, v2}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v5

    .line 801
    if-lez v5, :cond_0

    .line 802
    new-instance v0, Landroid/media/AudioTrack;

    const/4 v1, 0x3

    const/16 v2, 0x5dc0

    const/4 v3, 0x2

    const/4 v4, 0x2

    const/16 v6, 0x5dc0

    .line 804
    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    const/4 v6, 0x1

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 805
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getState()I

    move-result v1

    if-ne v1, v7, :cond_2

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    goto :goto_0

    .line 808
    :catch_0
    move-exception v0

    goto :goto_0

    .line 806
    :cond_2
    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method


# virtual methods
.method endOfTurn()V
    .locals 1

    .prologue
    .line 868
    monitor-enter p0

    .line 869
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->turnEnded:Z

    .line 870
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 871
    monitor-exit p0

    .line 872
    return-void

    .line 871
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method enqueue([B)V
    .locals 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 817
    monitor-enter p0

    .line 818
    :try_start_0
    array-length v3, p1

    iget v2, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    if-ltz v2, :cond_0

    move v2, v0

    :goto_0
    add-int/2addr v2, v3

    .line 819
    and-int/lit8 v3, v2, -0x2

    new-array v3, v3, [B

    .line 820
    const/4 v4, 0x0

    .line 821
    iget v5, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    if-ltz v5, :cond_5

    array-length v5, v3

    if-lez v5, :cond_5

    iget v1, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    int-to-byte v1, v1

    aput-byte v1, v3, v4

    .line 822
    :goto_1
    array-length v1, v3

    sub-int/2addr v1, v0

    .line 823
    const/4 v4, 0x0

    invoke-static {p1, v4, v3, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 824
    and-int/lit8 v0, v2, 0x1

    if-eqz v0, :cond_1

    array-length v0, p1

    add-int/lit8 v0, v0, -0x1

    aget-byte v0, p1, v0

    and-int/lit16 v0, v0, 0xff

    :goto_2
    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    .line 825
    array-length v0, v3

    if-nez v0, :cond_2

    monitor-exit p0

    .line 840
    :goto_3
    return-void

    :cond_0
    move v2, v1

    .line 818
    goto :goto_0

    .line 824
    :cond_1
    const/4 v0, -0x1

    goto :goto_2

    .line 826
    :cond_2
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->received:J

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->chunkStart:J

    .line 827
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->received:J

    array-length v2, v3

    div-int/lit8 v2, v2, 0x2

    int-to-long v4, v2

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->received:J

    .line 828
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    if-nez v0, :cond_3

    .line 829
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->received:J

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    .line 830
    monitor-exit p0

    goto :goto_3

    .line 839
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 832
    :cond_3
    :try_start_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    invoke-virtual {p0}, Lcom/gemini/chat/LiveActivity$Player;->playedFrames()J

    move-result-wide v4

    cmp-long v0, v0, v4

    if-gtz v0, :cond_4

    .line 833
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->firstQueuedAt:J

    .line 834
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->turnEnded:Z

    .line 836
    :cond_4
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 837
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    array-length v2, v3

    div-int/lit8 v2, v2, 0x2

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    .line 838
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 839
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :cond_5
    move v0, v1

    goto :goto_1
.end method

.method flush()V
    .locals 2

    .prologue
    .line 876
    monitor-enter p0

    .line 877
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 878
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    .line 879
    iget v0, p0, Lcom/gemini/chat/LiveActivity$Player;->generation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->generation:I

    .line 880
    const/4 v0, -0x1

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    .line 881
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->chunkStart:J

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->received:J

    .line 882
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->lastHead:J

    .line 883
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 885
    :try_start_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->pause()V

    .line 886
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->flush()V

    .line 887
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 890
    :goto_0
    :try_start_2
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    move-result v0

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->headAtFlush:I

    .line 892
    :cond_0
    monitor-exit p0

    .line 893
    return-void

    .line 892
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 888
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method isPlaying()Z
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 860
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    if-nez v1, :cond_0

    .line 862
    :goto_0
    return v0

    .line 861
    :cond_0
    monitor-enter p0

    .line 862
    :try_start_0
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/gemini/chat/LiveActivity$Player;->playedFrames()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    cmp-long v1, v2, v4

    if-gez v1, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    monitor-exit p0

    goto :goto_0

    .line 863
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method declared-synchronized lastChunkStart()J
    .locals 2

    .prologue
    .line 813
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->chunkStart:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method playedFrames()J
    .locals 6

    .prologue
    const-wide v4, 0xffffffffL

    .line 844
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    .line 845
    if-nez v0, :cond_0

    const-wide v0, 0x7fffffffffffffffL

    .line 855
    :goto_0
    return-wide v0

    .line 846
    :cond_0
    monitor-enter p0

    .line 847
    :try_start_0
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    move-result v0

    int-to-long v0, v0

    and-long/2addr v0, v4

    iget v2, p0, Lcom/gemini/chat/LiveActivity$Player;->headAtFlush:I

    int-to-long v2, v2

    and-long/2addr v2, v4

    sub-long/2addr v0, v2

    .line 848
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 849
    iget-wide v4, p0, Lcom/gemini/chat/LiveActivity$Player;->lastHead:J

    cmp-long v4, v0, v4

    if-eqz v4, :cond_2

    .line 850
    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->lastHead:J

    .line 851
    iput-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->lastMove:J

    .line 855
    :cond_1
    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    monitor-exit p0

    goto :goto_0

    .line 856
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 852
    :cond_2
    :try_start_1
    iget-wide v4, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    cmp-long v4, v0, v4

    if-gez v4, :cond_1

    iget-wide v4, p0, Lcom/gemini/chat/LiveActivity$Player;->lastMove:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x5dc

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    .line 853
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method quit()V
    .locals 1

    .prologue
    .line 896
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    .line 897
    monitor-enter p0

    .line 898
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 899
    monitor-exit p0

    .line 900
    return-void

    .line 899
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public run()V
    .locals 6

    .prologue
    .line 903
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    if-nez v0, :cond_0

    .line 946
    :goto_0
    return-void

    .line 905
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 906
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 907
    :try_start_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    move-result v0

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->headAtFlush:I

    .line 908
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 909
    :goto_1
    :try_start_2
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    if-eqz v0, :cond_2

    .line 912
    monitor-enter p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 913
    :goto_2
    :try_start_3
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    const-wide/16 v0, 0xc8

    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    goto :goto_2

    .line 924
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 938
    :catch_0
    move-exception v0

    .line 941
    :try_start_5
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 944
    :goto_3
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    goto :goto_0

    .line 908
    :catchall_1
    move-exception v0

    :try_start_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :try_start_7
    throw v0
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 940
    :catchall_2
    move-exception v0

    .line 941
    :try_start_8
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->stop()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    .line 944
    :goto_4
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->release()V

    .line 945
    throw v0

    .line 914
    :cond_1
    :try_start_9
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    if-nez v0, :cond_3

    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 941
    :cond_2
    :try_start_a
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_3

    .line 944
    :goto_5
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    goto :goto_0

    .line 916
    :cond_3
    :try_start_b
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    invoke-virtual {p0}, Lcom/gemini/chat/LiveActivity$Player;->playedFrames()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gtz v0, :cond_4

    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    const-wide/16 v2, 0x1c20

    cmp-long v0, v0, v2

    if-gez v0, :cond_4

    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->turnEnded:Z

    if-nez v0, :cond_4

    .line 917
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->firstQueuedAt:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x258

    cmp-long v0, v0, v2

    if-gez v0, :cond_4

    .line 918
    const-wide/16 v0, 0x1e

    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    .line 919
    monitor-exit p0

    goto :goto_1

    .line 921
    :cond_4
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 922
    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    array-length v1, v0

    div-int/lit8 v1, v1, 0x2

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    .line 923
    iget v2, p0, Lcom/gemini/chat/LiveActivity$Player;->generation:I

    .line 924
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 925
    const/4 v1, 0x0

    .line 926
    :goto_6
    :try_start_c
    array-length v3, v0

    if-ge v1, v3, :cond_5

    iget-boolean v3, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    if-eqz v3, :cond_5

    .line 927
    iget-object v3, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    array-length v4, v0

    sub-int/2addr v4, v1

    invoke-virtual {v3, v0, v1, v4}, Landroid/media/AudioTrack;->write([BII)I

    move-result v3

    .line 928
    if-gtz v3, :cond_8

    .line 931
    :cond_5
    monitor-enter p0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 932
    :try_start_d
    iget v0, p0, Lcom/gemini/chat/LiveActivity$Player;->generation:I

    if-ne v2, v0, :cond_7

    .line 933
    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    iget-wide v4, p0, Lcom/gemini/chat/LiveActivity$Player;->lastHead:J

    cmp-long v0, v2, v4

    if-gtz v0, :cond_6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->lastMove:J

    .line 934
    :cond_6
    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    div-int/lit8 v0, v1, 0x2

    int-to-long v0, v0

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    .line 936
    :cond_7
    monitor-exit p0

    goto/16 :goto_1

    :catchall_3
    move-exception v0

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    :try_start_e
    throw v0
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_0
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 929
    :cond_8
    add-int/2addr v1, v3

    .line 930
    goto :goto_6

    .line 942
    :catch_1
    move-exception v1

    goto/16 :goto_4

    :catch_2
    move-exception v0

    goto/16 :goto_3

    :catch_3
    move-exception v0

    goto :goto_5
.end method
