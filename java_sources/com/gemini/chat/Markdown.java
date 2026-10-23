package com.gemini.chat;

import java.util.ArrayList;

/* loaded from: classes.dex */
public final class Markdown {
    public static final int BOLD = 1;
    public static final int BOLD_ITALIC = 3;
    public static final int BULLET = 13;
    public static final int CODE = 5;
    public static final int CODE_BLOCK = 8;
    public static final int CODE_LANG = 9;
    public static final int EMOJI = 16;
    public static final int GAP = 22;
    static final int GRID_MAX_WIDTH = 30;
    public static final int HEADING = 7;
    public static final int IMAGE = 23;
    public static final int ITALIC = 2;
    public static final int LINK = 6;
    public static final int LIST_CONT = 12;
    public static final int LIST_ITEM = 11;
    public static final int MUTED = 21;
    public static final int QUOTE = 10;
    public static final int RULE = 15;
    public static final int STRIKE = 4;
    private static final String SUP_FROM = "123n";
    private static final String SUP_TO = "¹²³ⁿ";
    public static final int TABLE_GRID = 17;
    public static final int TABLE_HEAD = 18;
    public static final int TABLE_KEY = 20;
    public static final int TABLE_TITLE = 19;
    public static final int TASK_DONE = 14;
    private static final String[] BULLETS = {"•", "▪", "–"};
    private static final String[] TEX = {"alpha", "α", "beta", "β", "gamma", "γ", "delta", "δ", "epsilon", "ε", "varepsilon", "ε", "zeta", "ζ", "eta", "η", "theta", "θ", "vartheta", "θ", "iota", "ι", "kappa", "κ", "lambda", "λ", "mu", "μ", "nu", "ν", "xi", "ξ", "pi", "π", "rho", "ρ", "sigma", "σ", "tau", "τ", "upsilon", "υ", "phi", "φ", "varphi", "φ", "chi", "χ", "psi", "ψ", "omega", "ω", "Gamma", "Γ", "Delta", "Δ", "Theta", "Θ", "Lambda", "Λ", "Xi", "Ξ", "Pi", "Π", "Sigma", "Σ", "Phi", "Φ", "Psi", "Ψ", "Omega", "Ω", "times", "×", "div", "÷", "cdot", "·", "pm", "±", "mp", "∓", "le", "≤", "leq", "≤", "ge", "≥", "geq", "≥", "ne", "≠", "neq", "≠", "approx", "≈", "equiv", "≡", "sim", "~", "propto", "∝", "infty", "∞", "to", "→", "rightarrow", "→", "leftarrow", "←", "leftrightarrow", "↔", "Rightarrow", "⇒", "implies", "⇒", "Leftrightarrow", "⇔", "iff", "⇔", "in", "∈", "notin", "∉", "subset", "⊂", "subseteq", "⊆", "cup", "∪", "cap", "∩", "emptyset", "∅", "forall", "∀", "exists", "∃", "partial", "∂", "nabla", "∇", "sum", "∑", "prod", "∏", "int", "∫", "degree", "°", "circ", "°", "angle", "∠", "ldots", "…", "dots", "…", "cdots", "…", "perp", "⊥", "parallel", "∥", "neg", "¬", "land", "∧", "lor", "∨", "mid", "|", "quad", "  ", "qquad", "    ", "lfloor", "⌊", "rfloor", "⌋", "lceil", "⌈", "rceil", "⌉", "langle", "⟨", "rangle", "⟩", "log", "log", "ln", "ln", "sin", "sin", "cos", "cos", "tan", "tan", "lim", "lim", "max", "max", "min", "min", "exp", "exp", "mod", "mod", "gcd", "gcd", "left", "", "right", "", "displaystyle", "", "limits", ""};

    public static final class Span {
        public final String arg;
        public final int end;
        public final int level;
        public final int start;
        public final int type;

        Span(int i, int i2, int i3, int i4, String str) {
            this.start = i;
            this.end = i2;
            this.type = i3;
            this.level = i4;
            this.arg = str;
        }

        public String toString() {
            return this.type + "[" + this.start + "," + this.end + ")" + (this.level != 0 ? "L" + this.level : "") + (this.arg != null ? "=" + this.arg : "");
        }
    }

    public static final class Doc {
        public final StringBuilder text = new StringBuilder();
        public final ArrayList<Span> spans = new ArrayList<>();
        public final ArrayList<String> codeBlocks = new ArrayList<>();
        int lastGapAt = -1;
        int gridMaxChars = Markdown.GRID_MAX_WIDTH;

        void span(int i, int i2, int i3) {
            span(i, i2, i3, 0, null);
        }

        void span(int i, int i2, int i3, int i4, String str) {
            if (i2 > i) {
                this.spans.add(new Span(i, i2, i3, i4, str));
            }
        }

        int len() {
            return this.text.length();
        }

