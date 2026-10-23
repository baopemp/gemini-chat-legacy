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


# static fields
.field private static final MAX_RETRIES:I = 0x2


# instance fields
.field private conn:Ljava/net/HttpURLConnection;

.field private currentChatId:J

.field private failed:Z

.field private includeThoughts:Z

.field private lastCode:I

.field private lastProgress:J

.field volatile partialText:Ljava/lang/String;

.field volatile partialThoughts:Ljava/lang/String;

.field private streamError:Ljava/lang/String;

.field private thinkingLevel:Ljava/lang/String;

.field final synthetic this$0:Lcom/gemini/chat/ChatActivity;

.field private thoughts:Ljava/lang/String;

.field private usedModel:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatActivity;J)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 135
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 124
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->usedModel:Ljava/lang/String;

    .line 125
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    .line 126
    iput-boolean v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    .line 127
    iput v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    .line 132
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thoughts:Ljava/lang/String;

    .line 363
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->partialText:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->partialThoughts:Ljava/lang/String;

    .line 136
    iput-wide p2, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->currentChatId:J

    .line 137
    return-void
.end method

.method static synthetic access$1400(Lcom/gemini/chat/ChatActivity$GeminiTask;)Z
    .locals 1

    .prologue
    .line 120
    iget-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->includeThoughts:Z

    return v0
.end method

.method static synthetic access$1500(Lcom/gemini/chat/ChatActivity$GeminiTask;)J
    .locals 2

    .prologue
    .line 120
    iget-wide v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->currentChatId:J

    return-wide v0
.end method

