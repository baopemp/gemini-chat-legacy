.class final Lcom/gemini/chat/LiveActivity$Mic;
.super Ljava/lang/Thread;
.source "LiveActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/LiveActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Mic"
.end annotation


# static fields
.field private static final RATE_16K:I = 0x3e80


# instance fields
.field ok:Z

.field rate:I

.field rec:Landroid/media/AudioRecord;

.field private volatile running:Z

.field final synthetic this$0:Lcom/gemini/chat/LiveActivity;


# direct methods
.method constructor <init>(Lcom/gemini/chat/LiveActivity;)V
    .locals 11

    .prologue
    const/4 v7, 0x0

    const/4 v8, 0x1

    .line 767
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$Mic;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 765
    iput-boolean v8, p0, Lcom/gemini/chat/LiveActivity$Mic;->running:Z

    .line 768
    const/4 v0, 0x5

    new-array v9, v0, [I

    fill-array-data v9, :array_0

    move v6, v7

    .line 769
    :goto_0
    array-length v0, v9

    if-ge v6, v0, :cond_2

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Mic;->rec:Landroid/media/AudioRecord;

    if-nez v0, :cond_2

    .line 771
    :try_start_0
    aget v0, v9, v6

    const/4 v1, 0x2

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v5

    .line 773
    if-gtz v5, :cond_0

    .line 769
    :goto_1
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_0

    .line 774
    :cond_0
    new-instance v0, Landroid/media/AudioRecord;

    const/4 v1, 0x1

    aget v2, v9, v6

    const/4 v3, 0x2

    const/4 v4, 0x2

    aget v10, v9, v6

    mul-int/lit8 v10, v10, 0x2

    div-int/lit8 v10, v10, 0x2

    .line 776
    invoke-static {v5, v10}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-direct/range {v0 .. v5}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 777
    invoke-virtual {v0}, Landroid/media/AudioRecord;->getState()I

    move-result v1

    if-ne v1, v8, :cond_1

    .line 778
    iput-object v0, p0, Lcom/gemini/chat/LiveActivity$Mic;->rec:Landroid/media/AudioRecord;

    .line 779
    aget v0, v9, v6

    iput v0, p0, Lcom/gemini/chat/LiveActivity$Mic;->rate:I

    goto :goto_1

    .line 783
    :catch_0
    move-exception v0

    goto :goto_1

    .line 781
    :cond_1
    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 786
    :cond_2
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Mic;->rec:Landroid/media/AudioRecord;

    if-eqz v0, :cond_3

    move v7, v8

    :cond_3
    iput-boolean v7, p0, Lcom/gemini/chat/LiveActivity$Mic;->ok:Z

    .line 787
    return-void

    .line 768
    :array_0
    .array-data 4
        0x3e80
        0x1f40
        0x2b11
        0x5622
        0xac44
    .end array-data
.end method


# virtual methods
.method quit()V
    .locals 1

    .prologue
    .line 790
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity$Mic;->running:Z

    .line 791
    return-void
.end method

.method public run()V
    .locals 6

    .prologue
    .line 794
    iget v0, p0, Lcom/gemini/chat/LiveActivity$Mic;->rate:I

    div-int/lit8 v0, v0, 0xa

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    .line 796
    :try_start_0
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Mic;->rec:Landroid/media/AudioRecord;

    invoke-virtual {v1}, Landroid/media/AudioRecord;->startRecording()V

    .line 797
    :cond_0
    :goto_0
    iget-boolean v1, p0, Lcom/gemini/chat/LiveActivity$Mic;->running:Z

    if-eqz v1, :cond_2

    .line 798
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Mic;->rec:Landroid/media/AudioRecord;

    const/4 v2, 0x0

    array-length v3, v0

    invoke-virtual {v1, v0, v2, v3}, Landroid/media/AudioRecord;->read([BII)I

    move-result v1

    .line 799
    if-lez v1, :cond_0

    .line 800
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity$Mic;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v2}, Lcom/gemini/chat/LiveActivity;->access$4200(Lcom/gemini/chat/LiveActivity;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 801
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity$Mic;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v2}, Lcom/gemini/chat/LiveActivity;->access$1400(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveSession;

    move-result-object v2

    iget-object v3, p0, Lcom/gemini/chat/LiveActivity$Mic;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v3}, Lcom/gemini/chat/LiveActivity;->access$3100(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveSession;

    move-result-object v3

    .line 802
    if-eqz v2, :cond_1

    const/4 v4, 0x0

    iget v5, p0, Lcom/gemini/chat/LiveActivity$Mic;->rate:I

    invoke-virtual {v2, v0, v4, v1, v5}, Lcom/gemini/chat/LiveSession;->sendAudio([BIII)V

    .line 803
    :cond_1
    if-eqz v3, :cond_0

    const/4 v2, 0x0

    iget v4, p0, Lcom/gemini/chat/LiveActivity$Mic;->rate:I

    invoke-virtual {v3, v0, v2, v1, v4}, Lcom/gemini/chat/LiveSession;->sendAudio([BIII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 805
    :catch_0
    move-exception v0

    .line 808
    :try_start_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Mic;->rec:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 811
    :goto_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Mic;->rec:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 813
    :goto_2
    return-void

    .line 808
    :cond_2
    :try_start_2
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Mic;->rec:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 811
    :goto_3
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Mic;->rec:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    goto :goto_2

    .line 807
    :catchall_0
    move-exception v0

    .line 808
    :try_start_3
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Mic;->rec:Landroid/media/AudioRecord;

    invoke-virtual {v1}, Landroid/media/AudioRecord;->stop()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 811
    :goto_4
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Mic;->rec:Landroid/media/AudioRecord;

    invoke-virtual {v1}, Landroid/media/AudioRecord;->release()V

    .line 812
    throw v0

    .line 809
    :catch_1
    move-exception v1

    goto :goto_4

    :catch_2
    move-exception v0

    goto :goto_1

    :catch_3
    move-exception v0

    goto :goto_3
.end method
