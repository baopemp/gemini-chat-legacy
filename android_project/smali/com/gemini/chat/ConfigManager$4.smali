.class Lcom/gemini/chat/ConfigManager$4;
.super Ljava/lang/Object;
.source "ConfigManager.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ConfigManager;->showFileChooser(Landroid/app/Activity;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$fileObjList:Ljava/util/List;

.field final synthetic val$isChat:Z


# direct methods
.method constructor <init>(Landroid/app/Activity;ZLjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 155
    iput-object p1, p0, Lcom/gemini/chat/ConfigManager$4;->val$activity:Landroid/app/Activity;

    iput-boolean p2, p0, Lcom/gemini/chat/ConfigManager$4;->val$isChat:Z

    iput-object p3, p0, Lcom/gemini/chat/ConfigManager$4;->val$fileObjList:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 157
    if-nez p2, :cond_1

    .line 158
    invoke-static {}, Lcom/gemini/chat/ConfigManager;->-$$Nest$sfgetcurrentDir()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 159
    invoke-static {}, Lcom/gemini/chat/ConfigManager;->-$$Nest$sfgetcurrentDir()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Lcom/gemini/chat/ConfigManager;->-$$Nest$sfputcurrentDir(Ljava/io/File;)V

    .line 161
    :cond_0
    iget-object p1, p0, Lcom/gemini/chat/ConfigManager$4;->val$activity:Landroid/app/Activity;

    iget-boolean p2, p0, Lcom/gemini/chat/ConfigManager$4;->val$isChat:Z

    invoke-static {p1, p2}, Lcom/gemini/chat/ConfigManager;->-$$Nest$smshowFileChooser(Landroid/app/Activity;Z)V

    goto :goto_0

    .line 163
    :cond_1
    iget-object p1, p0, Lcom/gemini/chat/ConfigManager$4;->val$fileObjList:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/File;

    .line 164
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result p2

    if-eqz p2, :cond_2

    .line 165
    invoke-static {p1}, Lcom/gemini/chat/ConfigManager;->-$$Nest$sfputcurrentDir(Ljava/io/File;)V

    .line 166
    iget-object p1, p0, Lcom/gemini/chat/ConfigManager$4;->val$activity:Landroid/app/Activity;

    iget-boolean p2, p0, Lcom/gemini/chat/ConfigManager$4;->val$isChat:Z

    invoke-static {p1, p2}, Lcom/gemini/chat/ConfigManager;->-$$Nest$smshowFileChooser(Landroid/app/Activity;Z)V

    goto :goto_0

    .line 168
    :cond_2
    iget-object p2, p0, Lcom/gemini/chat/ConfigManager$4;->val$activity:Landroid/app/Activity;

    iget-boolean v0, p0, Lcom/gemini/chat/ConfigManager$4;->val$isChat:Z

    invoke-static {p2, v0, p1}, Lcom/gemini/chat/ConfigManager;->-$$Nest$smperformImport(Landroid/app/Activity;ZLjava/io/File;)V

    .line 171
    :goto_0
    return-void
.end method
