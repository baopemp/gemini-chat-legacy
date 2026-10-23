package com.gemini.chat;

import java.util.ArrayList;

/**
 * Markdown -> plain text + style ranges ("Doc"). Pure Java (no android.*), so it is unit-tested
 * on the JVM; MessageFormatter turns a Doc into Android spans.
 *
 * Blocks: ATX headings, paragraphs (single newlines kept), fenced code (``` / ~~~, with language),
 * block quotes (nested), bullet / numbered / task lists (nested by indentation), tables, rules.
 * Inline: **bold**, __bold__, *italic*, _italic_, ***both***, ~~strike~~, `code`, [links](url),
 * ![images](url), bare http(s) URLs, <autolinks>, backslash escapes. Emoji become ":shortcode:".
 */
public final class Markdown {

    // ---- span types ------------------------------------------------------------------------
    public static final int BOLD = 1, ITALIC = 2, BOLD_ITALIC = 3, STRIKE = 4, CODE = 5, LINK = 6,
            HEADING = 7, CODE_BLOCK = 8, CODE_LANG = 9, QUOTE = 10, LIST_ITEM = 11, LIST_CONT = 12,
            BULLET = 13, TASK_DONE = 14, RULE = 15, EMOJI = 16, TABLE_GRID = 17, TABLE_HEAD = 18,
            TABLE_TITLE = 19, TABLE_KEY = 20, MUTED = 21, GAP = 22, IMAGE = 23;

    public static final class Span {
        public final int start, end, type, level;
        public final String arg;

        Span(int start, int end, int type, int level, String arg) {
            this.start = start;
            this.end = end;
            this.type = type;
            this.level = level;
            this.arg = arg;
        }

        public String toString() {
            return type + "[" + start + "," + end + ")" + (level != 0 ? "L" + level : "") + (arg != null ? "=" + arg : "");
        }
    }

    public static final class Doc {
        public final StringBuilder text = new StringBuilder();
        public final ArrayList<Span> spans = new ArrayList<Span>();
        public final ArrayList<String> codeBlocks = new ArrayList<String>();
        int lastGapAt = -1;
        int gridMaxChars = GRID_MAX_WIDTH;

        void span(int start, int end, int type) {
            span(start, end, type, 0, null);
        }

        void span(int start, int end, int type, int level, String arg) {
            if (end > start) spans.add(new Span(start, end, type, level, arg));
        }

        int len() {
            return text.length();
        }

        /** Half-height empty line between blocks (never two in a row, never at the top). */
        void gap() {
            int n = text.length();
            if (n == 0 || lastGapAt == n) return;
            if (text.charAt(n - 1) != '\n') text.append('\n');
            int s = text.length();
            text.append('\n');
            span(s, s + 1, GAP);
            lastGapAt = text.length();
        }
    }

    private Markdown() {
    }

    public static Doc parse(String src) {
        return parse(src, GRID_MAX_WIDTH);
    }

    /** @param gridMaxChars widest monospace table (in characters) that fits the screen */
    public static Doc parse(String src, int gridMaxChars) {
        Doc d = new Doc();
        d.gridMaxChars = gridMaxChars;
        if (src == null) return d;
        String norm = src.replace("\r\n", "\n").replace('\r', '\n').replace("\t", "    ");
        String[] lines = norm.split("\n", -1);
        blocks(d, lines, 0, lines.length);
        // trim trailing newlines (spans past the end are clipped)
        int n = d.text.length();
        while (n > 0 && d.text.charAt(n - 1) == '\n') n--;
        d.text.setLength(n);
        ArrayList<Span> keep = new ArrayList<Span>(d.spans.size());
        for (int i = 0; i < d.spans.size(); i++) {
            Span s = d.spans.get(i);
            if (s.start >= n) continue;
            keep.add(s.end > n ? new Span(s.start, n, s.type, s.level, s.arg) : s);
        }
        d.spans.clear();
        d.spans.addAll(keep);
        return d;
    }

    /** Text without markdown processing, emoji converted (system messages). */
    public static Doc plain(String src) {
        Doc d = new Doc();
        if (src != null) appendText(d, src);
        return d;
    }

    // ---- blocks ----------------------------------------------------------------------------

