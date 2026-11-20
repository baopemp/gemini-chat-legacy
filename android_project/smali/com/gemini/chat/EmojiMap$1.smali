.class Lcom/gemini/chat/EmojiMap$1;
.super Ljava/lang/Object;
.source "EmojiMap.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/EmojiMap;->preloadAsync(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$app:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 35
    iput-object p1, p0, Lcom/gemini/chat/EmojiMap$1;->val$app:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/gemini/chat/EmojiMap$1;->val$app:Landroid/content/Context;

    invoke-static {v0}, Lcom/gemini/chat/EmojiMap;->ensureLoaded(Landroid/content/Context;)V

    .line 38
    return-void
.end method
