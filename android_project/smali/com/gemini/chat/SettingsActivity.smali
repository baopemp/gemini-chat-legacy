.class public Lcom/gemini/chat/SettingsActivity;
.super Landroid/app/Activity;
.source "SettingsActivity.java"


# static fields
.field static final CUSTOM:Ljava/lang/String; = "Custom model..."

.field static final MODELS:[Ljava/lang/String;

.field static final PREF_CUSTOM:Ljava/lang/String; = "custom_model"

.field static final THINKING_LABELS:[Ljava/lang/String;

.field static final THINKING_VALUES:[Ljava/lang/String;


# instance fields
.field private cbAutoName:Landroid/widget/CheckBox;

.field private cbHandsFree:Landroid/widget/CheckBox;

.field private cbLiveText:Landroid/widget/CheckBox;

.field private cbMuted:Landroid/widget/CheckBox;

.field private cbShowThoughts:Landroid/widget/CheckBox;

.field private etApiKey:Landroid/widget/EditText;

.field private etCustomModel:Landroid/widget/EditText;

.field private etLiveCustom:Landroid/widget/EditText;

.field private etSystemInstruction:Landroid/widget/EditText;

.field private spLiveModel:Landroid/widget/Spinner;

.field private spLiveThinking:Landroid/widget/Spinner;

.field private spTextSize:Landroid/widget/Spinner;

.field private spTextThinking:Landroid/widget/Spinner;

.field private spTts:Landroid/widget/Spinner;

.field private spVoice:Landroid/widget/Spinner;

.field private spinnerModel:Landroid/widget/Spinner;

.field private tvLiveThinking:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 32
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "gemini-3.8-flash"

    aput-object v1, v0, v3

    const-string v1, "gemini-3.6-flash"

    aput-object v1, v0, v4

    const-string v1, "gemini-3.5-flash-lite"

    aput-object v1, v0, v5

    const-string v1, "gemini-3.1-flash-lite"

    aput-object v1, v0, v6

    const-string v1, "gemini-3-flash-preview"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, "gemini-flash-latest"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "gemini-flash-lite-latest"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "gemma-4-31b-it"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "gemma-4-26b-a4b-it"

    aput-object v2, v0, v1

    sput-object v0, Lcom/gemini/chat/SettingsActivity;->MODELS:[Ljava/lang/String;

    .line 37
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "Default"

    aput-object v1, v0, v3

    const-string v1, "Minimal"

    aput-object v1, v0, v4

    const-string v1, "Low"

    aput-object v1, v0, v5

    const-string v1, "Medium"

    aput-object v1, v0, v6

    const-string v1, "High"

    aput-object v1, v0, v7

    sput-object v0, Lcom/gemini/chat/SettingsActivity;->THINKING_LABELS:[Ljava/lang/String;

    .line 38
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, ""

    aput-object v1, v0, v3

    const-string v1, "minimal"

    aput-object v1, v0, v4

    const-string v1, "low"

    aput-object v1, v0, v5

    const-string v1, "medium"

    aput-object v1, v0, v6

    const-string v1, "high"

    aput-object v1, v0, v7

    sput-object v0, Lcom/gemini/chat/SettingsActivity;->THINKING_VALUES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/gemini/chat/SettingsActivity;)V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/gemini/chat/SettingsActivity;->updateVisibility()V

    return-void
.end method

.method static synthetic access$100(Lcom/gemini/chat/SettingsActivity;)V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/gemini/chat/SettingsActivity;->save()V

    return-void
.end method

.method private check(Ljava/lang/String;)Landroid/widget/CheckBox;
    .locals 1

    .prologue
    .line 112
    new-instance v0, Landroid/widget/CheckBox;

    invoke-direct {v0, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 113
    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 114
    return-object v0
.end method

.method private dp(F)I
    .locals 2

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/gemini/chat/SettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method private fill(I)Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    .prologue
    .line 83
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 85
    int-to-float v1, p1

    invoke-direct {p0, v1}, Lcom/gemini/chat/SettingsActivity;->dp(F)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 86
    return-object v0
.end method

.method private hint(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2

    .prologue
    .line 97
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 98
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 100
    return-object v0
.end method

.method private static indexOf([Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    .prologue
    .line 65
    const/4 v0, 0x0

    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    aget-object v1, p0, v0

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 66
    :goto_1
    return v0

    .line 65
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 66
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method static indexOfModel(Ljava/lang/String;)I
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lcom/gemini/chat/SettingsActivity;->MODELS:[Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/gemini/chat/SettingsActivity;->indexOf([Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private insert(Landroid/view/ViewGroup;I[Landroid/view/View;[Landroid/widget/LinearLayout$LayoutParams;)I
    .locals 4

    .prologue
    .line 127
    const/4 v0, 0x0

    :goto_0
    array-length v1, p3

    if-ge v0, v1, :cond_0

    aget-object v2, p3, v0

    add-int/lit8 v1, p2, 0x1

    aget-object v3, p4, v0

    invoke-virtual {p1, v2, p2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v0, v0, 0x1

    move p2, v1

    goto :goto_0

    .line 128
    :cond_0
    return p2
.end method

.method private load()V
    .locals 8

    .prologue
    const/4 v3, 0x1

    const/4 v1, 0x0

    .line 209
    const-string v0, "GeminiPrefs"

    invoke-virtual {p0, v0, v1}, Lcom/gemini/chat/SettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 210
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->etApiKey:Landroid/widget/EditText;

    const-string v2, "api_key"

    const-string v5, ""

    invoke-interface {v4, v2, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 211
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->etSystemInstruction:Landroid/widget/EditText;

    const-string v2, "system_instruction"

    const-string v5, ""

    invoke-interface {v4, v2, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 212
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->cbAutoName:Landroid/widget/CheckBox;

    const-string v2, "auto_name"

    invoke-interface {v4, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    move v0, v1

    move v2, v3

    .line 214
    :goto_0
    sget-object v5, Lcom/gemini/chat/MessageFormatter;->TEXT_SIZES:[I

    array-length v5, v5

    if-ge v0, v5, :cond_1

    .line 215
    sget-object v5, Lcom/gemini/chat/MessageFormatter;->TEXT_SIZES:[I

    aget v5, v5, v0

    const-string v6, "text_size"

    const/16 v7, 0xe

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    if-ne v5, v6, :cond_0

    move v2, v0

    .line 214
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 217
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->spTextSize:Landroid/widget/Spinner;

    invoke-virtual {v0, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 219
    const-string v0, "model"

    const-string v2, "gemini-3.5-flash-lite"

    invoke-interface {v4, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 220
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->etCustomModel:Landroid/widget/EditText;

    const-string v5, "custom_model"

    const-string v6, ""

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 221
    invoke-static {v2}, Lcom/gemini/chat/SettingsActivity;->indexOfModel(Ljava/lang/String;)I

    move-result v0

    .line 222
    if-gez v0, :cond_2

    .line 223
    sget-object v0, Lcom/gemini/chat/SettingsActivity;->MODELS:[Ljava/lang/String;

    array-length v0, v0

    .line 224
    iget-object v5, p0, Lcom/gemini/chat/SettingsActivity;->etCustomModel:Landroid/widget/EditText;

    invoke-virtual {v5, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 226
    :cond_2
    iget-object v2, p0, Lcom/gemini/chat/SettingsActivity;->spinnerModel:Landroid/widget/Spinner;

    invoke-virtual {v2, v0}, Landroid/widget/Spinner;->setSelection(I)V

    .line 227
    sget-object v0, Lcom/gemini/chat/SettingsActivity;->THINKING_VALUES:[Ljava/lang/String;

    const-string v2, "thinking_level"

    const-string v5, ""

    invoke-interface {v4, v2, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/gemini/chat/SettingsActivity;->indexOf([Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 228
    iget-object v2, p0, Lcom/gemini/chat/SettingsActivity;->spTextThinking:Landroid/widget/Spinner;

    if-gez v0, :cond_3

    move v0, v1

    :cond_3
    invoke-virtual {v2, v0}, Landroid/widget/Spinner;->setSelection(I)V

    .line 229
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->cbShowThoughts:Landroid/widget/CheckBox;

    const-string v2, "show_thoughts"

    invoke-interface {v4, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 231
    const-string v0, "live_model"

    const-string v2, "gemini-3.8-live"

    invoke-interface {v4, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 232
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->etLiveCustom:Landroid/widget/EditText;

    const-string v5, "live_custom_model"

    const-string v6, ""

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 233
    sget-object v0, Lcom/gemini/chat/LiveActivity;->LIVE_MODELS:[Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/gemini/chat/SettingsActivity;->indexOf([Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 234
    if-gez v0, :cond_4

    .line 235
    sget-object v0, Lcom/gemini/chat/LiveActivity;->LIVE_MODELS:[Ljava/lang/String;

    array-length v0, v0

    .line 236
    iget-object v5, p0, Lcom/gemini/chat/SettingsActivity;->etLiveCustom:Landroid/widget/EditText;

    invoke-virtual {v5, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 238
    :cond_4
    iget-object v2, p0, Lcom/gemini/chat/SettingsActivity;->spLiveModel:Landroid/widget/Spinner;

    invoke-virtual {v2, v0}, Landroid/widget/Spinner;->setSelection(I)V

    .line 239
    sget-object v0, Lcom/gemini/chat/LiveActivity;->THINKING:[Ljava/lang/String;

    const-string v2, "live_thinking"

    const-string v5, "low"

    invoke-interface {v4, v2, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/gemini/chat/SettingsActivity;->indexOf([Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 240
    iget-object v2, p0, Lcom/gemini/chat/SettingsActivity;->spLiveThinking:Landroid/widget/Spinner;

    if-gez v0, :cond_5

    move v0, v1

    :cond_5
    invoke-virtual {v2, v0}, Landroid/widget/Spinner;->setSelection(I)V

    .line 241
    const-string v0, "live_voice"

    const-string v2, "Kore"

    invoke-interface {v4, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move v0, v1

    .line 242
    :goto_1
    sget-object v5, Lcom/gemini/chat/LiveActivity;->VOICES:[Ljava/lang/String;

    array-length v5, v5

    if-ge v0, v5, :cond_7

    .line 243
    sget-object v5, Lcom/gemini/chat/LiveActivity;->VOICES:[Ljava/lang/String;

    aget-object v5, v5, v0

    invoke-static {v5}, Lcom/gemini/chat/LiveActivity;->voiceName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    iget-object v5, p0, Lcom/gemini/chat/SettingsActivity;->spVoice:Landroid/widget/Spinner;

    invoke-virtual {v5, v0}, Landroid/widget/Spinner;->setSelection(I)V

    .line 242
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 245
    :cond_7
    sget-object v0, Lcom/gemini/chat/ReadAloud;->MODELS:[Ljava/lang/String;

    const-string v2, "tts_model"

    sget-object v5, Lcom/gemini/chat/ReadAloud;->DEFAULT_MODEL:Ljava/lang/String;

    invoke-interface {v4, v2, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/gemini/chat/SettingsActivity;->indexOf([Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 246
    iget-object v2, p0, Lcom/gemini/chat/SettingsActivity;->spTts:Landroid/widget/Spinner;

    if-gez v0, :cond_8

    move v0, v1

    :cond_8
    invoke-virtual {v2, v0}, Landroid/widget/Spinner;->setSelection(I)V

    .line 247
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->cbHandsFree:Landroid/widget/CheckBox;

    const-string v2, "live_hands_free"

    invoke-interface {v4, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 248
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->cbMuted:Landroid/widget/CheckBox;

    const-string v2, "live_muted"

    invoke-interface {v4, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 249
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->cbLiveText:Landroid/widget/CheckBox;

    const-string v1, "live_text"

    invoke-interface {v4, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 250
    invoke-direct {p0}, Lcom/gemini/chat/SettingsActivity;->updateVisibility()V

    .line 251
    return-void
.end method

.method private modelIdField(Ljava/lang/String;)Landroid/widget/EditText;
    .locals 2

    .prologue
    .line 118
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 119
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 120
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 121
    const v1, 0x80001

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 122
    return-object v0
.end method

.method static normalizeModel(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 47
    if-nez p0, :cond_1

    move-object v0, v3

    .line 57
    :cond_0
    :goto_0
    return-object v0

    .line 48
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 49
    const-string v1, "models/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 50
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v4, 0x64

    if-le v1, v4, :cond_4

    :cond_3
    move-object v0, v3

    goto :goto_0

    :cond_4
    move v1, v2

    .line 51
    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_0

    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 53
    const/16 v5, 0x61

    if-lt v4, v5, :cond_5

    const/16 v5, 0x7a

    if-le v4, v5, :cond_8

    :cond_5
    const/16 v5, 0x41

    if-lt v4, v5, :cond_6

    const/16 v5, 0x5a

    if-le v4, v5, :cond_8

    :cond_6
    const/16 v5, 0x30

    if-lt v4, v5, :cond_7

    const/16 v5, 0x39

    if-le v4, v5, :cond_8

    :cond_7
    const/16 v5, 0x2d

    if-eq v4, v5, :cond_8

    const/16 v5, 0x2e

    if-eq v4, v5, :cond_8

    const/16 v5, 0x5f

    if-ne v4, v5, :cond_9

    :cond_8
    const/4 v4, 0x1

    .line 55
    :goto_2
    if-nez v4, :cond_a

    move-object v0, v3

    goto :goto_0

    :cond_9
    move v4, v2

    .line 53
    goto :goto_2

    .line 51
    :cond_a
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private save()V
    .locals 9

    .prologue
    const/4 v4, 0x1

    const/4 v8, 0x0

    .line 267
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->spinnerModel:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    .line 268
    iget-object v1, p0, Lcom/gemini/chat/SettingsActivity;->etCustomModel:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 270
    if-ltz v0, :cond_2

    sget-object v1, Lcom/gemini/chat/SettingsActivity;->MODELS:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 271
    sget-object v1, Lcom/gemini/chat/SettingsActivity;->MODELS:[Ljava/lang/String;

    aget-object v0, v1, v0

    .line 283
    :goto_0
    iget-object v1, p0, Lcom/gemini/chat/SettingsActivity;->spLiveModel:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v3

    .line 284
    if-ltz v3, :cond_5

    sget-object v1, Lcom/gemini/chat/LiveActivity;->LIVE_MODELS:[Ljava/lang/String;

    array-length v1, v1

    if-ge v3, v1, :cond_5

    .line 285
    sget-object v1, Lcom/gemini/chat/LiveActivity;->LIVE_MODELS:[Ljava/lang/String;

    aget-object v1, v1, v3

    .line 296
    :cond_0
    const-string v4, "GeminiPrefs"

    invoke-virtual {p0, v4, v8}, Lcom/gemini/chat/SettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 297
    const-string v5, "api_key"

    iget-object v6, p0, Lcom/gemini/chat/SettingsActivity;->etApiKey:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-interface {v6}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 298
    const-string v5, "auto_name"

    iget-object v6, p0, Lcom/gemini/chat/SettingsActivity;->cbAutoName:Landroid/widget/CheckBox;

    invoke-virtual {v6}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v6

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 299
    const-string v5, "text_size"

    sget-object v6, Lcom/gemini/chat/MessageFormatter;->TEXT_SIZES:[I

    iget-object v7, p0, Lcom/gemini/chat/SettingsActivity;->spTextSize:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v7

    invoke-static {v8, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    aget v6, v6, v7

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 300
    const-string v5, "model"

    invoke-interface {v4, v5, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 301
    const-string v0, "custom_model"

    invoke-interface {v4, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 302
    const-string v0, "thinking_level"

    sget-object v2, Lcom/gemini/chat/SettingsActivity;->THINKING_VALUES:[Ljava/lang/String;

    iget-object v5, p0, Lcom/gemini/chat/SettingsActivity;->spTextThinking:Landroid/widget/Spinner;

    invoke-virtual {v5}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v5

    invoke-static {v8, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    aget-object v2, v2, v5

    invoke-interface {v4, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 303
    const-string v0, "show_thoughts"

    iget-object v2, p0, Lcom/gemini/chat/SettingsActivity;->cbShowThoughts:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    invoke-interface {v4, v0, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 304
    const-string v0, "live_model"

    invoke-interface {v4, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 305
    sget-object v0, Lcom/gemini/chat/LiveActivity;->LIVE_MODELS:[Ljava/lang/String;

    array-length v0, v0

    if-ne v3, v0, :cond_1

    const-string v0, "live_custom_model"

    invoke-interface {v4, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 306
    :cond_1
    const-string v0, "live_thinking"

    sget-object v1, Lcom/gemini/chat/LiveActivity;->THINKING:[Ljava/lang/String;

    iget-object v2, p0, Lcom/gemini/chat/SettingsActivity;->spLiveThinking:Landroid/widget/Spinner;

    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v2

    invoke-static {v8, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    aget-object v1, v1, v2

    invoke-interface {v4, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 307
    const-string v0, "live_voice"

    sget-object v1, Lcom/gemini/chat/LiveActivity;->VOICES:[Ljava/lang/String;

    iget-object v2, p0, Lcom/gemini/chat/SettingsActivity;->spVoice:Landroid/widget/Spinner;

    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v2

    invoke-static {v8, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    aget-object v1, v1, v2

    invoke-static {v1}, Lcom/gemini/chat/LiveActivity;->voiceName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v4, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 308
    const-string v0, "tts_model"

    sget-object v1, Lcom/gemini/chat/ReadAloud;->MODELS:[Ljava/lang/String;

    iget-object v2, p0, Lcom/gemini/chat/SettingsActivity;->spTts:Landroid/widget/Spinner;

    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v2

    invoke-static {v8, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    aget-object v1, v1, v2

    invoke-interface {v4, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 309
    const-string v0, "live_hands_free"

    iget-object v1, p0, Lcom/gemini/chat/SettingsActivity;->cbHandsFree:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    invoke-interface {v4, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 310
    const-string v0, "live_muted"

    iget-object v1, p0, Lcom/gemini/chat/SettingsActivity;->cbMuted:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    invoke-interface {v4, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 311
    const-string v0, "live_text"

    iget-object v1, p0, Lcom/gemini/chat/SettingsActivity;->cbLiveText:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    invoke-interface {v4, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 312
    const-string v0, "system_instruction"

    iget-object v1, p0, Lcom/gemini/chat/SettingsActivity;->etSystemInstruction:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v4, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 313
    invoke-static {p0, v4}, Lcom/gemini/chat/TimeGrounding;->saveSetting(Landroid/app/Activity;Landroid/content/SharedPreferences$Editor;)V

    .line 314
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 315
    const-string v0, "Settings Saved"

    invoke-static {p0, v0, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 316
    invoke-virtual {p0}, Lcom/gemini/chat/SettingsActivity;->finish()V

    .line 317
    :goto_1
    return-void

    .line 273
    :cond_2
    invoke-static {v2}, Lcom/gemini/chat/SettingsActivity;->normalizeModel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 274
    if-nez v1, :cond_4

    .line 275
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "Enter a model ID, e.g. gemini-3.8-pro"

    :goto_2
    invoke-static {p0, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 276
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 277
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->etCustomModel:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    goto :goto_1

    .line 276
    :cond_3
    const-string v0, "Invalid model ID (letters, digits, \'-\', \'.\', \'_\' only)"

    goto :goto_2

    :cond_4
    move-object v0, v1

    move-object v2, v1

    .line 280
    goto/16 :goto_0

    .line 287
    :cond_5
    iget-object v1, p0, Lcom/gemini/chat/SettingsActivity;->etLiveCustom:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/gemini/chat/SettingsActivity;->normalizeModel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 288
    if-nez v1, :cond_0

    .line 289
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->etLiveCustom:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 290
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "Enter a live model ID, e.g. gemini-3.8-live"

    :goto_3
    invoke-static {p0, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 291
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 292
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->etLiveCustom:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    goto :goto_1

    .line 291
    :cond_6
    const-string v0, "Invalid live model ID (letters, digits, \'-\', \'.\', \'_\' only)"

    goto :goto_3
.end method

.method private spinner([Ljava/lang/String;)Landroid/widget/Spinner;
    .locals 3

    .prologue
    .line 104
    new-instance v0, Landroid/widget/Spinner;

    invoke-direct {v0, p0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    .line 105
    new-instance v1, Landroid/widget/ArrayAdapter;

    const v2, 0x1090008

    invoke-direct {v1, p0, v2, p1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 106
    const v2, 0x1090009

    invoke-virtual {v1, v2}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 107
    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 108
    return-object v0
.end method

.method private title(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2

    .prologue
    .line 90
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 91
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 93
    return-object v0
.end method

.method private updateVisibility()V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 254
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->spinnerModel:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    sget-object v4, Lcom/gemini/chat/SettingsActivity;->MODELS:[Ljava/lang/String;

    array-length v4, v4

    if-ne v0, v4, :cond_2

    move v0, v1

    .line 255
    :goto_0
    iget-object v4, p0, Lcom/gemini/chat/SettingsActivity;->etCustomModel:Landroid/widget/EditText;

    if-eqz v0, :cond_3

    move v0, v2

    :goto_1
    invoke-virtual {v4, v0}, Landroid/widget/EditText;->setVisibility(I)V

    .line 256
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->spLiveModel:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    sget-object v4, Lcom/gemini/chat/LiveActivity;->LIVE_MODELS:[Ljava/lang/String;

    array-length v4, v4

    if-ne v0, v4, :cond_4

    .line 257
    :goto_2
    iget-object v4, p0, Lcom/gemini/chat/SettingsActivity;->etLiveCustom:Landroid/widget/EditText;

    if-eqz v1, :cond_5

    move v0, v2

    :goto_3
    invoke-virtual {v4, v0}, Landroid/widget/EditText;->setVisibility(I)V

    .line 259
    if-eqz v1, :cond_6

    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->etLiveCustom:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    .line 261
    :goto_4
    invoke-static {v0}, Lcom/gemini/chat/LiveSession;->needsThinkingLevel(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz v1, :cond_1

    :cond_0
    move v3, v2

    .line 262
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->tvLiveThinking:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 263
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity;->spLiveThinking:Landroid/widget/Spinner;

    invoke-virtual {v0, v3}, Landroid/widget/Spinner;->setVisibility(I)V

    .line 264
    return-void

    :cond_2
    move v0, v2

    .line 254
    goto :goto_0

    :cond_3
    move v0, v3

    .line 255
    goto :goto_1

    :cond_4
    move v1, v2

    .line 256
    goto :goto_2

    :cond_5
    move v0, v3

    .line 257
    goto :goto_3

    .line 260
    :cond_6
    sget-object v0, Lcom/gemini/chat/LiveActivity;->LIVE_MODELS:[Ljava/lang/String;

    iget-object v4, p0, Lcom/gemini/chat/SettingsActivity;->spLiveModel:Landroid/widget/Spinner;

    invoke-virtual {v4}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    aget-object v0, v0, v4

    goto :goto_4
.end method

.method private static withCustom([Ljava/lang/String;)[Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 70
    array-length v0, p0

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    .line 71
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 72
    array-length v1, p0

    const-string v2, "Custom model..."

    aput-object v2, v0, v1

    .line 73
    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 11

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v6, 0x3

    const/4 v8, 0x0

    const/4 v7, 0x4

    .line 135
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 136
    const v0, 0x7f030003

    invoke-virtual {p0, v0}, Lcom/gemini/chat/SettingsActivity;->setContentView(I)V

    .line 137
    invoke-virtual {p0}, Lcom/gemini/chat/SettingsActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 138
    const v0, 0x7f050005

    invoke-virtual {p0, v0}, Lcom/gemini/chat/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/gemini/chat/SettingsActivity;->etApiKey:Landroid/widget/EditText;

    .line 139
    const v0, 0x7f050006

    invoke-virtual {p0, v0}, Lcom/gemini/chat/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/gemini/chat/SettingsActivity;->spinnerModel:Landroid/widget/Spinner;

    .line 140
    const v0, 0x7f050007

    invoke-virtual {p0, v0}, Lcom/gemini/chat/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/gemini/chat/SettingsActivity;->etSystemInstruction:Landroid/widget/EditText;

    .line 141
    const v0, 0x7f050008

    invoke-virtual {p0, v0}, Lcom/gemini/chat/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 142
    iget-object v1, p0, Lcom/gemini/chat/SettingsActivity;->spinnerModel:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 145
    const-string v2, "Auto-name chats"

    invoke-direct {p0, v2}, Lcom/gemini/chat/SettingsActivity;->check(Ljava/lang/String;)Landroid/widget/CheckBox;

    move-result-object v2

    iput-object v2, p0, Lcom/gemini/chat/SettingsActivity;->cbAutoName:Landroid/widget/CheckBox;

    .line 146
    sget-object v2, Lcom/gemini/chat/MessageFormatter;->TEXT_SIZE_LABELS:[Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/gemini/chat/SettingsActivity;->spinner([Ljava/lang/String;)Landroid/widget/Spinner;

    move-result-object v2

    iput-object v2, p0, Lcom/gemini/chat/SettingsActivity;->spTextSize:Landroid/widget/Spinner;

    .line 147
    iget-object v2, p0, Lcom/gemini/chat/SettingsActivity;->spinnerModel:Landroid/widget/Spinner;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    .line 148
    new-array v3, v7, [Landroid/view/View;

    iget-object v4, p0, Lcom/gemini/chat/SettingsActivity;->cbAutoName:Landroid/widget/CheckBox;

    aput-object v4, v3, v8

    const-string v4, "Names each chat after its first reply."

    invoke-direct {p0, v4}, Lcom/gemini/chat/SettingsActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v4

    aput-object v4, v3, v9

    const-string v4, "Text size"

    .line 149
    invoke-direct {p0, v4}, Lcom/gemini/chat/SettingsActivity;->title(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v4

    aput-object v4, v3, v10

    iget-object v4, p0, Lcom/gemini/chat/SettingsActivity;->spTextSize:Landroid/widget/Spinner;

    aput-object v4, v3, v6

    new-array v4, v7, [Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x8

    .line 150
    invoke-direct {p0, v5}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-direct {p0, v8}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    aput-object v5, v4, v9

    const/16 v5, 0x10

    invoke-direct {p0, v5}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    aput-object v5, v4, v10

    invoke-direct {p0, v7}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    aput-object v5, v4, v6

    .line 148
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/gemini/chat/SettingsActivity;->insert(Landroid/view/ViewGroup;I[Landroid/view/View;[Landroid/widget/LinearLayout$LayoutParams;)I

    .line 153
    iget-object v2, p0, Lcom/gemini/chat/SettingsActivity;->spinnerModel:Landroid/widget/Spinner;

    sget-object v3, Lcom/gemini/chat/SettingsActivity;->MODELS:[Ljava/lang/String;

    invoke-static {v3}, Lcom/gemini/chat/SettingsActivity;->withCustom([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/gemini/chat/SettingsActivity;->spinner([Ljava/lang/String;)Landroid/widget/Spinner;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Spinner;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 154
    const-string v2, "Model ID, e.g. gemini-3.8-pro"

    invoke-direct {p0, v2}, Lcom/gemini/chat/SettingsActivity;->modelIdField(Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v2

    iput-object v2, p0, Lcom/gemini/chat/SettingsActivity;->etCustomModel:Landroid/widget/EditText;

    .line 155
    sget-object v2, Lcom/gemini/chat/SettingsActivity;->THINKING_LABELS:[Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/gemini/chat/SettingsActivity;->spinner([Ljava/lang/String;)Landroid/widget/Spinner;

    move-result-object v2

    iput-object v2, p0, Lcom/gemini/chat/SettingsActivity;->spTextThinking:Landroid/widget/Spinner;

    .line 156
    const-string v2, "Show thought process"

    invoke-direct {p0, v2}, Lcom/gemini/chat/SettingsActivity;->check(Ljava/lang/String;)Landroid/widget/CheckBox;

    move-result-object v2

    iput-object v2, p0, Lcom/gemini/chat/SettingsActivity;->cbShowThoughts:Landroid/widget/CheckBox;

    .line 157
    iget-object v2, p0, Lcom/gemini/chat/SettingsActivity;->spinnerModel:Landroid/widget/Spinner;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    .line 158
    const/4 v3, 0x5

    new-array v3, v3, [Landroid/view/View;

    iget-object v4, p0, Lcom/gemini/chat/SettingsActivity;->etCustomModel:Landroid/widget/EditText;

    aput-object v4, v3, v8

    const-string v4, "Thinking level"

    invoke-direct {p0, v4}, Lcom/gemini/chat/SettingsActivity;->title(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v4

    aput-object v4, v3, v9

    iget-object v4, p0, Lcom/gemini/chat/SettingsActivity;->spTextThinking:Landroid/widget/Spinner;

    aput-object v4, v3, v10

    iget-object v4, p0, Lcom/gemini/chat/SettingsActivity;->cbShowThoughts:Landroid/widget/CheckBox;

    aput-object v4, v3, v6

    const-string v4, "Hold a reply to see its thoughts."

    .line 159
    invoke-direct {p0, v4}, Lcom/gemini/chat/SettingsActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v4

    aput-object v4, v3, v7

    const/4 v4, 0x5

    new-array v4, v4, [Landroid/widget/LinearLayout$LayoutParams;

    .line 160
    invoke-direct {p0, v7}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    aput-object v5, v4, v8

    const/16 v5, 0x10

    invoke-direct {p0, v5}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-direct {p0, v7}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    aput-object v5, v4, v10

    const/16 v5, 0x8

    invoke-direct {p0, v5}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-direct {p0, v8}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    aput-object v5, v4, v7

    .line 158
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/gemini/chat/SettingsActivity;->insert(Landroid/view/ViewGroup;I[Landroid/view/View;[Landroid/widget/LinearLayout$LayoutParams;)I

    move-result v2

    .line 163
    sget-object v3, Lcom/gemini/chat/LiveActivity;->LIVE_MODELS:[Ljava/lang/String;

    invoke-static {v3}, Lcom/gemini/chat/SettingsActivity;->withCustom([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/gemini/chat/SettingsActivity;->spinner([Ljava/lang/String;)Landroid/widget/Spinner;

    move-result-object v3

    iput-object v3, p0, Lcom/gemini/chat/SettingsActivity;->spLiveModel:Landroid/widget/Spinner;

    .line 164
    const-string v3, "Live model ID, e.g. gemini-3.8-live"

    invoke-direct {p0, v3}, Lcom/gemini/chat/SettingsActivity;->modelIdField(Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v3

    iput-object v3, p0, Lcom/gemini/chat/SettingsActivity;->etLiveCustom:Landroid/widget/EditText;

    .line 165
    const-string v3, "Live thinking level"

    invoke-direct {p0, v3}, Lcom/gemini/chat/SettingsActivity;->title(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    iput-object v3, p0, Lcom/gemini/chat/SettingsActivity;->tvLiveThinking:Landroid/widget/TextView;

    .line 166
    new-array v3, v6, [Ljava/lang/String;

    const-string v4, "Low"

    aput-object v4, v3, v8

    const-string v4, "Medium"

    aput-object v4, v3, v9

    const-string v4, "High"

    aput-object v4, v3, v10

    invoke-direct {p0, v3}, Lcom/gemini/chat/SettingsActivity;->spinner([Ljava/lang/String;)Landroid/widget/Spinner;

    move-result-object v3

    iput-object v3, p0, Lcom/gemini/chat/SettingsActivity;->spLiveThinking:Landroid/widget/Spinner;

    .line 167
    sget-object v3, Lcom/gemini/chat/LiveActivity;->VOICES:[Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/gemini/chat/SettingsActivity;->spinner([Ljava/lang/String;)Landroid/widget/Spinner;

    move-result-object v3

    iput-object v3, p0, Lcom/gemini/chat/SettingsActivity;->spVoice:Landroid/widget/Spinner;

    .line 168
    sget-object v3, Lcom/gemini/chat/ReadAloud;->MODELS:[Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/gemini/chat/SettingsActivity;->spinner([Ljava/lang/String;)Landroid/widget/Spinner;

    move-result-object v3

    iput-object v3, p0, Lcom/gemini/chat/SettingsActivity;->spTts:Landroid/widget/Spinner;

    .line 169
    const-string v3, "Hands-free"

    invoke-direct {p0, v3}, Lcom/gemini/chat/SettingsActivity;->check(Ljava/lang/String;)Landroid/widget/CheckBox;

    move-result-object v3

    iput-object v3, p0, Lcom/gemini/chat/SettingsActivity;->cbHandsFree:Landroid/widget/CheckBox;

    .line 170
    const-string v3, "Mute voice"

    invoke-direct {p0, v3}, Lcom/gemini/chat/SettingsActivity;->check(Ljava/lang/String;)Landroid/widget/CheckBox;

    move-result-object v3

    iput-object v3, p0, Lcom/gemini/chat/SettingsActivity;->cbMuted:Landroid/widget/CheckBox;

    .line 171
    const-string v3, "Live text while speaking"

    invoke-direct {p0, v3}, Lcom/gemini/chat/SettingsActivity;->check(Ljava/lang/String;)Landroid/widget/CheckBox;

    move-result-object v3

    iput-object v3, p0, Lcom/gemini/chat/SettingsActivity;->cbLiveText:Landroid/widget/CheckBox;

    .line 172
    const/16 v3, 0x10

    new-array v3, v3, [Landroid/view/View;

    const-string v4, "Live speech model"

    invoke-direct {p0, v4}, Lcom/gemini/chat/SettingsActivity;->title(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v4

    aput-object v4, v3, v8

    iget-object v4, p0, Lcom/gemini/chat/SettingsActivity;->spLiveModel:Landroid/widget/Spinner;

    aput-object v4, v3, v9

    iget-object v4, p0, Lcom/gemini/chat/SettingsActivity;->etLiveCustom:Landroid/widget/EditText;

    aput-object v4, v3, v10

    iget-object v4, p0, Lcom/gemini/chat/SettingsActivity;->tvLiveThinking:Landroid/widget/TextView;

    aput-object v4, v3, v6

    iget-object v4, p0, Lcom/gemini/chat/SettingsActivity;->spLiveThinking:Landroid/widget/Spinner;

    aput-object v4, v3, v7

    const/4 v4, 0x5

    const-string v5, "Voice"

    .line 173
    invoke-direct {p0, v5}, Lcom/gemini/chat/SettingsActivity;->title(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x6

    iget-object v5, p0, Lcom/gemini/chat/SettingsActivity;->spVoice:Landroid/widget/Spinner;

    aput-object v5, v3, v4

    const/4 v4, 0x7

    const-string v5, "Also used by Read Aloud (hold a reply)."

    invoke-direct {p0, v5}, Lcom/gemini/chat/SettingsActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v5

    aput-object v5, v3, v4

    const/16 v4, 0x8

    const-string v5, "Read Aloud model"

    .line 174
    invoke-direct {p0, v5}, Lcom/gemini/chat/SettingsActivity;->title(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v5

    aput-object v5, v3, v4

    const/16 v4, 0x9

    iget-object v5, p0, Lcom/gemini/chat/SettingsActivity;->spTts:Landroid/widget/Spinner;

    aput-object v5, v3, v4

    const/16 v4, 0xa

    iget-object v5, p0, Lcom/gemini/chat/SettingsActivity;->cbHandsFree:Landroid/widget/CheckBox;

    aput-object v5, v3, v4

    const/16 v4, 0xb

    const-string v5, "Talk freely; the model detects when you stop."

    invoke-direct {p0, v5}, Lcom/gemini/chat/SettingsActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v5

    aput-object v5, v3, v4

    const/16 v4, 0xc

    iget-object v5, p0, Lcom/gemini/chat/SettingsActivity;->cbMuted:Landroid/widget/CheckBox;

    aput-object v5, v3, v4

    const/16 v4, 0xd

    const-string v5, "Replies are shown as text only."

    .line 175
    invoke-direct {p0, v5}, Lcom/gemini/chat/SettingsActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v5

    aput-object v5, v3, v4

    const/16 v4, 0xe

    iget-object v5, p0, Lcom/gemini/chat/SettingsActivity;->cbLiveText:Landroid/widget/CheckBox;

    aput-object v5, v3, v4

    const/16 v4, 0xf

    const-string v5, "Shows your words in the text box as you speak."

    .line 176
    invoke-direct {p0, v5}, Lcom/gemini/chat/SettingsActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v5

    aput-object v5, v3, v4

    const/16 v4, 0x10

    new-array v4, v4, [Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x14

    .line 177
    invoke-direct {p0, v5}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-direct {p0, v7}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-direct {p0, v7}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    aput-object v5, v4, v10

    const/16 v5, 0x10

    invoke-direct {p0, v5}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-direct {p0, v7}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    aput-object v5, v4, v7

    const/4 v5, 0x5

    const/16 v6, 0x10

    invoke-direct {p0, v6}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x6

    invoke-direct {p0, v7}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x7

    invoke-direct {p0, v8}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    aput-object v6, v4, v5

    const/16 v5, 0x8

    const/16 v6, 0x10

    .line 178
    invoke-direct {p0, v6}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    aput-object v6, v4, v5

    const/16 v5, 0x9

    invoke-direct {p0, v7}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    aput-object v6, v4, v5

    const/16 v5, 0xa

    const/16 v6, 0xc

    invoke-direct {p0, v6}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    aput-object v6, v4, v5

    const/16 v5, 0xb

    .line 179
    invoke-direct {p0, v8}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    aput-object v6, v4, v5

    const/16 v5, 0xc

    const/16 v6, 0x8

    invoke-direct {p0, v6}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    aput-object v6, v4, v5

    const/16 v5, 0xd

    invoke-direct {p0, v8}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    aput-object v6, v4, v5

    const/16 v5, 0xe

    const/16 v6, 0x8

    invoke-direct {p0, v6}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    aput-object v6, v4, v5

    const/16 v5, 0xf

    invoke-direct {p0, v8}, Lcom/gemini/chat/SettingsActivity;->fill(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    aput-object v6, v4, v5

    .line 172
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/gemini/chat/SettingsActivity;->insert(Landroid/view/ViewGroup;I[Landroid/view/View;[Landroid/widget/LinearLayout$LayoutParams;)I

    .line 182
    invoke-direct {p0}, Lcom/gemini/chat/SettingsActivity;->load()V

    .line 183
    iget-object v1, p0, Lcom/gemini/chat/SettingsActivity;->spinnerModel:Landroid/widget/Spinner;

    new-instance v2, Lcom/gemini/chat/SettingsActivity$1;

    invoke-direct {v2, p0}, Lcom/gemini/chat/SettingsActivity$1;-><init>(Lcom/gemini/chat/SettingsActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 191
    iget-object v1, p0, Lcom/gemini/chat/SettingsActivity;->spLiveModel:Landroid/widget/Spinner;

    new-instance v2, Lcom/gemini/chat/SettingsActivity$2;

    invoke-direct {v2, p0}, Lcom/gemini/chat/SettingsActivity$2;-><init>(Lcom/gemini/chat/SettingsActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 199
    new-instance v1, Lcom/gemini/chat/SettingsActivity$3;

    invoke-direct {v1, p0}, Lcom/gemini/chat/SettingsActivity$3;-><init>(Lcom/gemini/chat/SettingsActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 204
    invoke-static {p0}, Lcom/gemini/chat/ConfigBinder;->bind(Landroid/app/Activity;)V

    .line 205
    invoke-static {p0}, Lcom/gemini/chat/TimeGrounding;->bindSetting(Landroid/app/Activity;)V

    .line 206
    return-void
.end method
