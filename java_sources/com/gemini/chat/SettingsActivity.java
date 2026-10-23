package com.gemini.chat;

import android.app.Activity;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import android.widget.Toast;

/* loaded from: classes.dex */
public class SettingsActivity extends Activity {
    static final String CUSTOM = "Custom model...";
    static final String PREF_CUSTOM = "custom_model";
    private CheckBox cbAutoName;
    private CheckBox cbHandsFree;
    private CheckBox cbLiveText;
    private CheckBox cbMuted;
    private CheckBox cbShowThoughts;
    private EditText etApiKey;
    private EditText etCustomModel;
    private EditText etLiveCustom;
    private EditText etSystemInstruction;
    private Spinner spLiveModel;
    private Spinner spLiveThinking;
    private Spinner spTextSize;
    private Spinner spTextThinking;
    private Spinner spVoice;
    private Spinner spinnerModel;
    private TextView tvLiveThinking;
    static final String[] MODELS = {"gemini-3.8-flash", "gemini-3.6-flash", "gemini-3.5-flash-lite", "gemini-3.1-flash-lite", "gemini-3-flash-preview", "gemini-flash-latest", "gemini-flash-lite-latest", "gemma-4-31b-it", "gemma-4-26b-a4b-it"};
    static final String[] THINKING_LABELS = {"Default", "Minimal", "Low", "Medium", "High"};
    static final String[] THINKING_VALUES = {"", "minimal", "low", "medium", "high"};

    static String normalizeModel(String str) {
        if (str == null) {
            return null;
        }
        String trim = str.trim();
        if (trim.startsWith("models/")) {
            trim = trim.substring(7);
        }
        if (trim.length() == 0 || trim.length() > 100) {
            return null;
        }
        for (int i = 0; i < trim.length(); i++) {
            char charAt = trim.charAt(i);
            if (!((charAt >= 'a' && charAt <= 'z') || (charAt >= 'A' && charAt <= 'Z') || ((charAt >= '0' && charAt <= '9') || charAt == '-' || charAt == '.' || charAt == '_'))) {
                return null;
            }
        }
        return trim;
    }

    static int indexOfModel(String str) {
        return indexOf(MODELS, str);
    }

    private static int indexOf(String[] strArr, String str) {
        for (int i = 0; i < strArr.length; i++) {
            if (strArr[i].equals(str)) {
                return i;
            }
        }
        return -1;
    }

    private static String[] withCustom(String[] strArr) {
        String[] strArr2 = new String[strArr.length + 1];
        System.arraycopy(strArr, 0, strArr2, 0, strArr.length);
        strArr2[strArr.length] = CUSTOM;
        return strArr2;
    }

    private int dp(float f) {
        return (int) ((getResources().getDisplayMetrics().density * f) + 0.5f);
    }

    private LinearLayout.LayoutParams fill(int i) {
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.topMargin = dp(i);
        return layoutParams;
    }

    private TextView title(String str) {
        TextView textView = new TextView(this);
        textView.setText(str);
        textView.setTypeface(Typeface.DEFAULT_BOLD);
        return textView;
    }

    private TextView hint(String str) {
        TextView textView = new TextView(this);
        textView.setText(str);
        textView.setTextSize(12.0f);
        return textView;
    }

    private Spinner spinner(String[] strArr) {
        Spinner spinner = new Spinner(this);
        ArrayAdapter arrayAdapter = new ArrayAdapter(this, android.R.layout.simple_spinner_item, strArr);
        arrayAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter((SpinnerAdapter) arrayAdapter);
        return spinner;
    }

    private CheckBox check(String str) {
        CheckBox checkBox = new CheckBox(this);
        checkBox.setText(str);
        return checkBox;
    }

    private EditText modelIdField(String str) {
        EditText editText = new EditText(this);
        editText.setHint(str);
        editText.setSingleLine(true);
        editText.setInputType(524289);
        return editText;
    }

