.class public final Lcom/gemini/chat/EmojiMap;
.super Ljava/lang/Object;
.source "EmojiMap.java"


# static fields
.field private static volatile map:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static maxLen:I

.field private static volatile preloadStarted:Z

.field private static startUnits:[Z


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public static convert(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .prologue
    const/16 v7, 0x3a

    const/4 v2, 0x0

    .line 134
    if-eqz p0, :cond_0

    sget-object v0, Lcom/gemini/chat/EmojiMap;->map:Ljava/util/HashMap;

    if-nez v0, :cond_1

    .line 153
    :cond_0
    :goto_0
    return-object p0

    .line 135
    :cond_1
    const/4 v0, 0x0

    .line 136
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    move v1, v2

    .line 137
    :goto_1
    if-ge v1, v3, :cond_6

    .line 138
    invoke-static {p0, v1}, Lcom/gemini/chat/EmojiMap;->matchAt(Ljava/lang/CharSequence;I)I

    move-result v4

    .line 139
    if-lez v4, :cond_3

    .line 140
    if-nez v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    add-int/lit8 v5, v3, 0x10

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v0, p0, v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 141
    :cond_2
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p0, v1, v4}, Lcom/gemini/chat/EmojiMap;->nameAt(Ljava/lang/CharSequence;II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 142
    add-int/2addr v1, v4

    goto :goto_1

    .line 144
    :cond_3
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 145
    invoke-static {v4}, Lcom/gemini/chat/EmojiMap;->isInvisible(C)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 146
    if-nez v0, :cond_4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v0, p0, v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 150
    :cond_4
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 147
    :cond_5
    if-eqz v0, :cond_4

    .line 148
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 153
    :cond_6
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static declared-synchronized ensureLoaded(Landroid/content/Context;)V
    .locals 4

    .prologue
    .line 46
    const-class v2, Lcom/gemini/chat/EmojiMap;

    monitor-enter v2

    :try_start_0
    sget-object v0, Lcom/gemini/chat/EmojiMap;->map:Ljava/util/HashMap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_1

    .line 64
    :cond_0
    :goto_0
    monitor-exit v2

    return-void

    .line 47
    :cond_1
    const/4 v0, 0x0

    .line 49
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v3, "emoji.tsv"

    invoke-virtual {v1, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 50
    invoke-static {v0}, Lcom/gemini/chat/EmojiMap;->load(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    if-eqz v0, :cond_0

    .line 59
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    .line 60
    :catch_0
    move-exception v0

    goto :goto_0

    .line 51
    :catch_1
    move-exception v1

    .line 53
    :try_start_3
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lcom/gemini/chat/EmojiMap;->map:Ljava/util/HashMap;

    .line 54
    const/high16 v1, 0x10000

    new-array v1, v1, [Z

    sput-object v1, Lcom/gemini/chat/EmojiMap;->startUnits:[Z

    .line 55
    const/4 v1, 0x0

    sput v1, Lcom/gemini/chat/EmojiMap;->maxLen:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 57
    if-eqz v0, :cond_0

    .line 59
    :try_start_4
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_0

    .line 60
    :catch_2
    move-exception v0

    goto :goto_0

    .line 57
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_2

    .line 59
    :try_start_5
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 63
    :cond_2
    :goto_1
    :try_start_6
    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 46
    :catchall_1
    move-exception v0

    monitor-exit v2

    throw v0

    .line 60
    :catch_3
    move-exception v0

    goto :goto_1
.end method

.method public static isInvisible(C)Z
    .locals 1

    .prologue
    .line 129
    const v0, 0xfe0f

    if-eq p0, v0, :cond_0

    const v0, 0xfe0e

    if-eq p0, v0, :cond_0

    const/16 v0, 0x200d

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isLoaded()Z
    .locals 1

    .prologue
    .line 91
    sget-object v0, Lcom/gemini/chat/EmojiMap;->map:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static declared-synchronized load(Ljava/io/InputStream;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 68
    const-class v1, Lcom/gemini/chat/EmojiMap;

    monitor-enter v1

    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    const-string v4, "UTF-8"

    invoke-direct {v3, p0, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    const/16 v4, 0x2000

    invoke-direct {v2, v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 70
    :try_start_1
    new-instance v3, Ljava/util/HashMap;

    const/16 v4, 0x2000

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(I)V

    .line 71
    const/high16 v4, 0x10000

    new-array v4, v4, [Z

    .line 74
    :cond_0
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 75
    const/16 v6, 0x9

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 76
    if-lez v6, :cond_0

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    if-eq v6, v7, :cond_0

    .line 77
    const/4 v7, 0x0

    invoke-virtual {v5, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 78
    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v7, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    const/4 v5, 0x0

    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/4 v6, 0x1

    aput-boolean v6, v4, v5

    .line 80
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v5

    if-le v5, v0, :cond_0

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_0

    .line 82
    :cond_1
    sput-object v4, Lcom/gemini/chat/EmojiMap;->startUnits:[Z

    .line 83
    sput v0, Lcom/gemini/chat/EmojiMap;->maxLen:I

    .line 84
    sput-object v3, Lcom/gemini/chat/EmojiMap;->map:Ljava/util/HashMap;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 88
    monitor-exit v1

    return-void

    .line 86
    :catchall_0
    move-exception v0

    :try_start_3
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 87
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 68
    :catchall_1
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static matchAt(Ljava/lang/CharSequence;I)I
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v0, 0x0

    .line 96
    sget-object v2, Lcom/gemini/chat/EmojiMap;->map:Ljava/util/HashMap;

    .line 97
    if-eqz v2, :cond_0

    sget v1, Lcom/gemini/chat/EmojiMap;->maxLen:I

    if-nez v1, :cond_1

    .line 118
    :cond_0
    :goto_0
    return v0

    .line 98
    :cond_1
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 99
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    .line 100
    const/16 v4, 0x80

    if-ge v1, v4, :cond_2

    .line 102
    add-int/lit8 v4, p1, 0x1

    if-ge v4, v3, :cond_0

    .line 103
    add-int/lit8 v4, p1, 0x1

    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    .line 104
    const v5, 0xfe0f

    if-eq v4, v5, :cond_2

    const/16 v5, 0x20e3

    if-ne v4, v5, :cond_0

    .line 106
    :cond_2
    sget-object v4, Lcom/gemini/chat/EmojiMap;->startUnits:[Z

    aget-boolean v1, v4, v1

    if-eqz v1, :cond_0

    .line 107
    sget v1, Lcom/gemini/chat/EmojiMap;->maxLen:I

    sub-int/2addr v3, p1

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 108
    instance-of v3, p0, Ljava/lang/String;

    if-eqz v3, :cond_5

    .line 109
    check-cast p0, Ljava/lang/String;

    .line 110
    :goto_1
    if-lt v1, v6, :cond_0

    .line 111
    add-int v3, p1, v1

    invoke-virtual {p0, p1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    move v0, v1

    goto :goto_0

    .line 110
    :cond_3
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 114
    :cond_4
    add-int/lit8 v1, v1, -0x1

    :cond_5
    if-lt v1, v6, :cond_0

    .line 115
    add-int v3, p1, v1

    invoke-interface {p0, p1, v3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    move v0, v1

    goto :goto_0
.end method

.method public static nameAt(Ljava/lang/CharSequence;II)Ljava/lang/String;
    .locals 2

    .prologue
    .line 122
    sget-object v1, Lcom/gemini/chat/EmojiMap;->map:Ljava/util/HashMap;

    .line 123
    if-nez v1, :cond_0

    const/4 v0, 0x0

    .line 124
    :goto_0
    return-object v0

    :cond_0
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_1

    check-cast p0, Ljava/lang/String;

    add-int v0, p1, p2

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_1
    add-int v0, p1, p2

    invoke-interface {p0, p1, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method public static preloadAsync(Landroid/content/Context;)V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 32
    sget-object v0, Lcom/gemini/chat/EmojiMap;->map:Ljava/util/HashMap;

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/gemini/chat/EmojiMap;->preloadStarted:Z

    if-nez v0, :cond_0

    if-nez p0, :cond_1

    .line 43
    :cond_0
    :goto_0
    return-void

    .line 33
    :cond_1
    sput-boolean v3, Lcom/gemini/chat/EmojiMap;->preloadStarted:Z

    .line 34
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 35
    :cond_2
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/gemini/chat/EmojiMap$1;

    invoke-direct {v1, p0}, Lcom/gemini/chat/EmojiMap$1;-><init>(Landroid/content/Context;)V

    const-string v2, "EmojiPreload"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 40
    invoke-virtual {v0, v3}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 41
    invoke-virtual {v0, v3}, Ljava/lang/Thread;->setPriority(I)V

    .line 42
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method
