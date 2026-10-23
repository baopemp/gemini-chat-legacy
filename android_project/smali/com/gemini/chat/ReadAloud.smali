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

    .line 27
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

    .line 28
    sget-object v0, Lcom/gemini/chat/ReadAloud;->MODELS:[Ljava/lang/String;

    aget-object v0, v0, v3

    sput-object v0, Lcom/gemini/chat/ReadAloud;->DEFAULT_MODEL:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;Lcom/gemini/chat/ReadAloud$Listener;)V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 45
    const/4 v0, -0x1

    iput v0, p0, Lcom/gemini/chat/ReadAloud;->carry:I

    .line 48
    iput-wide p1, p0, Lcom/gemini/chat/ReadAloud;->messageId:J

    .line 49
    iput-object p3, p0, Lcom/gemini/chat/ReadAloud;->key:Ljava/lang/String;

    .line 50
    iput-object p4, p0, Lcom/gemini/chat/ReadAloud;->model:Ljava/lang/String;

    .line 51
    iput-object p5, p0, Lcom/gemini/chat/ReadAloud;->voice:Ljava/lang/String;

    .line 52
    iput-object p6, p0, Lcom/gemini/chat/ReadAloud;->text:Ljava/lang/String;

    .line 53
    iput-object p7, p0, Lcom/gemini/chat/ReadAloud;->ui:Landroid/os/Handler;

    .line 54
    iput-object p8, p0, Lcom/gemini/chat/ReadAloud;->listener:Lcom/gemini/chat/ReadAloud$Listener;

    .line 55
    return-void
.end method

