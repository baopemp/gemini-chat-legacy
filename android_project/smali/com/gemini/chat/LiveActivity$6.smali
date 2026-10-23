.class Lcom/gemini/chat/LiveActivity$6;
.super Ljava/lang/Object;
.source "LiveActivity.java"

# interfaces
.implements Lcom/gemini/chat/AutoNamer$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/LiveActivity;->finishModelTurn(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/LiveActivity;


# direct methods
.method constructor <init>(Lcom/gemini/chat/LiveActivity;)V
    .locals 0

    .prologue
    .line 622
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$6;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onNamed(JLjava/lang/String;)V
    .locals 3

    .prologue
    .line 624
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$6;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$600(Lcom/gemini/chat/LiveActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$6;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$4000(Lcom/gemini/chat/LiveActivity;)J

    move-result-wide v0

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$6;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$4100(Lcom/gemini/chat/LiveActivity;)V

    .line 625
    :cond_0
    return-void
.end method
