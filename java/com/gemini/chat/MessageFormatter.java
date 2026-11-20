package com.gemini.chat;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.view.View;
import android.os.Build;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.content.res.TypedArray;
import android.text.Layout;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.method.LinkMovementMethod;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.ImageSpan;
import android.text.style.LeadingMarginSpan;
import android.text.style.LineBackgroundSpan;
import android.text.style.RelativeSizeSpan;
import android.text.style.StrikethroughSpan;
import android.text.style.StyleSpan;
import android.text.style.TypefaceSpan;
import android.text.style.URLSpan;
import android.util.DisplayMetrics;
import android.view.Gravity;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/**
 * Builds the styled text and the row style of one chat message (replaces the old
 * Html.fromHtml rendering). Only API 7 classes are used (compiled against android-7.jar).
 */
public final class MessageFormatter {

    // palette (dark theme, Gemini-like)
    static final int TEXT_USER = 0xFFFFFFFF;
    static final int TEXT_MODEL = 0xFFCCCCCC;
    static final int TEXT_SYSTEM = 0xFFF28B82;
    static final int TEXT_MUTED = 0xFF9AA0A6;
    static final int TEXT_HEADING = 0xFFFFFFFF;
    static final int ACCENT = 0xFF8AB4F8;
    static final int ACCENT_MODEL = 0xFF81C995;
    /** Role colors (header text + the bar on the left of each message): user blue, model green, system red. */
    static final int ROLE_USER = 0xFF8AB4F8;
    static final int ROLE_MODEL = 0xFF81C995;
    static final int ROLE_SYSTEM = 0xFFF28B82;

    static int roleColor(String role) {
        return "user".equals(role) ? ROLE_USER : "model".equals(role) ? ROLE_MODEL : ROLE_SYSTEM;
    }
    static final int CODE_FG = 0xFFFDD663;
    static final int CODE_BG = 0xFF2E3134;
    static final int BLOCK_BG = 0xFF1E1F21;
    static final int BLOCK_BORDER = 0xFF5F6368;
    static final int BLOCK_FG = 0xFFE8EAED;
    static final int QUOTE_BAR = 0xFF5F6368;
    static final int QUOTE_FG = 0xFFBDC1C6;
    static final int RULE = 0xFF3C4043;
    static final int EMOJI_FG = 0xFFF6AE2D;
    static final int HEADER_META = 0xFF9AA0A6;

    /** Message text size in sp (Settings > Text size; 14 = Normal). Set by applyPrefs(). */
    static float TEXT_SP = 14f;
    static final String[] TEXT_SIZE_LABELS = {"Small", "Normal", "Large", "Extra large"};
    static final int[] TEXT_SIZES = {12, 14, 16, 18};

    /** Reads Settings > Text size (call before rendering messages). */
    public static void applyPrefs(android.content.Context c) {
        TEXT_SP = c.getSharedPreferences(ChatActivity.PREFS, 0).getInt("text_size", 14);
    }
    static final int THUMB_DP = 120;

    private MessageFormatter() {
    }

    private static SimpleDateFormat cachedTsFmt;
    private static Locale cachedTsLocale;
    private static TimeZone cachedTsTz;
    private static final Date cachedDate = new Date();

    private static int cachedGridWidth = -1, cachedGridChars = 30;
    private static float cachedGridDensity = -1f, cachedGridScaled = -1f, cachedGridSp = -1f;
    private static Paint cachedMeasure, cachedMeasureTask;
    private static float cachedMeasureSize = -1f;

    /** Reuses a single SimpleDateFormat on weak phones while tracking locale/timezone changes. */
    private static synchronized String formatTimestamp(long ts) {
        Locale loc = Locale.getDefault();
        TimeZone tz = TimeZone.getDefault();
        if (cachedTsFmt == null || !loc.equals(cachedTsLocale) || !tz.equals(cachedTsTz)) {
            cachedTsFmt = new SimpleDateFormat("HH:mm:ss, dd/MM/yyyy", loc);
            cachedTsFmt.setTimeZone(tz);
            cachedTsLocale = loc;
            cachedTsTz = tz;
        }
        cachedDate.setTime(ts);
        return cachedTsFmt.format(cachedDate);
    }

