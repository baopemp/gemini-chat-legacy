package com.gemini.chat;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.InputType;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Settings, top to bottom: API key; time grounding, auto-name, text size; model (+ custom id), thinking level,
 * show thought process; live speech model (+ custom id, thinking level for extended-thinking models), voice;
 * hands-free, mute voice, live text; system instructions. Everything is applied only by "Save Settings".
 * settings.xml holds the fixed parts; the rest is native widgets built here.
 */
public class SettingsActivity extends Activity {
    /**
     * Text models usable on the free tier (ai.google.dev pricing page, 2026-10-23; Gemma 4 is "free only"), newest first:
     * Gemini by version, then the "latest" aliases, then Gemma. The 2.5 family is free but closed to new users;
     * 3.1 Pro / Gemini 4 need billing. Default: ChatActivity.DEFAULT_MODEL. Anything else: "Custom model...".
     */
    static final String[] MODELS = {"gemini-3.8-flash", "gemini-3.6-flash", "gemini-3.5-flash-lite",
            "gemini-3.1-flash-lite", "gemini-3-flash-preview", "gemini-flash-latest", "gemini-flash-lite-latest",
            "gemma-4-31b-it", "gemma-4-26b-a4b-it"};
    static final String CUSTOM = "Custom model...";
    static final String PREF_CUSTOM = "custom_model";
    static final String[] THINKING_LABELS = {"Default", "Minimal", "Low", "Medium", "High"};
    static final String[] THINKING_VALUES = {"", "minimal", "low", "medium", "high"};

    private EditText etApiKey, etSystemInstruction, etCustomModel, etLiveCustom;
    private Spinner spinnerModel, spTextThinking, spTextSize, spLiveModel, spLiveThinking, spVoice, spTts;
    private TextView tvLiveThinking;
    private CheckBox cbAutoName, cbShowThoughts, cbHandsFree, cbMuted, cbLiveText;

