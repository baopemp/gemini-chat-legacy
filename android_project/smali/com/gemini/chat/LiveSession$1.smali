.class Lcom/gemini/chat/LiveSession$1;
.super Ljava/lang/Object;
.source "LiveSession.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/LiveSession;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/LiveSession;


# direct methods
.method constructor <init>(Lcom/gemini/chat/LiveSession;)V
    .locals 0

    .prologue
    .line 176
    iput-object p1, p0, Lcom/gemini/chat/LiveSession$1;->this$0:Lcom/gemini/chat/LiveSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/gemini/chat/LiveSession$1;->this$0:Lcom/gemini/chat/LiveSession;

    invoke-static {v0}, Lcom/gemini/chat/LiveSession;->access$000(Lcom/gemini/chat/LiveSession;)V

    .line 179
    return-void
.end method
