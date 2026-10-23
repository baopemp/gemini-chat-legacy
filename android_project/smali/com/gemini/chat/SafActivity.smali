.class public Lcom/gemini/chat/SafActivity;
.super Landroid/app/Activity;
.source "SafActivity.java"


# instance fields
.field private isChat:Z

.field private isExport:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private performExportSaf(Landroid/net/Uri;)V
    .locals 6

    .line 66
    nop

    .line 67
    nop

    .line 69
    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_0
    iget-boolean v3, p0, Lcom/gemini/chat/SafActivity;->isChat:Z

    invoke-static {p0, v3}, Lcom/gemini/chat/ConfigManager;->getInternalFile(Landroid/content/Context;Z)Ljava/io/File;

    move-result-object v4

    .line 73
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 74
    invoke-virtual {p0}, Lcom/gemini/chat/SafActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 75
    :try_start_1
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 76
    const/16 v1, 0x400

    :try_start_2
    new-array v1, v1, [B

    .line 78
    :goto_1
    invoke-virtual {v2, v1}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_1

    .line 79
    const/4 v4, 0x0

    invoke-virtual {p1, v1, v4, v3}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_1

    .line 81
    :cond_1
    const-string v1, "Exported successfully!"

    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 82
    move-object v1, v2

    goto :goto_2

    .line 88
    :catchall_0
    move-exception v0

    move-object v1, v2

    goto :goto_b

    .line 85
    :catch_0
    move-exception v1

    move-object v1, v2

    goto :goto_5

    :catch_1
    move-exception v2

    goto :goto_5

    .line 83
    :cond_2
    :try_start_3
    const-string p1, "No internal file found to export"

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-object p1, v1

    .line 89
    :goto_2
    if-eqz v1, :cond_3

    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    :catch_2
    move-exception v3

    :cond_3
    :goto_3
    if-eqz p1, :cond_5

    :try_start_5
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_4

    :catch_3
    move-exception v3

    :goto_4
    goto :goto_9

    .line 88
    :catchall_1
    move-exception p1

    move-object v0, v1

    goto :goto_c

    .line 85
    :catch_4
    move-exception p1

    move-object p1, v1

    .line 86
    :goto_5
    :try_start_6
    const-string v2, "Export Failed"

    invoke-static {p0, v2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 89
    if-eqz v1, :cond_4

    :try_start_7
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5

    goto :goto_6

    :catch_5
    move-exception p1

    goto :goto_8

    :cond_4
    :goto_6
    if-eqz p1, :cond_5

    :try_start_8
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    goto :goto_7

    :catch_6
    move-exception p1

    goto :goto_8

    :goto_7
    goto :goto_9

    .line 92
    :goto_8
    goto :goto_a

    .line 91
    :cond_5
    :goto_9
    nop

    .line 93
    :goto_a
    return-void

    .line 88
    :catchall_2
    move-exception v0

    :goto_b
    move-object v5, v0

    move-object v0, p1

    move-object p1, v5

    .line 89
    :goto_c
    if-eqz v1, :cond_6

    :try_start_9
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_7

    goto :goto_d

    :catch_7
    move-exception v0

    goto :goto_e

    :cond_6
    :goto_d
    if-eqz v0, :cond_7

    :try_start_a
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_8

    goto :goto_e

    :catch_8
    move-exception v0

    goto :goto_e

    .line 91
    :cond_7
    :goto_e
    nop

    .line 92
    goto :goto_10

    :goto_f
    throw p1

    :goto_10
    goto :goto_f
.end method

.method private performImportSaf(Landroid/net/Uri;)V
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Lcom/gemini/chat/SafActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v0

    iget-boolean v1, p0, Lcom/gemini/chat/SafActivity;->isChat:Z

    invoke-static {p0, v1, v0}, Lcom/gemini/chat/ConfigManager;->importFromStream(Landroid/app/Activity;ZLjava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :close
    if-eqz v0, :done

    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :done

    :done
    return-void

    :catch_0
    move-exception v1

    const-string v1, "Import Failed"

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :close
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 54
    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 55
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    .line 56
    const/4 p3, 0x1

    if-ne p1, p3, :cond_0

    iget-boolean p3, p0, Lcom/gemini/chat/SafActivity;->isExport:Z

    if-eqz p3, :cond_0

    .line 57
    invoke-direct {p0, p2}, Lcom/gemini/chat/SafActivity;->performExportSaf(Landroid/net/Uri;)V

    goto :goto_0

    .line 58
    :cond_0
    const/4 p3, 0x2

    if-ne p1, p3, :cond_1

    iget-boolean p1, p0, Lcom/gemini/chat/SafActivity;->isExport:Z

    if-nez p1, :cond_1

    .line 59
    invoke-direct {p0, p2}, Lcom/gemini/chat/SafActivity;->performImportSaf(Landroid/net/Uri;)V

    .line 62
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/gemini/chat/SafActivity;->finish()V

    .line 63
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6

    .line 24
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    invoke-virtual {p0}, Lcom/gemini/chat/SafActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    .line 27
    const-string v0, "isChat"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/gemini/chat/SafActivity;->isChat:Z

    .line 28
    const-string v0, "isExport"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/gemini/chat/SafActivity;->isExport:Z

    .line 30
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x13

    if-lt p1, v0, :cond_3

    .line 31
    iget-boolean p1, p0, Lcom/gemini/chat/SafActivity;->isExport:Z

    const-string v0, "*/*"

    const-string v2, "android.intent.category.OPENABLE"

    if-eqz p1, :cond_2

    .line 32
    new-instance p1, Landroid/content/Intent;

    const-string v3, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {p1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 33
    invoke-virtual {p1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 34
    iget-boolean v2, p0, Lcom/gemini/chat/SafActivity;->isChat:Z

    if-eqz v2, :cond_0

    const-string v3, "Chats_"

    goto :goto_0

    :cond_0
    const-string v3, "Settings_"

    .line 35
    :goto_0
    if-eqz v2, :cond_1

    const-string v2, ".db"

    goto :goto_1

    :cond_1
    const-string v2, ".xml"

    .line 36
    :goto_1
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyy-MM-dd"

    invoke-direct {v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    .line 37
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 38
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 39
    const-string v0, "android.intent.extra.TITLE"

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    invoke-virtual {p0, p1, v1}, Lcom/gemini/chat/SafActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 41
    goto :goto_2

    .line 42
    :cond_2
    new-instance p1, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {p1, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 43
    invoke-virtual {p1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 44
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 45
    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/gemini/chat/SafActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 46
    goto :goto_2

    .line 48
    :cond_3
    invoke-virtual {p0}, Lcom/gemini/chat/SafActivity;->finish()V

    .line 50
    :goto_2
    return-void
.end method
