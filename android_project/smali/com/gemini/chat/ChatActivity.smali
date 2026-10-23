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

.field private static final A_REGEN:I = 0x4

.field private static final A_RETRY:I = 0x6

.field private static final A_SHARE:I = 0x2

.field private static final A_THOUGHTS:I = 0x7

.field static final DEFAULT_MODEL:Ljava/lang/String; = "gemini-3.5-flash-lite"

.field private static final HINT_IDLE:Ljava/lang/String; = "Message Gemini..."

.field private static final MENU_ATTACH:I = 0x3

.field private static final MENU_DELETE_CHAT:I = 0x2

.field private static final MENU_DETACH:I = 0x4

.field private static final MENU_LIVE:I = 0x5

.field private static final MENU_RENAME:I = 0x6

.field private static final MENU_SETTINGS:I = 0x1

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

.field private layoutChat:Landroid/widget/LinearLayout;

.field private pendingImage:Ljava/lang/String;

.field private renderedTextSp:F

.field private scrollChat:Landroid/widget/ScrollView;

.field private streamView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 49
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 66
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    return-void
.end method

.method static synthetic access$000(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/DatabaseHelper;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    return-object v0
.end method

.method static synthetic access$100(Lcom/gemini/chat/ChatActivity;Z)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/gemini/chat/ChatActivity;->setUiLoading(Z)V

    return-void
.end method

.method static synthetic access$1000(Lcom/gemini/chat/ChatActivity;)Z
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->canSend()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Lcom/gemini/chat/ChatActivity;)Landroid/widget/Button;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->send()V

    return-void
.end method