.method static synthetic access$1600(Lcom/gemini/chat/ChatActivity$GeminiTask;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
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

    .line 146
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 147
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 148
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 149
    const-string v1, "text"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 150
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 151
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 152
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 153
    const-string v2, "parts"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 154
    const-string v1, "systemInstruction"

    invoke-virtual {v5, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 156
    :cond_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 157
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 158
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 159
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$000(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/DatabaseHelper;

    move-result-object v0

    iget-wide v10, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->currentChatId:J

    invoke-virtual {v0, v10, v11}, Lcom/gemini/chat/DatabaseHelper;->getMessages(J)Landroid/database/Cursor;

    move-result-object v9

    .line 160
    if-eqz v9, :cond_7

    .line 162
    :try_start_0
    const-string v0, "role"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v10

    .line 163
    const-string v0, "content"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    .line 164
    const-string v0, "model"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v12

    .line 165
    :cond_1
    :goto_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 166
    invoke-interface {v9, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 167
    const-string v0, "user"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 168
    if-nez v2, :cond_2

    const-string v0, "model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 169
    :cond_2
    invoke-interface {v9, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 170
    if-nez v0, :cond_12

    const-string v0, ""

    move-object v4, v0

    .line 171
    :goto_1
    const/4 v0, 0x0

    .line 172
    if-eqz v2, :cond_11

    if-ltz v12, :cond_11

    .line 173
    invoke-interface {v9, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 174
    if-eqz v2, :cond_11

    const-string v13, "data:image/"

    invoke-virtual {v2, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_11

    invoke-static {v2}, Lcom/gemini/chat/ChatActivity;->toInlineData(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    move-object v2, v0

    .line 176
    :goto_2
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 177
    if-ltz v0, :cond_3

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_10

    .line 178
    :cond_3
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 180
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    add-int/lit8 v0, v0, 0x1

    move v1, v0

    .line 183
    :goto_3
    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/StringBuffer;

    .line 184
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v13

    if-lez v13, :cond_5

    .line 185
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v13

    if-lez v13, :cond_4

    const-string v13, "\n\n"

    invoke-virtual {v0, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 186
    :cond_4
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 188
    :cond_5
    if-eqz v2, :cond_1

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_0

    .line 191
    :catchall_0
    move-exception v0

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 192
    throw v0

    .line 191
    :cond_6
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 194
    :cond_7
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    move v2, v3

    .line 195
    :goto_4
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v2, v0, :cond_b

    .line 196
    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    .line 197
    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 199
    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-gtz v1, :cond_8

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 200
    :cond_8
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 201
    const-string v11, "text"

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v11, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 202
    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_9
    move v1, v3

    .line 204
    :goto_5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v1, v10, :cond_a

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 205
    :cond_a
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 206
    const-string v1, "role"

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v0, v1, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 207
    const-string v1, "parts"

    invoke-virtual {v0, v1, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 208
    invoke-virtual {v4, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 195
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_4

    .line 210
    :cond_b
    const-string v0, "contents"

    invoke-virtual {v5, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 211
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thinkingLevel:Ljava/lang/String;

    if-nez v0, :cond_c

    iget-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->includeThoughts:Z

    if-eqz v0, :cond_f

    .line 212
    :cond_c
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 213
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thinkingLevel:Ljava/lang/String;

    if-eqz v1, :cond_d

    const-string v1, "thinkingLevel"

    iget-object v2, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thinkingLevel:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 214
    :cond_d
    iget-boolean v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->includeThoughts:Z

    if-eqz v1, :cond_e

    const-string v1, "includeThoughts"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 215
    :cond_e
    const-string v1, "generationConfig"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "thinkingConfig"

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v5, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 217
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
    .line 140
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    .line 141
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

    .line 369
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 370
    const-string v1, "error"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 371
    if-eqz v1, :cond_1

    .line 372
    const-string v0, "code"

    const/16 v2, 0x1f4

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    .line 373
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

    .line 384
    :cond_0
    :goto_0
    return-void

    .line 376
    :cond_1
    invoke-virtual {p1, v0}, Lcom/gemini/chat/ReplyParser;->feed(Lorg/json/JSONObject;)V

    .line 377
    iget-object v0, p1, Lcom/gemini/chat/ReplyParser;->text:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->partialText:Ljava/lang/String;

    .line 378
    iget-object v0, p1, Lcom/gemini/chat/ReplyParser;->thoughts:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->partialThoughts:Ljava/lang/String;

    .line 379
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 380
    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastProgress:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0xfa

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    .line 381
    iput-wide v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastProgress:J

    .line 382
    new-array v0, v7, [Ljava/lang/Object;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    iget-object v2, p1, Lcom/gemini/chat/ReplyParser;->thoughts:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v6

    iget-object v2, p1, Lcom/gemini/chat/ReplyParser;->text:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v7

    aput-object v1, v0, v6

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->publishProgress([Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private finish(Lcom/gemini/chat/ReplyParser;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 241
    invoke-virtual {p1}, Lcom/gemini/chat/ReplyParser;->error()Ljava/lang/String;

    move-result-object v0

    .line 242
    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->fail(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 244
    :goto_0
    return-object v0

    .line 243
    :cond_0
    iget-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->includeThoughts:Z

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/gemini/chat/ReplyParser;->thoughtsForDisplay()Ljava/lang/String;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thoughts:Ljava/lang/String;

    .line 244
    invoke-virtual {p1}, Lcom/gemini/chat/ReplyParser;->answer()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 243
    :cond_1
    const-string v0, ""

    goto :goto_1
.end method

.method private parseError(ILjava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 221
    .line 223
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "error"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 224
    if-eqz v0, :cond_0

    .line 225
    const-string v1, "message"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 226
    invoke-virtual {v0}, Ljava/lang/String;->length()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-eqz v1, :cond_0

    move-object p2, v0

    .line 230
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

    .line 228
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
    .line 235
    new-instance v0, Lcom/gemini/chat/ReplyParser;

    invoke-direct {v0}, Lcom/gemini/chat/ReplyParser;-><init>()V

    .line 236
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/gemini/chat/ReplyParser;->feed(Lorg/json/JSONObject;)V

    .line 237
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

    .line 305
    iput v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    .line 306
    const/4 v2, 0x0

    .line 308
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

    .line 309
    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    .line 310
    const/16 v4, 0x7530

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 311
    const v4, 0x2bf20

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 312
    const-string v4, "POST"

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 313
    const-string v4, "Content-Type"

    const-string v5, "application/json; charset=utf-8"

    invoke-virtual {v0, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 314
    const-string v4, "x-goog-api-key"

    invoke-virtual {v0, v4, p1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 316
    const-string v4, "UTF-8"

    invoke-virtual {p3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    .line 317
    array-length v5, v4

    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 318
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    move-result-object v5

    .line 320
    :try_start_1
    invoke-virtual {v5, v4}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 322
    :try_start_2
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 324
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    .line 325
    iput v4, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    .line 326
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->isCancelled()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result v5

    if-eqz v5, :cond_2

    .line 351
    if-eqz v1, :cond_0

    .line 353
    :try_start_3
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 357
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 358
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    move-object v0, v1

    .line 349
    :goto_1
    return-object v0

    .line 322
    :catchall_0
    move-exception v0

    :try_start_4
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 323
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 346
    :catch_0
    move-exception v0

    move-object v2, v1

    .line 347
    :goto_2
    :try_start_5
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->isCancelled()Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-result v3

    if-eqz v3, :cond_13

    .line 351
    if-eqz v2, :cond_1

    .line 353
    :try_start_6
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_8

    .line 357
    :cond_1
    :goto_3
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 358
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    move-object v0, v1

    .line 347
    goto :goto_1

    .line 327
    :cond_2
    const/16 v5, 0xc8

    if-lt v4, v5, :cond_3

    const/16 v5, 0x12c

    if-lt v4, v5, :cond_5

    :cond_3
    :try_start_7
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->readAll(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v4, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->parseError(ILjava/lang/String;)Ljava/lang/String;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    move-result-object v0

    .line 351
    if-eqz v1, :cond_4

    .line 353
    :try_start_8
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    .line 357
    :cond_4
    :goto_4
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 358
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    goto :goto_1

    .line 328
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
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 329
    :try_start_a
    new-instance v4, Lcom/gemini/chat/ReplyParser;

    invoke-direct {v4}, Lcom/gemini/chat/ReplyParser;-><init>()V

    .line 330
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 332
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->streamError:Ljava/lang/String;

    .line 333
    :cond_6
    :goto_5
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_c

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->streamError:Ljava/lang/String;

    if-nez v0, :cond_c

    .line 334
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->isCancelled()Z
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    move-result v0

    if-eqz v0, :cond_8

    .line 351
    if-eqz v2, :cond_7

    .line 353
    :try_start_b
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_4

    .line 357
    :cond_7
    :goto_6
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 358
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    move-object v0, v1

    .line 334
    goto :goto_1

    .line 335
    :cond_8
    :try_start_c
    const-string v0, "data:"

    invoke-virtual {v6, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 336
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v3, :cond_9

    const/4 v0, 0x5

    invoke-virtual {v6, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v7, 0x20

    if-ne v0, v7, :cond_9

    const/4 v0, 0x6

    :goto_7
    invoke-virtual {v6, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5

    .line 346
    :catch_1
    move-exception v0

    goto/16 :goto_2

    :cond_9
    move v0, v3

    .line 336
    goto :goto_7

    .line 337
    :cond_a
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-lez v0, :cond_6

    .line 338
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v4, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->feedEvent(Lcom/gemini/chat/ReplyParser;Ljava/lang/String;)V

    .line 339
    const/4 v0, 0x0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->setLength(I)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    goto :goto_5

    .line 351
    :catchall_1
    move-exception v0

    :goto_8
    if-eqz v2, :cond_b

    .line 353
    :try_start_d
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_a

    .line 357
    :cond_b
    :goto_9
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 358
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    .line 359
    throw v0

    .line 342
    :cond_c
    :try_start_e
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-lez v0, :cond_d

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->streamError:Ljava/lang/String;

    if-nez v0, :cond_d

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v4, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->feedEvent(Lcom/gemini/chat/ReplyParser;Ljava/lang/String;)V

    .line 343
    :cond_d
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->isCancelled()Z
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    move-result v0

    if-eqz v0, :cond_f

    .line 351
    if-eqz v2, :cond_e

    .line 353
    :try_start_f
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_5

    .line 357
    :cond_e
    :goto_a
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 358
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    move-object v0, v1

    .line 343
    goto/16 :goto_1

    .line 344
    :cond_f
    :try_start_10
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->streamError:Ljava/lang/String;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->streamError:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->fail(Ljava/lang/String;)Ljava/lang/String;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_1
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    move-result-object v0

    .line 351
    if-eqz v2, :cond_10

    .line 353
    :try_start_11
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_6

    .line 357
    :cond_10
    :goto_b
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 358
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    goto/16 :goto_1

    .line 345
    :cond_11
    :try_start_12
    invoke-direct {p0, v4}, Lcom/gemini/chat/ChatActivity$GeminiTask;->finish(Lcom/gemini/chat/ReplyParser;)Ljava/lang/String;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_1
    .catchall {:try_start_12 .. :try_end_12} :catchall_1

    move-result-object v0

    .line 351
    if-eqz v2, :cond_12

    .line 353
    :try_start_13
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_7

    .line 357
    :cond_12
    :goto_c
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 358
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    goto/16 :goto_1

    .line 348
    :cond_13
    :try_start_14
    const-string v3, "Gemini"

    const-string v4, "Request failed"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 349
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
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_1

    move-result-object v0

    .line 351
    if-eqz v2, :cond_14

    .line 353
    :try_start_15
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_9

    .line 357
    :cond_14
    :goto_d
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 358
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    goto/16 :goto_1

    .line 354
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

    .line 351
    :catchall_2
    move-exception v0

    move-object v2, v1

    goto/16 :goto_8
.end method


# virtual methods
.method disconnect()V
    .locals 1

    .prologue
    .line 248
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->conn:Ljava/net/HttpURLConnection;

    .line 249
    if-eqz v0, :cond_0

    .line 251
    :try_start_0
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 255
    :cond_0
    :goto_0
    return-void

    .line 252
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 120
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/gemini/chat/ChatActivity$GeminiTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 11

    .prologue
    const/4 v4, 0x3

    const/4 v2, 0x1

    const/4 v10, 0x2

    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 260
    aget-object v0, p1, v3

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 261
    aget-object v7, p1, v2

    .line 262
    iput-object v7, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->usedModel:Ljava/lang/String;

    .line 263
    array-length v0, p1

    if-le v0, v4, :cond_1

    aget-object v0, p1, v4

    :goto_0
    invoke-static {v7, v0}, Lcom/gemini/chat/ReplyParser;->levelFor(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thinkingLevel:Ljava/lang/String;

    .line 264
    array-length v0, p1

    const/4 v4, 0x4

    if-le v0, v4, :cond_2

    const-string v0, "1"

    const/4 v4, 0x4

    aget-object v4, p1, v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v2

    :goto_1
    iput-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->includeThoughts:Z

    .line 267
    :try_start_0
    iget-object v4, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    array-length v0, p1

    if-le v0, v10, :cond_3

    const/4 v0, 0x2

    aget-object v0, p1, v0

    :goto_2
    invoke-static {v4, v0}, Lcom/gemini/chat/TimeGrounding;->apply(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->buildBody(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    move v5, v3

    move-object v0, v1

    .line 273
    :goto_3
    if-gt v5, v10, :cond_7

    .line 274
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 300
    :cond_0
    :goto_4
    return-object v1

    :cond_1
    move-object v0, v1

    .line 263
    goto :goto_0

    :cond_2
    move v0, v3

    .line 264
    goto :goto_1

    .line 267
    :cond_3
    :try_start_1
    const-string v0, ""
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 268
    :catch_0
    move-exception v0

    .line 269
    const-string v1, "Gemini"

    const-string v2, "buildBody failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 270
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

    move-result-object v1

    goto :goto_4

    .line 275
    :cond_4
    if-lez v5, :cond_5

    .line 276
    new-array v0, v2, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v0, v3

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->publishProgress([Ljava/lang/Object;)V

    .line 278
    const-wide/16 v8, 0x7d0

    add-int/lit8 v0, v5, -0x1

    shl-long/2addr v8, v0

    :try_start_2
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2

    .line 282
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 283
    iput-boolean v3, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    .line 285
    :cond_5
    invoke-direct {p0, v6, v7, v4}, Lcom/gemini/chat/ChatActivity$GeminiTask;->request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 286
    iget-boolean v8, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    if-eqz v8, :cond_6

    iget v8, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    const/16 v9, 0x190

    if-ne v8, v9, :cond_6

    iget-object v8, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thinkingLevel:Ljava/lang/String;

    if-eqz v8, :cond_6

    if-eqz v0, :cond_6

    .line 287
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    const-string v9, "thinking"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-ltz v8, :cond_6

    .line 289
    iput-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thinkingLevel:Ljava/lang/String;

    .line 290
    iput-boolean v3, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    .line 292
    :try_start_3
    iget-object v4, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    array-length v0, p1

    if-le v0, v10, :cond_8

    const/4 v0, 0x2

    aget-object v0, p1, v0

    :goto_5
    invoke-static {v4, v0}, Lcom/gemini/chat/TimeGrounding;->apply(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->buildBody(Ljava/lang/String;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v4

    .line 296
    invoke-direct {p0, v6, v7, v4}, Lcom/gemini/chat/ChatActivity$GeminiTask;->request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 298
    :cond_6
    iget-boolean v8, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    if-eqz v8, :cond_7

    iget v8, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    invoke-static {v8}, Lcom/gemini/chat/ChatActivity;->retryable(I)Z

    move-result v8

    if-nez v8, :cond_9

    :cond_7
    move-object v1, v0

    .line 300
    goto/16 :goto_4

    .line 292
    :cond_8
    :try_start_4
    const-string v0, ""
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_5

    .line 293
    :catch_1
    move-exception v0

    .line 294
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

    move-result-object v1

    goto/16 :goto_4

    .line 273
    :cond_9
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_3

    .line 279
    :catch_2
    move-exception v0

    goto/16 :goto_4
.end method

.method protected onCancelled()V
    .locals 2

    .prologue
    .line 405
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$200(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ChatActivity$GeminiTask;

    move-result-object v0

    if-ne v0, p0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$202(Lcom/gemini/chat/ChatActivity;Lcom/gemini/chat/ChatActivity$GeminiTask;)Lcom/gemini/chat/ChatActivity$GeminiTask;

    .line 406
    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 120
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/gemini/chat/ChatActivity$GeminiTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 9

    .prologue
    const/4 v4, 0x0

    .line 410
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 424
    :cond_0
    :goto_0
    return-void

    .line 411
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0, v4}, Lcom/gemini/chat/ChatActivity;->access$202(Lcom/gemini/chat/ChatActivity;Lcom/gemini/chat/ChatActivity$GeminiTask;)Lcom/gemini/chat/ChatActivity$GeminiTask;

    .line 412
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$300(Lcom/gemini/chat/ChatActivity;)V

    .line 413
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$100(Lcom/gemini/chat/ChatActivity;Z)V

    .line 414
    if-eqz p1, :cond_0

    .line 415
    iget-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    if-eqz v0, :cond_2

    .line 416
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    const-wide/16 v1, -0x1

    const-string v3, "system"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    move-object v5, p1

    move-object v8, v4

    invoke-static/range {v0 .. v8}, Lcom/gemini/chat/ChatActivity;->access$600(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    .line 421
    :goto_1
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    .line 422
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$700(Lcom/gemini/chat/ChatActivity;)V

    .line 423
    iget-boolean v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->failed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$800(Lcom/gemini/chat/ChatActivity;)V

    goto :goto_0

    .line 418
    :cond_2
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$000(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/DatabaseHelper;

    move-result-object v1

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->currentChatId:J

    const-string v4, "model"

    iget-object v6, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->usedModel:Ljava/lang/String;

    iget-object v7, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thoughts:Ljava/lang/String;

    move-object v5, p1

    invoke-virtual/range {v1 .. v7}, Lcom/gemini/chat/DatabaseHelper;->addMessage(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v1

    .line 419
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    const-string v3, "model"

    iget-object v4, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->usedModel:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-object v8, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->thoughts:Ljava/lang/String;

    move-object v5, p1

    invoke-static/range {v0 .. v8}, Lcom/gemini/chat/ChatActivity;->access$600(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    goto :goto_1
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 388
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$100(Lcom/gemini/chat/ChatActivity;Z)V

    .line 389
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Object;)V
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 393
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$200(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ChatActivity$GeminiTask;

    move-result-object v0

    if-eq v0, p0, :cond_0

    .line 401
    :goto_0
    return-void

    .line 394
    :cond_0
    aget-object v0, p1, v3

    instance-of v0, v0, Ljava/lang/Integer;

    if-eqz v0, :cond_1

    .line 395
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$300(Lcom/gemini/chat/ChatActivity;)V

    .line 396
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$400(Lcom/gemini/chat/ChatActivity;)Landroid/widget/EditText;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Model is busy ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->lastCode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "), retry "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget-object v2, p1, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 398
    :cond_1
    aget-object v0, p1, v3

    check-cast v0, [Ljava/lang/String;

    .line 399
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-object v2, p0, Lcom/gemini/chat/ChatActivity$GeminiTask;->usedModel:Ljava/lang/String;

    aget-object v3, v0, v3

    const/4 v4, 0x1

    aget-object v0, v0, v4

    invoke-static {v1, v2, v3, v0}, Lcom/gemini/chat/ChatActivity;->access$500(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
