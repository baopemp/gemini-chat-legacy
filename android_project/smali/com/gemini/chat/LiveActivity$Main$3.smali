.class Lcom/gemini/chat/LiveActivity$Main$3;
.super Ljava/lang/Object;
.source "LiveActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/LiveActivity$Main;->onInputText(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/gemini/chat/LiveActivity$Main;

.field final synthetic val$delta:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/gemini/chat/LiveActivity$Main;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 434
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$Main$3;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iput-object p2, p0, Lcom/gemini/chat/LiveActivity$Main$3;->val$delta:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 436
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$3;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity$Main;->access$700(Lcom/gemini/chat/LiveActivity$Main;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 439
    :goto_0
    return-void

    .line 437
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$3;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2500(Lcom/gemini/chat/LiveActivity;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/gemini/chat/LiveActivity$Main$3;->val$delta:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 438
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$Main$3;->this$1:Lcom/gemini/chat/LiveActivity$Main;

    iget-object v0, v0, Lcom/gemini/chat/LiveActivity$Main;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$2600(Lcom/gemini/chat/LiveActivity;)V

    goto :goto_0
.end method
