.class Lcom/gemini/chat/ChatActivity$3;
.super Ljava/lang/Object;
.source "ChatActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ChatActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/ChatActivity;


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatActivity;)V
    .locals 0

    .prologue
    .line 533
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 535
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$3;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$1200(Lcom/gemini/chat/ChatActivity;)V

    .line 536
    return-void
.end method
