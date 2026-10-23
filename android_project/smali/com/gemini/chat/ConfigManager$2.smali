.class Lcom/gemini/chat/ConfigManager$2;
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

.field final synthetic val$isChat:Z


# direct methods
.method constructor <init>(Landroid/app/Activity;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 82
    iput-object p1, p0, Lcom/gemini/chat/ConfigManager$2;->val$activity:Landroid/app/Activity;

    iput-boolean p2, p0, Lcom/gemini/chat/ConfigManager$2;->val$isChat:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 84
    iget-object p1, p0, Lcom/gemini/chat/ConfigManager$2;->val$activity:Landroid/app/Activity;

    iget-boolean p2, p0, Lcom/gemini/chat/ConfigManager$2;->val$isChat:Z

    invoke-static {}, Lcom/gemini/chat/ConfigManager;->-$$Nest$sfgetcurrentDir()Ljava/io/File;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/gemini/chat/ConfigManager;->-$$Nest$smshowSaveNameDialog(Landroid/app/Activity;ZLjava/io/File;)V

    .line 85
    return-void
.end method
