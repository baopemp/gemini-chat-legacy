.class final Lcom/gemini/chat/LiveActivity$AudioMeterView;
.super Landroid/view/View;
.source "LiveActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/LiveActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AudioMeterView"
.end annotation


# static fields
.field private static final BARS:I = 0xc

.field private static final IDLE_COLOR:I = -0xc3bfbd


# instance fields
.field private activeColor:I

.field private final paint:Landroid/graphics/Paint;

.field private smoothLevel:I


# direct methods
.method constructor <init>(Lcom/gemini/chat/LiveActivity;)V
    .locals 2

    .prologue
    .line 144
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 139
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity$AudioMeterView;->paint:Landroid/graphics/Paint;

    .line 141
    const v0, -0xc3bfbd

    iput v0, p0, Lcom/gemini/chat/LiveActivity$AudioMeterView;->activeColor:I

    .line 145
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$AudioMeterView;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 146
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 13

    .prologue
    .line 162
    invoke-virtual {p0}, Lcom/gemini/chat/LiveActivity$AudioMeterView;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/gemini/chat/LiveActivity$AudioMeterView;->getHeight()I

    move-result v7

    .line 163
    if-lez v0, :cond_0

    if-gtz v7, :cond_1

    .line 176
    :cond_0
    return-void

    .line 164
    :cond_1
    const/4 v1, 0x2

    div-int/lit8 v2, v0, 0x5a

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 165
    const/4 v1, 0x2

    mul-int/lit8 v2, v8, 0xb

    sub-int v2, v0, v2

    div-int/lit8 v2, v2, 0xc

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 166
    mul-int/lit8 v1, v9, 0xc

    mul-int/lit8 v2, v8, 0xb

    add-int/2addr v1, v2

    sub-int/2addr v0, v1

    div-int/lit8 v10, v0, 0x2

    .line 167
    iget v0, p0, Lcom/gemini/chat/LiveActivity$AudioMeterView;->smoothLevel:I

    mul-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0x63

    div-int/lit8 v11, v0, 0x64

    .line 168
    div-int/lit8 v12, v7, 0x2

    .line 169
    const/4 v0, 0x0

    move v6, v0

    :goto_0
    const/16 v0, 0xc

    if-ge v6, v0, :cond_0

    .line 170
    add-int v0, v9, v8

    mul-int/2addr v0, v6

    add-int v3, v10, v0

    .line 171
    if-ge v6, v11, :cond_2

    iget v0, p0, Lcom/gemini/chat/LiveActivity$AudioMeterView;->smoothLevel:I

    if-lez v0, :cond_2

    const/4 v0, 0x1

    .line 172
    :goto_1
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity$AudioMeterView;->paint:Landroid/graphics/Paint;

    if-eqz v0, :cond_3

    iget v1, p0, Lcom/gemini/chat/LiveActivity$AudioMeterView;->activeColor:I

    :goto_2
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 173
    if-eqz v0, :cond_4

    const/4 v0, 0x2

    mul-int/lit8 v1, v6, 0x5

    rem-int/lit8 v1, v1, 0x2d

    add-int/lit8 v1, v1, 0x2d

    mul-int/2addr v1, v7

    div-int/lit16 v1, v1, 0xc8

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 174
    :goto_3
    int-to-float v1, v3

    sub-int v2, v12, v0

    int-to-float v2, v2

    add-int/2addr v3, v9

    int-to-float v3, v3

    add-int/2addr v0, v12

    int-to-float v4, v0

    iget-object v5, p0, Lcom/gemini/chat/LiveActivity$AudioMeterView;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 169
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_0

    .line 171
    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    .line 172
    :cond_3
    const v1, -0xc3bfbd

    goto :goto_2

    .line 173
    :cond_4
    const/4 v0, 0x1

    div-int/lit8 v1, v7, 0x6

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_3
.end method

.method update(II)V
    .locals 2

    .prologue
    .line 149
    iget v0, p0, Lcom/gemini/chat/LiveActivity$AudioMeterView;->smoothLevel:I

    if-le p1, v0, :cond_3

    .line 150
    iget v0, p0, Lcom/gemini/chat/LiveActivity$AudioMeterView;->smoothLevel:I

    mul-int/lit8 v0, v0, 0x2

    mul-int/lit8 v1, p1, 0x3

    add-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x5

    .line 152
    :goto_0
    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    if-nez p1, :cond_0

    const/4 v0, 0x0

    .line 153
    :cond_0
    iget v1, p0, Lcom/gemini/chat/LiveActivity$AudioMeterView;->smoothLevel:I

    if-ne v0, v1, :cond_1

    iget v1, p0, Lcom/gemini/chat/LiveActivity$AudioMeterView;->activeColor:I

    if-eq p2, v1, :cond_2

    .line 154
    :cond_1
    iput v0, p0, Lcom/gemini/chat/LiveActivity$AudioMeterView;->smoothLevel:I

    .line 155
    iput p2, p0, Lcom/gemini/chat/LiveActivity$AudioMeterView;->activeColor:I

    .line 156
    invoke-virtual {p0}, Lcom/gemini/chat/LiveActivity$AudioMeterView;->invalidate()V

    .line 158
    :cond_2
    return-void

    .line 151
    :cond_3
    iget v0, p0, Lcom/gemini/chat/LiveActivity$AudioMeterView;->smoothLevel:I

    mul-int/lit8 v0, v0, 0x3

    add-int/2addr v0, p1

    div-int/lit8 v0, v0, 0x4

    goto :goto_0
.end method
