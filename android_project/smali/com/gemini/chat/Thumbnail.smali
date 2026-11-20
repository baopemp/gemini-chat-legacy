.class public final Lcom/gemini/chat/Thumbnail;
.super Ljava/lang/Object;
.source "Thumbnail.java"


# static fields
.field private static final CACHE:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private static final CACHE_MAX:I = 0xc

.field private static final DEC:[B


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/16 v6, 0x80

    const/16 v5, 0x3f

    const/16 v4, 0x3e

    .line 16
    new-instance v0, Lcom/gemini/chat/Thumbnail$1;

    const/16 v1, 0x10

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/gemini/chat/Thumbnail$1;-><init>(IFZ)V

    sput-object v0, Lcom/gemini/chat/Thumbnail;->CACHE:Ljava/util/LinkedHashMap;

    .line 23
    new-array v0, v6, [B

    sput-object v0, Lcom/gemini/chat/Thumbnail;->DEC:[B

    .line 26
    const/4 v0, 0x0

    :goto_0
    if-ge v0, v6, :cond_0

    sget-object v1, Lcom/gemini/chat/Thumbnail;->DEC:[B

    const/4 v2, -0x1

    aput-byte v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 27
    :cond_0
    const/16 v0, 0x41

    :goto_1
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_1

    sget-object v1, Lcom/gemini/chat/Thumbnail;->DEC:[B

    add-int/lit8 v2, v0, -0x41

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 28
    :cond_1
    const/16 v0, 0x61

    :goto_2
    const/16 v1, 0x7a

    if-gt v0, v1, :cond_2

    sget-object v1, Lcom/gemini/chat/Thumbnail;->DEC:[B

    add-int/lit8 v2, v0, -0x61

    add-int/lit8 v2, v2, 0x1a

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 29
    :cond_2
    const/16 v0, 0x30

    :goto_3
    const/16 v1, 0x39

    if-gt v0, v1, :cond_3

    sget-object v1, Lcom/gemini/chat/Thumbnail;->DEC:[B

    add-int/lit8 v2, v0, -0x30

    add-int/lit8 v2, v2, 0x34

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 30
    :cond_3
    sget-object v0, Lcom/gemini/chat/Thumbnail;->DEC:[B

    const/16 v1, 0x2b

    aput-byte v4, v0, v1

    .line 31
    sget-object v0, Lcom/gemini/chat/Thumbnail;->DEC:[B

    const/16 v1, 0x2d

    aput-byte v4, v0, v1

    .line 32
    sget-object v0, Lcom/gemini/chat/Thumbnail;->DEC:[B

    const/16 v1, 0x2f

    aput-byte v5, v0, v1

    .line 33
    sget-object v0, Lcom/gemini/chat/Thumbnail;->DEC:[B

    const/16 v1, 0x5f

    aput-byte v5, v0, v1

    .line 34
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method private static cacheKey(Ljava/lang/String;I)Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 47
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 48
    if-lez v2, :cond_1

    ushr-int/lit8 v1, v2, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 49
    :goto_0
    if-lez v2, :cond_0

    add-int/lit8 v0, v2, -0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 50
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    move v1, v0

    .line 48
    goto :goto_0
.end method

.method public static clearCache()V
    .locals 2

    .prologue
    .line 41
    sget-object v1, Lcom/gemini/chat/Thumbnail;->CACHE:Ljava/util/LinkedHashMap;

    monitor-enter v1

    .line 42
    :try_start_0
    sget-object v0, Lcom/gemini/chat/Thumbnail;->CACHE:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    .line 43
    monitor-exit v1

    .line 44
    return-void

    .line 43
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static decodeBase64(Ljava/lang/String;I)[B
    .locals 8

    .prologue
    const/4 v5, 0x0

    .line 97
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 98
    sub-int v0, v6, p1

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x3

    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    new-array v4, v0, [B

    move v0, v5

    move v1, v5

    move v2, v5

    .line 100
    :goto_0
    if-ge p1, v6, :cond_0

    .line 101
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 102
    const/16 v7, 0x3d

    if-ne v3, v7, :cond_1

    .line 113
    :cond_0
    array-length v0, v4

    if-ne v2, v0, :cond_5

    move-object v0, v4

    .line 116
    :goto_1
    return-object v0

    .line 103
    :cond_1
    const/16 v7, 0x80

    if-ge v3, v7, :cond_3

    sget-object v7, Lcom/gemini/chat/Thumbnail;->DEC:[B

    aget-byte v3, v7, v3

    .line 104
    :goto_2
    if-gez v3, :cond_4

    .line 100
    :cond_2
    :goto_3
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 103
    :cond_3
    const/4 v3, -0x1

    goto :goto_2

    .line 105
    :cond_4
    shl-int/lit8 v1, v1, 0x6

    or-int/2addr v1, v3

    .line 106
    add-int/lit8 v0, v0, 0x6

    .line 107
    const/16 v3, 0x8

    if-lt v0, v3, :cond_2

    .line 108
    add-int/lit8 v0, v0, -0x8

    .line 109
    add-int/lit8 v3, v2, 0x1

    shr-int v7, v1, v0

    int-to-byte v7, v7

    aput-byte v7, v4, v2

    .line 110
    const/4 v2, 0x1

    shl-int/2addr v2, v0

    add-int/lit8 v2, v2, -0x1

    and-int/2addr v1, v2

    move v2, v3

    goto :goto_3

    .line 114
    :cond_5
    new-array v0, v2, [B

    .line 115
    invoke-static {v4, v5, v0, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_1
.end method

.method public static fromDataUri(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .locals 9

    .prologue
    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 55
    if-eqz p0, :cond_0

    if-gtz p1, :cond_1

    :cond_0
    move-object v0, v1

    .line 91
    :goto_0
    return-object v0

    .line 56
    :cond_1
    invoke-static {p0, p1}, Lcom/gemini/chat/Thumbnail;->cacheKey(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    .line 57
    sget-object v4, Lcom/gemini/chat/Thumbnail;->CACHE:Ljava/util/LinkedHashMap;

    monitor-enter v4

    .line 58
    :try_start_0
    sget-object v0, Lcom/gemini/chat/Thumbnail;->CACHE:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 59
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v5

    if-nez v5, :cond_2

    monitor-exit v4

    goto :goto_0

    .line 60
    :catchall_0
    move-exception v0

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_2
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    const/16 v0, 0x2c

    :try_start_2
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 63
    if-gez v0, :cond_3

    move-object v0, v1

    goto :goto_0

    .line 64
    :cond_3
    add-int/lit8 v0, v0, 0x1

    invoke-static {p0, v0}, Lcom/gemini/chat/Thumbnail;->decodeBase64(Ljava/lang/String;I)[B

    move-result-object v4

    .line 65
    array-length v0, v4

    if-nez v0, :cond_4

    move-object v0, v1

    goto :goto_0

    .line 66
    :cond_4
    new-instance v5, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v5}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 67
    const/4 v0, 0x1

    iput-boolean v0, v5, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 68
    const/4 v0, 0x0

    array-length v6, v4

    invoke-static {v4, v0, v6, v5}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 69
    iget v0, v5, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lez v0, :cond_5

    iget v0, v5, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-gtz v0, :cond_6

    :cond_5
    move-object v0, v1

    goto :goto_0

    :cond_6
    move v0, v2

    .line 71
    :goto_1
    iget v2, v5, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    mul-int/lit8 v6, v0, 0x2

    div-int/2addr v2, v6

    if-ge v2, p1, :cond_7

    iget v2, v5, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    mul-int/lit8 v6, v0, 0x2

    div-int/2addr v2, v6

    if-lt v2, p1, :cond_8

    :cond_7
    mul-int/lit8 v0, v0, 0x2

    goto :goto_1

    .line 72
    :cond_8
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 73
    iput v0, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 74
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v0, v2, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 75
    const/4 v0, 0x1

    iput-boolean v0, v2, Landroid/graphics/BitmapFactory$Options;->inDither:Z

    .line 76
    const/4 v0, 0x0

    array-length v5, v4

    invoke-static {v4, v0, v5, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 77
    if-nez v2, :cond_9

    move-object v0, v1

    goto :goto_0

    .line 78
    :cond_9
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 79
    const/high16 v5, 0x3f800000    # 1.0f

    int-to-float v6, p1

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v7

    int-to-float v7, v7

    div-float/2addr v6, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v5

    .line 80
    cmpg-float v6, v5, v8

    if-gez v6, :cond_b

    .line 81
    const/4 v6, 0x1

    int-to-float v0, v0

    mul-float/2addr v0, v5

    float-to-int v0, v0

    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/4 v6, 0x1

    int-to-float v4, v4

    mul-float/2addr v4, v5

    float-to-int v4, v4

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    const/4 v5, 0x1

    invoke-static {v2, v0, v4, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 82
    if-eq v0, v2, :cond_a

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 85
    :cond_a
    :goto_2
    sget-object v2, Lcom/gemini/chat/Thumbnail;->CACHE:Ljava/util/LinkedHashMap;

    monitor-enter v2
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 86
    :try_start_3
    sget-object v4, Lcom/gemini/chat/Thumbnail;->CACHE:Ljava/util/LinkedHashMap;

    invoke-virtual {v4, v3, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    monitor-exit v2

    goto/16 :goto_0

    :catchall_1
    move-exception v0

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    .line 89
    :catch_0
    move-exception v0

    .line 90
    invoke-static {}, Lcom/gemini/chat/Thumbnail;->clearCache()V

    move-object v0, v1

    .line 91
    goto/16 :goto_0

    :cond_b
    move-object v0, v2

    goto :goto_2
.end method
