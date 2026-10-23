.class public interface abstract Lcom/gemini/chat/LiveSession$Listener;
.super Ljava/lang/Object;
.source "LiveSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/LiveSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Listener"
.end annotation


# virtual methods
.method public abstract onAudio([B)V
.end method

.method public abstract onClosed(Ljava/lang/String;)V
.end method

.method public abstract onInputText(Ljava/lang/String;)V
.end method

.method public abstract onInterimInput(Ljava/lang/String;)V
.end method

.method public abstract onInterrupted()V
.end method

.method public abstract onOutputText(Ljava/lang/String;)V
.end method

.method public abstract onReady()V
.end method

.method public abstract onTurnComplete()V
.end method