    /** Appends a role header where the role label pops in bold accent and the parenthetical metadata is refined. */
    private static void appendHeader(SpannableStringBuilder out, String role, String model, long timestamp) {
        int hs = out.length();
        String label;
        String meta = null;
        if ("user".equals(role)) {
            long ts = timestamp > 0 ? timestamp : System.currentTimeMillis();
            label = "User";
            meta = " (" + formatTimestamp(ts) + "):";
        } else if ("model".equals(role)) {
            label = "Model";
            meta = model != null && model.length() > 0 && !"null".equals(model) ? " (" + model + "):" : ":";
        } else {
            label = "System:";
        }
        out.append(label);
        set(out, new StyleSpan(Typeface.BOLD), hs, out.length());
        set(out, new ForegroundColorSpan(roleColor(role)), hs, out.length());
        if (meta != null) {
            int ms = out.length();
            out.append(meta);
            if (meta.length() > 1) {
                set(out, new RelativeSizeSpan(0.88f), ms, out.length());
                set(out, new ForegroundColorSpan(HEADER_META), ms, out.length());
            } else {
                set(out, new StyleSpan(Typeface.BOLD), ms, out.length());
                set(out, new ForegroundColorSpan(roleColor(role)), ms, out.length());
            }
        }
        out.append('\n');
    }

    /**
     * Header + rendered body. Fenced code blocks are added to codeBlocksOut (for "Copy Code Block N").
     * For user messages, `model` holds the inline image data URI when an image was attached.
     */
    public static CharSequence format(Context ctx, String role, String model, String text, long timestamp,
                                      ArrayList<String> codeBlocksOut) {
        EmojiMap.ensureLoaded(ctx);
        DisplayMetrics dm = ctx.getResources().getDisplayMetrics();
        float density = dm.density;
        float sp = dm.scaledDensity;
        SpannableStringBuilder out = new SpannableStringBuilder();

        appendHeader(out, role, model, timestamp);

        // ---- attachment: small preview (max 120 dp), text marker if it can't be decoded
        if ("user".equals(role) && model != null && model.startsWith("data:image/")) {
            int s = out.length();
            Bitmap thumb = Thumbnail.fromDataUri(model, (int) (THUMB_DP * density + 0.5f));
            if (thumb != null) {
                out.append('\uFFFC');
                set(out, new ImageSpan(ctx, thumb, ImageSpan.ALIGN_BOTTOM), s, out.length());
            } else {
                out.append("[Image attached]");
                set(out, new StyleSpan(Typeface.ITALIC), s, out.length());
                set(out, new ForegroundColorSpan(TEXT_MUTED), s, out.length());
            }
            out.append('\n');
        }

        // ---- body
        Markdown.Doc doc = "user".equals(role) || "model".equals(role)
                ? Markdown.parse(text, gridChars(dm)) : Markdown.plain(text);
        if (codeBlocksOut != null) codeBlocksOut.addAll(doc.codeBlocks);
        appendDoc(out, doc, density, sp);
        return out;
    }

    /** Live-streaming reply: formatted answer with a subtle green cursor glyph at the tail. */
    public static CharSequence formatStreaming(Context ctx, String model, String text) {
        SpannableStringBuilder out = (SpannableStringBuilder) format(ctx, "model", model, text, 0L, null);
        int cs = out.length();
        out.append(" \u258E");
        set(out, new ForegroundColorSpan(ROLE_MODEL), cs, out.length());
        return out;
    }

    /** How many monospace table characters fit in a full-width bubble on this screen (cached). */
    static int gridChars(DisplayMetrics dm) {
        if (dm.widthPixels == cachedGridWidth && dm.density == cachedGridDensity
                && dm.scaledDensity == cachedGridScaled && TEXT_SP == cachedGridSp) {
            return cachedGridChars;
        }
        float avail = dm.widthPixels - (10 + 10 + 10 + 10 + 4) * dm.density;
        Paint p = new Paint();
        p.setTypeface(Typeface.MONOSPACE);
        p.setTextSize(TEXT_SP * TABLE_SCALE * dm.scaledDensity);
        float w = p.measureText("0");
        cachedGridChars = w > 0 ? Math.max(12, (int) (avail / w)) : 30;
        cachedGridWidth = dm.widthPixels;
        cachedGridDensity = dm.density;
        cachedGridScaled = dm.scaledDensity;
        cachedGridSp = TEXT_SP;
        return cachedGridChars;
    }

    static final float TABLE_SCALE = 0.85f;

    /** Markdown body only (no header): the "Thought Process" dialog. */
    public static CharSequence formatBody(Context ctx, String text) {
        EmojiMap.ensureLoaded(ctx);
        DisplayMetrics dm = ctx.getResources().getDisplayMetrics();
        SpannableStringBuilder out = new SpannableStringBuilder();
        appendDoc(out, Markdown.parse(text == null ? "" : text, gridChars(dm)), dm.density, dm.scaledDensity);
        return out;
    }

