.class final Lcom/gemini/chat/ReadAloud;
.super Ljava/lang/Thread;
.source "ReadAloud.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gemini/chat/ReadAloud$Listener;
    }
.end annotation


# static fields
.field static final DEFAULT_MODEL:Ljava/lang/String;

.field private static final MAX_RETRIES:I = 0x2

.field static final MODELS:[Ljava/lang/String;

.field static final RATE:I = 0x5dc0

.field static final URL_INTERACTIONS:Ljava/lang/String; = "https://generativelanguage.googleapis.com/v1beta/interactions"


# instance fields
.field private carry:I

.field private volatile conn:Ljava/net/HttpURLConnection;

.field private final key:Ljava/lang/String;

.field private lastError:Ljava/lang/String;

.field private lastRetryAfter:Ljava/lang/String;

.field private final listener:Lcom/gemini/chat/ReadAloud$Listener;

.field final messageId:J

.field private final model:Ljava/lang/String;

.field private volatile stopped:Z

.field private final text:Ljava/lang/String;

.field private volatile track:Landroid/media/AudioTrack;

.field private final ui:Landroid/os/Handler;

.field private final voice:Ljava/lang/String;

.field private written:J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 29
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "gemini-3.8-flash-lite-tts"

    aput-object v1, v0, v3

    const/4 v1, 0x1

    const-string v2, "gemini-3.8-flash-tts"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "gemini-3.1-flash-tts-preview"

    aput-object v2, v0, v1

    sput-object v0, Lcom/gemini/chat/ReadAloud;->MODELS:[Ljava/lang/String;

    .line 30
    sget-object v0, Lcom/gemini/chat/ReadAloud;->MODELS:[Ljava/lang/String;

    aget-object v0, v0, v3

    sput-object v0, Lcom/gemini/chat/ReadAloud;->DEFAULT_MODEL:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;Lcom/gemini/chat/ReadAloud$Listener;)V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 47
    const/4 v0, -0x1

    iput v0, p0, Lcom/gemini/chat/ReadAloud;->carry:I

    .line 50
    iput-wide p1, p0, Lcom/gemini/chat/ReadAloud;->messageId:J

    .line 51
    iput-object p3, p0, Lcom/gemini/chat/ReadAloud;->key:Ljava/lang/String;

    .line 52
    iput-object p4, p0, Lcom/gemini/chat/ReadAloud;->model:Ljava/lang/String;

    .line 53
    iput-object p5, p0, Lcom/gemini/chat/ReadAloud;->voice:Ljava/lang/String;

    .line 54
    iput-object p6, p0, Lcom/gemini/chat/ReadAloud;->text:Ljava/lang/String;

    .line 55
    iput-object p7, p0, Lcom/gemini/chat/ReadAloud;->ui:Landroid/os/Handler;

    .line 56
    iput-object p8, p0, Lcom/gemini/chat/ReadAloud;->listener:Lcom/gemini/chat/ReadAloud$Listener;

    .line 57
    return-void
.end method

.method static synthetic access$000(Lcom/gemini/chat/ReadAloud;)Lcom/gemini/chat/ReadAloud$Listener;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/gemini/chat/ReadAloud;->listener:Lcom/gemini/chat/ReadAloud$Listener;

    return-object v0
.end method

.method static audioOf(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 89
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 90
    const-string v2, "error"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 91
    if-nez v2, :cond_0

    const-string v3, "error"

    const-string v4, "event_type"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 92
    :cond_0
    if-eqz v2, :cond_1

    const-string v0, "message"

    const-string v1, ""

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    .line 93
    :goto_0
    if-eqz v2, :cond_2

    const-string v0, "code"

    const-string v3, ""

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 94
    :goto_1
    new-instance v2, Lorg/json/JSONException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ": "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 92
    :cond_1
    const-string v0, ""

    move-object v1, v0

    goto :goto_0

    .line 93
    :cond_2
    const-string v0, ""

    goto :goto_1

    .line 94
    :cond_3
    const-string v0, ""

    goto :goto_2

    .line 96
    :cond_4
    const-string v2, "step.delta"

    const-string v3, "event_type"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 100
    :cond_5
    :goto_3
    return-object v1

    .line 97
    :cond_6
    const-string v2, "delta"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 98
    if-eqz v0, :cond_5

    const-string v2, "audio"

    const-string v3, "type"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 99
    const-string v2, "data"

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 100
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_7

    :goto_4
    move-object v1, v0

    goto :goto_3

    :cond_7
    move-object v0, v1

    goto :goto_4
.end method

.method private drain()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 309
    iget-object v8, p0, Lcom/gemini/chat/ReadAloud;->track:Landroid/media/AudioTrack;

    .line 310
    if-nez v8, :cond_1

    .line 324
    :cond_0
    :goto_0
    return-void

    .line 311
    :cond_1
    const-wide/16 v2, -0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 312
    :goto_1
    iget-boolean v4, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-nez v4, :cond_0

    .line 313
    invoke-virtual {v8}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    move-result v4

    int-to-long v4, v4

    const-wide v6, 0xffffffffL

    and-long/2addr v6, v4

    .line 314
    iget-wide v4, p0, Lcom/gemini/chat/ReadAloud;->written:J

    cmp-long v4, v6, v4

    if-gez v4, :cond_0

    .line 315
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 316
    cmp-long v9, v6, v2

    if-eqz v9, :cond_3

    move-wide v0, v4

    move-wide v2, v6

    .line 322
    :cond_2
    const-wide/16 v4, 0x32

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_1

    .line 319
    :cond_3
    sub-long/2addr v4, v0

    const-wide/16 v6, 0x5dc

    cmp-long v4, v4, v6

    if-lez v4, :cond_2

    goto :goto_0
.end method

.method static errorMessage(ILjava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 133
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "error"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 134
    if-eqz v0, :cond_0

    const-string v1, "message"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "message"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 137
    :goto_0
    return-object v0

    .line 135
    :catch_0
    move-exception v0

    .line 137
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private event(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 271
    const-string v0, "[DONE]"

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 274
    :cond_0
    :goto_0
    return-void

    .line 272
    :cond_1
    invoke-static {p1}, Lcom/gemini/chat/ReadAloud;->audioOf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 273
    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/gemini/chat/B64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ReadAloud;->play([B)V

    goto :goto_0
.end method

.method private play([B)V
    .locals 9

    .prologue
    const/16 v2, 0x5dc0

    const/4 v3, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 278
    iget-boolean v0, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-nez v0, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    .line 305
    :cond_0
    :goto_0
    return-void

    .line 279
    :cond_1
    array-length v1, p1

    iget v0, p0, Lcom/gemini/chat/ReadAloud;->carry:I

    if-ltz v0, :cond_2

    move v0, v6

    :goto_1
    add-int/2addr v1, v0

    .line 280
    and-int/lit8 v0, v1, -0x2

    new-array v8, v0, [B

    .line 282
    iget v0, p0, Lcom/gemini/chat/ReadAloud;->carry:I

    if-ltz v0, :cond_7

    array-length v0, v8

    if-lez v0, :cond_7

    iget v0, p0, Lcom/gemini/chat/ReadAloud;->carry:I

    int-to-byte v0, v0

    aput-byte v0, v8, v7

    move v0, v6

    .line 283
    :goto_2
    array-length v4, v8

    sub-int/2addr v4, v0

    invoke-static {p1, v7, v8, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 284
    and-int/lit8 v0, v1, 0x1

    if-eqz v0, :cond_3

    array-length v0, p1

    add-int/lit8 v0, v0, -0x1

    aget-byte v0, p1, v0

    and-int/lit16 v0, v0, 0xff

    :goto_3
    iput v0, p0, Lcom/gemini/chat/ReadAloud;->carry:I

    .line 285
    array-length v0, v8

    if-eqz v0, :cond_0

    .line 286
    iget-object v0, p0, Lcom/gemini/chat/ReadAloud;->track:Landroid/media/AudioTrack;

    .line 287
    if-nez v0, :cond_6

    .line 288
    invoke-static {v2, v3, v3}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v4

    .line 289
    new-instance v0, Landroid/media/AudioTrack;

    const/4 v1, 0x3

    const v5, 0xbb80

    .line 290
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    move v4, v3

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 291
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getState()I

    move-result v1

    if-eq v1, v6, :cond_4

    .line 292
    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    .line 293
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Error: audio output not available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    move v0, v7

    .line 279
    goto :goto_1

    .line 284
    :cond_3
    const/4 v0, -0x1

    goto :goto_3

    .line 295
    :cond_4
    iget-boolean v1, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-eqz v1, :cond_5

    .line 296
    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    goto :goto_0

    .line 299
    :cond_5
    iput-object v0, p0, Lcom/gemini/chat/ReadAloud;->track:Landroid/media/AudioTrack;

    .line 300
    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 302
    :cond_6
    iget-boolean v1, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-nez v1, :cond_0

    .line 303
    array-length v1, v8

    invoke-virtual {v0, v8, v7, v1}, Landroid/media/AudioTrack;->write([BII)I

    move-result v0

    .line 304
    if-lez v0, :cond_0

    iget-wide v2, p0, Lcom/gemini/chat/ReadAloud;->written:J

    div-int/lit8 v0, v0, 0x2

    int-to-long v0, v0

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/gemini/chat/ReadAloud;->written:J

    goto :goto_0

    :cond_7
    move v0, v7

    goto :goto_2
.end method

.method private releaseTrack()V
    .locals 2

    .prologue
    .line 327
    iget-object v0, p0, Lcom/gemini/chat/ReadAloud;->track:Landroid/media/AudioTrack;

    .line 328
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/gemini/chat/ReadAloud;->track:Landroid/media/AudioTrack;

    .line 329
    if-nez v0, :cond_0

    .line 339
    :goto_0
    return-void

    .line 331
    :cond_0
    :try_start_0
    iget-boolean v1, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-eqz v1, :cond_1

    .line 332
    invoke-virtual {v0}, Landroid/media/AudioTrack;->pause()V

    .line 333
    invoke-virtual {v0}, Landroid/media/AudioTrack;->flush()V

    .line 335
    :cond_1
    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 338
    :goto_1
    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    goto :goto_0

    .line 336
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method private request()I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x5

    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 213
    .line 214
    const/4 v4, 0x0

    .line 215
    iput-object v3, p0, Lcom/gemini/chat/ReadAloud;->lastRetryAfter:Ljava/lang/String;

    .line 217
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v2, "https://generativelanguage.googleapis.com/v1beta/interactions"

    invoke-direct {v0, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 218
    :try_start_1
    iput-object v0, p0, Lcom/gemini/chat/ReadAloud;->conn:Ljava/net/HttpURLConnection;

    .line 219
    const/16 v2, 0x4e20

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 220
    const v2, 0x1d4c0

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 221
    const-string v2, "POST"

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 222
    const-string v2, "Content-Type"

    const-string v6, "application/json; charset=utf-8"

    invoke-virtual {v0, v2, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    const-string v2, "x-goog-api-key"

    iget-object v6, p0, Lcom/gemini/chat/ReadAloud;->key:Ljava/lang/String;

    invoke-virtual {v0, v2, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 225
    iget-object v2, p0, Lcom/gemini/chat/ReadAloud;->model:Ljava/lang/String;

    iget-object v6, p0, Lcom/gemini/chat/ReadAloud;->voice:Ljava/lang/String;

    iget-object v7, p0, Lcom/gemini/chat/ReadAloud;->text:Ljava/lang/String;

    invoke-static {v2, v6, v7}, Lcom/gemini/chat/ReadAloud;->requestBody(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v6, "UTF-8"

    invoke-virtual {v2, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 226
    array-length v6, v2

    invoke-virtual {v0, v6}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 227
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v6

    .line 229
    :try_start_2
    invoke-virtual {v6, v2}, Ljava/io/OutputStream;->write([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 231
    :try_start_3
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V

    .line 233
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    .line 234
    iget-boolean v6, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v6, :cond_4

    .line 254
    if-eqz v3, :cond_0

    .line 256
    :try_start_4
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 260
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 262
    :try_start_5
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 266
    :cond_1
    :goto_1
    iput-object v3, p0, Lcom/gemini/chat/ReadAloud;->conn:Ljava/net/HttpURLConnection;

    move v0, v1

    .line 252
    :goto_2
    return v0

    .line 231
    :catchall_0
    move-exception v1

    :try_start_6
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V

    .line 232
    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 254
    :catchall_1
    move-exception v1

    move-object v2, v3

    move-object v4, v0

    :goto_3
    if-eqz v2, :cond_2

    .line 256
    :try_start_7
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    .line 260
    :cond_2
    :goto_4
    if-eqz v4, :cond_3

    .line 262
    :try_start_8
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_7

    .line 266
    :cond_3
    :goto_5
    iput-object v3, p0, Lcom/gemini/chat/ReadAloud;->conn:Ljava/net/HttpURLConnection;

    .line 267
    throw v1

    .line 235
    :cond_4
    const/16 v6, 0xc8

    if-lt v2, v6, :cond_5

    const/16 v6, 0x12c

    if-lt v2, v6, :cond_8

    .line 236
    :cond_5
    :try_start_9
    const-string v1, "Retry-After"

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gemini/chat/ReadAloud;->lastRetryAfter:Ljava/lang/String;

    .line 237
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Lcom/gemini/chat/ChatActivity;->readAll(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/gemini/chat/ReadAloud;->errorMessage(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gemini/chat/ReadAloud;->lastError:Ljava/lang/String;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 254
    if-eqz v3, :cond_6

    .line 256
    :try_start_a
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_2

    .line 260
    :cond_6
    :goto_6
    if-eqz v0, :cond_7

    .line 262
    :try_start_b
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_3

    .line 266
    :cond_7
    :goto_7
    iput-object v3, p0, Lcom/gemini/chat/ReadAloud;->conn:Ljava/net/HttpURLConnection;

    move v0, v2

    .line 238
    goto :goto_2

    .line 240
    :cond_8
    :try_start_c
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    const-string v7, "UTF-8"

    invoke-direct {v4, v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    const/16 v6, 0x2000

    invoke-direct {v2, v4, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 241
    :try_start_d
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 243
    :cond_9
    :goto_8
    iget-boolean v4, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-nez v4, :cond_c

    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_c

    .line 244
    const-string v4, "data:"

    invoke-virtual {v7, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 245
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v5, :cond_a

    const/4 v4, 0x5

    invoke-virtual {v7, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v8, 0x20

    if-ne v4, v8, :cond_a

    const/4 v4, 0x6

    :goto_9
    invoke-virtual {v7, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_8

    .line 254
    :catchall_2
    move-exception v1

    move-object v4, v0

    goto :goto_3

    :cond_a
    move v4, v5

    .line 245
    goto :goto_9

    .line 246
    :cond_b
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_9

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-lez v4, :cond_9

    .line 247
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/gemini/chat/ReadAloud;->event(Ljava/lang/String;)V

    .line 248
    const/4 v4, 0x0

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_8

    .line 251
    :cond_c
    iget-boolean v4, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-nez v4, :cond_d

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-lez v4, :cond_d

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/gemini/chat/ReadAloud;->event(Ljava/lang/String;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 254
    :cond_d
    if-eqz v2, :cond_e

    .line 256
    :try_start_e
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_4

    .line 260
    :cond_e
    :goto_a
    if-eqz v0, :cond_f

    .line 262
    :try_start_f
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_5

    .line 266
    :cond_f
    :goto_b
    iput-object v3, p0, Lcom/gemini/chat/ReadAloud;->conn:Ljava/net/HttpURLConnection;

    move v0, v1

    .line 252
    goto/16 :goto_2

    .line 257
    :catch_0
    move-exception v2

    goto/16 :goto_0

    .line 263
    :catch_1
    move-exception v0

    goto/16 :goto_1

    .line 257
    :catch_2
    move-exception v1

    goto/16 :goto_6

    .line 263
    :catch_3
    move-exception v0

    goto/16 :goto_7

    .line 257
    :catch_4
    move-exception v2

    goto :goto_a

    .line 263
    :catch_5
    move-exception v0

    goto :goto_b

    .line 257
    :catch_6
    move-exception v0

    goto/16 :goto_4

    .line 263
    :catch_7
    move-exception v0

    goto/16 :goto_5

    .line 254
    :catchall_3
    move-exception v0

    move-object v1, v0

    move-object v2, v3

    move-object v4, v3

    goto/16 :goto_3
.end method

.method static requestBody(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 62
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 63
    const-string v1, "type"

    const-string v2, "text"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 64
    const-string v1, "text"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 65
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 66
    const-string v2, "type"

    const-string v3, "user_input"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 67
    const-string v2, "content"

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 68
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 69
    const-string v2, "type"

    const-string v3, "audio"

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 70
    if-eqz p0, :cond_0

    const-string v2, "gemini-3.1-"

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 71
    :cond_0
    const-string v2, "mime_type"

    const-string v3, "audio/l16"

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 72
    const-string v2, "sample_rate"

    const/16 v3, 0x5dc0

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 74
    :cond_1
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 75
    const-string v3, "voice"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 77
    const-string v4, "speech_config"

    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 78
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 79
    const-string v4, "model"

    invoke-virtual {v2, v4, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 80
    const-string v4, "input"

    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v5, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v2, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    const-string v1, "response_format"

    invoke-virtual {v2, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 82
    const-string v0, "generation_config"

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 83
    const-string v0, "stream"

    const/4 v1, 0x1

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 84
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static speakable(Ljava/lang/String;)Ljava/lang/String;
    .locals 9

    .prologue
    const/4 v2, 0x0

    .line 105
    invoke-static {p0, v2}, Lcom/gemini/chat/Markdown;->parse(Ljava/lang/String;I)Lcom/gemini/chat/Markdown$Doc;

    move-result-object v4

    .line 106
    iget-object v0, v4, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    .line 107
    new-array v6, v5, [Z

    move v1, v2

    .line 108
    :goto_0
    iget-object v0, v4, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_2

    .line 109
    iget-object v0, v4, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gemini/chat/Markdown$Span;

    .line 110
    iget v3, v0, Lcom/gemini/chat/Markdown$Span;->type:I

    const/16 v7, 0x10

    if-eq v3, v7, :cond_0

    iget v3, v0, Lcom/gemini/chat/Markdown$Span;->type:I

    const/16 v7, 0x8

    if-eq v3, v7, :cond_0

    iget v3, v0, Lcom/gemini/chat/Markdown$Span;->type:I

    const/16 v7, 0x9

    if-eq v3, v7, :cond_0

    iget v3, v0, Lcom/gemini/chat/Markdown$Span;->type:I

    const/16 v7, 0xf

    if-ne v3, v7, :cond_1

    .line 112
    :cond_0
    iget v3, v0, Lcom/gemini/chat/Markdown$Span;->start:I

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    :goto_1
    iget v7, v0, Lcom/gemini/chat/Markdown$Span;->end:I

    invoke-static {v5, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    if-ge v3, v7, :cond_1

    const/4 v7, 0x1

    aput-boolean v7, v6, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 108
    :cond_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 115
    :cond_2
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    move v1, v2

    move v0, v2

    .line 117
    :goto_2
    if-ge v1, v5, :cond_6

    .line 118
    aget-boolean v7, v6, v1

    if-eqz v7, :cond_4

    .line 117
    :cond_3
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 119
    :cond_4
    iget-object v7, v4, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v7

    .line 120
    const/16 v8, 0xa

    if-ne v7, v8, :cond_5

    .line 121
    add-int/lit8 v0, v0, 0x1

    const/4 v8, 0x2

    if-gt v0, v8, :cond_3

    .line 125
    :goto_4
    invoke-virtual {v3, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_3

    :cond_5
    move v0, v2

    .line 123
    goto :goto_4

    .line 127
    :cond_6
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method isStopped()Z
    .locals 1

    .prologue
    .line 167
    iget-boolean v0, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    return v0
.end method

.method public run()V
    .locals 8

    .prologue
    const/4 v1, 0x0

    .line 172
    const/16 v0, -0x10

    :try_start_0
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    .line 177
    :goto_0
    const/4 v2, 0x2

    .line 178
    const/4 v0, 0x0

    .line 179
    :goto_1
    :try_start_1
    invoke-direct {p0}, Lcom/gemini/chat/ReadAloud;->request()I

    move-result v3

    .line 180
    if-eqz v3, :cond_7

    iget-boolean v4, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v4, :cond_2

    move-object v0, v1

    .line 188
    :goto_2
    if-nez v0, :cond_0

    :try_start_2
    iget-boolean v2, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-nez v2, :cond_0

    invoke-direct {p0}, Lcom/gemini/chat/ReadAloud;->drain()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 198
    :cond_0
    invoke-direct {p0}, Lcom/gemini/chat/ReadAloud;->releaseTrack()V

    .line 200
    :goto_3
    iget-boolean v2, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-eqz v2, :cond_1

    move-object v0, v1

    .line 201
    :cond_1
    iget-object v1, p0, Lcom/gemini/chat/ReadAloud;->ui:Landroid/os/Handler;

    new-instance v2, Lcom/gemini/chat/ReadAloud$2;

    invoke-direct {v2, p0, v0}, Lcom/gemini/chat/ReadAloud$2;-><init>(Lcom/gemini/chat/ReadAloud;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 206
    return-void

    .line 181
    :cond_2
    :try_start_3
    iget-object v4, p0, Lcom/gemini/chat/ReadAloud;->lastError:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/gemini/chat/ChatActivity;->maxRetriesFor(ILjava/lang/String;)I

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 182
    invoke-static {v3}, Lcom/gemini/chat/ChatActivity;->retryable(I)Z

    move-result v4

    if-eqz v4, :cond_3

    if-ge v0, v2, :cond_3

    iget-wide v4, p0, Lcom/gemini/chat/ReadAloud;->written:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_4

    .line 183
    :cond_3
    iget-object v0, p0, Lcom/gemini/chat/ReadAloud;->lastError:Ljava/lang/String;

    goto :goto_2

    .line 186
    :cond_4
    add-int/lit8 v4, v0, 0x1

    iget-object v5, p0, Lcom/gemini/chat/ReadAloud;->lastRetryAfter:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    invoke-static {v4, v3, v5, v6, v7}, Lcom/gemini/chat/ChatActivity;->retryDelayMs(IILjava/lang/String;J)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 178
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 189
    :catch_0
    move-exception v0

    move-object v0, v1

    .line 198
    :goto_4
    invoke-direct {p0}, Lcom/gemini/chat/ReadAloud;->releaseTrack()V

    goto :goto_3

    .line 191
    :catch_1
    move-exception v2

    move-object v0, v1

    .line 192
    :goto_5
    :try_start_4
    iget-boolean v3, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-nez v3, :cond_5

    .line 193
    const-string v0, "Gemini"

    const-string v3, "Read aloud failed"

    invoke-static {v0, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 194
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 195
    if-eqz v0, :cond_6

    const-string v3, "Error"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result v3

    if-eqz v3, :cond_6

    .line 198
    :cond_5
    :goto_6
    invoke-direct {p0}, Lcom/gemini/chat/ReadAloud;->releaseTrack()V

    goto :goto_3

    .line 195
    :cond_6
    :try_start_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Read aloud failed: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result-object v0

    goto :goto_6

    .line 198
    :catchall_0
    move-exception v0

    invoke-direct {p0}, Lcom/gemini/chat/ReadAloud;->releaseTrack()V

    .line 199
    throw v0

    .line 173
    :catch_2
    move-exception v0

    goto/16 :goto_0

    .line 191
    :catch_3
    move-exception v2

    goto :goto_5

    .line 189
    :catch_4
    move-exception v2

    goto :goto_4

    :cond_7
    move-object v0, v1

    goto/16 :goto_2
.end method

.method stopReading()V
    .locals 2

    .prologue
    .line 143
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    .line 144
    iget-object v0, p0, Lcom/gemini/chat/ReadAloud;->conn:Ljava/net/HttpURLConnection;

    .line 145
    if-eqz v0, :cond_0

    .line 146
    new-instance v1, Lcom/gemini/chat/ReadAloud$1;

    invoke-direct {v1, p0, v0}, Lcom/gemini/chat/ReadAloud$1;-><init>(Lcom/gemini/chat/ReadAloud;Ljava/net/HttpURLConnection;)V

    .line 153
    invoke-virtual {v1}, Lcom/gemini/chat/ReadAloud$1;->start()V

    .line 155
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/ReadAloud;->track:Landroid/media/AudioTrack;

    .line 156
    if-eqz v0, :cond_1

    .line 158
    :try_start_0
    invoke-virtual {v0}, Landroid/media/AudioTrack;->pause()V

    .line 159
    invoke-virtual {v0}, Landroid/media/AudioTrack;->flush()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/gemini/chat/ReadAloud;->interrupt()V

    .line 164
    return-void

    .line 160
    :catch_0
    move-exception v0

    goto :goto_0
.end method
