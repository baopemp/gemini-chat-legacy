package com.gemini.chat;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.text.Layout;
import android.text.SpannableStringBuilder;
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
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.gemini.chat.Markdown;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/* loaded from: classes.dex */
public final class MessageFormatter {
    static final int ACCENT = -7686920;
    static final int ACCENT_MODEL = -8271467;
    private static final int ATTR_SELECTABLE_ITEM_BACKGROUND = 16843534;
    static final int BLOCK_BG = -14803167;
    static final int BLOCK_FG = -1512723;
    static final int CODE_BG = -13749964;
    static final int CODE_FG = -141725;
    static final int EMOJI_FG = -610771;
    static final int QUOTE_BAR = -10525848;
    static final int QUOTE_FG = -4341306;
    static final int ROLE_MODEL = -8271467;
    static final int ROLE_SYSTEM = -881790;
    static final int ROLE_USER = -7686920;
    static final int RULE = -12828605;
    static final float TABLE_SCALE = 0.85f;
    static final int TEXT_HEADING = -1;
    static final int TEXT_MODEL = -3355444;
    static final int TEXT_MUTED = -6643546;
    static final int TEXT_SYSTEM = -881790;
    static final int TEXT_USER = -1;
    static final int THUMB_DP = 120;
    static float TEXT_SP = 14.0f;
    static final String[] TEXT_SIZE_LABELS = {"Small", "Normal", "Large", "Extra large"};
    static final int[] TEXT_SIZES = {12, 14, 16, 18};

    static int roleColor(String str) {
        if ("user".equals(str)) {
            return -7686920;
        }
        return "model".equals(str) ? -8271467 : -881790;
    }

    public static void applyPrefs(Context context) {
        TEXT_SP = context.getSharedPreferences("GeminiPrefs", 0).getInt("text_size", 14);
    }

    private MessageFormatter() {
    }

    public static CharSequence format(Context context, String str, String str2, String str3, long j, ArrayList<String> arrayList) {
        String str4;
        EmojiMap.ensureLoaded(context);
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        float f = displayMetrics.density;
        float f2 = displayMetrics.scaledDensity;
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        if ("user".equals(str)) {
            if (j <= 0) {
                j = System.currentTimeMillis();
            }
            str4 = "User (" + new SimpleDateFormat("HH:mm:ss, dd/MM/yyyy").format(new Date(j)) + "):";
        } else if ("model".equals(str)) {
            str4 = (str2 == null || str2.length() <= 0 || "null".equals(str2)) ? "Model:" : "Model (" + str2 + "):";
        } else {
            str4 = "System:";
        }
        int length = spannableStringBuilder.length();
        spannableStringBuilder.append((CharSequence) str4);
        set(spannableStringBuilder, new StyleSpan(1), length, spannableStringBuilder.length());
        set(spannableStringBuilder, new ForegroundColorSpan(roleColor(str)), length, spannableStringBuilder.length());
        spannableStringBuilder.append('\n');
        if ("user".equals(str) && str2 != null && str2.startsWith("data:image/")) {
            int length2 = spannableStringBuilder.length();
            Bitmap fromDataUri = Thumbnail.fromDataUri(str2, (int) ((120.0f * f) + 0.5f));
            if (fromDataUri != null) {
                spannableStringBuilder.append((char) 65532);
                set(spannableStringBuilder, new ImageSpan(context, fromDataUri, 0), length2, spannableStringBuilder.length());
            } else {
                spannableStringBuilder.append((CharSequence) "[Image attached]");
                set(spannableStringBuilder, new StyleSpan(2), length2, spannableStringBuilder.length());
                set(spannableStringBuilder, new ForegroundColorSpan(TEXT_MUTED), length2, spannableStringBuilder.length());
            }
            spannableStringBuilder.append('\n');
        }
        Markdown.Doc parse = ("user".equals(str) || "model".equals(str)) ? Markdown.parse(str3, gridChars(displayMetrics)) : Markdown.plain(str3);
        if (arrayList != null) {
            arrayList.addAll(parse.codeBlocks);
        }
        appendDoc(spannableStringBuilder, parse, f, f2);
        return spannableStringBuilder;
    }

    static int gridChars(DisplayMetrics displayMetrics) {
        float f = displayMetrics.widthPixels - (44.0f * displayMetrics.density);
        Paint paint = new Paint();
        paint.setTypeface(Typeface.MONOSPACE);
        paint.setTextSize(TEXT_SP * TABLE_SCALE * displayMetrics.scaledDensity);
        float measureText = paint.measureText("0");
        if (measureText > 0.0f) {
            return Math.max(12, (int) (f / measureText));
        }
        return 30;
    }

