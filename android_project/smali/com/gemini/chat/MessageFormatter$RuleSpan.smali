.class final Lcom/gemini/chat/MessageFormatter$RuleSpan;
.super Ljava/lang/Object;
.source "MessageFormatter.java"

# interfaces
.implements Landroid/text/style/LineBackgroundSpan;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/MessageFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RuleSpan"
.end annotation


# instance fields
.field private final color:I

.field private final thickness:I


# direct methods
.method constructor <init>(II)V
    .locals 0

    .prologue
    .line 481
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 482
    iput p1, p0, Lcom/gemini/chat/MessageFormatter$RuleSpan;->color:I

    .line 483
    iput p2, p0, Lcom/gemini/chat/MessageFormatter$RuleSpan;->thickness:I

    .line 484
    return-void
.end method


# virtual methods
.method public drawBackground(Landroid/graphics/Canvas;Landroid/graphics/Paint;IIIIILjava/lang/CharSequence;III)V
    .locals 8

    .prologue
    .line 488
    invoke-virtual {p2}, Landroid/graphics/Paint;->getColor()I

    move-result v6

    .line 489
    invoke-virtual {p2}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v7

    .line 490
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 491
    iget v0, p0, Lcom/gemini/chat/MessageFormatter$RuleSpan;->color:I

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 492
    add-int v0, p5, p7

    div-int/lit8 v0, v0, 0x2

    .line 493
    int-to-float v1, p3

    int-to-float v2, v0

    int-to-float v3, p4

    iget v4, p0, Lcom/gemini/chat/MessageFormatter$RuleSpan;->thickness:I

    add-int/2addr v0, v4

    int-to-float v4, v0

    move-object v0, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 494
    invoke-virtual {p2, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 495
    invoke-virtual {p2, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 496
    return-void
.end method