    private static void blocks(Doc d, String[] L, int from, int to) {
        int i = from;
        while (i < to) {
            String line = L[i];
            String t = line.trim();
            if (t.length() == 0) {
                i++;
                continue;
            }
            if (fenceLen(t) > 0) {
                i = codeBlock(d, L, i, to);
            } else if (headingLevel(t) > 0) {
                heading(d, t);
                i++;
            } else if (isRule(t)) {
                d.gap();
                int s = d.len();
                d.text.append(' ').append('\n');
                d.span(s, d.len(), RULE);
                d.gap();
                i++;
            } else if (t.charAt(0) == '>') {
                i = quote(d, L, i, to);
            } else if (t.indexOf('|') >= 0 && i + 1 < to && isTableSep(L[i + 1].trim())) {
                i = table(d, L, i, to);
            } else if (listItem(line) != null) {
                i = list(d, L, i, to);
            } else {
                i = paragraph(d, L, i, to);
            }
        }
    }

    private static boolean startsBlock(String line, String next) {
        String t = line.trim();
        if (t.length() == 0) return true;
        return fenceLen(t) > 0 || headingLevel(t) > 0 || isRule(t) || t.charAt(0) == '>'
                || listItem(line) != null || (t.indexOf('|') >= 0 && next != null && isTableSep(next.trim()));
    }

    private static int paragraph(Doc d, String[] L, int i, int to) {
        d.gap();
        boolean first = true;
        while (i < to) {
            String next = i + 1 < to ? L[i + 1] : null;
            if (!first && startsBlock(L[i], next)) break;
            if (!first) d.text.append('\n');
            inline(d, L[i].trim());
            first = false;
            i++;
        }
        d.text.append('\n');
        return i;
    }

    private static int headingLevel(String t) {
        int n = 0;
        while (n < t.length() && t.charAt(n) == '#') n++;
        if (n == 0 || n > 6) return 0;
        if (n == t.length()) return n;
        return t.charAt(n) == ' ' ? n : 0;
    }

    private static void heading(Doc d, String t) {
        int level = headingLevel(t);
        String body = t.substring(level).trim();
        // optional closing #'s
        int e = body.length();
        while (e > 0 && body.charAt(e - 1) == '#') e--;
        if (e < body.length() && (e == 0 || body.charAt(e - 1) == ' ')) body = body.substring(0, e).trim();
        d.gap();
        int s = d.len();
        inline(d, body);
        d.span(s, d.len(), HEADING, level, null);
        d.text.append('\n');
    }

    private static boolean isRule(String t) {
        if (t.length() < 3) return false;
        char c = t.charAt(0);
        if (c != '-' && c != '*' && c != '_') return false;
        int count = 0;
        for (int k = 0; k < t.length(); k++) {
            char x = t.charAt(k);
            if (x == c) count++;
            else if (x != ' ') return false;
        }
        return count >= 3;
    }

    /** length of an opening fence (``` or ~~~, 3+) or 0 */
    private static int fenceLen(String t) {
        if (t.length() < 3) return 0;
        char c = t.charAt(0);
        if (c != '`' && c != '~') return 0;
        int n = 0;
        while (n < t.length() && t.charAt(n) == c) n++;
        if (n < 3) return 0;
        if (c == '`' && t.indexOf('`', n) >= 0) return 0; // ```inline``` is not a fence
        return n;
    }

    private static int codeBlock(Doc d, String[] L, int i, int to) {
        String open = L[i].trim();
        int fl = fenceLen(open);
        char fc = open.charAt(0);
        String lang = open.substring(fl).trim();
        int indent = L[i].indexOf(fc);
        StringBuilder raw = new StringBuilder();
        int j = i + 1;
        boolean firstLine = true;
        for (; j < to; j++) {
            String t = L[j].trim();
            if (t.length() >= fl && t.charAt(0) == fc) {
                int k = 0;
                while (k < t.length() && t.charAt(k) == fc) k++;
                if (k >= fl && k == t.length()) break;
            }
            String line = L[j];
            // remove the fence's own indentation from content lines
            int strip = 0;
            while (strip < indent && strip < line.length() && line.charAt(strip) == ' ') strip++;
            if (!firstLine) raw.append('\n');
            raw.append(line.substring(strip));
            firstLine = false;
        }
        d.gap();
        int blockStart = d.len();
        if (lang.length() > 0) {
            int s = d.len();
            d.text.append(lang);
            d.span(s, d.len(), CODE_LANG);
            d.text.append('\n');
        }
        int s = d.len();
        appendText(d, raw.toString());
        d.text.append('\n');
        d.span(s, d.len(), CODE_BLOCK);
        if (lang.length() > 0) d.span(blockStart, s, CODE_BLOCK);
        d.codeBlocks.add(raw.toString());
        return j < to ? j + 1 : j;
    }

