# Changelog & Version History

All notable changes to the Gemini Chat Legacy Android client are documented here.

---

## v0.8.7 (Latest Release) - VersionCode: 87

### Live
- **Your words stream into the text box while you speak** (push-to-talk and hands-free). A second, text-only session to
  `gemini-3.5-transcribe-live` (free) gets the same microphone audio and returns interim transcripts about every 0.5 s. When the
  model starts answering, the words become your message and the box clears (anything you had typed stays). Settings →
  **Live text while speaking** (default on). If that session is unavailable, the main model's transcript fills the box instead.
- **Fixed: hands-free echo on slow phones.** The mic was muted only while audio was buffered; a gap in playback (slow phone or
  network) reopened it, the speaker's own voice was heard as the user ("For" → "Could you clarify...?"), and the status flipped
  between Listening and Speaking. Now the mic stays muted for the whole reply plus 0.7 s after it has played, and the status
  shows one state per reply.
- **Jitter buffer:** playback starts once 0.3 s of audio is queued (or the reply is complete), so slow links don't stutter.
- **Automatic reconnect:** session resumption handles are kept; when Google announces the ~10-minute connection limit (goAway)
  the session is resumed while idle, and a dropped connection is resumed up to 3 times. The conversation continues.
- **Auto-naming during Live:** the chat is named right after the first spoken exchange (title bar "Live: <name>").
- Hint "Type or talk...".

### Models
- All text models usable without billing (pricing page, 2026-10-23), newest first: `gemini-3.8-flash`, `gemini-3.6-flash`,
  `gemini-3.5-flash-lite`, `gemini-3.1-flash-lite`, `gemini-3-flash-preview`, `gemini-flash-latest`, `gemini-flash-lite-latest`,
  `gemma-4-31b-it`, `gemma-4-26b-a4b-it`. Custom model... as before.
- Gemma 4 accepts only thinking "minimal"/"high": Minimal/Low are sent as minimal, Medium/High as high.
- A model that rejects the chosen thinking level (400) is asked again once with its default.

### Settings
- New order: API key; Time grounding; Auto-name chats; Text size; Model (+ custom id); Thinking level; Show thought process;
  Live speech model (+ custom id, Live thinking level for extended-thinking models); Voice; Hands-free; Mute voice;
  Live text while speaking; System instructions; Save; Backups.
- One-line hints (e.g. "Sends this device's current date and time to the model.").

### New
- **Text size** (Small / Normal / Large / Extra large) for messages; open chats re-render on return.
- **Math:** `$...$` / `$$...$$` LaTeX in replies is shown as readable text (17 × 23 = 391, x², √2 ≈ 1.414, α ≤ β, 1/2, 90°).
  Strict detection, so prices like "$5 and $10" stay as written. Only glyphs Android 2.x fonts have are used (x^10 stays x^10).
- **Stop keeps the partial reply** (marked *[Stopped]*), with its thoughts.
- **Rename Chat** in the chat menu.
- Live menu icon: a mic drawn in the system menu-icon style (gradient and rim sampled from Android's own icons), instead of the
  darker button icon.

### Fixed (audit)
- Messages were ordered by device time; a clock change (common on old phones) put new messages above old ones, and Regenerate /
  Edit & Resend (which delete by id) could remove the wrong ones. Now ordered by id.
- An error sent inside an already started stream (e.g. 500 after the thoughts) showed as a raw `JSONException` and wasn't
  retried. It now shows "Error 500: ..." and is retried like any 5xx; a retry clears the half-streamed reply.
- Renaming a chat didn't stop auto-naming from overwriting it later.
- Retry left the old error lines on screen.
- The database checks its columns on every open and adds missing ones (a half-upgraded or restored database could break
  auto-naming).

### Verified
- Android 2.1, 240x320 (mock): Settings order and texts, model list, menu icon, push-to-talk text box streaming, hands-free mic
  gating (request log: no mic audio from the reply until after playback), automatic resume after goAway, Live auto-naming,
  math glyphs, Stop keeping the partial reply, Rename, Text size.
- Android 4.4, real API: Settings, Gemma 4 31B reply, Live typed exchange on gemini-3.8-live, auto-naming during Live,
  database self-repair.
- Desktop JVM, real API: transcriber interim/final text (push-to-talk and hands-free), session resumption (the resumed session
  remembered the earlier turn).
- Not verified: real microphone/speaker hardware (emulators have none).

---

## v0.8.6 - VersionCode: 86

### Gemini Live (new): voice chat with native-audio models
- Chat screen → menu → **Live Voice**. Talk (microphone) or type; the model answers aloud. Both sides are transcribed:
  your speech appears while you talk, the model's words appear **in step with its voice** (each transcript piece is shown
  when playback reaches the audio it arrived with, using the AudioTrack playback head).
