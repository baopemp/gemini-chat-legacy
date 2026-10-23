.class Lcom/gemini/chat/SettingsActivity$1;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/SettingsActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/chat/SettingsActivity;


# direct methods
.method constructor <init>(Lcom/gemini/chat/SettingsActivity;)V
    .locals 0

    .prologue
    .line 180
    iput-object p1, p0, Lcom/gemini/chat/SettingsActivity$1;->this$0:Lcom/gemini/chat/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 182
    iget-object v0, p0, Lcom/gemini/chat/SettingsActivity$1;->this$0:Lcom/gemini/chat/SettingsActivity;

    invoke-static {v0}, Lcom/gemini/chat/SettingsActivity;->access$000(Lcom/gemini/chat/SettingsActivity;)V

    .line 183
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 186
    return-void
.end method
