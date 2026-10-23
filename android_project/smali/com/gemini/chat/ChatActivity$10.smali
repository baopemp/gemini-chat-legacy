.class Lcom/gemini/chat/ChatActivity$10;
.super Ljava/lang/Object;
.source "ChatActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ChatActivity;->showThoughts(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/ChatActivity;

.field final synthetic val$thoughts:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 1020
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$10;->this$0:Lcom/gemini/chat/ChatActivity;

    iput-object p2, p0, Lcom/gemini/chat/ChatActivity$10;->val$thoughts:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .prologue
    .line 1022
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$10;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$10;->val$thoughts:Ljava/lang/String;

    const-string v2, "Thoughts copied"

    invoke-static {v0, v1, v2}, Lcom/gemini/chat/ChatActivity;->access$2400(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 1023
    return-void
.end method
