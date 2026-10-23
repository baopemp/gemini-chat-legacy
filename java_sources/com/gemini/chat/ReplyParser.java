package com.gemini.chat;

import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class ReplyParser {
    public boolean sawCandidate;
    public int thoughtTokens;
    public final StringBuffer text = new StringBuffer();
    public final StringBuffer thoughts = new StringBuffer();
    public String finishReason = null;
    public String blockReason = null;

    public void feed(JSONObject jSONObject) {
        JSONObject optJSONObject = jSONObject.optJSONObject("promptFeedback");
        if (optJSONObject != null && optJSONObject.optString("blockReason", "").length() > 0) {
            this.blockReason = optJSONObject.optString("blockReason");
        }
        JSONObject optJSONObject2 = jSONObject.optJSONObject("usageMetadata");
        if (optJSONObject2 != null) {
            this.thoughtTokens = Math.max(this.thoughtTokens, optJSONObject2.optInt("thoughtsTokenCount", 0));
        }
        JSONArray optJSONArray = jSONObject.optJSONArray("candidates");
        if (optJSONArray != null && optJSONArray.length() != 0) {
            this.sawCandidate = true;
            JSONObject optJSONObject3 = optJSONArray.optJSONObject(0);
            if (optJSONObject3 != null) {
                String optString = optJSONObject3.optString("finishReason", "");
                if (optString.length() > 0) {
                    this.finishReason = optString;
                }
                JSONObject optJSONObject4 = optJSONObject3.optJSONObject("content");
                JSONArray optJSONArray2 = optJSONObject4 != null ? optJSONObject4.optJSONArray("parts") : null;
                for (int i = 0; optJSONArray2 != null && i < optJSONArray2.length(); i++) {
                    JSONObject optJSONObject5 = optJSONArray2.optJSONObject(i);
                    if (optJSONObject5 != null) {
                        String optString2 = optJSONObject5.optString("text", "");
                        if (optString2.length() != 0) {
                            if (optJSONObject5.optBoolean("thought", false)) {
                                this.thoughts.append(optString2);
                            } else {
                                this.text.append(optString2);
                            }
                        }
                    }
                }
            }
        }
    }

    public String error() {
        if (this.text.length() > 0) {
            return null;
        }
        if (this.sawCandidate) {
            return "Error: Gemini returned no text (finish reason: " + (this.finishReason != null ? this.finishReason : "UNKNOWN") + ").";
        }
        return this.blockReason != null ? "Error: Gemini blocked this prompt (" + this.blockReason + ")." : "Error: Gemini returned no candidates.";
    }

    public String answer() {
        String stringBuffer = this.text.toString();
        return "MAX_TOKENS".equals(this.finishReason) ? stringBuffer + "\n\n*[Reply cut off: output token limit reached]*" : stringBuffer;
    }

    public String thoughtsForDisplay() {
        String trim = this.thoughts.toString().trim();
        if (trim.length() == 0 && this.thoughtTokens > 0) {
            return "_The model thought (" + this.thoughtTokens + " tokens) but sent no summary for this reply._";
        }
        return trim;
    }

    public static String levelFor(String str, String str2) {
        if (str2 == null || str2.length() == 0) {
            return null;
        }
        return (str == null || !str.startsWith("gemma-")) ? ("minimal".equals(str2) && str != null && str.startsWith("gemini-3.8-flash")) ? "low" : str2 : ("minimal".equals(str2) || "low".equals(str2)) ? "minimal" : "high";
    }
}