    /** "models/gemini-x" or " gemini-x " -> "gemini-x"; null if empty or not a plausible model id. */
    static String normalizeModel(String s) {
        if (s == null) return null;
        s = s.trim();
        if (s.startsWith("models/")) s = s.substring(7);
        if (s.length() == 0 || s.length() > 100) return null;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            boolean ok = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9')
                    || c == '-' || c == '.' || c == '_';
            if (!ok) return null;
        }
        return s;
    }

    static int indexOfModel(String m) {
        return indexOf(MODELS, m);
    }

    private static int indexOf(String[] a, String v) {
        for (int i = 0; i < a.length; i++) if (a[i].equals(v)) return i;
        return -1;
    }

    private static String[] withCustom(String[] models) {
        String[] items = new String[models.length + 1];
        System.arraycopy(models, 0, items, 0, models.length);
        items[models.length] = CUSTOM;
        return items;
    }

    private int dp(float v) {
        return (int) (v * getResources().getDisplayMetrics().density + 0.5f);
    }

    // ---- small native widget helpers ------------------------------------------------------------

    private LinearLayout.LayoutParams fill(int topDp) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.FILL_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(topDp);
        return lp;
    }

    private TextView title(String text) {
        TextView t = new TextView(this);
        t.setText(text);
        t.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        return t;
    }

    private TextView hint(String text) {
        TextView t = new TextView(this);
        t.setText(text);
        t.setTextSize(12f);
        return t;
    }

    private Spinner spinner(String[] items) {
        Spinner sp = new Spinner(this);
        ArrayAdapter<String> a = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, items);
        a.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        sp.setAdapter(a);
        return sp;
    }

    private CheckBox check(String text) {
        CheckBox c = new CheckBox(this);
        c.setText(text);
        return c;
    }

    private EditText modelIdField(String hint) {
        EditText e = new EditText(this);
        e.setHint(hint);
        e.setSingleLine(true);
        e.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        return e;
    }

    /** Inserts views into the settings column before position `at`; returns the position after them. */
    private int insert(ViewGroup parent, int at, View[] views, LinearLayout.LayoutParams[] lps) {
        for (int i = 0; i < views.length; i++) parent.addView(views[i], at++, lps[i]);
        return at;
    }

    // ---- screen ---------------------------------------------------------------------------------

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.settings);
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
        etApiKey = (EditText) findViewById(R.id.et_api_key);
        spinnerModel = (Spinner) findViewById(R.id.spinner_model);
        etSystemInstruction = (EditText) findViewById(R.id.et_system_instruction);
        Button btnSave = (Button) findViewById(R.id.btn_save);
        ViewGroup col = (ViewGroup) spinnerModel.getParent();

        // 1. general: after "Time grounding" (its hint sits right before the "Model" title)
        cbAutoName = check("Auto-name chats");
        spTextSize = spinner(MessageFormatter.TEXT_SIZE_LABELS);
        int at = col.indexOfChild(spinnerModel) - 1;
        at = insert(col, at, new View[]{cbAutoName, hint("Names each chat after its first reply."),
                title("Text size"), spTextSize},
                new LinearLayout.LayoutParams[]{fill(8), fill(0), fill(16), fill(4)});

        // 2. text model: custom id, thinking level, thought process
        spinnerModel.setAdapter(spinner(withCustom(MODELS)).getAdapter());
        etCustomModel = modelIdField("Model ID, e.g. gemini-3.8-pro");
        spTextThinking = spinner(THINKING_LABELS);
        cbShowThoughts = check("Show thought process");
        at = col.indexOfChild(spinnerModel) + 1;
        at = insert(col, at, new View[]{etCustomModel, title("Thinking level"), spTextThinking, cbShowThoughts,
                hint("Hold a reply to see its thoughts.")},
                new LinearLayout.LayoutParams[]{fill(4), fill(16), fill(4), fill(8), fill(0)});

        // 3. live speech: model, custom id, thinking level (extended-thinking models), voice, options
        spLiveModel = spinner(withCustom(LiveActivity.LIVE_MODELS));
        etLiveCustom = modelIdField("Live model ID, e.g. gemini-3.8-live");
        tvLiveThinking = title("Live thinking level");
        spLiveThinking = spinner(new String[]{"Low", "Medium", "High"});
        spVoice = spinner(LiveActivity.VOICES);
        spTts = spinner(ReadAloud.MODELS);
        cbHandsFree = check("Hands-free");
        cbMuted = check("Mute voice");
        cbLiveText = check("Live text while speaking");
        at = insert(col, at, new View[]{title("Live speech model"), spLiveModel, etLiveCustom, tvLiveThinking,
                spLiveThinking, title("Voice"), spVoice, hint("Also used by Read Aloud (hold a reply)."),
                title("Read Aloud model"), spTts, cbHandsFree, hint("Talk freely; the model detects when you stop."),
                cbMuted, hint("Replies are shown as text only."), cbLiveText,
                hint("Shows your words in the text box as you speak.")},
                new LinearLayout.LayoutParams[]{fill(20), fill(4), fill(4), fill(16), fill(4), fill(16), fill(4), fill(0),
                        fill(16), fill(4), fill(12),
                        fill(0), fill(8), fill(0), fill(8), fill(0)});
        // 4. "System instructions", Save and Backups stay last (settings.xml)

        load();
        spinnerModel.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            public void onItemSelected(AdapterView<?> p, View v, int position, long id) {
                updateVisibility();
            }

            public void onNothingSelected(AdapterView<?> p) {
            }
        });
        spLiveModel.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            public void onItemSelected(AdapterView<?> p, View v, int position, long id) {
                updateVisibility();
            }

            public void onNothingSelected(AdapterView<?> p) {
            }
        });
        btnSave.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                save();
            }
        });
        ConfigBinder.bind(this);
        TimeGrounding.bindSetting(this);
    }

    private void load() {
        SharedPreferences sp = getSharedPreferences(ChatActivity.PREFS, 0);
        etApiKey.setText(sp.getString("api_key", ""));
        etSystemInstruction.setText(sp.getString("system_instruction", ""));
        cbAutoName.setChecked(sp.getBoolean("auto_name", true));
        int ts = 1;
        for (int i = 0; i < MessageFormatter.TEXT_SIZES.length; i++) {
            if (MessageFormatter.TEXT_SIZES[i] == sp.getInt("text_size", 14)) ts = i;
        }
        spTextSize.setSelection(ts);

        String model = sp.getString("model", ChatActivity.DEFAULT_MODEL);
        etCustomModel.setText(sp.getString(PREF_CUSTOM, ""));
        int idx = indexOfModel(model);
        if (idx < 0) { // saved model isn't in the list: it's a custom one
            idx = MODELS.length;
            etCustomModel.setText(model);
        }
        spinnerModel.setSelection(idx);
        int ti = indexOf(THINKING_VALUES, sp.getString("thinking_level", ""));
        spTextThinking.setSelection(ti < 0 ? 0 : ti);
        cbShowThoughts.setChecked(sp.getBoolean("show_thoughts", true));

        String lm = sp.getString("live_model", LiveActivity.DEFAULT_LIVE_MODEL);
        etLiveCustom.setText(sp.getString("live_custom_model", ""));
        int li = indexOf(LiveActivity.LIVE_MODELS, lm);
        if (li < 0) {
            li = LiveActivity.LIVE_MODELS.length;
            etLiveCustom.setText(lm);
        }
        spLiveModel.setSelection(li);
        int lt = indexOf(LiveActivity.THINKING, sp.getString("live_thinking", "low"));
        spLiveThinking.setSelection(lt < 0 ? 0 : lt);
        String v = sp.getString("live_voice", LiveActivity.DEFAULT_VOICE);
        for (int i = 0; i < LiveActivity.VOICES.length; i++) {
            if (LiveActivity.voiceName(LiveActivity.VOICES[i]).equals(v)) spVoice.setSelection(i);
        }
        int tts = indexOf(ReadAloud.MODELS, sp.getString("tts_model", ReadAloud.DEFAULT_MODEL));
        spTts.setSelection(tts < 0 ? 0 : tts);
        cbHandsFree.setChecked(sp.getBoolean("live_hands_free", false));
        cbMuted.setChecked(sp.getBoolean("live_muted", false));
        cbLiveText.setChecked(sp.getBoolean("live_text", true));
        updateVisibility();
    }

    private void updateVisibility() {
        boolean custom = spinnerModel.getSelectedItemPosition() == MODELS.length;
        etCustomModel.setVisibility(custom ? View.VISIBLE : View.GONE);
        boolean liveCustom = spLiveModel.getSelectedItemPosition() == LiveActivity.LIVE_MODELS.length;
        etLiveCustom.setVisibility(liveCustom ? View.VISIBLE : View.GONE);
        // the live thinking level only matters for models that require it (custom ids: decided by name at connect time)
        String m = liveCustom ? etLiveCustom.getText().toString()
                : LiveActivity.LIVE_MODELS[Math.max(0, spLiveModel.getSelectedItemPosition())];
        int vis = LiveSession.needsThinkingLevel(m) || liveCustom ? View.VISIBLE : View.GONE;
        tvLiveThinking.setVisibility(vis);
        spLiveThinking.setVisibility(vis);
    }

    private void save() {
        int pos = spinnerModel.getSelectedItemPosition();
        String custom = etCustomModel.getText().toString().trim();
        String model;
        if (pos >= 0 && pos < MODELS.length) {
            model = MODELS[pos];
        } else {
            model = normalizeModel(custom);
            if (model == null) {
                Toast.makeText(this, custom.length() == 0 ? "Enter a model ID, e.g. gemini-3.8-pro"
                        : "Invalid model ID (letters, digits, '-', '.', '_' only)", Toast.LENGTH_LONG).show();
                etCustomModel.requestFocus();
                return;
            }
            custom = model;
        }
        String liveModel;
        int lpos = spLiveModel.getSelectedItemPosition();
        if (lpos >= 0 && lpos < LiveActivity.LIVE_MODELS.length) {
            liveModel = LiveActivity.LIVE_MODELS[lpos];
        } else {
            liveModel = normalizeModel(etLiveCustom.getText().toString());
            if (liveModel == null) {
                String lc = etLiveCustom.getText().toString().trim();
                Toast.makeText(this, lc.length() == 0 ? "Enter a live model ID, e.g. gemini-3.8-live"
                        : "Invalid live model ID (letters, digits, '-', '.', '_' only)", Toast.LENGTH_LONG).show();
                etLiveCustom.requestFocus();
                return;
            }
        }
        SharedPreferences.Editor e = getSharedPreferences(ChatActivity.PREFS, 0).edit();
        e.putString("api_key", etApiKey.getText().toString().trim());
        e.putBoolean("auto_name", cbAutoName.isChecked());
        e.putInt("text_size", MessageFormatter.TEXT_SIZES[Math.max(0, spTextSize.getSelectedItemPosition())]);
        e.putString("model", model);
        e.putString(PREF_CUSTOM, custom);
        e.putString("thinking_level", THINKING_VALUES[Math.max(0, spTextThinking.getSelectedItemPosition())]);
        e.putBoolean("show_thoughts", cbShowThoughts.isChecked());
        e.putString("live_model", liveModel);
        if (lpos == LiveActivity.LIVE_MODELS.length) e.putString("live_custom_model", liveModel);
        e.putString("live_thinking", LiveActivity.THINKING[Math.max(0, spLiveThinking.getSelectedItemPosition())]);
        e.putString("live_voice", LiveActivity.voiceName(LiveActivity.VOICES[Math.max(0, spVoice.getSelectedItemPosition())]));
        e.putString("tts_model", ReadAloud.MODELS[Math.max(0, spTts.getSelectedItemPosition())]);
        e.putBoolean("live_hands_free", cbHandsFree.isChecked());
        e.putBoolean("live_muted", cbMuted.isChecked());
        e.putBoolean("live_text", cbLiveText.isChecked());
        e.putString("system_instruction", etSystemInstruction.getText().toString().trim());
        TimeGrounding.saveSetting(this, e);
        e.commit();
        Toast.makeText(this, "Settings Saved", Toast.LENGTH_SHORT).show();
        finish();
    }
}