    private static int quote(Doc d, String[] L, int i, int to) {
        ArrayList<String> inner = new ArrayList<String>();
        int j = i;
        while (j < to) {
            String t = L[j].trim();
            if (t.length() == 0 || t.charAt(0) != '>') break;
            String rest = t.substring(1);
            if (rest.length() > 0 && rest.charAt(0) == ' ') rest = rest.substring(1);
            inner.add(rest);
            j++;
        }
        d.gap();
        int s = d.len();
        String[] arr = inner.toArray(new String[inner.size()]);
        blocks(d, arr, 0, arr.length);
        if (d.len() > s && d.text.charAt(d.len() - 1) != '\n') d.text.append('\n');
        d.span(s, d.len(), QUOTE);
        return j;
    }

    // ---- tables ----------------------------------------------------------------------------

    private static boolean isTableSep(String t) {
        if (t.indexOf('-') < 0) return false;
        boolean pipe = t.indexOf('|') >= 0;
        for (int k = 0; k < t.length(); k++) {
            char c = t.charAt(k);
            if (c != '|' && c != '-' && c != ':' && c != ' ') return false;
        }
        return pipe || t.length() >= 3;
    }

    private static ArrayList<String> cells(String t) {
        t = t.trim();
        if (t.startsWith("|")) t = t.substring(1);
        if (t.endsWith("|") && !t.endsWith("\\|")) t = t.substring(0, t.length() - 1);
        ArrayList<String> out = new ArrayList<String>();
        StringBuilder cur = new StringBuilder();
        for (int k = 0; k < t.length(); k++) {
            char c = t.charAt(k);
            if (c == '\\' && k + 1 < t.length() && t.charAt(k + 1) == '|') {
                cur.append('|');
                k++;
            } else if (c == '|') {
                out.add(cur.toString().trim());
                cur.setLength(0);
            } else {
                cur.append(c);
            }
        }
        out.add(cur.toString().trim());
        return out;
    }

    private static boolean hasInlineMarkup(String s) {
        for (int k = 0; k < s.length(); k++) {
            char c = s.charAt(k);
            if (c == '*' || c == '_' || c == '`' || c == '[' || c == '~' || c == '\\' || c > 0x2000) return true;
        }
        return false;
    }

    /** default widest grid table (characters) when the caller doesn't know the screen width */
    static final int GRID_MAX_WIDTH = 30;

    private static int table(Doc d, String[] L, int i, int to) {
        ArrayList<String> head = cells(L[i]);
        ArrayList<ArrayList<String>> rows = new ArrayList<ArrayList<String>>();
        int j = i + 2;
        while (j < to) {
            String t = L[j].trim();
            if (t.length() == 0 || t.indexOf('|') < 0) break;
            rows.add(cells(t));
            j++;
        }
        int cols = head.size();
        for (int r = 0; r < rows.size(); r++) cols = Math.max(cols, rows.get(r).size());

        // small, plain tables -> aligned monospace grid; otherwise one "card" per row
        int[] w = new int[cols];
        boolean plain = true;
        ArrayList<ArrayList<String>> all = new ArrayList<ArrayList<String>>();
        all.add(head);
        all.addAll(rows);
        for (int r = 0; r < all.size(); r++) {
            ArrayList<String> row = all.get(r);
            for (int c = 0; c < row.size(); c++) {
                String v = row.get(c);
                if (hasInlineMarkup(v)) plain = false;
                w[c] = Math.max(w[c], v.length());
            }
        }
        int total = 0;
        for (int c = 0; c < cols; c++) total += w[c];
        total += 3 * (cols - 1);
        d.gap();
        if (plain && total <= d.gridMaxChars) {
            int start = d.len();
            for (int r = 0; r < all.size(); r++) {
                ArrayList<String> row = all.get(r);
                int ls = d.len();
                for (int c = 0; c < cols; c++) {
                    String v = c < row.size() ? row.get(c) : "";
                    d.text.append(v);
                    if (c < cols - 1) {
                        for (int p = v.length(); p < w[c]; p++) d.text.append(' ');
                        d.text.append(" | ");
                    }
                }
                if (r == 0) d.span(ls, d.len(), TABLE_HEAD);
                d.text.append('\n');
                if (r == 0) {
                    int ss = d.len();
                    for (int c = 0; c < cols; c++) {
                        for (int p = 0; p < w[c]; p++) d.text.append('-');
                        if (c < cols - 1) d.text.append("-+-");
                    }
                    d.span(ss, d.len(), MUTED);
                    d.text.append('\n');
                }
            }
            d.span(start, d.len(), TABLE_GRID);
        } else {
            for (int r = 0; r < rows.size(); r++) {
                ArrayList<String> row = rows.get(r);
                if (r > 0) d.gap();
                int ts = d.len();
                d.text.append("\u25AA ");
                inline(d, row.size() > 0 ? row.get(0) : "");
                d.span(ts, d.len(), TABLE_TITLE);
                d.text.append('\n');
                for (int c = 1; c < cols; c++) {
                    int ks = d.len();
                    inline(d, c < head.size() && head.get(c).length() > 0 ? head.get(c) : "Column " + (c + 1));
                    d.text.append(": ");
                    d.span(ks, d.len(), TABLE_KEY);
                    inline(d, c < row.size() ? row.get(c) : "");
                    d.text.append('\n');
                }
            }
        }
        return j;
    }

