.class final Lcom/gemini/chat/ChatActivity$MessageMenu;
.super Ljava/lang/Object;
.source "ChatActivity.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gemini/chat/ChatActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MessageMenu"
.end annotation


# instance fields
.field actions:[I

.field args:[I

.field final codeBlocks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final id:J

.field labels:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final model:Ljava/lang/String;

.field final role:Ljava/lang/String;

.field final text:Ljava/lang/String;

.field final synthetic this$0:Lcom/gemini/chat/ChatActivity;

.field final thoughts:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 885
    iput-object p1, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 886
    iput-wide p2, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->id:J

    .line 887
    if-nez p8, :cond_0

    const-string p8, ""

    :cond_0
    iput-object p8, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->thoughts:Ljava/lang/String;

    .line 888
    iput-object p4, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->role:Ljava/lang/String;

    .line 889
    iput-object p5, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->model:Ljava/lang/String;

    .line 890
    if-nez p6, :cond_1

    const-string p6, ""

    :cond_1
    iput-object p6, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->text:Ljava/lang/String;

    .line 891
    iput-object p7, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->codeBlocks:Ljava/util/ArrayList;

    .line 892
    return-void
.end method

.method private add(Ljava/lang/String;I)V
    .locals 1

    .prologue
    .line 895
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/gemini/chat/ChatActivity$MessageMenu;->add(Ljava/lang/String;II)V

    .line 896
    return-void
.end method

.method private add(Ljava/lang/String;II)V
    .locals 2

    .prologue
    .line 899
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->labels:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 900
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->actions:[I

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->labels:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    aput p2, v0, v1

    .line 901
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->args:[I

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->labels:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    aput p3, v0, v1

    .line 902
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 7

    .prologue
    .line 933
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->actions:[I

    aget v0, v0, p2

    packed-switch v0, :pswitch_data_0

    .line 970
    :goto_0
    return-void

    .line 935
    :pswitch_0
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->text:Ljava/lang/String;

    const-string v2, "Copied to clipboard"

    invoke-static {v0, v1, v2}, Lcom/gemini/chat/ChatActivity;->access$2400(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 938
    :pswitch_1
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->codeBlocks:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->args:[I

    aget v2, v2, p2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v2, "Code block copied"

    invoke-static {v1, v0, v2}, Lcom/gemini/chat/ChatActivity;->access$2400(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 941
    :pswitch_2
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->id:J

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->text:Ljava/lang/String;

    invoke-static {v0, v2, v3, v1}, Lcom/gemini/chat/ChatActivity;->access$2500(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;)V

    goto :goto_0

    .line 944
    :pswitch_3
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$2600(Lcom/gemini/chat/ChatActivity;)V

    goto :goto_0

    .line 947
    :pswitch_4
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 948
    const-string v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 949
    const-string v1, "android.intent.extra.TEXT"

    iget-object v2, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->text:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 950
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    const-string v2, "Share Message"

    invoke-static {v0, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/gemini/chat/ChatActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 954
    :pswitch_5
    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->id:J

    iget-object v4, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->role:Ljava/lang/String;

    iget-object v5, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->model:Ljava/lang/String;

    iget-object v6, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->text:Ljava/lang/String;

    invoke-static/range {v1 .. v6}, Lcom/gemini/chat/ChatActivity;->access$2700(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 957
    :pswitch_6
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->id:J

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->role:Ljava/lang/String;

    invoke-static {v0, v2, v3, v1}, Lcom/gemini/chat/ChatActivity;->access$2800(Lcom/gemini/chat/ChatActivity;JLjava/lang/String;)V

    goto :goto_0

    .line 960
    :pswitch_7
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-wide v2, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->id:J

    invoke-static {v0, v2, v3}, Lcom/gemini/chat/ChatActivity;->access$2900(Lcom/gemini/chat/ChatActivity;J)V

    goto :goto_0

    .line 963
    :pswitch_8
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/gemini/chat/ChatActivity;->access$3000(Lcom/gemini/chat/ChatActivity;Z)V

    .line 964
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v0}, Lcom/gemini/chat/ChatActivity;->access$3100(Lcom/gemini/chat/ChatActivity;)V

    goto :goto_0

    .line 967
    :pswitch_9
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    iget-object v1, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->model:Ljava/lang/String;

    iget-object v2, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->thoughts:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/gemini/chat/ChatActivity;->access$3200(Lcom/gemini/chat/ChatActivity;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 933
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 12

    .prologue
    const/4 v11, 0x4

    const/4 v10, 0x3

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 905
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->labels:Ljava/util/ArrayList;

    .line 906
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->codeBlocks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0xc

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->actions:[I

    .line 907
    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->actions:[I

    array-length v0, v0

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->args:[I

    .line 908
    iget-wide v4, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->id:J

    const-wide/16 v6, -0x1

    cmp-long v0, v4, v6

    if-eqz v0, :cond_4

    move v0, v1

    .line 909
    :goto_0
    const-string v3, "user"

    iget-object v4, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->role:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const-string v4, "model"

    iget-object v5, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->role:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 910
    iget-object v5, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v5}, Lcom/gemini/chat/ChatActivity;->access$2200(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ReadAloud;

    move-result-object v5

    if-eqz v5, :cond_0

    const-string v5, "Stop Reading"

    const/16 v6, 0x9

    invoke-direct {p0, v5, v6}, Lcom/gemini/chat/ChatActivity$MessageMenu;->add(Ljava/lang/String;I)V

    .line 911
    :cond_0
    if-eqz v4, :cond_2

    iget-object v5, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->text:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_2

    iget-object v5, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v5}, Lcom/gemini/chat/ChatActivity;->access$2200(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ReadAloud;

    move-result-object v5

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v5}, Lcom/gemini/chat/ChatActivity;->access$2200(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ReadAloud;

    move-result-object v5

    iget-wide v6, v5, Lcom/gemini/chat/ReadAloud;->messageId:J

    iget-wide v8, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->id:J

    cmp-long v5, v6, v8

    if-eqz v5, :cond_2

    :cond_1
    const-string v5, "Read Aloud"

    const/16 v6, 0x8

    invoke-direct {p0, v5, v6}, Lcom/gemini/chat/ChatActivity$MessageMenu;->add(Ljava/lang/String;I)V

    .line 912
    :cond_2
    iget-object v5, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->thoughts:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_3

    const-string v5, "Show Thought Process"

    const/4 v6, 0x7

    invoke-direct {p0, v5, v6}, Lcom/gemini/chat/ChatActivity$MessageMenu;->add(Ljava/lang/String;I)V

    .line 913
    :cond_3
    const-string v5, "Copy Entire Message"

    invoke-direct {p0, v5, v2}, Lcom/gemini/chat/ChatActivity$MessageMenu;->add(Ljava/lang/String;I)V

    .line 914
    :goto_1
    iget-object v5, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->codeBlocks:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Copy Code Block "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    add-int/lit8 v6, v2, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5, v1, v2}, Lcom/gemini/chat/ChatActivity$MessageMenu;->add(Ljava/lang/String;II)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    move v0, v2

    .line 908
    goto/16 :goto_0

    .line 915
    :cond_5
    if-eqz v0, :cond_a

    if-eqz v3, :cond_a

    .line 916
    const-string v2, "Regenerate"

    invoke-direct {p0, v2, v11}, Lcom/gemini/chat/ChatActivity$MessageMenu;->add(Ljava/lang/String;I)V

    .line 917
    const-string v2, "Edit Message"

    invoke-direct {p0, v2, v10}, Lcom/gemini/chat/ChatActivity$MessageMenu;->add(Ljava/lang/String;I)V

    .line 922
    :cond_6
    :goto_2
    if-nez v3, :cond_7

    const-string v2, "Share Message"

    const/4 v3, 0x2

    invoke-direct {p0, v2, v3}, Lcom/gemini/chat/ChatActivity$MessageMenu;->add(Ljava/lang/String;I)V

    .line 923
    :cond_7
    if-nez v0, :cond_8

    iget-object v2, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v2}, Lcom/gemini/chat/ChatActivity;->access$200(Lcom/gemini/chat/ChatActivity;)Lcom/gemini/chat/ChatActivity$GeminiTask;

    move-result-object v2

    if-nez v2, :cond_8

    const-string v2, "user"

    iget-object v3, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-static {v3}, Lcom/gemini/chat/ChatActivity;->access$2300(Lcom/gemini/chat/ChatActivity;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    const-string v2, "Retry"

    const/4 v3, 0x6

    invoke-direct {p0, v2, v3}, Lcom/gemini/chat/ChatActivity$MessageMenu;->add(Ljava/lang/String;I)V

    .line 924
    :cond_8
    if-eqz v0, :cond_9

    const-string v0, "Delete Message"

    const/4 v2, 0x5

    invoke-direct {p0, v0, v2}, Lcom/gemini/chat/ChatActivity$MessageMenu;->add(Ljava/lang/String;I)V

    .line 925
    :cond_9
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->this$0:Lcom/gemini/chat/ChatActivity;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Message Options"

    .line 926
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    iget-object v0, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->labels:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/gemini/chat/ChatActivity$MessageMenu;->labels:Ljava/util/ArrayList;

    .line 927
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/CharSequence;

    invoke-virtual {v2, v0, p0}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 928
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 929
    return v1

    .line 918
    :cond_a
    if-eqz v0, :cond_6

    if-eqz v4, :cond_6

    .line 919
    const-string v2, "Edit Message"

    invoke-direct {p0, v2, v10}, Lcom/gemini/chat/ChatActivity$MessageMenu;->add(Ljava/lang/String;I)V

    .line 920
    const-string v2, "Regenerate"

    invoke-direct {p0, v2, v11}, Lcom/gemini/chat/ChatActivity$MessageMenu;->add(Ljava/lang/String;I)V

    goto :goto_2
.end method