    public static CharSequence formatBody(Context context, String str) {
        EmojiMap.ensureLoaded(context);
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        if (str == null) {
            str = "";
        }
        appendDoc(spannableStringBuilder, Markdown.parse(str, gridChars(displayMetrics)), displayMetrics.density, displayMetrics.scaledDensity);
        return spannableStringBuilder;
    }

    public static CharSequence formatThinking(Context context, String str, String str2) {
        EmojiMap.ensureLoaded(context);
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        spannableStringBuilder.append((CharSequence) ((str == null || str.length() <= 0) ? "Model:" : "Model (" + str + "):"));
        set(spannableStringBuilder, new StyleSpan(1), 0, spannableStringBuilder.length());
        set(spannableStringBuilder, new ForegroundColorSpan(-8271467), 0, spannableStringBuilder.length());
        spannableStringBuilder.append('\n');
        int length = spannableStringBuilder.length();
        spannableStringBuilder.append((CharSequence) "Thinking...");
        set(spannableStringBuilder, new StyleSpan(2), length, spannableStringBuilder.length());
        set(spannableStringBuilder, new ForegroundColorSpan(TEXT_MUTED), length, spannableStringBuilder.length());
        if (str2 != null && str2.trim().length() > 0) {
            spannableStringBuilder.append('\n');
            int length2 = spannableStringBuilder.length();
            appendDoc(spannableStringBuilder, Markdown.parse(str2.trim(), gridChars(displayMetrics)), displayMetrics.density, displayMetrics.scaledDensity);
            set(spannableStringBuilder, new ForegroundColorSpan(TEXT_MUTED), length2, spannableStringBuilder.length());
        }
        return spannableStringBuilder;
    }