    // ---- lists -----------------------------------------------------------------------------

    /** {indent, markerStart, contentStart, ordered(0/1), number} or null */
    static int[] listItem(String line) {
        int k = 0;
        while (k < line.length() && line.charAt(k) == ' ') k++;
        if (k >= line.length()) return null;
        char c = line.charAt(k);
        if (c == '-' || c == '*' || c == '+') {
            if (k + 1 < line.length() && line.charAt(k + 1) == ' ') {
                int cs = k + 2;
                while (cs < line.length() && line.charAt(cs) == ' ') cs++;
                if (cs >= line.length()) return null;
                if (isRule(line.trim())) return null;
                return new int[]{k, k, cs, 0, 0};
            }
            return null;
        }
        int e = k;
        while (e < line.length() && e - k < 9 && Character.isDigit(line.charAt(e))) e++;
        if (e == k || e >= line.length()) return null;
        char p = line.charAt(e);
        if ((p == '.' || p == ')') && e + 1 < line.length() && line.charAt(e + 1) == ' ') {
            int cs = e + 2;
            while (cs < line.length() && line.charAt(cs) == ' ') cs++;
            if (cs >= line.length()) return null;
            return new int[]{k, k, cs, 1, Integer.parseInt(line.substring(k, e))};
        }
        return null;
    }

    private static final String[] BULLETS = {"\u2022", "\u25AA", "\u2013"};

    private static int list(Doc d, String[] L, int i, int to) {
        d.gap();
        ArrayList<Integer> indents = new ArrayList<Integer>();
        int j = i;
        while (j < to) {
            String line = L[j];
            int[] it = listItem(line);
            if (it == null) {
                if (line.trim().length() == 0) {
                    // a blank line ends the list unless an item or indented text follows
                    int k = j + 1;
                    while (k < to && L[k].trim().length() == 0) k++;
                    if (k < to && (listItem(L[k]) != null || leading(L[k]) >= 2)) {
                        j = k;
                        continue;
                    }
                }
                break;
            }
            int indent = it[0];
            while (indents.size() > 0 && indents.get(indents.size() - 1) > indent) indents.remove(indents.size() - 1);
            if (indents.size() == 0 || indents.get(indents.size() - 1) < indent) indents.add(indent);
            int level = indents.size() - 1;

            String content = line.substring(it[2]);
            String marker;
            boolean task = false, done = false;
            if (it[3] == 1) {
                marker = it[4] + ".";
            } else {
                marker = BULLETS[level % BULLETS.length];
            }
            if (content.startsWith("[ ] ") || content.startsWith("[x] ") || content.startsWith("[X] ")) {
                task = true;
                done = content.charAt(1) != ' ';
                marker = done ? "[x]" : "[ ]";
                content = content.substring(4);
            }
            int s = d.len();
            d.text.append(marker);
            d.span(s, d.len(), BULLET, task ? 1 : 0, null);
            d.text.append(' ');
            int cs = d.len();
            inline(d, content.trim());
            if (done) d.span(cs, d.len(), TASK_DONE);
            d.text.append('\n');
            d.span(s, d.len(), LIST_ITEM, level, marker + " ");
            j++;
            // continuation lines (indented deeper than the marker, not new items/blocks)
            while (j < to) {
                String cl = L[j];
                if (cl.trim().length() == 0 || listItem(cl) != null || leading(cl) <= indent) break;
                if (startsBlock(cl, j + 1 < to ? L[j + 1] : null)) break;
                int ps = d.len();
                inline(d, cl.trim());
                d.text.append('\n');
                d.span(ps, d.len(), LIST_CONT, level, marker + " ");
                j++;
            }
        }
        return j;
    }

    private static int leading(String s) {
        int k = 0;
        while (k < s.length() && s.charAt(k) == ' ') k++;
        return k;
    }

    // ---- inline ----------------------------------------------------------------------------

