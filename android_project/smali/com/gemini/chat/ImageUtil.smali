.class public Lcom/gemini/chat/ImageUtil;
.super Ljava/lang/Object;

.method public static uriToBase64(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .prologue

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I
    const/16 v1, 0x8
    if-ge v0, v1, :cond_api_ok
    const/4 v0, 0x0
    return-object v0

    :cond_api_ok
    invoke-static {p0, p1}, Lcom/gemini/chat/ImageUtilApi8;->uriToBase64(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method