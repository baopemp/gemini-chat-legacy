.class Lcom/gemini/chat/ConfigBinder$2;
.super Ljava/lang/Object;
.source "ConfigBinder.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/chat/ConfigBinder;->showBackupMenu(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 26
    iput-object p1, p0, Lcom/gemini/chat/ConfigBinder$2;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 28
    const/4 p1, 0x1

    if-nez p2, :cond_0

    .line 29
    iget-object p2, p0, Lcom/gemini/chat/ConfigBinder$2;->val$activity:Landroid/app/Activity;

    invoke-static {p2, p1}, Lcom/gemini/chat/ConfigManager;->startExport(Landroid/app/Activity;Z)V

    goto :goto_0

    .line 30
    :cond_0
    if-ne p2, p1, :cond_1

    .line 31
    iget-object p2, p0, Lcom/gemini/chat/ConfigBinder$2;->val$activity:Landroid/app/Activity;

    invoke-static {p2, p1}, Lcom/gemini/chat/ConfigManager;->startImport(Landroid/app/Activity;Z)V

    goto :goto_0

    .line 32
    :cond_1
    const/4 p1, 0x2

    const/4 v0, 0x0

    if-ne p2, p1, :cond_2

    .line 33
    iget-object p1, p0, Lcom/gemini/chat/ConfigBinder$2;->val$activity:Landroid/app/Activity;

    invoke-static {p1, v0}, Lcom/gemini/chat/ConfigManager;->startExport(Landroid/app/Activity;Z)V

    goto :goto_0

    .line 34
    :cond_2
    const/4 p1, 0x3

    if-ne p2, p1, :cond_3

    .line 35
    iget-object p1, p0, Lcom/gemini/chat/ConfigBinder$2;->val$activity:Landroid/app/Activity;

    invoke-static {p1, v0}, Lcom/gemini/chat/ConfigManager;->startImport(Landroid/app/Activity;Z)V

    .line 37
    :cond_3
    :goto_0
    return-void
.end method