    private static boolean isPunct(char c) {
        return "\\`*_{}[]()#+-.!|~<>\"'$&%:;,/=?@^".indexOf(c) >= 0;
    }

    private static boolean isSpace(char c) {
        return c == ' ' || c == '\t' || c == '\n' || c == 0xA0;
    }

    private static boolean isWordChar(char c) {
        return Character.isLetterOrDigit(c);
    }

    static void inline(Doc d, String s) {
        StringBuilder buf = new StringBuilder();
        int n = s.length();
        int i = 0;
        while (i < n) {
            char c = s.charAt(i);
            if (c == '\\' && i + 1 < n && isPunct(s.charAt(i + 1))) {
                buf.append(s.charAt(i + 1));
                i += 2;
                continue;
            }
            if (c == '`') {
                int run = runLength(s, i, '`');
                int close = findBacktickRun(s, i + run, run);
                if (close >= 0) {
                    flush(d, buf);
                    String code = s.substring(i + run, close);
                    if (code.length() >= 2 && code.charAt(0) == ' ' && code.charAt(code.length() - 1) == ' ' && code.trim().length() > 0)
                        code = code.substring(1, code.length() - 1);
                    int st = d.len();
                    appendText(d, code);
                    d.span(st, d.len(), CODE);
                    i = close + run;
                } else {
                    for (int k = 0; k < run; k++) buf.append('`');
                    i += run;
                }
                continue;
            }
            if (c == '[' || (c == '!' && i + 1 < n && s.charAt(i + 1) == '[')) {
                int next = link(d, buf, s, i);
                if (next > i) {
                    i = next;
                    continue;
                }
                buf.append(c);
                i++;
                continue;
            }
            if (c == '<' && (s.startsWith("http://", i + 1) || s.startsWith("https://", i + 1))) {
                int e = s.indexOf('>', i);
                if (e > i) {
                    flush(d, buf);
                    String url = s.substring(i + 1, e);
                    int st = d.len();
                    d.text.append(url);
                    d.span(st, d.len(), LINK, 0, url);
                    i = e + 1;
                    continue;
                }
            }
            if (c == 'h' && (i == 0 || !isWordChar(s.charAt(i - 1)))
                    && (s.startsWith("http://", i) || s.startsWith("https://", i))) {
                int e = i;
                while (e < n && !isSpace(s.charAt(e)) && s.charAt(e) != '<' && s.charAt(e) != '"') e++;
                // trailing punctuation is not part of the URL, unbalanced ')' neither
                while (e > i && ".,;:!?'".indexOf(s.charAt(e - 1)) >= 0) e--;
                if (e > i && s.charAt(e - 1) == ')' && count(s, i, e, '(') < count(s, i, e, ')')) e--;
                String url = s.substring(i, e);
                if (url.length() > 8) {
                    flush(d, buf);
                    int st = d.len();
                    d.text.append(url);
                    d.span(st, d.len(), LINK, 0, url);
                    i = e;
                    continue;
                }
            }
            if (c == '$') {
                int[] m = mathAt(s, i);
                if (m != null) {
                    flush(d, buf);
                    appendText(d, texToText(s.substring(m[0], m[1])));
                    i = m[2];
                    continue;
                }
            }
            if (c == '*' || c == '_' || c == '~') {
                int run = runLength(s, i, c);
                int use = c == '~' ? 2 : Math.min(run, 3);
                if (c == '~' && run < 2) {
                    buf.append(c);
                    i++;
                    continue;
                }
                if (run == use && canOpen(s, i, run, c)) {
                    int close = findCloser(s, i + run, c, use);
                    if (close > i + run) {
                        flush(d, buf);
                        int st = d.len();
                        inline(d, s.substring(i + run, close));
                        int type = c == '~' ? STRIKE : (use == 1 ? ITALIC : use == 2 ? BOLD : BOLD_ITALIC);
                        d.span(st, d.len(), type);
                        i = close + use;
                        continue;
                    }
                }
                for (int k = 0; k < run; k++) buf.append(c);
                i += run;
                continue;
            }
            buf.append(c);
            i++;
        }
        flush(d, buf);
    }

    // ---- inline math: $...$ / $$...$$ (LaTeX) -> readable Unicode -----------------------------------

