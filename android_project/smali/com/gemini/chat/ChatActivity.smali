.class public Lcom/gemini/chat/ChatActivity;
.super Landroid/app/Activity;
.source "ChatActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gemini/chat/ChatActivity$AttachImageTask;,
        Lcom/gemini/chat/ChatActivity$GeminiTask;,
        Lcom/gemini/chat/ChatActivity$SparkleView;,
        Lcom/gemini/chat/ChatActivity$MessageMenu;
    }
.end annotation


# static fields
.field static final API:Ljava/lang/String; = "https://generativelanguage.googleapis.com/v1beta/models/"

.field private static final A_COPY:I = 0x0

.field private static final A_COPY_CODE:I = 0x1

.field private static final A_DELETE:I = 0x5

.field private static final A_EDIT:I = 0x3

.field private static final A_READ:I = 0x8

.field private static final A_REGEN:I = 0x4

.field private static final A_RETRY:I = 0x6

.field private static final A_SHARE:I = 0x2

.field private static final A_STOP_READ:I = 0x9

.field private static final A_THOUGHTS:I = 0x7

.field static final DEFAULT_MODEL:Ljava/lang/String; = "gemini-3.5-flash-lite"

.field private static final HINT_IDLE:Ljava/lang/String; = "Message Gemini..."

.field private static final MENU_ATTACH:I = 0x3

.field private static final MENU_DELETE_CHAT:I = 0x2

.field private static final MENU_DETACH:I = 0x4

.field private static final MENU_LIVE:I = 0x5

.field private static final MENU_SETTINGS:I = 0x1

.field private static final MENU_STOP_READING:I = 0x6

.field static final PREFS:Ljava/lang/String; = "GeminiPrefs"

.field private static final REQ_IMAGE:I = 0x64

.field private static final REQ_LIVE:I = 0x65

.field static final TITLE_MODEL:Ljava/lang/String; = "gemini-3.5-flash-lite"


# instance fields
.field private attachBar:Landroid/widget/LinearLayout;

.field private attachLabel:Landroid/widget/TextView;

.field private attachTask:Lcom/gemini/chat/ChatActivity$AttachImageTask;

.field private attachThumb:Landroid/widget/ImageView;

.field private btnSend:Landroid/widget/Button;

.field private btnStop:Landroid/widget/Button;

.field private chatId:J

.field private currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

.field private dbHelper:Lcom/gemini/chat/DatabaseHelper;

.field private etInput:Landroid/widget/EditText;

.field private final handler:Landroid/os/Handler;

.field private layoutChat:Landroid/widget/LinearLayout;

.field private pendingImage:Ljava/lang/String;

.field private placeholderConfig:Landroid/widget/TextView;

.field private pulseScheduled:Z

.field private readBar:Landroid/widget/LinearLayout;

.field private readLabel:Landroid/widget/TextView;

.field private reader:Lcom/gemini/chat/ReadAloud;

.field private renderedTextSp:F

.field private scrollChat:Landroid/widget/ScrollView;

.field private final scrollDownRunnable:Ljava/lang/Runnable;

.field private streamModel:Ljava/lang/String;

.field private streamText:Ljava/lang/String;

.field private streamThoughts:Ljava/lang/String;

.field private streamView:Landroid/widget/TextView;

.field private thinkingDots:I

.field private final thinkingPulse:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 57
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 74
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->handler:Landroid/os/Handler;

    .line 78
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    .line 79
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    .line 97
    new-instance v0, Lcom/gemini/chat/ChatActivity$1;

    invoke-direct {v0, p0}, Lcom/gemini/chat/ChatActivity$1;-><init>(Lcom/gemini/chat/ChatActivity;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollDownRunnable:Ljava/lang/Runnable;

    .line 607
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamModel:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamThoughts:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamText:Ljava/lang/String;

    .line 608
    const/4 v0, 0x1

    iput v0, p0, Lcom/gemini/chat/ChatActivity;->thinkingDots:I

    .line 611
    new-instance v0, Lcom/gemini/chat/ChatActivity$3;

    invoke-direct {v0, p0}, Lcom/gemini/chat/ChatActivity$3;-><init>(Lcom/gemini/chat/ChatActivity;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->thinkingPulse:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/gemini/chat/ChatActivity;)Landroid/widget/ScrollView;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/gemini/chat/ChatActivity;)Landroid/widget/LinearLayout;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->maybeAutoName()V

    return-void
.end method

.method static synthetic access$1100(Lcom/gemini/chat/ChatActivity;)J
    .locals 2

    .prologue
    .line 57
    iget-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    return-wide v0
.end method

.method static synthetic access$1202(Lcom/gemini/chat/ChatActivity;Z)Z
    .locals 0

    .prologue
    .line 57
    iput-boolean p1, p0, Lcom/gemini/chat/ChatActivity;->pulseScheduled:Z

    return p1
.end method

.method static synthetic access$1300(Lcom/gemini/chat/ChatActivity;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/gemini/chat/ChatActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamText:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/gemini/chat/ChatActivity;)I
    .locals 1

    .prologue
    .line 57
    iget v0, p0, Lcom/gemini/chat/ChatActivity;->thinkingDots:I

    return v0
.end method

.method static synthetic access$1502(Lcom/gemini/chat/ChatActivity;I)I
    .locals 0

    .prologue
    .line 57
    iput p1, p0, Lcom/gemini/chat/ChatActivity;->thinkingDots:I

    return p1
.end method

.method static synthetic access$1600(Lcom/gemini/chat/ChatActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamModel:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/gemini/chat/ChatActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamThoughts:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->scheduleThinkingPulse()V

    return-void
.end method

.method static synthetic access$1900(Lcom/gemini/chat/ChatActivity;)Z
    .locals 1

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->canSend()Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/DatabaseHelper;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/gemini/chat/ChatActivity;)Landroid/widget/Button;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->send()V

    return-void
.end method

