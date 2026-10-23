.class public final Lcom/gemini/chat/LiveSession;
.super Ljava/lang/Object;
.source "LiveSession.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gemini/chat/LiveSession$Listener;
    }
.end annotation


# static fields
.field private static final OUTBOX_MAX:I = 0xc8

.field public static final OUTPUT_RATE:I = 0x5dc0

.field public static final TRANSCRIBE_MODEL:Ljava/lang/String; = "gemini-3.5-transcribe-live"

.field public static final URL:Ljava/lang/String; = "wss://generativelanguage.googleapis.com/ws/google.ai.generativelanguage.v1beta.GenerativeService.BidiGenerateContent"


# instance fields
.field public final apiKey:Ljava/lang/String;

.field public volatile goAway:Z

.field public final handsFree:Z

.field public history:[[Ljava/lang/String;

.field public volatile lastHandle:Ljava/lang/String;

.field private final listener:Lcom/gemini/chat/LiveSession$Listener;

.field public final model:Ljava/lang/String;

.field private final outbox:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile ready:Z

.field public resumeHandle:Ljava/lang/String;

.field private volatile stopped:Z

.field public final systemText:Ljava/lang/String;

.field public thinkingLevel:Ljava/lang/String;

.field public transcribeOnly:Z

.field public url:Ljava/lang/String;

.field public final voice:Ljava/lang/String;

.field private final ws:Lcom/gemini/chat/LiveSocket;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/gemini/chat/LiveSession$Listener;)V
    .locals 1

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const-string v0, "wss://generativelanguage.googleapis.com/ws/google.ai.generativelanguage.v1beta.GenerativeService.BidiGenerateContent"

    iput-object v0, p0, Lcom/gemini/chat/LiveSession;->url:Ljava/lang/String;

    .line 79
    new-instance v0, Lcom/gemini/chat/LiveSocket;

    invoke-direct {v0}, Lcom/gemini/chat/LiveSocket;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    .line 83
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    .line 87
    iput-object p1, p0, Lcom/gemini/chat/LiveSession;->apiKey:Ljava/lang/String;

    .line 88
    iput-object p2, p0, Lcom/gemini/chat/LiveSession;->model:Ljava/lang/String;

    .line 89
    iput-object p3, p0, Lcom/gemini/chat/LiveSession;->voice:Ljava/lang/String;

    .line 90
    iput-object p4, p0, Lcom/gemini/chat/LiveSession;->systemText:Ljava/lang/String;

    .line 91
    iput-boolean p5, p0, Lcom/gemini/chat/LiveSession;->handsFree:Z

    .line 92
    iput-object p6, p0, Lcom/gemini/chat/LiveSession;->listener:Lcom/gemini/chat/LiveSession$Listener;

    .line 93
    return-void
.end method

.method static synthetic access$000(Lcom/gemini/chat/LiveSession;)V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/gemini/chat/LiveSession;->writerLoop()V

    return-void
.end method

.method static synthetic access$100(Lcom/gemini/chat/LiveSession;)Lcom/gemini/chat/LiveSocket;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    return-object v0
.end method

.method public static needsThinkingLevel(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 76
    if-eqz p0, :cond_0

    const-string v0, "extended-thinking"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private post(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 212
    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    monitor-enter v1

    .line 213
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    const/16 v2, 0xc8

    if-lt v0, v2, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 214
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 215
    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 216
    monitor-exit v1

    .line 217
    return-void

    .line 216
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private sendRealtime(Lorg/json/JSONObject;)V
    .locals 2

    .prologue
    .line 298
    iget-boolean v0, p0, Lcom/gemini/chat/LiveSession;->ready:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/gemini/chat/LiveSession;->stopped:Z

    if-eqz v0, :cond_1

    .line 303
    :cond_0
    :goto_0
    return-void

    .line 300
    :cond_1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "realtimeInput"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveSession;->post(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 301
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static transcriber(Ljava/lang/String;ZLcom/gemini/chat/LiveSession$Listener;)Lcom/gemini/chat/LiveSession;
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 69
    new-instance v0, Lcom/gemini/chat/LiveSession;

    const-string v2, "gemini-3.5-transcribe-live"

    move-object v1, p0

    move-object v4, v3

    move v5, p1

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/gemini/chat/LiveSession;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/gemini/chat/LiveSession$Listener;)V

    .line 70
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/gemini/chat/LiveSession;->transcribeOnly:Z

    .line 71
    return-object v0
.end method

.method private writerLoop()V
    .locals 4

    .prologue
    .line 188
    :goto_0
    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    monitor-enter v1

    .line 189
    :goto_1
    :try_start_0
    iget-boolean v0, p0, Lcom/gemini/chat/LiveSession;->stopped:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 191
    :try_start_1
    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 192
    :catch_0
    move-exception v0

    .line 193
    :try_start_2
    monitor-exit v1

    .line 196
    :goto_2
    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/gemini/chat/LiveSession;->stopped:Z

    if-eqz v0, :cond_1

    monitor-exit v1

    goto :goto_2

    .line 198
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 197
    :cond_1
    :try_start_3
    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 198
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 200
    :try_start_4
    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    invoke-virtual {v1, v0}, Lcom/gemini/chat/LiveSocket;->send(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 201
    :catch_1
    move-exception v0

    .line 203
    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    monitor-enter v1

    .line 204
    :try_start_5
    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 205
    monitor-exit v1

    goto :goto_0

    :catchall_1
    move-exception v0

    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v0
.end method


# virtual methods
.method public activityEnd()V
    .locals 3

    .prologue
    .line 333
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "activityEnd"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveSession;->sendRealtime(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 336
    :goto_0
    return-void

    .line 334
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public activityStart()V
    .locals 3

    .prologue
    .line 325
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "activityStart"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveSession;->sendRealtime(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 328
    :goto_0
    return-void

    .line 326
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public audioStreamEnd()V
    .locals 3

    .prologue
    .line 341
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "audioStreamEnd"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveSession;->sendRealtime(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 344
    :goto_0
    return-void

    .line 342
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method dispatch(Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v2, 0x0

    .line 251
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 252
    const-string v1, "setupComplete"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 253
    invoke-virtual {p0}, Lcom/gemini/chat/LiveSession;->historyMessage()Ljava/lang/String;

    move-result-object v0

    .line 254
    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveSession;->post(Ljava/lang/String;)V

    .line 255
    :cond_0
    iput-boolean v4, p0, Lcom/gemini/chat/LiveSession;->ready:Z

    .line 256
    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->listener:Lcom/gemini/chat/LiveSession$Listener;

    invoke-interface {v0}, Lcom/gemini/chat/LiveSession$Listener;->onReady()V

    .line 293
    :cond_1
    :goto_0
    return-void

    .line 259
    :cond_2
    const-string v1, "serverContent"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 260
    if-eqz v3, :cond_b

    .line 261
    const-string v0, "interimInputTranscription"

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 262
    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->listener:Lcom/gemini/chat/LiveSession$Listener;

    const-string v4, "text"

    const-string v5, ""

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/gemini/chat/LiveSession$Listener;->onInterimInput(Ljava/lang/String;)V

    .line 263
    :cond_3
    const-string v0, "inputTranscription"

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 264
    if-eqz v0, :cond_4

    const-string v1, "text"

    const-string v4, ""

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_4

    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->listener:Lcom/gemini/chat/LiveSession$Listener;

    const-string v4, "text"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/gemini/chat/LiveSession$Listener;->onInputText(Ljava/lang/String;)V

    .line 265
    :cond_4
    const-string v0, "modelTurn"

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 266
    if-eqz v0, :cond_6

    const-string v1, "parts"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    :goto_1
    move v1, v2

    .line 267
    :goto_2
    if-eqz v0, :cond_8

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v1, v4, :cond_8

    .line 268
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 269
    if-eqz v4, :cond_5

    const-string v5, "thought"

    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 267
    :cond_5
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 266
    :cond_6
    const/4 v0, 0x0

    goto :goto_1

    .line 270
    :cond_7
    const-string v5, "inlineData"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 271
    if-eqz v4, :cond_5

    const-string v5, "mimeType"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "audio/"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 272
    iget-object v5, p0, Lcom/gemini/chat/LiveSession;->listener:Lcom/gemini/chat/LiveSession$Listener;

    const-string v6, "data"

    const-string v7, ""

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/gemini/chat/B64;->decode(Ljava/lang/String;)[B

    move-result-object v4

    invoke-interface {v5, v4}, Lcom/gemini/chat/LiveSession$Listener;->onAudio([B)V

    goto :goto_3

    .line 275
    :cond_8
    const-string v0, "outputTranscription"

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 276
    if-eqz v0, :cond_9

    const-string v1, "text"

    const-string v4, ""

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_9

    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->listener:Lcom/gemini/chat/LiveSession$Listener;

    const-string v4, "text"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/gemini/chat/LiveSession$Listener;->onOutputText(Ljava/lang/String;)V

    .line 277
    :cond_9
    const-string v0, "interrupted"

    invoke-virtual {v3, v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->listener:Lcom/gemini/chat/LiveSession$Listener;

    invoke-interface {v0}, Lcom/gemini/chat/LiveSession$Listener;->onInterrupted()V

    .line 278
    :cond_a
    const-string v0, "turnComplete"

    invoke-virtual {v3, v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->listener:Lcom/gemini/chat/LiveSession$Listener;

    invoke-interface {v0}, Lcom/gemini/chat/LiveSession$Listener;->onTurnComplete()V

    goto/16 :goto_0

    .line 281
    :cond_b
    const-string v1, "sessionResumptionUpdate"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 282
    if-eqz v1, :cond_c

    .line 283
    const-string v0, "newHandle"

    const-string v3, ""

    invoke-virtual {v1, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 284
    const-string v3, "resumable"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    iput-object v0, p0, Lcom/gemini/chat/LiveSession;->lastHandle:Ljava/lang/String;

    goto/16 :goto_0

    .line 287
    :cond_c
    const-string v1, "goAway"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 288
    iput-boolean v4, p0, Lcom/gemini/chat/LiveSession;->goAway:Z

    goto/16 :goto_0

    .line 291
    :cond_d
    const-string v1, "error"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 292
    if-eqz v0, :cond_1

    new-instance v1, Ljava/lang/Exception;

    const-string v2, "message"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public historyMessage()Ljava/lang/String;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v12, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 146
    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->history:[[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->history:[[Ljava/lang/String;

    array-length v0, v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->resumeHandle:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/gemini/chat/LiveSession;->transcribeOnly:Z

    if-eqz v0, :cond_1

    .line 168
    :cond_0
    :goto_0
    return-object v5

    .line 147
    :cond_1
    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    move v3, v4

    move-object v0, v5

    move-object v1, v5

    .line 150
    :goto_1
    iget-object v2, p0, Lcom/gemini/chat/LiveSession;->history:[[Ljava/lang/String;

    array-length v2, v2

    if-gt v3, v2, :cond_a

    .line 151
    iget-object v2, p0, Lcom/gemini/chat/LiveSession;->history:[[Ljava/lang/String;

    array-length v2, v2

    if-ge v3, v2, :cond_3

    iget-object v2, p0, Lcom/gemini/chat/LiveSession;->history:[[Ljava/lang/String;

    aget-object v2, v2, v3

    aget-object v2, v2, v4

    :goto_2
    iget-object v6, p0, Lcom/gemini/chat/LiveSession;->history:[[Ljava/lang/String;

    array-length v6, v6

    if-ge v3, v6, :cond_4

    iget-object v6, p0, Lcom/gemini/chat/LiveSession;->history:[[Ljava/lang/String;

    aget-object v6, v6, v3

    aget-object v6, v6, v12

    .line 152
    :goto_3
    iget-object v8, p0, Lcom/gemini/chat/LiveSession;->history:[[Ljava/lang/String;

    array-length v8, v8

    if-ge v3, v8, :cond_7

    .line 153
    if-eqz v6, :cond_2

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_5

    .line 150
    :cond_2
    :goto_4
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_1

    :cond_3
    move-object v2, v5

    .line 151
    goto :goto_2

    :cond_4
    move-object v6, v5

    goto :goto_3

    .line 154
    :cond_5
    const-string v8, "user"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_6

    const-string v8, "model"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 155
    :cond_6
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 156
    const-string v2, "\n\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_4

    .line 160
    :cond_7
    if-eqz v1, :cond_8

    .line 161
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    const-string v9, "role"

    invoke-virtual {v8, v9, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v8, "parts"

    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    const-string v11, "text"

    .line 162
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v11, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v9, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v0

    .line 161
    invoke-virtual {v1, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v7, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 165
    :cond_8
    new-instance v0, Ljava/lang/StringBuffer;

    if-nez v6, :cond_9

    const-string v6, ""

    :cond_9
    invoke-direct {v0, v6}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    move-object v1, v2

    goto :goto_4

    .line 167
    :cond_a
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 168
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "clientContent"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "turns"

    .line 169
    invoke-virtual {v2, v3, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "turnComplete"

    invoke-virtual {v2, v3, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v2

    .line 168
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 169
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_0
.end method

.method public isReady()Z
    .locals 1

    .prologue
    .line 220
    iget-boolean v0, p0, Lcom/gemini/chat/LiveSession;->ready:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/gemini/chat/LiveSession;->stopped:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 224
    const/4 v0, 0x0

    .line 226
    :try_start_0
    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    iget-object v2, p0, Lcom/gemini/chat/LiveSession;->url:Ljava/lang/String;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "x-goog-api-key"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/gemini/chat/LiveSession;->apiKey:Ljava/lang/String;

    aput-object v5, v3, v4

    const/16 v4, 0x7530

    invoke-virtual {v1, v2, v3, v4}, Lcom/gemini/chat/LiveSocket;->connect(Ljava/lang/String;[Ljava/lang/String;I)V

    .line 227
    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    invoke-virtual {p0}, Lcom/gemini/chat/LiveSession;->setupMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/gemini/chat/LiveSocket;->send(Ljava/lang/String;)V

    .line 229
    :goto_0
    iget-boolean v1, p0, Lcom/gemini/chat/LiveSession;->stopped:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    invoke-virtual {v1}, Lcom/gemini/chat/LiveSocket;->receive()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 230
    invoke-virtual {p0, v1}, Lcom/gemini/chat/LiveSession;->dispatch(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    goto :goto_0

    .line 237
    :catch_0
    move-exception v1

    .line 238
    :try_start_1
    iget-boolean v2, p0, Lcom/gemini/chat/LiveSession;->stopped:Z

    if-nez v2, :cond_0

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-result-object v0

    .line 240
    :cond_0
    :goto_1
    iput-boolean v6, p0, Lcom/gemini/chat/LiveSession;->ready:Z

    .line 241
    iput-boolean v7, p0, Lcom/gemini/chat/LiveSession;->stopped:Z

    .line 242
    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    monitor-enter v1

    .line 243
    :try_start_2
    iget-object v2, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 244
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 245
    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    invoke-virtual {v1}, Lcom/gemini/chat/LiveSocket;->close()V

    .line 247
    :goto_2
    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->listener:Lcom/gemini/chat/LiveSession$Listener;

    invoke-interface {v1, v0}, Lcom/gemini/chat/LiveSession$Listener;->onClosed(Ljava/lang/String;)V

    .line 248
    return-void

    .line 232
    :cond_1
    :try_start_3
    iget-boolean v1, p0, Lcom/gemini/chat/LiveSession;->stopped:Z

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    iget v1, v1, Lcom/gemini/chat/LiveSocket;->closeCode:I

    const/16 v2, 0x3e8

    if-eq v1, v2, :cond_4

    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    iget v1, v1, Lcom/gemini/chat/LiveSocket;->closeCode:I

    if-eqz v1, :cond_4

    .line 233
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Closed ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    iget v2, v2, Lcom/gemini/chat/LiveSocket;->closeCode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    iget-object v1, v1, Lcom/gemini/chat/LiveSocket;->closeReason:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ": "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    iget-object v3, v3, Lcom/gemini/chat/LiveSocket;->closeReason:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_3
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-result-object v0

    .line 240
    :cond_2
    :goto_4
    iput-boolean v6, p0, Lcom/gemini/chat/LiveSession;->ready:Z

    .line 241
    iput-boolean v7, p0, Lcom/gemini/chat/LiveSession;->stopped:Z

    .line 242
    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    monitor-enter v1

    .line 243
    :try_start_4
    iget-object v2, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 244
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 245
    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    invoke-virtual {v1}, Lcom/gemini/chat/LiveSocket;->close()V

    goto :goto_2

    .line 233
    :cond_3
    :try_start_5
    const-string v1, ""

    goto :goto_3

    .line 234
    :cond_4
    iget-boolean v1, p0, Lcom/gemini/chat/LiveSession;->stopped:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    iget-object v1, v1, Lcom/gemini/chat/LiveSocket;->closeReason:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 235
    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    iget-object v0, v1, Lcom/gemini/chat/LiveSocket;->closeReason:Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_4

    .line 244
    :catchall_0
    move-exception v0

    :try_start_6
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw v0

    .line 238
    :cond_5
    :try_start_7
    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    move-result-object v0

    goto/16 :goto_1

    .line 244
    :catchall_1
    move-exception v0

    :try_start_8
    monitor-exit v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    throw v0

    .line 240
    :catchall_2
    move-exception v0

    iput-boolean v6, p0, Lcom/gemini/chat/LiveSession;->ready:Z

    .line 241
    iput-boolean v7, p0, Lcom/gemini/chat/LiveSession;->stopped:Z

    .line 242
    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    monitor-enter v1

    .line 243
    :try_start_9
    iget-object v2, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 244
    monitor-exit v1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 245
    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->ws:Lcom/gemini/chat/LiveSocket;

    invoke-virtual {v1}, Lcom/gemini/chat/LiveSocket;->close()V

    .line 246
    throw v0

    .line 244
    :catchall_3
    move-exception v0

    :try_start_a
    monitor-exit v1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    throw v0
.end method

.method public sendAudio([BIII)V
    .locals 6

    .prologue
    .line 316
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "audio"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "mimeType"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "audio/pcm;rate="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 317
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "data"

    invoke-static {p1, p2, p3}, Lcom/gemini/chat/B64;->encode([BII)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    .line 316
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveSession;->sendRealtime(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 320
    :goto_0
    return-void

    .line 318
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public sendText(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 308
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "text"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveSession;->sendRealtime(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 311
    :goto_0
    return-void

    .line 309
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public setupMessage()Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 97
    iget-boolean v0, p0, Lcom/gemini/chat/LiveSession;->transcribeOnly:Z

    if-eqz v0, :cond_2

    .line 98
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 99
    const-string v2, "model"

    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->model:Ljava/lang/String;

    const-string v3, "models/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->model:Ljava/lang/String;

    :goto_0
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 100
    const-string v0, "generationConfig"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "responseModalities"

    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    const-string v5, "TEXT"

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 101
    const-string v0, "inputAudioTranscription"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 102
    iget-boolean v0, p0, Lcom/gemini/chat/LiveSession;->handsFree:Z

    if-nez v0, :cond_0

    .line 103
    const-string v0, "realtimeInputConfig"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "automaticActivityDetection"

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "disabled"

    .line 104
    invoke-virtual {v4, v5, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v4

    .line 103
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 106
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "setup"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 141
    :goto_1
    return-object v0

    .line 99
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "models/"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, Lcom/gemini/chat/LiveSession;->model:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 108
    :cond_2
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 109
    const-string v0, "responseModalities"

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    const-string v3, "AUDIO"

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 110
    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->voice:Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->voice:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_3

    .line 111
    const-string v0, "speechConfig"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "voiceConfig"

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "prebuiltVoiceConfig"

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "voiceName"

    iget-object v8, p0, Lcom/gemini/chat/LiveSession;->voice:Ljava/lang/String;

    .line 112
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    .line 111
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 114
    :cond_3
    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->thinkingLevel:Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->thinkingLevel:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_4

    .line 115
    const-string v0, "thinkingConfig"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "thinkingLevel"

    iget-object v4, p0, Lcom/gemini/chat/LiveSession;->thinkingLevel:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 117
    :cond_4
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 118
    const-string v3, "model"

    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->model:Ljava/lang/String;

    const-string v4, "models/"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->model:Ljava/lang/String;

    :goto_2
    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 119
    const-string v0, "generationConfig"

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 120
    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->systemText:Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->systemText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_5

    .line 121
    const-string v0, "systemInstruction"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "parts"

    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "text"

    iget-object v7, p0, Lcom/gemini/chat/LiveSession;->systemText:Ljava/lang/String;

    .line 122
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v4

    .line 121
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 124
    :cond_5
    const-string v0, "inputAudioTranscription"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 125
    const-string v0, "outputAudioTranscription"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 126
    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->resumeHandle:Ljava/lang/String;

    if-eqz v0, :cond_9

    .line 127
    const-string v0, "sessionResumption"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "handle"

    iget-object v4, p0, Lcom/gemini/chat/LiveSession;->resumeHandle:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 136
    :cond_6
    :goto_3
    const-string v0, "contextWindowCompression"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "slidingWindow"

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 137
    iget-boolean v0, p0, Lcom/gemini/chat/LiveSession;->handsFree:Z

    if-nez v0, :cond_7

    .line 138
    const-string v0, "realtimeInputConfig"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "automaticActivityDetection"

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "disabled"

    .line 139
    invoke-virtual {v4, v5, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v4

    .line 138
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 141
    :cond_7
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "setup"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    .line 118
    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "models/"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, p0, Lcom/gemini/chat/LiveSession;->model:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2

    .line 129
    :cond_9
    const-string v0, "sessionResumption"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 130
    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->history:[[Ljava/lang/String;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->history:[[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_6

    .line 132
    const-string v0, "historyConfig"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "initialHistoryInClientContent"

    invoke-virtual {v1, v3, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3
.end method

.method public start()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 173
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "GeminiLive"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 174
    invoke-virtual {v0, v3}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 175
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 176
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/gemini/chat/LiveSession$1;

    invoke-direct {v1, p0}, Lcom/gemini/chat/LiveSession$1;-><init>(Lcom/gemini/chat/LiveSession;)V

    const-string v2, "GeminiLiveWriter"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 181
    invoke-virtual {v0, v3}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 182
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 183
    return-void
.end method

.method public stop()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 347
    iput-boolean v2, p0, Lcom/gemini/chat/LiveSession;->stopped:Z

    .line 348
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gemini/chat/LiveSession;->ready:Z

    .line 349
    iget-object v1, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    monitor-enter v1

    .line 350
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/LiveSession;->outbox:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 351
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 353
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/gemini/chat/LiveSession$2;

    invoke-direct {v1, p0}, Lcom/gemini/chat/LiveSession$2;-><init>(Lcom/gemini/chat/LiveSession;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 358
    invoke-virtual {v0, v2}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 359
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 360
    return-void

    .line 351
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
