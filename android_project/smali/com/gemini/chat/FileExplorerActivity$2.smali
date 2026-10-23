.class Lcom/gemini/chat/FileExplorerActivity$2;
.super Ljava/lang/Object;
.source "FileExplorerActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/FileExplorerActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/FileExplorerActivity;


# direct methods
.method constructor <init>(Lcom/gemini/chat/FileExplorerActivity;)V
    .locals 0

    .prologue
    .line 67
    iput-object p1, p0, Lcom/gemini/chat/FileExplorerActivity$2;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .prologue
    .line 70
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity$2;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    iget-object v1, p0, Lcom/gemini/chat/FileExplorerActivity$2;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    invoke-static {v1}, Lcom/gemini/chat/FileExplorerActivity;->access$000(Lcom/gemini/chat/FileExplorerActivity;)Z

    move-result v1

    iget-object v2, p0, Lcom/gemini/chat/FileExplorerActivity$2;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    invoke-static {v2}, Lcom/gemini/chat/FileExplorerActivity;->access$100(Lcom/gemini/chat/FileExplorerActivity;)Ljava/io/File;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/gemini/chat/ConfigManager;->showSaveNameDialog(Landroid/app/Activity;ZLjava/io/File;)V

    .line 71
    .line 72
    return-void
.end method
