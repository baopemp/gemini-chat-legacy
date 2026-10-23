.class public final Lcom/gemini/chat/B64;
.super Ljava/lang/Object;
.source "B64.java"


# static fields
.field private static final DEC:[I

.field private static final ENC:[C


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/16 v4, 0x80

    const/4 v0, 0x0

    .line 5
    const-string v1, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lcom/gemini/chat/B64;->ENC:[C

    .line 6
    new-array v1, v4, [I

    sput-object v1, Lcom/gemini/chat/B64;->DEC:[I

    move v1, v0

    .line 9
    :goto_0
    if-ge v1, v4, :cond_0

    sget-object v2, Lcom/gemini/chat/B64;->DEC:[I

    const/4 v3, -0x1

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 10
    :cond_0
    :goto_1
    const/16 v1, 0x40

    if-ge v0, v1, :cond_1

    sget-object v1, Lcom/gemini/chat/B64;->DEC:[I

    sget-object v2, Lcom/gemini/chat/B64;->ENC:[C

    aget-char v2, v2, v0

    aput v0, v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 11
    :cond_1
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method

.method public static decode(Ljava/lang/String;)[B
    .locals 9

    .prologue
    const/4 v5, 0x0

    .line 43
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 44
    div-int/lit8 v0, v6, 0x4

    mul-int/lit8 v0, v0, 0x3

    add-int/lit8 v0, v0, 0x3

    new-array v7, v0, [B

    move v4, v5

    move v0, v5

    move v1, v5

    move v2, v5

    .line 46
    :goto_0
    if-ge v4, v6, :cond_0

    .line 47
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 48
    const/16 v8, 0x3d

    if-ne v3, v8, :cond_1

    .line 58
    :cond_0
    new-array v0, v2, [B

    .line 59
    invoke-static {v7, v5, v0, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 60
    return-object v0

    .line 49
    :cond_1
    const/16 v8, 0x80

    if-ge v3, v8, :cond_3

    sget-object v8, Lcom/gemini/chat/B64;->DEC:[I

    aget v3, v8, v3

    .line 50
    :goto_1
    if-gez v3, :cond_4

    .line 46
    :cond_2
    :goto_2
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    goto :goto_0

    .line 49
    :cond_3
    const/4 v3, -0x1

    goto :goto_1

    .line 51
    :cond_4
    shl-int/lit8 v1, v1, 0x6

    or-int/2addr v1, v3

    .line 52
    add-int/lit8 v0, v0, 0x6

    .line 53
    const/16 v3, 0x8

    if-lt v0, v3, :cond_2

    .line 54
    add-int/lit8 v0, v0, -0x8

    .line 55
    add-int/lit8 v3, v2, 0x1

    shr-int v8, v1, v0

    int-to-byte v8, v8

    aput-byte v8, v7, v2

    move v2, v3

    goto :goto_2
.end method

.method public static encode([B)Ljava/lang/String;
    .locals 2

    .prologue
    .line 39
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/gemini/chat/B64;->encode([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encode([BII)Ljava/lang/String;
    .locals 10

    .prologue
    const/16 v1, 0x3d

    const/4 v9, 0x2

    const/4 v0, 0x0

    .line 17
    add-int/lit8 v2, p2, 0x2

    div-int/lit8 v2, v2, 0x3

    mul-int/lit8 v2, v2, 0x4

    new-array v3, v2, [C

    .line 18
    add-int v4, p1, p2

    move v2, v0

    .line 19
    :goto_0
    sub-int v5, v4, p1

    const/4 v6, 0x3

    if-lt v5, v6, :cond_0

    .line 20
    aget-byte v5, p0, p1

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x10

    add-int/lit8 v6, p1, 0x1

    aget-byte v6, p0, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    or-int/2addr v5, v6

    add-int/lit8 v6, p1, 0x2

    aget-byte v6, p0, v6

    and-int/lit16 v6, v6, 0xff

    or-int/2addr v5, v6

    .line 21
    add-int/lit8 v6, v2, 0x1

    sget-object v7, Lcom/gemini/chat/B64;->ENC:[C

    ushr-int/lit8 v8, v5, 0x12

    aget-char v7, v7, v8

    aput-char v7, v3, v2

    .line 22
    add-int/lit8 v2, v6, 0x1

    sget-object v7, Lcom/gemini/chat/B64;->ENC:[C

    ushr-int/lit8 v8, v5, 0xc

    and-int/lit8 v8, v8, 0x3f

    aget-char v7, v7, v8

    aput-char v7, v3, v6

    .line 23
    add-int/lit8 v6, v2, 0x1

    sget-object v7, Lcom/gemini/chat/B64;->ENC:[C

    ushr-int/lit8 v8, v5, 0x6

    and-int/lit8 v8, v8, 0x3f

    aget-char v7, v7, v8

    aput-char v7, v3, v2

    .line 24
    add-int/lit8 v2, v6, 0x1

    sget-object v7, Lcom/gemini/chat/B64;->ENC:[C

    and-int/lit8 v5, v5, 0x3f

    aget-char v5, v7, v5

    aput-char v5, v3, v6

    .line 25
    add-int/lit8 p1, p1, 0x3

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sub-int/2addr v4, p1

    .line 28
    if-lez v4, :cond_2

    .line 29
    aget-byte v5, p0, p1

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x10

    if-ne v4, v9, :cond_1

    add-int/lit8 v0, p1, 0x1

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    :cond_1
    or-int/2addr v0, v5

    .line 30
    add-int/lit8 v5, v2, 0x1

    sget-object v6, Lcom/gemini/chat/B64;->ENC:[C

    ushr-int/lit8 v7, v0, 0x12

    aget-char v6, v6, v7

    aput-char v6, v3, v2

    .line 31
    add-int/lit8 v2, v5, 0x1

    sget-object v6, Lcom/gemini/chat/B64;->ENC:[C

    ushr-int/lit8 v7, v0, 0xc

    and-int/lit8 v7, v7, 0x3f

    aget-char v6, v6, v7

    aput-char v6, v3, v5

    .line 32
    add-int/lit8 v5, v2, 0x1

    if-ne v4, v9, :cond_3

    sget-object v4, Lcom/gemini/chat/B64;->ENC:[C

    ushr-int/lit8 v0, v0, 0x6

    and-int/lit8 v0, v0, 0x3f

    aget-char v0, v4, v0

    :goto_1
    aput-char v0, v3, v2

    .line 33
    add-int/lit8 v0, v5, 0x1

    aput-char v1, v3, v5

    .line 35
    :cond_2
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([C)V

    return-object v0

    :cond_3
    move v0, v1

    .line 32
    goto :goto_1
.end method
