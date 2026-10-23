.class Lcom/gemini/chat/ChatActivity$11;
.super Ljava/lang/Object;
.source "ChatActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ChatActivity;->confirmDelete(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/ChatActivity;

.field final synthetic val$msgId:J


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatActivity;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 1054
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$11;->this$0:Lcom/gemini/chat/ChatActivity;

    iput-wide p2, p0, Lcom/gemini/chat/ChatActivity$11;->val$msgId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    .prologue
    .line 1056
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$11;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$000(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/DatabaseHelper;

    move-result-object v0

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity$11;->val$msgId:J

    invoke-virtual {v0, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->deleteMessage(J)V

    .line 1057
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$11;->this$0:Lcom/gemini/chat/ChatActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$3000(Lcom/gemini/chat/ChatActivity;Z)V

    .line 1058
    return-void
.end method
