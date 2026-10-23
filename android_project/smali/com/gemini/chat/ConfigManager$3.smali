.class Lcom/gemini/chat/ConfigManager$3;
.super Ljava/lang/Object;
.source "ConfigManager.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ConfigManager;->showSaveNameDialog(Landroid/app/Activity;ZLjava/io/File;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$input:Landroid/widget/EditText;

.field final synthetic val$isChat:Z

.field final synthetic val$targetFolder:Ljava/io/File;


# direct methods
.method constructor <init>(Landroid/widget/EditText;Ljava/io/File;Landroid/app/Activity;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 113
    iput-object p1, p0, Lcom/gemini/chat/ConfigManager$3;->val$input:Landroid/widget/EditText;

    iput-object p2, p0, Lcom/gemini/chat/ConfigManager$3;->val$targetFolder:Ljava/io/File;

    iput-object p3, p0, Lcom/gemini/chat/ConfigManager$3;->val$activity:Landroid/app/Activity;

    iput-boolean p4, p0, Lcom/gemini/chat/ConfigManager$3;->val$isChat:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 115
    iget-object p1, p0, Lcom/gemini/chat/ConfigManager$3;->val$input:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 116
    new-instance p2, Ljava/io/File;

    iget-object v0, p0, Lcom/gemini/chat/ConfigManager$3;->val$targetFolder:Ljava/io/File;

    invoke-direct {p2, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 117
    iget-object p1, p0, Lcom/gemini/chat/ConfigManager$3;->val$activity:Landroid/app/Activity;

    iget-boolean v0, p0, Lcom/gemini/chat/ConfigManager$3;->val$isChat:Z

    invoke-static {p1, v0, p2}, Lcom/gemini/chat/ConfigManager;->-$$Nest$smperformExport(Landroid/app/Activity;ZLjava/io/File;)V

    iget-object p1, p0, Lcom/gemini/chat/ConfigManager$3;->val$activity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    .line 118
    return-void
.end method
