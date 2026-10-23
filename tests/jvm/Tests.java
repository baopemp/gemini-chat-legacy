import java.io.*;
import java.lang.reflect.*;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;
import java.util.TimeZone;

public class Tests {
    static int pass = 0, fail = 0;
    static sun.misc.Unsafe U;

    static void check(String name, boolean ok, Object detail) {
        if (ok) pass++; else { fail++; System.out.println("FAIL " + name + " -> " + detail); }
    }

    static Method m(Class<?> c, String n, Class<?>... p) throws Exception {
        Method x = c.getDeclaredMethod(n, p); x.setAccessible(true); return x;
    }
    static Object field(Object o, String n) throws Exception {
        Field f = o.getClass().getDeclaredField(n); f.setAccessible(true); return f.get(o);
    }
    static void setField(Class<?> c, Object o, String n, Object v) throws Exception {
        Field f = c.getDeclaredField(n); f.setAccessible(true); f.set(o, v);
    }
    static Object field2(Class<?> c, String n) throws Exception {
        Field f = c.getDeclaredField(n); f.setAccessible(true); return f.get(null);
    }

    public static void main(String[] args) throws Exception {
        Field uf = sun.misc.Unsafe.class.getDeclaredField("theUnsafe"); uf.setAccessible(true);
        U = (sun.misc.Unsafe) uf.get(null);
        String emojiTsv = args[0];

        // ---------- 1. EmojiMap: every entry of the shipped table converts to its own short code ----------
        Class<?> em = Class.forName("com.gemini.chat.EmojiMap");
        Method load = m(em, "load", InputStream.class);
        Method convert = m(em, "convert", String.class);
        try (InputStream fin = new FileInputStream(emojiTsv)) { load.invoke(null, fin); }
        List<String[]> table = new ArrayList<>();
        for (String line : java.nio.file.Files.readAllLines(new File(emojiTsv).toPath(), StandardCharsets.UTF_8)) {
            int tab = line.indexOf('\t'); if (tab > 0) table.add(new String[]{line.substring(0, tab), line.substring(tab + 1)});
        }
        check("emoji table size >= 5200", table.size() >= 5200, table.size());
        int bad = 0;
        for (String[] e : table) {
            String out = (String) convert.invoke(null, "a" + e[0] + "b");
            if (!out.equals("a:" + e[1] + ":b")) { bad++; if (bad < 5) System.out.println("emoji mismatch " + e[1] + " -> " + out); }
        }
        check("all " + table.size() + " emoji convert exactly (longest match)", bad == 0, bad);
        String[][] emojiCases = {
            {"Xin chào! Tiếng Việt có dấu: ạ ả ã ố ư ơ đ — “quotes” → arrows", "Xin chào! Tiếng Việt có dấu: ạ ả ã ố ư ơ đ — “quotes” → arrows"},
            {"plain 12 and #hashtag *stars*", "plain 12 and #hashtag *stars*"},
            {"1️⃣ #️⃣", ":one: :hash:"},
            {"👍🏽", ":thumbsup_tone3:"},
            {"😂🎉", ":joy::tada:"},
            {"❤ ❤️", ":heart: :heart:"},
            {"🫩", ":face_with_bags_under_eyes:"},
            {"🏴󠁧󠁢󠁥󠁮󠁧󠁿", ":england:"},
            {"👨‍👩‍👧", ":family_man_woman_girl:"},
            {"stray️ joiner‍", "stray joiner"},
        };
        for (String[] c : emojiCases) {
            String out = (String) convert.invoke(null, c[0]);
            check("emoji " + c[1], c[1].equals(out), out);
        }

        // ---------- 1b. Markdown model ----------
        Class<?> md = Class.forName("com.gemini.chat.Markdown");
        Method parse = m(md, "parse", String.class, int.class);
        Class<?> docC = Class.forName("com.gemini.chat.Markdown$Doc");
        Class<?> spanC = Class.forName("com.gemini.chat.Markdown$Span");
        Field fText = docC.getField("text"), fSpans = docC.getField("spans"), fCode = docC.getField("codeBlocks");
        Field sStart = spanC.getField("start"), sEnd = spanC.getField("end"), sType = spanC.getField("type"),
              sLevel = spanC.getField("level"), sArg = spanC.getField("arg");
        java.util.function.BiFunction<String, Integer, Object> P = (src, w) -> { try { return parse.invoke(null, src, w); } catch (Exception e) { throw new RuntimeException(e); } };
        java.util.function.Function<Object, String> T = d -> { try { return fText.get(d).toString(); } catch (Exception e) { throw new RuntimeException(e); } };
        // spans of a type as "covered text" strings
        java.util.function.BiFunction<Object, String, List<String>> S = (d, typeName) -> {
            try {
                int type = md.getField(typeName).getInt(null); String text = fText.get(d).toString(); List<String> out = new ArrayList<>();
                for (Object sp : (List<?>) fSpans.get(d)) if (sType.getInt(sp) == type) out.add(text.substring(sStart.getInt(sp), sEnd.getInt(sp)));
                return out;
            } catch (Exception e) { throw new RuntimeException(e); }
        };
        Object d1 = P.apply("Plain **bold**, *italic*, ***both***, __b2__, _i2_, ~~gone~~ and `in *code* x`.", 30);
        check("md text", T.apply(d1).equals("Plain bold, italic, both, b2, i2, gone and in *code* x."), T.apply(d1));
        check("md bold", S.apply(d1, "BOLD").equals(Arrays.asList("bold", "b2")), S.apply(d1, "BOLD"));
        check("md italic", S.apply(d1, "ITALIC").equals(Arrays.asList("italic", "i2")), S.apply(d1, "ITALIC"));
        check("md bold-italic", S.apply(d1, "BOLD_ITALIC").equals(Arrays.asList("both")), S.apply(d1, "BOLD_ITALIC"));
        check("md strike", S.apply(d1, "STRIKE").equals(Arrays.asList("gone")), S.apply(d1, "STRIKE"));
        check("md code keeps *", S.apply(d1, "CODE").equals(Arrays.asList("in *code* x")), S.apply(d1, "CODE"));
        Object d2 = P.apply("2 * 3 * 4 = 24, snake_case_name, :white_check_mark: and \\*escaped\\*", 30);
        check("md no false emphasis", S.apply(d2, "ITALIC").isEmpty() && S.apply(d2, "BOLD").isEmpty(), fSpans.get(d2));
        check("md escapes", T.apply(d2).endsWith("and *escaped*"), T.apply(d2));
        Object d3 = P.apply("See [the docs](https://ai.google.dev/x?a=1&b=2 \"title\") or https://example.com/y.", 30);
        List<?> sp3 = (List<?>) fSpans.get(d3);
        check("md link label", S.apply(d3, "LINK").equals(Arrays.asList("the docs", "https://example.com/y")), S.apply(d3, "LINK"));
        check("md link url", sArg.get(sp3.get(0)).equals("https://ai.google.dev/x?a=1&b=2"), sArg.get(sp3.get(0)));
        check("md autolink drops trailing dot", T.apply(d3).endsWith("https://example.com/y."), T.apply(d3));
        Object d4 = P.apply("# H1\n### H3 ###\n- a\n  - b\n    - c\n* d\n1. one\n   2) two\n- [x] done\n- [ ] todo", 30);
        check("md headings", S.apply(d4, "HEADING").equals(Arrays.asList("H1", "H3")), S.apply(d4, "HEADING"));
        List<Integer> levels = new ArrayList<>(); List<String> markers = new ArrayList<>();
        for (Object sp : (List<?>) fSpans.get(d4)) if (sType.getInt(sp) == md.getField("LIST_ITEM").getInt(null)) { levels.add(sLevel.getInt(sp)); markers.add(((String) sArg.get(sp)).trim()); }
        check("md list levels", levels.equals(Arrays.asList(0, 1, 2, 0, 0, 1, 0, 0)), levels);
        check("md list markers", markers.equals(Arrays.asList("•", "▪", "–", "•", "1.", "2.", "[x]", "[ ]")), markers);
        check("md task done", S.apply(d4, "TASK_DONE").equals(Arrays.asList("done")), S.apply(d4, "TASK_DONE"));
        Object d5 = P.apply("Intro\n\n```python\ndef f(x):\n    return x * 2  # *not italic*\n```\n\n> q1\n>> q2\n\n---\nend", 30);
        check("md code block captured", ((List<?>) fCode.get(d5)).equals(Arrays.asList("def f(x):\n    return x * 2  # *not italic*")), fCode.get(d5));
        check("md code lang", S.apply(d5, "CODE_LANG").equals(Arrays.asList("python")), S.apply(d5, "CODE_LANG"));
        check("md no italic in code block", S.apply(d5, "ITALIC").isEmpty(), S.apply(d5, "ITALIC"));
        check("md nested quote = 2 quote spans", S.apply(d5, "QUOTE").size() == 2, S.apply(d5, "QUOTE"));
        check("md rule", S.apply(d5, "RULE").size() == 1, S.apply(d5, "RULE"));
        String tbl = "| A | B |\n|---|---|\n| 1 | 2 |\n| 3 | 4 |";
        check("md small table -> grid", S.apply(P.apply(tbl, 30), "TABLE_GRID").size() == 1, "");
        check("md narrow screen -> cards", S.apply(P.apply(tbl, 4), "TABLE_TITLE").equals(Arrays.asList("▪ 1", "▪ 3")), S.apply(P.apply(tbl, 4), "TABLE_TITLE"));
        Object d6 = P.apply("Hi 😀 there", 30);
        check("md emoji span", S.apply(d6, "EMOJI").equals(Arrays.asList(":grinning:")) && T.apply(d6).equals("Hi :grinning: there"), T.apply(d6));
        check("md no trailing newline", !T.apply(d5).endsWith("\n"), "");
        check("md null safe", T.apply(P.apply(null, 30)).isEmpty(), "");

        // ---------- 1c. Time grounding text ----------
        Class<?> tg = Class.forName("com.gemini.chat.TimeGrounding");
        Method describe = m(tg, "describe", long.class, TimeZone.class);
        String g = (String) describe.invoke(null, 1792685187791L, TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
        check("grounding exact", g.equals("Current date and time: Thursday, 2026-10-22T23:06:27.791+07:00; Unix: 1792685187791ms"), g);
        String gNY = (String) describe.invoke(null, 1792685187791L, TimeZone.getTimeZone("America/New_York"));
        check("grounding DST offset", gNY.equals("Current date and time: Thursday, 2026-10-22T12:06:27.791-04:00; Unix: 1792685187791ms"), gNY);
        String gNeg = (String) describe.invoke(null, 1830297600000L, TimeZone.getTimeZone("America/St_Johns"));
        check("grounding half-hour negative offset", gNeg.equals("Current date and time: Friday, 2027-12-31T20:30:00.000-03:30; Unix: 1830297600000ms"), gNeg);

        // ---------- 1d. Thumbnail base64 decoder (API-7 safe) vs java.util.Base64 ----------
        Method b64 = m(Class.forName("com.gemini.chat.Thumbnail"), "decodeBase64", String.class, int.class);
        Random rnd = new Random(7); int b64bad = 0;
        for (int len = 0; len < 300; len++) {
            byte[] raw = new byte[len]; rnd.nextBytes(raw);
            String enc = "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(raw);
            byte[] dec = (byte[]) b64.invoke(null, enc, enc.indexOf(',') + 1);
            if (!Arrays.equals(raw, dec)) b64bad++;
            String url = java.util.Base64.getUrlEncoder().withoutPadding().encodeToString(raw);
            if (!Arrays.equals(raw, (byte[]) b64.invoke(null, url, 0))) b64bad++;
            String mime = java.util.Base64.getMimeEncoder().encodeToString(raw); // with CRLF line breaks
            if (!Arrays.equals(raw, (byte[]) b64.invoke(null, mime, 0))) b64bad++;
        }
        check("base64 decoder matches java.util.Base64 (900 cases)", b64bad == 0, b64bad);

        // ---------- 2. GeminiTask helpers ----------
        Class<?> gt = Class.forName("com.gemini.chat.ChatActivity$GeminiTask");
        Class<?> ca = Class.forName("com.gemini.chat.ChatActivity");
        Method toInline = m(ca, "toInlineData", String.class);
        JSONObject in = (JSONObject) toInline.invoke(null, "data:image/jpeg;base64,QUJD/+==");
        check("inlineData mime", in.getJSONObject("inlineData").getString("mimeType").equals("image/jpeg"), in);
        check("inlineData data", in.getJSONObject("inlineData").getString("data").equals("QUJD/+=="), in);
        check("inlineData malformed", toInline.invoke(null, "data:;base64,xx") == null, "");
        check("inlineData no comma", toInline.invoke(null, "data:image/png;base64") == null, "");

        Method readAll = m(ca, "readAll", InputStream.class);
        check("readAll null", "".equals(readAll.invoke(null, (Object) null)), "");
        String txt = "héllo\nworld 😀" + "x".repeat(5000);
        check("readAll utf8", txt.equals(readAll.invoke(null, new ByteArrayInputStream(txt.getBytes(StandardCharsets.UTF_8)))), "");

        Method parseResp = m(gt, "parseResponse", String.class);
        Method parseErr = m(gt, "parseError", int.class, String.class);
        Object[][] respCases = {
            {"{\"candidates\":[{\"content\":{\"role\":\"model\",\"parts\":[{\"text\":\"Hello \"},{\"text\":\"world\"}]},\"finishReason\":\"STOP\"}]}", "Hello world", false},
            {"{\"candidates\":[{\"content\":{\"parts\":[{\"text\":\"thinking...\",\"thought\":true},{\"text\":\"Answer\",\"thoughtSignature\":\"abc\"}]},\"finishReason\":\"STOP\"}]}", "Answer", false},
            {"{\"candidates\":[{\"content\":{\"parts\":[{\"thoughtSignature\":\"abc\"},{\"text\":\"After sig\"}]}}]}", "After sig", false},
            {"{\"candidates\":[{\"content\":{\"parts\":[{\"text\":\"Partial\"}]},\"finishReason\":\"MAX_TOKENS\"}]}", "Partial\n\n*[Reply cut off: output token limit reached]*", false},
            {"{\"promptFeedback\":{\"blockReason\":\"SAFETY\"}}", "Error: Gemini blocked this prompt (SAFETY).", true},
            {"{\"candidates\":[]}", "Error: Gemini returned no candidates.", true},
            {"{\"candidates\":[{\"finishReason\":\"SAFETY\"}]}", "Error: Gemini returned no text (finish reason: SAFETY).", true},
            {"{\"candidates\":[{\"content\":{\"parts\":[{\"text\":\"Error handling in Java uses try/catch.\"}]},\"finishReason\":\"STOP\"}]}", "Error handling in Java uses try/catch.", false},
        };
        for (Object[] c : respCases) {
            Object task = U.allocateInstance(gt);
            String out = (String) parseResp.invoke(task, c[0]);
            boolean failed = (Boolean) field(task, "failed");
            check("parseResponse " + c[1], c[1].equals(out) && failed == (Boolean) c[2], out + " failed=" + failed);
        }
        Object task = U.allocateInstance(gt);
        String e1 = (String) parseErr.invoke(task, 400, "{\"error\":{\"code\":400,\"message\":\"API key not valid. Please pass a valid API key.\",\"status\":\"INVALID_ARGUMENT\"}}");
        check("parseError json", e1.equals("Error 400: API key not valid. Please pass a valid API key.") && (Boolean) field(task, "failed"), e1);
        String e2 = (String) parseErr.invoke(U.allocateInstance(gt), 502, "<html>Bad Gateway</html>");
        check("parseError html", e2.equals("Error 502: <html>Bad Gateway</html>"), e2);
        String e3 = (String) parseErr.invoke(U.allocateInstance(gt), 500, "");
        check("parseError empty", e3.equals("Error 500: "), e3);

        // buildBody against a fake DB
        Class<?> fake = Class.forName("com.gemini.chat.FakeDb");
        Object db = U.allocateInstance(fake);
        Object act = U.allocateInstance(ca);
        setField(ca, act, "dbHelper", db);
        Object t2 = U.allocateInstance(gt);
        setField(gt, t2, "this$0", act);
        Field rowsF = fake.getField("rows");
        rowsF.set(null, Arrays.asList(
            new String[]{"user", "Describe this", "data:image/jpeg;base64,AAAA"},
            new String[]{"model", "A cat.", "gemini-3.8-flash"},
            new String[]{"system", "Error 500: boom", null},
            new String[]{"user", "first", null},
            new String[]{"user", "second", "data:image/png;base64,BBBB"},
            new String[]{"model", "ok", "gemini-3.8-flash"},
            new String[]{"user", null, "content://not/an/image"}
        ));
        Method build = m(gt, "buildBody", String.class);
        String body = (String) build.invoke(t2, "Be brief.");
        JSONObject bj = new JSONObject(body);
        JSONArray cs = bj.getJSONArray("contents");
        check("sys instruction", bj.getJSONObject("systemInstruction").getJSONArray("parts").getJSONObject(0).getString("text").equals("Be brief."), body);
        check("5 turns (system dropped, users merged)", cs.length() == 5, cs.length());
        check("turn0 user text+image", cs.getJSONObject(0).getString("role").equals("user")
                && cs.getJSONObject(0).getJSONArray("parts").length() == 2
                && cs.getJSONObject(0).getJSONArray("parts").getJSONObject(1).getJSONObject("inlineData").getString("data").equals("AAAA"), cs.getJSONObject(0));
        check("turn1 model text only", cs.getJSONObject(1).getJSONArray("parts").length() == 1, cs.getJSONObject(1));
        JSONArray mp = cs.getJSONObject(2).getJSONArray("parts");
        check("merged user turn", mp.getJSONObject(0).getString("text").equals("first\n\nsecond") && mp.length() == 2
                && mp.getJSONObject(1).getJSONObject("inlineData").getString("mimeType").equals("image/png"), mp);
        check("null content -> empty text, non-image model col ignored", cs.getJSONObject(4).getJSONArray("parts").length() == 1
                && cs.getJSONObject(4).getJSONArray("parts").getJSONObject(0).getString("text").equals(""), cs.getJSONObject(4));
        check("cursor closed", fake.getField("closed").getInt(null) == 1, "");
        String body2 = (String) build.invoke(t2, "   ");
        check("blank sys instruction omitted", !new JSONObject(body2).has("systemInstruction"), body2);

        // 0.8.6: image-only messages (empty text) -> no empty text part; merged turns skip empty texts
        rowsF.set(null, Arrays.asList(
            new String[]{"user", "", "data:image/jpeg;base64,CCCC"},
            new String[]{"model", "A dog.", "gemini-3.5-flash-lite"},
            new String[]{"user", "", "data:image/png;base64,DDDD"},
            new String[]{"user", "and this?", null}
        ));
        JSONArray c3 = new JSONObject((String) build.invoke(t2, "")).getJSONArray("contents");
        check("image-only turn has only inlineData", c3.getJSONObject(0).getJSONArray("parts").length() == 1
                && c3.getJSONObject(0).getJSONArray("parts").getJSONObject(0).has("inlineData"), c3.getJSONObject(0));
        JSONArray p3 = c3.getJSONObject(2).getJSONArray("parts");
        check("merged image-only + text", c3.length() == 3 && p3.length() == 2
                && p3.getJSONObject(0).getString("text").equals("and this?") && p3.getJSONObject(1).has("inlineData"), p3);

        Method retryable = m(ca, "retryable", int.class);
        check("retry on 500/502/503/504 only", (Boolean) retryable.invoke(null, 503) && (Boolean) retryable.invoke(null, 500)
                && (Boolean) retryable.invoke(null, 502) && (Boolean) retryable.invoke(null, 504)
                && !(Boolean) retryable.invoke(null, 429) && !(Boolean) retryable.invoke(null, 400)
                && !(Boolean) retryable.invoke(null, 200), "");

        // 0.8.6: model list order / default / custom model ids
        Class<?> sa = Class.forName("com.gemini.chat.SettingsActivity");
        String[] models = (String[]) field2(sa, "MODELS");
        check("free models in order", Arrays.asList(models).equals(Arrays.asList("gemini-3.8-flash", "gemini-3.6-flash",
                "gemini-3.5-flash-lite", "gemini-3.1-flash-lite", "gemini-3-flash-preview", "gemini-flash-latest",
                "gemini-flash-lite-latest", "gemma-4-31b-it", "gemma-4-26b-a4b-it")), Arrays.toString(models));
        check("default model 3.5-flash-lite", "gemini-3.5-flash-lite".equals(field2(ca, "DEFAULT_MODEL")), field2(ca, "DEFAULT_MODEL"));
        Method norm = m(sa, "normalizeModel", String.class);
        check("custom model: models/ prefix stripped", "gemini-3.8-pro".equals(norm.invoke(null, " models/gemini-3.8-pro ")), "");
        check("custom model: plain id kept", "gemini-2.5-pro-preview-06-05".equals(norm.invoke(null, "gemini-2.5-pro-preview-06-05")), "");
        check("custom model: rejects empty/space/slash", norm.invoke(null, "  ") == null && norm.invoke(null, "gemini 3") == null
                && norm.invoke(null, "a/b") == null && norm.invoke(null, (Object) null) == null, "");

        // ---------- 2a. Thinking / streaming reply parser (0.8.6) ----------
        Class<?> rp = Class.forName("com.gemini.chat.ReplyParser");
        Object parser = rp.getConstructor().newInstance();
        Method feed = m(rp, "feed", JSONObject.class);
        String[] sse = {
            "{\"candidates\":[{\"content\":{\"role\":\"model\",\"parts\":[{\"text\":\"**Plan** think \",\"thought\":true}]}}]}",
            "{\"candidates\":[{\"content\":{\"role\":\"model\",\"parts\":[{\"text\":\"more.\",\"thought\":true}]}}]}",
            "{\"candidates\":[{\"content\":{\"role\":\"model\",\"parts\":[{\"text\":\"Hello \",\"thoughtSignature\":\"sig\"}]}}]}",
            "{\"candidates\":[{\"content\":{\"role\":\"model\",\"parts\":[{\"text\":\"world\"}]},\"finishReason\":\"STOP\"}],\"usageMetadata\":{\"thoughtsTokenCount\":12}}"};
        for (String ch : sse) feed.invoke(parser, new JSONObject(ch));
        check("stream: thoughts kept apart from answer", "**Plan** think more.".equals(((StringBuffer) field(parser, "thoughts")).toString())
                && "Hello world".equals(m(rp, "answer").invoke(parser)) && m(rp, "error").invoke(parser) == null, "");
        Object p2 = rp.getConstructor().newInstance();
        feed.invoke(p2, new JSONObject("{\"candidates\":[{\"content\":{\"parts\":[{\"text\":\"only thinking\",\"thought\":true}]},\"finishReason\":\"MAX_TOKENS\"}]}"));
        check("stream: thoughts but no answer -> error", "Error: Gemini returned no text (finish reason: MAX_TOKENS).".equals(m(rp, "error").invoke(p2)), m(rp, "error").invoke(p2));
        Object pNo = rp.getConstructor().newInstance();
        feed.invoke(pNo, new JSONObject("{\"candidates\":[{\"content\":{\"parts\":[{\"text\":\"Yes.\"}]},\"finishReason\":\"STOP\"}],\"usageMetadata\":{\"thoughtsTokenCount\":209}}"));
        check("thought without summary -> note", "_The model thought (209 tokens) but sent no summary for this reply._".equals(m(rp, "thoughtsForDisplay").invoke(pNo))
                && "**Plan** think more.".equals(m(rp, "thoughtsForDisplay").invoke(parser)), m(rp, "thoughtsForDisplay").invoke(pNo));
        Method lvl = m(rp, "levelFor", String.class, String.class);
        check("thinking level mapping", lvl.invoke(null, "gemini-3.8-flash", "") == null && "low".equals(lvl.invoke(null, "gemini-3.8-flash", "minimal"))
                && "minimal".equals(lvl.invoke(null, "gemini-3.6-flash", "minimal")) && "high".equals(lvl.invoke(null, "gemini-3-flash-preview", "high"))
                && "minimal".equals(lvl.invoke(null, "gemma-4-31b-it", "low")) && "high".equals(lvl.invoke(null, "gemma-4-26b-a4b-it", "medium"))
                && lvl.invoke(null, "gemma-4-31b-it", "") == null, "");
        Object t3 = U.allocateInstance(gt);
        setField(gt, t3, "this$0", act);
        setField(gt, t3, "thinkingLevel", "medium");
        setField(gt, t3, "includeThoughts", true);
        JSONObject b3 = new JSONObject((String) build.invoke(t3, ""));
        check("thinkingConfig in request", b3.getJSONObject("generationConfig").getJSONObject("thinkingConfig").getString("thinkingLevel").equals("medium")
                && b3.getJSONObject("generationConfig").getJSONObject("thinkingConfig").getBoolean("includeThoughts"), b3.optJSONObject("generationConfig"));
        check("no generationConfig by default", !new JSONObject((String) build.invoke(t2, "")).has("generationConfig"), "");

        // auto-naming (0.8.6)
        JSONObject tr = new JSONObject((String) m(ca, "titleRequest", String.class, String.class).invoke(null, "Is 391 prime?", "No, 17 x 23."));
        check("title request: one user turn, minimal thinking", tr.getJSONArray("contents").length() == 1
                && tr.getJSONArray("contents").getJSONObject(0).getJSONArray("parts").getJSONObject(0).getString("text").contains("User: Is 391 prime?")
                && tr.getJSONObject("generationConfig").getJSONObject("thinkingConfig").getString("thinkingLevel").equals("minimal"), tr);
        Method clean = m(ca, "cleanTitle", String.class);
        check("cleanTitle", "Prime Check for 391".equals(clean.invoke(null, "**\"Prime Check for 391.\"**\n"))
                && "Kiểm tra số nguyên tố".equals(clean.invoke(null, "Title: Kiểm tra số nguyên tố"))
                && clean.invoke(null, "  ** ") == null
                && ((String) clean.invoke(null, "x".repeat(60))).length() == 43, clean.invoke(null, "**\"Prime Check for 391.\"**\n"));

        // ---------- 2b. Live: Base64, WebSocket client, Live protocol (0.8.6) ----------
        Class<?> b64c = Class.forName("com.gemini.chat.B64");
        Method enc = m(b64c, "encode", byte[].class, int.class, int.class), dec = m(b64c, "decode", String.class);
        java.util.Random rnd7 = new java.util.Random(7); int b64fail = 0;
        for (int n = 0; n < 700; n++) {
            byte[] raw = new byte[n]; rnd7.nextBytes(raw);
            String e = (String) enc.invoke(null, raw, 0, n);
            if (!e.equals(java.util.Base64.getEncoder().encodeToString(raw))) b64fail++;
            if (!Arrays.equals(raw, (byte[]) dec.invoke(null, e))) b64fail++;
        }
        check("B64 encode/decode == java.util.Base64 (0..699 bytes)", b64fail == 0, b64fail);
        Class<?> lsock = Class.forName("com.gemini.chat.LiveSocket");
        check("WebSocket accept key (RFC 6455 example)", "s3pPLMBiTxaQ9kYGzzhZRbK+xOo=".equals(m(lsock, "acceptFor", String.class).invoke(null, "dGhlIHNhbXBsZSBub25jZQ==")), "");
        check("WebSocket loopback (handshake, mask, fragments, ping, 64-bit length, close code)", WsLoopback.run(), "");

        Class<?> lsess = Class.forName("com.gemini.chat.LiveSession");
        Class<?> lis = Class.forName("com.gemini.chat.LiveSession$Listener");
        final StringBuilder ev = new StringBuilder();
        Object listener = java.lang.reflect.Proxy.newProxyInstance(lis.getClassLoader(), new Class[]{lis}, (px, mm, aa) -> {
            ev.append(mm.getName()).append(aa == null ? "" : aa[0] instanceof byte[] ? "[" + ((byte[]) aa[0]).length + "]" : "(" + aa[0] + ")").append(';');
            return null;
        });
        Object sess = lsess.getConstructor(String.class, String.class, String.class, String.class, boolean.class, lis)
                .newInstance("KEY", "gemini-3.8-live", "Kore", "Be brief.", false, listener);
        JSONObject setup = new JSONObject((String) m(lsess, "setupMessage").invoke(sess)).getJSONObject("setup");
        check("live setup: model, AUDIO, voice, transcriptions, manual VAD", setup.getString("model").equals("models/gemini-3.8-live")
                && setup.getJSONObject("generationConfig").getJSONArray("responseModalities").getString(0).equals("AUDIO")
                && setup.getJSONObject("generationConfig").getJSONObject("speechConfig").getJSONObject("voiceConfig").getJSONObject("prebuiltVoiceConfig").getString("voiceName").equals("Kore")
                && setup.has("inputAudioTranscription") && setup.has("outputAudioTranscription")
                && setup.getJSONObject("realtimeInputConfig").getJSONObject("automaticActivityDetection").getBoolean("disabled")
                && !setup.has("historyConfig") && setup.has("contextWindowCompression") && setup.has("sessionResumption")
                && setup.getJSONObject("systemInstruction").getJSONArray("parts").getJSONObject(0).getString("text").equals("Be brief."), setup);
        Object sessHf = lsess.getConstructor(String.class, String.class, String.class, String.class, boolean.class, lis)
                .newInstance("KEY", "models/gemini-3.8-live-extended-thinking", "Puck", "", true, listener);
        setField(lsess, sessHf, "thinkingLevel", "low");
        setField(lsess, sessHf, "history", new String[][]{{"user", "hi"}, {"system", "Error"}, {"user", "again"}, {"model", "hello"}, {"user", ""}});
        JSONObject s2 = new JSONObject((String) m(lsess, "setupMessage").invoke(sessHf)).getJSONObject("setup");
        check("live setup: hands-free, thinking level, history config", s2.getString("model").equals("models/gemini-3.8-live-extended-thinking")
                && !s2.has("realtimeInputConfig") && !s2.has("systemInstruction")
                && s2.getJSONObject("generationConfig").getJSONObject("thinkingConfig").getString("thinkingLevel").equals("low")
                && s2.getJSONObject("historyConfig").getBoolean("initialHistoryInClientContent"), s2);
        JSONObject hm = new JSONObject((String) m(lsess, "historyMessage").invoke(sessHf)).getJSONObject("clientContent");
        check("live history: user/model text only, merged, turnComplete", hm.getJSONArray("turns").length() == 2 && hm.getBoolean("turnComplete")
                && hm.getJSONArray("turns").getJSONObject(0).getJSONArray("parts").getJSONObject(0).getString("text").equals("hi\n\nagain")
                && hm.getJSONArray("turns").getJSONObject(1).getString("role").equals("model"), hm);
        Object resumed = lsess.getConstructor(String.class, String.class, String.class, String.class, boolean.class, lis)
                .newInstance("KEY", "gemini-3.8-live", "Kore", "", false, listener);
        setField(lsess, resumed, "resumeHandle", "h123");
        setField(lsess, resumed, "history", new String[][]{{"user", "hi"}});
        JSONObject s3 = new JSONObject((String) m(lsess, "setupMessage").invoke(resumed)).getJSONObject("setup");
        check("live resume: handle sent, no history", s3.getJSONObject("sessionResumption").getString("handle").equals("h123")
                && !s3.has("historyConfig") && m(lsess, "historyMessage").invoke(resumed) == null, s3);
        Object trs = m(lsess, "transcriber", String.class, boolean.class, lis).invoke(null, "KEY", true, listener);
        JSONObject s4 = new JSONObject((String) m(lsess, "setupMessage").invoke(trs)).getJSONObject("setup");
        check("transcriber setup: transcribe-live, TEXT, input transcription", s4.getString("model").equals("models/gemini-3.5-transcribe-live")
                && s4.getJSONObject("generationConfig").getJSONArray("responseModalities").getString(0).equals("TEXT")
                && s4.has("inputAudioTranscription") && !s4.has("outputAudioTranscription") && !s4.has("realtimeInputConfig")
                && !s4.has("systemInstruction"), s4);
        check("needsThinkingLevel", (Boolean) m(lsess, "needsThinkingLevel", String.class).invoke(null, "gemini-3.8-live-extended-thinking")
                && !(Boolean) m(lsess, "needsThinkingLevel", String.class).invoke(null, "gemini-3.8-live"), "");
        Method dispatch = m(lsess, "dispatch", String.class);
        dispatch.invoke(sess, "{\"serverContent\":{\"inputTranscription\":{\"text\":\"How many legs\"}}}");
        dispatch.invoke(sess, "{\"serverContent\":{\"modelTurn\":{\"parts\":[{\"text\":\"plan\",\"thought\":true},{\"inlineData\":{\"mimeType\":\"audio/pcm;rate=24000\",\"data\":\"AAECAwQ=\"}}]}}}");
        dispatch.invoke(sess, "{\"serverContent\":{\"outputTranscription\":{\"text\":\"Eight.\"}}}");
        dispatch.invoke(sess, "{\"serverContent\":{\"interrupted\":true}}");
        dispatch.invoke(sess, "{\"serverContent\":{\"turnComplete\":true,\"interactionStatus\":\"IDLE\"}}");
        dispatch.invoke(sess, "{\"goAway\":{\"timeLeft\":\"10s\"}}");
        dispatch.invoke(sess, "{\"sessionResumptionUpdate\":{\"newHandle\":\"abc\",\"resumable\":true}}");
        dispatch.invoke(sess, "{\"sessionResumptionUpdate\":{\"resumable\":false}}");
        check("goAway + resumption handle kept", (Boolean) field(sess, "goAway") && "abc".equals(field(sess, "lastHandle")), field(sess, "lastHandle"));
        dispatch.invoke(trs, "{\"serverContent\":{\"interimInputTranscription\":{\"text\":\"How many\"}}}");
        dispatch.invoke(sess, "{\"usageMetadata\":{\"totalTokenCount\":5}}");
        check("live dispatch events", ev.toString().equals("onInputText(How many legs);onAudio[5];onOutputText(Eight.);onInterrupted;onTurnComplete;onInterimInput(How many);"), ev);
        Class<?> la = Class.forName("com.gemini.chat.LiveActivity");
        String[] voices = (String[]) field2(la, "VOICES");
        check("30 voices, names parsed", voices.length == 30 && "Kore".equals(m(la, "voiceName", String.class).invoke(null, voices[3]))
                && "Sulafat".equals(m(la, "voiceName", String.class).invoke(null, voices[29])), voices.length);
        check("live models list", Arrays.asList((String[]) field2(la, "LIVE_MODELS")).equals(Arrays.asList("gemini-3.8-live",
                "gemini-3.8-live-extended-thinking", "gemini-3.1-flash-live-preview")), "");

        // ---------- 2c. inline math (0.8.7) ----------
        Class<?> mdc = Class.forName("com.gemini.chat.Markdown");
        Method tex = m(mdc, "texToText", String.class);
        check("tex: times, powers, frac, sqrt, greek, degree", "17 \u00D7 23 = 391".equals(tex.invoke(null, "17 \\times 23 = 391"))
                && "x\u00B2 + y\u00B2".equals(tex.invoke(null, "x^2 + y^2")) && "1/2 + (a+b)/c".equals(tex.invoke(null, "\\frac{1}{2} + \\frac{a+b}{c}"))
                && "\u221A2 \u2248 1.414".equals(tex.invoke(null, "\\sqrt{2} \\approx 1.414")) && "\u03B1 \u2264 \u03B2".equals(tex.invoke(null, "\\alpha \\le \\beta"))
                && "90\u00B0".equals(tex.invoke(null, "90^\\circ")) && "x^10".equals(tex.invoke(null, "x^{10}")) && "x^(n+1)".equals(tex.invoke(null, "x^{n+1}"))
                && "speed = d/t".equals(tex.invoke(null, "\\text{speed} = \\frac{d}{t}")) && "a_1 + a_n".equals(tex.invoke(null, "a_1 + a_{n}")), tex.invoke(null, "x^{10}"));
        Method mparse = m(mdc, "parse", String.class);
        String[][] mathCases = {
            {"It is $17 \\times 23 = 391$.", "It is 17 \u00D7 23 = 391."},
            {"Costs $5 and $10 today.", "Costs $5 and $10 today."},
            {"Pay $0.05 (ball) + $1.05 (bat)", "Pay $0.05 (ball) + $1.05 (bat)"},
            {"Range $5-$10", "Range $5-$10"},
            {"Let $x$ be real", "Let x be real"},
            {"$$E = mc^2$$", "E = mc\u00B2"},
            {"Price $US 5$ not math", "Price $US 5$ not math"},
        };
        int mathBad = 0;
        for (String[] mc : mathCases) {
            Object doc = mparse.invoke(null, mc[0]);
            String mtxt = field(doc, "text").toString().trim();
            if (!mtxt.equals(mc[1])) { mathBad++; System.out.println("  math: " + mc[0] + " -> " + mtxt); }
        }
        check("inline math converted, prices untouched", mathBad == 0, mathBad);

        // ---------- 3. ConfigManager import validation ----------
        Class<?> cm = Class.forName("com.gemini.chat.ConfigManager");
        Method readHead = m(cm, "readHead", File.class, int.class);
        Method valid = m(cm, "isValidBackup", Class.forName("android.content.Context"), File.class, boolean.class);
        Method writeStream = m(cm, "writeStream", InputStream.class, File.class);
        File dir = new File(System.getProperty("java.io.tmpdir"), "cmtest"); dir.mkdirs();
        File f1 = new File(dir, "a.bin");
        writeStream.invoke(null, new ByteArrayInputStream("SQLite format 3\0rest-of-file".getBytes(StandardCharsets.ISO_8859_1)), f1);
        check("writeStream+readHead", "SQLite format 3\0".equals(readHead.invoke(null, f1, 16)), readHead.invoke(null, f1, 16));
        File small = new File(dir, "s.bin");
        writeStream.invoke(null, new ByteArrayInputStream("abc".getBytes()), small);
        check("readHead short file", "abc".equals(readHead.invoke(null, small, 16)), "");
        File prefs = new File(dir, "p.xml");
        writeStream.invoke(null, new ByteArrayInputStream("<?xml version='1.0' encoding='utf-8' standalone='yes' ?>\n<map>\n<string name=\"api_key\">x</string>\n</map>".getBytes()), prefs);
        check("valid settings xml", (Boolean) valid.invoke(null, null, prefs, false), "");
        File jpg = new File(dir, "photo.jpg");
        writeStream.invoke(null, new ByteArrayInputStream(new byte[]{(byte) 0xFF, (byte) 0xD8, (byte) 0xFF, 0x00, 0x10}), jpg);
        check("jpg rejected as settings", !(Boolean) valid.invoke(null, null, jpg, false), "");
        check("jpg rejected as chat db", !(Boolean) valid.invoke(null, null, jpg, true), "");
        check("xml rejected as chat db", !(Boolean) valid.invoke(null, null, prefs, true), "");
        File big = new File(dir, "big.xml");
        byte[] bigData = new byte[1100000]; byte[] head = "<map>".getBytes(); System.arraycopy(head, 0, bigData, 0, head.length);
        writeStream.invoke(null, new ByteArrayInputStream(bigData), big);
        check("oversized settings rejected", !(Boolean) valid.invoke(null, null, big, false), "");

        System.out.println("PASS " + pass + " / FAIL " + fail);
        if (fail > 0) System.exit(1);
    }
}