    static void appendDoc(SpannableStringBuilder spannableStringBuilder, Markdown.Doc doc, float f, float f2) {
        float f3;
        int length = spannableStringBuilder.length();
        spannableStringBuilder.append((CharSequence) doc.text);
        Paint paint = new Paint(1);
        paint.setTextSize(TEXT_SP * f2);
        Paint paint2 = new Paint(paint);
        paint.setTypeface(Typeface.DEFAULT_BOLD);
        paint2.setTypeface(Typeface.MONOSPACE);
        int i = (int) ((14.0f * f) + 0.5f);
        int i2 = 0;
        while (true) {
            int i3 = i2;
            if (i3 < doc.spans.size()) {
                Markdown.Span span = doc.spans.get(i3);
                int i4 = length + span.start;
                int i5 = length + span.end;
                switch (span.type) {
                    case Markdown.BOLD /* 1 */:
                        set(spannableStringBuilder, new StyleSpan(1), i4, i5);
                        break;
                    case Markdown.ITALIC /* 2 */:
                        set(spannableStringBuilder, new StyleSpan(2), i4, i5);
                        break;
                    case Markdown.BOLD_ITALIC /* 3 */:
                        set(spannableStringBuilder, new StyleSpan(3), i4, i5);
                        break;
                    case Markdown.STRIKE /* 4 */:
                        set(spannableStringBuilder, new StrikethroughSpan(), i4, i5);
                        break;
                    case Markdown.CODE /* 5 */:
                        set(spannableStringBuilder, new TypefaceSpan("monospace"), i4, i5);
                        set(spannableStringBuilder, new BackgroundColorSpan(CODE_BG), i4, i5);
                        set(spannableStringBuilder, new ForegroundColorSpan(CODE_FG), i4, i5);
                        break;
                    case Markdown.LINK /* 6 */:
                        set(spannableStringBuilder, new URLSpan(span.arg), i4, i5);
                        break;
                    case Markdown.HEADING /* 7 */:
                        if (span.level == 1) {
                            f3 = 1.45f;
                        } else {
                            f3 = span.level == 2 ? 1.28f : span.level == 3 ? 1.12f : 1.0f;
                        }
                        if (f3 != 1.0f) {
                            set(spannableStringBuilder, new RelativeSizeSpan(f3), i4, i5);
                        }
                        set(spannableStringBuilder, new StyleSpan(1), i4, i5);
                        set(spannableStringBuilder, new ForegroundColorSpan(span.level <= 3 ? -1 : TEXT_MODEL), i4, i5);
                        break;
                    case Markdown.CODE_BLOCK /* 8 */:
                        set(spannableStringBuilder, new BlockSpan(BLOCK_BG, (int) ((8.0f * f) + 0.5f)), i4, i5);
                        set(spannableStringBuilder, new TypefaceSpan("monospace"), i4, i5);
                        set(spannableStringBuilder, new RelativeSizeSpan(0.88f), i4, i5);
                        set(spannableStringBuilder, new ForegroundColorSpan(BLOCK_FG), i4, i5);
                        break;
                    case Markdown.CODE_LANG /* 9 */:
                        set(spannableStringBuilder, new ForegroundColorSpan(TEXT_MUTED), i4, i5);
                        set(spannableStringBuilder, new RelativeSizeSpan(TABLE_SCALE), i4, i5);
                        break;
                    case Markdown.QUOTE /* 10 */:
                        set(spannableStringBuilder, new QuoteBarSpan(QUOTE_BAR, (int) ((3.0f * f) + 0.5f), (int) ((10.0f * f) + 0.5f)), i4, i5);
                        set(spannableStringBuilder, new ForegroundColorSpan(QUOTE_FG), i4, i5);
                        break;
                    case Markdown.LIST_ITEM /* 11 */:
                    case Markdown.LIST_CONT /* 12 */:
                        int i6 = span.level * i;
                        String trim = span.arg.trim();
                        int measureText = ((int) ((trim.startsWith("[") ? paint2 : paint).measureText(trim) + paint.measureText(" ") + 0.5f)) + i6;
                        set(spannableStringBuilder, new LeadingMarginSpan.Standard(span.type == 11 ? i6 : measureText, measureText), i4, i5);
                        break;
                    case Markdown.BULLET /* 13 */:
                        set(spannableStringBuilder, new ForegroundColorSpan(-7686920), i4, i5);
                        if (span.level != 1) {
                            set(spannableStringBuilder, new StyleSpan(1), i4, i5);
                            break;
                        } else {
                            set(spannableStringBuilder, new TypefaceSpan("monospace"), i4, i5);
                            break;
                        }
                    case Markdown.TASK_DONE /* 14 */:
                        set(spannableStringBuilder, new StrikethroughSpan(), i4, i5);
                        set(spannableStringBuilder, new ForegroundColorSpan(TEXT_MUTED), i4, i5);
                        break;
                    case Markdown.RULE /* 15 */:
                        set(spannableStringBuilder, new RuleSpan(RULE, Math.max(1, (int) (0.5f + f))), i4, i5);
                        break;
                    case Markdown.EMOJI /* 16 */:
                        set(spannableStringBuilder, new ForegroundColorSpan(EMOJI_FG), i4, i5);
                        break;
                    case Markdown.TABLE_GRID /* 17 */:
                        set(spannableStringBuilder, new TypefaceSpan("monospace"), i4, i5);
                        set(spannableStringBuilder, new RelativeSizeSpan(TABLE_SCALE), i4, i5);
                        break;
                    case Markdown.TABLE_HEAD /* 18 */:
                        set(spannableStringBuilder, new StyleSpan(1), i4, i5);
                        set(spannableStringBuilder, new ForegroundColorSpan(-1), i4, i5);
                        break;
                    case Markdown.TABLE_TITLE /* 19 */:
                        set(spannableStringBuilder, new StyleSpan(1), i4, i5);
                        set(spannableStringBuilder, new ForegroundColorSpan(-7686920), i4, i5);
                        break;
                    case Markdown.TABLE_KEY /* 20 */:
                    case Markdown.MUTED /* 21 */:
                        set(spannableStringBuilder, new ForegroundColorSpan(TEXT_MUTED), i4, i5);
                        break;
                    case Markdown.GAP /* 22 */:
                        set(spannableStringBuilder, new RelativeSizeSpan(0.45f), i4, i5);
                        break;
                    case Markdown.IMAGE /* 23 */:
                        set(spannableStringBuilder, new URLSpan(span.arg), i4, i5);
                        set(spannableStringBuilder, new StyleSpan(2), i4, i5);
                        break;
                }
                i2 = i3 + 1;
            } else {
                return;
            }
        }
    }

    private static void set(SpannableStringBuilder spannableStringBuilder, Object obj, int i, int i2) {
        if (i2 > i) {
            spannableStringBuilder.setSpan(obj, i, i2, 33);
        }
    }

