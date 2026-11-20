.class final Lcom/gemini/chat/ChatActivity$AttachImageTask;
.super Landroid/os/AsyncTask;
.source "ChatActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/ChatActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AttachImageTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "[",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/ChatActivity;

.field private final thumbPx:I


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatActivity;I)V
    .locals 0

    .prologue
    .line 971
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$AttachImageTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 972
    iput p2, p0, Lcom/gemini/chat/ChatActivity$AttachImageTask;->thumbPx:I

    .line 973
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 968
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/gemini/chat/ChatActivity$AttachImageTask;->doInBackground([Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)[Ljava/lang/Object;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 977
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$AttachImageTask;->this$0:Lcom/gemini/chat/ChatActivity;

    aget-object v1, p1, v3

    invoke-static {v0, v1}, Lcom/gemini/chat/ImageUtil;->uriToBase64(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 978
    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$AttachImageTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    .line 980
    :goto_0
    return-object v0

    .line 979
    :cond_1
    iget v0, p0, Lcom/gemini/chat/ChatActivity$AttachImageTask;->thumbPx:I

    invoke-static {v1, v0}, Lcom/gemini/chat/Thumbnail;->fromDataUri(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 980
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    aput-object v1, v0, v3

    const/4 v1, 0x1

    aput-object v2, v0, v1

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 968
    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/gemini/chat/ChatActivity$AttachImageTask;->onPostExecute([Ljava/lang/Object;)V

    return-void
.end method

.method protected onPostExecute([Ljava/lang/Object;)V
    .locals 4

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x1

    .line 985
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$AttachImageTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$2900(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ChatActivity$AttachImageTask;

    move-result-object v0

    if-ne v0, p0, :cond_0

    invoke-virtual {p0}, Lcom/gemini/chat/ChatActivity$AttachImageTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$AttachImageTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-virtual {v0}, Lcom/gemini/chat/ChatActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 994
    :cond_0
    :goto_0
    return-void

    .line 986
    :cond_1
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$AttachImageTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$2902(Lcom/gemini/chat/ChatActivity;Lcom/gemini/chat/ChatActivity$AttachImageTask;)Lcom/gemini/chat/ChatActivity$AttachImageTask;

    .line 987
    if-nez p1, :cond_2

    .line 988
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$AttachImageTask;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$2700(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;)V

    .line 989
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$AttachImageTask;->this$0:Lcom/gemini/chat/ChatActivity;

    const-string v1, "Could not read that image (only images are supported)."

    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 990
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 993
    :cond_2
    iget-object v2, p0, Lcom/gemini/chat/ChatActivity$AttachImageTask;->this$0:Lcom/gemini/chat/ChatActivity;

    const/4 v0, 0x0

    aget-object v0, p1, v0

    check-cast v0, Ljava/lang/String;

    aget-object v1, p1, v3

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-static {v2, v0, v1}, Lcom/gemini/chat/ChatActivity;->access$3000(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method
