.class public Lcom/gemini/chat/FileExplorerActivity;
.super Landroid/app/Activity;
.source "FileExplorerActivity.java"


# instance fields
.field private adapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private currentDir:Ljava/io/File;

.field private files:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private isChat:Z

.field private isExport:Z

.field private items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private listView:Landroid/widget/ListView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/gemini/chat/FileExplorerActivity;)Z
    .locals 1

    .prologue
    .line 19
    iget-boolean v0, p0, Lcom/gemini/chat/FileExplorerActivity;->isChat:Z

    return v0
.end method

.method static synthetic access$100(Lcom/gemini/chat/FileExplorerActivity;)Ljava/io/File;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->currentDir:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$102(Lcom/gemini/chat/FileExplorerActivity;Ljava/io/File;)Ljava/io/File;
    .locals 0

    .prologue
    .line 19
    iput-object p1, p0, Lcom/gemini/chat/FileExplorerActivity;->currentDir:Ljava/io/File;

    return-object p1
.end method

.method static synthetic access$200(Lcom/gemini/chat/FileExplorerActivity;)Ljava/util/List;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->items:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$300(Lcom/gemini/chat/FileExplorerActivity;)V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/gemini/chat/FileExplorerActivity;->loadFiles()V

    return-void
.end method

.method static synthetic access$400(Lcom/gemini/chat/FileExplorerActivity;)Ljava/util/List;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->files:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$500(Lcom/gemini/chat/FileExplorerActivity;)Z
    .locals 1

    .prologue
    .line 19
    iget-boolean v0, p0, Lcom/gemini/chat/FileExplorerActivity;->isExport:Z

    return v0
.end method

.method private loadFiles()V
    .locals 7

    .prologue
    .line 108
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->items:Ljava/util/List;

    .line 109
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->files:Ljava/util/List;

    .line 111
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->currentDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->currentDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->items:Ljava/util/List;

    const-string v1, ".. [Up]"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->files:Ljava/util/List;

    iget-object v1, p0, Lcom/gemini/chat/FileExplorerActivity;->currentDir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->currentDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 117
    if-eqz v1, :cond_5

    .line 118
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 119
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 120
    array-length v4, v1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v4, :cond_3

    aget-object v5, v1, v0

    .line 121
    invoke-virtual {v5}, Ljava/io/File;->isHidden()Z

    move-result v6

    if-nez v6, :cond_1

    .line 122
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 123
    :cond_2
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 126
    :cond_3
    invoke-static {v2}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 127
    invoke-static {v3}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 128
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 129
    iget-object v2, p0, Lcom/gemini/chat/FileExplorerActivity;->items:Ljava/util/List;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    iget-object v2, p0, Lcom/gemini/chat/FileExplorerActivity;->files:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 132
    :cond_4
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 133
    iget-object v2, p0, Lcom/gemini/chat/FileExplorerActivity;->items:Ljava/util/List;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    iget-object v2, p0, Lcom/gemini/chat/FileExplorerActivity;->files:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 138
    :cond_5
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->currentDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/gemini/chat/FileExplorerActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 140
    new-instance v0, Landroid/widget/ArrayAdapter;

    const v1, 0x1090003

    iget-object v2, p0, Lcom/gemini/chat/FileExplorerActivity;->items:Ljava/util/List;

    invoke-direct {v0, p0, v1, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    iput-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->adapter:Landroid/widget/ArrayAdapter;

    .line 141
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->listView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/gemini/chat/FileExplorerActivity;->adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 142
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 30
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    invoke-virtual {p0}, Lcom/gemini/chat/FileExplorerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "isExport"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/gemini/chat/FileExplorerActivity;->isExport:Z

    .line 33
    invoke-virtual {p0}, Lcom/gemini/chat/FileExplorerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "isChat"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/gemini/chat/FileExplorerActivity;->isChat:Z

    .line 35
    new-instance v0, Ljava/io/File;

    const-string v1, "/sdcard"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 36
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 37
    iput-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->currentDir:Ljava/io/File;

    .line 42
    :goto_0
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 43
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 44
    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 46
    new-instance v1, Landroid/widget/ListView;

    invoke-direct {v1, p0}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/gemini/chat/FileExplorerActivity;->listView:Landroid/widget/ListView;

    .line 47
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 49
    iget-object v2, p0, Lcom/gemini/chat/FileExplorerActivity;->listView:Landroid/widget/ListView;

    invoke-virtual {v2, v1}, Landroid/widget/ListView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 52
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 53
    const v2, -0xcccccd

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 55
    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 56
    const-string v3, "Cancel"

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 57
    new-instance v3, Lcom/gemini/chat/FileExplorerActivity$1;

    invoke-direct {v3, p0}, Lcom/gemini/chat/FileExplorerActivity$1;-><init>(Lcom/gemini/chat/FileExplorerActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    iget-boolean v3, p0, Lcom/gemini/chat/FileExplorerActivity;->isExport:Z

    if-eqz v3, :cond_0

    .line 65
    new-instance v3, Landroid/widget/Button;

    invoke-direct {v3, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 66
    const-string v4, "Choose this folder"

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 67
    new-instance v4, Lcom/gemini/chat/FileExplorerActivity$2;

    invoke-direct {v4, p0}, Lcom/gemini/chat/FileExplorerActivity$2;-><init>(Lcom/gemini/chat/FileExplorerActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 76
    :cond_0
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 78
    iget-object v2, p0, Lcom/gemini/chat/FileExplorerActivity;->listView:Landroid/widget/ListView;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 79
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 80
    invoke-virtual {p0, v0}, Lcom/gemini/chat/FileExplorerActivity;->setContentView(Landroid/view/View;)V

    .line 82
    invoke-direct {p0}, Lcom/gemini/chat/FileExplorerActivity;->loadFiles()V

    .line 84
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->listView:Landroid/widget/ListView;

    new-instance v1, Lcom/gemini/chat/FileExplorerActivity$3;

    invoke-direct {v1, p0}, Lcom/gemini/chat/FileExplorerActivity$3;-><init>(Lcom/gemini/chat/FileExplorerActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 105
    return-void

    .line 39
    :cond_1
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/gemini/chat/FileExplorerActivity;->currentDir:Ljava/io/File;

    goto :goto_0
.end method
