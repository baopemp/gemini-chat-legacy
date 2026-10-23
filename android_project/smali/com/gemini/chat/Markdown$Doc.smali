.class public final Lcom/gemini/chat/Markdown$Doc;
.super Ljava/lang/Object;
.source "Markdown.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/Markdown;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Doc"
.end annotation


# instance fields
.field public final codeBlocks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field gridMaxChars:I

.field lastGapAt:I

.field public final spans:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/gemini/chat/Markdown$Span;",
            ">;"
        }
    .end annotation
.end field

.field public final text:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->codeBlocks:Ljava/util/ArrayList;

    .line 43
    const/4 v0, -0x1

    iput v0, p0, Lcom/gemini/chat/Markdown$Doc;->lastGapAt:I

    .line 44
    const/16 v0, 0x1e

    iput v0, p0, Lcom/gemini/chat/Markdown$Doc;->gridMaxChars:I

    return-void
.end method


# virtual methods
.method gap()V
    .locals 3

    .prologue
    const/16 v2, 0xa

    .line 60
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 61
    if-eqz v0, :cond_0

    iget v1, p0, Lcom/gemini/chat/Markdown$Doc;->lastGapAt:I

    if-ne v1, v0, :cond_1

    .line 67
    :cond_0
    :goto_0
    return-void

    .line 62
    :cond_1
    iget-object v1, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v0

    if-eq v0, v2, :cond_2

    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 63
    :cond_2
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 64
    iget-object v1, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 65
    add-int/lit8 v1, v0, 0x1

    const/16 v2, 0x16

    invoke-virtual {p0, v0, v1, v2}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 66
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    iput v0, p0, Lcom/gemini/chat/Markdown$Doc;->lastGapAt:I

    goto :goto_0
.end method

.method len()I
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    return v0
.end method

.method span(III)V
    .locals 6

    .prologue
    .line 47
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Doc;->span(IIIILjava/lang/String;)V

    .line 48
    return-void
.end method

.method span(IIIILjava/lang/String;)V
    .locals 7

    .prologue
    .line 51
    if-le p2, p1, :cond_0

    iget-object v6, p0, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    new-instance v0, Lcom/gemini/chat/Markdown$Span;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Span;-><init>(IIIILjava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    :cond_0
    return-void
.end method
