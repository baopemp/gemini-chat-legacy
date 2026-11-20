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

    .line 940
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$Player;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 924
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    .line 926
    iput-boolean v7, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    .line 927
    const/4 v0, -0x1

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    .line 933
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->lastHead:J

    .line 941
    if-eqz p2, :cond_1

    .line 954
    :cond_0
    :goto_0
    return-void

    .line 943
    :cond_1
    const/16 v0, 0x5dc0

    const/4 v1, 0x2

    const/4 v2, 0x2

    :try_start_0
    invoke-static {v0, v1, v2}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v5

    .line 945
    if-lez v5, :cond_0

    .line 946
    new-instance v0, Landroid/media/AudioTrack;

    const/4 v1, 0x3

    const/16 v2, 0x5dc0

    const/4 v3, 0x2

    const/4 v4, 0x2

    const/16 v6, 0x5dc0

    .line 948
    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    const/4 v6, 0x1

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 949
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getState()I

    move-result v1

    if-ne v1, v7, :cond_2

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    goto :goto_0

    .line 952
    :catch_0
    move-exception v0

    goto :goto_0

    .line 950
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
    .line 1012
    monitor-enter p0

    .line 1013
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->turnEnded:Z

    .line 1014
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 1015
    monitor-exit p0

    .line 1016
    return-void

    .line 1015
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

    .line 961
    monitor-enter p0

    .line 962
    :try_start_0
    array-length v3, p1

    iget v2, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    if-ltz v2, :cond_0

    move v2, v0

    :goto_0
    add-int/2addr v2, v3

    .line 963
    and-int/lit8 v3, v2, -0x2

    new-array v3, v3, [B

    .line 964
    const/4 v4, 0x0

    .line 965
    iget v5, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    if-ltz v5, :cond_5

    array-length v5, v3

    if-lez v5, :cond_5

    iget v1, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    int-to-byte v1, v1

    aput-byte v1, v3, v4

    .line 966
    :goto_1
    array-length v1, v3

    sub-int/2addr v1, v0

    .line 967
    const/4 v4, 0x0

    invoke-static {p1, v4, v3, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 968
    and-int/lit8 v0, v2, 0x1

    if-eqz v0, :cond_1

    array-length v0, p1

    add-int/lit8 v0, v0, -0x1

    aget-byte v0, p1, v0

    and-int/lit16 v0, v0, 0xff

    :goto_2
    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    .line 969
    array-length v0, v3

    if-nez v0, :cond_2

    monitor-exit p0

    .line 984
    :goto_3
    return-void

    :cond_0
    move v2, v1

    .line 962
    goto :goto_0

    .line 968
    :cond_1
    const/4 v0, -0x1

    goto :goto_2

    .line 970
    :cond_2
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->received:J

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->chunkStart:J

    .line 971
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->received:J

    array-length v2, v3

    div-int/lit8 v2, v2, 0x2

    int-to-long v4, v2

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->received:J

    .line 972
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    if-nez v0, :cond_3

    .line 973
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->received:J

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    .line 974
    monitor-exit p0

    goto :goto_3

    .line 983
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 976
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

    .line 977
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->firstQueuedAt:J

    .line 978
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->turnEnded:Z

    .line 980
    :cond_4
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 981
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    array-length v2, v3

    div-int/lit8 v2, v2, 0x2

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    .line 982
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 983
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
    .line 1020
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->this$0:Lcom/gemini/chat/LiveActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/gemini/chat/LiveActivity;->access$4202(Lcom/gemini/chat/LiveActivity;I)I

    .line 1021
    monitor-enter p0

    .line 1022
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 1023
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    .line 1024
    iget v0, p0, Lcom/gemini/chat/LiveActivity$Player;->generation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->generation:I

    .line 1025
    const/4 v0, -0x1

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->carry:I

    .line 1026
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->chunkStart:J

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->received:J

    .line 1027
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->lastHead:J

    .line 1028
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 1030
    :try_start_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->pause()V

    .line 1031
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->flush()V

    .line 1032
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1035
    :goto_0
    :try_start_2
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    move-result v0

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->headAtFlush:I

    .line 1037
    :cond_0
    monitor-exit p0

    .line 1038
    return-void

    .line 1037
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 1033
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method isPlaying()Z
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 1004
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    if-nez v1, :cond_0

    .line 1006
    :goto_0
    return v0

    .line 1005
    :cond_0
    monitor-enter p0

    .line 1006
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

    .line 1007
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
    .line 957
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

    .line 988
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    .line 989
    if-nez v0, :cond_0

    const-wide v0, 0x7fffffffffffffffL

    .line 999
    :goto_0
    return-wide v0

    .line 990
    :cond_0
    monitor-enter p0

    .line 991
    :try_start_0
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    move-result v0

    int-to-long v0, v0

    and-long/2addr v0, v4

    iget v2, p0, Lcom/gemini/chat/LiveActivity$Player;->headAtFlush:I

    int-to-long v2, v2

    and-long/2addr v2, v4

    sub-long/2addr v0, v2

    .line 992
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 993
    iget-wide v4, p0, Lcom/gemini/chat/LiveActivity$Player;->lastHead:J

    cmp-long v4, v0, v4

    if-eqz v4, :cond_2

    .line 994
    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->lastHead:J

    .line 995
    iput-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->lastMove:J

    .line 999
    :cond_1
    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    monitor-exit p0

    goto :goto_0

    .line 1000
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 996
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

    .line 997
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method quit()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1041
    iput-boolean v1, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    .line 1042
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0, v1}, Lcom/gemini/chat/LiveActivity;->access$4202(Lcom/gemini/chat/LiveActivity;I)I

    .line 1043
    monitor-enter p0

    .line 1044
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 1045
    monitor-exit p0

    .line 1046
    return-void

    .line 1045
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public run()V
    .locals 8

    .prologue
    const/4 v2, 0x0

    .line 1049
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    if-nez v0, :cond_0

    .line 1101
    :goto_0
    return-void

    .line 1051
    :cond_0
    const/16 v0, -0x10

    :try_start_0
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 1055
    :goto_1
    :try_start_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 1056
    monitor-enter p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 1057
    :try_start_2
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    move-result v0

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Player;->headAtFlush:I

    .line 1058
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1059
    :goto_2
    :try_start_3
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    if-eqz v0, :cond_2

    .line 1062
    monitor-enter p0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 1063
    :goto_3
    :try_start_4
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1064
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->this$0:Lcom/gemini/chat/LiveActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/gemini/chat/LiveActivity;->access$4202(Lcom/gemini/chat/LiveActivity;I)I

    .line 1065
    const-wide/16 v0, 0xc8

    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    goto :goto_3

    .line 1077
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 1092
    :catch_0
    move-exception v0

    .line 1094
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0, v2}, Lcom/gemini/chat/LiveActivity;->access$4202(Lcom/gemini/chat/LiveActivity;I)I

    .line 1096
    :try_start_6
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    .line 1099
    :goto_4
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    goto :goto_0

    .line 1058
    :catchall_1
    move-exception v0

    :try_start_7
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 1094
    :catchall_2
    move-exception v0

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Player;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v1, v2}, Lcom/gemini/chat/LiveActivity;->access$4202(Lcom/gemini/chat/LiveActivity;I)I

    .line 1096
    :try_start_9
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->stop()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2

    .line 1099
    :goto_5
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->release()V

    .line 1100
    throw v0

    .line 1067
    :cond_1
    :try_start_a
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    if-nez v0, :cond_3

    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 1094
    :cond_2
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0, v2}, Lcom/gemini/chat/LiveActivity;->access$4202(Lcom/gemini/chat/LiveActivity;I)I

    .line 1096
    :try_start_b
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_4

    .line 1099
    :goto_6
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    goto :goto_0

    .line 1069
    :cond_3
    :try_start_c
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    invoke-virtual {p0}, Lcom/gemini/chat/LiveActivity$Player;->playedFrames()J

    move-result-wide v4

    cmp-long v0, v0, v4

    if-gtz v0, :cond_4

    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    const-wide/16 v4, 0x1c20

    cmp-long v0, v0, v4

    if-gez v0, :cond_4

    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Player;->turnEnded:Z

    if-nez v0, :cond_4

    .line 1070
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v4, p0, Lcom/gemini/chat/LiveActivity$Player;->firstQueuedAt:J

    sub-long/2addr v0, v4

    const-wide/16 v4, 0x258

    cmp-long v0, v0, v4

    if-gez v0, :cond_4

    .line 1071
    const-wide/16 v0, 0x1e

    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    .line 1072
    monitor-exit p0

    goto/16 :goto_2

    .line 1074
    :cond_4
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Player;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 1075
    iget-wide v4, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    array-length v1, v0

    div-int/lit8 v1, v1, 0x2

    int-to-long v6, v1

    sub-long/2addr v4, v6

    iput-wide v4, p0, Lcom/gemini/chat/LiveActivity$Player;->queuedFrames:J

    .line 1076
    iget v3, p0, Lcom/gemini/chat/LiveActivity$Player;->generation:I

    .line 1077
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 1078
    :try_start_d
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Player;->this$0:Lcom/gemini/chat/LiveActivity;

    const/4 v4, 0x0

    array-length v5, v0

    invoke-static {v0, v4, v5}, Lcom/gemini/chat/LiveActivity;->pcmLevel([BII)I

    move-result v4

    invoke-static {v1, v4}, Lcom/gemini/chat/LiveActivity;->access$4202(Lcom/gemini/chat/LiveActivity;I)I

    move v1, v2

    .line 1080
    :goto_7
    array-length v4, v0

    if-ge v1, v4, :cond_5

    iget-boolean v4, p0, Lcom/gemini/chat/LiveActivity$Player;->running:Z

    if-eqz v4, :cond_5

    .line 1081
    iget-object v4, p0, Lcom/gemini/chat/LiveActivity$Player;->track:Landroid/media/AudioTrack;

    array-length v5, v0

    sub-int/2addr v5, v1

    invoke-virtual {v4, v0, v1, v5}, Landroid/media/AudioTrack;->write([BII)I

    move-result v4

    .line 1082
    if-gtz v4, :cond_8

    .line 1085
    :cond_5
    monitor-enter p0
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_0
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 1086
    :try_start_e
    iget v0, p0, Lcom/gemini/chat/LiveActivity$Player;->generation:I

    if-ne v3, v0, :cond_7

    .line 1087
    iget-wide v4, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    iget-wide v6, p0, Lcom/gemini/chat/LiveActivity$Player;->lastHead:J

    cmp-long v0, v4, v6

    if-gtz v0, :cond_6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/gemini/chat/LiveActivity$Player;->lastMove:J

    .line 1088
    :cond_6
    iget-wide v4, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    div-int/lit8 v0, v1, 0x2

    int-to-long v0, v0

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity$Player;->written:J

    .line 1090
    :cond_7
    monitor-exit p0

    goto/16 :goto_2

    :catchall_3
    move-exception v0

    monitor-exit p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    :try_start_f
    throw v0
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_0
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    .line 1083
    :cond_8
    add-int/2addr v1, v4

    .line 1084
    goto :goto_7

    .line 1052
    :catch_1
    move-exception v0

    goto/16 :goto_1

    .line 1097
    :catch_2
    move-exception v1

    goto/16 :goto_5

    :catch_3
    move-exception v0

    goto/16 :goto_4

    :catch_4
    move-exception v0

    goto/16 :goto_6
.end method
