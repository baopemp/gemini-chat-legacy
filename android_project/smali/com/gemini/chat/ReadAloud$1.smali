.class Lcom/gemini/chat/ReadAloud$1;
.super Ljava/lang/Thread;
.source "ReadAloud.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ReadAloud;->stopReading()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/ReadAloud;

.field final synthetic val$c:Ljava/net/HttpURLConnection;


# direct methods
.method constructor <init>(Lcom/gemini/chat/ReadAloud;Ljava/net/HttpURLConnection;)V
    .locals 0

    .prologue
    .line 142
    iput-object p1, p0, Lcom/gemini/chat/ReadAloud$1;->this$0:Lcom/gemini/chat/ReadAloud;

    iput-object p2, p0, Lcom/gemini/chat/ReadAloud$1;->val$c:Ljava/net/HttpURLConnection;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 145
    :try_start_0
    iget-object v0, p0, Lcom/gemini/chat/ReadAloud$1;->val$c:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    :goto_0
    return-void

    .line 146
    :catch_0
    move-exception v0

    goto :goto_0
.end method