- Works from **Android 2.1**: own WebSocket client (`LiveSocket`, RFC 6455 over the system TLS socket factory, HTTP proxy
  via CONNECT, SNI), own Base64 (`B64`). Microphone: 16 kHz mono PCM (falls back to 8/11/22/44 kHz; the API resamples).
  Speaker: 24 kHz PCM streamed to `AudioTrack`; odd-sized chunks are re-aligned; a stalled audio output can't hold back text.
- Turn-taking: **push-to-talk** by default (Talk → Send speech; manual activityStart/activityEnd), or **Hands-free**
  (server voice detection; the mic pauses while the model speaks, since old phones have no echo cancellation).
  Talking or typing while the model speaks cuts it off (barge-in).
- Finished turns are saved into the chat as normal messages; the chat's earlier text is given to the model as history
  (`historyConfig.initialHistoryInClientContent`). Starting Live from a new chat creates the chat.
  Title bar: "Live: <chat name>".
- Settings → **Live Speech Model**: `gemini-3.8-live` (default), `gemini-3.8-live-extended-thinking` (+ **Thinking level**
  low/medium/high, required by that model), `gemini-3.1-flash-live-preview` (legacy), or **Custom model...**;
  **Voice** (all 30 prebuilt voices); **Hands-free**; **Mute voice (text only)**. Applied on Save Settings.
- Sessions use `contextWindowCompression` (sliding window) so they aren't cut off when the context fills.
- `RECORD_AUDIO` permission added.

### Thinking and streaming (text models)
- Replies now **stream** (`streamGenerateContent?alt=sse`), at most 4 re-renders per second for old phones.
- Settings → **Thinking**: Model default / Minimal / Low / Medium / High (`thinkingConfig.thinkingLevel`; "Minimal" becomes
  "Low" on 3.8 Flash, which has no minimal level) and **Show thought process** (`includeThoughts`, default on).
- The model's thought summary streams first (dimmed, under "Thinking..."); when the answer starts, it replaces the thoughts.
  Long-press the reply → **Show Thought Process** shows them again (with Copy). When the model thought but sent no summary,
  the dialog says so (with the thought token count). Thoughts are stored in the new `messages.thoughts` column.

### Message actions (long-press)
- **Model replies:** Edit Message (rewrites the reply in the history: context injection, nothing is re-sent), Regenerate,
  Share, Delete, Show Thought Process.
- **Your messages:** Regenerate (drop later messages, ask again), Edit Message with **Resend** (save + regenerate) or
  **Save** (edit only, keep the later messages), Delete.
- **Error/System lines:** **Retry** when the last saved message is still waiting for an answer.
- Delete keeps later messages and the scroll position. Edit dialogs keep their buttons on screen at 240x320.

### Images
- Attaching shows a bar above the input with a thumbnail, the size and a native **Remove** button (tap the thumbnail to pick
  another). The menu shows **Change Image** / **Remove Image** while an image is attached.
- An image can be sent without text (the request then has no empty text part, which Gemini rejects).
- The image is converted when picked, so a bad file is reported at once.

### Other
- **Auto-name chats** (Settings, default on): after the first reply, one small request to `gemini-3.5-flash-lite` (minimal
  thinking) turns your first message and the reply into a 2-6 word title. Each chat is named once.
- **Color-coded messages:** role-colored header and a thin bar on the left of every message: User blue, Model green,
  System/errors red. Still full-width rows, no bubbles.
- **Native touch feedback:** the platform's own selectable background: Material ripple on 5.0+, Holo highlight on 3.x/4.x,
  the system list selector (with its long-press fade) on 2.x.
- Automatic retry (2 s, then 4 s) on HTTP 500/502/503/504; the hint shows "Model is busy (503), retry 1/2...".
  429 (quota) is not retried.
- "Gemini is typing..." → **"Model is generating..."**.
- **Models:** the list stays newest first (it matches the free tier on the official pricing page); the default for new installs
  is `gemini-3.5-flash-lite` (free keys often get 503 on 3.8 Flash). **Custom model...** takes any model id
  (`models/` prefix optional) for paid plans.
- Database version 3: `messages.thoughts`, `chats.named` (added on upgrade, no data lost).

### Code
- `ChatActivity`, `SettingsActivity`, `DatabaseHelper` are now Java; new Java classes `LiveActivity`, `LiveSession`,
  `LiveSocket`, `B64`, `ReplyParser`. `build_java.sh` assembles the remaining hand-written smali into a classpath for javac.