        void gap() {
            int length = this.text.length();
            if (length != 0 && this.lastGapAt != length) {
                if (this.text.charAt(length - 1) != '\n') {
                    this.text.append('\n');
                }
                int length2 = this.text.length();
                this.text.append('\n');
                span(length2, length2 + 1, 22);
                this.lastGapAt = this.text.length();
            }
        }
    }

    private Markdown() {
    }

    public static Doc parse(String str) {
        return parse(str, GRID_MAX_WIDTH);
    }

    public static Doc parse(String str, int i) {
        int i2 = 0;
        Doc doc = new Doc();
        doc.gridMaxChars = i;
        if (str == null) {
            return doc;
        }
        String[] split = str.replace("\r\n", "\n").replace('\r', '\n').replace("\t", "    ").split("\n", -1);
        blocks(doc, split, 0, split.length);
        int length = doc.text.length();
        while (length > 0 && doc.text.charAt(length - 1) == '\n') {
            length--;
        }
        doc.text.setLength(length);
        ArrayList arrayList = new ArrayList(doc.spans.size());
        while (true) {
            int i3 = i2;
            if (i3 < doc.spans.size()) {
                Span span = doc.spans.get(i3);
                if (span.start < length) {
                    arrayList.add(span.end > length ? new Span(span.start, length, span.type, span.level, span.arg) : span);
                }
                i2 = i3 + 1;
            } else {
                doc.spans.clear();
                doc.spans.addAll(arrayList);
                return doc;
            }
        }
    }

    public static Doc plain(String str) {
        Doc doc = new Doc();
        if (str != null) {
            appendText(doc, str);
        }
        return doc;
    }

    private static void blocks(Doc doc, String[] strArr, int i, int i2) {
        int paragraph;
        while (i < i2) {
            String str = strArr[i];
            String trim = str.trim();
            if (trim.length() == 0) {
                i++;
            } else {
                if (fenceLen(trim) > 0) {
                    paragraph = codeBlock(doc, strArr, i, i2);
                } else if (headingLevel(trim) > 0) {
                    heading(doc, trim);
                    paragraph = i + 1;
                } else if (isRule(trim)) {
                    doc.gap();
                    int len = doc.len();
                    doc.text.append(' ').append('\n');
                    doc.span(len, doc.len(), 15);
                    doc.gap();
                    paragraph = i + 1;
                } else if (trim.charAt(0) == '>') {
                    paragraph = quote(doc, strArr, i, i2);
                } else if (trim.indexOf(124) >= 0 && i + 1 < i2 && isTableSep(strArr[i + 1].trim())) {
                    paragraph = table(doc, strArr, i, i2);
                } else if (listItem(str) != null) {
                    paragraph = list(doc, strArr, i, i2);
                } else {
                    paragraph = paragraph(doc, strArr, i, i2);
                }
                i = paragraph;
            }
        }
    }

    private static boolean startsBlock(String str, String str2) {
        boolean z = false;
        String trim = str.trim();
        if (trim.length() == 0) {
            return true;
        }
        if (fenceLen(trim) > 0 || headingLevel(trim) > 0 || isRule(trim) || trim.charAt(0) == '>' || listItem(str) != null || (trim.indexOf(124) >= 0 && str2 != null && isTableSep(str2.trim()))) {
            z = true;
        }
        return z;
    }

    private static int paragraph(Doc doc, String[] strArr, int i, int i2) {
        doc.gap();
        boolean z = true;
        while (i < i2) {
            String str = i + 1 < i2 ? strArr[i + 1] : null;
            if (!z && startsBlock(strArr[i], str)) {
                break;
            }
            if (!z) {
                doc.text.append('\n');
            }
            inline(doc, strArr[i].trim());
            i++;
            z = false;
        }
        doc.text.append('\n');
        return i;
    }

    private static int headingLevel(String str) {
        int i = 0;
        while (i < str.length() && str.charAt(i) == '#') {
            i++;
        }
        if (i == 0 || i > 6) {
            return 0;
        }
        if (i == str.length() || str.charAt(i) == ' ') {
            return i;
        }
        return 0;
    }

    private static void heading(Doc doc, String str) {
        int headingLevel = headingLevel(str);
        String trim = str.substring(headingLevel).trim();
        int length = trim.length();
        while (length > 0 && trim.charAt(length - 1) == '#') {
            length--;
        }
        if (length < trim.length() && (length == 0 || trim.charAt(length - 1) == ' ')) {
            trim = trim.substring(0, length).trim();
        }
        doc.gap();
        int len = doc.len();
        inline(doc, trim);
        doc.span(len, doc.len(), 7, headingLevel, null);
        doc.text.append('\n');
    }

