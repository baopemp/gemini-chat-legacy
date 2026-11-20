.class public final Lcom/gemini/chat/MessageFormatter;
.super Ljava/lang/Object;
.source "MessageFormatter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gemini/chat/MessageFormatter$BlockSpan;,
        Lcom/gemini/chat/MessageFormatter$QuoteBarSpan;,
        Lcom/gemini/chat/MessageFormatter$RuleSpan;,
        Lcom/gemini/chat/MessageFormatter$RoleBar;
    }
.end annotation


# static fields
.field static final ACCENT:I = -0x754b08

.field static final ACCENT_MODEL:I = -0x7e366b

.field private static final ATTR_SELECTABLE_ITEM_BACKGROUND:I = 0x101030e

.field static final BLOCK_BG:I = -0xe1e0df

.field static final BLOCK_BORDER:I = -0xa09c98

.field static final BLOCK_FG:I = -0x171513

.field static final CODE_BG:I = -0xd1cecc

.field static final CODE_FG:I = -0x2299d

.field static final EMOJI_FG:I = -0x951d3

.field static final HEADER_META:I = -0x655f5a

.field static final QUOTE_BAR:I = -0xa09c98

.field static final QUOTE_FG:I = -0x423e3a

.field static final ROLE_MODEL:I = -0x7e366b

.field static final ROLE_SYSTEM:I = -0xd747e

.field static final ROLE_USER:I = -0x754b08

.field static final RULE:I = -0xc3bfbd

.field static final TABLE_SCALE:F = 0.85f

.field static final TEXT_HEADING:I = -0x1

.field static final TEXT_MODEL:I = -0x333334

.field static final TEXT_MUTED:I = -0x655f5a

