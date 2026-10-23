.class Lcom/gemini/chat/ChatActivity$14;
.super Ljava/lang/Object;
.source "ChatActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ChatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z
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
    .line 1122
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$14;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    .prologue
    .line 1124
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$14;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$000(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/DatabaseHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$14;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v1}, Lcom/gemini/chat/ChatActivity;->access$900(Lcom/gemini/chat/ChatActivity;)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/gemini/chat/DatabaseHelper;->deleteChat(J)V

    .line 1125
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$14;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-virtual {v0}, Lcom/gemini/chat/ChatActivity;->finish()V

    .line 1126
    return-void
.end method
