.class final Lcom/gemini/chat/MessageFormatter$RoleBar;
.super Landroid/graphics/drawable/Drawable;
.source "MessageFormatter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/MessageFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RoleBar"
.end annotation


# instance fields
.field private final paint:Landroid/graphics/Paint;

.field private final width:I


# direct methods
.method constructor <init>(II)V
    .locals 1

    .prologue
    .line 419
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 416
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/MessageFormatter$RoleBar;->paint:Landroid/graphics/Paint;

    .line 420
    iget-object v0, p0, Lcom/gemini/chat/MessageFormatter$RoleBar;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 421
    iput p2, p0, Lcom/gemini/chat/MessageFormatter$RoleBar;->width:I

    .line 422
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 6

    .prologue
    .line 425
    invoke-virtual {p0}, Lcom/gemini/chat/MessageFormatter$RoleBar;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 426
    iget v1, v0, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget v2, v0, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    iget v3, v0, Landroid/graphics/Rect;->left:I

    iget v4, p0, Lcom/gemini/chat/MessageFormatter$RoleBar;->width:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v0

    iget-object v5, p0, Lcom/gemini/chat/MessageFormatter$RoleBar;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 427
    return-void
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 438
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 1

    .prologue
    .line 430
    iget-object v0, p0, Lcom/gemini/chat/MessageFormatter$RoleBar;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 431
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .prologue
    .line 434
    iget-object v0, p0, Lcom/gemini/chat/MessageFormatter$RoleBar;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 435
    return-void
.end method
