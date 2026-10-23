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

.field static final BLOCK_FG:I = -0x171513

.field static final CODE_BG:I = -0xd1cecc

.field static final CODE_FG:I = -0x2299d

.field static final EMOJI_FG:I = -0x951d3

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


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x4

    .line 69
    const/high16 v0, 0x41600000    # 14.0f

    sput v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    .line 70
    new-array v0, v3, [Ljava/lang/String;

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

    .line 71
    new-array v0, v3, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SIZES:[I

    return-void

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
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    return-void
.end method

.method static appendDoc(Landroid/text/SpannableStringBuilder;Lcom/gemini/chat/Markdown$Doc;FF)V
    .locals 12

    .prologue
    .line 179
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    .line 180
    iget-object v0, p1, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 183
    new-instance v4, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {v4, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 184
    sget v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    mul-float/2addr v0, p3

    invoke-virtual {v4, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 185
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3, v4}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    .line 186
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v4, v0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 187
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 188
    const/high16 v0, 0x41600000    # 14.0f

    mul-float/2addr v0, p2

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v7, v0

    .line 189
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p1, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_8

    .line 190
    iget-object v0, p1, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gemini/chat/Markdown$Span;

    .line 191
    iget v2, v0, Lcom/gemini/chat/Markdown$Span;->start:I

    add-int v8, v6, v2

    iget v2, v0, Lcom/gemini/chat/Markdown$Span;->end:I

    add-int v9, v6, v2

    .line 192
    iget v2, v0, Lcom/gemini/chat/Markdown$Span;->type:I

    packed-switch v2, :pswitch_data_0

    .line 189
    :goto_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 194
    :pswitch_0
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 197
    :pswitch_1
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 200
    :pswitch_2
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v2, 0x3

    invoke-direct {v0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 203
    :pswitch_3
    new-instance v0, Landroid/text/style/StrikethroughSpan;

    invoke-direct {v0}, Landroid/text/style/StrikethroughSpan;-><init>()V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 206
    :pswitch_4
    new-instance v0, Landroid/text/style/TypefaceSpan;

    const-string v2, "monospace"

    invoke-direct {v0, v2}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 207
    new-instance v0, Landroid/text/style/BackgroundColorSpan;

    const v2, -0xd1cecc

    invoke-direct {v0, v2}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 208
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v2, -0x2299d

    invoke-direct {v0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 211
    :pswitch_5
    new-instance v2, Landroid/text/style/URLSpan;

    iget-object v0, v0, Lcom/gemini/chat/Markdown$Span;->arg:Ljava/lang/String;

    invoke-direct {v2, v0}, Landroid/text/style/URLSpan;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v2, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 214
    :pswitch_6
    new-instance v2, Landroid/text/style/URLSpan;

    iget-object v0, v0, Lcom/gemini/chat/Markdown$Span;->arg:Ljava/lang/String;

    invoke-direct {v2, v0}, Landroid/text/style/URLSpan;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v2, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 215
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto :goto_1

    .line 218
    :pswitch_7
    iget v2, v0, Lcom/gemini/chat/Markdown$Span;->level:I

    const/4 v5, 0x1

    if-ne v2, v5, :cond_1

    const v2, 0x3fb9999a    # 1.45f

    .line 219
    :goto_2
    const/high16 v5, 0x3f800000    # 1.0f

    cmpl-float v5, v2, v5

    if-eqz v5, :cond_0

    new-instance v5, Landroid/text/style/RelativeSizeSpan;

    invoke-direct {v5, v2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-static {p0, v5, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 220
    :cond_0
    new-instance v2, Landroid/text/style/StyleSpan;

    const/4 v5, 0x1

    invoke-direct {v2, v5}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v2, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 221
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    iget v0, v0, Lcom/gemini/chat/Markdown$Span;->level:I

    const/4 v5, 0x3

    if-gt v0, v5, :cond_4

    const/4 v0, -0x1

    :goto_3
    invoke-direct {v2, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v2, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 218
    :cond_1
    iget v2, v0, Lcom/gemini/chat/Markdown$Span;->level:I

    const/4 v5, 0x2

    if-ne v2, v5, :cond_2

    const v2, 0x3fa3d70a    # 1.28f

    goto :goto_2

    :cond_2
    iget v2, v0, Lcom/gemini/chat/Markdown$Span;->level:I

    const/4 v5, 0x3

    if-ne v2, v5, :cond_3

    const v2, 0x3f8f5c29    # 1.12f

    goto :goto_2

    :cond_3
    const/high16 v2, 0x3f800000    # 1.0f

    goto :goto_2

    .line 221
    :cond_4
    const v0, -0x333334

    goto :goto_3

    .line 225
    :pswitch_8
    new-instance v0, Lcom/gemini/chat/MessageFormatter$BlockSpan;

    const v2, -0xe1e0df

    const/high16 v5, 0x41000000    # 8.0f

    mul-float/2addr v5, p2

    const/high16 v10, 0x3f000000    # 0.5f

    add-float/2addr v5, v10

    float-to-int v5, v5

    invoke-direct {v0, v2, v5}, Lcom/gemini/chat/MessageFormatter$BlockSpan;-><init>(II)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 226
    new-instance v0, Landroid/text/style/TypefaceSpan;

    const-string v2, "monospace"

    invoke-direct {v0, v2}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 227
    new-instance v0, Landroid/text/style/RelativeSizeSpan;

    const v2, 0x3f6147ae    # 0.88f

    invoke-direct {v0, v2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 228
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v2, -0x171513

    invoke-direct {v0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 231
    :pswitch_9
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v2, -0x655f5a

    invoke-direct {v0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 232
    new-instance v0, Landroid/text/style/RelativeSizeSpan;

    const v2, 0x3f59999a    # 0.85f

    invoke-direct {v0, v2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 235
    :pswitch_a
    new-instance v0, Lcom/gemini/chat/MessageFormatter$QuoteBarSpan;

    const v2, -0xa09c98

    const/high16 v5, 0x40400000    # 3.0f

    mul-float/2addr v5, p2

    const/high16 v10, 0x3f000000    # 0.5f

    add-float/2addr v5, v10

    float-to-int v5, v5

    const/high16 v10, 0x41200000    # 10.0f

    mul-float/2addr v10, p2

    const/high16 v11, 0x3f000000    # 0.5f

    add-float/2addr v10, v11

    float-to-int v10, v10

    invoke-direct {v0, v2, v5, v10}, Lcom/gemini/chat/MessageFormatter$QuoteBarSpan;-><init>(III)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 236
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v2, -0x423e3a

    invoke-direct {v0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 240
    :pswitch_b
    iget v2, v0, Lcom/gemini/chat/Markdown$Span;->level:I

    mul-int v5, v2, v7

    .line 241
    iget-object v2, v0, Lcom/gemini/chat/Markdown$Span;->arg:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    .line 242
    const-string v2, "["

    invoke-virtual {v10, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    move-object v2, v3

    .line 243
    :goto_4
    invoke-virtual {v2, v10}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v2

    const-string v10, " "

    invoke-virtual {v4, v10}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v10

    add-float/2addr v2, v10

    const/high16 v10, 0x3f000000    # 0.5f

    add-float/2addr v2, v10

    float-to-int v2, v2

    add-int/2addr v2, v5

    .line 244
    new-instance v10, Landroid/text/style/LeadingMarginSpan$Standard;

    iget v0, v0, Lcom/gemini/chat/Markdown$Span;->type:I

    const/16 v11, 0xb

    if-ne v0, v11, :cond_6

    move v0, v5

    :goto_5
    invoke-direct {v10, v0, v2}, Landroid/text/style/LeadingMarginSpan$Standard;-><init>(II)V

    invoke-static {p0, v10, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    :cond_5
    move-object v2, v4

    .line 242
    goto :goto_4

    :cond_6
    move v0, v2

    .line 244
    goto :goto_5

    .line 248
    :pswitch_c
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    const v5, -0x754b08

    invoke-direct {v2, v5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v2, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 249
    iget v0, v0, Lcom/gemini/chat/Markdown$Span;->level:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_7

    new-instance v0, Landroid/text/style/TypefaceSpan;

    const-string v2, "monospace"

    invoke-direct {v0, v2}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 250
    :cond_7
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 253
    :pswitch_d
    new-instance v0, Landroid/text/style/StrikethroughSpan;

    invoke-direct {v0}, Landroid/text/style/StrikethroughSpan;-><init>()V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 254
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v2, -0x655f5a

    invoke-direct {v0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 257
    :pswitch_e
    new-instance v0, Lcom/gemini/chat/MessageFormatter$RuleSpan;

    const v2, -0xc3bfbd

    const/4 v5, 0x1

    const/high16 v10, 0x3f000000    # 0.5f

    add-float/2addr v10, p2

    float-to-int v10, v10

    invoke-static {v5, v10}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-direct {v0, v2, v5}, Lcom/gemini/chat/MessageFormatter$RuleSpan;-><init>(II)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 260
    :pswitch_f
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v2, -0x951d3

    invoke-direct {v0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 263
    :pswitch_10
    new-instance v0, Landroid/text/style/TypefaceSpan;

    const-string v2, "monospace"

    invoke-direct {v0, v2}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 264
    new-instance v0, Landroid/text/style/RelativeSizeSpan;

    const v2, 0x3f59999a    # 0.85f

    invoke-direct {v0, v2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 267
    :pswitch_11
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 268
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const/4 v2, -0x1

    invoke-direct {v0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 271
    :pswitch_12
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 272
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v2, -0x754b08

    invoke-direct {v0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 276
    :pswitch_13
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v2, -0x655f5a

    invoke-direct {v0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 279
    :pswitch_14
    new-instance v0, Landroid/text/style/RelativeSizeSpan;

    const v2, 0x3ee66666    # 0.45f

    invoke-direct {v0, v2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-static {p0, v0, v8, v9}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 285
    :cond_8
    return-void

    .line 192
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

.method public static applyPrefs(Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 75
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

    .line 76
    return-void
.end method

.method public static format(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/ArrayList;)Ljava/lang/CharSequence;
    .locals 12
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
    const/16 v10, 0xa

    .line 88
    invoke-static {p0}, Lcom/gemini/chat/EmojiMap;->ensureLoaded(Landroid/content/Context;)V

    .line 89
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 90
    iget v4, v3, Landroid/util/DisplayMetrics;->density:F

    .line 91
    iget v5, v3, Landroid/util/DisplayMetrics;->scaledDensity:F

    .line 92
    new-instance v6, Landroid/text/SpannableStringBuilder;

    invoke-direct {v6}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 96
    const-string v2, "user"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 97
    const-wide/16 v8, 0x0

    cmp-long v2, p4, v8

    if-lez v2, :cond_3

    .line 98
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "User ("

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    new-instance v7, Ljava/text/SimpleDateFormat;

    const-string v8, "HH:mm:ss, dd/MM/yyyy"

    invoke-direct {v7, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v8, Ljava/util/Date;

    move-wide/from16 v0, p4

    invoke-direct {v8, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v7, v8}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, "):"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 104
    :goto_1
    invoke-virtual {v6}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    .line 105
    invoke-virtual {v6, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 106
    new-instance v2, Landroid/text/style/StyleSpan;

    const/4 v8, 0x1

    invoke-direct {v2, v8}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v6}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v8

    invoke-static {v6, v2, v7, v8}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 107
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    invoke-static {p1}, Lcom/gemini/chat/MessageFormatter;->roleColor(Ljava/lang/String;)I

    move-result v8

    invoke-direct {v2, v8}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v6}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v8

    invoke-static {v6, v2, v7, v8}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 108
    invoke-virtual {v6, v10}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 111
    const-string v2, "user"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    if-eqz p2, :cond_0

    const-string v2, "data:image/"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 112
    invoke-virtual {v6}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    .line 113
    const/high16 v7, 0x42f00000    # 120.0f

    mul-float/2addr v7, v4

    const/high16 v8, 0x3f000000    # 0.5f

    add-float/2addr v7, v8

    float-to-int v7, v7

    invoke-static {p2, v7}, Lcom/gemini/chat/Thumbnail;->fromDataUri(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 114
    if-eqz v7, :cond_7

    .line 115
    const v8, 0xfffc

    invoke-virtual {v6, v8}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 116
    new-instance v8, Landroid/text/style/ImageSpan;

    const/4 v9, 0x0

    invoke-direct {v8, p0, v7, v9}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;I)V

    invoke-virtual {v6}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    invoke-static {v6, v8, v2, v7}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 122
    :goto_2
    invoke-virtual {v6, v10}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 126
    :cond_0
    const-string v2, "user"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "model"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 127
    :cond_1
    invoke-static {v3}, Lcom/gemini/chat/MessageFormatter;->gridChars(Landroid/util/DisplayMetrics;)I

    move-result v2

    invoke-static {p3, v2}, Lcom/gemini/chat/Markdown;->parse(Ljava/lang/String;I)Lcom/gemini/chat/Markdown$Doc;

    move-result-object v2

    .line 128
    :goto_3
    if-eqz p6, :cond_2

    iget-object v3, v2, Lcom/gemini/chat/Markdown$Doc;->codeBlocks:Ljava/util/ArrayList;

    move-object/from16 v0, p6

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 129
    :cond_2
    invoke-static {v6, v2, v4, v5}, Lcom/gemini/chat/MessageFormatter;->appendDoc(Landroid/text/SpannableStringBuilder;Lcom/gemini/chat/Markdown$Doc;FF)V

    .line 130
    return-object v6

    .line 97
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p4

    goto/16 :goto_0

    .line 99
    :cond_4
    const-string v2, "model"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 100
    if-eqz p2, :cond_5

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_5

    const-string v2, "null"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Model ("

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, "):"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_1

    :cond_5
    const-string v2, "Model:"

    goto/16 :goto_1

    .line 102
    :cond_6
    const-string v2, "System:"

    goto/16 :goto_1

    .line 118
    :cond_7
    const-string v7, "[Image attached]"

    invoke-virtual {v6, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 119
    new-instance v7, Landroid/text/style/StyleSpan;

    const/4 v8, 0x2

    invoke-direct {v7, v8}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v6}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v8

    invoke-static {v6, v7, v2, v8}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 120
    new-instance v7, Landroid/text/style/ForegroundColorSpan;

    const v8, -0x655f5a

    invoke-direct {v7, v8}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v6}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v8

    invoke-static {v6, v7, v2, v8}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    goto/16 :goto_2

    .line 127
    :cond_8
    invoke-static {p3}, Lcom/gemini/chat/Markdown;->plain(Ljava/lang/String;)Lcom/gemini/chat/Markdown$Doc;

    move-result-object v2

    goto :goto_3
.end method

.method public static formatBody(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 4

    .prologue
    .line 148
    invoke-static {p0}, Lcom/gemini/chat/EmojiMap;->ensureLoaded(Landroid/content/Context;)V

    .line 149
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 150
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 151
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

    .line 152
    return-object v1
.end method

.method public static formatThinking(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 7

    .prologue
    const/16 v6, 0xa

    const/4 v4, 0x0

    const v5, -0x655f5a

    .line 157
    invoke-static {p0}, Lcom/gemini/chat/EmojiMap;->ensureLoaded(Landroid/content/Context;)V

    .line 158
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 159
    new-instance v2, Landroid/text/SpannableStringBuilder;

    invoke-direct {v2}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 160
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Model ("

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "):"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 161
    :goto_0
    invoke-virtual {v2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 162
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v3, 0x1

    invoke-direct {v0, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    invoke-static {v2, v0, v4, v3}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 163
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    const v3, -0x7e366b

    invoke-direct {v0, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    invoke-static {v2, v0, v4, v3}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 164
    invoke-virtual {v2, v6}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 165
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    .line 166
    const-string v3, "Thinking..."

    invoke-virtual {v2, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 167
    new-instance v3, Landroid/text/style/StyleSpan;

    const/4 v4, 0x2

    invoke-direct {v3, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v4

    invoke-static {v2, v3, v0, v4}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 168
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v3, v5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v4

    invoke-static {v2, v3, v0, v4}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 169
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 170
    invoke-virtual {v2, v6}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 171
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    .line 172
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1}, Lcom/gemini/chat/MessageFormatter;->gridChars(Landroid/util/DisplayMetrics;)I

    move-result v4

    invoke-static {v3, v4}, Lcom/gemini/chat/Markdown;->parse(Ljava/lang/String;I)Lcom/gemini/chat/Markdown$Doc;

    move-result-object v3

    iget v4, v1, Landroid/util/DisplayMetrics;->density:F

    iget v1, v1, Landroid/util/DisplayMetrics;->scaledDensity:F

    invoke-static {v2, v3, v4, v1}, Lcom/gemini/chat/MessageFormatter;->appendDoc(Landroid/text/SpannableStringBuilder;Lcom/gemini/chat/Markdown$Doc;FF)V

    .line 173
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v1, v5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    invoke-static {v2, v1, v0, v3}, Lcom/gemini/chat/MessageFormatter;->set(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;II)V

    .line 175
    :cond_0
    return-object v2

    .line 160
    :cond_1
    const-string v0, "Model:"

    goto :goto_0
.end method

.method static gridChars(Landroid/util/DisplayMetrics;)I
    .locals 4

    .prologue
    .line 135
    iget v0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v0, v0

    const/high16 v1, 0x42300000    # 44.0f

    iget v2, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    .line 136
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 137
    sget-object v2, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 138
    sget v2, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    const v3, 0x3f59999a    # 0.85f

    mul-float/2addr v2, v3

    iget v3, p0, Landroid/util/DisplayMetrics;->scaledDensity:F

    mul-float/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 139
    const-string v2, "0"

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    .line 140
    const/4 v2, 0x0

    cmpl-float v2, v1, v2

    if-lez v2, :cond_0

    const/16 v2, 0xc

    div-float/2addr v0, v1

    float-to-int v0, v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/16 v0, 0x1e

    goto :goto_0
.end method

.method static pressFeedback(Landroid/view/View;)Landroid/graphics/drawable/Drawable;
    .locals 5

    .prologue
    .line 326
    const/4 v0, 0x0

    .line 327
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_0

    .line 329
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

    .line 330
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 331
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 335
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x1080062

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 336
    :cond_1
    return-object v0

    .line 332
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static roleColor(Ljava/lang/String;)I
    .locals 1

    .prologue
    .line 57
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
    .line 288
    if-le p3, p2, :cond_0

    const/16 v0, 0x21

    invoke-virtual {p0, p1, p2, p3, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 289
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

    .line 293
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v4, v0, Landroid/util/DisplayMetrics;->density:F

    .line 294
    const-string v0, "user"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 295
    if-nez v5, :cond_0

    const-string v0, "model"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 297
    :goto_0
    sget v6, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    invoke-virtual {p0, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 298
    if-eqz v5, :cond_1

    move v0, v3

    :goto_1
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 299
    const v0, -0x754b08

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 300
    const/high16 v0, 0x3fc00000    # 1.5f

    mul-float/2addr v0, v4

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0, v5}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 301
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 302
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 303
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setLongClickable(Z)V

    .line 305
    const/high16 v0, 0x41200000    # 10.0f

    mul-float/2addr v0, v4

    add-float/2addr v0, v10

    float-to-int v0, v0

    const/high16 v5, 0x40c00000    # 6.0f

    mul-float/2addr v5, v4

    add-float/2addr v5, v10

    float-to-int v5, v5

    .line 306
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    invoke-direct {v6, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 308
    const/high16 v3, 0x41600000    # 14.0f

    mul-float/2addr v3, v4

    add-float/2addr v3, v10

    float-to-int v3, v3

    invoke-virtual {v6, v0, v5, v0, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 309
    invoke-virtual {p0, v6}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 312
    new-instance v3, Landroid/graphics/drawable/LayerDrawable;

    new-array v6, v11, [Landroid/graphics/drawable/Drawable;

    new-instance v7, Lcom/gemini/chat/MessageFormatter$RoleBar;

    .line 313
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

    .line 312
    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 315
    invoke-virtual {p0, v0, v5, v0, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 316
    return-void

    :cond_0
    move v0, v2

    .line 295
    goto :goto_0

    .line 298
    :cond_1
    if-eqz v0, :cond_2

    const v0, -0xd747e

    goto :goto_1

    :cond_2
    const v0, -0x333334

    goto :goto_1
.end method
