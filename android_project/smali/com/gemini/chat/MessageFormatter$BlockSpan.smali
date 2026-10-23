.class final Lcom/gemini/chat/MessageFormatter$BlockSpan;
.super Ljava/lang/Object;
.source "MessageFormatter.java"

# interfaces
.implements Landroid/text/style/LineBackgroundSpan;
.implements Landroid/text/style/LeadingMarginSpan;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/MessageFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BlockSpan"
.end annotation


# instance fields
.field private final color:I

.field private final pad:I


# direct methods
.method constructor <init>(II)V
    .locals 0

    .prologue
    .line 373
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 374
    iput p1, p0, Lcom/gemini/chat/MessageFormatter$BlockSpan;->color:I

    .line 375
    iput p2, p0, Lcom/gemini/chat/MessageFormatter$BlockSpan;->pad:I

    .line 376
    return-void
.end method


# virtual methods
.method public drawBackground(Landroid/graphics/Canvas;Landroid/graphics/Paint;IIIIILjava/lang/CharSequence;III)V
    .locals 8

    .prologue
    .line 380
    invoke-virtual {p2}, Landroid/graphics/Paint;->getColor()I

    move-result v6

    .line 381
    invoke-virtual {p2}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v7

    .line 382
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 383
    iget v0, p0, Lcom/gemini/chat/MessageFormatter$BlockSpan;->color:I

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 384
    int-to-float v1, p3

    int-to-float v2, p5

    int-to-float v3, p4

    int-to-float v4, p7

    move-object v0, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 385
    invoke-virtual {p2, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 386
    invoke-virtual {p2, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 387
    return-void
.end method

.method public drawLeadingMargin(Landroid/graphics/Canvas;Landroid/graphics/Paint;IIIIILjava/lang/CharSequence;IIZLandroid/text/Layout;)V
    .locals 0

    .prologue
    .line 395
    return-void
.end method

.method public getLeadingMargin(Z)I
    .locals 1

    .prologue
    .line 390
    iget v0, p0, Lcom/gemini/chat/MessageFormatter$BlockSpan;->pad:I

    return v0
.end method