.field static final TEXT_SIZES:[I

.field static final TEXT_SIZE_LABELS:[Ljava/lang/String;

.field static TEXT_SP:F = 0.0f

.field static final TEXT_SYSTEM:I = -0xd747e

.field static final TEXT_USER:I = -0x1

.field static final THUMB_DP:I = 0x78

.field private static final cachedDate:Ljava/util/Date;

.field private static cachedGridChars:I

.field private static cachedGridDensity:F

.field private static cachedGridScaled:F

.field private static cachedGridSp:F

.field private static cachedGridWidth:I

.field private static cachedMeasure:Landroid/graphics/Paint;

.field private static cachedMeasureSize:F

.field private static cachedMeasureTask:Landroid/graphics/Paint;

.field private static cachedTsFmt:Ljava/text/SimpleDateFormat;

.field private static cachedTsLocale:Ljava/util/Locale;

.field private static cachedTsTz:Ljava/util/TimeZone;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x4

    const/high16 v3, -0x40800000    # -1.0f

    .line 73
    const/high16 v0, 0x41600000    # 14.0f

    sput v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    .line 74
    new-array v0, v4, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Small"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Normal"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Large"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Extra large"

    aput-object v2, v0, v1

    sput-object v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SIZE_LABELS:[Ljava/lang/String;

    .line 75
    new-array v0, v4, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SIZES:[I

    .line 89
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    sput-object v0, Lcom/gemini/chat/MessageFormatter;->cachedDate:Ljava/util/Date;

    .line 91
    const/4 v0, -0x1

    sput v0, Lcom/gemini/chat/MessageFormatter;->cachedGridWidth:I

    const/16 v0, 0x1e

    sput v0, Lcom/gemini/chat/MessageFormatter;->cachedGridChars:I

    .line 92
    sput v3, Lcom/gemini/chat/MessageFormatter;->cachedGridDensity:F

    sput v3, Lcom/gemini/chat/MessageFormatter;->cachedGridScaled:F

    sput v3, Lcom/gemini/chat/MessageFormatter;->cachedGridSp:F

    .line 94
    sput v3, Lcom/gemini/chat/MessageFormatter;->cachedMeasureSize:F

    return-void

    .line 75
    nop

    :array_0
    .array-data 4
        0xc
        0xe
        0x10
        0x12
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    return-void
.end method

.method static appendDoc(Landroid/text/SpannableStringBuilder;Lcom/gemini/chat/Markdown$Doc;FF)V
    .locals 13

    .prologue
    .line 244
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    .line 245
    iget-object v0, p1, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 246
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 247
    const/high16 v0, 0x41600000    # 14.0f

    mul-float/2addr v0, p2

    const/high16 v3, 0x3f000000    # 0.5f

    add-float/2addr v0, v3

    float-to-int v7, v0

    .line 248
    const/4 v0, 0x0

    move v5, v0

    :goto_0
    iget-object v0, p1, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v5, v0, :cond_b

    .line 249
    iget-object v0, p1, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gemini/chat/Markdown$Span;

    .line 250
    iget v3, v0, Lcom/gemini/chat/Markdown$Span;->start:I

    add-int v8, v6, v3

    iget v3, v0, Lcom/gemini/chat/Markdown$Span;->end:I

    add-int v9, v6, v3

    .line 251
    iget v3, v0, Lcom/gemini/chat/Markdown$Span;->type:I

    packed-switch v3, :pswitch_data_0

    .line 248
    :goto_1
    add-int/lit8 v0, v5, 0x1

    move v5, v0

    goto :goto_0

    .line 253
    :pswitch_0
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v3, 0x1

    invoke-direct {v0, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 256
    :pswitch_1
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v3, 0x2

    invoke-direct {v0, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 259
    :pswitch_2
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v3, 0x3

    invoke-direct {v0, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 262
    :pswitch_3
    new-instance v0, Landroid/text/style/StrikethroughSpan;

    invoke-direct {v0}, Landroid/text/style/StrikethroughSpan;-><init>()V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 265
    :pswitch_4
    new-instance v0, Landroid/text/style/TypefaceSpan;

    const-string v3, "monospace"

    invoke-direct {v0, v3}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 266
    new-instance v0, Landroid/text/style/BackgroundColorSpan;

    const v3, -0xd1cecc

    invoke-direct {v0, v3}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 267
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v3, -0x2299d

    invoke-direct {v0, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 270
    :pswitch_5
    new-instance v3, Landroid/text/style/URLSpan;

    iget-object v0, v0, Lcom/gemini/chat/Markdown$Span;->arg:Ljava/lang/String;

    invoke-direct {v3, v0}, Landroid/text/style/URLSpan;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v3, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 273
    :pswitch_6
    new-instance v3, Landroid/text/style/URLSpan;

    iget-object v0, v0, Lcom/gemini/chat/Markdown$Span;->arg:Ljava/lang/String;

    invoke-direct {v3, v0}, Landroid/text/style/URLSpan;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v3, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 274
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v3, 0x2

    invoke-direct {v0, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 277
    :pswitch_7
    iget v3, v0, Lcom/gemini/chat/Markdown$Span;->level:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    const v3, 0x3fb9999a    # 1.45f

    .line 278
    :goto_2
    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v4, v3, v4

    if-eqz v4, :cond_0

    new-instance v4, Landroid/text/style/RelativeSizeSpan;

    invoke-direct {v4, v3}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-static {p0, v4, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 279
    :cond_0
    new-instance v3, Landroid/text/style/StyleSpan;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v3, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 280
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    iget v0, v0, Lcom/gemini/chat/Markdown$Span;->level:I

    const/4 v4, 0x3

    if-gt v0, v4, :cond_4

    const/4 v0, -0x1

    :goto_3
    invoke-direct {v3, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v3, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 277
    :cond_1
    iget v3, v0, Lcom/gemini/chat/Markdown$Span;->level:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_2

    const v3, 0x3fa3d70a    # 1.28f

    goto :goto_2

    :cond_2
    iget v3, v0, Lcom/gemini/chat/Markdown$Span;->level:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_3

    const v3, 0x3f8f5c29    # 1.12f

    goto :goto_2

    :cond_3
    const/high16 v3, 0x3f800000    # 1.0f

    goto :goto_2

    .line 280
    :cond_4
    const v0, -0x333334

    goto :goto_3

    .line 284
    :pswitch_8
    new-instance v0, Lcom/gemini/chat/MessageFormatter$BlockSpan;

    const v3, -0xe1e0df

    const v4, -0xa09c98

    const/4 v10, 0x1

    const/high16 v11, 0x40000000    # 2.0f

    mul-float/2addr v11, p2

    const/high16 v12, 0x3f000000    # 0.5f

    add-float/2addr v11, v12

    float-to-int v11, v11

    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v10

    const/high16 v11, 0x41200000    # 10.0f

    mul-float/2addr v11, p2

    const/high16 v12, 0x3f000000    # 0.5f

    add-float/2addr v11, v12

    float-to-int v11, v11

    invoke-direct {v0, v3, v4, v10, v11}, Lcom/gemini/chat/MessageFormatter$BlockSpan;-><init>(IIII)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 286
    new-instance v0, Landroid/text/style/TypefaceSpan;

    const-string v3, "monospace"

    invoke-direct {v0, v3}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 287
    new-instance v0, Landroid/text/style/RelativeSizeSpan;

    const v3, 0x3f6147ae    # 0.88f

    invoke-direct {v0, v3}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 288
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v3, -0x171513

    invoke-direct {v0, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 291
    :pswitch_9
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v3, -0x754b08

    invoke-direct {v0, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 292
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v3, 0x1

    invoke-direct {v0, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 293
    new-instance v0, Landroid/text/style/RelativeSizeSpan;

    const v3, 0x3f51eb85    # 0.82f

    invoke-direct {v0, v3}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 296
    :pswitch_a
    new-instance v0, Lcom/gemini/chat/MessageFormatter$QuoteBarSpan;

    const v3, -0xa09c98

    const/high16 v4, 0x40400000    # 3.0f

    mul-float/2addr v4, p2

    const/high16 v10, 0x3f000000    # 0.5f

    add-float/2addr v4, v10

    float-to-int v4, v4

    const/high16 v10, 0x41200000    # 10.0f

    mul-float/2addr v10, p2

    const/high16 v11, 0x3f000000    # 0.5f

    add-float/2addr v10, v11

    float-to-int v10, v10

    invoke-direct {v0, v3, v4, v10}, Lcom/gemini/chat/MessageFormatter$QuoteBarSpan;-><init>(III)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 297
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v3, -0x423e3a

    invoke-direct {v0, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 301
    :pswitch_b
    if-nez v2, :cond_7

    .line 302
    sget v1, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    mul-float v1, v1, p3

    .line 303
    sget-object v2, Lcom/gemini/chat/MessageFormatter;->cachedMeasure:Landroid/graphics/Paint;

    if-eqz v2, :cond_5

    sget v2, Lcom/gemini/chat/MessageFormatter;->cachedMeasureSize:F

    cmpl-float v2, v2, v1

    if-eqz v2, :cond_6

    .line 304
    :cond_5
    new-instance v2, Landroid/graphics/Paint;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v2, Lcom/gemini/chat/MessageFormatter;->cachedMeasure:Landroid/graphics/Paint;

    .line 305
    sget-object v2, Lcom/gemini/chat/MessageFormatter;->cachedMeasure:Landroid/graphics/Paint;

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 306
    sget-object v2, Lcom/gemini/chat/MessageFormatter;->cachedMeasure:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 307
    new-instance v2, Landroid/graphics/Paint;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v2, Lcom/gemini/chat/MessageFormatter;->cachedMeasureTask:Landroid/graphics/Paint;

    .line 308
    sget-object v2, Lcom/gemini/chat/MessageFormatter;->cachedMeasureTask:Landroid/graphics/Paint;

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 309
    sget-object v2, Lcom/gemini/chat/MessageFormatter;->cachedMeasureTask:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 310
    sput v1, Lcom/gemini/chat/MessageFormatter;->cachedMeasureSize:F

    .line 312
    :cond_6
    sget-object v2, Lcom/gemini/chat/MessageFormatter;->cachedMeasure:Landroid/graphics/Paint;

    .line 313
    sget-object v1, Lcom/gemini/chat/MessageFormatter;->cachedMeasureTask:Landroid/graphics/Paint;

    .line 315
    :cond_7
    iget v3, v0, Lcom/gemini/chat/Markdown$Span;->level:I

    mul-int v4, v3, v7

    .line 316
    iget-object v3, v0, Lcom/gemini/chat/Markdown$Span;->arg:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    .line 317
    const-string v3, "["

    invoke-virtual {v10, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    move-object v3, v1

    .line 318
    :goto_4
    invoke-virtual {v3, v10}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    const-string v10, " "

    invoke-virtual {v2, v10}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v10

    add-float/2addr v3, v10

    const/high16 v10, 0x3f000000    # 0.5f

    add-float/2addr v3, v10

    float-to-int v3, v3

    add-int/2addr v3, v4

    .line 319
    new-instance v10, Landroid/text/style/LeadingMarginSpan$Standard;

    iget v0, v0, Lcom/gemini/chat/Markdown$Span;->type:I

    const/16 v11, 0xb

    if-ne v0, v11, :cond_9

    move v0, v4

    :goto_5
    invoke-direct {v10, v0, v3}, Landroid/text/style/LeadingMarginSpan$Standard;-><init>(II)V

    invoke-static {p0, v10, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    :cond_8
    move-object v3, v2

    .line 317
    goto :goto_4

    :cond_9
    move v0, v3

    .line 319
    goto :goto_5

    .line 323
    :pswitch_c
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    const v4, -0x754b08

    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v3, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 324
    iget v0, v0, Lcom/gemini/chat/Markdown$Span;->level:I

    const/4 v3, 0x1

    if-ne v0, v3, :cond_a

    new-instance v0, Landroid/text/style/TypefaceSpan;

    const-string v3, "monospace"

    invoke-direct {v0, v3}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 325
    :cond_a
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v3, 0x1

    invoke-direct {v0, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 328
    :pswitch_d
    new-instance v0, Landroid/text/style/StrikethroughSpan;

    invoke-direct {v0}, Landroid/text/style/StrikethroughSpan;-><init>()V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 329
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v3, -0x655f5a

    invoke-direct {v0, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 332
    :pswitch_e
    new-instance v0, Lcom/gemini/chat/MessageFormatter$RuleSpan;

    const v3, -0xc3bfbd

    const/4 v4, 0x1

    const/high16 v10, 0x3f000000    # 0.5f

    add-float/2addr v10, p2

    float-to-int v10, v10

    invoke-static {v4, v10}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-direct {v0, v3, v4}, Lcom/gemini/chat/MessageFormatter$RuleSpan;-><init>(II)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 335
    :pswitch_f
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v3, -0x951d3

    invoke-direct {v0, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 338
    :pswitch_10
    new-instance v0, Landroid/text/style/TypefaceSpan;

    const-string v3, "monospace"

    invoke-direct {v0, v3}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 339
    new-instance v0, Landroid/text/style/RelativeSizeSpan;

    const v3, 0x3f59999a    # 0.85f

    invoke-direct {v0, v3}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 342
    :pswitch_11
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v3, 0x1

    invoke-direct {v0, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 343
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const/4 v3, -0x1

    invoke-direct {v0, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 346
    :pswitch_12
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v3, 0x1

    invoke-direct {v0, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 347
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v3, -0x754b08

    invoke-direct {v0, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 351
    :pswitch_13
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v3, -0x655f5a

    invoke-direct {v0, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 354
    :pswitch_14
    new-instance v0, Landroid/text/style/RelativeSizeSpan;

    const v3, 0x3ee66666    # 0.45f

    invoke-direct {v0, v3}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 360
    :cond_b
    return-void

    .line 251
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_13
        :pswitch_14
        :pswitch_6
    .end packed-switch
.end method

.method private static appendHeader(Landroid/text/SpannableStringBuilder;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 112
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    .line 114
    const/4 v0, 0x0

    .line 115
    const-string v1, "user"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 116
    const-wide/16 v0, 0x0

    cmp-long v0, p3, v0

    if-lez v0, :cond_1

    .line 117
    :goto_0
    const-string v1, "User"

    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " ("

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p3, p4}, Lcom/gemini/chat/MessageFormatter;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "):"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 125
    :goto_1
    invoke-virtual {p0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 126
    new-instance v1, Landroid/text/style/StyleSpan;

    invoke-direct {v1, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    invoke-static {p0, v1, v2, v3}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 127
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    invoke-static {p1}, Lcom/gemini/chat/MessageFormatter;->roleColor(Ljava/lang/String;)I

    move-result v3

    invoke-direct {v1, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    invoke-static {p0, v1, v2, v3}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 128
    if-eqz v0, :cond_0

    .line 129
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    .line 130
    invoke-virtual {p0, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 131
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v4, :cond_5

    .line 132
    new-instance v0, Landroid/text/style/RelativeSizeSpan;

    const v2, 0x3f6147ae    # 0.88f

    invoke-direct {v0, v2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    invoke-static {p0, v0, v1, v2}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 133
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v2, -0x655f5a

    invoke-direct {v0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    invoke-static {p0, v0, v1, v2}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 139
    :cond_0
    :goto_2
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 140
    return-void

    .line 116
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    goto :goto_0

    .line 119
    :cond_2
    const-string v1, "model"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 120
    const-string v1, "Model"

    .line 121
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_3

    const-string v0, "null"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " ("

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "):"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    :cond_3
    const-string v0, ":"

    goto/16 :goto_1

    .line 123
    :cond_4
    const-string v1, "System:"

    goto/16 :goto_1

    .line 135
    :cond_5
    new-instance v0, Landroid/text/style/StyleSpan;

    invoke-direct {v0, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    invoke-static {p0, v0, v1, v2}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 136
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    invoke-static {p1}, Lcom/gemini/chat/MessageFormatter;->roleColor(Ljava/lang/String;)I

    move-result v2

    invoke-direct {v0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    invoke-static {p0, v0, v1, v2}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_2
.end method

.method public static applyPrefs(Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 79
    const-string v0, "GeminiPrefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "text_size"

    const/16 v2, 0xe

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    int-to-float v0, v0

    sput v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    .line 80
    return-void
.end method

.method public static format(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/ArrayList;)Ljava/lang/CharSequence;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/CharSequence;"
        }
    .end annotation

    .prologue
    .line 148
    invoke-static {p0}, Lcom/gemini/chat/EmojiMap;->ensureLoaded(Landroid/content/Context;)V

    .line 149
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 150
    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    .line 151
    iget v2, v0, Landroid/util/DisplayMetrics;->scaledDensity:F

    .line 152
    new-instance v3, Landroid/text/SpannableStringBuilder;

    invoke-direct {v3}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 154
    invoke-static {v3, p1, p2, p4, p5}, Lcom/gemini/chat/MessageFormatter;->appendHeader(Landroid/text/SpannableStringBuilder;Ljava/lang/String;Ljava/lang/String;J)V

    .line 157
    const-string v4, "user"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    if-eqz p2, :cond_0

    const-string v4, "data:image/"

    invoke-virtual {p2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 158
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v4

    .line 159
    const/high16 v5, 0x42f00000    # 120.0f

    mul-float/2addr v5, v1

    const/high16 v6, 0x3f000000    # 0.5f

    add-float/2addr v5, v6

    float-to-int v5, v5

    invoke-static {p2, v5}, Lcom/gemini/chat/Thumbnail;->fromDataUri(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 160
    if-eqz v5, :cond_3

    .line 161
    const v6, 0xfffc

    invoke-virtual {v3, v6}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 162
    new-instance v6, Landroid/text/style/ImageSpan;

    const/4 v7, 0x0

    invoke-direct {v6, p0, v5, v7}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;I)V

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v5

    invoke-static {v3, v6, v4, v5}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 168
    :goto_0
    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 172
    :cond_0
    const-string v4, "user"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "model"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 173
    :cond_1
    invoke-static {v0}, Lcom/gemini/chat/MessageFormatter;->gridChars(Landroid/util/DisplayMetrics;)I

    move-result v0

    invoke-static {p3, v0}, Lcom/gemini/chat/Markdown;->parse(Ljava/lang/String;I)Lcom/gemini/chat/Markdown$Doc;

    move-result-object v0

    .line 174
    :goto_1
    if-eqz p6, :cond_2

    iget-object v4, v0, Lcom/gemini/chat/Markdown$Doc;->codeBlocks:Ljava/util/ArrayList;

    invoke-virtual {p6, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 175
    :cond_2
    invoke-static {v3, v0, v1, v2}, Lcom/gemini/chat/MessageFormatter;->appendDoc(Landroid/text/SpannableStringBuilder;Lcom/gemini/chat/Markdown$Doc;FF)V

    .line 176
    return-object v3

    .line 164
    :cond_3
    const-string v5, "[Image attached]"

    invoke-virtual {v3, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 165
    new-instance v5, Landroid/text/style/StyleSpan;

    const/4 v6, 0x2

    invoke-direct {v5, v6}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    invoke-static {v3, v5, v4, v6}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 166
    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    const v6, -0x655f5a

    invoke-direct {v5, v6}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    invoke-static {v3, v5, v4, v6}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_0

    .line 173
    :cond_4
    invoke-static {p3}, Lcom/gemini/chat/Markdown;->plain(Ljava/lang/String;)Lcom/gemini/chat/Markdown$Doc;

    move-result-object v0

    goto :goto_1
.end method

.method public static formatBody(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 4

    .prologue
    .line 211
    invoke-static {p0}, Lcom/gemini/chat/EmojiMap;->ensureLoaded(Landroid/content/Context;)V

    .line 212
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 213
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 214
    if-nez p1, :cond_0

    const-string p1, ""

    :cond_0
    invoke-static {v0}, Lcom/gemini/chat/MessageFormatter;->gridChars(Landroid/util/DisplayMetrics;)I

    move-result v2

    invoke-static {p1, v2}, Lcom/gemini/chat/Markdown;->parse(Ljava/lang/String;I)Lcom/gemini/chat/Markdown$Doc;

    move-result-object v2

    iget v3, v0, Landroid/util/DisplayMetrics;->density:F

    iget v0, v0, Landroid/util/DisplayMetrics;->scaledDensity:F

    invoke-static {v1, v2, v3, v0}, Lcom/gemini/chat/MessageFormatter;->appendDoc(Landroid/text/SpannableStringBuilder;Lcom/gemini/chat/Markdown$Doc;FF)V

    .line 215
    return-object v1
.end method

.method public static formatStreaming(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 7

    .prologue
    .line 181
    const-string v1, "model"

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v0 .. v6}, Lcom/gemini/chat/MessageFormatter;->format(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/ArrayList;)Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Landroid/text/SpannableStringBuilder;

    .line 182
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    .line 183
    const-string v2, " \u258e"

    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 184
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    const v3, -0x7e366b

    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    invoke-static {v0, v2, v1, v3}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 185
    return-object v0
.end method

.method public static formatThinking(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 220
    const/4 v0, 0x3

    invoke-static {p0, p1, p2, v0}, Lcom/gemini/chat/MessageFormatter;->formatWaiting(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method private static declared-synchronized formatTimestamp(J)Ljava/lang/String;
    .locals 6

    .prologue
    .line 98
    const-class v1, Lcom/gemini/chat/MessageFormatter;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    .line 99
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v2

    .line 100
    sget-object v3, Lcom/gemini/chat/MessageFormatter;->cachedTsFmt:Ljava/text/SimpleDateFormat;

    if-eqz v3, :cond_0

    sget-object v3, Lcom/gemini/chat/MessageFormatter;->cachedTsLocale:Ljava/util/Locale;

    invoke-virtual {v0, v3}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    sget-object v3, Lcom/gemini/chat/MessageFormatter;->cachedTsTz:Ljava/util/TimeZone;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 101
    :cond_0
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "HH:mm:ss, dd/MM/yyyy"

    invoke-direct {v3, v4, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v3, Lcom/gemini/chat/MessageFormatter;->cachedTsFmt:Ljava/text/SimpleDateFormat;

    .line 102
    sget-object v3, Lcom/gemini/chat/MessageFormatter;->cachedTsFmt:Ljava/text/SimpleDateFormat;

    invoke-virtual {v3, v2}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 103
    sput-object v0, Lcom/gemini/chat/MessageFormatter;->cachedTsLocale:Ljava/util/Locale;

    .line 104
    sput-object v2, Lcom/gemini/chat/MessageFormatter;->cachedTsTz:Ljava/util/TimeZone;

    .line 106
    :cond_1
    sget-object v0, Lcom/gemini/chat/MessageFormatter;->cachedDate:Ljava/util/Date;

    invoke-virtual {v0, p0, p1}, Ljava/util/Date;->setTime(J)V

    .line 107
    sget-object v0, Lcom/gemini/chat/MessageFormatter;->cachedTsFmt:Ljava/text/SimpleDateFormat;

    sget-object v2, Lcom/gemini/chat/MessageFormatter;->cachedDate:Ljava/util/Date;

    invoke-virtual {v0, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 98
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static formatWaiting(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/CharSequence;
    .locals 6

    .prologue
    .line 224
    invoke-static {p0}, Lcom/gemini/chat/EmojiMap;->ensureLoaded(Landroid/content/Context;)V

    .line 225
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 226
    new-instance v2, Landroid/text/SpannableStringBuilder;

    invoke-direct {v2}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 227
    const-string v0, "model"

    const-wide/16 v4, 0x0

    invoke-static {v2, v0, p1, v4, v5}, Lcom/gemini/chat/MessageFormatter;->appendHeader(Landroid/text/SpannableStringBuilder;Ljava/lang/String;Ljava/lang/String;J)V

    .line 228
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    .line 229
    const/4 v0, 0x1

    const/4 v4, 0x3

    invoke-static {v4, p3}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 230
    const-string v0, "Thinking"

    invoke-virtual {v2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 231
    const/4 v0, 0x0

    :goto_0
    if-ge v0, v4, :cond_0

    const/16 v5, 0x2e

    invoke-virtual {v2, v5}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 232
    :cond_0
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v4, 0x2

    invoke-direct {v0, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v4

    invoke-static {v2, v0, v3, v4}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 233
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v4, -0x7e366b

    invoke-direct {v0, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v4

    invoke-static {v2, v0, v3, v4}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 234
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 235
    const/16 v0, 0xa

    invoke-virtual {v2, v0}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 236
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    .line 237
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1}, Lcom/gemini/chat/MessageFormatter;->gridChars(Landroid/util/DisplayMetrics;)I

    move-result v4

    invoke-static {v3, v4}, Lcom/gemini/chat/Markdown;->parse(Ljava/lang/String;I)Lcom/gemini/chat/Markdown$Doc;

    move-result-object v3

    iget v4, v1, Landroid/util/DisplayMetrics;->density:F

    iget v1, v1, Landroid/util/DisplayMetrics;->scaledDensity:F

    invoke-static {v2, v3, v4, v1}, Lcom/gemini/chat/MessageFormatter;->appendDoc(Landroid/text/SpannableStringBuilder;Lcom/gemini/chat/Markdown$Doc;FF)V

    .line 238
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    const v3, -0x655f5a

    invoke-direct {v1, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    invoke-static {v2, v1, v0, v3}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 240
    :cond_1
    return-object v2
.end method

.method static gridChars(Landroid/util/DisplayMetrics;)I
    .locals 4

    .prologue
    .line 190
    iget v0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    sget v1, Lcom/gemini/chat/MessageFormatter;->cachedGridWidth:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Landroid/util/DisplayMetrics;->density:F

    sget v1, Lcom/gemini/chat/MessageFormatter;->cachedGridDensity:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget v0, p0, Landroid/util/DisplayMetrics;->scaledDensity:F

    sget v1, Lcom/gemini/chat/MessageFormatter;->cachedGridScaled:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    sget v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    sget v1, Lcom/gemini/chat/MessageFormatter;->cachedGridSp:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 192
    sget v0, Lcom/gemini/chat/MessageFormatter;->cachedGridChars:I

    .line 204
    :goto_0
    return v0

    .line 194
    :cond_0
    iget v0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v0, v0

    const/high16 v1, 0x42300000    # 44.0f

    iget v2, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    .line 195
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 196
    sget-object v2, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 197
    sget v2, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    const v3, 0x3f59999a    # 0.85f

    mul-float/2addr v2, v3

    iget v3, p0, Landroid/util/DisplayMetrics;->scaledDensity:F

    mul-float/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 198
    const-string v2, "0"

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    .line 199
    const/4 v2, 0x0

    cmpl-float v2, v1, v2

    if-lez v2, :cond_1

    const/16 v2, 0xc

    div-float/2addr v0, v1

    float-to-int v0, v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    :goto_1
    sput v0, Lcom/gemini/chat/MessageFormatter;->cachedGridChars:I

    .line 200
    iget v0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    sput v0, Lcom/gemini/chat/MessageFormatter;->cachedGridWidth:I

    .line 201
    iget v0, p0, Landroid/util/DisplayMetrics;->density:F

    sput v0, Lcom/gemini/chat/MessageFormatter;->cachedGridDensity:F

    .line 202
    iget v0, p0, Landroid/util/DisplayMetrics;->scaledDensity:F

    sput v0, Lcom/gemini/chat/MessageFormatter;->cachedGridScaled:F

    .line 203
    sget v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    sput v0, Lcom/gemini/chat/MessageFormatter;->cachedGridSp:F

    .line 204
    sget v0, Lcom/gemini/chat/MessageFormatter;->cachedGridChars:I

    goto :goto_0

    .line 199
    :cond_1
    const/16 v0, 0x1e

    goto :goto_1
.end method

.method static pressFeedback(Landroid/view/View;)Landroid/graphics/drawable/Drawable;
    .locals 5

    .prologue
    .line 401
    const/4 v0, 0x0

    .line 402
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_0

    .line 404
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [I

    const/4 v3, 0x0

    const v4, 0x101030e

    aput v4, v2, v3

    invoke-virtual {v1, v2}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 405
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 406
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 410
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x1080062

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 411
    :cond_1
    return-object v0

    .line 407
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static roleColor(Ljava/lang/String;)I
    .locals 1

    .prologue
    .line 59
    const-string v0, "user"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, -0x754b08

    :goto_0
    return v0

    :cond_0
    const-string v0, "model"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, -0x7e366b

    goto :goto_0

    :cond_1
    const v0, -0xd747e

    goto :goto_0
.end method

.method private static set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V
    .locals 1

    .prologue
    .line 363
    if-le p3, p2, :cond_0

    const/16 v0, 0x21

    invoke-virtual {p0, p1, p2, p3, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 364
    :cond_0
    return-void
.end method

.method public static styleView(Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 12

    .prologue
    const/4 v11, 0x2

    const/4 v3, -0x1

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/high16 v10, 0x3f000000    # 0.5f

    .line 368
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v4, v0, Landroid/util/DisplayMetrics;->density:F

    .line 369
    const-string v0, "user"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 370
    if-nez v5, :cond_0

    const-string v0, "model"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 372
    :goto_0
    sget v6, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    invoke-virtual {p0, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 373
    if-eqz v5, :cond_1

    move v0, v3

    :goto_1
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 374
    const v0, -0x754b08

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 375
    const/high16 v0, 0x3fc00000    # 1.5f

    mul-float/2addr v0, v4

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0, v5}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 376
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 377
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 378
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setLongClickable(Z)V

    .line 380
    const/high16 v0, 0x41200000    # 10.0f

    mul-float/2addr v0, v4

    add-float/2addr v0, v10

    float-to-int v0, v0

    const/high16 v5, 0x40c00000    # 6.0f

    mul-float/2addr v5, v4

    add-float/2addr v5, v10

    float-to-int v5, v5

    .line 381
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    invoke-direct {v6, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 383
    const/high16 v3, 0x41600000    # 14.0f

    mul-float/2addr v3, v4

    add-float/2addr v3, v10

    float-to-int v3, v3

    invoke-virtual {v6, v0, v5, v0, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 384
    invoke-virtual {p0, v6}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 387
    new-instance v3, Landroid/graphics/drawable/LayerDrawable;

    new-array v6, v11, [Landroid/graphics/drawable/Drawable;

    new-instance v7, Lcom/gemini/chat/MessageFormatter$RoleBar;

    .line 388
    invoke-static {p1}, Lcom/gemini/chat/MessageFormatter;->roleColor(Ljava/lang/String;)I

    move-result v8

    const/high16 v9, 0x40400000    # 3.0f

    mul-float/2addr v4, v9

    add-float/2addr v4, v10

    float-to-int v4, v4

    invoke-static {v11, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-direct {v7, v8, v4}, Lcom/gemini/chat/MessageFormatter$RoleBar;-><init>(II)V

    aput-object v7, v6, v2

    invoke-static {p0}, Lcom/gemini/chat/MessageFormatter;->pressFeedback(Landroid/view/View;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    aput-object v2, v6, v1

    invoke-direct {v3, v6}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 387
    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 390
    invoke-virtual {p0, v0, v5, v0, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 391
    return-void

    :cond_0
    move v0, v2

    .line 370
    goto :goto_0

    .line 373
    :cond_1
    if-eqz v0, :cond_2

    const v0, -0xd747e

    goto :goto_1

    :cond_2
    const v0, -0x333334

    goto :goto_1
.end method