    private static boolean isRule(String str) {
        if (str.length() < 3) {
            return false;
        }
        char charAt = str.charAt(0);
        if (charAt != '-' && charAt != '*' && charAt != '_') {
            return false;
        }
        int i = 0;
        for (int i2 = 0; i2 < str.length(); i2++) {
            char charAt2 = str.charAt(i2);
            if (charAt2 == charAt) {
                i++;
            } else if (charAt2 != ' ') {
                return false;
            }
        }
        return i >= 3;
    }

    private static int fenceLen(String str) {
        if (str.length() < 3) {
            return 0;
        }
        char charAt = str.charAt(0);
        if (charAt != '`' && charAt != '~') {
            return 0;
        }
        int i = 0;
        while (i < str.length() && str.charAt(i) == charAt) {
            i++;
        }
        if (i < 3) {
            return 0;
        }
        if (charAt != '`' || str.indexOf(96, i) < 0) {
            return i;
        }
        return 0;
    }

    /* JADX WARN: Code restructure failed: missing block: B:41:0x00c5, code lost:
    
        r7.append('\n');
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static int codeBlock(com.gemini.chat.Markdown.Doc r11, java.lang.String[] r12, int r13, int r14) {
        /*
            r0 = r12[r13]
            java.lang.String r0 = r0.trim()
            int r3 = fenceLen(r0)
            r1 = 0
            char r4 = r0.charAt(r1)
            java.lang.String r0 = r0.substring(r3)
            java.lang.String r5 = r0.trim()
            r0 = r12[r13]
            int r6 = r0.indexOf(r4)
            java.lang.StringBuilder r7 = new java.lang.StringBuilder
            r7.<init>()
            int r1 = r13 + 1
            r0 = 1
            r2 = r0
        L26:
            if (r1 >= r14) goto L53
            r0 = r12[r1]
            java.lang.String r8 = r0.trim()
            int r0 = r8.length()
            if (r0 < r3) goto Lad
            r0 = 0
            char r0 = r8.charAt(r0)
            if (r0 != r4) goto Lad
            r0 = 0
        L3c:
            int r9 = r8.length()
            if (r0 >= r9) goto L4b
            char r9 = r8.charAt(r0)
            if (r9 != r4) goto L4b
            int r0 = r0 + 1
            goto L3c
        L4b:
            if (r0 < r3) goto Lad
            int r8 = r8.length()
            if (r0 != r8) goto Lad
        L53:
            r11.gap()
            int r0 = r11.len()
            int r2 = r5.length()
            if (r2 <= 0) goto L79
            int r2 = r11.len()
            java.lang.StringBuilder r3 = r11.text
            r3.append(r5)
            int r3 = r11.len()
            r4 = 9
            r11.span(r2, r3, r4)
            java.lang.StringBuilder r2 = r11.text
            r3 = 10
            r2.append(r3)
        L79:
            int r2 = r11.len()
            java.lang.String r3 = r7.toString()
            appendText(r11, r3)
            java.lang.StringBuilder r3 = r11.text
            r4 = 10
            r3.append(r4)
            int r3 = r11.len()
            r4 = 8
            r11.span(r2, r3, r4)
            int r3 = r5.length()
            if (r3 <= 0) goto L9f
            r3 = 8
            r11.span(r0, r2, r3)
        L9f:
            java.util.ArrayList<java.lang.String> r0 = r11.codeBlocks
            java.lang.String r2 = r7.toString()
            r0.add(r2)
            if (r1 >= r14) goto Ld7
            int r0 = r1 + 1
        Lac:
            return r0
        Lad:
            r8 = r12[r1]
            r0 = 0
        Lb0:
            if (r0 >= r6) goto Lc3
            int r9 = r8.length()
            if (r0 >= r9) goto Lc3
            char r9 = r8.charAt(r0)
            r10 = 32
            if (r9 != r10) goto Lc3
            int r0 = r0 + 1
            goto Lb0
        Lc3:
            if (r2 != 0) goto Lca
            r2 = 10
            r7.append(r2)
        Lca:
            java.lang.String r0 = r8.substring(r0)
            r7.append(r0)
            r0 = 0
            int r1 = r1 + 1
            r2 = r0
            goto L26
        Ld7:
            r0 = r1
            goto Lac
        */
        throw new UnsupportedOperationException("Method not decompiled: com.gemini.chat.Markdown.codeBlock(com.gemini.chat.Markdown$Doc, java.lang.String[], int, int):int");
    }

    private static int quote(Doc doc, String[] strArr, int i, int i2) {
        ArrayList arrayList = new ArrayList();
        while (i < i2) {
            String trim = strArr[i].trim();
            if (trim.length() == 0 || trim.charAt(0) != '>') {
                break;
            }
            String substring = trim.substring(1);
            if (substring.length() > 0 && substring.charAt(0) == ' ') {
                substring = substring.substring(1);
            }
            arrayList.add(substring);
            i++;
        }
        doc.gap();
        int len = doc.len();
        String[] strArr2 = (String[]) arrayList.toArray(new String[arrayList.size()]);
        blocks(doc, strArr2, 0, strArr2.length);
        if (doc.len() > len && doc.text.charAt(doc.len() - 1) != '\n') {
            doc.text.append('\n');
        }
        doc.span(len, doc.len(), 10);
        return i;
    }

    private static boolean isTableSep(String str) {
        if (str.indexOf(45) < 0) {
            return false;
        }
        boolean z = str.indexOf(124) >= 0;
        for (int i = 0; i < str.length(); i++) {
            char charAt = str.charAt(i);
            if (charAt != '|' && charAt != '-' && charAt != ':' && charAt != ' ') {
                return false;
            }
        }
        return z || str.length() >= 3;
    }

    private static ArrayList<String> cells(String str) {
        String trim = str.trim();
        if (trim.startsWith("|")) {
            trim = trim.substring(1);
        }
        if (trim.endsWith("|") && !trim.endsWith("\\|")) {
            trim = trim.substring(0, trim.length() - 1);
        }
        ArrayList<String> arrayList = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        int i = 0;
        while (i < trim.length()) {
            char charAt = trim.charAt(i);
            if (charAt == '\\' && i + 1 < trim.length() && trim.charAt(i + 1) == '|') {
                sb.append('|');
                i++;
            } else if (charAt == '|') {
                arrayList.add(sb.toString().trim());
                sb.setLength(0);
            } else {
                sb.append(charAt);
            }
            i++;
        }
        arrayList.add(sb.toString().trim());
        return arrayList;
    }

    private static boolean hasInlineMarkup(String str) {
        for (int i = 0; i < str.length(); i++) {
            char charAt = str.charAt(i);
            if (charAt == '*' || charAt == '_' || charAt == '`' || charAt == '[' || charAt == '~' || charAt == '\\' || charAt > 8192) {
                return true;
            }
        }
        return false;
    }

    private static int table(Doc doc, String[] strArr, int i, int i2) {
        ArrayList<String> cells = cells(strArr[i]);
        ArrayList arrayList = new ArrayList();
        int i3 = i + 2;
        while (i3 < i2) {
            String trim = strArr[i3].trim();
            if (trim.length() == 0 || trim.indexOf(124) < 0) {
                break;
            }
            arrayList.add(cells(trim));
            i3++;
        }
        int size = cells.size();
        int i4 = 0;
        while (true) {
            int i5 = i4;
            if (i5 >= arrayList.size()) {
                break;
            }
            size = Math.max(size, ((ArrayList) arrayList.get(i5)).size());
            i4 = i5 + 1;
        }
        int[] iArr = new int[size];
        boolean z = true;
        ArrayList arrayList2 = new ArrayList();
        arrayList2.add(cells);
        arrayList2.addAll(arrayList);
        int i6 = 0;
        while (i6 < arrayList2.size()) {
            ArrayList arrayList3 = (ArrayList) arrayList2.get(i6);
            boolean z2 = z;
            for (int i7 = 0; i7 < arrayList3.size(); i7++) {
                String str = (String) arrayList3.get(i7);
                if (hasInlineMarkup(str)) {
                    z2 = false;
                }
                iArr[i7] = Math.max(iArr[i7], str.length());
            }
            i6++;
            z = z2;
        }
        int i8 = 0;
        for (int i9 = 0; i9 < size; i9++) {
            i8 += iArr[i9];
        }
        int i10 = ((size - 1) * 3) + i8;
        doc.gap();
        if (z && i10 <= doc.gridMaxChars) {
            int len = doc.len();
            int i11 = 0;
            while (true) {
                int i12 = i11;
                if (i12 >= arrayList2.size()) {
                    break;
                }
                ArrayList arrayList4 = (ArrayList) arrayList2.get(i12);
                int len2 = doc.len();
                int i13 = 0;
                while (i13 < size) {
                    String str2 = i13 < arrayList4.size() ? (String) arrayList4.get(i13) : "";
                    doc.text.append(str2);
                    if (i13 < size - 1) {
                        for (int length = str2.length(); length < iArr[i13]; length++) {
                            doc.text.append(' ');
                        }
                        doc.text.append(" | ");
                    }
                    i13++;
                }
                if (i12 == 0) {
                    doc.span(len2, doc.len(), 18);
                }
                doc.text.append('\n');
                if (i12 == 0) {
                    int len3 = doc.len();
                    for (int i14 = 0; i14 < size; i14++) {
                        for (int i15 = 0; i15 < iArr[i14]; i15++) {
                            doc.text.append('-');
                        }
                        if (i14 < size - 1) {
                            doc.text.append("-+-");
                        }
                    }
                    doc.span(len3, doc.len(), 21);
                    doc.text.append('\n');
                }
                i11 = i12 + 1;
            }
            doc.span(len, doc.len(), 17);
        } else {
            int i16 = 0;
            while (true) {
                int i17 = i16;
                if (i17 >= arrayList.size()) {
                    break;
                }
                ArrayList arrayList5 = (ArrayList) arrayList.get(i17);
                if (i17 > 0) {
                    doc.gap();
                }
                int len4 = doc.len();
                doc.text.append("▪ ");
                inline(doc, arrayList5.size() > 0 ? (String) arrayList5.get(0) : "");
                doc.span(len4, doc.len(), 19);
                doc.text.append('\n');
                int i18 = 1;
                while (i18 < size) {
                    int len5 = doc.len();
                    inline(doc, (i18 >= cells.size() || cells.get(i18).length() <= 0) ? "Column " + (i18 + 1) : cells.get(i18));
                    doc.text.append(": ");
                    doc.span(len5, doc.len(), 20);
                    inline(doc, i18 < arrayList5.size() ? (String) arrayList5.get(i18) : "");
                    doc.text.append('\n');
                    i18++;
                }
                i16 = i17 + 1;
            }
        }
        return i3;
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x0096, code lost:
    
        if (r2 < r9.length()) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x009a, code lost:
    
        r3 = r9.charAt(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00a0, code lost:
    
        if (r3 == '.') goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00a4, code lost:
    
        if (r3 != ')') goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:?, code lost:
    
        return null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00ac, code lost:
    
        if ((r2 + 1) >= r9.length()) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00b4, code lost:
    
        if (r9.charAt(r2 + 1) != ' ') goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00b6, code lost:
    
        r3 = r2 + 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00bc, code lost:
    
        if (r3 >= r9.length()) goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00c2, code lost:
    
        if (r9.charAt(r3) != ' ') goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00c4, code lost:
    
        r3 = r3 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00cb, code lost:
    
        if (r3 < r9.length()) goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:?, code lost:
    
        return null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:?, code lost:
    
        return new int[]{r0, r0, r3, 1, java.lang.Integer.parseInt(r9.substring(r0, r2))};
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static int[] listItem(java.lang.String r9) {
        /*
            Method dump skipped, instructions count: 237
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.gemini.chat.Markdown.listItem(java.lang.String):int[]");
    }

    private static int list(Doc doc, String[] strArr, int i, int i2) {
        String str;
        boolean z;
        boolean z2;
        String str2;
        String substring;
        doc.gap();
        ArrayList arrayList = new ArrayList();
        while (i < i2) {
            String str3 = strArr[i];
            int[] listItem = listItem(str3);
            if (listItem == null) {
                if (str3.trim().length() != 0) {
                    break;
                }
                int i3 = i + 1;
                while (i3 < i2 && strArr[i3].trim().length() == 0) {
                    i3++;
                }
                if (i3 >= i2 || (listItem(strArr[i3]) == null && leading(strArr[i3]) < 2)) {
                    break;
                }
                i = i3;
            } else {
                int i4 = listItem[0];
                while (arrayList.size() > 0 && ((Integer) arrayList.get(arrayList.size() - 1)).intValue() > i4) {
                    arrayList.remove(arrayList.size() - 1);
                }
                if (arrayList.size() == 0 || ((Integer) arrayList.get(arrayList.size() - 1)).intValue() < i4) {
                    arrayList.add(Integer.valueOf(i4));
                }
                int size = arrayList.size() - 1;
                String substring2 = str3.substring(listItem[2]);
                if (listItem[3] == 1) {
                    str = listItem[4] + ".";
                } else {
                    str = BULLETS[size % BULLETS.length];
                }
                if (!substring2.startsWith("[ ] ") && !substring2.startsWith("[x] ") && !substring2.startsWith("[X] ")) {
                    z = false;
                    z2 = false;
                    str2 = str;
                    substring = substring2;
                } else {
                    boolean z3 = substring2.charAt(1) != ' ';
                    z = z3;
                    z2 = true;
                    str2 = z3 ? "[x]" : "[ ]";
                    substring = substring2.substring(4);
                }
                int len = doc.len();
                doc.text.append(str2);
                doc.span(len, doc.len(), 13, z2 ? 1 : 0, null);
                doc.text.append(' ');
                int len2 = doc.len();
                inline(doc, substring.trim());
                if (z) {
                    doc.span(len2, doc.len(), 14);
                }
                doc.text.append('\n');
                doc.span(len, doc.len(), 11, size, str2 + " ");
                int i5 = i + 1;
                while (i5 < i2) {
                    String str4 = strArr[i5];
                    if (str4.trim().length() == 0 || listItem(str4) != null || leading(str4) <= i4) {
                        break;
                    }
                    if (startsBlock(str4, i5 + 1 < i2 ? strArr[i5 + 1] : null)) {
                        break;
                    }
                    int len3 = doc.len();
                    inline(doc, str4.trim());
                    doc.text.append('\n');
                    doc.span(len3, doc.len(), 12, size, str2 + " ");
                    i5++;
                }
                i = i5;
            }
        }
        return i;
    }

    private static int leading(String str) {
        int i = 0;
        while (i < str.length() && str.charAt(i) == ' ') {
            i++;
        }
        return i;
    }

    private static boolean isPunct(char c) {
        return "\\`*_{}[]()#+-.!|~<>\"'$&%:;,/=?@^".indexOf(c) >= 0;
    }

    private static boolean isSpace(char c) {
        return c == ' ' || c == '\t' || c == '\n' || c == 160;
    }

    private static boolean isWordChar(char c) {
        return Character.isLetterOrDigit(c);
    }

    /* JADX WARN: Code restructure failed: missing block: B:150:0x0039, code lost:
    
        r1 = runLength(r15, r2, '`');
        r3 = findBacktickRun(r15, r2 + r1, r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:151:0x0043, code lost:
    
        if (r3 < 0) goto L123;
     */
    /* JADX WARN: Code restructure failed: missing block: B:153:0x0090, code lost:
    
        r0 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:154:0x0091, code lost:
    
        if (r0 >= r1) goto L179;
     */
    /* JADX WARN: Code restructure failed: missing block: B:155:0x0093, code lost:
    
        r9.append('`');
        r0 = r0 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:157:0x0099, code lost:
    
        r2 = r2 + r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:160:0x0045, code lost:
    
        flush(r14, r9);
        r0 = r15.substring(r2 + r1, r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:161:0x0052, code lost:
    
        if (r0.length() < 2) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:163:0x005a, code lost:
    
        if (r0.charAt(0) != ' ') goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:165:0x0068, code lost:
    
        if (r0.charAt(r0.length() - 1) != ' ') goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:167:0x0072, code lost:
    
        if (r0.trim().length() <= 0) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:168:0x0074, code lost:
    
        r0 = r0.substring(1, r0.length() - 1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:169:0x007e, code lost:
    
        r2 = r14.len();
        appendText(r14, r0);
        r14.span(r2, r14.len(), 5);
        r2 = r3 + r1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void inline(com.gemini.chat.Markdown.Doc r14, java.lang.String r15) {
        /*
            Method dump skipped, instructions count: 558
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.gemini.chat.Markdown.inline(com.gemini.chat.Markdown$Doc, java.lang.String):void");
    }

    static int[] mathAt(String str, int i) {
        int indexOf;
        int length = str.length();
        boolean z = i + 1 < length && str.charAt(i + 1) == '$';
        int i2 = i + (z ? 2 : 1);
        if (i2 >= length) {
            return null;
        }
        int i3 = i2;
        while (true) {
            indexOf = str.indexOf(z ? "$$" : "$", i3);
            if (indexOf < 0) {
                return null;
            }
            if (indexOf <= 0 || str.charAt(indexOf - 1) != '\\') {
                break;
            }
            i3 = indexOf + 1;
        }
        String substring = str.substring(i2, indexOf);
        if (substring.trim().length() == 0) {
            return null;
        }
        if (!z) {
            if (substring.indexOf(10) >= 0 || isSpace(substring.charAt(0)) || isSpace(substring.charAt(substring.length() - 1))) {
                return null;
            }
            int i4 = indexOf + 1;
            if (i4 < length && Character.isDigit(str.charAt(i4))) {
                return null;
            }
            boolean z2 = substring.length() == 1 && Character.isLetter(substring.charAt(0));
            for (int i5 = 0; i5 < substring.length() && !z2; i5++) {
                z2 = "\\^_=+<>{}".indexOf(substring.charAt(i5)) >= 0;
            }
            if (!z2) {
                return null;
            }
        }
        int i6 = i2;
        while (i6 < indexOf && isSpace(str.charAt(i6))) {
            i6++;
        }
        int i7 = indexOf;
        while (i7 > i6 && isSpace(str.charAt(i7 - 1))) {
            i7--;
        }
        int[] iArr = new int[3];
        iArr[0] = i6;
        iArr[1] = i7;
        iArr[2] = (z ? 2 : 1) + indexOf;
        return iArr;
    }

    private static String[] texArg(String str, int i) {
        while (i < str.length() && str.charAt(i) == ' ') {
            i++;
        }
        if (i >= str.length()) {
            return new String[]{"", String.valueOf(i)};
        }
        if (str.charAt(i) == '{') {
            int i2 = 0;
            for (int i3 = i; i3 < str.length(); i3++) {
                char charAt = str.charAt(i3);
                if (charAt == '{') {
                    i2++;
                } else if (charAt == '}' && i2 - 1 == 0) {
                    return new String[]{str.substring(i + 1, i3), String.valueOf(i3 + 1)};
                }
            }
            return new String[]{str.substring(i + 1), String.valueOf(str.length())};
        }
        if (str.charAt(i) == '\\') {
            int i4 = i + 1;
            while (i4 < str.length() && Character.isLetter(str.charAt(i4))) {
                i4++;
            }
            if (i4 == i + 1 && i4 < str.length()) {
                i4++;
            }
            return new String[]{str.substring(i, i4), String.valueOf(i4)};
        }
        return new String[]{str.substring(i, i + 1), String.valueOf(i + 1)};
    }

    private static boolean simple(String str) {
        for (int i = 0; i < str.length(); i++) {
            if (!Character.isLetterOrDigit(str.charAt(i)) && str.charAt(i) != '.') {
                return false;
            }
        }
        return true;
    }

    public static String texToText(String str) {
        String str2;
        StringBuilder sb = new StringBuilder();
        int length = str.length();
        int i = 0;
        while (i < length) {
            char charAt = str.charAt(i);
            if (charAt == '\\' && i + 1 < length) {
                int i2 = i + 1;
                while (i2 < length && Character.isLetter(str.charAt(i2))) {
                    i2++;
                }
                if (i2 == i + 1) {
                    char charAt2 = str.charAt(i + 1);
                    if (charAt2 == ',' || charAt2 == ';' || charAt2 == ':' || charAt2 == ' ') {
                        sb.append(' ');
                    } else if (charAt2 == '\\') {
                        sb.append('\n');
                    } else if (charAt2 != '!') {
                        sb.append(charAt2);
                    }
                    i += 2;
                } else {
                    String substring = str.substring(i + 1, i2);
                    if (substring.equals("frac") || substring.equals("dfrac") || substring.equals("tfrac")) {
                        String[] texArg = texArg(str, i2);
                        String[] texArg2 = texArg(str, Integer.parseInt(texArg[1]));
                        String texToText = texToText(texArg[0]);
                        String texToText2 = texToText(texArg2[0]);
                        if (!simple(texToText)) {
                            texToText = "(" + texToText + ")";
                        }
                        sb.append(texToText).append('/').append(simple(texToText2) ? texToText2 : "(" + texToText2 + ")");
                        i = Integer.parseInt(texArg2[1]);
                    } else if (substring.equals("sqrt")) {
                        String[] texArg3 = texArg(str, i2);
                        String texToText3 = texToText(texArg3[0]);
                        StringBuilder append = sb.append((char) 8730);
                        if (!simple(texToText3)) {
                            texToText3 = "(" + texToText3 + ")";
                        }
                        append.append(texToText3);
                        i = Integer.parseInt(texArg3[1]);
                    } else if (substring.equals("text") || substring.equals("mathrm") || substring.equals("mathbf") || substring.equals("mathit") || substring.equals("operatorname") || substring.equals("boxed") || substring.equals("textbf") || substring.equals("mbox")) {
                        String[] texArg4 = texArg(str, i2);
                        sb.append((substring.equals("text") || substring.equals("mbox")) ? texArg4[0] : texToText(texArg4[0]));
                        i = Integer.parseInt(texArg4[1]);
                    } else {
                        int i3 = 0;
                        while (true) {
                            if (i3 >= TEX.length) {
                                str2 = null;
                                break;
                            }
                            if (!TEX[i3].equals(substring)) {
                                i3 += 2;
                            } else {
                                str2 = TEX[i3 + 1];
                                break;
                            }
                        }
                        if (str2 == null) {
                            str2 = substring;
                        }
                        sb.append(str2);
                        i = i2;
                    }
                }
            } else if (charAt == '^' || charAt == '_') {
                String[] texArg5 = texArg(str, i + 1);
                String texToText4 = texToText(texArg5[0]);
                int parseInt = Integer.parseInt(texArg5[1]);
                if (charAt == '^' && texToText4.equals("°")) {
                    sb.append(texToText4);
                    i = parseInt;
                } else {
                    StringBuilder sb2 = new StringBuilder();
                    int i4 = 0;
                    while (true) {
                        if (charAt != '^' || i4 >= texToText4.length()) {
                            break;
                        }
                        int indexOf = SUP_FROM.indexOf(texToText4.charAt(i4));
                        if (indexOf < 0) {
                            sb2 = null;
                            break;
                        }
                        sb2.append(SUP_TO.charAt(indexOf));
                        i4++;
                    }
                    if (charAt != '^' || sb2 == null || sb2.length() <= 0) {
                        StringBuilder append2 = sb.append(charAt);
                        if (texToText4.length() != 1 && !simple(texToText4)) {
                            texToText4 = "(" + texToText4 + ")";
                        }
                        append2.append(texToText4);
                        i = parseInt;
                    } else {
                        sb.append((CharSequence) sb2);
                        i = parseInt;
                    }
                }
            } else if (charAt == '{' || charAt == '}') {
                i++;
            } else {
                sb.append(charAt);
                i++;
            }
        }
        return sb.toString();
    }

    private static int count(String str, int i, int i2, char c) {
        int i3 = 0;
        while (i < i2) {
            if (str.charAt(i) == c) {
                i3++;
            }
            i++;
        }
        return i3;
    }

    private static int runLength(String str, int i, char c) {
        int i2 = i;
        while (i2 < str.length() && str.charAt(i2) == c) {
            i2++;
        }
        return i2 - i;
    }

    private static int findBacktickRun(String str, int i, int i2) {
        while (i < str.length()) {
            if (str.charAt(i) == '`') {
                int runLength = runLength(str, i, '`');
                if (runLength != i2) {
                    i += runLength;
                } else {
                    return i;
                }
            } else {
                i++;
            }
        }
        return -1;
    }

    private static boolean canOpen(String str, int i, int i2, char c) {
        int i3 = i + i2;
        if (i3 >= str.length() || isSpace(str.charAt(i3))) {
            return false;
        }
        return (c == '_' && i > 0 && isWordChar(str.charAt(i + (-1)))) ? false : true;
    }

    private static int findCloser(String str, int i, char c, int i2) {
        int length = str.length();
        int i3 = i;
        while (i3 < length) {
            char charAt = str.charAt(i3);
            if (charAt == '\\') {
                i3 += 2;
            } else if (charAt == '`') {
                int runLength = runLength(str, i3, '`');
                int findBacktickRun = findBacktickRun(str, i3 + runLength, runLength);
                i3 = findBacktickRun >= 0 ? findBacktickRun + runLength : i3 + runLength;
            } else if (charAt == c) {
                int runLength2 = runLength(str, i3, c);
                boolean z = i3 > i && !isSpace(str.charAt(i3 + (-1)));
                boolean z2 = (c == '_' && i3 + runLength2 < length && isWordChar(str.charAt(i3 + runLength2))) ? false : true;
                if (runLength2 != i2 || !z || !z2) {
                    if (runLength2 > i2 && z && z2 && c != '~') {
                        return i3 + (runLength2 - i2);
                    }
                    i3 += runLength2;
                } else {
                    return i3;
                }
            } else {
                i3++;
            }
        }
        return -1;
    }

    private static int link(Doc doc, StringBuilder sb, String str, int i) {
        int i2;
        int i3;
        boolean z = str.charAt(i) == '!';
        int i4 = z ? i + 1 : i;
        int i5 = i4;
        int i6 = 0;
        while (true) {
            if (i5 >= str.length()) {
                i2 = -1;
                break;
            }
            char charAt = str.charAt(i5);
            if (charAt == '\\') {
                i5++;
            } else if (charAt != '[') {
                if (charAt == ']' && i6 - 1 == 0) {
                    i2 = i5;
                    break;
                }
            } else {
                i6++;
            }
            i5++;
        }
        if (i2 >= 0 && i2 + 1 < str.length() && str.charAt(i2 + 1) == '(') {
            int i7 = i2 + 1;
            int i8 = 0;
            while (true) {
                if (i7 >= str.length()) {
                    i3 = -1;
                    break;
                }
                char charAt2 = str.charAt(i7);
                if (charAt2 != '(') {
                    if (charAt2 == ')' && i8 - 1 == 0) {
                        i3 = i7;
                        break;
                    }
                } else {
                    i8++;
                }
                i7++;
            }
            if (i3 >= 0) {
                String substring = str.substring(i4 + 1, i2);
                String trim = str.substring(i2 + 2, i3).trim();
                int indexOf = trim.indexOf(32);
                if (indexOf > 0) {
                    trim = trim.substring(0, indexOf);
                }
                String substring2 = (trim.startsWith("<") && trim.endsWith(">")) ? trim.substring(1, trim.length() - 1) : trim;
                flush(doc, sb);
                int len = doc.len();
                if (z) {
                    doc.text.append("[Image");
                    if (substring.trim().length() > 0) {
                        doc.text.append(": ");
                    }
                    appendText(doc, substring.trim());
                    doc.text.append(']');
                    doc.span(len, doc.len(), 23, 0, substring2);
                } else {
                    inline(doc, substring);
                    if (doc.len() == len) {
                        doc.text.append(substring2);
                    }
                    doc.span(len, doc.len(), 6, 0, substring2);
                }
                return i3 + 1;
            }
            return i;
        }
        return i;
    }

    private static void flush(Doc doc, StringBuilder sb) {
        if (sb.length() > 0) {
            appendText(doc, sb.toString());
            sb.setLength(0);
        }
    }

    static void appendText(Doc doc, String str) {
        int length = str.length();
        int i = 0;
        while (i < length) {
            int matchAt = EmojiMap.matchAt(str, i);
            if (matchAt > 0) {
                int len = doc.len();
                doc.text.append(':').append(EmojiMap.nameAt(str, i, matchAt)).append(':');
                doc.span(len, doc.len(), 16);
                i += matchAt;
            } else {
                char charAt = str.charAt(i);
                if (!EmojiMap.isInvisible(charAt)) {
                    doc.text.append(charAt);
                }
                i++;
            }
        }
    }
}