    /**
     * {contentStart, contentEnd, next} of a math span starting at s[i] == '$', or null. Strict, so prices stay text:
     * "$x$" or content that looks like math (\ ^ _ = + < > { }), no space just inside the dollars, no digit right after
     * the closing one. "$$...$$" may span lines.
     */
    static int[] mathAt(String s, int i) {
        int n = s.length();
        boolean dbl = i + 1 < n && s.charAt(i + 1) == '$';
        int from = i + (dbl ? 2 : 1);
        if (from >= n) return null;
        int close = from;
        while (true) {
            close = s.indexOf(dbl ? "$$" : "$", close);
            if (close < 0) return null;
            if (close > 0 && s.charAt(close - 1) == '\\') { // \$ inside math
                close++;
                continue;
            }
            break;
        }
        String c = s.substring(from, close);
        if (c.trim().length() == 0) return null;
        if (!dbl) {
            if (c.indexOf('\n') >= 0 || isSpace(c.charAt(0)) || isSpace(c.charAt(c.length() - 1))) return null;
            int after = close + 1;
            if (after < n && Character.isDigit(s.charAt(after))) return null;
            boolean mathy = c.length() == 1 && Character.isLetter(c.charAt(0));
            for (int k = 0; k < c.length() && !mathy; k++) mathy = "\\^_=+<>{}".indexOf(c.charAt(k)) >= 0;
            if (!mathy) return null;
        }
        int start = from, end = close;
        while (start < end && isSpace(s.charAt(start))) start++;
        while (end > start && isSpace(s.charAt(end - 1))) end--;
        return new int[]{start, end, close + (dbl ? 2 : 1)};
    }

    private static final String[] TEX = {
            // Greek
            "alpha", "\u03B1", "beta", "\u03B2", "gamma", "\u03B3", "delta", "\u03B4", "epsilon", "\u03B5", "varepsilon", "\u03B5",
            "zeta", "\u03B6", "eta", "\u03B7", "theta", "\u03B8", "vartheta", "\u03B8", "iota", "\u03B9", "kappa", "\u03BA",
            "lambda", "\u03BB", "mu", "\u03BC", "nu", "\u03BD", "xi", "\u03BE", "pi", "\u03C0", "rho", "\u03C1",
            "sigma", "\u03C3", "tau", "\u03C4", "upsilon", "\u03C5", "phi", "\u03C6", "varphi", "\u03C6", "chi", "\u03C7",
            "psi", "\u03C8", "omega", "\u03C9", "Gamma", "\u0393", "Delta", "\u0394", "Theta", "\u0398", "Lambda", "\u039B",
            "Xi", "\u039E", "Pi", "\u03A0", "Sigma", "\u03A3", "Phi", "\u03A6", "Psi", "\u03A8", "Omega", "\u03A9",
            // operators and relations
            "times", "\u00D7", "div", "\u00F7", "cdot", "\u00B7", "pm", "\u00B1", "mp", "\u2213", "le", "\u2264", "leq", "\u2264",
            "ge", "\u2265", "geq", "\u2265", "ne", "\u2260", "neq", "\u2260", "approx", "\u2248", "equiv", "\u2261",
            "sim", "~", "propto", "\u221D", "infty", "\u221E", "to", "\u2192", "rightarrow", "\u2192", "leftarrow", "\u2190",
            "leftrightarrow", "\u2194", "Rightarrow", "\u21D2", "implies", "\u21D2", "Leftrightarrow", "\u21D4", "iff", "\u21D4",
            "in", "\u2208", "notin", "\u2209", "subset", "\u2282", "subseteq", "\u2286", "cup", "\u222A", "cap", "\u2229",
            "emptyset", "\u2205", "forall", "\u2200", "exists", "\u2203", "partial", "\u2202", "nabla", "\u2207",
            "sum", "\u2211", "prod", "\u220F", "int", "\u222B", "degree", "\u00B0", "circ", "\u00B0", "angle", "\u2220",
            "ldots", "\u2026", "dots", "\u2026", "cdots", "\u2026", "perp", "\u22A5", "parallel", "\u2225", "neg", "\u00AC",
            "land", "\u2227", "lor", "\u2228", "mid", "|", "quad", "  ", "qquad", "    ", "lfloor", "\u230A", "rfloor", "\u230B",
            "lceil", "\u2308", "rceil", "\u2309", "langle", "\u27E8", "rangle", "\u27E9", "log", "log", "ln", "ln", "sin", "sin",
            "cos", "cos", "tan", "tan", "lim", "lim", "max", "max", "min", "min", "exp", "exp", "mod", "mod", "gcd", "gcd",
            "left", "", "right", "", "displaystyle", "", "limits", ""};
    /** Only superscripts that Android 2.x fonts draw (tested on 2.1: U+2070 "0" is a box); others stay "x^10". */
    private static final String SUP_FROM = "123n", SUP_TO = "\u00B9\u00B2\u00B3\u207F";

