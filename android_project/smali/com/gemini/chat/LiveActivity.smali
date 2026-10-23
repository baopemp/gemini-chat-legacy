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

.field private userRow:J

.field private userText:Ljava/lang/String;

.field private userTs:J

.field private userView:Landroid/widget/TextView;

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
    .locals 2

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

    .line 85
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity;->userRow:J

    .line 90
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->modelShown:Ljava/lang/StringBuffer;

    .line 91
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->pendingText:Ljava/util/LinkedList;

    .line 562
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
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->lateOrBox()V

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

.method static synthetic access$3500(Lcom/gemini/chat/LiveActivity;)J
    .locals 2

    .prologue
    .line 36
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity;->micOpenAfter:J

    return-wide v0
.end method

.method static synthetic access$3502(Lcom/gemini/chat/LiveActivity;J)J
    .locals 1

    .prologue
    .line 36
    iput-wide p1, p0, Lcom/gemini/chat/LiveActivity;->micOpenAfter:J

    return-wide p1
.end method

.method static synthetic access$3600(Lcom/gemini/chat/LiveActivity;)J
    .locals 2

    .prologue
    .line 36
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity;->userRow:J

    return-wide v0
.end method

.method static synthetic access$3700(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->newUserTurn()V

    return-void
.end method

.method static synthetic access$3800(Lcom/gemini/chat/LiveActivity;)Z
    .locals 1

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->muted:Z

    return v0
.end method

.method static synthetic access$3900(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->resume()V

    return-void
.end method

.method static synthetic access$4000(Lcom/gemini/chat/LiveActivity;)J
    .locals 2

    .prologue
    .line 36
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    return-wide v0
.end method

.method static synthetic access$4100(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateTitle()V

    return-void
.end method

.method static synthetic access$4200(Lcom/gemini/chat/LiveActivity;)Z
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
    .line 261
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 262
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

    .line 263
    invoke-static {v7, p1}, Lcom/gemini/chat/MessageFormatter;->styleView(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 264
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->turns:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 265
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->scrollDown()V

    .line 266
    return-object v7
.end method

.method private apiKey()Ljava/lang/String;
    .locals 3

    .prologue
    .line 332
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
    .line 699
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->modelTurnActive:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->player:Lcom/gemini/chat/LiveActivity$Player;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->pendingIsEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 700
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->player:Lcom/gemini/chat/LiveActivity$Player;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->flush()V

    .line 701
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->finishModelTurn(Z)V

    .line 702
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->modelTurnActive:Z

    .line 704
    :cond_1
    return-void
.end method

.method private connect(Ljava/lang/String;)V
    .locals 9

    .prologue
    .line 337
    const-string v0, "GeminiPrefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/gemini/chat/LiveActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 338
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->apiKey()Ljava/lang/String;

    move-result-object v1

    .line 339
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 340
    const-string v0, "Please go to Settings to set API Key"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 341
    const-string v0, "No API key"

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->setStatus(Ljava/lang/String;)V

    .line 342
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateButtons()V

    .line 354
    :goto_0
    return-void

    .line 345
    :cond_0
    const-string v0, "system_instruction"

    const-string v2, ""

    invoke-interface {v7, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/gemini/chat/TimeGrounding;->apply(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 346
    iget v0, p0, Lcom/gemini/chat/LiveActivity;->sessionGen:I

    add-int/lit8 v8, v0, 0x1

    iput v8, p0, Lcom/gemini/chat/LiveActivity;->sessionGen:I

    .line 347
    new-instance v0, Lcom/gemini/chat/LiveSession;

    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->model:Ljava/lang/String;

    iget-object v3, p0, Lcom/gemini/chat/LiveActivity;->voice:Ljava/lang/String;

    iget-boolean v5, p0, Lcom/gemini/chat/LiveActivity;->handsFree:Z

    new-instance v6, Lcom/gemini/chat/LiveActivity$Main;

    invoke-direct {v6, p0, v8}, Lcom/gemini/chat/LiveActivity$Main;-><init>(Lcom/gemini/chat/LiveActivity;I)V

    invoke-direct/range {v0 .. v6}, Lcom/gemini/chat/LiveSession;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/gemini/chat/LiveSession$Listener;)V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    .line 348
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

    .line 349
    :cond_1
    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    iput-object p1, v0, Lcom/gemini/chat/LiveSession;->resumeHandle:Ljava/lang/String;

    .line 351
    :goto_1
    if-eqz p1, :cond_3

    const-string v0, "Reconnecting..."

    :goto_2
    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->setStatus(Ljava/lang/String;)V

    .line 352
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateButtons()V

    .line 353
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->start()V

    goto :goto_0

    .line 350
    :cond_2
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->history()[[Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/gemini/chat/LiveSession;->history:[[Ljava/lang/String;

    goto :goto_1

    .line 351
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
    .line 106
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

    .line 611
    if-eqz p1, :cond_1

    .line 612
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->pendingText:Ljava/util/LinkedList;

    monitor-enter v1

    .line 613
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

    .line 614
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

    .line 615
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->showModel()V

    .line 617
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->modelShown:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 618
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 619
    const-string v1, "model"

    invoke-direct {p0, v1, v0}, Lcom/gemini/chat/LiveActivity;->save(Ljava/lang/String;Ljava/lang/String;)J

    .line 620
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->destroyed:Z

    if-nez v0, :cond_2

    .line 622
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->db:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    new-instance v1, Lcom/gemini/chat/LiveActivity$6;

    invoke-direct {v1, p0}, Lcom/gemini/chat/LiveActivity$6;-><init>(Lcom/gemini/chat/LiveActivity;)V

    invoke-static {p0, v0, v2, v3, v1}, Lcom/gemini/chat/AutoNamer;->maybeStart(Landroid/content/Context;Lcom/gemini/chat/DatabaseHelper;JLcom/gemini/chat/AutoNamer$Callback;)V

    .line 629
    :cond_2
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->modelShown:Ljava/lang/StringBuffer;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 630
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->modelView:Landroid/widget/TextView;

    .line 631
    iput-boolean v4, p0, Lcom/gemini/chat/LiveActivity;->modelTurnDone:Z

    .line 632
    return-void
.end method

.method private finishUserTurn()V
    .locals 8

    .prologue
    const/4 v2, 0x0

    .line 639
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->spokenText()Ljava/lang/String;

    move-result-object v3

    .line 640
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 656
    :cond_0
    :goto_0
    return-void

    .line 641
    :cond_1
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity;->userRow:J

    const-wide/16 v4, -0x1

    cmp-long v0, v0, v4

    if-nez v0, :cond_3

    .line 642
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity;->userTs:J

    .line 643
    iput-object v3, p0, Lcom/gemini/chat/LiveActivity;->userText:Ljava/lang/String;

    .line 644
    const-string v0, "user"

    invoke-direct {p0, v0, v2, v3}, Lcom/gemini/chat/LiveActivity;->addTurnView(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->userView:Landroid/widget/TextView;

    .line 645
    const-string v0, "user"

    invoke-direct {p0, v0, v3}, Lcom/gemini/chat/LiveActivity;->save(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity;->userRow:J

    .line 646
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->liveText:Z

    if-eqz v0, :cond_2

    .line 647
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->typedPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 648
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 650
    :cond_2
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->typedPrefix:Ljava/lang/String;

    goto :goto_0

    .line 651
    :cond_3
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->userText:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 652
    iput-object v3, p0, Lcom/gemini/chat/LiveActivity;->userText:Ljava/lang/String;

    .line 653
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->userView:Landroid/widget/TextView;

    if-eqz v0, :cond_4

    iget-object v7, p0, Lcom/gemini/chat/LiveActivity;->userView:Landroid/widget/TextView;

    const-string v1, "user"

    iget-wide v4, p0, Lcom/gemini/chat/LiveActivity;->userTs:J

    move-object v0, p0

    move-object v6, v2

    invoke-static/range {v0 .. v6}, Lcom/gemini/chat/MessageFormatter;->format(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/ArrayList;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 654
    :cond_4
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->db:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v4, p0, Lcom/gemini/chat/LiveActivity;->userRow:J

    invoke-virtual {v0, v4, v5, v3}, Lcom/gemini/chat/DatabaseHelper;->updateMessage(JLjava/lang/String;)V

    goto :goto_0
.end method

.method private history()[[Ljava/lang/String;
    .locals 11

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v10, 0x1

    .line 301
    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    move-object v0, v1

    .line 324
    :goto_0
    return-object v0

    .line 302
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 303
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->db:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v6, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    invoke-virtual {v2, v6, v7}, Lcom/gemini/chat/DatabaseHelper;->getMessages(J)Landroid/database/Cursor;

    move-result-object v2

    .line 304
    if-nez v2, :cond_1

    move-object v0, v1

    goto :goto_0

    .line 306
    :cond_1
    :try_start_0
    const-string v3, "role"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    const-string v5, "content"

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    .line 307
    :cond_2
    :goto_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 308
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 309
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

    .line 310
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

    .line 314
    :catchall_0
    move-exception v0

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 315
    throw v0

    .line 314
    :cond_4
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 316
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v0

    .line 317
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

    .line 318
    add-int/lit8 v0, v2, -0x1

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    aget-object v0, v0, v10

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v0, v3

    .line 319
    add-int/lit8 v2, v2, -0x1

    move v3, v0

    goto :goto_2

    .line 321
    :cond_5
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v2, v0, :cond_6

    move-object v0, v1

    goto/16 :goto_0

    .line 322
    :cond_6
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v2

    new-array v3, v0, [[Ljava/lang/String;

    move v1, v2

    .line 323
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

    .line 324
    goto/16 :goto_0
.end method

.method private idleStatus()V
    .locals 2

    .prologue
    .line 253
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->connected:Z

    if-nez v0, :cond_0

    .line 258
    :goto_0
    return-void

    .line 255
    :cond_0
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->handsFree:Z

    if-eqz v0, :cond_2

    const-string v0, "Listening (hands-free)..."

    .line 257
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

    .line 255
    :cond_2
    const-string v0, "Listening... tap \"Send speech\" when done"

    goto :goto_1

    .line 256
    :cond_3
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->handsFree:Z

    if-eqz v0, :cond_4

    const-string v0, "Tap the mic button and speak, or type"

    goto :goto_1

    :cond_4
    const-string v0, "Tap Talk and speak, or type"

    goto :goto_1
.end method

.method private lateOrBox()V
    .locals 4

    .prologue
    .line 546
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity;->userRow:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->finishUserTurn()V

    .line 548
    :goto_0
    return-void

    .line 547
    :cond_0
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateBox()V

    goto :goto_0
.end method

.method private loadExisting()V
    .locals 13

    .prologue
    .line 279
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 297
    :cond_0
    :goto_0
    return-void

    .line 280
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->db:Lcom/gemini/chat/DatabaseHelper;

    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    invoke-virtual {v0, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->getMessages(J)Landroid/database/Cursor;

    move-result-object v7

    .line 281
    if-eqz v7, :cond_0

    .line 283
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

    .line 284
    const-string v0, "timestamp"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    .line 285
    :cond_2
    :goto_1
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 286
    invoke-interface {v7, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 287
    const-string v0, "user"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 288
    :cond_3
    new-instance v12, Landroid/widget/TextView;

    invoke-direct {v12, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 289
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

    .line 290
    invoke-static {v12, v1}, Lcom/gemini/chat/MessageFormatter;->styleView(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 291
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->turns:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 294
    :catchall_0
    move-exception v0

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 295
    throw v0

    .line 294
    :cond_4
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 296
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->scrollDown()V

    goto :goto_0
.end method

.method private micMuted()Z
    .locals 4

    .prologue
    .line 753
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

.method private newUserTurn()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 660
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->heard:Ljava/lang/StringBuffer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 661
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->spokenFinal:Ljava/lang/StringBuffer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 662
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->spokenInterim:Ljava/lang/String;

    .line 663
    const-string v0, ""

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->typedPrefix:Ljava/lang/String;

    .line 664
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity;->userRow:J

    .line 665
    iput-object v2, p0, Lcom/gemini/chat/LiveActivity;->userView:Landroid/widget/TextView;

    .line 666
    iput-object v2, p0, Lcom/gemini/chat/LiveActivity;->userText:Ljava/lang/String;

    .line 667
    return-void
.end method

.method private onTalk()V
    .locals 5

    .prologue
    const/4 v1, 0x0

    const/4 v4, 0x1

    .line 707
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    if-nez v0, :cond_1

    .line 708
    const/4 v0, 0x0

    iput v0, p0, Lcom/gemini/chat/LiveActivity;->reconnects:I

    .line 709
    invoke-direct {p0, v1}, Lcom/gemini/chat/LiveActivity;->connect(Ljava/lang/String;)V

    .line 733
    :cond_0
    :goto_0
    return-void

    .line 712
    :cond_1
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->connected:Z

    if-eqz v0, :cond_0

    .line 713
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v0, :cond_2

    .line 714
    invoke-direct {p0, v4}, Lcom/gemini/chat/LiveActivity;->stopTalking(Z)V

    goto :goto_0

    .line 717
    :cond_2
    new-instance v0, Lcom/gemini/chat/LiveActivity$Mic;

    invoke-direct {v0, p0}, Lcom/gemini/chat/LiveActivity$Mic;-><init>(Lcom/gemini/chat/LiveActivity;)V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->mic:Lcom/gemini/chat/LiveActivity$Mic;

    .line 718
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->mic:Lcom/gemini/chat/LiveActivity$Mic;

    iget-boolean v0, v0, Lcom/gemini/chat/LiveActivity$Mic;->ok:Z

    if-nez v0, :cond_3

    .line 719
    const-string v0, "Microphone not available."

    invoke-static {p0, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 720
    iput-object v1, p0, Lcom/gemini/chat/LiveActivity;->mic:Lcom/gemini/chat/LiveActivity$Mic;

    goto :goto_0

    .line 723
    :cond_3
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->bargeIn()V

    .line 724
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity;->micOpenAfter:J

    .line 725
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->openTranscriber()V

    .line 726
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity;->userRow:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->newUserTurn()V

    .line 727
    :cond_4
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->spokenText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->typedPrefix:Ljava/lang/String;

    .line 728
    :cond_5
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->handsFree:Z

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->activityStart()V

    .line 729
    :cond_6
    iput-boolean v4, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    .line 730
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->mic:Lcom/gemini/chat/LiveActivity$Mic;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Mic;->start()V

    .line 731
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateButtons()V

    .line 732
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->idleStatus()V

    goto :goto_0
.end method

.method private openTranscriber()V
    .locals 3

    .prologue
    .line 370
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->liveText:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->destroyed:Z

    if-eqz v0, :cond_1

    .line 375
    :cond_0
    :goto_0
    return-void

    .line 371
    :cond_1
    new-instance v0, Lcom/gemini/chat/LiveActivity$Transcriber;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/gemini/chat/LiveActivity$Transcriber;-><init>(Lcom/gemini/chat/LiveActivity;Lcom/gemini/chat/LiveActivity$1;)V

    .line 372
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->apiKey()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Lcom/gemini/chat/LiveSession;->transcriber(Ljava/lang/String;ZLcom/gemini/chat/LiveSession$Listener;)Lcom/gemini/chat/LiveSession;

    move-result-object v1

    iput-object v1, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    .line 373
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    iput-object v1, v0, Lcom/gemini/chat/LiveActivity$Transcriber;->self:Lcom/gemini/chat/LiveSession;

    .line 374
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->start()V

    goto :goto_0
.end method

.method private pendingIsEmpty()Z
    .locals 2

    .prologue
    .line 596
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->pendingText:Ljava/util/LinkedList;

    monitor-enter v1

    .line 597
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->pendingText:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    monitor-exit v1

    return v0

    .line 598
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

    .line 358
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    .line 359
    if-eqz v1, :cond_0

    iget-object v0, v1, Lcom/gemini/chat/LiveSession;->lastHandle:Ljava/lang/String;

    .line 360
    :goto_0
    if-nez v0, :cond_1

    .line 367
    :goto_1
    return-void

    .line 359
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 361
    :cond_1
    iget v2, p0, Lcom/gemini/chat/LiveActivity;->sessionGen:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/gemini/chat/LiveActivity;->sessionGen:I

    .line 362
    iget-boolean v2, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v2, :cond_2

    invoke-direct {p0, v3}, Lcom/gemini/chat/LiveActivity;->stopTalking(Z)V

    .line 363
    :cond_2
    iput-boolean v3, p0, Lcom/gemini/chat/LiveActivity;->connected:Z

    .line 364
    invoke-virtual {v1}, Lcom/gemini/chat/LiveSession;->stop()V

    .line 365
    iget v1, p0, Lcom/gemini/chat/LiveActivity;->reconnects:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/gemini/chat/LiveActivity;->reconnects:I

    .line 366
    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->connect(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private save(Ljava/lang/String;Ljava/lang/String;)J
    .locals 7

    .prologue
    const/16 v4, 0x19

    .line 670
    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 671
    const/16 v0, 0xa

    const/16 v1, 0x20

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 672
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

    .line 673
    :cond_0
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->db:Lcom/gemini/chat/DatabaseHelper;

    invoke-virtual {v1, v0}, Lcom/gemini/chat/DatabaseHelper;->createChat(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    .line 674
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateTitle()V

    .line 676
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

    move-result-wide v0

    return-wide v0

    :cond_2
    const/4 v6, 0x0

    goto :goto_0
.end method

.method private scrollDown()V
    .locals 2

    .prologue
    .line 270
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->scroll:Landroid/widget/ScrollView;

    new-instance v1, Lcom/gemini/chat/LiveActivity$4;

    invoke-direct {v1, p0}, Lcom/gemini/chat/LiveActivity$4;-><init>(Lcom/gemini/chat/LiveActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 275
    return-void
.end method

.method private sendTyped()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 684
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 685
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->connected:Z

    if-nez v0, :cond_1

    .line 695
    :cond_0
    :goto_0
    return-void

    .line 686
    :cond_1
    const-string v0, "input_method"

    invoke-virtual {p0, v0}, Lcom/gemini/chat/LiveActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 687
    if-eqz v0, :cond_2

    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v0, v2, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 688
    :cond_2
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v0, :cond_3

    invoke-direct {p0, v3}, Lcom/gemini/chat/LiveActivity;->stopTalking(Z)V

    .line 689
    :cond_3
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->newUserTurn()V

    .line 690
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->bargeIn()V

    .line 691
    const-string v0, "user"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v2, v1}, Lcom/gemini/chat/LiveActivity;->addTurnView(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/TextView;

    .line 692
    const-string v0, "user"

    invoke-direct {p0, v0, v1}, Lcom/gemini/chat/LiveActivity;->save(Ljava/lang/String;Ljava/lang/String;)J

    .line 693
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    const-string v2, ""

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 694
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0, v1}, Lcom/gemini/chat/LiveSession;->sendText(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private setStatus(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 235
    :cond_0
    return-void
.end method

.method private showModel()V
    .locals 8

    .prologue
    .line 602
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->modelShown:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 603
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 607
    :goto_0
    return-void

    .line 604
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->modelView:Landroid/widget/TextView;

    if-nez v0, :cond_1

    const-string v0, "model"

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->model:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v3}, Lcom/gemini/chat/LiveActivity;->addTurnView(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->modelView:Landroid/widget/TextView;

    .line 606
    :goto_1
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->scrollDown()V

    goto :goto_0

    .line 605
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

.method private spokenText()Ljava/lang/String;
    .locals 2

    .prologue
    .line 540
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

    .line 541
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->heard:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private stopTalking(Z)V
    .locals 1

    .prologue
    .line 737
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->mic:Lcom/gemini/chat/LiveActivity$Mic;

    if-eqz v0, :cond_0

    .line 738
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->mic:Lcom/gemini/chat/LiveActivity$Mic;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Mic;->quit()V

    .line 739
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->mic:Lcom/gemini/chat/LiveActivity$Mic;

    .line 741
    :cond_0
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    if-eqz v0, :cond_1

    .line 742
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->handsFree:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->audioStreamEnd()V

    .line 745
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->audioStreamEnd()V

    .line 746
    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    .line 747
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateButtons()V

    .line 748
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->idleStatus()V

    .line 749
    return-void

    .line 743
    :cond_3
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->activityEnd()V

    goto :goto_0
.end method

.method private updateBox()V
    .locals 4

    .prologue
    .line 552
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->liveText:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/gemini/chat/LiveActivity;->userRow:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 559
    :cond_0
    :goto_0
    return-void

    .line 553
    :cond_1
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->spokenText()Ljava/lang/String;

    move-result-object v0

    .line 554
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->typedPrefix:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

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

    .line 555
    :goto_1
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 556
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 557
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setSelection(I)V

    goto :goto_0

    .line 554
    :cond_2
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

    .line 238
    iget-boolean v1, p0, Lcom/gemini/chat/LiveActivity;->connected:Z

    .line 239
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnSend:Landroid/widget/Button;

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 240
    if-nez v1, :cond_1

    .line 241
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    const-string v2, "Reconnect"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 242
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    if-nez v2, :cond_0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 250
    :goto_1
    return-void

    .line 242
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 243
    :cond_1
    iget-boolean v1, p0, Lcom/gemini/chat/LiveActivity;->handsFree:Z

    if-eqz v1, :cond_3

    .line 244
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    iget-boolean v1, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v1, :cond_2

    const-string v1, "Mic: on (tap to mute)"

    :goto_2
    invoke-virtual {v2, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 245
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_1

    .line 244
    :cond_2
    const-string v1, "Mic: off (tap to talk)"

    goto :goto_2

    .line 247
    :cond_3
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    iget-boolean v1, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v1, :cond_4

    const-string v1, "Send speech"

    :goto_3
    invoke-virtual {v2, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 248
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_1

    .line 247
    :cond_4
    const-string v1, "Talk"

    goto :goto_3
.end method

.method private updateTitle()V
    .locals 6

    .prologue
    .line 230
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

    .line 231
    return-void

    .line 230
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
    .line 101
    const-string v0, " -- "

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 102
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

    .line 218
    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->ending:Z

    .line 220
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->finishUserTurn()V

    .line 221
    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->finishModelTurn(Z)V

    .line 222
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 223
    const-string v1, "chat_id"

    iget-wide v2, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 224
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/gemini/chat/LiveActivity;->setResult(ILandroid/content/Intent;)V

    .line 225
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 226
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

    .line 115
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 116
    invoke-static {p0}, Lcom/gemini/chat/MessageFormatter;->applyPrefs(Landroid/content/Context;)V

    .line 117
    new-instance v0, Lcom/gemini/chat/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/gemini/chat/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->db:Lcom/gemini/chat/DatabaseHelper;

    .line 118
    invoke-virtual {p0}, Lcom/gemini/chat/LiveActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "chat_id"

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/gemini/chat/LiveActivity;->chatId:J

    .line 119
    const-string v0, "GeminiPrefs"

    invoke-virtual {p0, v0, v6}, Lcom/gemini/chat/LiveActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 120
    const-string v1, "live_model"

    const-string v2, "gemini-3.8-live"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gemini/chat/LiveActivity;->model:Ljava/lang/String;

    .line 121
    const-string v1, "live_voice"

    const-string v2, "Kore"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gemini/chat/LiveActivity;->voice:Ljava/lang/String;

    .line 122
    const-string v1, "live_hands_free"

    invoke-interface {v0, v1, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/gemini/chat/LiveActivity;->handsFree:Z

    .line 123
    const-string v1, "live_muted"

    invoke-interface {v0, v1, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/gemini/chat/LiveActivity;->muted:Z

    .line 124
    const-string v1, "live_text"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->liveText:Z

    .line 125
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->updateTitle()V

    .line 126
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/gemini/chat/LiveActivity;->setVolumeControlStream(I)V

    .line 127
    invoke-virtual {p0}, Lcom/gemini/chat/LiveActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 128
    invoke-virtual {p0}, Lcom/gemini/chat/LiveActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x12

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 131
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 132
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 134
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/gemini/chat/LiveActivity;->status:Landroid/widget/TextView;

    .line 135
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->status:Landroid/widget/TextView;

    const/high16 v2, 0x41500000    # 13.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 136
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

    .line 137
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->status:Landroid/widget/TextView;

    const v2, -0x655f5a

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 138
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->status:Landroid/widget/TextView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 141
    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/gemini/chat/LiveActivity;->scroll:Landroid/widget/ScrollView;

    .line 142
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/gemini/chat/LiveActivity;->turns:Landroid/widget/LinearLayout;

    .line 143
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->turns:Landroid/widget/LinearLayout;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 144
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->scroll:Landroid/widget/ScrollView;

    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->turns:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v9, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->scroll:Landroid/widget/ScrollView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v9, v6, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 148
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 149
    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 150
    invoke-direct {p0, v8}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v2

    invoke-direct {p0, v8}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v3

    invoke-direct {p0, v8}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v4

    invoke-virtual {v1, v2, v3, v4, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 151
    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    .line 152
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    const-string v3, "Type or talk..."

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 153
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 154
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->input:Landroid/widget/EditText;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v6, v7, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 155
    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnSend:Landroid/widget/Button;

    .line 156
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnSend:Landroid/widget/Button;

    const-string v3, "Send"

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 157
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnSend:Landroid/widget/Button;

    new-instance v3, Lcom/gemini/chat/LiveActivity$1;

    invoke-direct {v3, p0}, Lcom/gemini/chat/LiveActivity$1;-><init>(Lcom/gemini/chat/LiveActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnSend:Landroid/widget/Button;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 164
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 167
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 168
    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 169
    invoke-direct {p0, v8}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v2

    invoke-direct {p0, v8}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v3

    invoke-direct {p0, v8}, Lcom/gemini/chat/LiveActivity;->dp(F)I

    move-result v4

    invoke-virtual {v1, v2, v6, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 170
    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    .line 171
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    new-instance v3, Lcom/gemini/chat/LiveActivity$2;

    invoke-direct {v3, p0}, Lcom/gemini/chat/LiveActivity$2;-><init>(Lcom/gemini/chat/LiveActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 176
    iget-object v2, p0, Lcom/gemini/chat/LiveActivity;->btnTalk:Landroid/widget/Button;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 177
    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 178
    const-string v3, "End"

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 179
    new-instance v3, Lcom/gemini/chat/LiveActivity$3;

    invoke-direct {v3, p0}, Lcom/gemini/chat/LiveActivity$3;-><init>(Lcom/gemini/chat/LiveActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v6, v7, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 185
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 188
    invoke-virtual {p0, v0}, Lcom/gemini/chat/LiveActivity;->setContentView(Landroid/view/View;)V

    .line 189
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->loadExisting()V

    .line 190
    new-instance v0, Lcom/gemini/chat/LiveActivity$Player;

    iget-boolean v1, p0, Lcom/gemini/chat/LiveActivity;->muted:Z

    invoke-direct {v0, p0, v1}, Lcom/gemini/chat/LiveActivity$Player;-><init>(Lcom/gemini/chat/LiveActivity;Z)V

    iput-object v0, p0, Lcom/gemini/chat/LiveActivity;->player:Lcom/gemini/chat/LiveActivity$Player;

    .line 191
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->player:Lcom/gemini/chat/LiveActivity$Player;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->start()V

    .line 192
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->connect(Ljava/lang/String;)V

    .line 193
    return-void
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 203
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 204
    iput-boolean v2, p0, Lcom/gemini/chat/LiveActivity;->destroyed:Z

    .line 205
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 206
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->stopTalking(Z)V

    .line 207
    iget v0, p0, Lcom/gemini/chat/LiveActivity;->sessionGen:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/gemini/chat/LiveActivity;->sessionGen:I

    .line 208
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->session:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->stop()V

    .line 209
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->tr:Lcom/gemini/chat/LiveSession;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveSession;->stop()V

    .line 210
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->player:Lcom/gemini/chat/LiveActivity$Player;

    invoke-virtual {v0}, Lcom/gemini/chat/LiveActivity$Player;->quit()V

    .line 211
    invoke-direct {p0, v2}, Lcom/gemini/chat/LiveActivity;->finishModelTurn(Z)V

    .line 212
    invoke-direct {p0}, Lcom/gemini/chat/LiveActivity;->finishUserTurn()V

    .line 213
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity;->db:Lcom/gemini/chat/DatabaseHelper;

    invoke-virtual {v0}, Lcom/gemini/chat/DatabaseHelper;->close()V

    .line 214
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 197
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 198
    iget-boolean v0, p0, Lcom/gemini/chat/LiveActivity;->talking:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/gemini/chat/LiveActivity;->stopTalking(Z)V

    .line 199
    :cond_0
    return-void
.end method