    /** A reply that is still thinking: header, animated "Thinking . / .. / ...", then the streamed thought summary. */
    public static CharSequence formatThinking(Context ctx, String model, String thoughts) {
        return formatWaiting(ctx, model, thoughts, 3);
    }

    public static CharSequence formatWaiting(Context ctx, String model, String thoughts, int dots) {
        EmojiMap.ensureLoaded(ctx);
        DisplayMetrics dm = ctx.getResources().getDisplayMetrics();
        SpannableStringBuilder out = new SpannableStringBuilder();
        appendHeader(out, "model", model, 0L);
        int s = out.length();
        int n = Math.max(1, Math.min(3, dots));
        out.append("Thinking");
        for (int i = 0; i < n; i++) out.append('.');
        set(out, new StyleSpan(Typeface.ITALIC), s, out.length());
        set(out, new ForegroundColorSpan(ROLE_MODEL), s, out.length());
        if (thoughts != null && thoughts.trim().length() > 0) {
            out.append('\n');
            int b = out.length();
            appendDoc(out, Markdown.parse(thoughts.trim(), gridChars(dm)), dm.density, dm.scaledDensity);
            set(out, new ForegroundColorSpan(TEXT_MUTED), b, out.length());
        }
        return out;
    }

    static void appendDoc(SpannableStringBuilder out, Markdown.Doc doc, float density, float scaledDensity) {
        int base = out.length();
        out.append(doc.text);
        Paint measure = null, measureTask = null;
        int indentStep = (int) (14 * density + 0.5f);
        for (int k = 0; k < doc.spans.size(); k++) {
            Markdown.Span sp = doc.spans.get(k);
            int s = base + sp.start, e = base + sp.end;
            switch (sp.type) {
                case Markdown.BOLD:
                    set(out, new StyleSpan(Typeface.BOLD), s, e);
                    break;
                case Markdown.ITALIC:
                    set(out, new StyleSpan(Typeface.ITALIC), s, e);
                    break;
                case Markdown.BOLD_ITALIC:
                    set(out, new StyleSpan(Typeface.BOLD_ITALIC), s, e);
                    break;
                case Markdown.STRIKE:
                    set(out, new StrikethroughSpan(), s, e);
                    break;
                case Markdown.CODE:
                    set(out, new TypefaceSpan("monospace"), s, e);
                    set(out, new BackgroundColorSpan(CODE_BG), s, e);
                    set(out, new ForegroundColorSpan(CODE_FG), s, e);
                    break;
                case Markdown.LINK:
                    set(out, new URLSpan(sp.arg), s, e);
                    break;
                case Markdown.IMAGE:
                    set(out, new URLSpan(sp.arg), s, e);
                    set(out, new StyleSpan(Typeface.ITALIC), s, e);
                    break;
                case Markdown.HEADING: {
                    float size = sp.level == 1 ? 1.45f : sp.level == 2 ? 1.28f : sp.level == 3 ? 1.12f : 1.0f;
                    if (size != 1.0f) set(out, new RelativeSizeSpan(size), s, e);
                    set(out, new StyleSpan(Typeface.BOLD), s, e);
                    set(out, new ForegroundColorSpan(sp.level <= 3 ? TEXT_HEADING : TEXT_MODEL), s, e);
                    break;
                }
                case Markdown.CODE_BLOCK:
                    set(out, new BlockSpan(BLOCK_BG, BLOCK_BORDER, Math.max(1, (int) (2 * density + 0.5f)),
                            (int) (10 * density + 0.5f)), s, e);
                    set(out, new TypefaceSpan("monospace"), s, e);
                    set(out, new RelativeSizeSpan(0.88f), s, e);
                    set(out, new ForegroundColorSpan(BLOCK_FG), s, e);
                    break;
                case Markdown.CODE_LANG:
                    set(out, new ForegroundColorSpan(ACCENT), s, e);
                    set(out, new StyleSpan(Typeface.BOLD), s, e);
                    set(out, new RelativeSizeSpan(0.82f), s, e);
                    break;
                case Markdown.QUOTE:
                    set(out, new QuoteBarSpan(QUOTE_BAR, (int) (3 * density + 0.5f), (int) (10 * density + 0.5f)), s, e);
                    set(out, new ForegroundColorSpan(QUOTE_FG), s, e);
                    break;
                case Markdown.LIST_ITEM:
                case Markdown.LIST_CONT: {
                    if (measure == null) {
                        float px = TEXT_SP * scaledDensity;
                        if (cachedMeasure == null || cachedMeasureSize != px) {
                            cachedMeasure = new Paint(Paint.ANTI_ALIAS_FLAG);
                            cachedMeasure.setTextSize(px);
                            cachedMeasure.setTypeface(Typeface.DEFAULT_BOLD);
                            cachedMeasureTask = new Paint(Paint.ANTI_ALIAS_FLAG);
                            cachedMeasureTask.setTextSize(px);
                            cachedMeasureTask.setTypeface(Typeface.MONOSPACE);
                            cachedMeasureSize = px;
                        }
                        measure = cachedMeasure;
                        measureTask = cachedMeasureTask;
                    }
                    int first = sp.level * indentStep;
                    String marker = sp.arg.trim();
                    Paint mp = marker.startsWith("[") ? measureTask : measure;
                    int rest = first + (int) (mp.measureText(marker) + measure.measureText(" ") + 0.5f);
                    set(out, new LeadingMarginSpan.Standard(sp.type == Markdown.LIST_ITEM ? first : rest, rest), s, e);
                    break;
                }
                case Markdown.BULLET:
                    set(out, new ForegroundColorSpan(ACCENT), s, e);
                    if (sp.level == 1) set(out, new TypefaceSpan("monospace"), s, e);
                    else set(out, new StyleSpan(Typeface.BOLD), s, e);
                    break;
                case Markdown.TASK_DONE:
                    set(out, new StrikethroughSpan(), s, e);
                    set(out, new ForegroundColorSpan(TEXT_MUTED), s, e);
                    break;
                case Markdown.RULE:
                    set(out, new RuleSpan(RULE, Math.max(1, (int) (density + 0.5f))), s, e);
                    break;
                case Markdown.EMOJI:
                    set(out, new ForegroundColorSpan(EMOJI_FG), s, e);
                    break;
                case Markdown.TABLE_GRID:
                    set(out, new TypefaceSpan("monospace"), s, e);
                    set(out, new RelativeSizeSpan(TABLE_SCALE), s, e);
                    break;
                case Markdown.TABLE_HEAD:
                    set(out, new StyleSpan(Typeface.BOLD), s, e);
                    set(out, new ForegroundColorSpan(TEXT_HEADING), s, e);
                    break;
                case Markdown.TABLE_TITLE:
                    set(out, new StyleSpan(Typeface.BOLD), s, e);
                    set(out, new ForegroundColorSpan(ACCENT), s, e);
                    break;
                case Markdown.TABLE_KEY:
                case Markdown.MUTED:
                    set(out, new ForegroundColorSpan(TEXT_MUTED), s, e);
                    break;
                case Markdown.GAP:
                    set(out, new RelativeSizeSpan(0.45f), s, e);
                    break;
                default:
                    break;
            }
        }
    }