.method static synthetic access$1300(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->cancelTask()V

    return-void
.end method

.method static synthetic access$1700(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .prologue
    .line 49
    invoke-direct/range {p0 .. p7}, Lcom/gemini/chat/ChatActivity;->addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic access$1800(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/gemini/chat/ChatActivity;->setAttachment(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->pickImage()V

    return-void
.end method

.method static synthetic access$200(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ChatActivity$GeminiTask;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/gemini/chat/ChatActivity;)Landroid/widget/ScrollView;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    return-object v0
.end method

.method static synthetic access$202(Lcom/gemini/chat/ChatActivity;Lcom/gemini/chat/ChatActivity$GeminiTask;)Lcom/gemini/chat/ChatActivity$GeminiTask;
    .locals 0

    .prologue
    .line 49
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    return-object p1
.end method

.method static synthetic access$2100(Lcom/gemini/chat/ChatActivity;)Landroid/widget/LinearLayout;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/gemini/chat/ChatActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->lastSavedRole()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2300(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Lcom/gemini/chat/ChatActivity;->copy(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2400(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 49
    invoke-direct/range {p0 .. p5}, Lcom/gemini/chat/ChatActivity;->showEditDialog(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2500(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;)V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0, p1, p2, p3}, Lcom/gemini/chat/ChatActivity;->regenerate(JLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$2600(Lcom/gemini/chat/ChatActivity;J)V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Lcom/gemini/chat/ChatActivity;->confirmDelete(J)V

    return-void
.end method

.method static synthetic access$2700(Lcom/gemini/chat/ChatActivity;Z)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    return-void
.end method

.method static synthetic access$2800(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->startRequest()V

    return-void
.end method

.method static synthetic access$2900(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Lcom/gemini/chat/ChatActivity;->showThoughts(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->removeStreaming()V

    return-void
.end method

.method static synthetic access$3000(Lcom/gemini/chat/ChatActivity;Landroid/view/View;)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/gemini/chat/ChatActivity;->hideKeyboard(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$400(Lcom/gemini/chat/ChatActivity;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$500(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0, p1, p2, p3}, Lcom/gemini/chat/ChatActivity;->showStreaming(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .locals 0

    .prologue
    .line 49
    invoke-direct/range {p0 .. p8}, Lcom/gemini/chat/ChatActivity;->addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->scrollChatDown()V

    return-void
.end method

.method static synthetic access$800(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->maybeAutoName()V

    return-void
.end method

.method static synthetic access$900(Lcom/gemini/chat/ChatActivity;)J
    .locals 2

    .prologue
    .line 49
    iget-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    return-wide v0
.end method

.method private addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 9

    .prologue
    .line 786
    const/4 v8, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-wide v6, p6

    invoke-direct/range {v0 .. v8}, Lcom/gemini/chat/ChatActivity;->addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    .line 787
    return-void
.end method

.method private addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .locals 19

    .prologue
    .line 790
    new-instance v9, Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-direct {v9, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 791
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v2, p0

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-wide/from16 v6, p6

    .line 792
    invoke-static/range {v2 .. v8}, Lcom/gemini/chat/MessageFormatter;->format(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/ArrayList;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v9, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 793
    move-object/from16 v0, p3

    invoke-static {v9, v0}, Lcom/gemini/chat/MessageFormatter;->styleView(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 794
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

    .line 795
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 796
    return-void
.end method

.method private buildAttachBar()V
    .locals 8

    .prologue
    const/high16 v4, 0x42200000    # 40.0f

    const/high16 v7, 0x40800000    # 4.0f

    const/4 v6, -0x2

    const/4 v5, 0x0

    .line 668
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    .line 669
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 670
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 671
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

    .line 672
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 674
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    .line 675
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 676
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v4}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v3

    invoke-direct {p0, v4}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 678
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    .line 679
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 680
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-direct {p0, v1}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v1

    invoke-direct {p0, v7}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v2

    invoke-virtual {v0, v1, v5, v2, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 681
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 682
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v2, v5, v6, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 684
    new-instance v0, Landroid/widget/Button;

    const/4 v1, 0x0

    const v2, 0x1010049

    invoke-direct {v0, p0, v1, v2}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 685
    const-string v1, "Remove"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 686
    new-instance v1, Lcom/gemini/chat/ChatActivity$5;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$5;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 691
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 695
    new-instance v0, Lcom/gemini/chat/ChatActivity$6;

    invoke-direct {v0, p0}, Lcom/gemini/chat/ChatActivity$6;-><init>(Lcom/gemini/chat/ChatActivity;)V

    .line 700
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 701
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachLabel:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 704
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 705
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 707
    return-void
.end method

.method private canSend()Z
    .locals 1

    .prologue
    .line 590
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

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
    .line 580
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->removeStreaming()V

    .line 581
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    .line 582
    if-eqz v0, :cond_0

    .line 583
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/gemini/chat/ChatActivity$GeminiTask;->cancel(Z)Z

    .line 584
    invoke-virtual {v0}, Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnect()V

    .line 585
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    .line 587
    :cond_0
    return-void
.end method

.method static cleanTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v3, 0x0

    const/16 v7, 0x28

    const/4 v2, 0x0

    .line 444
    if-nez p0, :cond_1

    move-object v0, v3

    .line 459
    :cond_0
    :goto_0
    return-object v0

    .line 445
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 446
    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 447
    if-ltz v1, :cond_2

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 448
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

    .line 449
    :cond_4
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    move v1, v2

    .line 450
    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_7

    .line 451
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 452
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

    .line 450
    :cond_5
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 453
    :cond_6
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 455
    :cond_7
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 456
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

    .line 457
    :cond_9
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_a

    move-object v0, v3

    goto/16 :goto_0

    .line 458
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
    .line 990
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Delete Message"

    .line 991
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Delete this message? Later messages are kept."

    .line 992
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Delete"

    new-instance v2, Lcom/gemini/chat/ChatActivity$10;

    invoke-direct {v2, p0, p1, p2}, Lcom/gemini/chat/ChatActivity$10;-><init>(Lcom/gemini/chat/ChatActivity;J)V

    .line 993
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Cancel"

    const/4 v2, 0x0

    .line 999
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1000
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1001
    return-void
.end method

.method private copy(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 968
    const-string v0, "clipboard"

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 969
    invoke-virtual {v0, p1}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 970
    const/4 v0, 0x0

    invoke-static {p0, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 971
    return-void
.end method

.method private dp(F)I
    .locals 2

    .prologue
    .line 664
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

.method private hideKeyboard(Landroid/view/View;)V
    .locals 3

    .prologue
    .line 602
    const-string v0, "input_method"

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 603
    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 604
    :cond_0
    return-void
.end method

.method private lastSavedRole()Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 845
    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-nez v1, :cond_1

    .line 859
    :cond_0
    :goto_0
    return-object v0

    .line 847
    :cond_1
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v1, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->getMessages(J)Landroid/database/Cursor;

    move-result-object v2

    .line 848
    if-eqz v2, :cond_0

    .line 850
    :try_start_0
    const-string v1, "role"

    invoke-interface {v2, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    .line 851
    :cond_2
    :goto_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 852
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 853
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

    .line 856
    :cond_4
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 857
    throw v0
.end method

.method private loadMessages(Z)V
    .locals 20

    .prologue
    .line 800
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    invoke-virtual {v2}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v13

    .line 801
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 802
    const/4 v4, 0x0

    .line 803
    const/4 v3, 0x0

    .line 805
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

    .line 806
    :goto_0
    if-eqz v11, :cond_0

    :try_start_1
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 807
    const-string v2, "_id"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v14

    const-string v2, "role"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    const-string v2, "model"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v16

    .line 808
    const-string v2, "content"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v17

    const-string v2, "timestamp"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v18

    .line 809
    const-string v2, "thoughts"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v19

    move v12, v4

    .line 811
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

    .line 812
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

    .line 813
    :goto_3
    const/4 v2, -0x1

    move/from16 v0, v19

    if-eq v0, v2, :cond_5

    move/from16 v0, v19

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    :goto_4
    move-object/from16 v2, p0

    .line 811
    invoke-direct/range {v2 .. v10}, Lcom/gemini/chat/ChatActivity;->addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 814
    const/4 v4, 0x1

    .line 815
    :try_start_3
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result v2

    if-nez v2, :cond_8

    .line 820
    :cond_0
    if-eqz v11, :cond_1

    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 822
    :cond_1
    :goto_5
    if-nez v4, :cond_2

    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->showPlaceholder()V

    .line 823
    :cond_2
    invoke-static/range {p0 .. p0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    .line 824
    if-eqz p1, :cond_7

    .line 825
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    new-instance v3, Lcom/gemini/chat/ChatActivity$7;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v13}, Lcom/gemini/chat/ChatActivity$7;-><init>(Lcom/gemini/chat/ChatActivity;I)V

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 833
    :goto_6
    return-void

    .line 811
    :cond_3
    const/4 v6, 0x0

    goto :goto_2

    .line 812
    :cond_4
    const-wide/16 v8, 0x0

    goto :goto_3

    .line 813
    :cond_5
    const/4 v10, 0x0

    goto :goto_4

    .line 817
    :catch_0
    move-exception v2

    .line 818
    :goto_7
    :try_start_4
    const-string v5, "Gemini"

    const-string v6, "Error loading messages"

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 820
    if-eqz v3, :cond_1

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    goto :goto_5

    :catchall_0
    move-exception v2

    move-object v11, v3

    :goto_8
    if-eqz v11, :cond_6

    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 821
    :cond_6
    throw v2

    .line 831
    :cond_7
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->scrollChatDown()V

    goto :goto_6

    .line 820
    :catchall_1
    move-exception v2

    goto :goto_8

    :catchall_2
    move-exception v2

    move-object v11, v3

    goto :goto_8

    .line 817
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
    .line 463
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    new-instance v1, Lcom/gemini/chat/ChatActivity$1;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$1;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-static {p0, v0, v2, v3, v1}, Lcom/gemini/chat/AutoNamer;->maybeStart(Landroid/content/Context;Lcom/gemini/chat/DatabaseHelper;JLcom/gemini/chat/AutoNamer$Callback;)V

    .line 468
    return-void
.end method

.method private pickImage()V
    .locals 3

    .prologue
    .line 727
    new-instance v1, Landroid/content/Intent;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v0, v2, :cond_0

    const-string v0, "android.intent.action.OPEN_DOCUMENT"

    .line 728
    :goto_0
    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 729
    const-string v0, "image/*"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 730
    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 732
    const/16 v0, 0x64

    :try_start_0
    invoke-virtual {p0, v1, v0}, Lcom/gemini/chat/ChatActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 736
    :goto_1
    return-void

    .line 728
    :cond_0
    const-string v0, "android.intent.action.GET_CONTENT"

    goto :goto_0

    .line 733
    :catch_0
    move-exception v0

    .line 734
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
    .line 594
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
    .line 86
    if-nez p0, :cond_0

    const-string v0, ""

    .line 93
    :goto_0
    return-object v0

    .line 87
    :cond_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v0, Ljava/io/InputStreamReader;

    const-string v2, "UTF-8"

    invoke-direct {v0, p0, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v1, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 89
    :try_start_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 90
    const/16 v2, 0x800

    new-array v2, v2, [C

    .line 92
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

    .line 95
    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 96
    throw v0

    .line 93
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 95
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    goto :goto_0
.end method

.method private regenerate(JLjava/lang/String;)V
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 978
    const-string v0, "user"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v2, v3, p1, p2}, Lcom/gemini/chat/DatabaseHelper;->deleteMessagesAfter(JJ)V

    .line 980
    :goto_0
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->lastSavedRole()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 981
    invoke-direct {p0, v1}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 982
    const-string v0, "Nothing left to answer."

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 987
    :goto_1
    return-void

    .line 979
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v2, v3, p1, p2}, Lcom/gemini/chat/DatabaseHelper;->deleteMessagesFrom(JJ)V

    goto :goto_0

    .line 985
    :cond_1
    invoke-direct {p0, v1}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 986
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->startRequest()V

    goto :goto_1
.end method

.method private removePlaceholder()V
    .locals 3

    .prologue
    .line 780
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

    .line 781
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 783
    :cond_0
    return-void
.end method

.method private removeStreaming()V
    .locals 2

    .prologue
    .line 489
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 490
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 491
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    .line 493
    :cond_0
    return-void
.end method

.method static retryable(I)Z
    .locals 1

    .prologue
    .line 112
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
    .line 836
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    new-instance v1, Lcom/gemini/chat/ChatActivity$8;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$8;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 841
    return-void
.end method

.method private send()V
    .locals 18

    .prologue
    .line 607
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/gemini/chat/ChatActivity;->hideKeyboard(Landroid/view/View;)V

    .line 608
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 609
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "api_key"

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 610
    const-string v2, "Please go to Settings to set API Key"

    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 629
    :cond_0
    :goto_0
    return-void

    .line 613
    :cond_1
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 614
    :cond_2
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-nez v2, :cond_4

    .line 615
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "Image"

    .line 616
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

    .line 617
    :cond_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    invoke-virtual {v3, v2}, Lcom/gemini/chat/DatabaseHelper;->createChat(Ljava/lang/String;)J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/gemini/chat/ChatActivity;->chatId:J

    .line 618
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/gemini/chat/ChatActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 619
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 621
    :cond_4
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->removePlaceholder()V

    .line 622
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    .line 623
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-string v6, "user"

    invoke-virtual/range {v3 .. v8}, Lcom/gemini/chat/DatabaseHelper;->addMessage(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v11

    .line 624
    const-string v13, "user"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    move-object/from16 v10, p0

    move-object v14, v8

    move-object v15, v7

    invoke-direct/range {v10 .. v17}, Lcom/gemini/chat/ChatActivity;->addMessageToChat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 625
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/gemini/chat/ChatActivity;->setAttachment(Ljava/lang/String;)V

    .line 626
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 627
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->scrollChatDown()V

    .line 628
    invoke-direct/range {p0 .. p0}, Lcom/gemini/chat/ChatActivity;->startRequest()V

    goto/16 :goto_0

    .line 615
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
    .line 710
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    .line 711
    if-nez p1, :cond_1

    .line 712
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachBar:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 713
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 722
    :goto_0
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->canSend()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 723
    :cond_0
    invoke-static {p0}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    .line 724
    return-void

    .line 715
    :cond_1
    const/high16 v0, 0x42200000    # 40.0f

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity;->dp(F)I

    move-result v0

    invoke-static {p1, v0}, Lcom/gemini/chat/Thumbnail;->fromDataUri(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 716
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->attachThumb:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 717
    const/16 v0, 0x2c

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 718
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int v0, v1, v0

    add-int/lit8 v0, v0, -0x1

    int-to-long v0, v0

    const-wide/16 v2, 0x3

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x4

    div-long/2addr v0, v2

    .line 719
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

    .line 720
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

    .line 646
    iget-object v2, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 647
    if-eqz p1, :cond_1

    .line 648
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    const-string v2, "Model is generating..."

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 649
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 650
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnStop:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 657
    :goto_1
    return-void

    :cond_0
    move v0, v1

    .line 646
    goto :goto_0

    .line 652
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    const-string v2, "Message Gemini..."

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 653
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnStop:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 654
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 655
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

    .line 1008
    const-string v1, "user"

    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 1009
    if-eqz v1, :cond_0

    if-eqz p4, :cond_0

    const-string v2, "data:image/"

    invoke-virtual {p4, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v3, v0

    .line 1010
    :goto_0
    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 1011
    invoke-virtual {v2, p5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1012
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->length()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setSelection(I)V

    .line 1013
    const/16 v4, 0x30

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setGravity(I)V

    .line 1015
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

    .line 1016
    const/4 v5, 0x3

    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 1017
    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setVerticalScrollBarEnabled(Z)V

    .line 1019
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    if-eqz v1, :cond_1

    const-string v0, "Edit Message"

    :goto_1
    invoke-virtual {v4, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 1020
    if-eqz v1, :cond_2

    .line 1021
    const-string v7, "Resend"

    new-instance v0, Lcom/gemini/chat/ChatActivity$11;

    move-object v1, p0

    move-wide v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/gemini/chat/ChatActivity$11;-><init>(Lcom/gemini/chat/ChatActivity;Landroid/widget/EditText;ZJ)V

    invoke-virtual {v6, v7, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1032
    const-string v7, "Save"

    new-instance v0, Lcom/gemini/chat/ChatActivity$12;

    move-object v1, p0

    move-wide v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/gemini/chat/ChatActivity$12;-><init>(Lcom/gemini/chat/ChatActivity;Landroid/widget/EditText;ZJ)V

    invoke-virtual {v6, v7, v0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1056
    :goto_2
    const-string v0, "Cancel"

    const/4 v1, 0x0

    invoke-virtual {v6, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1057
    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1058
    return-void

    .line 1009
    :cond_0
    const/4 v3, 0x0

    goto :goto_0

    .line 1019
    :cond_1
    const-string v0, "Edit Reply"

    goto :goto_1

    .line 1042
    :cond_2
    const-string v0, "Save"

    new-instance v1, Lcom/gemini/chat/ChatActivity$13;

    invoke-direct {v1, p0, v2, p1, p2}, Lcom/gemini/chat/ChatActivity$13;-><init>(Lcom/gemini/chat/ChatActivity;Landroid/widget/EditText;J)V

    invoke-virtual {v6, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_2
.end method

.method private showPlaceholder()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 768
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 769
    const-string v1, "Start chatting\nType a message below to start."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 770
    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 771
    const v1, -0x777778

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 772
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 773
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v1, v3, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 775
    const-string v1, "placeholder"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 776
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 777
    return-void
.end method

.method private showStreaming(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    .prologue
    const/4 v1, 0x0

    .line 474
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

    .line 475
    :goto_0
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    if-nez v0, :cond_0

    .line 476
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->removePlaceholder()V

    .line 477
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    .line 478
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    const-string v2, "model"

    invoke-static {v0, v2}, Lcom/gemini/chat/MessageFormatter;->styleView(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 479
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLongClickable(Z)V

    .line 480
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 482
    :cond_0
    iget-object v8, p0, Lcom/gemini/chat/ChatActivity;->streamView:Landroid/widget/TextView;

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_3

    .line 483
    const-string v1, "model"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p3

    invoke-static/range {v0 .. v6}, Lcom/gemini/chat/MessageFormatter;->format(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/ArrayList;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 482
    :goto_1
    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 485
    if-eqz v7, :cond_1

    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->scrollChatDown()V

    .line 486
    :cond_1
    return-void

    :cond_2
    move v7, v1

    .line 474
    goto :goto_0

    .line 484
    :cond_3
    invoke-static {p0, p1, p2}, Lcom/gemini/chat/MessageFormatter;->formatThinking(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_1
.end method

.method private showThoughts(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    .prologue
    .line 949
    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 950
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 951
    invoke-static {p0, p2}, Lcom/gemini/chat/MessageFormatter;->formatBody(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 952
    const-string v2, "model"

    invoke-static {v0, v2}, Lcom/gemini/chat/MessageFormatter;->styleView(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 953
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setLongClickable(Z)V

    .line 954
    invoke-virtual {v1, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 955
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Thought Process"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 956
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

    .line 957
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Close"

    const/4 v2, 0x0

    .line 958
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Copy"

    new-instance v2, Lcom/gemini/chat/ChatActivity$9;

    invoke-direct {v2, p0, p2}, Lcom/gemini/chat/ChatActivity$9;-><init>(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;)V

    .line 959
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 964
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 965
    return-void

    .line 956
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method private startRequest()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 633
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    .line 634
    const-string v1, "api_key"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 635
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 636
    const-string v0, "Please go to Settings to set API Key"

    invoke-static {p0, v0, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 643
    :goto_0
    return-void

    .line 639
    :cond_0
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->cancelTask()V

    .line 640
    new-instance v2, Lcom/gemini/chat/ChatActivity$GeminiTask;

    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-direct {v2, p0, v4, v5}, Lcom/gemini/chat/ChatActivity$GeminiTask;-><init>(Lcom/gemini/chat/ChatActivity;J)V

    iput-object v2, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    .line 641
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

    .line 642
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

    .line 641
    invoke-virtual {v2, v3}, Lcom/gemini/chat/ChatActivity$GeminiTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 642
    :cond_1
    const-string v0, "0"

    goto :goto_1
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

    .line 430
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 431
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_1

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 432
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

    .line 434
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 435
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

    .line 436
    invoke-virtual {v7, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v6, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v4, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 435
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 437
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

    .line 438
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    .line 437
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 439
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

    .line 100
    const/16 v0, 0x3b

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 101
    const/16 v1, 0x2c

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 102
    if-le v0, v4, :cond_0

    if-gt v1, v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    .line 108
    :goto_0
    return-object v0

    .line 103
    :cond_1
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 104
    const-string v3, "mimeType"

    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 105
    const-string v0, "data"

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 106
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 107
    const-string v1, "inlineData"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6

    .prologue
    const-wide/16 v2, -0x1

    .line 740
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 741
    const/16 v0, 0x65

    if-ne p1, v0, :cond_3

    .line 743
    if-eqz p3, :cond_2

    const-string v0, "chat_id"

    invoke-virtual {p3, v0, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    .line 744
    :goto_0
    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    cmp-long v4, v4, v2

    if-nez v4, :cond_0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    iput-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    .line 745
    :cond_0
    iget-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 746
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->getChatTitle(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 747
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 748
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->maybeAutoName()V

    .line 761
    :cond_1
    :goto_1
    return-void

    :cond_2
    move-wide v0, v2

    .line 743
    goto :goto_0

    .line 752
    :cond_3
    const/16 v0, 0x64

    if-ne p1, v0, :cond_1

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    if-eqz p3, :cond_1

    .line 753
    invoke-virtual {p3}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    .line 754
    if-eqz v0, :cond_1

    .line 755
    invoke-static {p0, v0}, Lcom/gemini/chat/ImageUtil;->uriToBase64(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 756
    if-nez v0, :cond_4

    .line 757
    const-string v0, "Could not read that image (only images are supported)."

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 760
    :cond_4
    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity;->setAttachment(Ljava/lang/String;)V

    goto :goto_1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .prologue
    const-wide/16 v2, -0x1

    .line 501
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 502
    invoke-static {p0}, Lcom/gemini/chat/MessageFormatter;->applyPrefs(Landroid/content/Context;)V

    .line 503
    sget v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    iput v0, p0, Lcom/gemini/chat/ChatActivity;->renderedTextSp:F

    .line 504
    const v0, 0x7f030002

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->setContentView(I)V

    .line 505
    const v0, 0x7f050002

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    .line 506
    const v0, 0x7f050003

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    .line 507
    const v0, 0x7f050004

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnStop:Landroid/widget/Button;

    .line 508
    const v0, 0x7f050001

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->layoutChat:Landroid/widget/LinearLayout;

    .line 509
    const/high16 v0, 0x7f050000

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->scrollChat:Landroid/widget/ScrollView;

    .line 510
    new-instance v0, Lcom/gemini/chat/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/gemini/chat/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    .line 511
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->buildAttachBar()V

    .line 513
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "chat_id"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    .line 514
    iget-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 515
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->getChatTitle(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 516
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 522
    :goto_0
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->etInput:Landroid/widget/EditText;

    new-instance v1, Lcom/gemini/chat/ChatActivity$2;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$2;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 533
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnSend:Landroid/widget/Button;

    new-instance v1, Lcom/gemini/chat/ChatActivity$3;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$3;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 538
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->btnStop:Landroid/widget/Button;

    new-instance v1, Lcom/gemini/chat/ChatActivity$4;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ChatActivity$4;-><init>(Lcom/gemini/chat/ChatActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 557
    return-void

    .line 518
    :cond_0
    const-string v0, "New chat"

    invoke-virtual {p0, v0}, Lcom/gemini/chat/ChatActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 519
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->showPlaceholder()V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1067
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "ic_menu_live"

    const-string v2, "drawable"

    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 1068
    const/4 v1, 0x5

    const-string v2, "Live Voice"

    invoke-interface {p1, v4, v1, v4, v2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    if-eqz v0, :cond_1

    :goto_0
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1069
    const/4 v0, 0x6

    const-string v1, "Rename Chat"

    invoke-interface {p1, v4, v0, v4, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x108003e

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1070
    const-string v0, "Settings"

    invoke-interface {p1, v4, v5, v4, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080049

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1071
    const/4 v0, 0x2

    const-string v1, "Delete This Chat"

    invoke-interface {p1, v4, v0, v4, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x108003c

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1072
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-lt v0, v1, :cond_0

    .line 1073
    const/4 v0, 0x3

    const-string v1, "Attach Image"

    invoke-interface {p1, v4, v0, v4, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080033

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1074
    const/4 v0, 0x4

    const-string v1, "Remove Image"

    invoke-interface {p1, v4, v0, v4, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080038

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1076
    :cond_0
    return v5

    .line 1068
    :cond_1
    const v0, 0x10800a4

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 574
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 575
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->cancelTask()V

    .line 576
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    invoke-virtual {v0}, Lcom/gemini/chat/DatabaseHelper;->close()V

    .line 577
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v0, 0x1

    .line 1110
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 1165
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 1112
    :pswitch_0
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/gemini/chat/SettingsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/gemini/chat/ChatActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1115
    :pswitch_1
    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    .line 1116
    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity;->finish()V

    goto :goto_0

    .line 1119
    :cond_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Delete Chat"

    .line 1120
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Are you sure you want to delete this chat?"

    .line 1121
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Delete"

    new-instance v3, Lcom/gemini/chat/ChatActivity$14;

    invoke-direct {v3, p0}, Lcom/gemini/chat/ChatActivity$14;-><init>(Lcom/gemini/chat/ChatActivity;)V

    .line 1122
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Cancel"

    .line 1128
    invoke-virtual {v1, v2, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1129
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 1132
    :pswitch_2
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->pickImage()V

    goto :goto_0

    .line 1135
    :pswitch_3
    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 1136
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 1137
    iget-object v2, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v2, v4, v5}, Lcom/gemini/chat/DatabaseHelper;->getChatTitle(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1138
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V

    .line 1139
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Rename Chat"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "Save"

    new-instance v4, Lcom/gemini/chat/ChatActivity$15;

    invoke-direct {v4, p0, v1}, Lcom/gemini/chat/ChatActivity$15;-><init>(Lcom/gemini/chat/ChatActivity;Landroid/widget/EditText;)V

    .line 1140
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Cancel"

    .line 1149
    invoke-virtual {v1, v2, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1150
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0

    .line 1154
    :pswitch_4
    invoke-direct {p0}, Lcom/gemini/chat/ChatActivity;->cancelTask()V

    .line 1155
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/gemini/chat/ChatActivity;->setUiLoading(Z)V

    .line 1156
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/gemini/chat/LiveActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1157
    const-string v2, "chat_id"

    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v1, v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1158
    const/16 v2, 0x65

    invoke-virtual {p0, v1, v2}, Lcom/gemini/chat/ChatActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 1162
    :pswitch_5
    invoke-direct {p0, v6}, Lcom/gemini/chat/ChatActivity;->setAttachment(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1110
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

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 8

    .prologue
    const-wide/16 v6, -0x1

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1081
    const/4 v0, 0x6

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 1082
    if-eqz v3, :cond_0

    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    cmp-long v0, v4, v6

    if-eqz v0, :cond_5

    move v0, v1

    :goto_0
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1083
    :cond_0
    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 1084
    if-eqz v3, :cond_1

    .line 1086
    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    cmp-long v0, v4, v6

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    if-eqz v0, :cond_a

    .line 1087
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->dbHelper:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    invoke-virtual {v0, v4, v5}, Lcom/gemini/chat/DatabaseHelper;->getMessages(J)Landroid/database/Cursor;

    move-result-object v4

    .line 1088
    if-eqz v4, :cond_a

    .line 1090
    :try_start_0
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-lez v0, :cond_6

    move v0, v1

    .line 1092
    :goto_1
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 1096
    :goto_2
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1098
    :cond_1
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 1099
    if-eqz v3, :cond_3

    .line 1100
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x13

    if-lt v0, v4, :cond_2

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

    .line 1101
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    if-nez v0, :cond_8

    const-string v0, "Attach Image"

    :goto_4
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 1103
    :cond_3
    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 1104
    if-eqz v0, :cond_4

    iget-object v3, p0, Lcom/gemini/chat/ChatActivity;->pendingImage:Ljava/lang/String;

    if-eqz v3, :cond_9

    :goto_5
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1105
    :cond_4
    invoke-super {p0, p1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0

    :cond_5
    move v0, v2

    .line 1082
    goto :goto_0

    :cond_6
    move v0, v2

    .line 1090
    goto :goto_1

    .line 1092
    :catchall_0
    move-exception v0

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 1093
    throw v0

    :cond_7
    move v0, v2

    .line 1100
    goto :goto_3

    .line 1101
    :cond_8
    const-string v0, "Change Image"

    goto :goto_4

    :cond_9
    move v1, v2

    .line 1104
    goto :goto_5

    :cond_a
    move v0, v2

    goto :goto_2
.end method

.method protected onResume()V
    .locals 4

    .prologue
    .line 564
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 565
    invoke-static {p0}, Lcom/gemini/chat/MessageFormatter;->applyPrefs(Landroid/content/Context;)V

    .line 566
    sget v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    iget v1, p0, Lcom/gemini/chat/ChatActivity;->renderedTextSp:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    .line 567
    sget v0, Lcom/gemini/chat/MessageFormatter;->TEXT_SP:F

    iput v0, p0, Lcom/gemini/chat/ChatActivity;->renderedTextSp:F

    .line 568
    iget-wide v0, p0, Lcom/gemini/chat/ChatActivity;->chatId:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity;->currentTask:Lcom/gemini/chat/ChatActivity$GeminiTask;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V

    .line 570
    :cond_0
    return-void
.end method
