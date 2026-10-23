.class final Lcom/gemini/chat/MessageFormatter$QuoteBarSpan;
.super Ljava/lang/Object;
.source "MessageFormatter.java"

# interfaces
.implements Landroid/text/style/LeadingMarginSpan;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/MessageFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "QuoteBarSpan"
.end annotation


# instance fields
.field private final color:I

.field private final gap:I

.field private final width:I


# direct methods
.method constructor <init>(III)V
    .locals 0

    .prologue
    .line 424
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 425
    iput p1, p0, Lcom/gemini/chat/MessageFormatter$QuoteBarSpan;->color:I

    .line 426
    iput p2, p0, Lcom/gemini/chat/MessageFormatter$QuoteBarSpan;->width:I

    .line 427
    iput p3, p0, Lcom/gemini/chat/MessageFormatter$QuoteBarSpan;->gap:I

    .line 428
    return-void
.end method


# virtual methods
.method public drawLeadingMargin(Landroid/graphics/Canvas;Landroid/graphics/Paint;IIIIILjava/lang/CharSequence;IIZLandroid/text/Layout;)V
    .locals 8

    .prologue
    .line 436
    invoke-virtual {p2}, Landroid/graphics/Paint;->getColor()I

    move-result v6

    .line 437
    invoke-virtual {p2}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v7

    .line 438
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 439
    iget v0, p0, Lcom/gemini/chat/MessageFormatter$QuoteBarSpan;->color:I

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 440
    iget v0, p0, Lcom/gemini/chat/MessageFormatter$QuoteBarSpan;->width:I

    mul-int/2addr v0, p4

    add-int/2addr v0, p3

    .line 441
    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    int-to-float v2, p5

    invoke-static {p3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-float v3, v0

    int-to-float v4, p7

    move-object v0, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 442
    invoke-virtual {p2, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 443
    invoke-virtual {p2, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 444
    return-void
.end method

.method public getLeadingMargin(Z)I
    .locals 2

    .prologue
    .line 431
    iget v0, p0, Lcom/gemini/chat/MessageFormatter$QuoteBarSpan;->width:I

    iget v1, p0, Lcom/gemini/chat/MessageFormatter$QuoteBarSpan;->gap:I

    add-int/2addr v0, v1

    return v0
.end method
