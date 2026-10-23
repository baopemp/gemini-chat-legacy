.class Lcom/gemini/chat/FileExplorerActivity$3;
.super Ljava/lang/Object;
.source "FileExplorerActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


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
    .line 84
    iput-object p1, p0, Lcom/gemini/chat/FileExplorerActivity$3;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity$3;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    invoke-static {v0}, Lcom/gemini/chat/FileExplorerActivity;->access$200(Lcom/gemini/chat/FileExplorerActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 88
    const-string v1, ".. [Up]"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 89
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity$3;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    iget-object v1, p0, Lcom/gemini/chat/FileExplorerActivity$3;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    invoke-static {v1}, Lcom/gemini/chat/FileExplorerActivity;->access$100(Lcom/gemini/chat/FileExplorerActivity;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/gemini/chat/FileExplorerActivity;->access$102(Lcom/gemini/chat/FileExplorerActivity;Ljava/io/File;)Ljava/io/File;

    .line 90
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity$3;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    invoke-static {v0}, Lcom/gemini/chat/FileExplorerActivity;->access$300(Lcom/gemini/chat/FileExplorerActivity;)V

    .line 103
    :cond_0
    :goto_0
    return-void

    .line 92
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity$3;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    invoke-static {v0}, Lcom/gemini/chat/FileExplorerActivity;->access$400(Lcom/gemini/chat/FileExplorerActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 93
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 94
    iget-object v1, p0, Lcom/gemini/chat/FileExplorerActivity$3;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    invoke-static {v1, v0}, Lcom/gemini/chat/FileExplorerActivity;->access$102(Lcom/gemini/chat/FileExplorerActivity;Ljava/io/File;)Ljava/io/File;

    .line 95
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity$3;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    invoke-static {v0}, Lcom/gemini/chat/FileExplorerActivity;->access$300(Lcom/gemini/chat/FileExplorerActivity;)V

    goto :goto_0

    .line 97
    :cond_2
    iget-object v1, p0, Lcom/gemini/chat/FileExplorerActivity$3;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    invoke-static {v1}, Lcom/gemini/chat/FileExplorerActivity;->access$500(Lcom/gemini/chat/FileExplorerActivity;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 98
    iget-object v1, p0, Lcom/gemini/chat/FileExplorerActivity$3;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    iget-object v2, p0, Lcom/gemini/chat/FileExplorerActivity$3;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    invoke-static {v2}, Lcom/gemini/chat/FileExplorerActivity;->access$000(Lcom/gemini/chat/FileExplorerActivity;)Z

    move-result v2

    invoke-static {v1, v2, v0}, Lcom/gemini/chat/ConfigManager;->performImport(Landroid/app/Activity;ZLjava/io/File;)V

    .line 99
    iget-object v0, p0, Lcom/gemini/chat/FileExplorerActivity$3;->this$0:Lcom/gemini/chat/FileExplorerActivity;

    invoke-virtual {v0}, Lcom/gemini/chat/FileExplorerActivity;->finish()V

    goto :goto_0
.end method