.method static synthetic access$2300(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->cancelTask()V

    return-void
.end method

.method static synthetic access$2600(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopReading()V

    return-void
.end method

.method static synthetic access$2700(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/gemini/chat/ChatActivity;->setAttachment(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2800(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->pickImage()V

    return-void
.end method

.method static synthetic access$2900(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ChatActivity$AttachImageTask;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachTask:Lcom/gemini/chat/ChatActivity$AttachImageTask;

    return-object v0
.end method

.method static synthetic access$2902(Lcom/gemini/chat/ChatActivity;Lcom/gemini/chat/ChatActivity$AttachImageTask;)Lcom/gemini/chat/ChatActivity$AttachImageTask;
    .locals 0

    .prologue
    .line 57
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity;->attachTask:Lcom/gemini/chat/ChatActivity$AttachImageTask;

    return-object p1
.end method

.method static synthetic access$300(Lcom/gemini/chat/ChatActivity;Z)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/gemini/chat/ChatActivity;->setUiLoading(Z)V

    return-void
.end method

.method static synthetic access$3000(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lcom/gemini/chat/ChatActivity;->setAttachment(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method static synthetic access$3100(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ReadAloud;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->reader:Lcom/gemini/chat/ReadAloud;

    return-object v0
.end method

.method static synthetic access$3102(Lcom/gemini/chat/ChatActivity;Lcom/gemini/chat/ReadAloud;)Lcom/gemini/chat/ReadAloud;
    .locals 0

    .prologue
    .line 57
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity;->reader:Lcom/gemini/chat/ReadAloud;

    return-object p1
.end method

.method static synthetic access$3200(Lcom/gemini/chat/ChatActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->lastSavedRole()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3300(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lcom/gemini/chat/ChatActivity;->copy(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3400(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;)V
    .locals 1

    .prologue
    .line 57
    invoke-direct {p0, p1, p2, p3}, Lcom/gemini/chat/ChatActivity;->readAloud(JLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$3500(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 57
    invoke-direct/range {p0 .. p5}, Lcom/gemini/chat/ChatActivity;->showEditDialog(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3600(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;)V
    .locals 1

    .prologue
    .line 57
    invoke-direct {p0, p1, p2, p3}, Lcom/gemini/chat/ChatActivity;->regenerate(JLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$3700(Lcom/gemini/chat/ChatActivity;J)V
    .locals 1

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lcom/gemini/chat/ChatActivity;->confirmDelete(J)V

    return-void
.end method

.method static synthetic access$3800(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->retryLast()V

    return-void
.end method

.method static synthetic access$3900(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lcom/gemini/chat/ChatActivity;->showThoughts(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0, p1, p2, p3}, Lcom/gemini/chat/ChatActivity;->showStreaming(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$4000(Lcom/gemini/chat/ChatActivity;)Landroid/widget/LinearLayout;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->readBar:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$4100(Lcom/gemini/chat/ChatActivity;Z)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    return-void
.end method

.method static synthetic access$4200(Lcom/gemini/chat/ChatActivity;Landroid/view/View;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/gemini/chat/ChatActivity;->hideKeyboard(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$4300(Lcom/gemini/chat/ChatActivity;)Z
    .locals 1

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->hasApiKey()Z

    move-result v0

    return v0
.end method

.method static synthetic access$4400(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->startRequest()V

    return-void
.end method

.method static synthetic access$500(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ChatActivity$GeminiTask;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    return-object v0
.end method

.method static synthetic access$502(Lcom/gemini/chat/ChatActivity;Lcom/gemini/chat/ChatActivity$GeminiTask;)Lcom/gemini/chat/ChatActivity$GeminiTask;
    .locals 0

    .prologue
    .line 57
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    return-object p1
.end method

.method static synthetic access$600(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->removeStreaming()V

    return-void
.end method

.method static synthetic access$700(Lcom/gemini/chat/ChatActivity;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$800(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Z)V
    .locals 0

    .prologue
    .line 57
    invoke-direct/range {p0 .. p9}, Lcom/gemini/chat/ChatActivity;->addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$900(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->scrollChatDown()V

    return-void
.end method

.method private activeConfigSummary()Ljava/lang/String;
    .locals 5

    .prologue
    .line 1081
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1082
    const-string v1, "model"

    const-string v2, "gemini-3.5-flash-lite"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1083
    const-string v1, "thinking_level"

    const-string v3, ""

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1084
    const-string v1, "Default"

    .line 1085
    const/4 v0, 0x0

    :goto_0
    sget-object v4, Lcom/gemini/chat/SettingsActivity;->THINKING_VALUES:[Ljava/lang/String;

    array-length v4, v4

    if-ge v0, v4, :cond_1

    .line 1086
    sget-object v4, Lcom/gemini/chat/SettingsActivity;->THINKING_VALUES:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1087
    sget-object v1, Lcom/gemini/chat/SettingsActivity;->THINKING_LABELS:[Ljava/lang/String;

    aget-object v0, v1, v0

    .line 1091
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u00b7 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1085
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    move-object v0, v1

    goto :goto_1
.end method

.method private addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 10

    .prologue
    .line 1152
    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-wide/from16 v6, p6

    invoke-direct/range {v0 .. v9}, Lcom/gemini/chat/ChatActivity;->addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Z)V

    .line 1153
    return-void
.end method

.method private addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Z)V
    .locals 19

    .prologue
    .line 1157
    new-instance v9, Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-direct {v9, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1158
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v2, p0

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-wide/from16 v6, p6

    .line 1159
    invoke-static/range {v2 .. v8}, Lcom/gemini/chat/MessageFormatter;->format(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/ArrayList;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v9, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1160
    move-object/from16 v0, p3

    invoke-static {v9, v0}, Lcom/gemini/chat/MessageFormatter;->styleView(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 1161
    new-instance v10, Lcom/gemini/chat/ChatActivity$MessageMenu;

    move-object/from16 v11, p0

    move-wide/from16 v12, p1

    move-object/from16 v14, p3

    move-object/from16 v15, p4

    move-object/from16 v16, p5

    move-object/from16 v17, v8

    move-object/from16 v18, p8

    invoke-direct/range {v10 .. v18}, Lcom/gemini/chat/ChatActivity$MessageMenu;-><init>(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1162
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1163
    if-eqz p9, :cond_0

    .line 1164
    new-instance v2, Landroid/view/animation/AlphaAnimation;

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v2, v3, v4}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 1165
    const-wide/16 v4, 0xa0

    invoke-virtual {v2, v4, v5}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 1166
    invoke-virtual {v9, v2}, Landroid/widget/TextView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1168
    :cond_0
    return-void
.end method

.method private buildAttachBar()V
    .locals 8

    .prologue
    const/high16 v4, 0x42200000    # 40.0f

    const/high16 v7, 0x40800000    # 4.0f

    const/4 v6, -0x2

    const/4 v5, 0x0

    .line 904
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    .line 905
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 906
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 907
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-direct {p0, v1}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v1

    invoke-direct {p0, v7}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    invoke-direct {p0, v3}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v3

    invoke-virtual {v0, v1, v2, v3, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 908
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 910
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    .line 911
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 912
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v4}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v3

    invoke-direct {p0, v4}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 914
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    .line 915
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 916
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-direct {p0, v1}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v1

    invoke-direct {p0, v7}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v2

    invoke-virtual {v0, v1, v5, v2, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 917
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 918
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v2, v5, v6, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 920
    new-instance v0, Landroid/widget/Button;

    const/4 v1, 0x0

    const v2, 0x1010049

    invoke-direct {v0, p0, v1, v2}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 921
    const-string v1, "Remove"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 922
    new-instance v1, Lcom/gemini/chat/ChatActivity$8;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$8;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 927
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 931
    new-instance v0, Lcom/gemini/chat/ChatActivity$9;

    invoke-direct {v0, p0}, Lcom/gemini/chat/ChatActivity$9;-><init>(Lcom/gemini/chat/ChatActivity;)V

    .line 936
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 937
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 940
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 941
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 943
    return-void
.end method

.method private buildReadBar()V
    .locals 11

    .prologue
    const/4 v10, 0x1

    const v9, -0x7e366b

    const/4 v8, 0x0

    const/high16 v7, 0x40800000    # 4.0f

    const/4 v6, -0x2

    .line 873
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->readBar:Landroid/widget/LinearLayout;

    .line 874
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->readBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 875
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->readBar:Landroid/widget/LinearLayout;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 876
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->readBar:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/graphics/drawable/LayerDrawable;

    const/4 v2, 0x2

    new-array v2, v2, [Landroid/graphics/drawable/Drawable;

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    const v4, -0xe4dbe0

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    aput-object v3, v2, v8

    new-instance v3, Lcom/gemini/chat/MessageFormatter$RoleBar;

    const/4 v4, 0x2

    const/high16 v5, 0x40400000    # 3.0f

    .line 878
    invoke-direct {p0, v5}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-direct {v3, v9, v4}, Lcom/gemini/chat/MessageFormatter$RoleBar;-><init>(II)V

    aput-object v3, v2, v10

    invoke-direct {v1, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 876
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 879
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->readBar:Landroid/widget/LinearLayout;

    const/high16 v1, 0x41200000    # 10.0f

    invoke-direct {p0, v1}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v1

    invoke-direct {p0, v7}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v2

    invoke-direct {p0, v7}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v3

    invoke-direct {p0, v7}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 880
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->readBar:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 882
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->readLabel:Landroid/widget/TextView;

    .line 883
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->readLabel:Landroid/widget/TextView;

    const/high16 v1, 0x41500000    # 13.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 884
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->readLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 885
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->readLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 886
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->readBar:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->readLabel:Landroid/widget/TextView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v2, v8, v6, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 888
    new-instance v0, Landroid/widget/Button;

    const/4 v1, 0x0

    const v2, 0x1010049

    invoke-direct {v0, p0, v1, v2}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 889
    const-string v1, "Stop"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 890
    new-instance v1, Lcom/gemini/chat/ChatActivity$7;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$7;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 895
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->readBar:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 898
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 899
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->readBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 901
    return-void
.end method

.method private canSend()Z
    .locals 1

    .prologue
    .line 790
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachTask:Lcom/gemini/chat/ChatActivity$AttachImageTask;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private cancelAttachTask()V
    .locals 2

    .prologue
    .line 782
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachTask:Lcom/gemini/chat/ChatActivity$AttachImageTask;

    .line 783
    if-eqz v0, :cond_0

    .line 784
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/gemini/chat/ChatActivity$AttachImageTask;->cancel(Z)Z

    .line 785
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachTask:Lcom/gemini/chat/ChatActivity$AttachImageTask;

    .line 787
    :cond_0
    return-void
.end method

.method private cancelTask()V
    .locals 2

    .prologue
    .line 772
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->removeStreaming()V

    .line 773
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    .line 774
    if-eqz v0, :cond_0

    .line 775
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/gemini/chat/ChatActivity$GeminiTask;->cancel(Z)Z

    .line 776
    invoke-virtual {v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnectAsync()V

    .line 777
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    .line 779
    :cond_0
    return-void
.end method

.method static cleanTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v3, 0x0

    const/16 v7, 0x28

    const/4 v2, 0x0

    .line 579
    if-nez p0, :cond_1

    move-object v0, v3

    .line 594
    :cond_0
    :goto_0
    return-object v0

    .line 580
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 581
    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 582
    if-ltz v1, :cond_2

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 583
    :cond_2
    const-string v1, "Title:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "title:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_3
    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 584
    :cond_4
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    move v1, v2

    .line 585
    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_7

    .line 586
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 587
    const/16 v6, 0x2a

    if-eq v5, v6, :cond_5

    const/16 v6, 0x23

    if-eq v5, v6, :cond_5

    const/16 v6, 0x60

    if-eq v5, v6, :cond_5

    const/16 v6, 0x22

    if-eq v5, v6, :cond_5

    const/16 v6, 0x201c

    if-eq v5, v6, :cond_5

    const/16 v6, 0x201d

    if-ne v5, v6, :cond_6

    .line 585
    :cond_5
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 588
    :cond_6
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 590
    :cond_7
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 591
    :goto_3
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    :cond_8
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 592
    :cond_9
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_a

    move-object v0, v3

    goto/16 :goto_0

    .line 593
    :cond_a
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v7, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0
.end method

.method private confirmDelete(J)V
    .locals 3

    .prologue
    .line 1426
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Delete Message"

    .line 1427
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Delete this message? Later messages are kept."

    .line 1428
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Delete"

    new-instance v2, Lcom/gemini/chat/ChatActivity$13;

    invoke-direct {v2, p0, p1, p2}, Lcom/gemini/chat/ChatActivity$13;-><init>(Lcom/gemini/chat/ChatActivity;J)V

    .line 1429
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Cancel"

    const/4 v2, 0x0

    .line 1435
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1436
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1437
    return-void
.end method

.method private copy(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 1386
    const-string v0, "clipboard"

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 1387
    invoke-virtual {v0, p1}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 1388
    const/4 v0, 0x0

    invoke-static {p0, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1389
    return-void
.end method

.method private dp(F)I
    .locals 2

    .prologue
    .line 869
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity;->getResources()Landroid/content/res/Resources;

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

.method static friendlyError(ILjava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 181
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 182
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 183
    const/16 v1, 0x1ad

    if-ne p0, v1, :cond_2

    const-string v1, "settings"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_2

    .line 184
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nTip: Rate limit reached. Wait a minute before retrying, or switch models in Settings."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 189
    :cond_1
    :goto_0
    return-object p1

    .line 186
    :cond_2
    const/16 v1, 0x1f7

    if-ne p0, v1, :cond_1

    const-string v1, "settings"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_1

    .line 187
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nTip: Model is busy right now. Wait a few seconds before retrying, or switch models in Settings."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private hasApiKey()Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    .line 807
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "api_key"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 809
    :goto_0
    return v0

    .line 808
    :cond_0
    const-string v1, "Please go to Settings to set API Key"

    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 809
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private hideKeyboard(Landroid/view/View;)V
    .locals 3

    .prologue
    .line 802
    const-string v0, "input_method"

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 803
    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 804
    :cond_0
    return-void
.end method

.method private lastSavedRole()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1217
    iget-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->getLastSavedRole(J)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private loadMessages(Z)V
    .locals 21

    .prologue
    .line 1172
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    invoke-virtual {v2}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v14

    .line 1173
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 1174
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/gemini/chat/ChatActivity;->placeholderConfig:Landroid/widget/TextView;

    .line 1175
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->stopThinkingPulse()V

    .line 1176
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    .line 1177
    const/4 v4, 0x0

    .line 1178
    const/4 v3, 0x0

    .line 1180
    :try_start_0
    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-wide/16 v8, -0x1

    cmp-long v2, v6, v8

    if-eqz v2, :cond_9

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v2, v6, v7}, Lcom/gemini/chat/DatabaseHelper;->getMessages(J)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v12

    .line 1181
    :goto_0
    if-eqz v12, :cond_0

    :try_start_1
    invoke-interface {v12}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1182
    const-string v2, "_id"

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    const-string v2, "role"

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v16

    const-string v2, "model"

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v17

    .line 1183
    const-string v2, "content"

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v18

    const-string v2, "timestamp"

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v19

    .line 1184
    const-string v2, "thoughts"

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v20

    move v13, v4

    .line 1186
    :goto_1
    :try_start_2
    invoke-interface {v12, v15}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    move/from16 v0, v16

    invoke-interface {v12, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v2, -0x1

    move/from16 v0, v17

    if-eq v0, v2, :cond_3

    move/from16 v0, v17

    invoke-interface {v12, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 1187
    :goto_2
    move/from16 v0, v18

    invoke-interface {v12, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v2, -0x1

    move/from16 v0, v19

    if-eq v0, v2, :cond_4

    move/from16 v0, v19

    invoke-interface {v12, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 1188
    :goto_3
    const/4 v2, -0x1

    move/from16 v0, v20

    if-eq v0, v2, :cond_5

    move/from16 v0, v20

    invoke-interface {v12, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    :goto_4
    const/4 v11, 0x0

    move-object/from16 v2, p0

    .line 1186
    invoke-direct/range {v2 .. v11}, Lcom/gemini/chat/ChatActivity;->addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1189
    const/4 v4, 0x1

    .line 1190
    :try_start_3
    invoke-interface {v12}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result v2

    if-nez v2, :cond_8

    .line 1195
    :cond_0
    if-eqz v12, :cond_1

    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 1197
    :cond_1
    :goto_5
    if-nez v4, :cond_2

    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->showPlaceholder()V

    .line 1198
    :cond_2
    invoke-static/range {p0 .. p0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    .line 1199
    if-eqz p1, :cond_7

    .line 1200
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    new-instance v3, Lcom/gemini/chat/ChatActivity$10;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v14}, Lcom/gemini/chat/ChatActivity$10;-><init>(Lcom/gemini/chat/ChatActivity;I)V

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 1208
    :goto_6
    return-void

    .line 1186
    :cond_3
    const/4 v6, 0x0

    goto :goto_2

    .line 1187
    :cond_4
    const-wide/16 v8, 0x0

    goto :goto_3

    .line 1188
    :cond_5
    const/4 v10, 0x0

    goto :goto_4

    .line 1192
    :catch_0
    move-exception v2

    .line 1193
    :goto_7
    :try_start_4
    const-string v5, "Gemini"

    const-string v6, "Error loading messages"

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 1195
    if-eqz v3, :cond_1

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    goto :goto_5

    :catchall_0
    move-exception v2

    move-object v12, v3

    :goto_8
    if-eqz v12, :cond_6

    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 1196
    :cond_6
    throw v2

    .line 1206
    :cond_7
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->scrollChatDown()V

    goto :goto_6

    .line 1195
    :catchall_1
    move-exception v2

    goto :goto_8

    :catchall_2
    move-exception v2

    move-object v12, v3

    goto :goto_8

    .line 1192
    :catch_1
    move-exception v2

    move-object v3, v12

    goto :goto_7

    :catch_2
    move-exception v2

    move-object v3, v12

    move v4, v13

    goto :goto_7

    :cond_8
    move v13, v4

    goto/16 :goto_1

    :cond_9
    move-object v12, v3

    goto/16 :goto_0
.end method

.method static maxRetriesFor(ILjava/lang/String;)I
    .locals 2

    .prologue
    .line 144
    invoke-static {p0}, Lcom/gemini/chat/ChatActivity;->retryable(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 151
    :goto_0
    return v0

    .line 145
    :cond_0
    const/16 v0, 0x1f7

    if-ne p0, v0, :cond_2

    if-eqz p1, :cond_2

    .line 146
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 147
    const-string v1, "high demand"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_1

    const-string v1, "overloaded"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_1

    const-string v1, "unavailable"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_2

    .line 148
    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    .line 151
    :cond_2
    const/4 v0, 0x2

    goto :goto_0
.end method

.method private maybeAutoName()V
    .locals 4

    .prologue
    .line 598
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    new-instance v1, Lcom/gemini/chat/ChatActivity$2;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$2;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-static {p0, v0, v2, v3, v1}, Lcom/gemini/chat/AutoNamer;->maybeStart(Landroid/content/Context;Lcom/gemini/chat/DatabaseHelper;JLcom/gemini/chat/AutoNamer$Callback;)V

    .line 603
    return-void
.end method

.method static parseRetryAfterMs(Ljava/lang/String;)J
    .locals 10

    .prologue
    const-wide/16 v0, -0x1

    .line 156
    if-nez p0, :cond_1

    .line 164
    :cond_0
    :goto_0
    return-wide v0

    .line 157
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 158
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_0

    .line 160
    :try_start_0
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 161
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-lez v4, :cond_0

    .line 162
    const-wide/16 v4, 0x7d0

    const-wide/16 v6, 0x4e20

    const-wide/16 v8, 0x3e8

    mul-long/2addr v2, v8

    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    goto :goto_0

    .line 163
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private pickImage()V
    .locals 3

    .prologue
    .line 998
    new-instance v1, Landroid/content/Intent;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v0, v2, :cond_0

    const-string v0, "android.intent.action.OPEN_DOCUMENT"

    .line 999
    :goto_0
    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1000
    const-string v0, "image/*"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 1001
    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1003
    const/16 v0, 0x64

    :try_start_0
    invoke-virtual {p0, v1, v0}, Lcom/gemini/chat/ChatActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1007
    :goto_1
    return-void

    .line 999
    :cond_0
    const-string v0, "android.intent.action.GET_CONTENT"

    goto :goto_0

    .line 1004
    :catch_0
    move-exception v0

    .line 1005
    const-string v0, "No app available to pick an image."

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_1
.end method

.method private prefs()Landroid/content/SharedPreferences;
    .locals 2

    .prologue
    .line 794
    const-string v0, "GeminiPrefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/gemini/chat/ChatActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method static readAll(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    if-nez p0, :cond_0

    const-string v0, ""

    .line 117
    :goto_0
    return-object v0

    .line 111
    :cond_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v0, Ljava/io/InputStreamReader;

    const-string v2, "UTF-8"

    invoke-direct {v0, p0, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v1, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 113
    :try_start_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 114
    const/16 v2, 0x800

    new-array v2, v2, [C

    .line 116
    :goto_1
    invoke-virtual {v1, v2}, Ljava/io/BufferedReader;->read([C)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v4, v3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 119
    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 120
    throw v0

    .line 117
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 119
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    goto :goto_0
.end method

.method private readAloud(JLjava/lang/String;)V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 1323
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "api_key"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 1324
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 1325
    const-string v0, "Please go to Settings to set API Key"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1353
    :goto_0
    return-void

    .line 1328
    :cond_0
    invoke-static {p3}, Lcom/gemini/chat/ReadAloud;->speakable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1329
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 1330
    const-string v0, "Nothing to read in this message."

    invoke-static {p0, v0, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1333
    :cond_1
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopReading()V

    .line 1334
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1335
    const-string v1, "live_voice"

    const-string v2, "Kore"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1336
    const-string v1, "tts_model"

    sget-object v2, Lcom/gemini/chat/ReadAloud;->DEFAULT_MODEL:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1337
    new-instance v1, Lcom/gemini/chat/ReadAloud;

    iget-object v8, p0, Lcom/gemini/chat/ChatActivity;->handler:Landroid/os/Handler;

    new-instance v9, Lcom/gemini/chat/ChatActivity$11;

    invoke-direct {v9, p0}, Lcom/gemini/chat/ChatActivity$11;-><init>(Lcom/gemini/chat/ChatActivity;)V

    move-wide v2, p1

    invoke-direct/range {v1 .. v9}, Lcom/gemini/chat/ReadAloud;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;Lcom/gemini/chat/ReadAloud$Listener;)V

    iput-object v1, p0, Lcom/gemini/chat/ChatActivity;->reader:Lcom/gemini/chat/ReadAloud;

    .line 1347
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->reader:Lcom/gemini/chat/ReadAloud;

    invoke-virtual {v0}, Lcom/gemini/chat/ReadAloud;->start()V

    .line 1348
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->readBar:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_2

    .line 1349
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->readLabel:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Reading aloud ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1350
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->readBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v10}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1352
    :cond_2
    invoke-static {p0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    goto :goto_0
.end method

.method private regenerate(JLjava/lang/String;)V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 1396
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->hasApiKey()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1413
    :goto_0
    return-void

    .line 1397
    :cond_0
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopReading()V

    .line 1398
    const-string v0, "user"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1399
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v2, v3, p1, p2}, Lcom/gemini/chat/DatabaseHelper;->deleteMessagesAfter(JJ)V

    .line 1400
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    move-wide v4, p1

    invoke-virtual/range {v1 .. v7}, Lcom/gemini/chat/DatabaseHelper;->touchMessageTimestamp(JJJ)V

    .line 1406
    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->lastSavedRole()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3

    .line 1407
    invoke-direct {p0, v8}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 1408
    const-string v0, "Nothing left to answer."

    invoke-static {p0, v0, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1402
    :cond_2
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v2, v3, p1, p2}, Lcom/gemini/chat/DatabaseHelper;->deleteMessagesFrom(JJ)V

    .line 1403
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-string v1, "user"

    invoke-virtual {v0, v2, v3, v1}, Lcom/gemini/chat/DatabaseHelper;->getLastMessageId(JLjava/lang/String;)J

    move-result-wide v4

    .line 1404
    const-wide/16 v0, -0x1

    cmp-long v0, v4, v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual/range {v1 .. v7}, Lcom/gemini/chat/DatabaseHelper;->touchMessageTimestamp(JJJ)V

    goto :goto_1

    .line 1411
    :cond_3
    invoke-direct {p0, v8}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 1412
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->startRequest()V

    goto :goto_0
.end method

.method private removePlaceholder()V
    .locals 3

    .prologue
    .line 1145
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const-string v0, "placeholder"

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1146
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 1147
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->placeholderConfig:Landroid/widget/TextView;

    .line 1149
    :cond_0
    return-void
.end method

.method private removeStreaming()V
    .locals 2

    .prologue
    .line 656
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopThinkingPulse()V

    .line 657
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamText:Ljava/lang/String;

    .line 658
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamThoughts:Ljava/lang/String;

    .line 659
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 660
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 661
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    .line 663
    :cond_0
    return-void
.end method

.method static retryDelayMs(IILjava/lang/String;J)J
    .locals 9

    .prologue
    const-wide/16 v2, 0x0

    const/16 v6, 0x1f7

    .line 170
    invoke-static {p2}, Lcom/gemini/chat/ChatActivity;->parseRetryAfterMs(Ljava/lang/String;)J

    move-result-wide v0

    .line 171
    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 176
    :goto_0
    return-wide v0

    .line 172
    :cond_0
    const/4 v0, 0x1

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 173
    if-ne p1, v6, :cond_2

    const-wide/16 v0, 0x1194

    :goto_1
    add-int/lit8 v4, v4, -0x1

    const/4 v5, 0x3

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    shl-long v4, v0, v4

    .line 174
    if-ne p1, v6, :cond_3

    const-wide/16 v0, 0x3e8

    .line 175
    :goto_2
    const-wide/high16 v6, -0x8000000000000000L

    cmp-long v6, p3, v6

    if-nez v6, :cond_1

    move-wide p3, v2

    :cond_1
    invoke-static {p3, p4}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/16 v6, 0x1

    add-long/2addr v0, v6

    rem-long v0, v2, v0

    .line 176
    const-wide/16 v2, 0x4e20

    add-long/2addr v0, v4

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    goto :goto_0

    .line 173
    :cond_2
    const-wide/16 v0, 0x7d0

    goto :goto_1

    .line 174
    :cond_3
    const-wide/16 v0, 0x1f4

    goto :goto_2
.end method

.method private retryLast()V
    .locals 8

    .prologue
    .line 1417
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->hasApiKey()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1423
    :goto_0
    return-void

    .line 1418
    :cond_0
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopReading()V

    .line 1419
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-string v1, "user"

    invoke-virtual {v0, v2, v3, v1}, Lcom/gemini/chat/DatabaseHelper;->getLastMessageId(JLjava/lang/String;)J

    move-result-wide v4

    .line 1420
    const-wide/16 v0, -0x1

    cmp-long v0, v4, v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual/range {v1 .. v7}, Lcom/gemini/chat/DatabaseHelper;->touchMessageTimestamp(JJJ)V

    .line 1421
    :cond_1
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 1422
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->startRequest()V

    goto :goto_0
.end method

.method static retryable(I)Z
    .locals 1

    .prologue
    .line 136
    const/16 v0, 0x1f4

    if-eq p0, v0, :cond_0

    const/16 v0, 0x1f6

    if-eq p0, v0, :cond_0

    const/16 v0, 0x1f7

    if-eq p0, v0, :cond_0

    const/16 v0, 0x1f8

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private scheduleThinkingPulse()V
    .locals 4

    .prologue
    .line 622
    iget-boolean v0, p0, Lcom/gemini/chat/ChatActivity;->pulseScheduled:Z

    if-eqz v0, :cond_0

    .line 625
    :goto_0
    return-void

    .line 623
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/gemini/chat/ChatActivity;->pulseScheduled:Z

    .line 624
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->thinkingPulse:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1c2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method private scrollChatDown()V
    .locals 2

    .prologue
    .line 1211
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->scrollDownRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1212
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->scrollDownRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 1213
    return-void
.end method

.method private send()V
    .locals 20

    .prologue
    .line 813
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/gemini/chat/ChatActivity;->hideKeyboard(Landroid/view/View;)V

    .line 814
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 815
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->hasApiKey()Z

    move-result v2

    if-nez v2, :cond_1

    .line 833
    :cond_0
    :goto_0
    return-void

    .line 816
    :cond_1
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 817
    :cond_2
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->removePlaceholder()V

    .line 818
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-nez v2, :cond_4

    .line 819
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "Image"

    .line 820
    :goto_1
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x19

    if-le v3, v4, :cond_3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    const/16 v5, 0x19

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 821
    :cond_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    invoke-virtual {v3, v2}, Lcom/gemini/chat/DatabaseHelper;->createChat(Ljava/lang/String;)J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/gemini/chat/ChatActivity;->chatId:J

    .line 822
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/gemini/chat/ChatActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 823
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 825
    :cond_4
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    .line 826
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    .line 827
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-string v6, "user"

    invoke-virtual/range {v3 .. v8}, Lcom/gemini/chat/DatabaseHelper;->addMessage(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v11

    .line 828
    const-string v13, "user"

    const/16 v18, 0x0

    const/16 v19, 0x1

    move-object/from16 v10, p0

    move-object v14, v8

    move-object v15, v7

    invoke-direct/range {v10 .. v19}, Lcom/gemini/chat/ChatActivity;->addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Z)V

    .line 829
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/gemini/chat/ChatActivity;->setAttachment(Ljava/lang/String;)V

    .line 830
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 831
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->scrollChatDown()V

    .line 832
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->startRequest()V

    goto/16 :goto_0

    .line 819
    :cond_5
    const/16 v2, 0xa

    const/16 v3, 0x20

    invoke-virtual {v7, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    goto :goto_1
.end method

.method private setAttachment(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 946
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/gemini/chat/ChatActivity;->setAttachment(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 947
    return-void
.end method

.method private setAttachment(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 8

    .prologue
    .line 950
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->cancelAttachTask()V

    .line 951
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    .line 952
    if-nez p1, :cond_1

    .line 953
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 954
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 963
    :goto_0
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->canSend()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 964
    :cond_0
    invoke-static {p0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    .line 965
    return-void

    .line 956
    :cond_1
    if-eqz p2, :cond_2

    .line 957
    :goto_1
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 958
    const/16 v0, 0x2c

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 959
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int v0, v1, v0

    add-int/lit8 v0, v0, -0x1

    int-to-long v0, v0

    const-wide/16 v2, 0x3

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x4

    div-long/2addr v0, v2

    .line 960
    iget-object v2, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Image attached ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-wide/16 v4, 0x1

    const-wide/16 v6, 0x200

    add-long/2addr v0, v6

    const-wide/16 v6, 0x400

    div-long/2addr v0, v6

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " KB)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 961
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0

    .line 956
    :cond_2
    const/high16 v0, 0x42200000    # 40.0f

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v0

    invoke-static {p1, v0}, Lcom/gemini/chat/Thumbnail;->fromDataUri(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object p2

    goto :goto_1
.end method

.method private setUiLoading(Z)V
    .locals 4

    .prologue
    const/16 v3, 0x8

    const/4 v1, 0x0

    .line 851
    iget-object v2, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 852
    if-eqz p1, :cond_1

    .line 853
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    const-string v2, "Model is generating..."

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 854
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 855
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnStop:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 862
    :goto_1
    return-void

    :cond_0
    move v0, v1

    .line 851
    goto :goto_0

    .line 857
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    const-string v2, "Message Gemini..."

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 858
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnStop:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 859
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 860
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->canSend()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_1
.end method

.method private showEditDialog(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    .prologue
    const/4 v0, 0x1

    .line 1444
    const-string v1, "user"

    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 1445
    if-eqz v1, :cond_0

    if-eqz p4, :cond_0

    const-string v2, "data:image/"

    invoke-virtual {p4, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v3, v0

    .line 1446
    :goto_0
    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 1447
    invoke-virtual {v2, p5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1448
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->length()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setSelection(I)V

    .line 1449
    const/16 v4, 0x30

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setGravity(I)V

    .line 1451
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v4, v4

    const v5, 0x3ecccccd    # 0.4f

    mul-float/2addr v4, v5

    invoke-virtual {v2}, Landroid/widget/EditText;->getLineHeight()I

    move-result v5

    invoke-static {v0, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v4, v5

    float-to-int v4, v4

    .line 1452
    const/4 v5, 0x3

    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 1453
    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setVerticalScrollBarEnabled(Z)V

    .line 1455
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    if-eqz v1, :cond_1

    const-string v0, "Edit Message"

    :goto_1
    invoke-virtual {v4, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 1456
    if-eqz v1, :cond_2

    .line 1457
    const-string v7, "Resend"

    new-instance v0, Lcom/gemini/chat/ChatActivity$14;

    move-object v1, p0

    move-wide v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/gemini/chat/ChatActivity$14;-><init>(Lcom/gemini/chat/ChatActivity;Landroid/widget/EditText;ZJ)V

    invoke-virtual {v6, v7, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1471
    const-string v7, "Save"

    new-instance v0, Lcom/gemini/chat/ChatActivity$15;

    move-object v1, p0

    move-wide v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/gemini/chat/ChatActivity$15;-><init>(Lcom/gemini/chat/ChatActivity;Landroid/widget/EditText;ZJ)V

    invoke-virtual {v6, v7, v0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1495
    :goto_2
    const-string v0, "Cancel"

    const/4 v1, 0x0

    invoke-virtual {v6, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1496
    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1497
    return-void

    .line 1445
    :cond_0
    const/4 v3, 0x0

    goto :goto_0

    .line 1455
    :cond_1
    const-string v0, "Edit Reply"

    goto :goto_1

    .line 1481
    :cond_2
    const-string v0, "Save"

    new-instance v1, Lcom/gemini/chat/ChatActivity$16;

    invoke-direct {v1, p0, v2, p1, p2}, Lcom/gemini/chat/ChatActivity$16;-><init>(Lcom/gemini/chat/ChatActivity;Landroid/widget/EditText;J)V

    invoke-virtual {v6, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_2
.end method

.method private showPlaceholder()V
    .locals 9

    .prologue
    const/high16 v4, 0x41800000    # 16.0f

    const/high16 v8, 0x41000000    # 8.0f

    const/4 v7, -0x1

    const/16 v6, 0x11

    const/4 v5, -0x2

    .line 1099
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1100
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1101
    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 1102
    const/high16 v1, 0x41a00000    # 20.0f

    invoke-direct {p0, v1}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v1

    invoke-direct {p0, v4}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v2

    const/high16 v3, 0x41a00000    # 20.0f

    invoke-direct {p0, v3}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v3

    invoke-direct {p0, v4}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 1103
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v1, v7, v7, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1105
    const-string v1, "placeholder"

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 1107
    new-instance v1, Lcom/gemini/chat/ChatActivity$SparkleView;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$SparkleView;-><init>(Lcom/gemini/chat/ChatActivity;)V

    .line 1108
    const/high16 v2, 0x42180000    # 38.0f

    invoke-direct {p0, v2}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v2

    .line 1109
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1110
    invoke-direct {p0, v8}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v2

    iput v2, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 1111
    invoke-virtual {v0, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1113
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1114
    const-string v2, "Gemini Chat"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1115
    const/high16 v2, 0x41880000    # 17.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1116
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 1117
    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1118
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 1119
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1121
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1122
    const-string v2, "Type a message below or open Menu for Live Voice."

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1123
    const/high16 v2, 0x41500000    # 13.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1124
    const v2, -0x655f5a

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1125
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 1126
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1128
    const/high16 v3, 0x40800000    # 4.0f

    invoke-direct {p0, v3}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 1129
    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1131
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/gemini/chat/ChatActivity;->placeholderConfig:Landroid/widget/TextView;

    .line 1132
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->placeholderConfig:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->activeConfigSummary()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1133
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->placeholderConfig:Landroid/widget/TextView;

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1134
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->placeholderConfig:Landroid/widget/TextView;

    const v2, -0x754b08

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1135
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->placeholderConfig:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 1136
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1138
    invoke-direct {p0, v8}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 1139
    iget-object v2, p0, Lcom/gemini/chat/ChatActivity;->placeholderConfig:Landroid/widget/TextView;

    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1141
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1142
    return-void
.end method

.method private showStreaming(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 633
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v0

    iget-object v3, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    invoke-virtual {v3}, Landroid/widget/ScrollView;->getHeight()I

    move-result v3

    add-int/2addr v0, v3

    iget-object v3, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v3

    add-int/lit8 v3, v3, -0x8

    if-lt v0, v3, :cond_2

    move v0, v1

    .line 634
    :goto_0
    if-eqz p1, :cond_3

    :goto_1
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity;->streamModel:Ljava/lang/String;

    .line 635
    if-eqz p2, :cond_4

    :goto_2
    iput-object p2, p0, Lcom/gemini/chat/ChatActivity;->streamThoughts:Ljava/lang/String;

    .line 636
    if-eqz p3, :cond_5

    :goto_3
    iput-object p3, p0, Lcom/gemini/chat/ChatActivity;->streamText:Ljava/lang/String;

    .line 637
    iget-object v3, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    if-nez v3, :cond_0

    .line 638
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->removePlaceholder()V

    .line 639
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    .line 640
    iget-object v3, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    const-string v4, "model"

    invoke-static {v3, v4}, Lcom/gemini/chat/MessageFormatter;->styleView(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 641
    iget-object v3, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setLongClickable(Z)V

    .line 642
    iget-object v2, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 643
    iput v1, p0, Lcom/gemini/chat/ChatActivity;->thinkingDots:I

    .line 645
    :cond_0
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->streamText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6

    .line 646
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopThinkingPulse()V

    .line 647
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/gemini/chat/ChatActivity;->streamModel:Ljava/lang/String;

    iget-object v3, p0, Lcom/gemini/chat/ChatActivity;->streamText:Ljava/lang/String;

    invoke-static {p0, v2, v3}, Lcom/gemini/chat/MessageFormatter;->formatStreaming(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 652
    :goto_4
    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->scrollChatDown()V

    .line 653
    :cond_1
    return-void

    :cond_2
    move v0, v2

    .line 633
    goto :goto_0

    .line 634
    :cond_3
    const-string p1, ""

    goto :goto_1

    .line 635
    :cond_4
    const-string p2, ""

    goto :goto_2

    .line 636
    :cond_5
    const-string p3, ""

    goto :goto_3

    .line 649
    :cond_6
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/gemini/chat/ChatActivity;->streamModel:Ljava/lang/String;

    iget-object v3, p0, Lcom/gemini/chat/ChatActivity;->streamThoughts:Ljava/lang/String;

    iget v4, p0, Lcom/gemini/chat/ChatActivity;->thinkingDots:I

    invoke-static {p0, v2, v3, v4}, Lcom/gemini/chat/MessageFormatter;->formatWaiting(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 650
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->scheduleThinkingPulse()V

    goto :goto_4
.end method

.method private showThoughts(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    .prologue
    .line 1367
    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 1368
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1369
    invoke-static {p0, p2}, Lcom/gemini/chat/MessageFormatter;->formatBody(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1370
    const-string v2, "model"

    invoke-static {v0, v2}, Lcom/gemini/chat/MessageFormatter;->styleView(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 1371
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setLongClickable(Z)V

    .line 1372
    invoke-virtual {v1, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 1373
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Thought Process"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1374
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " ("

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ")"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1375
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Close"

    const/4 v2, 0x0

    .line 1376
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Copy"

    new-instance v2, Lcom/gemini/chat/ChatActivity$12;

    invoke-direct {v2, p0, p2}, Lcom/gemini/chat/ChatActivity$12;-><init>(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;)V

    .line 1377
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1382
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1383
    return-void

    .line 1374
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method private startRequest()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 837
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    .line 838
    const-string v1, "api_key"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 839
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 840
    const-string v0, "Please go to Settings to set API Key"

    invoke-static {p0, v0, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 848
    :goto_0
    return-void

    .line 843
    :cond_0
    const-string v2, "model"

    const-string v3, "gemini-3.5-flash-lite"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 844
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->cancelTask()V

    .line 845
    new-instance v3, Lcom/gemini/chat/ChatActivity$GeminiTask;

    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-direct {v3, p0, v4, v5, v2}, Lcom/gemini/chat/ChatActivity$GeminiTask;-><init>(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;)V

    iput-object v3, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    .line 846
    iget-object v3, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    aput-object v2, v4, v6

    const/4 v1, 0x2

    const-string v2, "system_instruction"

    const-string v5, ""

    invoke-interface {v0, v2, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v1

    const/4 v1, 0x3

    const-string v2, "thinking_level"

    const-string v5, ""

    .line 847
    invoke-interface {v0, v2, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v1

    const/4 v1, 0x4

    const-string v2, "show_thoughts"

    invoke-interface {v0, v2, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "1"

    :goto_1
    aput-object v0, v4, v1

    .line 846
    invoke-virtual {v3, v4}, Lcom/gemini/chat/ChatActivity$GeminiTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 847
    :cond_1
    const-string v0, "0"

    goto :goto_1
.end method

.method private stopReading()V
    .locals 3

    .prologue
    .line 1356
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->reader:Lcom/gemini/chat/ReadAloud;

    .line 1357
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/gemini/chat/ChatActivity;->reader:Lcom/gemini/chat/ReadAloud;

    .line 1358
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->readBar:Landroid/widget/LinearLayout;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->readBar:Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1359
    :cond_0
    if-eqz v0, :cond_1

    .line 1360
    invoke-virtual {v0}, Lcom/gemini/chat/ReadAloud;->stopReading()V

    .line 1361
    invoke-static {p0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    .line 1363
    :cond_1
    return-void
.end method

.method private stopThinkingPulse()V
    .locals 2

    .prologue
    .line 628
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gemini/chat/ChatActivity;->pulseScheduled:Z

    .line 629
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->thinkingPulse:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 630
    return-void
.end method

.method static streamIntervalMs(I)J
    .locals 2

    .prologue
    .line 194
    const/16 v0, 0x320

    if-ge p0, v0, :cond_0

    const-wide/16 v0, 0xfa

    .line 197
    :goto_0
    return-wide v0

    .line 195
    :cond_0
    const/16 v0, 0x9c4

    if-ge p0, v0, :cond_1

    const-wide/16 v0, 0x190

    goto :goto_0

    .line 196
    :cond_1
    const/16 v0, 0x1770

    if-ge p0, v0, :cond_2

    const-wide/16 v0, 0x258

    goto :goto_0

    .line 197
    :cond_2
    const-wide/16 v0, 0x352

    goto :goto_0
.end method

.method static titleRequest(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/16 v1, 0x5dc

    .line 565
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 566
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_1

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 567
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Give this conversation a short title (2 to 6 words) in the language of the conversation. Reply with the title only: no quotes, no markdown, no final period.\n\nUser: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n\nAssistant: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 569
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 570
    const-string v2, "contents"

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "role"

    const-string v6, "user"

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "parts"

    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "text"

    .line 571
    invoke-virtual {v7, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v6, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v4, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 570
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 572
    const-string v0, "generationConfig"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "maxOutputTokens"

    const/16 v4, 0x12c

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "thinkingConfig"

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "thinkingLevel"

    const-string v6, "minimal"

    .line 573
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    .line 572
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 574
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static toInlineData(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x5

    .line 124
    const/16 v0, 0x3b

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 125
    const/16 v1, 0x2c

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 126
    if-le v0, v4, :cond_0

    if-gt v1, v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    .line 132
    :goto_0
    return-object v0

    .line 127
    :cond_1
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 128
    const-string v3, "mimeType"

    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 129
    const-string v0, "data"

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 130
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 131
    const-string v1, "inlineData"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0
.end method

.method private updatePlaceholderConfig()V
    .locals 2

    .prologue
    .line 1095
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->placeholderConfig:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->placeholderConfig:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->activeConfigSummary()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1096
    :cond_0
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 7

    .prologue
    const/4 v4, 0x0

    const/4 v6, 0x0

    const-wide/16 v2, -0x1

    .line 1011
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 1012
    const/16 v0, 0x65

    if-ne p1, v0, :cond_3

    .line 1014
    if-eqz p3, :cond_2

    const-string v0, "chat_id"

    invoke-virtual {p3, v0, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    .line 1015
    :goto_0
    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    cmp-long v4, v4, v2

    if-nez v4, :cond_0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    iput-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    .line 1016
    :cond_0
    iget-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 1017
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->getChatTitle(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 1018
    invoke-direct {p0, v6}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 1019
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->maybeAutoName()V

    .line 1034
    :cond_1
    :goto_1
    return-void

    :cond_2
    move-wide v0, v2

    .line 1014
    goto :goto_0

    .line 1023
    :cond_3
    const/16 v0, 0x64

    if-ne p1, v0, :cond_1

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    if-eqz p3, :cond_1

    .line 1024
    invoke-virtual {p3}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    .line 1025
    if-eqz v0, :cond_1

    .line 1026
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->cancelAttachTask()V

    .line 1027
    iput-object v4, p0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    .line 1028
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1029
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    const-string v2, "Attaching image..."

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1030
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1031
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1032
    :cond_4
    new-instance v1, Lcom/gemini/chat/ChatActivity$AttachImageTask;

    const/high16 v2, 0x42200000    # 40.0f

    invoke-direct {p0, v2}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v2

    invoke-direct {v1, p0, v2}, Lcom/gemini/chat/ChatActivity$AttachImageTask;-><init>(Lcom/gemini/chat/ChatActivity;I)V

    iput-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachTask:Lcom/gemini/chat/ChatActivity$AttachImageTask;

    .line 1033
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachTask:Lcom/gemini/chat/ChatActivity$AttachImageTask;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    aput-object v0, v2, v6

    invoke-virtual {v1, v2}, Lcom/gemini/chat/ChatActivity$AttachImageTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .prologue
    const-wide/16 v2, -0x1

    .line 671
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 672
    invoke-static {p0}, Lcom/gemini/chat/EmojiMap;->preloadAsync(Landroid/content/Context;)V

    .line 673
    invoke-static {p0}, Lcom/gemini/chat/MessageFormatter;->applyPrefs(Landroid/content/Context;)V

    .line 674
    sget v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    iput v0, p0, Lcom/gemini/chat/ChatActivity;->renderedTextSp:F

    .line 675
    const v0, 0x7f030002

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->setContentView(I)V

    .line 676
    const v0, 0x7f050002

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    .line 677
    const v0, 0x7f050003

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    .line 678
    const v0, 0x7f050004

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnStop:Landroid/widget/Button;

    .line 679
    const v0, 0x7f050001

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    .line 680
    const/high16 v0, 0x7f050000

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    .line 681
    new-instance v0, Lcom/gemini/chat/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/gemini/chat/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    .line 682
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->buildReadBar()V

    .line 683
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->buildAttachBar()V

    .line 685
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "chat_id"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    .line 686
    iget-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 687
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->getChatTitle(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 688
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 694
    :goto_0
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    new-instance v1, Lcom/gemini/chat/ChatActivity$4;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$4;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 705
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    new-instance v1, Lcom/gemini/chat/ChatActivity$5;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$5;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 710
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnStop:Landroid/widget/Button;

    new-instance v1, Lcom/gemini/chat/ChatActivity$6;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$6;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 731
    return-void

    .line 690
    :cond_0
    const-string v0, "New chat"

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 691
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->showPlaceholder()V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1506
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "ic_menu_live"

    const-string v2, "drawable"

    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 1507
    const/4 v1, 0x5

    const-string v2, "Live Voice"

    invoke-interface {p1, v4, v1, v4, v2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    if-eqz v0, :cond_1

    :goto_0
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1508
    const/4 v0, 0x6

    const-string v1, "Stop Reading"

    invoke-interface {p1, v4, v0, v4, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080031

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1509
    const-string v0, "Settings"

    invoke-interface {p1, v4, v5, v4, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080049

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1510
    const/4 v0, 0x2

    const-string v1, "Delete This Chat"

    invoke-interface {p1, v4, v0, v4, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x108003c

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1511
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-lt v0, v1, :cond_0

    .line 1512
    const/4 v0, 0x3

    const-string v1, "Attach Image"

    invoke-interface {p1, v4, v0, v4, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080033

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1513
    const/4 v0, 0x4

    const-string v1, "Remove Image"

    invoke-interface {p1, v4, v0, v4, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080038

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1515
    :cond_0
    return v5

    .line 1507
    :cond_1
    const v0, 0x10800a4

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 763
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 764
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopThinkingPulse()V

    .line 765
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopReading()V

    .line 766
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->cancelAttachTask()V

    .line 767
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->cancelTask()V

    .line 768
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    invoke-virtual {v0}, Lcom/gemini/chat/DatabaseHelper;->close()V

    .line 769
    :cond_0
    return-void
.end method

.method public onLowMemory()V
    .locals 0

    .prologue
    .line 757
    invoke-super {p0}, Landroid/app/Activity;->onLowMemory()V

    .line 758
    invoke-static {}, Lcom/gemini/chat/Thumbnail;->clearCache()V

    .line 759
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v0, 0x1

    .line 1538
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 1579
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 1540
    :pswitch_0
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/gemini/chat/SettingsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/gemini/chat/ChatActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1543
    :pswitch_1
    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    .line 1544
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity;->finish()V

    goto :goto_0

    .line 1547
    :cond_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Delete Chat"

    .line 1548
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Are you sure you want to delete this chat?"

    .line 1549
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Delete"

    new-instance v3, Lcom/gemini/chat/ChatActivity$17;

    invoke-direct {v3, p0}, Lcom/gemini/chat/ChatActivity$17;-><init>(Lcom/gemini/chat/ChatActivity;)V

    .line 1550
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Cancel"

    .line 1557
    invoke-virtual {v1, v2, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1558
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 1561
    :pswitch_2
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->pickImage()V

    goto :goto_0

    .line 1564
    :pswitch_3
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopReading()V

    goto :goto_0

    .line 1567
    :pswitch_4
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopReading()V

    .line 1568
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->cancelTask()V

    .line 1569
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/gemini/chat/ChatActivity;->setUiLoading(Z)V

    .line 1570
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/gemini/chat/LiveActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1571
    const-string v2, "chat_id"

    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v1, v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1572
    const/16 v2, 0x65

    invoke-virtual {p0, v1, v2}, Lcom/gemini/chat/ChatActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 1576
    :pswitch_5
    invoke-direct {p0, v6}, Lcom/gemini/chat/ChatActivity;->setAttachment(Ljava/lang/String;)V

    goto :goto_0

    .line 1538
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 750
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 751
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopThinkingPulse()V

    .line 752
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopReading()V

    .line 753
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 8

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1520
    const/4 v0, 0x6

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 1521
    if-eqz v3, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->reader:Lcom/gemini/chat/ReadAloud;

    if-eqz v0, :cond_5

    move v0, v1

    :goto_0
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1522
    :cond_0
    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 1523
    if-eqz v3, :cond_1

    .line 1524
    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-wide/16 v6, -0x1

    cmp-long v0, v4, v6

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v4, v5}, Lcom/gemini/chat/DatabaseHelper;->hasMessages(J)Z

    move-result v0

    if-eqz v0, :cond_6

    move v0, v1

    :goto_1
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1526
    :cond_1
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 1527
    if-eqz v3, :cond_3

    .line 1528
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x13

    if-ge v0, v4, :cond_2

    const-string v0, "mounted"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    :cond_2
    move v0, v1

    :goto_2
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1529
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    if-nez v0, :cond_8

    const-string v0, "Attach Image"

    :goto_3
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 1531
    :cond_3
    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 1532
    if-eqz v0, :cond_4

    iget-object v3, p0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    if-eqz v3, :cond_9

    :goto_4
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1533
    :cond_4
    invoke-super {p0, p1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0

    :cond_5
    move v0, v2

    .line 1521
    goto :goto_0

    :cond_6
    move v0, v2

    .line 1524
    goto :goto_1

    :cond_7
    move v0, v2

    .line 1528
    goto :goto_2

    .line 1529
    :cond_8
    const-string v0, "Change Image"

    goto :goto_3

    :cond_9
    move v1, v2

    .line 1532
    goto :goto_4
.end method

.method protected onResume()V
    .locals 4

    .prologue
    .line 738
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 739
    invoke-static {p0}, Lcom/gemini/chat/MessageFormatter;->applyPrefs(Landroid/content/Context;)V

    .line 740
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->updatePlaceholderConfig()V

    .line 741
    sget v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    iget v1, p0, Lcom/gemini/chat/ChatActivity;->renderedTextSp:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    .line 742
    sget v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    iput v0, p0, Lcom/gemini/chat/ChatActivity;->renderedTextSp:F

    .line 743
    iget-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 745
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->scheduleThinkingPulse()V

    .line 746
    :cond_1
    return-void
.end method
