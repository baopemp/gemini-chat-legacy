package com.gemini.chat;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Accumulates a generateContent reply: one JSON response, or the chunks of streamGenerateContent (SSE). Thought summaries
 * (parts with "thought": true, sent when thinkingConfig.includeThoughts is on) are kept apart from the answer text.
 * Pure Java (unit-tested on the JVM).
 */
public final class ReplyParser {
    public final StringBuffer text = new StringBuffer();
    public final StringBuffer thoughts = new StringBuffer();
    public String finishReason = null;
    public String blockReason = null;
    public boolean sawCandidate;
    /** usageMetadata.thoughtsTokenCount: the model can think without sending a summary. */
    public int thoughtTokens;

    /** Feeds one response object (or one SSE "data:" chunk). */
    public void feed(JSONObject o) {
        JSONObject fb = o.optJSONObject("promptFeedback");
        if (fb != null && fb.optString("blockReason", "").length() > 0) blockReason = fb.optString("blockReason");
        JSONObject usage = o.optJSONObject("usageMetadata");
        if (usage != null) thoughtTokens = Math.max(thoughtTokens, usage.optInt("thoughtsTokenCount", 0));
        JSONArray cands = o.optJSONArray("candidates");
        if (cands == null || cands.length() == 0) return;
        sawCandidate = true;
        JSONObject cand = cands.optJSONObject(0);
        if (cand == null) return;
        String fr = cand.optString("finishReason", "");
        if (fr.length() > 0) finishReason = fr;
        JSONObject content = cand.optJSONObject("content");
        JSONArray parts = content != null ? content.optJSONArray("parts") : null;
        for (int i = 0; parts != null && i < parts.length(); i++) {
            JSONObject p = parts.optJSONObject(i);
            if (p == null) continue;
            String t = p.optString("text", "");
            if (t.length() == 0) continue;
            if (p.optBoolean("thought", false)) thoughts.append(t);
            else text.append(t);
        }
    }

    /** Error message for a reply without text, or null when there is an answer. */
    public String error() {
        if (text.length() > 0) return null;
        if (!sawCandidate) {
            if (blockReason != null) return "Error: Gemini blocked this prompt (" + blockReason + ").";
            return "Error: Gemini returned no candidates.";
        }
        return "Error: Gemini returned no text (finish reason: " + (finishReason != null ? finishReason : "UNKNOWN") + ").";
    }

    /** The answer, with a note when it was cut off by the output token limit. */
    public String answer() {
        String a = text.toString();
        if ("MAX_TOKENS".equals(finishReason)) a += "\n\n*[Reply cut off: output token limit reached]*";
        return a;
    }

    /** Thought summary to keep with the reply; a note when the model thought but sent no summary. */
    public String thoughtsForDisplay() {
        String t = thoughts.toString().trim();
        if (t.length() == 0 && thoughtTokens > 0) {
            return "_The model thought (" + thoughtTokens + " tokens) but sent no summary for this reply._";
        }
        return t;
    }

    /**
     * thinkingConfig.thinkingLevel for a model, or null for the model's default. Levels a model doesn't accept are moved
     * to the nearest one it does (ai.google.dev thinking docs, 2026-11-19):
     * - Gemma 4: only "minimal" (off) or "high".
     * - Gemini 4 Hydrogen / Neon: low, medium, high, xhigh (no minimal).
     * - Gemini 4 Carbon / Argon, 3.8 Flash, 3.1 Pro, 2.5: low, medium, high (no minimal, no xhigh).
     * - Gemini 3 Pro: low, high (no minimal, medium, xhigh).
     * - Gemini 3.6 Flash, 3.5/3.1 Flash-Lite, 3 Flash, -latest aliases: minimal, low, medium, high (no xhigh).
     */
    public static String levelFor(String model, String level) {
        if (level == null || level.length() == 0) return null;
        if (model == null) return level;
        if (model.startsWith("gemma-")) {
            return "minimal".equals(level) || "low".equals(level) ? "minimal" : "high";
        }
        boolean noXhigh = model.startsWith("gemini-4-carbon") || model.startsWith("gemini-4-argon")
                || model.startsWith("gemini-3") || model.startsWith("gemini-2")
                || model.startsWith("gemini-flash-") || model.startsWith("gemini-pro-");
        if ("xhigh".equals(level) && noXhigh) level = "high";
        boolean noMinimal = model.startsWith("gemini-4-") || model.startsWith("gemini-3.8-flash")
                || model.startsWith("gemini-3.1-pro") || model.startsWith("gemini-3-pro")
                || model.startsWith("gemini-2.5-");
        if ("minimal".equals(level) && noMinimal) level = "low";
        if ("medium".equals(level) && model.startsWith("gemini-3-pro")) level = "high";
        return level;
    }
}
