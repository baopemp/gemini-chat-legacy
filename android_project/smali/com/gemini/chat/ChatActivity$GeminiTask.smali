.class Lcom/gemini/chat/ChatActivity$GeminiTask;
.super Landroid/os/AsyncTask;
.source "ChatActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/ChatActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GeminiTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private activeParser:Lcom/gemini/chat/ReplyParser;

.field private conn:Ljava/net/HttpURLConnection;

.field private currentChatId:J

.field private failed:Z

.field private includeThoughts:Z

.field private lastCode:I

.field private lastProgress:J

.field private lastRetryAfter:Ljava/lang/String;

.field private final partialLock:Ljava/lang/Object;

.field private streamError:Ljava/lang/String;

.field private thinkingLevel:Ljava/lang/String;

.field final synthetic this$0:Lcom/gemini/chat/ChatActivity;

.field private thoughts:Ljava/lang/String;

.field private usedModel:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;)V
    .locals 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 216
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 202
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->usedModel:Ljava/lang/String;

    .line 203
    iput-object v2, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    .line 204
    iput-boolean v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    .line 205
    iput v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    .line 206
    iput-object v2, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastRetryAfter:Ljava/lang/String;

    .line 211
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thoughts:Ljava/lang/String;

    .line 213
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->partialLock:Ljava/lang/Object;

    .line 217
    iput-wide p2, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->currentChatId:J

    .line 218
    if-eqz p4, :cond_0

    :goto_0
    iput-object p4, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->usedModel:Ljava/lang/String;

    .line 219
    return-void

    .line 218
    :cond_0
    const-string p4, ""

    goto :goto_0
.end method

.method static synthetic access$2200(Lcom/gemini/chat/ChatActivity$GeminiTask;)Z
    .locals 1

    .prologue
    .line 200
    iget-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->includeThoughts:Z

    return v0
.end method

.method static synthetic access$2400(Lcom/gemini/chat/ChatActivity$GeminiTask;)J
    .locals 2

    .prologue
    .line 200
    iget-wide v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->currentChatId:J

    return-wide v0
.end method

