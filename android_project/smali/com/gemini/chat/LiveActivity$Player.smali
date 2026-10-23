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

    .line 837
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$Player;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 821
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    .line 823
    iput-boolean v7, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    .line 824
    const/4 v0, -0x1

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    .line 830
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->lastHead:J

    .line 838
    if-eqz p2, :cond_1

    .line 851
    :cond_0
    :goto_0
    return-void

    .line 840
    :cond_1
    const/16 v0, 0x5dc0

    const/4 v1, 0x2

    const/4 v2, 0x2

    :try_start_0
    invoke-static {v0, v1, v2}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v5

    .line 842
    if-lez v5, :cond_0

    .line 843
    new-instance v0, Landroid/media/AudioTrack;

    const/4 v1, 0x3

    const/16 v2, 0x5dc0

    const/4 v3, 0x2

    const/4 v4, 0x2

    const/16 v6, 0x5dc0

    .line 845
    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    const/4 v6, 0x1

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 846
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getState()I

    move-result v1

    if-ne v1, v7, :cond_2

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    goto :goto_0

    .line 849
    :catch_0
    move-exception v0

    goto :goto_0

    .line 847
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
    .line 909
    monitor-enter p0

    .line 910
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->turnEnded:Z

    .line 911
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 912
    monitor-exit p0

    .line 913
    return-void

    .line 912
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

    .line 858
    monitor-enter p0

    .line 859
    :try_start_0
    array-length v3, p1

    iget v2, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    if-ltz v2, :cond_0

    move v2, v0

    :goto_0
    add-int/2addr v2, v3

    .line 860
    and-int/lit8 v3, v2, -0x2

    new-array v3, v3, [B

    .line 861
    const/4 v4, 0x0

    .line 862
    iget v5, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    if-ltz v5, :cond_5

    array-length v5, v3

    if-lez v5, :cond_5

    iget v1, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    int-to-byte v1, v1

    aput-byte v1, v3, v4

    .line 863
    :goto_1
    array-length v1, v3

    sub-int/2addr v1, v0

    .line 864
    const/4 v4, 0x0

    invoke-static {p1, v4, v3, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 865
    and-int/lit8 v0, v2, 0x1

    if-eqz v0, :cond_1

    array-length v0, p1

    add-int/lit8 v0, v0, -0x1

    aget-byte v0, p1, v0

    and-int/lit16 v0, v0, 0xff

    :goto_2
    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    .line 866
    array-length v0, v3

    if-nez v0, :cond_2

    monitor-exit p0

    .line 881
    :goto_3
    return-void

    :cond_0
    move v2, v1

    .line 859
    goto :goto_0

    .line 865
    :cond_1
    const/4 v0, -0x1

    goto :goto_2

    .line 867
    :cond_2
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->received:J

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->chunkStart:J

    .line 868
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->received:J

    array-length v2, v3

    div-int/lit8 v2, v2, 0x2

    int-to-long v4, v2

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->received:J

    .line 869
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    if-nez v0, :cond_3

    .line 870
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->received:J

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    .line 871
    monitor-exit p0

    goto :goto_3

    .line 880
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 873
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

    .line 874
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->firstQueuedAt:J

    .line 875
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->turnEnded:Z

    .line 877
    :cond_4
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 878
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    array-length v2, v3

    div-int/lit8 v2, v2, 0x2

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    .line 879
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 880
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
    .line 917
    monitor-enter p0

    .line 918
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 919
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    .line 920
    iget v0, p0, Lcom/gemini/chat/LiveActivity$Player;->generation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->generation:I

    .line 921
    const/4 v0, -0x1

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    .line 922
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->chunkStart:J

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->received:J

    .line 923
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->lastHead:J

    .line 924
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 926
    :try_start_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->pause()V

    .line 927
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->flush()V

    .line 928
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 931
    :goto_0
    :try_start_2
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    move-result v0

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->headAtFlush:I

    .line 933
    :cond_0
    monitor-exit p0

    .line 934
    return-void

    .line 933
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 929
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method isPlaying()Z
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 901
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    if-nez v1, :cond_0

    .line 903
    :goto_0
    return v0

    .line 902
    :cond_0
    monitor-enter p0

    .line 903
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

    .line 904
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
    .line 854
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

    .line 885
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    .line 886
    if-nez v0, :cond_0

    const-wide v0, 0x7fffffffffffffffL

    .line 896
    :goto_0
    return-wide v0

    .line 887
    :cond_0
    monitor-enter p0

    .line 888
    :try_start_0
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    move-result v0

    int-to-long v0, v0

    and-long/2addr v0, v4

    iget v2, p0, Lcom/gemini/chat/LiveActivity$Player;->headAtFlush:I

    int-to-long v2, v2

    and-long/2addr v2, v4

    sub-long/2addr v0, v2

    .line 889
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 890
    iget-wide v4, p0, Lcom/gemini/chat/LiveActivity$Player;->lastHead:J

    cmp-long v4, v0, v4

    if-eqz v4, :cond_2

    .line 891
    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->lastHead:J

    .line 892
    iput-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->lastMove:J

    .line 896
    :cond_1
    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    monitor-exit p0

    goto :goto_0

    .line 897
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 893
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

    .line 894
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method quit()V
    .locals 1

    .prologue
    .line 937
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    .line 938
    monitor-enter p0

    .line 939
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 940
    monitor-exit p0

    .line 941
    return-void

    .line 940
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
    .line 944
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    if-nez v0, :cond_0

    .line 987
    :goto_0
    return-void

    .line 946
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 947
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 948
    :try_start_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    move-result v0

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->headAtFlush:I

    .line 949
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 950
    :goto_1
    :try_start_2
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    if-eqz v0, :cond_2

    .line 953
    monitor-enter p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 954
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

    .line 965
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

    .line 979
    :catch_0
    move-exception v0

    .line 982
    :try_start_5
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 985
    :goto_3
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    goto :goto_0

    .line 949
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

    .line 981
    :catchall_2
    move-exception v0

    .line 982
    :try_start_8
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->stop()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    .line 985
    :goto_4
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->release()V

    .line 986
    throw v0

    .line 955
    :cond_1
    :try_start_9
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    if-nez v0, :cond_3

    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 982
    :cond_2
    :try_start_a
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_3

    .line 985
    :goto_5
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    goto :goto_0

    .line 957
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

    .line 958
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->firstQueuedAt:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x258

    cmp-long v0, v0, v2

    if-gez v0, :cond_4

    .line 959
    const-wide/16 v0, 0x1e

    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    .line 960
    monitor-exit p0

    goto :goto_1

    .line 962
    :cond_4
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 963
    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    array-length v1, v0

    div-int/lit8 v1, v1, 0x2

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    .line 964
    iget v2, p0, Lcom/gemini/chat/LiveActivity$Player;->generation:I

    .line 965
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 966
    const/4 v1, 0x0

    .line 967
    :goto_6
    :try_start_c
    array-length v3, v0

    if-ge v1, v3, :cond_5

    iget-boolean v3, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    if-eqz v3, :cond_5

    .line 968
    iget-object v3, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    array-length v4, v0

    sub-int/2addr v4, v1

    invoke-virtual {v3, v0, v1, v4}, Landroid/media/AudioTrack;->write([BII)I

    move-result v3

    .line 969
    if-gtz v3, :cond_8

    .line 972
    :cond_5
    monitor-enter p0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 973
    :try_start_d
    iget v0, p0, Lcom/gemini/chat/LiveActivity$Player;->generation:I

    if-ne v2, v0, :cond_7

    .line 974
    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    iget-wide v4, p0, Lcom/gemini/chat/LiveActivity$Player;->lastHead:J

    cmp-long v0, v2, v4

    if-gtz v0, :cond_6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->lastMove:J

    .line 975
    :cond_6
    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    div-int/lit8 v0, v1, 0x2

    int-to-long v0, v0

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    .line 977
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

    .line 970
    :cond_8
    add-int/2addr v1, v3

    .line 971
    goto :goto_6

    .line 983
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