    private int insert(ViewGroup viewGroup, int i, View[] viewArr, LinearLayout.LayoutParams[] layoutParamsArr) {
        int i2 = 0;
        while (i2 < viewArr.length) {
            viewGroup.addView(viewArr[i2], i, layoutParamsArr[i2]);
            i2++;
            i++;
        }
        return i;
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.settings);
        getWindow().setSoftInputMode(3);
        this.etApiKey = (EditText) findViewById(R.id.et_api_key);
        this.spinnerModel = (Spinner) findViewById(R.id.spinner_model);
        this.etSystemInstruction = (EditText) findViewById(R.id.et_system_instruction);
        Button button = (Button) findViewById(R.id.btn_save);
        ViewGroup viewGroup = (ViewGroup) this.spinnerModel.getParent();
        this.cbAutoName = check("Auto-name chats");
        this.spTextSize = spinner(MessageFormatter.TEXT_SIZE_LABELS);
        insert(viewGroup, viewGroup.indexOfChild(this.spinnerModel) - 1, new View[]{this.cbAutoName, hint("Names each chat after its first reply."), title("Text size"), this.spTextSize}, new LinearLayout.LayoutParams[]{fill(8), fill(0), fill(16), fill(4)});
        this.spinnerModel.setAdapter(spinner(withCustom(MODELS)).getAdapter());
        this.etCustomModel = modelIdField("Model ID, e.g. gemini-3.8-pro");
        this.spTextThinking = spinner(THINKING_LABELS);
        this.cbShowThoughts = check("Show thought process");
        int insert = insert(viewGroup, viewGroup.indexOfChild(this.spinnerModel) + 1, new View[]{this.etCustomModel, title("Thinking level"), this.spTextThinking, this.cbShowThoughts, hint("Hold a reply to see its thoughts.")}, new LinearLayout.LayoutParams[]{fill(4), fill(16), fill(4), fill(8), fill(0)});
        this.spLiveModel = spinner(withCustom(LiveActivity.LIVE_MODELS));
        this.etLiveCustom = modelIdField("Live model ID, e.g. gemini-3.8-live");
        this.tvLiveThinking = title("Live thinking level");
        this.spLiveThinking = spinner(new String[]{"Low", "Medium", "High"});
        this.spVoice = spinner(LiveActivity.VOICES);
        this.cbHandsFree = check("Hands-free");
        this.cbMuted = check("Mute voice");
        this.cbLiveText = check("Live text while speaking");
        insert(viewGroup, insert, new View[]{title("Live speech model"), this.spLiveModel, this.etLiveCustom, this.tvLiveThinking, this.spLiveThinking, title("Voice"), this.spVoice, this.cbHandsFree, hint("Talk freely; the model detects when you stop."), this.cbMuted, hint("Replies are shown as text only."), this.cbLiveText, hint("Shows your words in the text box as you speak.")}, new LinearLayout.LayoutParams[]{fill(20), fill(4), fill(4), fill(16), fill(4), fill(16), fill(4), fill(12), fill(0), fill(8), fill(0), fill(8), fill(0)});
        load();
        this.spinnerModel.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: com.gemini.chat.SettingsActivity.1
            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long j) {
                SettingsActivity.this.updateVisibility();
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onNothingSelected(AdapterView<?> adapterView) {
            }
        });
        this.spLiveModel.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: com.gemini.chat.SettingsActivity.2
            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long j) {
                SettingsActivity.this.updateVisibility();
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onNothingSelected(AdapterView<?> adapterView) {
            }
        });
        button.setOnClickListener(new View.OnClickListener() { // from class: com.gemini.chat.SettingsActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                SettingsActivity.this.save();
            }
        });
        ConfigBinder.bind(this);
        TimeGrounding.bindSetting(this);
    }

    private void load() {
        SharedPreferences sharedPreferences = getSharedPreferences("GeminiPrefs", 0);
        this.etApiKey.setText(sharedPreferences.getString("api_key", ""));
        this.etSystemInstruction.setText(sharedPreferences.getString("system_instruction", ""));
        this.cbAutoName.setChecked(sharedPreferences.getBoolean("auto_name", true));
        int i = 1;
        for (int i2 = 0; i2 < MessageFormatter.TEXT_SIZES.length; i2++) {
            if (MessageFormatter.TEXT_SIZES[i2] == sharedPreferences.getInt("text_size", 14)) {
                i = i2;
            }
        }
        this.spTextSize.setSelection(i);
        String string = sharedPreferences.getString("model", "gemini-3.5-flash-lite");
        this.etCustomModel.setText(sharedPreferences.getString(PREF_CUSTOM, ""));
        int indexOfModel = indexOfModel(string);
        if (indexOfModel < 0) {
            indexOfModel = MODELS.length;
            this.etCustomModel.setText(string);
        }
        this.spinnerModel.setSelection(indexOfModel);
        int indexOf = indexOf(THINKING_VALUES, sharedPreferences.getString("thinking_level", ""));
        Spinner spinner = this.spTextThinking;
        if (indexOf < 0) {
            indexOf = 0;
        }
        spinner.setSelection(indexOf);
        this.cbShowThoughts.setChecked(sharedPreferences.getBoolean("show_thoughts", true));
        String string2 = sharedPreferences.getString("live_model", "gemini-3.8-live");
        this.etLiveCustom.setText(sharedPreferences.getString("live_custom_model", ""));
        int indexOf2 = indexOf(LiveActivity.LIVE_MODELS, string2);
        if (indexOf2 < 0) {
            indexOf2 = LiveActivity.LIVE_MODELS.length;
            this.etLiveCustom.setText(string2);
        }
        this.spLiveModel.setSelection(indexOf2);
        int indexOf3 = indexOf(LiveActivity.THINKING, sharedPreferences.getString("live_thinking", "low"));
        Spinner spinner2 = this.spLiveThinking;
        if (indexOf3 < 0) {
            indexOf3 = 0;
        }
        spinner2.setSelection(indexOf3);
        String string3 = sharedPreferences.getString("live_voice", "Kore");
        for (int i3 = 0; i3 < LiveActivity.VOICES.length; i3++) {
            if (LiveActivity.voiceName(LiveActivity.VOICES[i3]).equals(string3)) {
                this.spVoice.setSelection(i3);
            }
        }
        this.cbHandsFree.setChecked(sharedPreferences.getBoolean("live_hands_free", false));
        this.cbMuted.setChecked(sharedPreferences.getBoolean("live_muted", false));
        this.cbLiveText.setChecked(sharedPreferences.getBoolean("live_text", true));
        updateVisibility();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateVisibility() {
        this.etCustomModel.setVisibility(this.spinnerModel.getSelectedItemPosition() == MODELS.length ? 0 : 8);
        boolean z = this.spLiveModel.getSelectedItemPosition() == LiveActivity.LIVE_MODELS.length;
        this.etLiveCustom.setVisibility(z ? 0 : 8);
        int i = (LiveSession.needsThinkingLevel(z ? this.etLiveCustom.getText().toString() : LiveActivity.LIVE_MODELS[Math.max(0, this.spLiveModel.getSelectedItemPosition())]) || z) ? 0 : 8;
        this.tvLiveThinking.setVisibility(i);
        this.spLiveThinking.setVisibility(i);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void save() {
        String str;
        String normalizeModel;
        int selectedItemPosition = this.spinnerModel.getSelectedItemPosition();
        String trim = this.etCustomModel.getText().toString().trim();
        if (selectedItemPosition >= 0 && selectedItemPosition < MODELS.length) {
            str = MODELS[selectedItemPosition];
        } else {
            String normalizeModel2 = normalizeModel(trim);
            if (normalizeModel2 == null) {
                Toast.makeText(this, trim.length() == 0 ? "Enter a model ID, e.g. gemini-3.8-pro" : "Invalid model ID (letters, digits, '-', '.', '_' only)", 1).show();
                this.etCustomModel.requestFocus();
                return;
            } else {
                str = normalizeModel2;
                trim = normalizeModel2;
            }
        }
        int selectedItemPosition2 = this.spLiveModel.getSelectedItemPosition();
        if (selectedItemPosition2 >= 0 && selectedItemPosition2 < LiveActivity.LIVE_MODELS.length) {
            normalizeModel = LiveActivity.LIVE_MODELS[selectedItemPosition2];
        } else {
            normalizeModel = normalizeModel(this.etLiveCustom.getText().toString());
            if (normalizeModel == null) {
                Toast.makeText(this, this.etLiveCustom.getText().toString().trim().length() == 0 ? "Enter a live model ID, e.g. gemini-3.8-live" : "Invalid live model ID (letters, digits, '-', '.', '_' only)", 1).show();
                this.etLiveCustom.requestFocus();
                return;
            }
        }
        SharedPreferences.Editor edit = getSharedPreferences("GeminiPrefs", 0).edit();
        edit.putString("api_key", this.etApiKey.getText().toString().trim());
        edit.putBoolean("auto_name", this.cbAutoName.isChecked());
        edit.putInt("text_size", MessageFormatter.TEXT_SIZES[Math.max(0, this.spTextSize.getSelectedItemPosition())]);
        edit.putString("model", str);
        edit.putString(PREF_CUSTOM, trim);
        edit.putString("thinking_level", THINKING_VALUES[Math.max(0, this.spTextThinking.getSelectedItemPosition())]);
        edit.putBoolean("show_thoughts", this.cbShowThoughts.isChecked());
        edit.putString("live_model", normalizeModel);
        if (selectedItemPosition2 == LiveActivity.LIVE_MODELS.length) {
            edit.putString("live_custom_model", normalizeModel);
        }
        edit.putString("live_thinking", LiveActivity.THINKING[Math.max(0, this.spLiveThinking.getSelectedItemPosition())]);
        edit.putString("live_voice", LiveActivity.voiceName(LiveActivity.VOICES[Math.max(0, this.spVoice.getSelectedItemPosition())]));
        edit.putBoolean("live_hands_free", this.cbHandsFree.isChecked());
        edit.putBoolean("live_muted", this.cbMuted.isChecked());
        edit.putBoolean("live_text", this.cbLiveText.isChecked());
        edit.putString("system_instruction", this.etSystemInstruction.getText().toString().trim());
        TimeGrounding.saveSetting(this, edit);
        edit.commit();
        Toast.makeText(this, "Settings Saved", 0).show();
        finish();
    }
}
