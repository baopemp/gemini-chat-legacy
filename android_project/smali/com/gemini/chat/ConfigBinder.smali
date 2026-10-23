.class public Lcom/gemini/chat/ConfigBinder;
.super Ljava/lang/Object;
.source "ConfigBinder.java"


# direct methods
.method static bridge synthetic -$$Nest$smshowBackupMenu(Landroid/app/Activity;)V
    .locals 0

    invoke-static {p0}, Lcom/gemini/chat/ConfigBinder;->showBackupMenu(Landroid/app/Activity;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bind(Landroid/app/Activity;)V
    .locals 5

    .line 10
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "btn_backups"

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 12
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 13
    if-eqz v0, :cond_2

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v1

    const-string v2, "mounted"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :goto_0
    new-instance v1, Lcom/gemini/chat/ConfigBinder$1;

    invoke-direct {v1, p0}, Lcom/gemini/chat/ConfigBinder$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    check-cast v0, Landroid/widget/TextView;

    const-string v1, "Backups (No SD Card)"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    :goto_1
    return-void
.end method

.method private static showBackupMenu(Landroid/app/Activity;)V
    .locals 3

    .line 23
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/CharSequence;

    const/4 v1, 0x0

    const-string v2, "Export Chat History"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Import Chat History"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Export Settings"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Import Settings"

    aput-object v2, v0, v1

    .line 24
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 25
    const-string v2, "Backups"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 26
    new-instance v2, Lcom/gemini/chat/ConfigBinder$2;

    invoke-direct {v2, p0}, Lcom/gemini/chat/ConfigBinder$2;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 39
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 40
    return-void
.end method