- Tests: 99 checks (Base64, WebSocket loopback incl. fragments/ping/64-bit length/close codes, Live setup/history/events,
  SSE thought parsing, thinking levels, title cleanup, image-only turns, retry codes, model ids). `tests/live/LiveCheck.java`
  drives LiveSession against the real API from a desktop JVM.

### Verified
- **Android 2.1 (API 7), 240x320 / 120 dpi** (mock server): all long-press actions, retry with 503s, streaming + thinking +
  thought dialog, auto-naming, colors, Settings (custom model, thinking, live section), Live: text, push-to-talk with the
  emulator microphone (8 kHz fallback), synced transcript, mute, saving into the chat, new chat from Live.
- **Android 4.4 (API 19)**, real API: streaming with thought summaries (3 Flash Preview, 3.6 Flash), Show Thought Process,
  503 retry → error, image attach / Remove / Change / image-only send, Live through the system proxy (TLS 1.2 + SNI) with
  chat history, no-microphone handling.
- **Desktop JVM, real Live API**: gemini-3.8-live, -extended-thinking and 3.1-flash-live-preview; text in, recorded speech in
  (push-to-talk and hands-free), transcripts both ways, history.
- Not verified: a real microphone/speaker (emulators have none), the 5.0+ ripple (no 5.0 image here),
  3.8 Flash thinking (the free tier answered 503 "high demand" every time).

---

## v0.8.5 - VersionCode: 85

### Markdown rendering (rewritten)
- New `Markdown` parser + `MessageFormatter` replace the old regex → `Html.fromHtml` renderer. They use native text spans (all API 1–7).
- Fixed from the old renderer (all reproduced on the emulator first):
  - `***bold italic***` produced broken nesting.
  - `__bold__` / `_italic_` were ignored.
  - `~~strike~~` showed as grey `~text~`.
  - `*` inside `inline code` became italic.
  - `2 * 3 * 4` was italicised, and `\*escapes\*` were not honoured.
  - Bare URLs were not clickable.
  - Nested lists were flattened, and task lists showed `• [ ]`.
  - Nested quotes showed a literal `>`.
  - Code blocks had no background and dropped the language label.
  - Long code lines could not wrap (`&nbsp;`).
- New look:
  - Heading sizes; inline code with a dark background.
  - Code blocks with a full-width background and language label (still copyable via long-press → "Copy Code Block N").
  - Quote bars; bullets ••▪– with hanging indents per level; `[x]` tasks struck through.
  - Real horizontal rule; links in blue.
  - Tables: an aligned monospace grid when they fit the screen width, otherwise one card per row.
- Layout: still plain full-width rows with the same `User (time):` / `Model (model):` / `System:` headers. No chat bubbles.
  Errors are shown in soft red. All spacing is in dp/sp, so it's identical at every resolution.

### Emoji
- Table rebuilt from the official Unicode emoji list (**Emoji 18.0**, 5,244 sequences incl. skin tones, ZWJ, flags, keycaps, unqualified forms).
  213 emoji were missing before (all of Emoji 16–18, plus the England/Scotland/Wales flags).
- Short codes instead of long CLDR names: 😂 `:joy:`, 👍 `:thumbsup:`, 👍🏽 `:thumbsup_tone3:`, 🎉 `:tada:`. Emoji without a common alias
  keep the CLDR name (🫠 `:melting_face:`). Short codes are coloured amber so they read as emoji.
- The 11 `emojifyChunk` methods (~75,000 smali lines, about 5,000 `indexOf` calls per message) are replaced by `EmojiMap`:
  `assets/emoji.tsv` loaded once, then a single longest-match pass. The APK dropped from 128 KB to 95 KB (dex from 433 KB to 76 KB).

### Time grounding (new)
- Every request appends one hidden line to the system instruction, read from the device clock at send time:
  `Current date and time: Thursday, 2026-10-22T23:06:27.791+07:00; Unix: 1792685187791ms`
- Settings → **Time grounding** checkbox (default on). Like the other settings, it takes effect only when you press **Save Settings**.

### Image preview (new)
- User messages with an attached image show a thumbnail (longest side 120 dp) instead of the text "[Image attached]".
  It is decoded with a built-in base64 decoder (`Thumbnail`), because `android.util.Base64` needs API 8, so previews work on Android 2.1 too.

### Fixed
- **Android 3.0+:** "Delete This Chat" (chat screen) and "Delete All Chats" (chat list) never appeared. The options menu is cached
  on 3.0+, so state-dependent items were stuck hidden. Fixed with `Compat.invalidateMenu()` (reflection, a no-op on 2.x).