    public static void styleView(TextView textView, String str) {
        int i;
        float f = textView.getResources().getDisplayMetrics().density;
        boolean equals = "user".equals(str);
        boolean z = (equals || "model".equals(str)) ? false : true;
        textView.setTextSize(TEXT_SP);
        if (equals) {
            i = -1;
        } else {
            i = z ? -881790 : TEXT_MODEL;
        }
        textView.setTextColor(i);
        textView.setLinkTextColor(-7686920);
        textView.setLineSpacing(1.5f * f, 1.0f);
        textView.setHighlightColor(0);
        textView.setMovementMethod(LinkMovementMethod.getInstance());
        textView.setLongClickable(true);
        int i2 = (int) ((10.0f * f) + 0.5f);
        int i3 = (int) ((6.0f * f) + 0.5f);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.setMargins(i2, i3, i2, (int) ((14.0f * f) + 0.5f));
        textView.setLayoutParams(layoutParams);
        textView.setBackgroundDrawable(new LayerDrawable(new Drawable[]{new RoleBar(roleColor(str), Math.max(2, (int) ((f * 3.0f) + 0.5f))), pressFeedback(textView)}));
        textView.setPadding(i2, i3, i2, i3);
    }

    static Drawable pressFeedback(View view) {
        Drawable drawable = null;
        if (Build.VERSION.SDK_INT >= 11) {
            try {
                TypedArray obtainStyledAttributes = view.getContext().obtainStyledAttributes(new int[]{16843534});
                drawable = obtainStyledAttributes.getDrawable(0);
                obtainStyledAttributes.recycle();
            } catch (Exception e) {
            }
        }
        return drawable == null ? view.getResources().getDrawable(android.R.drawable.list_selector_background) : drawable;
    }

    static final class RoleBar extends Drawable {
        private final Paint paint = new Paint();
        private final int width;

        RoleBar(int i, int i2) {
            this.paint.setColor(i);
            this.width = i2;
        }

        @Override // android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            canvas.drawRect(bounds.left, bounds.top, bounds.left + this.width, bounds.bottom, this.paint);
        }

        @Override // android.graphics.drawable.Drawable
        public void setAlpha(int i) {
            this.paint.setAlpha(i);
        }

        @Override // android.graphics.drawable.Drawable
        public void setColorFilter(ColorFilter colorFilter) {
            this.paint.setColorFilter(colorFilter);
        }

        @Override // android.graphics.drawable.Drawable
        public int getOpacity() {
            return -3;
        }
    }

    static final class BlockSpan implements LineBackgroundSpan, LeadingMarginSpan {
        private final int color;
        private final int pad;

        BlockSpan(int i, int i2) {
            this.color = i;
            this.pad = i2;
        }

        @Override // android.text.style.LineBackgroundSpan
        public void drawBackground(Canvas canvas, Paint paint, int i, int i2, int i3, int i4, int i5, CharSequence charSequence, int i6, int i7, int i8) {
            int color = paint.getColor();
            Paint.Style style = paint.getStyle();
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(this.color);
            canvas.drawRect(i, i3, i2, i5, paint);
            paint.setColor(color);
            paint.setStyle(style);
        }

        @Override // android.text.style.LeadingMarginSpan
        public int getLeadingMargin(boolean z) {
            return this.pad;
        }

        @Override // android.text.style.LeadingMarginSpan
        public void drawLeadingMargin(Canvas canvas, Paint paint, int i, int i2, int i3, int i4, int i5, CharSequence charSequence, int i6, int i7, boolean z, Layout layout) {
        }
    }

    static final class RuleSpan implements LineBackgroundSpan {
        private final int color;
        private final int thickness;

        RuleSpan(int i, int i2) {
            this.color = i;
            this.thickness = i2;
        }

        @Override // android.text.style.LineBackgroundSpan
        public void drawBackground(Canvas canvas, Paint paint, int i, int i2, int i3, int i4, int i5, CharSequence charSequence, int i6, int i7, int i8) {
            int color = paint.getColor();
            Paint.Style style = paint.getStyle();
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(this.color);
            canvas.drawRect(i, (i3 + i5) / 2, i2, r0 + this.thickness, paint);
            paint.setColor(color);
            paint.setStyle(style);
        }
    }

    static final class QuoteBarSpan implements LeadingMarginSpan {
        private final int color;
        private final int gap;
        private final int width;

        QuoteBarSpan(int i, int i2, int i3) {
            this.color = i;
            this.width = i2;
            this.gap = i3;
        }

        @Override // android.text.style.LeadingMarginSpan
        public int getLeadingMargin(boolean z) {
            return this.width + this.gap;
        }

        @Override // android.text.style.LeadingMarginSpan
        public void drawLeadingMargin(Canvas canvas, Paint paint, int i, int i2, int i3, int i4, int i5, CharSequence charSequence, int i6, int i7, boolean z, Layout layout) {
            int color = paint.getColor();
            Paint.Style style = paint.getStyle();
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(this.color);
            int i8 = (this.width * i2) + i;
            canvas.drawRect(Math.min(i, i8), i3, Math.max(i, i8), i5, paint);
            paint.setColor(color);
            paint.setStyle(style);
        }
    }
}
