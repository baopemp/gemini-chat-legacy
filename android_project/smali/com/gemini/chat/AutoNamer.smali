.class final Lcom/gemini/chat/AutoNamer;
.super Landroid/os/AsyncTask;
.source "AutoNamer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gemini/chat/AutoNamer$Callback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field private static final RUNNING:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final cb:Lcom/gemini/chat/AutoNamer$Callback;

.field private final chatId:J

.field private final db:Lcom/gemini/chat/DatabaseHelper;

.field private final key:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lcom/gemini/chat/AutoNamer;->RUNNING:Ljava/util/Vector;

    return-void
.end method

.method private constructor <init>(Lcom/gemini/chat/DatabaseHelper;JLjava/lang/String;Lcom/gemini/chat/AutoNamer$Callback;)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/gemini/chat/AutoNamer;->db:Lcom/gemini/chat/DatabaseHelper;

    .line 34
    iput-wide p2, p0, Lcom/gemini/chat/AutoNamer;->chatId:J

    .line 35
    iput-object p4, p0, Lcom/gemini/chat/AutoNamer;->key:Ljava/lang/String;

    .line 36
    iput-object p5, p0, Lcom/gemini/chat/AutoNamer;->cb:Lcom/gemini/chat/AutoNamer$Callback;

    .line 37
    return-void
.end method

.method static maybeStart(Landroid/content/Context;Lcom/gemini/chat/DatabaseHelper;JLcom/gemini/chat/AutoNamer$Callback;)V
    .locals 8

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 41
    const-wide/16 v0, -0x1

    cmp-long v0, p2, v0

    if-nez v0, :cond_1

    .line 55
    :cond_0
    :goto_0
    return-void

    .line 42
    :cond_1
    const-string v0, "GeminiPrefs"

    invoke-virtual {p0, v0, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 43
    const-string v1, "api_key"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 44
    const-string v1, "auto_name"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 46
    sget-object v1, Lcom/gemini/chat/AutoNamer;->RUNNING:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 48
    :try_start_0
    invoke-virtual {p1, p2, p3}, Lcom/gemini/chat/DatabaseHelper;->needsName(J)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 49
    invoke-virtual {p1, p2, p3}, Lcom/gemini/chat/DatabaseHelper;->firstExchange(J)[Ljava/lang/String;

    move-result-object v6

    .line 50
    if-eqz v6, :cond_0

    .line 51
    sget-object v1, Lcom/gemini/chat/AutoNamer;->RUNNING:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 52
    new-instance v0, Lcom/gemini/chat/AutoNamer;

    move-object v1, p1

    move-wide v2, p2

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/gemini/chat/AutoNamer;-><init>(Lcom/gemini/chat/DatabaseHelper;JLjava/lang/String;Lcom/gemini/chat/AutoNamer$Callback;)V

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aget-object v3, v6, v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x1

    aget-object v3, v6, v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/gemini/chat/AutoNamer;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 53
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 19
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/gemini/chat/AutoNamer;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 59
    .line 61
    const/4 v0, 0x0

    :try_start_0
    aget-object v0, p1, v0

    const/4 v2, 0x1

    aget-object v2, p1, v2

    invoke-static {v0, v2}, Lcom/gemini/chat/ChatActivity;->titleRequest(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "UTF-8"

    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 62
    new-instance v0, Ljava/net/URL;

    const-string v3, "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.5-flash-lite:generateContent"

    invoke-direct {v0, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 63
    const/16 v3, 0x7530

    :try_start_1
    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 64
    const v3, 0xea60

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 65
    const-string v3, "POST"

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 66
    const-string v3, "Content-Type"

    const-string v4, "application/json; charset=utf-8"

    invoke-virtual {v0, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    const-string v3, "x-goog-api-key"

    iget-object v4, p0, Lcom/gemini/chat/AutoNamer;->key:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 69
    array-length v3, v2

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 70
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-result-object v3

    .line 72
    :try_start_2
    invoke-virtual {v3, v2}, Ljava/io/OutputStream;->write([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 74
    :try_start_3
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 76
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-result v2

    const/16 v3, 0xc8

    if-eq v2, v3, :cond_2

    .line 83
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_0
    move-object v0, v1

    .line 81
    :goto_0
    return-object v0

    .line 74
    :catchall_0
    move-exception v2

    :try_start_4
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 75
    throw v2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 80
    :catch_0
    move-exception v2

    .line 83
    :goto_1
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_1
    move-object v0, v1

    .line 81
    goto :goto_0

    .line 77
    :cond_2
    :try_start_5
    new-instance v2, Lcom/gemini/chat/ReplyParser;

    invoke-direct {v2}, Lcom/gemini/chat/ReplyParser;-><init>()V

    .line 78
    new-instance v3, Lorg/json/JSONObject;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-static {v4}, Lcom/gemini/chat/ChatActivity;->readAll(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/gemini/chat/ReplyParser;->feed(Lorg/json/JSONObject;)V

    .line 79
    iget-object v2, v2, Lcom/gemini/chat/ReplyParser;->text:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/gemini/chat/ChatActivity;->cleanTitle(Ljava/lang/String;)Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-result-object v1

    .line 83
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_3
    move-object v0, v1

    .line 79
    goto :goto_0

    .line 83
    :catchall_1
    move-exception v0

    move-object v2, v0

    move-object v3, v1

    :goto_2
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 84
    :cond_4
    throw v2

    .line 83
    :catchall_2
    move-exception v1

    move-object v2, v1

    move-object v3, v0

    goto :goto_2

    .line 80
    :catch_1
    move-exception v0

    move-object v0, v1

    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 19
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/gemini/chat/AutoNamer;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 89
    sget-object v0, Lcom/gemini/chat/AutoNamer;->RUNNING:Ljava/util/Vector;

    iget-wide v2, p0, Lcom/gemini/chat/AutoNamer;->chatId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 90
    if-nez p1, :cond_1

    .line 98
    :cond_0
    :goto_0
    return-void

    .line 92
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/AutoNamer;->db:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/AutoNamer;->chatId:J

    invoke-virtual {v0, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->needsName(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/gemini/chat/AutoNamer;->db:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/AutoNamer;->chatId:J

    invoke-virtual {v0, v2, v3, p1}, Lcom/gemini/chat/DatabaseHelper;->setAutoTitle(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    iget-object v0, p0, Lcom/gemini/chat/AutoNamer;->cb:Lcom/gemini/chat/AutoNamer$Callback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/AutoNamer;->cb:Lcom/gemini/chat/AutoNamer$Callback;

    iget-wide v2, p0, Lcom/gemini/chat/AutoNamer;->chatId:J

    invoke-interface {v0, v2, v3, p1}, Lcom/gemini/chat/AutoNamer$Callback;->onNamed(JLjava/lang/String;)V

    goto :goto_0

    .line 94
    :catch_0
    move-exception v0

    goto :goto_0
.end method
