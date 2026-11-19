.class public Lcom/gemini/chat/ChatActivity;
.super Landroid/app/Activity;
.source "ChatActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gemini/chat/ChatActivity$GeminiTask;,
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

.field private reader:Lcom/gemini/chat/ReadAloud;

.field private renderedTextSp:F

.field private scrollChat:Landroid/widget/ScrollView;

.field private streamView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 50
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 67
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->handler:Landroid/os/Handler;

    .line 71
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    .line 72
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    return-void
.end method

.method static synthetic access$000(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/DatabaseHelper;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    return-object v0
.end method

.method static synthetic access$100(Lcom/gemini/chat/ChatActivity;Z)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/gemini/chat/ChatActivity;->setUiLoading(Z)V

    return-void
.end method

.method static synthetic access$1000(Lcom/gemini/chat/ChatActivity;)Z
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->canSend()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Lcom/gemini/chat/ChatActivity;)Landroid/widget/Button;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->send()V

    return-void
.end method

.method static synthetic access$1300(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->cancelTask()V

    return-void
.end method

.method static synthetic access$1700(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .prologue
    .line 50
    invoke-direct/range {p0 .. p7}, Lcom/gemini/chat/ChatActivity;->addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic access$1800(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/gemini/chat/ChatActivity;->setAttachment(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->pickImage()V

    return-void
.end method

.method static synthetic access$200(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ChatActivity$GeminiTask;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/gemini/chat/ChatActivity;)Landroid/widget/ScrollView;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    return-object v0
.end method

.method static synthetic access$202(Lcom/gemini/chat/ChatActivity;Lcom/gemini/chat/ChatActivity$GeminiTask;)Lcom/gemini/chat/ChatActivity$GeminiTask;
    .locals 0

    .prologue
    .line 50
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    return-object p1
.end method

.method static synthetic access$2100(Lcom/gemini/chat/ChatActivity;)Landroid/widget/LinearLayout;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ReadAloud;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->reader:Lcom/gemini/chat/ReadAloud;

    return-object v0
.end method

.method static synthetic access$2202(Lcom/gemini/chat/ChatActivity;Lcom/gemini/chat/ReadAloud;)Lcom/gemini/chat/ReadAloud;
    .locals 0

    .prologue
    .line 50
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity;->reader:Lcom/gemini/chat/ReadAloud;

    return-object p1
.end method

.method static synthetic access$2300(Lcom/gemini/chat/ChatActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->lastSavedRole()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2400(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Lcom/gemini/chat/ChatActivity;->copy(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2500(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;)V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0, p1, p2, p3}, Lcom/gemini/chat/ChatActivity;->readAloud(JLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$2600(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopReading()V

    return-void
.end method

.method static synthetic access$2700(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 50
    invoke-direct/range {p0 .. p5}, Lcom/gemini/chat/ChatActivity;->showEditDialog(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2800(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;)V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0, p1, p2, p3}, Lcom/gemini/chat/ChatActivity;->regenerate(JLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$2900(Lcom/gemini/chat/ChatActivity;J)V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Lcom/gemini/chat/ChatActivity;->confirmDelete(J)V

    return-void
.end method

.method static synthetic access$300(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->removeStreaming()V

    return-void
.end method

.method static synthetic access$3000(Lcom/gemini/chat/ChatActivity;Z)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    return-void
.end method

.method static synthetic access$3100(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->startRequest()V

    return-void
.end method

.method static synthetic access$3200(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Lcom/gemini/chat/ChatActivity;->showThoughts(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3300(Lcom/gemini/chat/ChatActivity;Landroid/view/View;)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/gemini/chat/ChatActivity;->hideKeyboard(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$3400(Lcom/gemini/chat/ChatActivity;)Z
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->hasApiKey()Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/gemini/chat/ChatActivity;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$500(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0, p1, p2, p3}, Lcom/gemini/chat/ChatActivity;->showStreaming(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .locals 0

    .prologue
    .line 50
    invoke-direct/range {p0 .. p8}, Lcom/gemini/chat/ChatActivity;->addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->scrollChatDown()V

    return-void
.end method

.method static synthetic access$800(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->maybeAutoName()V

    return-void
.end method

.method static synthetic access$900(Lcom/gemini/chat/ChatActivity;)J
    .locals 2

    .prologue
    .line 50
    iget-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    return-wide v0
.end method

.method private addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 9

    .prologue
    .line 820
    const/4 v8, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-wide v6, p6

    invoke-direct/range {v0 .. v8}, Lcom/gemini/chat/ChatActivity;->addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    .line 821
    return-void
.end method

.method private addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .locals 19

    .prologue
    .line 824
    new-instance v9, Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-direct {v9, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 825
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v2, p0

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-wide/from16 v6, p6

    .line 826
    invoke-static/range {v2 .. v8}, Lcom/gemini/chat/MessageFormatter;->format(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/ArrayList;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v9, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 827
    move-object/from16 v0, p3

    invoke-static {v9, v0}, Lcom/gemini/chat/MessageFormatter;->styleView(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 828
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

    .line 829
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 830
    return-void
.end method

.method private buildAttachBar()V
    .locals 8

    .prologue
    const/high16 v4, 0x42200000    # 40.0f

    const/high16 v7, 0x40800000    # 4.0f

    const/4 v6, -0x2

    const/4 v5, 0x0

    .line 702
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    .line 703
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 704
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 705
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

    .line 706
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 708
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    .line 709
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 710
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v4}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v3

    invoke-direct {p0, v4}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 712
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    .line 713
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 714
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-direct {p0, v1}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v1

    invoke-direct {p0, v7}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v2

    invoke-virtual {v0, v1, v5, v2, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 715
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 716
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v2, v5, v6, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 718
    new-instance v0, Landroid/widget/Button;

    const/4 v1, 0x0

    const v2, 0x1010049

    invoke-direct {v0, p0, v1, v2}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 719
    const-string v1, "Remove"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 720
    new-instance v1, Lcom/gemini/chat/ChatActivity$5;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$5;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 725
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 729
    new-instance v0, Lcom/gemini/chat/ChatActivity$6;

    invoke-direct {v0, p0}, Lcom/gemini/chat/ChatActivity$6;-><init>(Lcom/gemini/chat/ChatActivity;)V

    .line 734
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 735
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 738
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 739
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 741
    return-void
.end method

.method private canSend()Z
    .locals 1

    .prologue
    .line 621
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

.method private cancelTask()V
    .locals 2

    .prologue
    .line 611
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->removeStreaming()V

    .line 612
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    .line 613
    if-eqz v0, :cond_0

    .line 614
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/gemini/chat/ChatActivity$GeminiTask;->cancel(Z)Z

    .line 615
    invoke-virtual {v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnectAsync()V

    .line 616
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    .line 618
    :cond_0
    return-void
.end method

.method static cleanTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v3, 0x0

    const/16 v7, 0x28

    const/4 v2, 0x0

    .line 467
    if-nez p0, :cond_1

    move-object v0, v3

    .line 482
    :cond_0
    :goto_0
    return-object v0

    .line 468
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 469
    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 470
    if-ltz v1, :cond_2

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 471
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

    .line 472
    :cond_4
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    move v1, v2

    .line 473
    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_7

    .line 474
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 475
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

    .line 473
    :cond_5
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 476
    :cond_6
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 478
    :cond_7
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 479
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

    .line 480
    :cond_9
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_a

    move-object v0, v3

    goto/16 :goto_0

    .line 481
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
    .line 1083
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Delete Message"

    .line 1084
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Delete this message? Later messages are kept."

    .line 1085
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Delete"

    new-instance v2, Lcom/gemini/chat/ChatActivity$11;

    invoke-direct {v2, p0, p1, p2}, Lcom/gemini/chat/ChatActivity$11;-><init>(Lcom/gemini/chat/ChatActivity;J)V

    .line 1086
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Cancel"

    const/4 v2, 0x0

    .line 1092
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1093
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1094
    return-void
.end method

.method private copy(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 1059
    const-string v0, "clipboard"

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 1060
    invoke-virtual {v0, p1}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 1061
    const/4 v0, 0x0

    invoke-static {p0, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1062
    return-void
.end method

.method private dp(F)I
    .locals 2

    .prologue
    .line 698
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

.method private hasApiKey()Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    .line 638
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

    .line 640
    :goto_0
    return v0

    .line 639
    :cond_0
    const-string v1, "Please go to Settings to set API Key"

    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 640
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private hideKeyboard(Landroid/view/View;)V
    .locals 3

    .prologue
    .line 633
    const-string v0, "input_method"

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 634
    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 635
    :cond_0
    return-void
.end method

.method private lastSavedRole()Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 880
    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-nez v1, :cond_1

    .line 894
    :cond_0
    :goto_0
    return-object v0

    .line 882
    :cond_1
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v1, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->getMessages(J)Landroid/database/Cursor;

    move-result-object v2

    .line 883
    if-eqz v2, :cond_0

    .line 885
    :try_start_0
    const-string v1, "role"

    invoke-interface {v2, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    .line 886
    :cond_2
    :goto_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 887
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 888
    const-string v4, "user"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string v4, "model"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-eqz v4, :cond_2

    :cond_3
    move-object v0, v1

    goto :goto_1

    .line 891
    :cond_4
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 892
    throw v0
.end method

.method private loadMessages(Z)V
    .locals 20

    .prologue
    .line 834
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    invoke-virtual {v2}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v13

    .line 835
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 836
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    .line 837
    const/4 v4, 0x0

    .line 838
    const/4 v3, 0x0

    .line 840
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

    move-result-object v11

    .line 841
    :goto_0
    if-eqz v11, :cond_0

    :try_start_1
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 842
    const-string v2, "_id"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v14

    const-string v2, "role"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    const-string v2, "model"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v16

    .line 843
    const-string v2, "content"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v17

    const-string v2, "timestamp"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v18

    .line 844
    const-string v2, "thoughts"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v19

    move v12, v4

    .line 846
    :goto_1
    :try_start_2
    invoke-interface {v11, v14}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-interface {v11, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v2, -0x1

    move/from16 v0, v16

    if-eq v0, v2, :cond_3

    move/from16 v0, v16

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 847
    :goto_2
    move/from16 v0, v17

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v2, -0x1

    move/from16 v0, v18

    if-eq v0, v2, :cond_4

    move/from16 v0, v18

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 848
    :goto_3
    const/4 v2, -0x1

    move/from16 v0, v19

    if-eq v0, v2, :cond_5

    move/from16 v0, v19

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    :goto_4
    move-object/from16 v2, p0

    .line 846
    invoke-direct/range {v2 .. v10}, Lcom/gemini/chat/ChatActivity;->addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 849
    const/4 v4, 0x1

    .line 850
    :try_start_3
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result v2

    if-nez v2, :cond_8

    .line 855
    :cond_0
    if-eqz v11, :cond_1

    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 857
    :cond_1
    :goto_5
    if-nez v4, :cond_2

    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->showPlaceholder()V

    .line 858
    :cond_2
    invoke-static/range {p0 .. p0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    .line 859
    if-eqz p1, :cond_7

    .line 860
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    new-instance v3, Lcom/gemini/chat/ChatActivity$7;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v13}, Lcom/gemini/chat/ChatActivity$7;-><init>(Lcom/gemini/chat/ChatActivity;I)V

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 868
    :goto_6
    return-void

    .line 846
    :cond_3
    const/4 v6, 0x0

    goto :goto_2

    .line 847
    :cond_4
    const-wide/16 v8, 0x0

    goto :goto_3

    .line 848
    :cond_5
    const/4 v10, 0x0

    goto :goto_4

    .line 852
    :catch_0
    move-exception v2

    .line 853
    :goto_7
    :try_start_4
    const-string v5, "Gemini"

    const-string v6, "Error loading messages"

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 855
    if-eqz v3, :cond_1

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    goto :goto_5

    :catchall_0
    move-exception v2

    move-object v11, v3

    :goto_8
    if-eqz v11, :cond_6

    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 856
    :cond_6
    throw v2

    .line 866
    :cond_7
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->scrollChatDown()V

    goto :goto_6

    .line 855
    :catchall_1
    move-exception v2

    goto :goto_8

    :catchall_2
    move-exception v2

    move-object v11, v3

    goto :goto_8

    .line 852
    :catch_1
    move-exception v2

    move-object v3, v11

    goto :goto_7

    :catch_2
    move-exception v2

    move-object v3, v11

    move v4, v12

    goto :goto_7

    :cond_8
    move v12, v4

    goto/16 :goto_1

    :cond_9
    move-object v11, v3

    goto/16 :goto_0
.end method

.method private maybeAutoName()V
    .locals 4

    .prologue
    .line 486
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    new-instance v1, Lcom/gemini/chat/ChatActivity$1;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$1;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-static {p0, v0, v2, v3, v1}, Lcom/gemini/chat/AutoNamer;->maybeStart(Landroid/content/Context;Lcom/gemini/chat/DatabaseHelper;JLcom/gemini/chat/AutoNamer$Callback;)V

    .line 491
    return-void
.end method

.method private pickImage()V
    .locals 3

    .prologue
    .line 761
    new-instance v1, Landroid/content/Intent;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v0, v2, :cond_0

    const-string v0, "android.intent.action.OPEN_DOCUMENT"

    .line 762
    :goto_0
    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 763
    const-string v0, "image/*"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 764
    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 766
    const/16 v0, 0x64

    :try_start_0
    invoke-virtual {p0, v1, v0}, Lcom/gemini/chat/ChatActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 770
    :goto_1
    return-void

    .line 762
    :cond_0
    const-string v0, "android.intent.action.GET_CONTENT"

    goto :goto_0

    .line 767
    :catch_0
    move-exception v0

    .line 768
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
    .line 625
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
    .line 91
    if-nez p0, :cond_0

    const-string v0, ""

    .line 98
    :goto_0
    return-object v0

    .line 92
    :cond_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v0, Ljava/io/InputStreamReader;

    const-string v2, "UTF-8"

    invoke-direct {v0, p0, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v1, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 94
    :try_start_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 95
    const/16 v2, 0x800

    new-array v2, v2, [C

    .line 97
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

    .line 100
    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 101
    throw v0

    .line 98
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 100
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    goto :goto_0
.end method

.method private readAloud(JLjava/lang/String;)V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 1001
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "api_key"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 1002
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 1003
    const-string v0, "Please go to Settings to set API Key"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1027
    :goto_0
    return-void

    .line 1006
    :cond_0
    invoke-static {p3}, Lcom/gemini/chat/ReadAloud;->speakable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1007
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 1008
    const-string v0, "Nothing to read in this message."

    invoke-static {p0, v0, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1011
    :cond_1
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopReading()V

    .line 1012
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1013
    const-string v1, "live_voice"

    const-string v2, "Kore"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1014
    const-string v1, "tts_model"

    sget-object v2, Lcom/gemini/chat/ReadAloud;->DEFAULT_MODEL:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1015
    new-instance v1, Lcom/gemini/chat/ReadAloud;

    iget-object v8, p0, Lcom/gemini/chat/ChatActivity;->handler:Landroid/os/Handler;

    new-instance v9, Lcom/gemini/chat/ChatActivity$9;

    invoke-direct {v9, p0}, Lcom/gemini/chat/ChatActivity$9;-><init>(Lcom/gemini/chat/ChatActivity;)V

    move-wide v2, p1

    invoke-direct/range {v1 .. v9}, Lcom/gemini/chat/ReadAloud;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;Lcom/gemini/chat/ReadAloud$Listener;)V

    iput-object v1, p0, Lcom/gemini/chat/ChatActivity;->reader:Lcom/gemini/chat/ReadAloud;

    .line 1024
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->reader:Lcom/gemini/chat/ReadAloud;

    invoke-virtual {v0}, Lcom/gemini/chat/ReadAloud;->start()V

    .line 1025
    invoke-static {p0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    .line 1026
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Reading aloud ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method private regenerate(JLjava/lang/String;)V
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 1069
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->hasApiKey()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1080
    :goto_0
    return-void

    .line 1070
    :cond_0
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopReading()V

    .line 1071
    const-string v0, "user"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v2, v3, p1, p2}, Lcom/gemini/chat/DatabaseHelper;->deleteMessagesAfter(JJ)V

    .line 1073
    :goto_1
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->lastSavedRole()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 1074
    invoke-direct {p0, v1}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 1075
    const-string v0, "Nothing left to answer."

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1072
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v2, v3, p1, p2}, Lcom/gemini/chat/DatabaseHelper;->deleteMessagesFrom(JJ)V

    goto :goto_1

    .line 1078
    :cond_2
    invoke-direct {p0, v1}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 1079
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->startRequest()V

    goto :goto_0
.end method

.method private removePlaceholder()V
    .locals 3

    .prologue
    .line 814
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

    .line 815
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 817
    :cond_0
    return-void
.end method

.method private removeStreaming()V
    .locals 2

    .prologue
    .line 512
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 513
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 514
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    .line 516
    :cond_0
    return-void
.end method

.method static retryable(I)Z
    .locals 1

    .prologue
    .line 117
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

.method private scrollChatDown()V
    .locals 2

    .prologue
    .line 871
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    new-instance v1, Lcom/gemini/chat/ChatActivity$8;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$8;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 876
    return-void
.end method

.method private send()V
    .locals 18

    .prologue
    .line 644
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/gemini/chat/ChatActivity;->hideKeyboard(Landroid/view/View;)V

    .line 645
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 646
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->hasApiKey()Z

    move-result v2

    if-nez v2, :cond_1

    .line 663
    :cond_0
    :goto_0
    return-void

    .line 647
    :cond_1
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 648
    :cond_2
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-nez v2, :cond_4

    .line 649
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "Image"

    .line 650
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

    .line 651
    :cond_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    invoke-virtual {v3, v2}, Lcom/gemini/chat/DatabaseHelper;->createChat(Ljava/lang/String;)J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/gemini/chat/ChatActivity;->chatId:J

    .line 652
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/gemini/chat/ChatActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 653
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 655
    :cond_4
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->removePlaceholder()V

    .line 656
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    .line 657
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-string v6, "user"

    invoke-virtual/range {v3 .. v8}, Lcom/gemini/chat/DatabaseHelper;->addMessage(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v11

    .line 658
    const-string v13, "user"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    move-object/from16 v10, p0

    move-object v14, v8

    move-object v15, v7

    invoke-direct/range {v10 .. v17}, Lcom/gemini/chat/ChatActivity;->addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 659
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/gemini/chat/ChatActivity;->setAttachment(Ljava/lang/String;)V

    .line 660
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 661
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->scrollChatDown()V

    .line 662
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->startRequest()V

    goto/16 :goto_0

    .line 649
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
    .locals 8

    .prologue
    .line 744
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    .line 745
    if-nez p1, :cond_1

    .line 746
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 747
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 756
    :goto_0
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->canSend()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 757
    :cond_0
    invoke-static {p0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    .line 758
    return-void

    .line 749
    :cond_1
    const/high16 v0, 0x42200000    # 40.0f

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v0

    invoke-static {p1, v0}, Lcom/gemini/chat/Thumbnail;->fromDataUri(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 750
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 751
    const/16 v0, 0x2c

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 752
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int v0, v1, v0

    add-int/lit8 v0, v0, -0x1

    int-to-long v0, v0

    const-wide/16 v2, 0x3

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x4

    div-long/2addr v0, v2

    .line 753
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

    .line 754
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method private setUiLoading(Z)V
    .locals 4

    .prologue
    const/16 v3, 0x8

    const/4 v1, 0x0

    .line 680
    iget-object v2, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 681
    if-eqz p1, :cond_1

    .line 682
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    const-string v2, "Model is generating..."

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 683
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 684
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnStop:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 691
    :goto_1
    return-void

    :cond_0
    move v0, v1

    .line 680
    goto :goto_0

    .line 686
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    const-string v2, "Message Gemini..."

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 687
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnStop:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 688
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 689
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

    .line 1101
    const-string v1, "user"

    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 1102
    if-eqz v1, :cond_0

    if-eqz p4, :cond_0

    const-string v2, "data:image/"

    invoke-virtual {p4, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v3, v0

    .line 1103
    :goto_0
    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 1104
    invoke-virtual {v2, p5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1105
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->length()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setSelection(I)V

    .line 1106
    const/16 v4, 0x30

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setGravity(I)V

    .line 1108
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

    .line 1109
    const/4 v5, 0x3

    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 1110
    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setVerticalScrollBarEnabled(Z)V

    .line 1112
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    if-eqz v1, :cond_1

    const-string v0, "Edit Message"

    :goto_1
    invoke-virtual {v4, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 1113
    if-eqz v1, :cond_2

    .line 1114
    const-string v7, "Resend"

    new-instance v0, Lcom/gemini/chat/ChatActivity$12;

    move-object v1, p0

    move-wide v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/gemini/chat/ChatActivity$12;-><init>(Lcom/gemini/chat/ChatActivity;Landroid/widget/EditText;ZJ)V

    invoke-virtual {v6, v7, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1127
    const-string v7, "Save"

    new-instance v0, Lcom/gemini/chat/ChatActivity$13;

    move-object v1, p0

    move-wide v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/gemini/chat/ChatActivity$13;-><init>(Lcom/gemini/chat/ChatActivity;Landroid/widget/EditText;ZJ)V

    invoke-virtual {v6, v7, v0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1151
    :goto_2
    const-string v0, "Cancel"

    const/4 v1, 0x0

    invoke-virtual {v6, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1152
    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1153
    return-void

    .line 1102
    :cond_0
    const/4 v3, 0x0

    goto :goto_0

    .line 1112
    :cond_1
    const-string v0, "Edit Reply"

    goto :goto_1

    .line 1137
    :cond_2
    const-string v0, "Save"

    new-instance v1, Lcom/gemini/chat/ChatActivity$14;

    invoke-direct {v1, p0, v2, p1, p2}, Lcom/gemini/chat/ChatActivity$14;-><init>(Lcom/gemini/chat/ChatActivity;Landroid/widget/EditText;J)V

    invoke-virtual {v6, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_2
.end method

.method private showPlaceholder()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 802
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 803
    const-string v1, "Start chatting\nType a message below to start."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 804
    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 805
    const v1, -0x777778

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 806
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 807
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v1, v3, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 809
    const-string v1, "placeholder"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 810
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 811
    return-void
.end method

.method private showStreaming(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    .prologue
    const/4 v1, 0x0

    .line 497
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v0

    iget-object v2, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    invoke-virtual {v2}, Landroid/widget/ScrollView;->getHeight()I

    move-result v2

    add-int/2addr v0, v2

    iget-object v2, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v2

    add-int/lit8 v2, v2, -0x8

    if-lt v0, v2, :cond_2

    const/4 v0, 0x1

    move v7, v0

    .line 498
    :goto_0
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    if-nez v0, :cond_0

    .line 499
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->removePlaceholder()V

    .line 500
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    .line 501
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    const-string v2, "model"

    invoke-static {v0, v2}, Lcom/gemini/chat/MessageFormatter;->styleView(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 502
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLongClickable(Z)V

    .line 503
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 505
    :cond_0
    iget-object v8, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_3

    .line 506
    const-string v1, "model"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p3

    invoke-static/range {v0 .. v6}, Lcom/gemini/chat/MessageFormatter;->format(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/ArrayList;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 505
    :goto_1
    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 508
    if-eqz v7, :cond_1

    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->scrollChatDown()V

    .line 509
    :cond_1
    return-void

    :cond_2
    move v7, v1

    .line 497
    goto :goto_0

    .line 507
    :cond_3
    invoke-static {p0, p1, p2}, Lcom/gemini/chat/MessageFormatter;->formatThinking(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_1
.end method

.method private showThoughts(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    .prologue
    .line 1040
    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 1041
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1042
    invoke-static {p0, p2}, Lcom/gemini/chat/MessageFormatter;->formatBody(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1043
    const-string v2, "model"

    invoke-static {v0, v2}, Lcom/gemini/chat/MessageFormatter;->styleView(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 1044
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setLongClickable(Z)V

    .line 1045
    invoke-virtual {v1, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 1046
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Thought Process"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1047
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

    .line 1048
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Close"

    const/4 v2, 0x0

    .line 1049
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Copy"

    new-instance v2, Lcom/gemini/chat/ChatActivity$10;

    invoke-direct {v2, p0, p2}, Lcom/gemini/chat/ChatActivity$10;-><init>(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;)V

    .line 1050
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1055
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1056
    return-void

    .line 1047
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method private startRequest()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 667
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    .line 668
    const-string v1, "api_key"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 669
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 670
    const-string v0, "Please go to Settings to set API Key"

    invoke-static {p0, v0, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 677
    :goto_0
    return-void

    .line 673
    :cond_0
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->cancelTask()V

    .line 674
    new-instance v2, Lcom/gemini/chat/ChatActivity$GeminiTask;

    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-direct {v2, p0, v4, v5}, Lcom/gemini/chat/ChatActivity$GeminiTask;-><init>(Lcom/gemini/chat/ChatActivity;J)V

    iput-object v2, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    .line 675
    iget-object v2, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const-string v1, "model"

    const-string v4, "gemini-3.5-flash-lite"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v3, v6

    const/4 v1, 0x2

    const-string v4, "system_instruction"

    const-string v5, ""

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    const/4 v1, 0x3

    const-string v4, "thinking_level"

    const-string v5, ""

    .line 676
    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    const/4 v1, 0x4

    const-string v4, "show_thoughts"

    invoke-interface {v0, v4, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "1"

    :goto_1
    aput-object v0, v3, v1

    .line 675
    invoke-virtual {v2, v3}, Lcom/gemini/chat/ChatActivity$GeminiTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 676
    :cond_1
    const-string v0, "0"

    goto :goto_1
.end method

.method private stopReading()V
    .locals 2

    .prologue
    .line 1030
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->reader:Lcom/gemini/chat/ReadAloud;

    .line 1031
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/gemini/chat/ChatActivity;->reader:Lcom/gemini/chat/ReadAloud;

    .line 1032
    if-eqz v0, :cond_0

    .line 1033
    invoke-virtual {v0}, Lcom/gemini/chat/ReadAloud;->stopReading()V

    .line 1034
    invoke-static {p0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    .line 1036
    :cond_0
    return-void
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

    .line 453
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 454
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_1

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 455
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

    .line 457
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 458
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

    .line 459
    invoke-virtual {v7, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v6, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v4, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 458
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 460
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

    .line 461
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    .line 460
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 462
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

    .line 105
    const/16 v0, 0x3b

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 106
    const/16 v1, 0x2c

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 107
    if-le v0, v4, :cond_0

    if-gt v1, v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    .line 113
    :goto_0
    return-object v0

    .line 108
    :cond_1
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 109
    const-string v3, "mimeType"

    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 110
    const-string v0, "data"

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 111
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 112
    const-string v1, "inlineData"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6

    .prologue
    const-wide/16 v2, -0x1

    .line 774
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 775
    const/16 v0, 0x65

    if-ne p1, v0, :cond_3

    .line 777
    if-eqz p3, :cond_2

    const-string v0, "chat_id"

    invoke-virtual {p3, v0, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    .line 778
    :goto_0
    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    cmp-long v4, v4, v2

    if-nez v4, :cond_0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    iput-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    .line 779
    :cond_0
    iget-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 780
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->getChatTitle(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 781
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 782
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->maybeAutoName()V

    .line 795
    :cond_1
    :goto_1
    return-void

    :cond_2
    move-wide v0, v2

    .line 777
    goto :goto_0

    .line 786
    :cond_3
    const/16 v0, 0x64

    if-ne p1, v0, :cond_1

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    if-eqz p3, :cond_1

    .line 787
    invoke-virtual {p3}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    .line 788
    if-eqz v0, :cond_1

    .line 789
    invoke-static {p0, v0}, Lcom/gemini/chat/ImageUtil;->uriToBase64(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 790
    if-nez v0, :cond_4

    .line 791
    const-string v0, "Could not read that image (only images are supported)."

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 794
    :cond_4
    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity;->setAttachment(Ljava/lang/String;)V

    goto :goto_1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .prologue
    const-wide/16 v2, -0x1

    .line 524
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 525
    invoke-static {p0}, Lcom/gemini/chat/MessageFormatter;->applyPrefs(Landroid/content/Context;)V

    .line 526
    sget v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    iput v0, p0, Lcom/gemini/chat/ChatActivity;->renderedTextSp:F

    .line 527
    const v0, 0x7f030002

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->setContentView(I)V

    .line 528
    const v0, 0x7f050002

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    .line 529
    const v0, 0x7f050003

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    .line 530
    const v0, 0x7f050004

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnStop:Landroid/widget/Button;

    .line 531
    const v0, 0x7f050001

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    .line 532
    const/high16 v0, 0x7f050000

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    .line 533
    new-instance v0, Lcom/gemini/chat/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/gemini/chat/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    .line 534
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->buildAttachBar()V

    .line 536
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "chat_id"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    .line 537
    iget-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 538
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->getChatTitle(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 539
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 545
    :goto_0
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    new-instance v1, Lcom/gemini/chat/ChatActivity$2;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$2;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 556
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    new-instance v1, Lcom/gemini/chat/ChatActivity$3;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$3;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 561
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnStop:Landroid/widget/Button;

    new-instance v1, Lcom/gemini/chat/ChatActivity$4;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$4;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 581
    return-void

    .line 541
    :cond_0
    const-string v0, "New chat"

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 542
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->showPlaceholder()V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1162
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "ic_menu_live"

    const-string v2, "drawable"

    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 1163
    const/4 v1, 0x5

    const-string v2, "Live Voice"

    invoke-interface {p1, v4, v1, v4, v2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    if-eqz v0, :cond_1

    :goto_0
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1164
    const/4 v0, 0x6

    const-string v1, "Stop Reading"

    invoke-interface {p1, v4, v0, v4, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080031

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1165
    const-string v0, "Settings"

    invoke-interface {p1, v4, v5, v4, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080049

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1166
    const/4 v0, 0x2

    const-string v1, "Delete This Chat"

    invoke-interface {p1, v4, v0, v4, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x108003c

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1167
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-lt v0, v1, :cond_0

    .line 1168
    const/4 v0, 0x3

    const-string v1, "Attach Image"

    invoke-interface {p1, v4, v0, v4, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080033

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1169
    const/4 v0, 0x4

    const-string v1, "Remove Image"

    invoke-interface {p1, v4, v0, v4, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080038

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1171
    :cond_0
    return v5

    .line 1163
    :cond_1
    const v0, 0x10800a4

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 604
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 605
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopReading()V

    .line 606
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->cancelTask()V

    .line 607
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    invoke-virtual {v0}, Lcom/gemini/chat/DatabaseHelper;->close()V

    .line 608
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v0, 0x1

    .line 1205
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 1246
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 1207
    :pswitch_0
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/gemini/chat/SettingsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/gemini/chat/ChatActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1210
    :pswitch_1
    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    .line 1211
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity;->finish()V

    goto :goto_0

    .line 1214
    :cond_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Delete Chat"

    .line 1215
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Are you sure you want to delete this chat?"

    .line 1216
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Delete"

    new-instance v3, Lcom/gemini/chat/ChatActivity$15;

    invoke-direct {v3, p0}, Lcom/gemini/chat/ChatActivity$15;-><init>(Lcom/gemini/chat/ChatActivity;)V

    .line 1217
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Cancel"

    .line 1224
    invoke-virtual {v1, v2, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1225
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 1228
    :pswitch_2
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->pickImage()V

    goto :goto_0

    .line 1231
    :pswitch_3
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopReading()V

    goto :goto_0

    .line 1234
    :pswitch_4
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopReading()V

    .line 1235
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->cancelTask()V

    .line 1236
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/gemini/chat/ChatActivity;->setUiLoading(Z)V

    .line 1237
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/gemini/chat/LiveActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1238
    const-string v2, "chat_id"

    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v1, v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1239
    const/16 v2, 0x65

    invoke-virtual {p0, v1, v2}, Lcom/gemini/chat/ChatActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 1243
    :pswitch_5
    invoke-direct {p0, v6}, Lcom/gemini/chat/ChatActivity;->setAttachment(Ljava/lang/String;)V

    goto :goto_0

    .line 1205
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
    .line 598
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 599
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->stopReading()V

    .line 600
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 8

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1176
    const/4 v0, 0x6

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 1177
    if-eqz v3, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->reader:Lcom/gemini/chat/ReadAloud;

    if-eqz v0, :cond_5

    move v0, v1

    :goto_0
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1178
    :cond_0
    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 1179
    if-eqz v3, :cond_1

    .line 1181
    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-wide/16 v6, -0x1

    cmp-long v0, v4, v6

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    if-eqz v0, :cond_a

    .line 1182
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v4, v5}, Lcom/gemini/chat/DatabaseHelper;->getMessages(J)Landroid/database/Cursor;

    move-result-object v4

    .line 1183
    if-eqz v4, :cond_a

    .line 1185
    :try_start_0
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-lez v0, :cond_6

    move v0, v1

    .line 1187
    :goto_1
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 1191
    :goto_2
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1193
    :cond_1
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 1194
    if-eqz v3, :cond_3

    .line 1195
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

    :goto_3
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1196
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    if-nez v0, :cond_8

    const-string v0, "Attach Image"

    :goto_4
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 1198
    :cond_3
    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 1199
    if-eqz v0, :cond_4

    iget-object v3, p0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    if-eqz v3, :cond_9

    :goto_5
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1200
    :cond_4
    invoke-super {p0, p1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0

    :cond_5
    move v0, v2

    .line 1177
    goto :goto_0

    :cond_6
    move v0, v2

    .line 1185
    goto :goto_1

    .line 1187
    :catchall_0
    move-exception v0

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 1188
    throw v0

    :cond_7
    move v0, v2

    .line 1195
    goto :goto_3

    .line 1196
    :cond_8
    const-string v0, "Change Image"

    goto :goto_4

    :cond_9
    move v1, v2

    .line 1199
    goto :goto_5

    :cond_a
    move v0, v2

    goto :goto_2
.end method

.method protected onResume()V
    .locals 4

    .prologue
    .line 588
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 589
    invoke-static {p0}, Lcom/gemini/chat/MessageFormatter;->applyPrefs(Landroid/content/Context;)V

    .line 590
    sget v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    iget v1, p0, Lcom/gemini/chat/ChatActivity;->renderedTextSp:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    .line 591
    sget v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    iput v0, p0, Lcom/gemini/chat/ChatActivity;->renderedTextSp:F

    .line 592
    iget-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 594
    :cond_0
    return-void
.end method