    /** Reads a TeX argument at s[i]: "{...}" (nested) or one character. {text, next}. */
    private static String[] texArg(String s, int i) {
        while (i < s.length() && s.charAt(i) == ' ') i++;
        if (i >= s.length()) return new String[]{"", String.valueOf(i)};
        if (s.charAt(i) == '{') {
            int depth = 0;
            for (int k = i; k < s.length(); k++) {
                char c = s.charAt(k);
                if (c == '{') depth++;
                else if (c == '}' && --depth == 0) return new String[]{s.substring(i + 1, k), String.valueOf(k + 1)};
            }
            return new String[]{s.substring(i + 1), String.valueOf(s.length())};
        }
        if (s.charAt(i) == '\\') { // a command as the argument, e.g. ^\circ
            int k = i + 1;
            while (k < s.length() && Character.isLetter(s.charAt(k))) k++;
            if (k == i + 1 && k < s.length()) k++;
            return new String[]{s.substring(i, k), String.valueOf(k)};
        }
        return new String[]{s.substring(i, i + 1), String.valueOf(i + 1)};
    }

    private static boolean simple(String t) {
        for (int k = 0; k < t.length(); k++) if (!Character.isLetterOrDigit(t.charAt(k)) && t.charAt(k) != '.') return false;
        return true;
    }

    /** Converts common LaTeX to plain Unicode text ("17 \times 23" -> "17 × 23", "x^2" -> "x²", "\frac{a}{b}" -> "a/b"). */
    public static String texToText(String s) {
        StringBuilder o = new StringBuilder();
        int i = 0, n = s.length();
        while (i < n) {
            char c = s.charAt(i);
            if (c == '\\' && i + 1 < n) {
                int k = i + 1;
                while (k < n && Character.isLetter(s.charAt(k))) k++;
                if (k == i + 1) { // \, \; \! \{ \} \% \$ \\
                    char x = s.charAt(i + 1);
                    if (x == ',' || x == ';' || x == ':' || x == ' ') o.append(' ');
                    else if (x == '\\') o.append('\n');
                    else if (x != '!') o.append(x);
                    i += 2;
                    continue;
                }
                String cmd = s.substring(i + 1, k);
                i = k;
                if (cmd.equals("frac") || cmd.equals("dfrac") || cmd.equals("tfrac")) {
                    String[] a = texArg(s, i);
                    String[] b = texArg(s, Integer.parseInt(a[1]));
                    String na = texToText(a[0]), nb = texToText(b[0]);
                    o.append(simple(na) ? na : "(" + na + ")").append('/').append(simple(nb) ? nb : "(" + nb + ")");
                    i = Integer.parseInt(b[1]);
                } else if (cmd.equals("sqrt")) {
                    String[] a = texArg(s, i);
                    String na = texToText(a[0]);
                    o.append('\u221A').append(simple(na) ? na : "(" + na + ")");
                    i = Integer.parseInt(a[1]);
                } else if (cmd.equals("text") || cmd.equals("mathrm") || cmd.equals("mathbf") || cmd.equals("mathit")
                        || cmd.equals("operatorname") || cmd.equals("boxed") || cmd.equals("textbf") || cmd.equals("mbox")) {
                    String[] a = texArg(s, i);
                    o.append(cmd.equals("text") || cmd.equals("mbox") ? a[0] : texToText(a[0]));
                    i = Integer.parseInt(a[1]);
                } else {
                    String v = null;
                    for (int t = 0; t < TEX.length; t += 2) {
                        if (TEX[t].equals(cmd)) {
                            v = TEX[t + 1];
                            break;
                        }
                    }
                    o.append(v != null ? v : cmd); // unknown command: its name
                }
                continue;
            }
            if (c == '^' || c == '_') {
                String[] a = texArg(s, i + 1);
                String t = texToText(a[0]);
                i = Integer.parseInt(a[1]);
                if (c == '^' && t.equals("\u00B0")) {
                    o.append(t);
                    continue;
                }
                StringBuilder sup = new StringBuilder();
                for (int k = 0; c == '^' && k < t.length(); k++) {
                    int p = SUP_FROM.indexOf(t.charAt(k));
                    if (p < 0) {
                        sup = null;
                        break;
                    }
                    sup.append(SUP_TO.charAt(p));
                }
                if (c == '^' && sup != null && sup.length() > 0) o.append(sup);
                else o.append(c).append(t.length() == 1 || simple(t) ? t : "(" + t + ")");
                continue;
            }
            if (c == '{' || c == '}') {
                i++;
                continue;
            }
            o.append(c);
            i++;
        }
        return o.toString();
    }

