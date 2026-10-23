.class Lcom/gemini/chat/LiveActivity$1;
.super Ljava/lang/Object;
.source "LiveActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/LiveActivity;->onCreate(Landroid/os/Bundle;)V
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
    .line 157
    iput-object p1, p0, Lcom/gemini/chat/LiveActivity$1;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/gemini/chat/LiveActivity$1;->this$0:Lcom/gemini/chat/LiveActivity;

    invoke-static {v0}, Lcom/gemini/chat/LiveActivity;->access$000(Lcom/gemini/chat/LiveActivity;)V

    .line 160
    return-void
.end method