### Tooling
- `java/` + `scripts/build_java.sh`: new classes are written in Java, compiled against the **Android 2.1 (API 7)** android.jar
  (newer APIs fail to compile), converted with dx 30.0.2, and disassembled by apktool's own baksmali.
- `scripts/gen_emoji_table.py` regenerates the emoji table. Tests rewritten for the new classes (72 checks incl. all 5,244 emoji).
- `tests/emulator/`: Markdown sample and emoji test modes added to the mock server.
- `build_java.sh` deletes smali it generated in the previous run (`java/GENERATED_SMALI.txt`), so removed Java classes don't linger.

### Verified on emulators
- Android 2.1 (API 7) at **240×320 / 120 dpi (Galaxy Y screen)**: dexopt verify OK; layout, Markdown, emoji, thumbnail, settings, menus, send → reply.
- Android 2.3 (API 10) at 320×480 and 480×800, and Android 4.4 (API 19) at 480×800.
- **Live Gemini API** (`gemini-3.5-flash-lite`, real key) from Android 4.4 over HTTPS, using the TLS 1.2 socket factory:
  text chat, time grounding ("It is Thursday, October 22, 2026, at 11:42 PM."), image description.
- Android 4.4 Storage Access Framework: image picker, backup export, wrong-file import rejected, real backup restored.

## v0.8.4 - VersionCode: 84