.method static synthetic access$000(Lcom/gemini/chat/ReadAloud;)Lcom/gemini/chat/ReadAloud$Listener;
    .locals 1

    .prologue
    .line 25
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

    .line 85
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 86
    const-string v2, "error"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 87
    if-nez v2, :cond_0

    const-string v3, "error"

    const-string v4, "event_type"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 88
    :cond_0
    if-eqz v2, :cond_1

    const-string v0, "message"

    const-string v1, ""

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    .line 89
    :goto_0
    if-eqz v2, :cond_2

    const-string v0, "code"

    const-string v3, ""

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 90
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

    .line 88
    :cond_1
    const-string v0, ""

    move-object v1, v0

    goto :goto_0

    .line 89
    :cond_2
    const-string v0, ""

    goto :goto_1

    .line 90
    :cond_3
    const-string v0, ""

    goto :goto_2

    .line 92
    :cond_4
    const-string v2, "step.delta"

    const-string v3, "event_type"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 96
    :cond_5
    :goto_3
    return-object v1

    .line 93
    :cond_6
    const-string v2, "delta"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 94
    if-eqz v0, :cond_5

    const-string v2, "audio"

    const-string v3, "type"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 95
    const-string v2, "data"

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 96
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
    .line 283
    iget-object v8, p0, Lcom/gemini/chat/ReadAloud;->track:Landroid/media/AudioTrack;

    .line 284
    if-nez v8, :cond_1

    .line 298
    :cond_0
    :goto_0
    return-void

    .line 285
    :cond_1
    const-wide/16 v2, -0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 286
    :goto_1
    iget-boolean v4, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-nez v4, :cond_0

    .line 287
    invoke-virtual {v8}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    move-result v4

    int-to-long v4, v4

    const-wide v6, 0xffffffffL

    and-long/2addr v6, v4

    .line 288
    iget-wide v4, p0, Lcom/gemini/chat/ReadAloud;->written:J

    cmp-long v4, v6, v4

    if-gez v4, :cond_0

    .line 289
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 290
    cmp-long v9, v6, v2

    if-eqz v9, :cond_3

    move-wide v0, v4

    move-wide v2, v6

    .line 296
    :cond_2
    const-wide/16 v4, 0x32

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_1

    .line 293
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
    .line 129
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "error"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 130
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

    .line 133
    :goto_0
    return-object v0

    .line 131
    :catch_0
    move-exception v0

    .line 133
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
    .line 251
    const-string v0, "[DONE]"

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 254
    :cond_0
    :goto_0
    return-void

    .line 252
    :cond_1
    invoke-static {p1}, Lcom/gemini/chat/ReadAloud;->audioOf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 253
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

    .line 258
    iget-boolean v0, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-nez v0, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    .line 279
    :cond_0
    :goto_0
    return-void

    .line 259
    :cond_1
    array-length v1, p1

    iget v0, p0, Lcom/gemini/chat/ReadAloud;->carry:I

    if-ltz v0, :cond_2

    move v0, v6

    :goto_1
    add-int/2addr v1, v0

    .line 260
    and-int/lit8 v0, v1, -0x2

    new-array v8, v0, [B

    .line 262
    iget v0, p0, Lcom/gemini/chat/ReadAloud;->carry:I

    if-ltz v0, :cond_6

    array-length v0, v8

    if-lez v0, :cond_6

    iget v0, p0, Lcom/gemini/chat/ReadAloud;->carry:I

    int-to-byte v0, v0

    aput-byte v0, v8, v7

    move v0, v6

    .line 263
    :goto_2
    array-length v4, v8

    sub-int/2addr v4, v0

    invoke-static {p1, v7, v8, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 264
    and-int/lit8 v0, v1, 0x1

    if-eqz v0, :cond_3

    array-length v0, p1

    add-int/lit8 v0, v0, -0x1

    aget-byte v0, p1, v0

    and-int/lit16 v0, v0, 0xff

    :goto_3
    iput v0, p0, Lcom/gemini/chat/ReadAloud;->carry:I

    .line 265
    array-length v0, v8

    if-eqz v0, :cond_0

    .line 266
    iget-object v0, p0, Lcom/gemini/chat/ReadAloud;->track:Landroid/media/AudioTrack;

    if-nez v0, :cond_5

    .line 267
    invoke-static {v2, v3, v3}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v4

    .line 268
    new-instance v0, Landroid/media/AudioTrack;

    const/4 v1, 0x3

    const v5, 0xbb80

    .line 269
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    move v4, v3

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 270
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getState()I

    move-result v1

    if-eq v1, v6, :cond_4

    .line 271
    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    .line 272
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Error: audio output not available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    move v0, v7

    .line 259
    goto :goto_1

    .line 264
    :cond_3
    const/4 v0, -0x1

    goto :goto_3

    .line 274
    :cond_4
    iput-object v0, p0, Lcom/gemini/chat/ReadAloud;->track:Landroid/media/AudioTrack;

    .line 275
    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 277
    :cond_5
    iget-object v0, p0, Lcom/gemini/chat/ReadAloud;->track:Landroid/media/AudioTrack;

    array-length v1, v8

    invoke-virtual {v0, v8, v7, v1}, Landroid/media/AudioTrack;->write([BII)I

    .line 278
    iget-wide v0, p0, Lcom/gemini/chat/ReadAloud;->written:J

    array-length v2, v8

    div-int/lit8 v2, v2, 0x2

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/gemini/chat/ReadAloud;->written:J

    goto :goto_0

    :cond_6
    move v0, v7

    goto :goto_2
.end method

.method private releaseTrack()V
    .locals 2

    .prologue
    .line 301
    iget-object v0, p0, Lcom/gemini/chat/ReadAloud;->track:Landroid/media/AudioTrack;

    .line 302
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/gemini/chat/ReadAloud;->track:Landroid/media/AudioTrack;

    .line 303
    if-nez v0, :cond_0

    .line 313
    :goto_0
    return-void

    .line 305
    :cond_0
    :try_start_0
    iget-boolean v1, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-eqz v1, :cond_1

    .line 306
    invoke-virtual {v0}, Landroid/media/AudioTrack;->pause()V

    .line 307
    invoke-virtual {v0}, Landroid/media/AudioTrack;->flush()V

    .line 309
    :cond_1
    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 312
    :goto_1
    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    goto :goto_0

    .line 310
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method private request()I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x5

    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 202
    const/4 v5, 0x0

    .line 204
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v2, "https://generativelanguage.googleapis.com/v1beta/interactions"

    invoke-direct {v0, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 205
    iput-object v0, p0, Lcom/gemini/chat/ReadAloud;->conn:Ljava/net/HttpURLConnection;

    .line 206
    const/16 v2, 0x7530

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 207
    const v2, 0x1d4c0

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 208
    const-string v2, "POST"

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 209
    const-string v2, "Content-Type"

    const-string v6, "application/json; charset=utf-8"

    invoke-virtual {v0, v2, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    const-string v2, "x-goog-api-key"

    iget-object v6, p0, Lcom/gemini/chat/ReadAloud;->key:Ljava/lang/String;

    invoke-virtual {v0, v2, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 212
    iget-object v2, p0, Lcom/gemini/chat/ReadAloud;->model:Ljava/lang/String;

    iget-object v6, p0, Lcom/gemini/chat/ReadAloud;->voice:Ljava/lang/String;

    iget-object v7, p0, Lcom/gemini/chat/ReadAloud;->text:Ljava/lang/String;

    invoke-static {v2, v6, v7}, Lcom/gemini/chat/ReadAloud;->requestBody(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v6, "UTF-8"

    invoke-virtual {v2, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 213
    array-length v6, v2

    invoke-virtual {v0, v6}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 214
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v6

    .line 216
    :try_start_1
    invoke-virtual {v6, v2}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 218
    :try_start_2
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V

    .line 220
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    .line 221
    iget-boolean v6, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v6, :cond_2

    .line 240
    if-eqz v3, :cond_0

    .line 242
    :try_start_3
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 246
    :cond_0
    :goto_0
    iput-object v3, p0, Lcom/gemini/chat/ReadAloud;->conn:Ljava/net/HttpURLConnection;

    move v0, v1

    .line 238
    :goto_1
    return v0

    .line 218
    :catchall_0
    move-exception v0

    :try_start_4
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V

    .line 219
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 240
    :catchall_1
    move-exception v0

    move-object v1, v3

    :goto_2
    if-eqz v1, :cond_1

    .line 242
    :try_start_5
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 246
    :cond_1
    :goto_3
    iput-object v3, p0, Lcom/gemini/chat/ReadAloud;->conn:Ljava/net/HttpURLConnection;

    .line 247
    throw v0

    .line 222
    :cond_2
    const/16 v6, 0xc8

    if-lt v2, v6, :cond_3

    const/16 v6, 0x12c

    if-lt v2, v6, :cond_5

    .line 223
    :cond_3
    :try_start_6
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->readAll(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/gemini/chat/ReadAloud;->errorMessage(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gemini/chat/ReadAloud;->lastError:Ljava/lang/String;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 240
    if-eqz v3, :cond_4

    .line 242
    :try_start_7
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    .line 246
    :cond_4
    :goto_4
    iput-object v3, p0, Lcom/gemini/chat/ReadAloud;->conn:Ljava/net/HttpURLConnection;

    move v0, v2

    .line 224
    goto :goto_1

    .line 226
    :cond_5
    :try_start_8
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    const-string v6, "UTF-8"

    invoke-direct {v5, v0, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    const/16 v0, 0x2000

    invoke-direct {v2, v5, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 227
    :try_start_9
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 229
    :cond_6
    :goto_5
    iget-boolean v0, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-nez v0, :cond_9

    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_9

    .line 230
    const-string v0, "data:"

    invoke-virtual {v6, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 231
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v4, :cond_7

    const/4 v0, 0x5

    invoke-virtual {v6, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v7, 0x20

    if-ne v0, v7, :cond_7

    const/4 v0, 0x6

    :goto_6
    invoke-virtual {v6, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5

    .line 240
    :catchall_2
    move-exception v0

    move-object v1, v2

    goto :goto_2

    :cond_7
    move v0, v4

    .line 231
    goto :goto_6

    .line 232
    :cond_8
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-lez v0, :cond_6

    .line 233
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ReadAloud;->event(Ljava/lang/String;)V

    .line 234
    const/4 v0, 0x0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_5

    .line 237
    :cond_9
    iget-boolean v0, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-nez v0, :cond_a

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-lez v0, :cond_a

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ReadAloud;->event(Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 240
    :cond_a
    if-eqz v2, :cond_b

    .line 242
    :try_start_a
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_2

    .line 246
    :cond_b
    :goto_7
    iput-object v3, p0, Lcom/gemini/chat/ReadAloud;->conn:Ljava/net/HttpURLConnection;

    move v0, v1

    .line 238
    goto/16 :goto_1

    .line 243
    :catch_0
    move-exception v0

    goto/16 :goto_0

    :catch_1
    move-exception v0

    goto/16 :goto_4

    :catch_2
    move-exception v0

    goto :goto_7

    :catch_3
    move-exception v1

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
    .line 60
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 61
    const-string v1, "type"

    const-string v2, "text"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    const-string v1, "text"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 64
    const-string v2, "type"

    const-string v3, "user_input"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 65
    const-string v2, "content"

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 66
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 67
    const-string v2, "type"

    const-string v3, "audio"

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 68
    const-string v2, "mime_type"

    const-string v3, "audio/l16"

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 69
    const-string v2, "sample_rate"

    const/16 v3, 0x5dc0

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 70
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 71
    const-string v3, "voice"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 72
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 73
    const-string v4, "speech_config"

    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 74
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 75
    const-string v4, "model"

    invoke-virtual {v2, v4, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    const-string v4, "input"

    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v5, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v2, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    const-string v1, "response_format"

    invoke-virtual {v2, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 78
    const-string v0, "generation_config"

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    const-string v0, "stream"

    const/4 v1, 0x1

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 80
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static speakable(Ljava/lang/String;)Ljava/lang/String;
    .locals 9

    .prologue
    const/4 v2, 0x0

    .line 101
    invoke-static {p0, v2}, Lcom/gemini/chat/Markdown;->parse(Ljava/lang/String;I)Lcom/gemini/chat/Markdown$Doc;

    move-result-object v4

    .line 102
    iget-object v0, v4, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    .line 103
    new-array v6, v5, [Z

    move v1, v2

    .line 104
    :goto_0
    iget-object v0, v4, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_2

    .line 105
    iget-object v0, v4, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gemini/chat/Markdown$Span;

    .line 106
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

    .line 108
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

    .line 104
    :cond_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 111
    :cond_2
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    move v1, v2

    move v0, v2

    .line 113
    :goto_2
    if-ge v1, v5, :cond_6

    .line 114
    aget-boolean v7, v6, v1

    if-eqz v7, :cond_4

    .line 113
    :cond_3
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 115
    :cond_4
    iget-object v7, v4, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v7

    .line 116
    const/16 v8, 0xa

    if-ne v7, v8, :cond_5

    .line 117
    add-int/lit8 v0, v0, 0x1

    const/4 v8, 0x2

    if-gt v0, v8, :cond_3

    .line 121
    :goto_4
    invoke-virtual {v3, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_3

    :cond_5
    move v0, v2

    .line 119
    goto :goto_4

    .line 123
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
    .line 163
    iget-boolean v0, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    return v0
.end method

.method public run()V
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 167
    .line 169
    const/4 v0, 0x0

    .line 170
    :goto_0
    :try_start_0
    invoke-direct {p0}, Lcom/gemini/chat/ReadAloud;->request()I

    move-result v2

    .line 171
    if-eqz v2, :cond_7

    iget-boolean v3, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_2

    move-object v0, v1

    .line 178
    :goto_1
    if-nez v0, :cond_0

    :try_start_1
    iget-boolean v2, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-nez v2, :cond_0

    invoke-direct {p0}, Lcom/gemini/chat/ReadAloud;->drain()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 188
    :cond_0
    invoke-direct {p0}, Lcom/gemini/chat/ReadAloud;->releaseTrack()V

    .line 190
    :goto_2
    iget-boolean v2, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-eqz v2, :cond_1

    move-object v0, v1

    .line 191
    :cond_1
    iget-object v1, p0, Lcom/gemini/chat/ReadAloud;->ui:Landroid/os/Handler;

    new-instance v2, Lcom/gemini/chat/ReadAloud$2;

    invoke-direct {v2, p0, v0}, Lcom/gemini/chat/ReadAloud$2;-><init>(Lcom/gemini/chat/ReadAloud;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 196
    return-void

    .line 172
    :cond_2
    :try_start_2
    invoke-static {v2}, Lcom/gemini/chat/ChatActivity;->retryable(I)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v2, 0x2

    if-ge v0, v2, :cond_3

    iget-wide v2, p0, Lcom/gemini/chat/ReadAloud;->written:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_4

    .line 173
    :cond_3
    iget-object v0, p0, Lcom/gemini/chat/ReadAloud;->lastError:Ljava/lang/String;

    goto :goto_1

    .line 176
    :cond_4
    const-wide/16 v2, 0x7d0

    shl-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 169
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 179
    :catch_0
    move-exception v0

    move-object v0, v1

    .line 188
    :goto_3
    invoke-direct {p0}, Lcom/gemini/chat/ReadAloud;->releaseTrack()V

    goto :goto_2

    .line 181
    :catch_1
    move-exception v2

    move-object v0, v1

    .line 182
    :goto_4
    :try_start_3
    iget-boolean v3, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    if-nez v3, :cond_5

    .line 183
    const-string v0, "Gemini"

    const-string v3, "Read aloud failed"

    invoke-static {v0, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 184
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 185
    if-eqz v0, :cond_6

    const-string v3, "Error"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v3

    if-eqz v3, :cond_6

    .line 188
    :cond_5
    :goto_5
    invoke-direct {p0}, Lcom/gemini/chat/ReadAloud;->releaseTrack()V

    goto :goto_2

    .line 185
    :cond_6
    :try_start_4
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
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v0

    goto :goto_5

    .line 188
    :catchall_0
    move-exception v0

    invoke-direct {p0}, Lcom/gemini/chat/ReadAloud;->releaseTrack()V

    .line 189
    throw v0

    .line 181
    :catch_2
    move-exception v2

    goto :goto_4

    .line 179
    :catch_3
    move-exception v2

    goto :goto_3

    :cond_7
    move-object v0, v1

    goto :goto_1
.end method

.method stopReading()V
    .locals 2

    .prologue
    .line 139
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/gemini/chat/ReadAloud;->stopped:Z

    .line 140
    iget-object v0, p0, Lcom/gemini/chat/ReadAloud;->conn:Ljava/net/HttpURLConnection;

    .line 141
    if-eqz v0, :cond_0

    .line 142
    new-instance v1, Lcom/gemini/chat/ReadAloud$1;

    invoke-direct {v1, p0, v0}, Lcom/gemini/chat/ReadAloud$1;-><init>(Lcom/gemini/chat/ReadAloud;Ljava/net/HttpURLConnection;)V

    .line 149
    invoke-virtual {v1}, Lcom/gemini/chat/ReadAloud$1;->start()V

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/ReadAloud;->track:Landroid/media/AudioTrack;

    .line 152
    if-eqz v0, :cond_1

    .line 154
    :try_start_0
    invoke-virtual {v0}, Landroid/media/AudioTrack;->pause()V

    .line 155
    invoke-virtual {v0}, Landroid/media/AudioTrack;->flush()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/gemini/chat/ReadAloud;->interrupt()V

    .line 160
    return-void

    .line 156
    :catch_0
    move-exception v0

    goto :goto_0
.end method
