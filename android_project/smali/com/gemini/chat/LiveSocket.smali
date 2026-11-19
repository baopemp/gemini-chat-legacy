.class public final Lcom/gemini/chat/LiveSocket;
.super Ljava/lang/Object;
.source "LiveSocket.java"


# static fields
.field private static final GUID:Ljava/lang/String; = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

.field private static final MAX_MESSAGE:I = 0x1000000

.field public static hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;


# instance fields
.field public volatile closeCode:I

.field public volatile closeReason:Ljava/lang/String;

.field private volatile closed:Z

.field private in:Ljava/io/InputStream;

.field private out:Ljava/io/OutputStream;

.field private final random:Ljava/util/Random;

.field private socket:Ljava/net/Socket;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/LiveSocket;->random:Ljava/util/Random;

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lcom/gemini/chat/LiveSocket;->closeCode:I

    .line 42
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/LiveSocket;->closeReason:Ljava/lang/String;

    return-void
.end method

.method static acceptFor(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 179
    :try_start_0
    const-string v0, "SHA-1"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 180
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ISO-8859-1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/gemini/chat/B64;->encode([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 182
    :goto_0
    return-object v0

    .line 181
    :catch_0
    move-exception v0

    .line 182
    const-string v0, ""

    goto :goto_0
.end method

.method private closeSocket()V
    .locals 1

    .prologue
    .line 335
    iget-object v0, p0, Lcom/gemini/chat/LiveSocket;->socket:Ljava/net/Socket;

    .line 336
    if-eqz v0, :cond_0

    .line 338
    :try_start_0
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 342
    :cond_0
    :goto_0
    return-void

    .line 339
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static enableSni(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;)V
    .locals 5

    .prologue
    .line 172
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "setHostname"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 175
    :goto_0
    return-void

    .line 173
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static proxyFor(ZLjava/lang/String;I)Ljava/net/InetSocketAddress;
    .locals 6

    .prologue
    .line 188
    :try_start_0
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v2

    new-instance v3, Ljava/net/URI;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p0, :cond_1

    const-string v1, "https"

    :goto_0
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "://"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ":"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "/"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    move-result-object v4

    .line 189
    const/4 v1, 0x0

    move v3, v1

    :goto_1
    if-eqz v4, :cond_3

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v1

    if-ge v3, v1, :cond_3

    .line 190
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/Proxy;

    .line 191
    invoke-virtual {v1}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v2

    .line 192
    invoke-virtual {v1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v1

    sget-object v5, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-ne v1, v5, :cond_2

    instance-of v1, v2, Ljava/net/InetSocketAddress;

    if-eqz v1, :cond_2

    .line 193
    move-object v0, v2

    check-cast v0, Ljava/net/InetSocketAddress;

    move-object v1, v0

    .line 195
    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->isUnresolved()Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/net/InetSocketAddress;

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v1

    invoke-direct {v2, v3, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    move-object v1, v2

    .line 200
    :cond_0
    :goto_2
    return-object v1

    .line 188
    :cond_1
    const-string v1, "http"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 189
    :cond_2
    add-int/lit8 v1, v3, 0x1

    move v3, v1

    goto :goto_1

    .line 198
    :catch_0
    move-exception v1

    .line 200
    :cond_3
    const/4 v1, 0x0

    goto :goto_2
.end method

.method private static readFully(Ljava/io/InputStream;[BII)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 216
    :goto_0
    if-lez p3, :cond_1

    .line 217
    invoke-virtual {p0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 218
    if-gez v0, :cond_0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Connection closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 219
    :cond_0
    add-int/2addr p2, v0

    .line 220
    sub-int/2addr p3, v0

    .line 221
    goto :goto_0

    .line 222
    :cond_1
    return-void
.end method

.method private static readLine(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 204
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 206
    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    if-eq v1, v3, :cond_1

    .line 207
    const/16 v2, 0xa

    if-ne v1, v2, :cond_2

    .line 211
    :cond_1
    if-ne v1, v3, :cond_4

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-nez v1, :cond_4

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Connection closed during handshake"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 208
    :cond_2
    const/16 v2, 0xd

    if-eq v1, v2, :cond_3

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 209
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    const/16 v2, 0x4000

    if-le v1, v2, :cond_0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Header line too long"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 212
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private sendFrame(I[B)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x4

    const/4 v9, 0x1

    const/4 v4, 0x0

    .line 231
    array-length v6, p2

    .line 232
    const/16 v0, 0x7e

    if-ge v6, v0, :cond_1

    move v0, v1

    .line 233
    :goto_0
    add-int/lit8 v3, v0, 0x4

    add-int/2addr v3, v6

    new-array v7, v3, [B

    .line 234
    or-int/lit16 v3, p1, 0x80

    int-to-byte v3, v3

    aput-byte v3, v7, v4

    .line 235
    const/16 v3, 0x7e

    if-ge v6, v3, :cond_3

    .line 236
    or-int/lit16 v3, v6, 0x80

    int-to-byte v3, v3

    aput-byte v3, v7, v9

    .line 245
    :cond_0
    :goto_1
    iget-object v3, p0, Lcom/gemini/chat/LiveSocket;->random:Ljava/util/Random;

    invoke-virtual {v3}, Ljava/util/Random;->nextInt()I

    move-result v3

    .line 246
    new-array v5, v2, [B

    ushr-int/lit8 v8, v3, 0x18

    int-to-byte v8, v8

    aput-byte v8, v5, v4

    ushr-int/lit8 v8, v3, 0x10

    int-to-byte v8, v8

    aput-byte v8, v5, v9

    ushr-int/lit8 v8, v3, 0x8

    int-to-byte v8, v8

    aput-byte v8, v5, v1

    int-to-byte v1, v3

    aput-byte v1, v5, v10

    .line 247
    invoke-static {v5, v4, v7, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 248
    :goto_2
    if-ge v4, v6, :cond_6

    add-int/lit8 v1, v0, 0x4

    add-int/2addr v1, v4

    aget-byte v2, p2, v4

    and-int/lit8 v3, v4, 0x3

    aget-byte v3, v5, v3

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v7, v1

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 232
    :cond_1
    const/high16 v0, 0x10000

    if-ge v6, v0, :cond_2

    move v0, v2

    goto :goto_0

    :cond_2
    const/16 v0, 0xa

    goto :goto_0

    .line 237
    :cond_3
    const/high16 v3, 0x10000

    if-ge v6, v3, :cond_4

    .line 238
    const/4 v3, -0x2

    aput-byte v3, v7, v9

    .line 239
    ushr-int/lit8 v3, v6, 0x8

    int-to-byte v3, v3

    aput-byte v3, v7, v1

    .line 240
    int-to-byte v3, v6

    aput-byte v3, v7, v10

    goto :goto_1

    .line 242
    :cond_4
    const/4 v3, -0x1

    aput-byte v3, v7, v9

    move v5, v4

    .line 243
    :goto_3
    const/16 v3, 0x8

    if-ge v5, v3, :cond_0

    add-int/lit8 v8, v5, 0x2

    if-ge v5, v2, :cond_5

    move v3, v4

    :goto_4
    int-to-byte v3, v3

    aput-byte v3, v7, v8

    add-int/lit8 v3, v5, 0x1

    move v5, v3

    goto :goto_3

    :cond_5
    rsub-int/lit8 v3, v5, 0x7

    mul-int/lit8 v3, v3, 0x8

    ushr-int v3, v6, v3

    goto :goto_4

    .line 249
    :cond_6
    iget-object v0, p0, Lcom/gemini/chat/LiveSocket;->out:Ljava/io/OutputStream;

    .line 250
    if-eqz v0, :cond_7

    iget-boolean v1, p0, Lcom/gemini/chat/LiveSocket;->closed:Z

    if-eqz v1, :cond_8

    :cond_7
    new-instance v0, Ljava/io/IOException;

    const-string v1, "WebSocket closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 251
    :cond_8
    monitor-enter p0

    .line 252
    :try_start_0
    invoke-virtual {v0, v7}, Ljava/io/OutputStream;->write([B)V

    .line 253
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 254
    monitor-exit p0

    .line 255
    return-void

    .line 254
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    .line 324
    iget-boolean v0, p0, Lcom/gemini/chat/LiveSocket;->closed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveSocket;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_0

    .line 326
    const/16 v0, 0x8

    const/4 v1, 0x2

    :try_start_0
    new-array v1, v1, [B

    fill-array-data v1, :array_0

    invoke-direct {p0, v0, v1}, Lcom/gemini/chat/LiveSocket;->sendFrame(I[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 330
    :cond_0
    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/gemini/chat/LiveSocket;->closed:Z

    .line 331
    invoke-direct {p0}, Lcom/gemini/chat/LiveSocket;->closeSocket()V

    .line 332
    return-void

    .line 327
    :catch_0
    move-exception v0

    goto :goto_0

    .line 326
    :array_0
    .array-data 1
        0x3t
        -0x18t
    .end array-data
.end method

.method public connect(Ljava/lang/String;[Ljava/lang/String;I)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x1bb

    const/16 v3, 0x50

    const/4 v4, 0x0

    .line 48
    :try_start_0
    new-instance v5, Ljava/net/URI;

    invoke-direct {v5, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    const-string v0, "wss"

    invoke-virtual {v5}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    .line 53
    invoke-virtual {v5}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v8

    .line 54
    invoke-virtual {v5}, Ljava/net/URI;->getPort()I

    move-result v0

    if-lez v0, :cond_3

    invoke-virtual {v5}, Ljava/net/URI;->getPort()I

    move-result v0

    move v1, v0

    .line 55
    :goto_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v5}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_5

    :cond_0
    const-string v0, "/"

    :goto_1
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 56
    invoke-virtual {v5}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "?"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v5}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 58
    new-instance v5, Ljava/net/Socket;

    invoke-direct {v5}, Ljava/net/Socket;-><init>()V

    .line 62
    :try_start_1
    invoke-static {v7, v8, v1}, Lcom/gemini/chat/LiveSocket;->proxyFor(ZLjava/lang/String;I)Ljava/net/InetSocketAddress;

    move-result-object v0

    .line 63
    if-eqz v0, :cond_7

    .line 64
    invoke-virtual {v5, v0, p3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 65
    invoke-virtual {v5, p3}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 66
    invoke-virtual {v5}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 67
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "CONNECT "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v10, ":"

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v10, " HTTP/1.1\r\nHost: "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v10, ":"

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v10, "\r\n\r\n"

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v10, "ISO-8859-1"

    invoke-virtual {v6, v10}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/io/OutputStream;->write([B)V

    .line 68
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 69
    invoke-virtual {v5}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 70
    invoke-static {v0}, Lcom/gemini/chat/LiveSocket;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v6

    .line 71
    :cond_1
    invoke-static {v0}, Lcom/gemini/chat/LiveSocket;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    if-gtz v10, :cond_1

    .line 74
    const-string v0, " 200"

    invoke-virtual {v6, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_8

    .line 75
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Proxy refused CONNECT: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    :catchall_0
    move-exception v0

    move-object v1, v0

    move-object v2, v5

    .line 101
    :goto_3
    :try_start_2
    invoke-virtual {v2}, Ljava/net/Socket;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 104
    :goto_4
    if-eq v2, v5, :cond_2

    .line 106
    :try_start_3
    invoke-virtual {v5}, Ljava/net/Socket;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 111
    :cond_2
    :goto_5
    throw v1

    .line 49
    :catch_0
    move-exception v0

    .line 50
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad URL: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_3
    if-eqz v7, :cond_4

    move v1, v2

    goto/16 :goto_0

    :cond_4
    move v1, v3

    goto/16 :goto_0

    .line 55
    :cond_5
    invoke-virtual {v5}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    .line 56
    :cond_6
    const-string v0, ""

    goto/16 :goto_2

    .line 78
    :cond_7
    :try_start_4
    new-instance v0, Ljava/net/InetSocketAddress;

    invoke-direct {v0, v8, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v5, v0, p3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 80
    :cond_8
    invoke-virtual {v5, p3}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 81
    const/4 v0, 0x1

    invoke-virtual {v5, v0}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 83
    if-eqz v7, :cond_17

    .line 84
    invoke-static {}, Ljavax/net/ssl/HttpsURLConnection;->getDefaultSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    .line 85
    const/4 v6, 0x1

    invoke-virtual {v0, v5, v8, v1, v6}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocket;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 87
    :try_start_5
    invoke-static {v0, v8}, Lcom/gemini/chat/LiveSocket;->enableSni(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;)V

    .line 88
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 89
    sget-object v6, Lcom/gemini/chat/LiveSocket;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    if-eqz v6, :cond_9

    sget-object v6, Lcom/gemini/chat/LiveSocket;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 90
    :goto_6
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v10

    invoke-interface {v6, v8, v10}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    move-result v6

    if-nez v6, :cond_a

    .line 91
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "TLS certificate does not match "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 99
    :catchall_1
    move-exception v1

    move-object v2, v0

    goto/16 :goto_3

    .line 89
    :cond_9
    invoke-static {}, Ljavax/net/ssl/HttpsURLConnection;->getDefaultHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-result-object v6

    goto :goto_6

    :cond_a
    move-object v6, v0

    .line 94
    :goto_7
    :try_start_6
    iput-object v6, p0, Lcom/gemini/chat/LiveSocket;->socket:Ljava/net/Socket;

    .line 95
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-virtual {v6}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    const/16 v11, 0x4000

    invoke-direct {v0, v10, v11}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    iput-object v0, p0, Lcom/gemini/chat/LiveSocket;->in:Ljava/io/InputStream;

    .line 96
    invoke-virtual {v6}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/gemini/chat/LiveSocket;->out:Ljava/io/OutputStream;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 113
    const/16 v0, 0x10

    new-array v0, v0, [B

    .line 114
    iget-object v5, p0, Lcom/gemini/chat/LiveSocket;->random:Ljava/util/Random;

    invoke-virtual {v5, v0}, Ljava/util/Random;->nextBytes([B)V

    .line 115
    invoke-static {v0}, Lcom/gemini/chat/B64;->encode([B)Ljava/lang/String;

    move-result-object v5

    .line 116
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 117
    const-string v0, "GET "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v9, " HTTP/1.1\r\n"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v9, "Host: "

    .line 118
    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    if-eqz v7, :cond_b

    :goto_8
    if-eq v1, v2, :cond_c

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_9
    invoke-virtual {v8, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "Upgrade: websocket\r\nConnection: Upgrade\r\n"

    .line 119
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "Sec-WebSocket-Key: "

    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "Sec-WebSocket-Version: 13\r\n"

    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 122
    if-eqz p2, :cond_d

    move v0, v4

    .line 123
    :goto_a
    add-int/lit8 v1, v0, 0x1

    array-length v2, p2

    if-ge v1, v2, :cond_d

    .line 124
    aget-object v1, p2, v0

    invoke-virtual {v6, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    aget-object v2, p2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 123
    add-int/lit8 v0, v0, 0x2

    goto :goto_a

    :cond_b
    move v2, v3

    .line 118
    goto :goto_8

    :cond_c
    const-string v0, ""

    goto :goto_9

    .line 127
    :cond_d
    const-string v0, "\r\n"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 128
    iget-object v0, p0, Lcom/gemini/chat/LiveSocket;->out:Ljava/io/OutputStream;

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 129
    iget-object v0, p0, Lcom/gemini/chat/LiveSocket;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 131
    iget-object v0, p0, Lcom/gemini/chat/LiveSocket;->in:Ljava/io/InputStream;

    invoke-static {v0}, Lcom/gemini/chat/LiveSocket;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v3

    .line 132
    const/4 v2, 0x0

    .line 133
    const/4 v0, -0x1

    .line 135
    :cond_e
    :goto_b
    iget-object v1, p0, Lcom/gemini/chat/LiveSocket;->in:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/gemini/chat/LiveSocket;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_10

    .line 136
    const/16 v6, 0x3a

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 137
    if-lez v6, :cond_e

    .line 138
    invoke-virtual {v1, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    .line 139
    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 140
    const-string v6, "sec-websocket-accept"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_f

    :goto_c
    move-object v2, v1

    .line 147
    goto :goto_b

    .line 141
    :cond_f
    const-string v6, "content-length"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_16

    .line 143
    :try_start_7
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_1

    move-result v0

    move-object v1, v2

    .line 145
    goto :goto_c

    .line 144
    :catch_1
    move-exception v1

    move-object v1, v2

    goto :goto_c

    .line 148
    :cond_10
    const-string v1, " 101"

    invoke-virtual {v3, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_12

    .line 149
    const-string v1, ""

    .line 150
    if-lez v0, :cond_15

    const/high16 v2, 0x10000

    if-ge v0, v2, :cond_15

    .line 151
    new-array v1, v0, [B

    .line 152
    iget-object v2, p0, Lcom/gemini/chat/LiveSocket;->in:Ljava/io/InputStream;

    invoke-static {v2, v1, v4, v0}, Lcom/gemini/chat/LiveSocket;->readFully(Ljava/io/InputStream;[BII)V

    .line 153
    new-instance v0, Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 155
    :goto_d
    invoke-virtual {p0}, Lcom/gemini/chat/LiveSocket;->close()V

    .line 156
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "WebSocket handshake failed: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_11

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_e
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_11
    const-string v0, ""

    goto :goto_e

    .line 158
    :cond_12
    if-eqz v2, :cond_13

    invoke-static {v5}, Lcom/gemini/chat/LiveSocket;->acceptFor(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    .line 159
    :cond_13
    invoke-virtual {p0}, Lcom/gemini/chat/LiveSocket;->close()V

    .line 160
    new-instance v0, Ljava/io/IOException;

    const-string v1, "WebSocket handshake failed: bad Sec-WebSocket-Accept"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 162
    :cond_14
    iget-object v0, p0, Lcom/gemini/chat/LiveSocket;->socket:Ljava/net/Socket;

    invoke-virtual {v0, v4}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 163
    return-void

    .line 102
    :catch_2
    move-exception v0

    goto/16 :goto_4

    .line 107
    :catch_3
    move-exception v0

    goto/16 :goto_5

    .line 99
    :catchall_2
    move-exception v0

    move-object v1, v0

    move-object v2, v6

    goto/16 :goto_3

    :cond_15
    move-object v0, v1

    goto :goto_d

    :cond_16
    move-object v1, v2

    goto/16 :goto_c

    :cond_17
    move-object v6, v5

    goto/16 :goto_7
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 319
    iget-boolean v0, p0, Lcom/gemini/chat/LiveSocket;->closed:Z

    return v0
.end method

.method public receive()Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 261
    const/4 v0, 0x0

    .line 262
    const/16 v1, 0x8

    new-array v6, v1, [B

    .line 264
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/gemini/chat/LiveSocket;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 265
    if-gez v2, :cond_1

    .line 266
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/gemini/chat/LiveSocket;->closed:Z

    .line 267
    const/4 v0, 0x0

    .line 313
    :goto_1
    return-object v0

    .line 269
    :cond_1
    iget-object v1, p0, Lcom/gemini/chat/LiveSocket;->in:Ljava/io/InputStream;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v1, v6, v3, v4}, Lcom/gemini/chat/LiveSocket;->readFully(Ljava/io/InputStream;[BII)V

    .line 270
    and-int/lit16 v1, v2, 0x80

    if-eqz v1, :cond_4

    const/4 v1, 0x1

    .line 271
    :goto_2
    and-int/lit8 v7, v2, 0xf

    .line 272
    const/4 v2, 0x0

    aget-byte v2, v6, v2

    and-int/lit16 v2, v2, 0x80

    if-eqz v2, :cond_5

    const/4 v2, 0x1

    .line 273
    :goto_3
    const/4 v3, 0x0

    aget-byte v3, v6, v3

    and-int/lit8 v3, v3, 0x7f

    int-to-long v4, v3

    .line 274
    const-wide/16 v8, 0x7e

    cmp-long v3, v4, v8

    if-nez v3, :cond_6

    .line 275
    iget-object v3, p0, Lcom/gemini/chat/LiveSocket;->in:Ljava/io/InputStream;

    const/4 v4, 0x0

    const/4 v5, 0x2

    invoke-static {v3, v6, v4, v5}, Lcom/gemini/chat/LiveSocket;->readFully(Ljava/io/InputStream;[BII)V

    .line 276
    const/4 v3, 0x0

    aget-byte v3, v6, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    const/4 v4, 0x1

    aget-byte v4, v6, v4

    and-int/lit16 v4, v4, 0xff

    or-int/2addr v3, v4

    int-to-long v4, v3

    .line 282
    :cond_2
    const-wide/16 v8, 0x0

    cmp-long v3, v4, v8

    if-ltz v3, :cond_3

    const-wide/32 v8, 0x1000000

    cmp-long v3, v4, v8

    if-lez v3, :cond_7

    :cond_3
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "WebSocket frame too large: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 270
    :cond_4
    const/4 v1, 0x0

    goto :goto_2

    .line 272
    :cond_5
    const/4 v2, 0x0

    goto :goto_3

    .line 277
    :cond_6
    const-wide/16 v8, 0x7f

    cmp-long v3, v4, v8

    if-nez v3, :cond_2

    .line 278
    iget-object v3, p0, Lcom/gemini/chat/LiveSocket;->in:Ljava/io/InputStream;

    const/4 v4, 0x0

    const/16 v5, 0x8

    invoke-static {v3, v6, v4, v5}, Lcom/gemini/chat/LiveSocket;->readFully(Ljava/io/InputStream;[BII)V

    .line 279
    const-wide/16 v4, 0x0

    .line 280
    const/4 v3, 0x0

    :goto_4
    const/16 v8, 0x8

    if-ge v3, v8, :cond_2

    const/16 v8, 0x8

    shl-long/2addr v4, v8

    aget-byte v8, v6, v3

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    or-long/2addr v4, v8

    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 283
    :cond_7
    const/4 v3, 0x0

    .line 284
    if-eqz v2, :cond_12

    .line 285
    const/4 v2, 0x4

    new-array v2, v2, [B

    .line 286
    iget-object v3, p0, Lcom/gemini/chat/LiveSocket;->in:Ljava/io/InputStream;

    const/4 v8, 0x0

    const/4 v9, 0x4

    invoke-static {v3, v2, v8, v9}, Lcom/gemini/chat/LiveSocket;->readFully(Ljava/io/InputStream;[BII)V

    .line 288
    :goto_5
    long-to-int v3, v4

    new-array v4, v3, [B

    .line 289
    iget-object v3, p0, Lcom/gemini/chat/LiveSocket;->in:Ljava/io/InputStream;

    const/4 v5, 0x0

    array-length v8, v4

    invoke-static {v3, v4, v5, v8}, Lcom/gemini/chat/LiveSocket;->readFully(Ljava/io/InputStream;[BII)V

    .line 290
    if-eqz v2, :cond_8

    const/4 v3, 0x0

    :goto_6
    array-length v5, v4

    if-ge v3, v5, :cond_8

    aget-byte v5, v4, v3

    and-int/lit8 v8, v3, 0x3

    aget-byte v8, v2, v8

    xor-int/2addr v5, v8

    int-to-byte v5, v5

    aput-byte v5, v4, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 292
    :cond_8
    const/16 v2, 0x8

    if-ne v7, v2, :cond_d

    .line 293
    array-length v0, v4

    const/4 v1, 0x2

    if-lt v0, v1, :cond_a

    const/4 v0, 0x0

    aget-byte v0, v4, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    const/4 v1, 0x1

    aget-byte v1, v4, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    :goto_7
    iput v0, p0, Lcom/gemini/chat/LiveSocket;->closeCode:I

    .line 294
    array-length v0, v4

    const/4 v1, 0x2

    if-le v0, v1, :cond_b

    new-instance v0, Ljava/lang/String;

    const/4 v1, 0x2

    array-length v2, v4

    add-int/lit8 v2, v2, -0x2

    const-string v3, "UTF-8"

    invoke-direct {v0, v4, v1, v2, v3}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    :goto_8
    iput-object v0, p0, Lcom/gemini/chat/LiveSocket;->closeReason:Ljava/lang/String;

    .line 296
    :try_start_0
    iget-boolean v0, p0, Lcom/gemini/chat/LiveSocket;->closed:Z

    if-nez v0, :cond_9

    const/16 v1, 0x8

    array-length v0, v4

    const/4 v2, 0x2

    if-lt v0, v2, :cond_c

    const/4 v0, 0x2

    new-array v0, v0, [B

    const/4 v2, 0x0

    const/4 v3, 0x0

    aget-byte v3, v4, v3

    aput-byte v3, v0, v2

    const/4 v2, 0x1

    const/4 v3, 0x1

    aget-byte v3, v4, v3

    aput-byte v3, v0, v2

    :goto_9
    invoke-direct {p0, v1, v0}, Lcom/gemini/chat/LiveSocket;->sendFrame(I[B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 299
    :cond_9
    :goto_a
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/gemini/chat/LiveSocket;->closed:Z

    .line 300
    invoke-direct {p0}, Lcom/gemini/chat/LiveSocket;->closeSocket()V

    .line 301
    const/4 v0, 0x0

    goto/16 :goto_1

    .line 293
    :cond_a
    const/16 v0, 0x3ed

    goto :goto_7

    .line 294
    :cond_b
    const-string v0, ""

    goto :goto_8

    .line 296
    :cond_c
    const/4 v0, 0x0

    :try_start_1
    new-array v0, v0, [B
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_9

    .line 302
    :cond_d
    const/16 v2, 0x9

    if-ne v7, v2, :cond_e

    .line 304
    const/16 v1, 0xa

    :try_start_2
    invoke-direct {p0, v1, v4}, Lcom/gemini/chat/LiveSocket;->sendFrame(I[B)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 305
    :catch_0
    move-exception v1

    goto/16 :goto_0

    .line 307
    :cond_e
    const/16 v2, 0xa

    if-eq v7, v2, :cond_0

    .line 309
    const/4 v2, 0x1

    if-eq v7, v2, :cond_f

    const/4 v2, 0x2

    if-eq v7, v2, :cond_f

    if-nez v7, :cond_0

    .line 310
    :cond_f
    if-nez v0, :cond_10

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    array-length v2, v4

    invoke-direct {v0, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 311
    :cond_10
    const/4 v2, 0x0

    array-length v3, v4

    invoke-virtual {v0, v4, v2, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 312
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v2

    const/high16 v3, 0x1000000

    if-le v2, v3, :cond_11

    new-instance v0, Ljava/io/IOException;

    const-string v1, "WebSocket message too large"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 313
    :cond_11
    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    const-string v2, "UTF-8"

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    move-object v0, v1

    goto/16 :goto_1

    .line 297
    :catch_1
    move-exception v0

    goto :goto_a

    :cond_12
    move-object v2, v3

    goto/16 :goto_5
.end method

.method public send(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 227
    const/4 v0, 0x1

    const-string v1, "UTF-8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/gemini/chat/LiveSocket;->sendFrame(I[B)V

    .line 228
    return-void
.end method
