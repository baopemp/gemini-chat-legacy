.class Lcom/gemini/chat/ChatActivity$GeminiTask$1;
.super Ljava/lang/Object;
.source "ChatActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ChatActivity$GeminiTask;->disconnectAsync()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/gemini/chat/ChatActivity$GeminiTask;

.field final synthetic val$c:Ljava/net/HttpURLConnection;


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatActivity$GeminiTask;Ljava/net/HttpURLConnection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 343
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$GeminiTask$1;->this$1:Lcom/gemini/chat/ChatActivity$GeminiTask;

    iput-object p2, p0, Lcom/gemini/chat/ChatActivity$GeminiTask$1;->val$c:Ljava/net/HttpURLConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 346
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$GeminiTask$1;->val$c:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 349
    :goto_0
    return-void

    .line 347
    :catch_0
    move-exception v0

    goto :goto_0
.end method
