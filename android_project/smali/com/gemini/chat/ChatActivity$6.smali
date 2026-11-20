.class Lcom/gemini/chat/ChatActivity$6;
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
    .line 710
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$6;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 20

    .prologue
    .line 712
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity$6;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v2}, Lcom/gemini/chat/ChatActivity;->access$500(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ChatActivity$GeminiTask;

    move-result-object v2

    .line 713
    if-eqz v2, :cond_0

    .line 714
    invoke-virtual {v2}, Lcom/gemini/chat/ChatActivity$GeminiTask;->snapshotPartial()[Ljava/lang/String;

    move-result-object v3

    .line 715
    const/4 v4, 0x0

    aget-object v4, v3, v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 716
    invoke-static {v2}, Lcom/gemini/chat/ChatActivity$GeminiTask;->access$2200(Lcom/gemini/chat/ChatActivity$GeminiTask;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v5, 0x1

    aget-object v3, v3, v5

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    .line 717
    :goto_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/gemini/chat/ChatActivity$6;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v3}, Lcom/gemini/chat/ChatActivity;->access$2300(Lcom/gemini/chat/ChatActivity;)V

    .line 718
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/gemini/chat/ChatActivity$6;->this$0:Lcom/gemini/chat/ChatActivity;

    const/4 v5, 0x0

    invoke-static {v3, v5}, Lcom/gemini/chat/ChatActivity;->access$300(Lcom/gemini/chat/ChatActivity;Z)V

    .line 719
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2

    .line 720
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n\n*[Stopped]*"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 721
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/gemini/chat/ChatActivity$6;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v3}, Lcom/gemini/chat/ChatActivity;->access$200(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/DatabaseHelper;

    move-result-object v3

    invoke-static {v2}, Lcom/gemini/chat/ChatActivity$GeminiTask;->access$2400(Lcom/gemini/chat/ChatActivity$GeminiTask;)J

    move-result-wide v4

    const-string v6, "model"

    invoke-static {v2}, Lcom/gemini/chat/ChatActivity$GeminiTask;->access$2500(Lcom/gemini/chat/ChatActivity$GeminiTask;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {v3 .. v9}, Lcom/gemini/chat/DatabaseHelper;->addMessage(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v11

    .line 722
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/gemini/chat/ChatActivity$6;->this$0:Lcom/gemini/chat/ChatActivity;

    const-string v13, "model"

    invoke-static {v2}, Lcom/gemini/chat/ChatActivity$GeminiTask;->access$2500(Lcom/gemini/chat/ChatActivity$GeminiTask;)Ljava/lang/String;

    move-result-object v14

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    const/16 v19, 0x1

    move-object v15, v7

    move-object/from16 v18, v9

    invoke-static/range {v10 .. v19}, Lcom/gemini/chat/ChatActivity;->access$800(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Z)V

    .line 723
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity$6;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v2}, Lcom/gemini/chat/Compat;->invalidateMenu(Landroid/app/Activity;)V

    .line 727
    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity$6;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v2}, Lcom/gemini/chat/ChatActivity;->access$900(Lcom/gemini/chat/ChatActivity;)V

    .line 729
    :cond_0
    return-void

    .line 716
    :cond_1
    const-string v9, ""

    goto :goto_0

    .line 725
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gemini/chat/ChatActivity$6;->this$0:Lcom/gemini/chat/ChatActivity;

    const-wide/16 v3, -0x1

    const-string v5, "system"

    const/4 v6, 0x0

    const-string v7, "Request stopped by user."

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const/4 v10, 0x0

    const/4 v11, 0x1

    invoke-static/range {v2 .. v11}, Lcom/gemini/chat/ChatActivity;->access$800(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Z)V

    goto :goto_1
.end method
