.class public final Lcom/gemini/chat/Thumbnail;
.super Ljava/lang/Object;
.source "Thumbnail.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    return-void
.end method

.method public static decodeBase64(Ljava/lang/String;I)[B
    .locals 8

    .prologue
    const/4 v4, 0x0

    .line 47
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 48
    sub-int v0, v5, p1

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x3

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    new-array v6, v0, [B

    move v0, v4

    move v1, v4

    move v3, v4

    .line 50
    :goto_0
    if-ge p1, v5, :cond_7

    .line 51
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 53
    const/16 v7, 0x41

    if-lt v2, v7, :cond_0

    const/16 v7, 0x5a

    if-gt v2, v7, :cond_0

    add-int/lit8 v2, v2, -0x41

    .line 60
    :goto_1
    shl-int/lit8 v1, v1, 0x6

    or-int/2addr v1, v2

    .line 61
    add-int/lit8 v0, v0, 0x6

    .line 62
    const/16 v2, 0x8

    if-lt v0, v2, :cond_8

    .line 63
    add-int/lit8 v0, v0, -0x8

    .line 64
    add-int/lit8 v2, v3, 0x1

    shr-int v7, v1, v0

    int-to-byte v7, v7

    aput-byte v7, v6, v3

    .line 65
    const/4 v3, 0x1

    shl-int/2addr v3, v0

    add-int/lit8 v3, v3, -0x1

    and-int/2addr v1, v3

    .line 50
    :goto_2
    add-int/lit8 p1, p1, 0x1

    move v3, v2

    goto :goto_0

    .line 54
    :cond_0
    const/16 v7, 0x61

    if-lt v2, v7, :cond_1

    const/16 v7, 0x7a

    if-gt v2, v7, :cond_1

    add-int/lit8 v2, v2, -0x61

    add-int/lit8 v2, v2, 0x1a

    goto :goto_1

    .line 55
    :cond_1
    const/16 v7, 0x30

    if-lt v2, v7, :cond_2

    const/16 v7, 0x39

    if-gt v2, v7, :cond_2

    add-int/lit8 v2, v2, -0x30

    add-int/lit8 v2, v2, 0x34

    goto :goto_1

    .line 56
    :cond_2
    const/16 v7, 0x2b

    if-eq v2, v7, :cond_3

    const/16 v7, 0x2d

    if-ne v2, v7, :cond_4

    :cond_3
    const/16 v2, 0x3e

    goto :goto_1

    .line 57
    :cond_4
    const/16 v7, 0x2f

    if-eq v2, v7, :cond_5

    const/16 v7, 0x5f

    if-ne v2, v7, :cond_6

    :cond_5
    const/16 v2, 0x3f

    goto :goto_1

    .line 58
    :cond_6
    const/16 v7, 0x3d

    if-ne v2, v7, :cond_8

    .line 68
    :cond_7
    new-array v0, v3, [B

    .line 69
    invoke-static {v6, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 70
    return-object v0

    :cond_8
    move v2, v3

    goto :goto_2
.end method

.method public static fromDataUri(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .locals 8

    .prologue
    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 16
    if-eqz p0, :cond_0

    if-gtz p1, :cond_2

    :cond_0
    move-object v0, v2

    .line 41
    :cond_1
    :goto_0
    return-object v0

    .line 18
    :cond_2
    const/16 v1, 0x2c

    :try_start_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 19
    if-gez v1, :cond_3

    move-object v0, v2

    goto :goto_0

    .line 20
    :cond_3
    add-int/lit8 v1, v1, 0x1

    invoke-static {p0, v1}, Lcom/gemini/chat/Thumbnail;->decodeBase64(Ljava/lang/String;I)[B

    move-result-object v1

    .line 21
    array-length v3, v1

    if-nez v3, :cond_4

    move-object v0, v2

    goto :goto_0

    .line 22
    :cond_4
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 23
    const/4 v4, 0x1

    iput-boolean v4, v3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 24
    const/4 v4, 0x0

    array-length v5, v1

    invoke-static {v1, v4, v5, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 25
    iget v4, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lez v4, :cond_5

    iget v4, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-gtz v4, :cond_6

    :cond_5
    move-object v0, v2

    goto :goto_0

    .line 27
    :cond_6
    :goto_1
    iget v4, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    mul-int/lit8 v5, v0, 0x2

    div-int/2addr v4, v5

    if-ge v4, p1, :cond_7

    iget v4, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    mul-int/lit8 v5, v0, 0x2

    div-int/2addr v4, v5

    if-lt v4, p1, :cond_8

    :cond_7
    mul-int/lit8 v0, v0, 0x2

    goto :goto_1

    .line 28
    :cond_8
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 29
    iput v0, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 30
    const/4 v0, 0x0

    array-length v4, v1

    invoke-static {v1, v0, v4, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 31
    if-nez v1, :cond_9

    move-object v0, v2

    goto :goto_0

    .line 32
    :cond_9
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    .line 33
    const/high16 v4, 0x3f800000    # 1.0f

    int-to-float v5, p1

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v5, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 34
    cmpg-float v5, v4, v7

    if-gez v5, :cond_a

    .line 35
    const/4 v5, 0x1

    int-to-float v0, v0

    mul-float/2addr v0, v4

    float-to-int v0, v0

    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/4 v5, 0x1

    int-to-float v3, v3

    mul-float/2addr v3, v4

    float-to-int v3, v3

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    const/4 v4, 0x1

    invoke-static {v1, v0, v3, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 36
    if-eq v0, v1, :cond_1

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 40
    :catch_0
    move-exception v0

    move-object v0, v2

    .line 41
    goto/16 :goto_0

    :cond_a
    move-object v0, v1

    goto/16 :goto_0
.end method
