.class Lcom/gemini/chat/ReadAloud$2;
.super Ljava/lang/Object;
.source "ReadAloud.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ReadAloud;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/ReadAloud;

.field final synthetic val$err:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/gemini/chat/ReadAloud;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 191
    iput-object p1, p0, Lcom/gemini/chat/ReadAloud$2;->this$0:Lcom/gemini/chat/ReadAloud;

    iput-object p2, p0, Lcom/gemini/chat/ReadAloud$2;->val$err:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 193
    iget-object v0, p0, Lcom/gemini/chat/ReadAloud$2;->this$0:Lcom/gemini/chat/ReadAloud;

    invoke-static {v0}, Lcom/gemini/chat/ReadAloud;->access$000(Lcom/gemini/chat/ReadAloud;)Lcom/gemini/chat/ReadAloud$Listener;

    move-result-object v0

    iget-object v1, p0, Lcom/gemini/chat/ReadAloud$2;->this$0:Lcom/gemini/chat/ReadAloud;

    iget-object v2, p0, Lcom/gemini/chat/ReadAloud$2;->val$err:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/gemini/chat/ReadAloud$Listener;->onDone(Lcom/gemini/chat/ReadAloud;Ljava/lang/String;)V

    .line 194
    return-void
.end method
