.class Lcom/gemini/chat/ChatActivity$7;
.super Ljava/lang/Object;
.source "ChatActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ChatActivity;->loadMessages(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/ChatActivity;

.field final synthetic val$y:I


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatActivity;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 837
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$7;->this$0:Lcom/gemini/chat/ChatActivity;

    iput p2, p0, Lcom/gemini/chat/ChatActivity$7;->val$y:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 839
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$7;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$2000(Lcom/gemini/chat/ChatActivity;)Landroid/widget/ScrollView;

    move-result-object v0

    const/4 v1, 0x0

    iget v2, p0, Lcom/gemini/chat/ChatActivity$7;->val$y:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ScrollView;->scrollTo(II)V

    .line 840
    return-void
.end method
