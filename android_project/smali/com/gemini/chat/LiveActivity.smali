.class public Lcom/gemini/chat/LiveActivity;
.super Landroid/app/Activity;
.source "LiveActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gemini/chat/LiveActivity$Player;,
        Lcom/gemini/chat/LiveActivity$Main;,
        Lcom/gemini/chat/LiveActivity$Transcriber;,
        Lcom/gemini/chat/LiveActivity$Mic;
    }
.end annotation


# static fields
.field static final DEFAULT_LIVE_MODEL:Ljava/lang/String; = "gemini-3.8-live"

.field static final DEFAULT_VOICE:Ljava/lang/String; = "Kore"

.field private static final ECHO_TAIL_MS:J = 0x2bcL

.field private static final HISTORY_MAX_CHARS:I = 0x5dc0

.field static final LIVE_MODELS:[Ljava/lang/String;

.field static final THINKING:[Ljava/lang/String;

.field static final VOICES:[Ljava/lang/String;


# instance fields
.field private btnSend:Landroid/widget/Button;

.field private btnTalk:Landroid/widget/Button;

.field private chatId:J

.field private connected:Z

.field private db:Lcom/gemini/chat/DatabaseHelper;

.field private destroyed:Z

.field private ending:Z

.field private handsFree:Z

.field private final heard:Ljava/lang/StringBuffer;

.field private input:Landroid/widget/EditText;

.field private liveText:Z

.field private mic:Lcom/gemini/chat/LiveActivity$Mic;

.field private volatile micOpenAfter:J

.field private model:Ljava/lang/String;

.field private final modelShown:Ljava/lang/StringBuffer;

.field private volatile modelTurnActive:Z

.field private modelTurnDone:Z

.field private modelView:Landroid/widget/TextView;

.field private muted:Z

.field private final pendingText:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<[",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private player:Lcom/gemini/chat/LiveActivity$Player;

.field private reconnects:I

.field private scroll:Landroid/widget/ScrollView;

.field private session:Lcom/gemini/chat/LiveSession;

.field private volatile sessionGen:I

.field private final spokenFinal:Ljava/lang/StringBuffer;

.field private spokenInterim:Ljava/lang/String;

.field private status:Landroid/widget/TextView;

.field private talking:Z

.field private final tick:Ljava/lang/Runnable;

.field private tr:Lcom/gemini/chat/LiveSession;

.field private turns:Landroid/widget/LinearLayout;

.field private typedPrefix:Ljava/lang/String;

.field private final ui:Landroid/os/Handler;

.field private voice:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 37
    new-array v0, v6, [Ljava/lang/String;

    const-string v1, "gemini-3.8-live"

    aput-object v1, v0, v3

    const-string v1, "gemini-3.8-live-extended-thinking"

    aput-object v1, v0, v4

    const-string v1, "gemini-3.1-flash-live-preview"

    aput-object v1, v0, v5

    sput-object v0, Lcom/gemini/chat/LiveActivity;->LIVE_MODELS:[Ljava/lang/String;

    .line 40
    const/16 v0, 0x1e

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "Zephyr -- Bright"

    aput-object v1, v0, v3

    const-string v1, "Puck -- Upbeat"

    aput-object v1, v0, v4

    const-string v1, "Charon -- Informative"

    aput-object v1, v0, v5

    const-string v1, "Kore -- Firm"

    aput-object v1, v0, v6

    const/4 v1, 0x4

    const-string v2, "Fenrir -- Excitable"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "Leda -- Youthful"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "Orus -- Firm"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "Aoede -- Breezy"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "Callirrhoe -- Easy-going"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "Autonoe -- Bright"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "Enceladus -- Breathy"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "Iapetus -- Clear"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "Umbriel -- Easy-going"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "Algieba -- Smooth"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "Despina -- Smooth"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "Erinome -- Clear"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "Algenib -- Gravelly"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "Rasalgethi -- Informative"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "Laomedeia -- Upbeat"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "Achernar -- Soft"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "Alnilam -- Firm"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "Schedar -- Even"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "Gacrux -- Mature"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "Pulcherrima -- Forward"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "Achird -- Friendly"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "Zubenelgenubi -- Casual"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "Vindemiatrix -- Gentle"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "Sadachbia -- Lively"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "Sadaltager -- Knowledgeable"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "Sulafat -- Warm"

    aput-object v2, v0, v1

    sput-object v0, Lcom/gemini/chat/LiveActivity;->VOICES:[Ljava/lang/String;

    .line 48
    new-array v0, v6, [Ljava/lang/String;

    const-string v1, "low"

    aput-object v1, v0, v3

    const-string v1, "medium"

    aput-object v1, v0, v4

    const-string v1, "high"

    aput-object v1, v0, v5

    sput-object v0, Lcom/gemini/chat/LiveActivity;->THINKING:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 52
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->ui:Landroid/os/Handler;

    .line 78
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->heard:Ljava/lang/StringBuffer;

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->spokenFinal:Ljava/lang/StringBuffer;

    .line 79
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->spokenInterim:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->typedPrefix:Ljava/lang/String;

    .line 82
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->modelShown:Ljava/lang/StringBuffer;

    .line 83
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->pendingText:Ljava/util/LinkedList;

    .line 540
    new-instance v0, Lcom/gemini/chat/LiveActivity$5;

    invoke-direct {v0, p0}, Lcom/gemini/chat/LiveActivity$5;-><init>(Lcom/gemini/chat/LiveActivity;)V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->tick:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->sendTyped()V

    return-void
.end method

.method static synthetic access$100(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->onTalk()V

    return-void
.end method

.method static synthetic access$1000(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->idleStatus()V

    return-void
.end method

.method static synthetic access$1100(Lcom/gemini/chat/LiveActivity;)Ljava/lang/Runnable;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->tick:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/gemini/chat/LiveActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->ui:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->openTranscriber()V

    return-void
.end method

.method static synthetic access$1400(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveSession;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    return-object v0
.end method

.method static synthetic access$1402(Lcom/gemini/chat/LiveActivity;Lcom/gemini/chat/LiveSession;)Lcom/gemini/chat/LiveSession;
    .locals 0

    .prologue
    .line 36
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    return-object p1
.end method

.method static synthetic access$1500(Lcom/gemini/chat/LiveActivity;)Z
    .locals 1

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    return v0
.end method

.method static synthetic access$1600(Lcom/gemini/chat/LiveActivity;Z)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/gemini/chat/LiveActivity;->stopTalking(Z)V

    return-void
.end method

.method static synthetic access$1700(Lcom/gemini/chat/LiveActivity;)Z
    .locals 1

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->ending:Z

    return v0
.end method

.method static synthetic access$1800(Lcom/gemini/chat/LiveActivity;)I
    .locals 1

    .prologue
    .line 36
    iget v0, p0, Lcom/gemini/chat/LiveActivity;->reconnects:I

    return v0
.end method

.method static synthetic access$1802(Lcom/gemini/chat/LiveActivity;I)I
    .locals 0

    .prologue
    .line 36
    iput p1, p0, Lcom/gemini/chat/LiveActivity;->reconnects:I

    return p1
.end method

.method static synthetic access$1808(Lcom/gemini/chat/LiveActivity;)I
    .locals 2

    .prologue
    .line 36
    iget v0, p0, Lcom/gemini/chat/LiveActivity;->reconnects:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/gemini/chat/LiveActivity;->reconnects:I

    return v0
.end method

.method static synthetic access$1900(Lcom/gemini/chat/LiveActivity;Z)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/gemini/chat/LiveActivity;->finishModelTurn(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/gemini/chat/LiveActivity;)Landroid/widget/LinearLayout;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->turns:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/gemini/chat/LiveActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/gemini/chat/LiveActivity;->connect(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2100(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->finishUserTurn()V

    return-void
.end method

.method static synthetic access$2200(Lcom/gemini/chat/LiveActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/gemini/chat/LiveActivity;->setStatus(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2300(Lcom/gemini/chat/LiveActivity;)Z
    .locals 1

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->modelTurnActive:Z

    return v0
.end method

.method static synthetic access$2302(Lcom/gemini/chat/LiveActivity;Z)Z
    .locals 0

    .prologue
    .line 36
    iput-boolean p1, p0, Lcom/gemini/chat/LiveActivity;->modelTurnActive:Z

    return p1
.end method

.method static synthetic access$2400(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveActivity$Player;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->player:Lcom/gemini/chat/LiveActivity$Player;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/gemini/chat/LiveActivity;)Ljava/lang/StringBuffer;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->heard:Ljava/lang/StringBuffer;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateBox()V

    return-void
.end method

.method static synthetic access$2700(Lcom/gemini/chat/LiveActivity;)Z
    .locals 1

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->modelTurnDone:Z

    return v0
.end method

.method static synthetic access$2702(Lcom/gemini/chat/LiveActivity;Z)Z
    .locals 0

    .prologue
    .line 36
    iput-boolean p1, p0, Lcom/gemini/chat/LiveActivity;->modelTurnDone:Z

    return p1
.end method

.method static synthetic access$2800(Lcom/gemini/chat/LiveActivity;)Ljava/util/LinkedList;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->pendingText:Ljava/util/LinkedList;

    return-object v0
.end method

.method static synthetic access$2902(Lcom/gemini/chat/LiveActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .prologue
    .line 36
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity;->spokenInterim:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$300(Lcom/gemini/chat/LiveActivity;)Landroid/widget/ScrollView;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->scroll:Landroid/widget/ScrollView;

    return-object v0
.end method

.method static synthetic access$3000(Lcom/gemini/chat/LiveActivity;)Ljava/lang/StringBuffer;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->spokenFinal:Ljava/lang/StringBuffer;

    return-object v0
.end method

.method static synthetic access$3100(Lcom/gemini/chat/LiveActivity;)Lcom/gemini/chat/LiveSession;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    return-object v0
.end method

.method static synthetic access$3102(Lcom/gemini/chat/LiveActivity;Lcom/gemini/chat/LiveSession;)Lcom/gemini/chat/LiveSession;
    .locals 0

    .prologue
    .line 36
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    return-object p1
.end method

.method static synthetic access$3200(Lcom/gemini/chat/LiveActivity;)Ljava/lang/StringBuffer;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->modelShown:Ljava/lang/StringBuffer;

    return-object v0
.end method

.method static synthetic access$3300(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->showModel()V

    return-void
.end method

.method static synthetic access$3400(Lcom/gemini/chat/LiveActivity;)Z
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->pendingIsEmpty()Z

    move-result v0

    return v0
.end method

.method static synthetic access$3502(Lcom/gemini/chat/LiveActivity;J)J
    .locals 1

    .prologue
    .line 36
    iput-wide p1, p0, Lcom/gemini/chat/LiveActivity;->micOpenAfter:J

    return-wide p1
.end method

.method static synthetic access$3600(Lcom/gemini/chat/LiveActivity;)Z
    .locals 1

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->muted:Z

    return v0
.end method

.method static synthetic access$3700(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->resume()V

    return-void
.end method

.method static synthetic access$3800(Lcom/gemini/chat/LiveActivity;)J
    .locals 2

    .prologue
    .line 36
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    return-wide v0
.end method

.method static synthetic access$3900(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateTitle()V

    return-void
.end method

.method static synthetic access$4000(Lcom/gemini/chat/LiveActivity;)Z
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->micMuted()Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/gemini/chat/LiveActivity;)I
    .locals 1

    .prologue
    .line 36
    iget v0, p0, Lcom/gemini/chat/LiveActivity;->sessionGen:I

    return v0
.end method

.method static synthetic access$600(Lcom/gemini/chat/LiveActivity;)Z
    .locals 1

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->destroyed:Z

    return v0
.end method

.method static synthetic access$800(Lcom/gemini/chat/LiveActivity;)Z
    .locals 1

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->connected:Z

    return v0
.end method

.method static synthetic access$802(Lcom/gemini/chat/LiveActivity;Z)Z
    .locals 0

    .prologue
    .line 36
    iput-boolean p1, p0, Lcom/gemini/chat/LiveActivity;->connected:Z

    return p1
.end method

.method static synthetic access$900(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateButtons()V

    return-void
.end method

.method private addTurnView(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 8

    .prologue
    .line 253
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 254
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v6}, Lcom/gemini/chat/MessageFormatter;->format(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/ArrayList;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 255
    invoke-static {v7, p1}, Lcom/gemini/chat/MessageFormatter;->styleView(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 256
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->turns:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 257
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->scrollDown()V

    .line 258
    return-object v7
.end method

.method private apiKey()Ljava/lang/String;
    .locals 3

    .prologue
    .line 324
    const-string v0, "GeminiPrefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/gemini/chat/LiveActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "api_key"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private bargeIn()V
    .locals 1

    .prologue
    .line 659
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->modelTurnActive:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->player:Lcom/gemini/chat/LiveActivity$Player;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->pendingIsEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 660
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->player:Lcom/gemini/chat/LiveActivity$Player;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->flush()V

    .line 661
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->finishModelTurn(Z)V

    .line 662
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->modelTurnActive:Z

    .line 664
    :cond_1
    return-void
.end method

.method private connect(Ljava/lang/String;)V
    .locals 9

    .prologue
    .line 329
    const-string v0, "GeminiPrefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/gemini/chat/LiveActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 330
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->apiKey()Ljava/lang/String;

    move-result-object v1

    .line 331
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 332
    const-string v0, "Please go to Settings to set API Key"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 333
    const-string v0, "No API key"

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->setStatus(Ljava/lang/String;)V

    .line 334
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateButtons()V

    .line 346
    :goto_0
    return-void

    .line 337
    :cond_0
    const-string v0, "system_instruction"

    const-string v2, ""

    invoke-interface {v7, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/gemini/chat/TimeGrounding;->apply(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 338
    iget v0, p0, Lcom/gemini/chat/LiveActivity;->sessionGen:I

    add-int/lit8 v8, v0, 0x1

    iput v8, p0, Lcom/gemini/chat/LiveActivity;->sessionGen:I

    .line 339
    new-instance v0, Lcom/gemini/chat/LiveSession;

    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->model:Ljava/lang/String;

    iget-object v3, p0, Lcom/gemini/chat/LiveActivity;->voice:Ljava/lang/String;

    iget-boolean v5, p0, Lcom/gemini/chat/LiveActivity;->handsFree:Z

    new-instance v6, Lcom/gemini/chat/LiveActivity$Main;

    invoke-direct {v6, p0, v8}, Lcom/gemini/chat/LiveActivity$Main;-><init>(Lcom/gemini/chat/LiveActivity;I)V

    invoke-direct/range {v0 .. v6}, Lcom/gemini/chat/LiveSession;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/gemini/chat/LiveSession$Listener;)V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    .line 340
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->model:Ljava/lang/String;

    invoke-static {v0}, Lcom/gemini/chat/LiveSession;->needsThinkingLevel(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    const-string v1, "live_thinking"

    const-string v2, "low"

    invoke-interface {v7, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/gemini/chat/LiveSession;->thinkingLevel:Ljava/lang/String;

    .line 341
    :cond_1
    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    iput-object p1, v0, Lcom/gemini/chat/LiveSession;->resumeHandle:Ljava/lang/String;

    .line 343
    :goto_1
    if-eqz p1, :cond_3

    const-string v0, "Reconnecting..."

    :goto_2
    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->setStatus(Ljava/lang/String;)V

    .line 344
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateButtons()V

    .line 345
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->start()V

    goto :goto_0

    .line 342
    :cond_2
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->history()[[Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/gemini/chat/LiveSession;->history:[[Ljava/lang/String;

    goto :goto_1

    .line 343
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Connecting to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->model:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->voice:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2
.end method

.method private dp(F)I
    .locals 2

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/gemini/chat/LiveActivity;->getResources()Landroid/content/res/Resources;

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

.method private finishModelTurn(Z)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 584
    if-eqz p1, :cond_1

    .line 585
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->pendingText:Ljava/util/LinkedList;

    monitor-enter v1

    .line 586
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->pendingText:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->modelShown:Ljava/lang/StringBuffer;

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->pendingText:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    const/4 v3, 0x1

    aget-object v0, v0, v3

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 587
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_0
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 588
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->showModel()V

    .line 590
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->modelShown:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 591
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 592
    const-string v1, "model"

    invoke-direct {p0, v1, v0}, Lcom/gemini/chat/LiveActivity;->save(Ljava/lang/String;Ljava/lang/String;)V

    .line 593
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->destroyed:Z

    if-nez v0, :cond_2

    .line 595
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->db:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    new-instance v1, Lcom/gemini/chat/LiveActivity$6;

    invoke-direct {v1, p0}, Lcom/gemini/chat/LiveActivity$6;-><init>(Lcom/gemini/chat/LiveActivity;)V

    invoke-static {p0, v0, v2, v3, v1}, Lcom/gemini/chat/AutoNamer;->maybeStart(Landroid/content/Context;Lcom/gemini/chat/DatabaseHelper;JLcom/gemini/chat/AutoNamer$Callback;)V

    .line 602
    :cond_2
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->modelShown:Ljava/lang/StringBuffer;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 603
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->modelView:Landroid/widget/TextView;

    .line 604
    iput-boolean v4, p0, Lcom/gemini/chat/LiveActivity;->modelTurnDone:Z

    .line 605
    return-void
.end method

.method private finishUserTurn()V
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 609
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->heard:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 610
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->spokenFinal:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->spokenInterim:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 611
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3

    const/4 v1, 0x1

    .line 612
    :goto_0
    if-eqz v1, :cond_1

    .line 613
    const-string v3, "user"

    const/4 v4, 0x0

    invoke-direct {p0, v3, v4, v0}, Lcom/gemini/chat/LiveActivity;->addTurnView(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/TextView;

    .line 614
    const-string v3, "user"

    invoke-direct {p0, v3, v0}, Lcom/gemini/chat/LiveActivity;->save(Ljava/lang/String;Ljava/lang/String;)V

    .line 616
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->heard:Ljava/lang/StringBuffer;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 617
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->spokenFinal:Ljava/lang/StringBuffer;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 618
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->spokenInterim:Ljava/lang/String;

    .line 619
    if-eqz v1, :cond_2

    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->liveText:Z

    if-eqz v0, :cond_2

    .line 620
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->typedPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 621
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 623
    :cond_2
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->typedPrefix:Ljava/lang/String;

    .line 624
    return-void

    :cond_3
    move v1, v2

    .line 611
    goto :goto_0
.end method

.method private history()[[Ljava/lang/String;
    .locals 11

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v10, 0x1

    .line 293
    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    move-object v0, v1

    .line 316
    :goto_0
    return-object v0

    .line 294
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 295
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->db:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v6, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    invoke-virtual {v2, v6, v7}, Lcom/gemini/chat/DatabaseHelper;->getMessages(J)Landroid/database/Cursor;

    move-result-object v2

    .line 296
    if-nez v2, :cond_1

    move-object v0, v1

    goto :goto_0

    .line 298
    :cond_1
    :try_start_0
    const-string v3, "role"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    const-string v5, "content"

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    .line 299
    :cond_2
    :goto_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 300
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 301
    const-string v8, "user"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    const-string v8, "model"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    :cond_3
    if-eqz v7, :cond_2

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_2

    .line 302
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    aput-object v6, v8, v9

    const/4 v6, 0x1

    aput-object v7, v8, v6

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 306
    :catchall_0
    move-exception v0

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 307
    throw v0

    .line 306
    :cond_4
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 308
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v0

    .line 309
    :goto_2
    if-lez v2, :cond_5

    add-int/lit8 v0, v2, -0x1

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    aget-object v0, v0, v10

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v0, v3

    const/16 v5, 0x5dc0

    if-gt v0, v5, :cond_5

    .line 310
    add-int/lit8 v0, v2, -0x1

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    aget-object v0, v0, v10

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v0, v3

    .line 311
    add-int/lit8 v2, v2, -0x1

    move v3, v0

    goto :goto_2

    .line 313
    :cond_5
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v2, v0, :cond_6

    move-object v0, v1

    goto/16 :goto_0

    .line 314
    :cond_6
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v2

    new-array v3, v0, [[Ljava/lang/String;

    move v1, v2

    .line 315
    :goto_3
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_7

    sub-int v5, v1, v2

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    aput-object v0, v3, v5

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_3

    :cond_7
    move-object v0, v3

    .line 316
    goto/16 :goto_0
.end method

.method private idleStatus()V
    .locals 2

    .prologue
    .line 245
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->connected:Z

    if-nez v0, :cond_0

    .line 250
    :goto_0
    return-void

    .line 247
    :cond_0
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->handsFree:Z

    if-eqz v0, :cond_2

    const-string v0, "Listening (hands-free)..."

    .line 249
    :goto_1
    iget-boolean v1, p0, Lcom/gemini/chat/LiveActivity;->muted:Z

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " (voice muted)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_1
    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->setStatus(Ljava/lang/String;)V

    goto :goto_0

    .line 247
    :cond_2
    const-string v0, "Listening... tap \"Send speech\" when done"

    goto :goto_1

    .line 248
    :cond_3
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->handsFree:Z

    if-eqz v0, :cond_4

    const-string v0, "Tap the mic button and speak, or type"

    goto :goto_1

    :cond_4
    const-string v0, "Tap Talk and speak, or type"

    goto :goto_1
.end method

.method private loadExisting()V
    .locals 13

    .prologue
    .line 271
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 289
    :cond_0
    :goto_0
    return-void

    .line 272
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->db:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    invoke-virtual {v0, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->getMessages(J)Landroid/database/Cursor;

    move-result-object v7

    .line 273
    if-eqz v7, :cond_0

    .line 275
    :try_start_0
    const-string v0, "role"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    const-string v0, "content"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    const-string v0, "model"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v10

    .line 276
    const-string v0, "timestamp"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    .line 277
    :cond_2
    :goto_1
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 278
    invoke-interface {v7, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 279
    const-string v0, "user"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 280
    :cond_3
    new-instance v12, Landroid/widget/TextView;

    invoke-direct {v12, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 281
    invoke-interface {v7, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v7, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v7, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    const/4 v6, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lcom/gemini/chat/MessageFormatter;->format(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/ArrayList;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v12, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 282
    invoke-static {v12, v1}, Lcom/gemini/chat/MessageFormatter;->styleView(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 283
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->turns:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 286
    :catchall_0
    move-exception v0

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 287
    throw v0

    .line 286
    :cond_4
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 288
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->scrollDown()V

    goto :goto_0
.end method

.method private micMuted()Z
    .locals 4

    .prologue
    .line 712
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->handsFree:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->modelTurnActive:Z

    if-nez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity;->micOpenAfter:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->player:Lcom/gemini/chat/LiveActivity$Player;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private onTalk()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 667
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    if-nez v0, :cond_1

    .line 668
    const/4 v0, 0x0

    iput v0, p0, Lcom/gemini/chat/LiveActivity;->reconnects:I

    .line 669
    invoke-direct {p0, v1}, Lcom/gemini/chat/LiveActivity;->connect(Ljava/lang/String;)V

    .line 692
    :cond_0
    :goto_0
    return-void

    .line 672
    :cond_1
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->connected:Z

    if-eqz v0, :cond_0

    .line 673
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v0, :cond_2

    .line 674
    invoke-direct {p0, v2}, Lcom/gemini/chat/LiveActivity;->stopTalking(Z)V

    goto :goto_0

    .line 677
    :cond_2
    new-instance v0, Lcom/gemini/chat/LiveActivity$Mic;

    invoke-direct {v0, p0}, Lcom/gemini/chat/LiveActivity$Mic;-><init>(Lcom/gemini/chat/LiveActivity;)V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->mic:Lcom/gemini/chat/LiveActivity$Mic;

    .line 678
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->mic:Lcom/gemini/chat/LiveActivity$Mic;

    iget-boolean v0, v0, Lcom/gemini/chat/LiveActivity$Mic;->ok:Z

    if-nez v0, :cond_3

    .line 679
    const-string v0, "Microphone not available."

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 680
    iput-object v1, p0, Lcom/gemini/chat/LiveActivity;->mic:Lcom/gemini/chat/LiveActivity$Mic;

    goto :goto_0

    .line 683
    :cond_3
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->bargeIn()V

    .line 684
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity;->micOpenAfter:J

    .line 685
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->openTranscriber()V

    .line 686
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->typedPrefix:Ljava/lang/String;

    .line 687
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->handsFree:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->activityStart()V

    .line 688
    :cond_4
    iput-boolean v2, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    .line 689
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->mic:Lcom/gemini/chat/LiveActivity$Mic;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Mic;->start()V

    .line 690
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateButtons()V

    .line 691
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->idleStatus()V

    goto :goto_0
.end method

.method private openTranscriber()V
    .locals 3

    .prologue
    .line 362
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->liveText:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->destroyed:Z

    if-eqz v0, :cond_1

    .line 367
    :cond_0
    :goto_0
    return-void

    .line 363
    :cond_1
    new-instance v0, Lcom/gemini/chat/LiveActivity$Transcriber;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/gemini/chat/LiveActivity$Transcriber;-><init>(Lcom/gemini/chat/LiveActivity;Lcom/gemini/chat/LiveActivity$1;)V

    .line 364
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->apiKey()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Lcom/gemini/chat/LiveSession;->transcriber(Ljava/lang/String;ZLcom/gemini/chat/LiveSession$Listener;)Lcom/gemini/chat/LiveSession;

    move-result-object v1

    iput-object v1, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    .line 365
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    iput-object v1, v0, Lcom/gemini/chat/LiveActivity$Transcriber;->self:Lcom/gemini/chat/LiveSession;

    .line 366
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->start()V

    goto :goto_0
.end method

.method private pendingIsEmpty()Z
    .locals 2

    .prologue
    .line 569
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->pendingText:Ljava/util/LinkedList;

    monitor-enter v1

    .line 570
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->pendingText:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    monitor-exit v1

    return v0

    .line 571
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private resume()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 350
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    .line 351
    if-eqz v1, :cond_0

    iget-object v0, v1, Lcom/gemini/chat/LiveSession;->lastHandle:Ljava/lang/String;

    .line 352
    :goto_0
    if-nez v0, :cond_1

    .line 359
    :goto_1
    return-void

    .line 351
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 353
    :cond_1
    iget v2, p0, Lcom/gemini/chat/LiveActivity;->sessionGen:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/gemini/chat/LiveActivity;->sessionGen:I

    .line 354
    iget-boolean v2, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v2, :cond_2

    invoke-direct {p0, v3}, Lcom/gemini/chat/LiveActivity;->stopTalking(Z)V

    .line 355
    :cond_2
    iput-boolean v3, p0, Lcom/gemini/chat/LiveActivity;->connected:Z

    .line 356
    invoke-virtual {v1}, Lcom/gemini/chat/LiveSession;->stop()V

    .line 357
    iget v1, p0, Lcom/gemini/chat/LiveActivity;->reconnects:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/gemini/chat/LiveActivity;->reconnects:I

    .line 358
    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->connect(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private save(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .prologue
    const/16 v4, 0x19

    .line 627
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 628
    const/16 v0, 0xa

    const/16 v1, 0x20

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 629
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v4, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 630
    :cond_0
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->db:Lcom/gemini/chat/DatabaseHelper;

    invoke-virtual {v1, v0}, Lcom/gemini/chat/DatabaseHelper;->createChat(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    .line 631
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateTitle()V

    .line 633
    :cond_1
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->db:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    const-string v0, "model"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v6, p0, Lcom/gemini/chat/LiveActivity;->model:Ljava/lang/String;

    :goto_0
    move-object v4, p1

    move-object v5, p2

    invoke-virtual/range {v1 .. v6}, Lcom/gemini/chat/DatabaseHelper;->addMessage(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)J

    .line 634
    return-void

    .line 633
    :cond_2
    const/4 v6, 0x0

    goto :goto_0
.end method

.method private scrollDown()V
    .locals 2

    .prologue
    .line 262
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->scroll:Landroid/widget/ScrollView;

    new-instance v1, Lcom/gemini/chat/LiveActivity$4;

    invoke-direct {v1, p0}, Lcom/gemini/chat/LiveActivity$4;-><init>(Lcom/gemini/chat/LiveActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 267
    return-void
.end method

.method private sendTyped()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 641
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 642
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->connected:Z

    if-nez v0, :cond_1

    .line 655
    :cond_0
    :goto_0
    return-void

    .line 643
    :cond_1
    const-string v0, "input_method"

    invoke-virtual {p0, v0}, Lcom/gemini/chat/LiveActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 644
    if-eqz v0, :cond_2

    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v0, v2, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 645
    :cond_2
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v0, :cond_3

    invoke-direct {p0, v3}, Lcom/gemini/chat/LiveActivity;->stopTalking(Z)V

    .line 646
    :cond_3
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->heard:Ljava/lang/StringBuffer;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 647
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->spokenFinal:Ljava/lang/StringBuffer;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 648
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->spokenInterim:Ljava/lang/String;

    .line 649
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->typedPrefix:Ljava/lang/String;

    .line 650
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->bargeIn()V

    .line 651
    const-string v0, "user"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v2, v1}, Lcom/gemini/chat/LiveActivity;->addTurnView(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/TextView;

    .line 652
    const-string v0, "user"

    invoke-direct {p0, v0, v1}, Lcom/gemini/chat/LiveActivity;->save(Ljava/lang/String;Ljava/lang/String;)V

    .line 653
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    const-string v2, ""

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 654
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0, v1}, Lcom/gemini/chat/LiveSession;->sendText(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private setStatus(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 227
    :cond_0
    return-void
.end method

.method private showModel()V
    .locals 8

    .prologue
    .line 575
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->modelShown:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 576
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 580
    :goto_0
    return-void

    .line 577
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->modelView:Landroid/widget/TextView;

    if-nez v0, :cond_1

    const-string v0, "model"

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->model:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v3}, Lcom/gemini/chat/LiveActivity;->addTurnView(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->modelView:Landroid/widget/TextView;

    .line 579
    :goto_1
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->scrollDown()V

    goto :goto_0

    .line 578
    :cond_1
    iget-object v7, p0, Lcom/gemini/chat/LiveActivity;->modelView:Landroid/widget/TextView;

    const-string v1, "model"

    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->model:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v6, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lcom/gemini/chat/MessageFormatter;->format(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/ArrayList;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method private stopTalking(Z)V
    .locals 1

    .prologue
    .line 696
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->mic:Lcom/gemini/chat/LiveActivity$Mic;

    if-eqz v0, :cond_0

    .line 697
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->mic:Lcom/gemini/chat/LiveActivity$Mic;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Mic;->quit()V

    .line 698
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->mic:Lcom/gemini/chat/LiveActivity$Mic;

    .line 700
    :cond_0
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    if-eqz v0, :cond_1

    .line 701
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->handsFree:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->audioStreamEnd()V

    .line 704
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->audioStreamEnd()V

    .line 705
    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    .line 706
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateButtons()V

    .line 707
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->idleStatus()V

    .line 708
    return-void

    .line 702
    :cond_3
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->activityEnd()V

    goto :goto_0
.end method

.method private updateBox()V
    .locals 3

    .prologue
    .line 529
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->liveText:Z

    if-nez v0, :cond_1

    .line 537
    :cond_0
    :goto_0
    return-void

    .line 530
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->spokenFinal:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->spokenInterim:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 531
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->heard:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 532
    :cond_2
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->typedPrefix:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->typedPrefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 533
    :goto_1
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 534
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 535
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setSelection(I)V

    goto :goto_0

    .line 532
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->typedPrefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method private updateButtons()V
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 230
    iget-boolean v1, p0, Lcom/gemini/chat/LiveActivity;->connected:Z

    .line 231
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnSend:Landroid/widget/Button;

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 232
    if-nez v1, :cond_1

    .line 233
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    const-string v2, "Reconnect"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 234
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    if-nez v2, :cond_0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 242
    :goto_1
    return-void

    .line 234
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 235
    :cond_1
    iget-boolean v1, p0, Lcom/gemini/chat/LiveActivity;->handsFree:Z

    if-eqz v1, :cond_3

    .line 236
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    iget-boolean v1, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v1, :cond_2

    const-string v1, "Mic: on (tap to mute)"

    :goto_2
    invoke-virtual {v2, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 237
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_1

    .line 236
    :cond_2
    const-string v1, "Mic: off (tap to talk)"

    goto :goto_2

    .line 239
    :cond_3
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    iget-boolean v1, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v1, :cond_4

    const-string v1, "Send speech"

    :goto_3
    invoke-virtual {v2, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 240
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_1

    .line 239
    :cond_4
    const-string v1, "Talk"

    goto :goto_3
.end method

.method private updateTitle()V
    .locals 6

    .prologue
    .line 222
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Live: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    const-wide/16 v4, -0x1

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    const-string v0, "New chat"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/gemini/chat/LiveActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 223
    return-void

    .line 222
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->db:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    invoke-virtual {v0, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->getChatTitle(J)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method static voiceName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 93
    const-string v0, " -- "

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 94
    if-lez v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method


# virtual methods
.method public finish()V
    .locals 4

    .prologue
    const/4 v0, 0x1

    .line 210
    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->ending:Z

    .line 212
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->finishUserTurn()V

    .line 213
    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->finishModelTurn(Z)V

    .line 214
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 215
    const-string v1, "chat_id"

    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 216
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/gemini/chat/LiveActivity;->setResult(ILandroid/content/Intent;)V

    .line 217
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 218
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 11

    .prologue
    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v9, -0x1

    const/high16 v8, 0x40000000    # 2.0f

    const/4 v7, -0x2

    const/4 v6, 0x0

    .line 107
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 108
    invoke-static {p0}, Lcom/gemini/chat/MessageFormatter;->applyPrefs(Landroid/content/Context;)V

    .line 109
    new-instance v0, Lcom/gemini/chat/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/gemini/chat/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->db:Lcom/gemini/chat/DatabaseHelper;

    .line 110
    invoke-virtual {p0}, Lcom/gemini/chat/LiveActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "chat_id"

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    .line 111
    const-string v0, "GeminiPrefs"

    invoke-virtual {p0, v0, v6}, Lcom/gemini/chat/LiveActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 112
    const-string v1, "live_model"

    const-string v2, "gemini-3.8-live"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gemini/chat/LiveActivity;->model:Ljava/lang/String;

    .line 113
    const-string v1, "live_voice"

    const-string v2, "Kore"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gemini/chat/LiveActivity;->voice:Ljava/lang/String;

    .line 114
    const-string v1, "live_hands_free"

    invoke-interface {v0, v1, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/gemini/chat/LiveActivity;->handsFree:Z

    .line 115
    const-string v1, "live_muted"

    invoke-interface {v0, v1, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/gemini/chat/LiveActivity;->muted:Z

    .line 116
    const-string v1, "live_text"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->liveText:Z

    .line 117
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateTitle()V

    .line 118
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/gemini/chat/LiveActivity;->setVolumeControlStream(I)V

    .line 119
    invoke-virtual {p0}, Lcom/gemini/chat/LiveActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 120
    invoke-virtual {p0}, Lcom/gemini/chat/LiveActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x12

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 123
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 124
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 126
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/gemini/chat/LiveActivity;->status:Landroid/widget/TextView;

    .line 127
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->status:Landroid/widget/TextView;

    const/high16 v2, 0x41500000    # 13.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 128
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->status:Landroid/widget/TextView;

    const/high16 v2, 0x41200000    # 10.0f

    invoke-direct {p0, v2}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v2

    const/high16 v3, 0x40800000    # 4.0f

    invoke-direct {p0, v3}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v3

    const/high16 v4, 0x41200000    # 10.0f

    invoke-direct {p0, v4}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v4

    const/high16 v5, 0x40800000    # 4.0f

    invoke-direct {p0, v5}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 129
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->status:Landroid/widget/TextView;

    const v2, -0x655f5a

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 130
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->status:Landroid/widget/TextView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 133
    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/gemini/chat/LiveActivity;->scroll:Landroid/widget/ScrollView;

    .line 134
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/gemini/chat/LiveActivity;->turns:Landroid/widget/LinearLayout;

    .line 135
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->turns:Landroid/widget/LinearLayout;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 136
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->scroll:Landroid/widget/ScrollView;

    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->turns:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v9, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 138
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->scroll:Landroid/widget/ScrollView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v9, v6, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 140
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 141
    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 142
    invoke-direct {p0, v8}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v2

    invoke-direct {p0, v8}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v3

    invoke-direct {p0, v8}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v4

    invoke-virtual {v1, v2, v3, v4, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 143
    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    .line 144
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    const-string v3, "Type or talk..."

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 145
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 146
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v6, v7, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 147
    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnSend:Landroid/widget/Button;

    .line 148
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnSend:Landroid/widget/Button;

    const-string v3, "Send"

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 149
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnSend:Landroid/widget/Button;

    new-instance v3, Lcom/gemini/chat/LiveActivity$1;

    invoke-direct {v3, p0}, Lcom/gemini/chat/LiveActivity$1;-><init>(Lcom/gemini/chat/LiveActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 154
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnSend:Landroid/widget/Button;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 156
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 159
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 160
    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 161
    invoke-direct {p0, v8}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v2

    invoke-direct {p0, v8}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v3

    invoke-direct {p0, v8}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v4

    invoke-virtual {v1, v2, v6, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 162
    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    .line 163
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    new-instance v3, Lcom/gemini/chat/LiveActivity$2;

    invoke-direct {v3, p0}, Lcom/gemini/chat/LiveActivity$2;-><init>(Lcom/gemini/chat/LiveActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 168
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 169
    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 170
    const-string v3, "End"

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 171
    new-instance v3, Lcom/gemini/chat/LiveActivity$3;

    invoke-direct {v3, p0}, Lcom/gemini/chat/LiveActivity$3;-><init>(Lcom/gemini/chat/LiveActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 176
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v6, v7, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 177
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 180
    invoke-virtual {p0, v0}, Lcom/gemini/chat/LiveActivity;->setContentView(Landroid/view/View;)V

    .line 181
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->loadExisting()V

    .line 182
    new-instance v0, Lcom/gemini/chat/LiveActivity$Player;

    iget-boolean v1, p0, Lcom/gemini/chat/LiveActivity;->muted:Z

    invoke-direct {v0, p0, v1}, Lcom/gemini/chat/LiveActivity$Player;-><init>(Lcom/gemini/chat/LiveActivity;Z)V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->player:Lcom/gemini/chat/LiveActivity$Player;

    .line 183
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->player:Lcom/gemini/chat/LiveActivity$Player;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->start()V

    .line 184
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->connect(Ljava/lang/String;)V

    .line 185
    return-void
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 195
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 196
    iput-boolean v2, p0, Lcom/gemini/chat/LiveActivity;->destroyed:Z

    .line 197
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 198
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->stopTalking(Z)V

    .line 199
    iget v0, p0, Lcom/gemini/chat/LiveActivity;->sessionGen:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/gemini/chat/LiveActivity;->sessionGen:I

    .line 200
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->stop()V

    .line 201
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->stop()V

    .line 202
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->player:Lcom/gemini/chat/LiveActivity$Player;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->quit()V

    .line 203
    invoke-direct {p0, v2}, Lcom/gemini/chat/LiveActivity;->finishModelTurn(Z)V

    .line 204
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->finishUserTurn()V

    .line 205
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->db:Lcom/gemini/chat/DatabaseHelper;

    invoke-virtual {v0}, Lcom/gemini/chat/DatabaseHelper;->close()V

    .line 206
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 189
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 190
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->stopTalking(Z)V

    .line 191
    :cond_0
    return-void
.end method