    private static void set(SpannableStringBuilder sb, Object span, int s, int e) {
        if (e > s) sb.setSpan(span, s, e, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    }

    /** Plain full-width message rows (no bubbles), as in earlier versions; pressed/focused highlight only. */
    public static void styleView(TextView tv, String role) {
        float d = tv.getResources().getDisplayMetrics().density;
        boolean user = "user".equals(role);
        boolean system = !user && !"model".equals(role);

        tv.setTextSize(TEXT_SP);
        tv.setTextColor(user ? TEXT_USER : system ? TEXT_SYSTEM : TEXT_MODEL);
        tv.setLinkTextColor(ACCENT);
        tv.setLineSpacing(1.5f * d, 1.0f);
        tv.setHighlightColor(0x00000000);
        tv.setMovementMethod(LinkMovementMethod.getInstance());
        tv.setLongClickable(true);

        int ph = (int) (10 * d + 0.5f), pv = (int) (6 * d + 0.5f);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.FILL_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        lp.setMargins(ph, pv, ph, (int) (14 * d + 0.5f));
        tv.setLayoutParams(lp);

        // role bar under the platform's own press feedback (ripple / selector keeps working)
        tv.setBackgroundDrawable(new LayerDrawable(new Drawable[]{
                new RoleBar(roleColor(role), Math.max(2, (int) (3 * d + 0.5f))), pressFeedback(tv)}));
        // padding after the background: setBackgroundDrawable() may replace it with the drawable's own padding
        tv.setPadding(ph, pv, ph, pv);
    }

    /** android.R.attr.selectableItemBackground (API 11; not in the API 7 android.jar, so the raw id). */
    private static final int ATTR_SELECTABLE_ITEM_BACKGROUND = 0x0101030e;

    /**
     * Touch feedback for a message row, always the platform's own: the theme's selectableItemBackground on 3.0+
     * (Material ripple on 5.0+, Holo highlight on 3.x/4.x), the system list selector on 2.x (with its long-press fade).
     */
    static Drawable pressFeedback(View v) {
        Drawable d = null;
        if (Build.VERSION.SDK_INT >= 11) {
            try {
                TypedArray a = v.getContext().obtainStyledAttributes(new int[]{ATTR_SELECTABLE_ITEM_BACKGROUND});
                d = a.getDrawable(0); // themed, so the 5.0+ ripple resolves ?android:colorControlHighlight
                a.recycle();
            } catch (Exception ignored) {
            }
        }
        if (d == null) d = v.getResources().getDrawable(android.R.drawable.list_selector_background);
        return d;
    }

    /** A thin vertical bar on the left edge, in the message's role color. */
    static final class RoleBar extends Drawable {
        private final Paint paint = new Paint();
        private final int width;

        RoleBar(int color, int width) {
            paint.setColor(color);
            this.width = width;
        }

        public void draw(Canvas c) {
            android.graphics.Rect b = getBounds();
            c.drawRect(b.left, b.top, b.left + width, b.bottom, paint);
        }

        public void setAlpha(int a) {
            paint.setAlpha(a);
        }

        public void setColorFilter(android.graphics.ColorFilter cf) {
            paint.setColorFilter(cf);
        }

        public int getOpacity() {
            return android.graphics.PixelFormat.TRANSLUCENT;
        }
    }

    // ---- custom spans ------------------------------------------------------------------------

    /** Full-width background behind code-block lines, with a crisp left accent border and left padding. */
    static final class BlockSpan implements LineBackgroundSpan, LeadingMarginSpan {
        private final int color, border, borderW, pad;

        BlockSpan(int color, int border, int borderW, int pad) {
            this.color = color;
            this.border = border;
            this.borderW = borderW;
            this.pad = pad;
        }

        public void drawBackground(Canvas c, Paint p, int left, int right, int top, int baseline, int bottom,
                                   CharSequence text, int start, int end, int lnum) {
            int old = p.getColor();
            Paint.Style oldStyle = p.getStyle();
            p.setStyle(Paint.Style.FILL);
            p.setColor(color);
            c.drawRect(left, top, right, bottom, p);
            p.setColor(border);
            c.drawRect(left, top, left + borderW, bottom, p);
            p.setColor(old);
            p.setStyle(oldStyle);
        }

        public int getLeadingMargin(boolean first) {
            return pad;
        }

        public void drawLeadingMargin(Canvas c, Paint p, int x, int dir, int top, int baseline, int bottom,
                                      CharSequence text, int start, int end, boolean first, Layout layout) {
        }
    }

    /** Horizontal rule: a thin line through the middle of its (empty) line. */
    static final class RuleSpan implements LineBackgroundSpan {
        private final int color, thickness;

        RuleSpan(int color, int thickness) {
            this.color = color;
            this.thickness = thickness;
        }

        public void drawBackground(Canvas c, Paint p, int left, int right, int top, int baseline, int bottom,
                                   CharSequence text, int start, int end, int lnum) {
            int old = p.getColor();
            Paint.Style oldStyle = p.getStyle();
            p.setStyle(Paint.Style.FILL);
            p.setColor(color);
            int mid = (top + bottom) / 2;
            c.drawRect(left, mid, right, mid + thickness, p);
            p.setColor(old);
            p.setStyle(oldStyle);
        }
    }

    /** Block-quote bar (wider and better spaced than android.text.style.QuoteSpan). */
    static final class QuoteBarSpan implements LeadingMarginSpan {
        private final int color, width, gap;

        QuoteBarSpan(int color, int width, int gap) {
            this.color = color;
            this.width = width;
            this.gap = gap;
        }

        public int getLeadingMargin(boolean first) {
            return width + gap;
        }

        public void drawLeadingMargin(Canvas c, Paint p, int x, int dir, int top, int baseline, int bottom,
                                      CharSequence text, int start, int end, boolean first, Layout layout) {
            int old = p.getColor();
            Paint.Style oldStyle = p.getStyle();
            p.setStyle(Paint.Style.FILL);
            p.setColor(color);
            int x2 = x + dir * width;
            c.drawRect(Math.min(x, x2), top, Math.max(x, x2), bottom, p);
            p.setColor(old);
            p.setStyle(oldStyle);
        }
    }
}