### Gemini API
- **Image attachments are now actually sent.** Before this release the base64 image was saved to the DB but never put into the request (`doInBackground` read the `model` column and threw the value away). User turns now include an `inlineData {mimeType, data}` part.
- **API key moved from the URL (`?key=`) to the `x-goog-api-key` header**, so it no longer shows up in proxy/server logs or exception messages.
- **Reply parsing rewritten.** All `candidates[0].content.parts[].text` are concatenated, and thought-summary parts (`"thought": true`) are skipped. Before, only `parts[0].text` was read, so a reply split into several parts was cut short, and a first part without text crashed with `JSONException: No value for text`.
- **Clearer failures:** API errors show Google's `error.message` instead of raw JSON. Blocked prompts show `promptFeedback.blockReason`. Empty replies show `finishReason`. `MAX_TOKENS` replies are kept, with a "cut off" note.
- **Timeouts added** (30 s connect, 180 s read). Before, a stalled connection hung forever.
- **Fixed: a real reply starting with "Error" or "Exception" was shown as a red system error and never saved.** Failures are now tracked with a flag instead of matching the text prefix.
- **Fixed race:** cancelling a task during "edit and resend" could clear the *new* task's reference, which disabled the Stop button.
- **Model list updated** (checked against Google's docs, 2026-10-22): `gemini-3.8-flash`, `gemini-3.6-flash`, `gemini-3.5-flash-lite`, `gemini-3.1-flash-lite`, `gemini-3-flash-preview`. `gemini-3.7-flash` and `gemini-3.5-flash` were removed: Google now redirects them to 3.8 and 3.6.

### Chat UI
- Image messages showed a literal `[Image Attached]<br/>` (the markdown parser escaped the tag). Copy, Share and Edit also picked up that prefix, and editing wrote it into the DB.
- System/error messages are now HTML-escaped. Before, error text containing `<` or `&` was mangled by `Html.fromHtml`.
- Emoji conversion fast path: messages with no emoji characters skip the roughly 5,000 lookups (about 500× faster on Vietnamese or plain text, output byte-for-byte identical; tested against v0.8.3 on 3,000+ samples).
- The picker now opens `image/*` only ("Attach Image"). If an image can't be read, a toast appears and the message is sent without it. Before, the raw `content://` URI was saved as if it were an attachment.
- Image processing: the fixed `inSampleSize=8` (which turned small images into thumbnails) is replaced by two-pass sizing to ≤ 1024 px at JPEG q75. The bitmap is recycled, the stream is closed on every path, and OutOfMemoryError is caught.
- Messages are ordered by `timestamp, id`, so ties are deterministic.

### Backup / restore
- **Import now validates before overwriting.** Chat backups must have a SQLite header and both `chats` and `messages` tables. Settings backups must be ≤ 1 MB and look like a SharedPreferences XML. Before, picking any file (e.g. a photo) silently overwrote and destroyed the chat database.
- The import is written to a temp file, then atomically renamed into place. Stale `-journal`, `-wal` and `-shm` files are deleted first; leftovers could otherwise be replayed onto the restored DB.
- After import, the app restarts after 1.5 s, so the "Imported" toast is visible. Before, `System.exit(0)` ran immediately and the toast never showed.
- Internal paths come from `Context.getDatabasePath()` and `getFilesDir()` instead of hard-coded `/data/data/com.gemini.chat/...` (which broke for secondary users on Android 4.2+).
- The settings screen no longer says "Kept securely": the key is stored in plain text and included in settings backups.

### Tooling & docs
- `build_apk.sh` works out of the box: bundled `tools/apktool.jar` and `tools/uber-apk-signer.jar` (the old `tools/` had only Debian wrapper scripts pointing at `/usr/share/...`). It checks versionCode against versionName, runs the audits, and outputs `build/gemini_chat_v<ver>.apk`.
- Audit scripts pointed at a nonexistent `gemini_chat_decoded/` folder. Fixed, and the false positives are gone (wide registers, returned cursors, cleanup on both paths).
- New `tests/run_tests.sh`: dex2jar + `-Xverify:all` on all classes + 185 unit checks.
- `java_sources/` regenerated from this build. `AGENTS.md` no longer points at `/app/applet/...` paths from another workspace.
- **Correction to earlier entries:** v0.8.2 and v0.8.3 described image upload ("`inline_data` injected into the payload") and a "comprehensive" stream audit. The shipped v0.8.3 bytecode did neither: images were never sent, and the attachment label rendered literally. Those entries were left as written, for history.

## v0.8.3 - VersionCode: 83
- **Dalvik Verification Separation:** Resolved `VerifyError` on Android 2.1 (API 7) by isolating `android.util.Base64` calls into a dedicated companion class `ImageUtilApi8`. `ImageUtil` performs runtime SDK level gating (`SDK_INT >= 8`) to guarantee API 7 devices never attempt to verify Base64 classes.
- **Image Attachment Display Fix:** Realighed register handling in `ChatActivity.addMessageToChat()`. Base64 inline image payloads stored in the `model` column (`p4`/`p5`) are detected and prefixed as `[Image Attached]<br/>` in the chat UI, preventing raw Base64 strings from displaying.
- **Comprehensive Memory Audit:** Verified all `Cursor` references and `InputStream`/`OutputStream` streams across `SafActivity`, `DatabaseHelper`, and `FileExplorerActivity` are closed in `finally` blocks.

## v0.8.2 - VersionCode: 82
- **Inline Image Processing Engine:** Added base64 image downsampling (8x sample size, JPEG compression at 50% quality) to handle photos on low-memory devices without generating OutOfMemoryError exceptions.
- **REST Multimodal Payload Injection:** Integrated multimodal `inline_data` support into GeminiTask payload generator.

## v0.8.1 - VersionCode: 81
- **Conditional Attachment UI:** Dynamically detects presence of SD card storage. If external storage is unmounted or missing, attachment action items are hidden to protect against unhandled file system crashes.

## v0.8.0 - VersionCode: 80
- **SafActivity Stream Leak Patch:** Patched file descriptor leak when importing/exporting configs and SQLite backups via Storage Access Framework.

## v0.7.9 - VersionCode: 79
- **Storage Access Framework (SAF) Dual Mode:** Integrated `ACTION_OPEN_DOCUMENT` for API 19+ (KitKat) while retaining fallback to `FileExplorerActivity` on API 7-18.

## v0.7.6 - VersionCode: 76
- **SD Card Backup Safety:** Added runtime check before attempting database dumps; prevents crash on devices without external SD slots.

## v0.7.5 - VersionCode: 75
- **File Explorer Register Fix:** Fixed Dalvik register allocation in `FileExplorerActivity` where register counts exceeded method `.registers` declarations.

## v0.7.4 - VersionCode: 74
- **Dalvik Deep Verification Audit:** Audited all virtual invocations across custom activities.

## v0.7.3 - VersionCode: 73
- **Method Register Count Alignment:** Calibrated method register headers (`.registers` and `.locals`) to prevent Dalvik bytecode verification failures.

## v0.7.2 - VersionCode: 72
- **File Explorer Leaks Patched:** Ensured file list enumerations close properly.

## v0.7.0 - VersionCode: 70
- **System Role & History Stability:** Added support for system instructions / persona prompt in settings, persisted to `ConfigManager`.

## v0.6.9 - VersionCode: 69
- **Native Android Share Intent:** Added share action to export conversation text to external apps via `Intent.ACTION_SEND`.

## v0.6.8 - VersionCode: 68
- **Manifest Strictness:** Target SDK set to API 14 with backward compatibility to API 7.

## v0.6.7 - VersionCode: 67
- **KitKat TLS 1.2 Injection:** Added custom `TLSSocketFactory` to enable TLS 1.2 encryption on Android 4.0-4.4 devices connecting to modern Google APIs.