.method static synthetic access$2500(Lcom/gemini/chat/ChatActivity$GeminiTask;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->usedModel:Ljava/lang/String;

    return-object v0
.end method

.method private buildBody(Ljava/lang/String;)Ljava/lang/String;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 228
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 229
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 230
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 231
    const-string v1, "text"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 232
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 233
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 234
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 235
    const-string v2, "parts"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 236
    const-string v1, "systemInstruction"

    invoke-virtual {v5, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 238
    :cond_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 239
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 240
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 241
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$200(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/DatabaseHelper;

    move-result-object v0

    iget-wide v10, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->currentChatId:J

    invoke-virtual {v0, v10, v11}, Lcom/gemini/chat/DatabaseHelper;->getMessages(J)Landroid/database/Cursor;

    move-result-object v9

    .line 242
    if-eqz v9, :cond_7

    .line 244
    :try_start_0
    const-string v0, "role"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v10

    .line 245
    const-string v0, "content"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    .line 246
    const-string v0, "model"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v12

    .line 247
    :cond_1
    :goto_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 248
    invoke-interface {v9, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 249
    const-string v0, "user"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 250
    if-nez v2, :cond_2

    const-string v0, "model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 251
    :cond_2
    invoke-interface {v9, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 252
    if-nez v0, :cond_12

    const-string v0, ""

    move-object v4, v0

    .line 253
    :goto_1
    const/4 v0, 0x0

    .line 254
    if-eqz v2, :cond_11

    if-ltz v12, :cond_11

    .line 255
    invoke-interface {v9, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 256
    if-eqz v2, :cond_11

    const-string v13, "data:image/"

    invoke-virtual {v2, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_11

    invoke-static {v2}, Lcom/gemini/chat/ChatActivity;->toInlineData(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    move-object v2, v0

    .line 258
    :goto_2
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 259
    if-ltz v0, :cond_3

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_10

    .line 260
    :cond_3
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 261
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 262
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 263
    add-int/lit8 v0, v0, 0x1

    move v1, v0

    .line 265
    :goto_3
    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/StringBuffer;

    .line 266
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v13

    if-lez v13, :cond_5

    .line 267
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v13

    if-lez v13, :cond_4

    const-string v13, "\n\n"

    invoke-virtual {v0, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 268
    :cond_4
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 270
    :cond_5
    if-eqz v2, :cond_1

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_0

    .line 273
    :catchall_0
    move-exception v0

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 274
    throw v0

    .line 273
    :cond_6
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 276
    :cond_7
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    move v2, v3

    .line 277
    :goto_4
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v2, v0, :cond_b

    .line 278
    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    .line 279
    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 281
    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-gtz v1, :cond_8

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 282
    :cond_8
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 283
    const-string v11, "text"

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v11, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 284
    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_9
    move v1, v3

    .line 286
    :goto_5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v1, v10, :cond_a

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 287
    :cond_a
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 288
    const-string v1, "role"

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v0, v1, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 289
    const-string v1, "parts"

    invoke-virtual {v0, v1, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 290
    invoke-virtual {v4, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 277
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_4

    .line 292
    :cond_b
    const-string v0, "contents"

    invoke-virtual {v5, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 293
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thinkingLevel:Ljava/lang/String;

    if-nez v0, :cond_c

    iget-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->includeThoughts:Z

    if-eqz v0, :cond_f

    .line 294
    :cond_c
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 295
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thinkingLevel:Ljava/lang/String;

    if-eqz v1, :cond_d

    const-string v1, "thinkingLevel"

    iget-object v2, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thinkingLevel:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 296
    :cond_d
    iget-boolean v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->includeThoughts:Z

    if-eqz v1, :cond_e

    const-string v1, "includeThoughts"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 297
    :cond_e
    const-string v1, "generationConfig"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "thinkingConfig"

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v5, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 299
    :cond_f
    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_10
    move v1, v0

    goto/16 :goto_3

    :cond_11
    move-object v2, v0

    goto/16 :goto_2

    :cond_12
    move-object v4, v0

    goto/16 :goto_1
.end method

.method private fail(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 222
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    .line 223
    return-object p1
.end method

.method private feedEvent(Lcom/gemini/chat/ReplyParser;Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 488
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 489
    const-string v1, "error"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 490
    if-eqz v1, :cond_1

    .line 491
    const-string v0, "code"

    const/16 v2, 0x1f4

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    .line 492
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ": "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "message"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->streamError:Ljava/lang/String;

    .line 510
    :cond_0
    :goto_0
    return-void

    .line 496
    :cond_1
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->partialLock:Ljava/lang/Object;

    monitor-enter v1

    .line 497
    :try_start_0
    invoke-virtual {p1, v0}, Lcom/gemini/chat/ReplyParser;->feed(Lorg/json/JSONObject;)V

    .line 498
    iget-object v0, p1, Lcom/gemini/chat/ReplyParser;->text:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    iget-object v2, p1, Lcom/gemini/chat/ReplyParser;->thoughts:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    add-int/2addr v0, v2

    .line 499
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 500
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 501
    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastProgress:J

    sub-long v4, v2, v4

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->streamIntervalMs(I)J

    move-result-wide v0

    cmp-long v0, v4, v0

    if-ltz v0, :cond_0

    .line 502
    iput-wide v2, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastProgress:J

    .line 504
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->partialLock:Ljava/lang/Object;

    monitor-enter v1

    .line 505
    :try_start_1
    iget-object v0, p1, Lcom/gemini/chat/ReplyParser;->thoughts:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 506
    iget-object v2, p1, Lcom/gemini/chat/ReplyParser;->text:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 507
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 508
    new-array v1, v7, [Ljava/lang/Object;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    aput-object v0, v3, v6

    aput-object v2, v3, v7

    aput-object v3, v1, v6

    invoke-virtual {p0, v1}, Lcom/gemini/chat/ChatActivity$GeminiTask;->publishProgress([Ljava/lang/Object;)V

    goto :goto_0

    .line 499
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 507
    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method private finish(Lcom/gemini/chat/ReplyParser;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 323
    invoke-virtual {p1}, Lcom/gemini/chat/ReplyParser;->error()Ljava/lang/String;

    move-result-object v0

    .line 324
    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->fail(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 326
    :goto_0
    return-object v0

    .line 325
    :cond_0
    iget-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->includeThoughts:Z

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/gemini/chat/ReplyParser;->thoughtsForDisplay()Ljava/lang/String;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thoughts:Ljava/lang/String;

    .line 326
    invoke-virtual {p1}, Lcom/gemini/chat/ReplyParser;->answer()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 325
    :cond_1
    const-string v0, ""

    goto :goto_1
.end method

.method private parseError(ILjava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 303
    .line 305
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "error"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 306
    if-eqz v0, :cond_0

    .line 307
    const-string v1, "message"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 308
    invoke-virtual {v0}, Ljava/lang/String;->length()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-eqz v1, :cond_0

    move-object p2, v0

    .line 312
    :cond_0
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->fail(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 310
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private parseResponse(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 317
    new-instance v0, Lcom/gemini/chat/ReplyParser;

    invoke-direct {v0}, Lcom/gemini/chat/ReplyParser;-><init>()V

    .line 318
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/gemini/chat/ReplyParser;->feed(Lorg/json/JSONObject;)V

    .line 319
    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->finish(Lcom/gemini/chat/ReplyParser;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v0, 0x0

    const/4 v3, 0x5

    const/4 v1, 0x0

    .line 420
    iput v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    .line 421
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastRetryAfter:Ljava/lang/String;

    .line 422
    const/4 v2, 0x0

    .line 424
    :try_start_0
    new-instance v0, Ljava/net/URL;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "https://generativelanguage.googleapis.com/v1beta/models/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":streamGenerateContent?alt=sse"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 425
    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    .line 426
    const/16 v4, 0x4e20

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 427
    const v4, 0x2bf20

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 428
    const-string v4, "POST"

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 429
    const-string v4, "Content-Type"

    const-string v5, "application/json; charset=utf-8"

    invoke-virtual {v0, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 430
    const-string v4, "x-goog-api-key"

    invoke-virtual {v0, v4, p1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 431
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 432
    const-string v4, "UTF-8"

    invoke-virtual {p3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    .line 433
    array-length v5, v4

    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 434
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    move-result-object v5

    .line 436
    :try_start_1
    invoke-virtual {v5, v4}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 438
    :try_start_2
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 440
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    .line 441
    iput v4, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    .line 442
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->isCancelled()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    move-result v5

    if-eqz v5, :cond_2

    .line 473
    if-eqz v1, :cond_0

    .line 475
    :try_start_3
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 479
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 480
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    move-object v0, v1

    .line 471
    :goto_1
    return-object v0

    .line 438
    :catchall_0
    move-exception v0

    :try_start_4
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 439
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 468
    :catch_0
    move-exception v0

    move-object v2, v1

    .line 469
    :goto_2
    :try_start_5
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->isCancelled()Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-result v3

    if-eqz v3, :cond_13

    .line 473
    if-eqz v2, :cond_1

    .line 475
    :try_start_6
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_8

    .line 479
    :cond_1
    :goto_3
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 480
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    move-object v0, v1

    .line 469
    goto :goto_1

    .line 443
    :cond_2
    const/16 v5, 0xc8

    if-lt v4, v5, :cond_3

    const/16 v5, 0x12c

    if-lt v4, v5, :cond_5

    .line 444
    :cond_3
    :try_start_7
    const-string v3, "Retry-After"

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastRetryAfter:Ljava/lang/String;

    .line 445
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->readAll(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v4, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->parseError(ILjava/lang/String;)Ljava/lang/String;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    move-result-object v0

    .line 473
    if-eqz v1, :cond_4

    .line 475
    :try_start_8
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    .line 479
    :cond_4
    :goto_4
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 480
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    goto :goto_1

    .line 447
    :cond_5
    :try_start_9
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    const-string v5, "UTF-8"

    invoke-direct {v4, v0, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    const/16 v0, 0x2000

    invoke-direct {v2, v4, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 448
    :try_start_a
    new-instance v4, Lcom/gemini/chat/ReplyParser;

    invoke-direct {v4}, Lcom/gemini/chat/ReplyParser;-><init>()V

    .line 449
    iget-object v5, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->partialLock:Ljava/lang/Object;

    monitor-enter v5
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 450
    :try_start_b
    iput-object v4, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->activeParser:Lcom/gemini/chat/ReplyParser;

    .line 451
    monitor-exit v5
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 452
    :try_start_c
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 454
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->streamError:Ljava/lang/String;

    .line 455
    :cond_6
    :goto_5
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_c

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->streamError:Ljava/lang/String;

    if-nez v0, :cond_c

    .line 456
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->isCancelled()Z
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    move-result v0

    if-eqz v0, :cond_8

    .line 473
    if-eqz v2, :cond_7

    .line 475
    :try_start_d
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_4

    .line 479
    :cond_7
    :goto_6
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 480
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    move-object v0, v1

    .line 456
    goto/16 :goto_1

    .line 451
    :catchall_1
    move-exception v0

    :try_start_e
    monitor-exit v5
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    :try_start_f
    throw v0

    .line 468
    :catch_1
    move-exception v0

    goto :goto_2

    .line 457
    :cond_8
    const-string v0, "data:"

    invoke-virtual {v6, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 458
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v3, :cond_a

    const/4 v0, 0x5

    invoke-virtual {v6, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v7, 0x20

    if-ne v0, v7, :cond_a

    const/4 v0, 0x6

    :goto_7
    invoke-virtual {v6, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_1
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    goto :goto_5

    .line 473
    :catchall_2
    move-exception v0

    :goto_8
    if-eqz v2, :cond_9

    .line 475
    :try_start_10
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_a

    .line 479
    :cond_9
    :goto_9
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 480
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    .line 481
    throw v0

    :cond_a
    move v0, v3

    .line 458
    goto :goto_7

    .line 459
    :cond_b
    :try_start_11
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-lez v0, :cond_6

    .line 460
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v4, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->feedEvent(Lcom/gemini/chat/ReplyParser;Ljava/lang/String;)V

    .line 461
    const/4 v0, 0x0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_5

    .line 464
    :cond_c
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-lez v0, :cond_d

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->streamError:Ljava/lang/String;

    if-nez v0, :cond_d

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v4, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->feedEvent(Lcom/gemini/chat/ReplyParser;Ljava/lang/String;)V

    .line 465
    :cond_d
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->isCancelled()Z
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_1
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    move-result v0

    if-eqz v0, :cond_f

    .line 473
    if-eqz v2, :cond_e

    .line 475
    :try_start_12
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_5

    .line 479
    :cond_e
    :goto_a
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 480
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    move-object v0, v1

    .line 465
    goto/16 :goto_1

    .line 466
    :cond_f
    :try_start_13
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->streamError:Ljava/lang/String;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->streamError:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->fail(Ljava/lang/String;)Ljava/lang/String;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_1
    .catchall {:try_start_13 .. :try_end_13} :catchall_2

    move-result-object v0

    .line 473
    if-eqz v2, :cond_10

    .line 475
    :try_start_14
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_6

    .line 479
    :cond_10
    :goto_b
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 480
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    goto/16 :goto_1

    .line 467
    :cond_11
    :try_start_15
    invoke-direct {p0, v4}, Lcom/gemini/chat/ChatActivity$GeminiTask;->finish(Lcom/gemini/chat/ReplyParser;)Ljava/lang/String;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_1
    .catchall {:try_start_15 .. :try_end_15} :catchall_2

    move-result-object v0

    .line 473
    if-eqz v2, :cond_12

    .line 475
    :try_start_16
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_7

    .line 479
    :cond_12
    :goto_c
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 480
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    goto/16 :goto_1

    .line 470
    :cond_13
    :try_start_17
    const-string v3, "Gemini"

    const-string v4, "Request failed"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 471
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->fail(Ljava/lang/String;)Ljava/lang/String;
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_2

    move-result-object v0

    .line 473
    if-eqz v2, :cond_14

    .line 475
    :try_start_18
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_9

    .line 479
    :cond_14
    :goto_d
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 480
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    goto/16 :goto_1

    .line 476
    :catch_2
    move-exception v0

    goto/16 :goto_0

    :catch_3
    move-exception v2

    goto/16 :goto_4

    :catch_4
    move-exception v0

    goto/16 :goto_6

    :catch_5
    move-exception v0

    goto :goto_a

    :catch_6
    move-exception v2

    goto :goto_b

    :catch_7
    move-exception v2

    goto :goto_c

    :catch_8
    move-exception v0

    goto/16 :goto_3

    :catch_9
    move-exception v2

    goto :goto_d

    :catch_a
    move-exception v2

    goto/16 :goto_9

    .line 473
    :catchall_3
    move-exception v0

    move-object v2, v1

    goto/16 :goto_8
.end method


# virtual methods
.method disconnect()V
    .locals 1

    .prologue
    .line 330
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    .line 331
    if-eqz v0, :cond_0

    .line 333
    :try_start_0
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 337
    :cond_0
    :goto_0
    return-void

    .line 334
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method disconnectAsync()V
    .locals 3

    .prologue
    .line 341
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    .line 342
    if-nez v0, :cond_0

    .line 353
    :goto_0
    return-void

    .line 343
    :cond_0
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/gemini/chat/ChatActivity$GeminiTask$1;

    invoke-direct {v2, p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask$1;-><init>(Lcom/gemini/chat/ChatActivity$GeminiTask;Ljava/net/HttpURLConnection;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 351
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 352
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 200
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/gemini/chat/ChatActivity$GeminiTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 13

    .prologue
    .line 366
    const/4 v0, 0x0

    aget-object v0, p1, v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 367
    const/4 v0, 0x1

    aget-object v5, p1, v0

    .line 368
    iput-object v5, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->usedModel:Ljava/lang/String;

    .line 369
    array-length v0, p1

    const/4 v1, 0x3

    if-le v0, v1, :cond_1

    const/4 v0, 0x3

    aget-object v0, p1, v0

    :goto_0
    invoke-static {v5, v0}, Lcom/gemini/chat/ReplyParser;->levelFor(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thinkingLevel:Ljava/lang/String;

    .line 370
    array-length v0, p1

    const/4 v1, 0x4

    if-le v0, v1, :cond_2

    const-string v0, "1"

    const/4 v1, 0x4

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->includeThoughts:Z

    .line 373
    :try_start_0
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    array-length v0, p1

    const/4 v2, 0x2

    if-le v0, v2, :cond_3

    const/4 v0, 0x2

    aget-object v0, p1, v0

    :goto_2
    invoke-static {v1, v0}, Lcom/gemini/chat/TimeGrounding;->apply(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->buildBody(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 379
    const/4 v2, 0x2

    .line 380
    const/4 v0, 0x0

    move v3, v0

    .line 381
    :goto_3
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x0

    .line 415
    :cond_0
    :goto_4
    return-object v0

    .line 369
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 370
    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    .line 373
    :cond_3
    :try_start_1
    const-string v0, ""
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 374
    :catch_0
    move-exception v0

    .line 375
    const-string v1, "Gemini"

    const-string v2, "buildBody failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 376
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->fail(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 382
    :cond_4
    if-lez v3, :cond_6

    .line 383
    iget-object v6, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->partialLock:Ljava/lang/Object;

    monitor-enter v6

    .line 384
    const/4 v0, 0x0

    :try_start_2
    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->activeParser:Lcom/gemini/chat/ReplyParser;

    .line 385
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 386
    iget v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    iget-object v6, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastRetryAfter:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    invoke-static {v3, v0, v6, v8, v9}, Lcom/gemini/chat/ChatActivity;->retryDelayMs(IILjava/lang/String;J)J

    move-result-wide v6

    .line 387
    const-wide/16 v8, 0x1f4

    add-long/2addr v8, v6

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    long-to-int v0, v8

    .line 388
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const/4 v10, 0x4

    new-array v10, v10, [I

    const/4 v11, 0x0

    aput v3, v10, v11

    const/4 v11, 0x1

    aput v2, v10, v11

    const/4 v11, 0x2

    iget v12, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    aput v12, v10, v11

    const/4 v11, 0x3

    aput v0, v10, v11

    aput-object v10, v8, v9

    invoke-virtual {p0, v8}, Lcom/gemini/chat/ChatActivity$GeminiTask;->publishProgress([Ljava/lang/Object;)V

    .line 390
    :try_start_3
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1

    .line 394
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x0

    goto :goto_4

    .line 385
    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0

    .line 391
    :catch_1
    move-exception v0

    .line 392
    const/4 v0, 0x0

    goto :goto_4

    .line 395
    :cond_5
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    .line 396
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, ""

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string v9, ""

    aput-object v9, v7, v8

    aput-object v7, v0, v6

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->publishProgress([Ljava/lang/Object;)V

    .line 398
    :cond_6
    invoke-direct {p0, v4, v5, v1}, Lcom/gemini/chat/ChatActivity$GeminiTask;->request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 399
    iget-boolean v6, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    if-eqz v6, :cond_7

    iget v6, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    const/16 v7, 0x190

    if-ne v6, v7, :cond_7

    iget-object v6, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thinkingLevel:Ljava/lang/String;

    if-eqz v6, :cond_7

    if-eqz v0, :cond_7

    .line 400
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, "thinking"

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-ltz v6, :cond_7

    .line 402
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thinkingLevel:Ljava/lang/String;

    .line 403
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    .line 405
    :try_start_5
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    array-length v0, p1

    const/4 v6, 0x2

    if-le v0, v6, :cond_a

    const/4 v0, 0x2

    aget-object v0, p1, v0

    :goto_5
    invoke-static {v1, v0}, Lcom/gemini/chat/TimeGrounding;->apply(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->buildBody(Ljava/lang/String;)Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    move-result-object v1

    .line 409
    invoke-direct {p0, v4, v5, v1}, Lcom/gemini/chat/ChatActivity$GeminiTask;->request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 411
    :cond_7
    iget-boolean v6, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    if-eqz v6, :cond_8

    iget v6, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    invoke-static {v6, v0}, Lcom/gemini/chat/ChatActivity;->maxRetriesFor(ILjava/lang/String;)I

    move-result v6

    invoke-static {v2, v6}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 412
    :cond_8
    iget-boolean v6, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    if-eqz v6, :cond_9

    iget v6, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    invoke-static {v6}, Lcom/gemini/chat/ChatActivity;->retryable(I)Z

    move-result v6

    if-eqz v6, :cond_9

    if-lt v3, v2, :cond_b

    .line 414
    :cond_9
    iget-boolean v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    invoke-static {v1, v0}, Lcom/gemini/chat/ChatActivity;->friendlyError(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_4

    .line 405
    :cond_a
    :try_start_6
    const-string v0, ""
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_5

    .line 406
    :catch_2
    move-exception v0

    .line 407
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->fail(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_4

    .line 380
    :cond_b
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto/16 :goto_3
.end method

.method protected onCancelled()V
    .locals 2

    .prologue
    .line 535
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$500(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ChatActivity$GeminiTask;

    move-result-object v0

    if-ne v0, p0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$502(Lcom/gemini/chat/ChatActivity;Lcom/gemini/chat/ChatActivity$GeminiTask;)Lcom/gemini/chat/ChatActivity$GeminiTask;

    .line 536
    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 200
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/gemini/chat/ChatActivity$GeminiTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v4, 0x0

    .line 540
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-virtual {v0}, Lcom/gemini/chat/ChatActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 554
    :cond_0
    :goto_0
    return-void

    .line 541
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0, v4}, Lcom/gemini/chat/ChatActivity;->access$502(Lcom/gemini/chat/ChatActivity;Lcom/gemini/chat/ChatActivity$GeminiTask;)Lcom/gemini/chat/ChatActivity$GeminiTask;

    .line 542
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$600(Lcom/gemini/chat/ChatActivity;)V

    .line 543
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$300(Lcom/gemini/chat/ChatActivity;Z)V

    .line 544
    if-eqz p1, :cond_0

    .line 545
    iget-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    if-eqz v0, :cond_2

    .line 546
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    const-wide/16 v1, -0x1

    const-string v3, "system"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    move-object v5, p1

    move-object v8, v4

    invoke-static/range {v0 .. v9}, Lcom/gemini/chat/ChatActivity;->access$800(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Z)V

    .line 551
    :goto_1
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    .line 552
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$900(Lcom/gemini/chat/ChatActivity;)V

    .line 553
    iget-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$1000(Lcom/gemini/chat/ChatActivity;)V

    goto :goto_0

    .line 548
    :cond_2
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$200(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/DatabaseHelper;

    move-result-object v1

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->currentChatId:J

    const-string v4, "model"

    iget-object v6, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->usedModel:Ljava/lang/String;

    iget-object v7, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thoughts:Ljava/lang/String;

    move-object v5, p1

    invoke-virtual/range {v1 .. v7}, Lcom/gemini/chat/DatabaseHelper;->addMessage(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v1

    .line 549
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    const-string v3, "model"

    iget-object v4, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->usedModel:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-object v8, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thoughts:Ljava/lang/String;

    move-object v5, p1

    invoke-static/range {v0 .. v9}, Lcom/gemini/chat/ChatActivity;->access$800(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Z)V

    goto :goto_1
.end method

.method protected onPreExecute()V
    .locals 4

    .prologue
    .line 514
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$300(Lcom/gemini/chat/ChatActivity;Z)V

    .line 515
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->usedModel:Ljava/lang/String;

    const-string v2, ""

    const-string v3, ""

    invoke-static {v0, v1, v2, v3}, Lcom/gemini/chat/ChatActivity;->access$400(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 516
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Object;)V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 520
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$500(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ChatActivity$GeminiTask;

    move-result-object v0

    if-eq v0, p0, :cond_0

    .line 531
    :goto_0
    return-void

    .line 521
    :cond_0
    aget-object v0, p1, v4

    instance-of v0, v0, [I

    if-eqz v0, :cond_1

    .line 522
    aget-object v0, p1, v4

    check-cast v0, [I

    .line 523
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v1}, Lcom/gemini/chat/ChatActivity;->access$600(Lcom/gemini/chat/ChatActivity;)V

    .line 524
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v1}, Lcom/gemini/chat/ChatActivity;->access$700(Lcom/gemini/chat/ChatActivity;)Landroid/widget/EditText;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Model is busy ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x2

    aget v3, v0, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "), retry "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget v3, v0, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget v3, v0, v5

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x3

    aget v0, v0, v3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "s..."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 527
    :cond_1
    aget-object v0, p1, v4

    check-cast v0, [Ljava/lang/String;

    .line 528
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v1}, Lcom/gemini/chat/ChatActivity;->access$700(Lcom/gemini/chat/ChatActivity;)Landroid/widget/EditText;

    move-result-object v1

    const-string v2, "Model is generating..."

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 529
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-object v2, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->usedModel:Ljava/lang/String;

    aget-object v3, v0, v4

    aget-object v0, v0, v5

    invoke-static {v1, v2, v3, v0}, Lcom/gemini/chat/ChatActivity;->access$400(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method snapshotPartial()[Ljava/lang/String;
    .locals 4

    .prologue
    .line 357
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->partialLock:Ljava/lang/Object;

    monitor-enter v1

    .line 358
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->activeParser:Lcom/gemini/chat/ReplyParser;

    if-nez v0, :cond_0

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, ""

    aput-object v3, v0, v2

    const/4 v2, 0x1

    const-string v3, ""

    aput-object v3, v0, v2

    monitor-exit v1

    .line 359
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->activeParser:Lcom/gemini/chat/ReplyParser;

    iget-object v3, v3, Lcom/gemini/chat/ReplyParser;->text:Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->activeParser:Lcom/gemini/chat/ReplyParser;

    iget-object v3, v3, Lcom/gemini/chat/ReplyParser;->thoughts:Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    monitor-exit v1

    goto :goto_0

    .line 360
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