    private static int count(String s, int from, int to, char c) {
        int k = 0;
        for (int i = from; i < to; i++) if (s.charAt(i) == c) k++;
        return k;
    }

    private static int runLength(String s, int i, char c) {
        int k = i;
        while (k < s.length() && s.charAt(k) == c) k++;
        return k - i;
    }

    private static int findBacktickRun(String s, int from, int run) {
        int i = from;
        while (i < s.length()) {
            if (s.charAt(i) == '`') {
                int r = runLength(s, i, '`');
                if (r == run) return i;
                i += r;
            } else {
                i++;
            }
        }
        return -1;
    }

    private static boolean canOpen(String s, int i, int run, char c) {
        int after = i + run;
        if (after >= s.length() || isSpace(s.charAt(after))) return false;
        if (c == '_' && i > 0 && isWordChar(s.charAt(i - 1))) return false; // snake_case stays literal
        return true;
    }

    /** position of a closing delimiter run of exactly `len` chars, skipping code spans */
    private static int findCloser(String s, int from, char c, int len) {
        int i = from;
        int n = s.length();
        while (i < n) {
            char x = s.charAt(i);
            if (x == '\\') {
                i += 2;
                continue;
            }
            if (x == '`') {
                int r = runLength(s, i, '`');
                int close = findBacktickRun(s, i + r, r);
                i = close >= 0 ? close + r : i + r;
                continue;
            }
            if (x == c) {
                int r = runLength(s, i, c);
                boolean before = i > from && !isSpace(s.charAt(i - 1));
                boolean afterOk = c != '_' || i + r >= n || !isWordChar(s.charAt(i + r));
                if (r == len && before && afterOk) return i;
                if (r > len && before && afterOk && c != '~') return i + (r - len); // ***x*** style tails
                i += r;
                continue;
            }
            i++;
        }
        return -1;
    }

    /** [label](url) or ![alt](url) starting at i; returns the index after it, or i if not a link */
    private static int link(Doc d, StringBuilder buf, String s, int i) {
        boolean image = s.charAt(i) == '!';
        int lb = image ? i + 1 : i;
        int depth = 0;
        int rb = -1;
        for (int k = lb; k < s.length(); k++) {
            char c = s.charAt(k);
            if (c == '\\') {
                k++;
                continue;
            }
            if (c == '[') depth++;
            else if (c == ']') {
                depth--;
                if (depth == 0) {
                    rb = k;
                    break;
                }
            }
        }
        if (rb < 0 || rb + 1 >= s.length() || s.charAt(rb + 1) != '(') return i;
        int pd = 0;
        int rp = -1;
        for (int k = rb + 1; k < s.length(); k++) {
            char c = s.charAt(k);
            if (c == '(') pd++;
            else if (c == ')') {
                pd--;
                if (pd == 0) {
                    rp = k;
                    break;
                }
            }
        }
        if (rp < 0) return i;
        String label = s.substring(lb + 1, rb);
        String url = s.substring(rb + 2, rp).trim();
        int sp = url.indexOf(' ');
        if (sp > 0) url = url.substring(0, sp); // drop "title"
        if (url.startsWith("<") && url.endsWith(">")) url = url.substring(1, url.length() - 1);
        flush(d, buf);
        int st = d.len();
        if (image) {
            d.text.append("[Image");
            if (label.trim().length() > 0) d.text.append(": ");
            appendText(d, label.trim());
            d.text.append(']');
            d.span(st, d.len(), IMAGE, 0, url);
        } else {
            inline(d, label);
            if (d.len() == st) d.text.append(url);
            d.span(st, d.len(), LINK, 0, url);
        }
        return rp + 1;
    }

    private static void flush(Doc d, StringBuilder buf) {
        if (buf.length() > 0) {
            appendText(d, buf.toString());
            buf.setLength(0);
        }
    }

    /** Appends literal text, turning emoji into ":shortcode:" (EMOJI span) and dropping stray joiners. */
    static void appendText(Doc d, String s) {
        int n = s.length();
        int i = 0;
        while (i < n) {
            int len = EmojiMap.matchAt(s, i);
            if (len > 0) {
                int st = d.len();
                d.text.append(':').append(EmojiMap.nameAt(s, i, len)).append(':');
                d.span(st, d.len(), EMOJI);
                i += len;
                continue;
            }
            char c = s.charAt(i);
            if (!EmojiMap.isInvisible(c)) d.text.append(c);
            i++;
        }
    }
}
