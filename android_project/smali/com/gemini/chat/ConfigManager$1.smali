.class Lcom/gemini/chat/ConfigManager$1;
.super Ljava/lang/Object;
.source "ConfigManager.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ConfigManager;->showFolderChooser(Landroid/app/Activity;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$dirList:Ljava/util/List;

.field final synthetic val$isChat:Z


# direct methods
.method constructor <init>(Landroid/app/Activity;ZLjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 67
    iput-object p1, p0, Lcom/gemini/chat/ConfigManager$1;->val$activity:Landroid/app/Activity;

    iput-boolean p2, p0, Lcom/gemini/chat/ConfigManager$1;->val$isChat:Z

    iput-object p3, p0, Lcom/gemini/chat/ConfigManager$1;->val$dirList:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 69
    if-nez p2, :cond_1

    .line 70
    invoke-static {}, Lcom/gemini/chat/ConfigManager;->-$$Nest$sfgetcurrentDir()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 71
    invoke-static {}, Lcom/gemini/chat/ConfigManager;->-$$Nest$sfgetcurrentDir()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Lcom/gemini/chat/ConfigManager;->-$$Nest$sfputcurrentDir(Ljava/io/File;)V

    .line 73
    :cond_0
    iget-object p1, p0, Lcom/gemini/chat/ConfigManager$1;->val$activity:Landroid/app/Activity;

    iget-boolean p2, p0, Lcom/gemini/chat/ConfigManager$1;->val$isChat:Z

    invoke-static {p1, p2}, Lcom/gemini/chat/ConfigManager;->-$$Nest$smshowFolderChooser(Landroid/app/Activity;Z)V

    goto :goto_0

    .line 75
    :cond_1
    iget-object p1, p0, Lcom/gemini/chat/ConfigManager$1;->val$dirList:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 76
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 77
    new-instance p2, Ljava/io/File;

    invoke-static {}, Lcom/gemini/chat/ConfigManager;->-$$Nest$sfgetcurrentDir()Ljava/io/File;

    move-result-object v0

    invoke-direct {p2, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p2}, Lcom/gemini/chat/ConfigManager;->-$$Nest$sfputcurrentDir(Ljava/io/File;)V

    .line 78
    iget-object p1, p0, Lcom/gemini/chat/ConfigManager$1;->val$activity:Landroid/app/Activity;

    iget-boolean p2, p0, Lcom/gemini/chat/ConfigManager$1;->val$isChat:Z

    invoke-static {p1, p2}, Lcom/gemini/chat/ConfigManager;->-$$Nest$smshowFolderChooser(Landroid/app/Activity;Z)V

    .line 80
    :goto_0
    return-void
.end method
