.class final Lcom/gemini/chat/ChatActivity$SparkleView;
.super Landroid/view/View;
.source "ChatActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/ChatActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SparkleView"
.end annotation


# instance fields
.field private final pMain:Landroid/graphics/Paint;

.field private final pSub:Landroid/graphics/Paint;

.field private final pathMain:Landroid/graphics/Path;

.field private final pathSub:Landroid/graphics/Path;


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatActivity;)V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 1048
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 1042
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$SparkleView;->pMain:Landroid/graphics/Paint;

    .line 1043
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$SparkleView;->pSub:Landroid/graphics/Paint;

    .line 1044
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$SparkleView;->pathMain:Landroid/graphics/Path;

    .line 1045
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$SparkleView;->pathSub:Landroid/graphics/Path;

    .line 1049
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$SparkleView;->pMain:Landroid/graphics/Paint;

    const v1, -0x754b08

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1050
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$SparkleView;->pMain:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1051
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$SparkleView;->pSub:Landroid/graphics/Paint;

    const v1, -0x7e366b

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1052
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$SparkleView;->pSub:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1053
    return-void
.end method

.method private static buildStar(Landroid/graphics/Path;FFF)V
    .locals 4

    .prologue
    .line 1056
    invoke-virtual {p0}, Landroid/graphics/Path;->reset()V

    .line 1057
    const v0, 0x3e75c28f    # 0.24f

    mul-float/2addr v0, p3

    .line 1058
    sub-float v1, p2, p3

    invoke-virtual {p0, p1, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1059
    add-float v1, p1, v0

    sub-float v2, p2, v0

    add-float v3, p1, p3

    invoke-virtual {p0, v1, v2, v3, p2}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 1060
    add-float v1, p1, v0

    add-float v2, p2, v0

    add-float v3, p2, p3

    invoke-virtual {p0, v1, v2, p1, v3}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 1061
    sub-float v1, p1, v0

    add-float v2, p2, v0

    sub-float v3, p1, p3

    invoke-virtual {p0, v1, v2, v3, p2}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 1062
    sub-float v1, p1, v0

    sub-float v0, p2, v0

    sub-float v2, p2, p3

    invoke-virtual {p0, v1, v0, p1, v2}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 1063
    invoke-virtual {p0}, Landroid/graphics/Path;->close()V

    .line 1064
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .prologue
    .line 1075
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$SparkleView;->pathMain:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$SparkleView;->pMain:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1076
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$SparkleView;->pathSub:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$SparkleView;->pSub:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1077
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 5

    .prologue
    .line 1068
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    .line 1069
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$SparkleView;->pathMain:Landroid/graphics/Path;

    int-to-float v2, p1

    const v3, 0x3ee147ae    # 0.44f

    mul-float/2addr v2, v3

    int-to-float v3, p2

    const v4, 0x3f0a3d71    # 0.54f

    mul-float/2addr v3, v4

    const v4, 0x3ec28f5c    # 0.38f

    mul-float/2addr v4, v0

    invoke-static {v1, v2, v3, v4}, Lcom/gemini/chat/ChatActivity$SparkleView;->buildStar(Landroid/graphics/Path;FFF)V

    .line 1070
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$SparkleView;->pathSub:Landroid/graphics/Path;

    int-to-float v2, p1

    const v3, 0x3f47ae14    # 0.78f

    mul-float/2addr v2, v3

    int-to-float v3, p2

    const v4, 0x3e75c28f    # 0.24f

    mul-float/2addr v3, v4

    const v4, 0x3e23d70a    # 0.16f

    mul-float/2addr v0, v4

    invoke-static {v1, v2, v3, v0}, Lcom/gemini/chat/ChatActivity$SparkleView;->buildStar(Landroid/graphics/Path;FFF)V

    .line 1071
    return-void
.end method
