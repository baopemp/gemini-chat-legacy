# Architecture & Technical Internals

Gemini Chat is an ultra-lightweight, highly optimized native Android client engineered to run on legacy Android devices starting from Android 2.1 Eclair (API 7) through Android 4.0 Ice Cream Sandwich (API 14), with compatibility hooks extending up to modern Android versions.

---

## 1. Core Platform Constraints & Targets

- **Min SDK Version:** API 7 (Android 2.1 Eclair)
- **Target SDK Version:** API 14 (Android 4.0 Ice Cream Sandwich)
- **Runtime Environment:** Dalvik Virtual Machine (DVM)
- **Hardware Profile:** Tested and guaranteed to operate smoothly on 256MB RAM legacy smartphones (ARMv5, ARMv6, ARMv7, and x86 architectures).
- **Zero Heavy Modern Dependencies:** No AndroidX, no Jetpack, no Google Play Services, no Kotlin runtime, no multi-megabyte third-party libraries. The entire app binary is under 150 KB.

---

## 2. Dalvik VM Verification & Class Loading

### The API 7 Verification Trap
On Android 2.1 (API 7), the Dalvik class verifier scans all classes during class-load time. If a class contains any direct references, method calls, or type declarations for classes that do not exist on API 7 (such as `android.util.Base64`, introduced in API 8 Froyo), the Dalvik verifier immediately throws a fatal `java.lang.VerifyError` and terminates the process, even if the method or branch is never executed!

### Solution: Strict Class Isolation
- **`ImageUtil` (API 7 Safe):** The public entry point. It checks `android.os.Build.VERSION.SDK_INT < 8`. If below 8, it returns null or gracefully disables image base64 conversion without ever touching `android.util.Base64`.
- **`ImageUtilApi8` (API 8+ Isolated):** Contains all logic calling `android.util.Base64.encodeToString`. Because Dalvik resolves classes lazily, `ImageUtilApi8` is only resolved when `ImageUtil` calls it on API 8+ devices. API 7 devices never attempt to verify or load this class.

---

## 3. Asynchronous Networking & Threading

### Avoiding `NetworkOnMainThreadException`
- On Android 3.0+ (Honeycomb) and Android 4.0+ (ICS), performing any network operations on the main UI thread immediately throws `android.os.NetworkOnMainThreadException`.
- All HTTP/HTTPS requests (API key verification, Gemini chat completions, model listing) are strictly executed inside `AsyncTask.doInBackground()`.
- Thread synchronization is handled via `AsyncTask.onPreExecute()` (showing loaders) and `AsyncTask.onPostExecute()` (binding results to UI).
- Dedicated cancel support: `ChatActivity` includes a "Stop" button that invokes `currentTask.cancel(true)` to abort running streams and sockets immediately.
- Live (WebSocket): the reader thread receives; **every send** (text, audio, activity events, history, close) goes through
  `LiveSession`'s writer thread, because `LiveActivity` calls them from the UI thread. On 2.x a UI-thread send works, on 3.0+
  StrictMode throws, so this must not regress.

---

## 4. Modern TLS 1.2 on Legacy Android

### The HTTPS Challenge
Modern Google endpoints expect TLS 1.2+. Android 4.1–4.4 (API 16–19) ship TLS 1.2 but disabled by default. Android ≤ 4.0 doesn't implement it at all.

### Solution: `TLSSocketFactory`
- `TLSSocketFactory.java` wraps the default `SSLSocketFactory`.
- It calls `setEnabledProtocols({"TLSv1.1","TLSv1.2"})` on every socket it creates (an `IllegalArgumentException` on devices without them is ignored).
- `ChatListActivity.onCreate` installs it with `HttpsURLConnection.setDefaultSSLSocketFactory(new TLSSocketFactory())` **only on API 16–19**. Those versions support TLS 1.2 but leave it off by default. API 20+ already enables it.
- **Android 2.1–4.0 (API 7–15)** have no TLS 1.2 and connect with TLS 1.0. As of 2026-10 this works: confirmed on a Galaxy Y (Android 2.3).
  Google gives no end date for legacy TLS on its services. If it stops, requests fail with an SSL exception shown as a System message.

---

## 5. Storage & File Access Architecture

Devices running API 7 to 14 lack modern Storage Access Framework (SAF). Furthermore, Android 4.4+ (KitKat, API 19+) introduced strict storage sandboxing.

The application implements a dual-layer storage subsystem:
1. **API 19+ (KitKat and Newer):** `SafActivity` utilizes `Intent.ACTION_OPEN_DOCUMENT` and `Intent.ACTION_CREATE_DOCUMENT` to securely select and export chat databases or configurations through the system document provider.
2. **API 7 to 18 (Legacy Android):** Falls back to `FileExplorerActivity`, a built-in lightweight file navigator that traverses `/sdcard` or `Environment.getExternalStorageDirectory()` directly with zero external permissions or dependencies.
3. **Safety Fallback:** If an SD card is physically missing or unmounted, SD-dependent UI buttons (Export/Backup/Attach) are conditionally hidden or disabled to prevent null pointer exceptions or `IOException`.

---

## 6. Local SQLite Persistence Schema

`DatabaseHelper.java` manages local chat persistence:
- **Database Name:** `geminichat.db` (`DATABASE_VERSION = 3`; v1→v2 adds `messages.model`; v2→v3 adds `messages.thoughts`, `chats.named`)
- **Tables:**
  - `chats`:
    - `id` (INTEGER PRIMARY KEY AUTOINCREMENT)
    - `title` (TEXT)
    - `timestamp` (INTEGER, last activity; the list is sorted by it, newest first)
  - `messages`:
    - `id` (INTEGER PRIMARY KEY AUTOINCREMENT)
    - `chat_id` (INTEGER, foreign key to `chats.id`)
    - `role` (TEXT: "user", "model", or "system")
    - `model` (TEXT: stores model identifier, or for attachments, inline base64 string `data:image/...`)
    - `content` (TEXT: message body markdown)
    - `timestamp` (INTEGER: Unix epoch timestamp in milliseconds)

### Cursor Hygiene & Memory Protection
On 256MB devices, unclosed database cursors lead directly to SQLite connection leaks and out-of-memory errors. Cursors are closed on every path. `getChats()`/`getMessages()` return their cursor to the caller (the chat list uses `startManagingCursor`). `scripts/check_cursors.py` audits this.

---

## 7. Message Rendering: Markdown, Emoji, Layout (0.8.5)

`ChatActivity.addMessageToChat` builds one `TextView` per message:
`MessageFormatter.format(...)` → text, `MessageFormatter.styleView(...)` → row style, `ChatActivity$6` → long-press menu.

### `Markdown` (pure Java, unit-tested on the JVM)
Parses into a `Doc` = plain text + typed ranges (`BOLD`, `CODE_BLOCK`, `LIST_ITEM(level, marker)`, …) + raw code blocks.
- Blocks: ATX headings, paragraphs (single newlines kept), ``` / ~~~ fences with language, nested `>` quotes, `-`/`*`/`+`/`1.`/`1)` lists
  nested by indentation, `[ ]`/`[x]` tasks, pipe tables, `---`/`***`/`___` rules.
- Inline: `**`/`__` bold, `*`/`_` italic (no intraword `_`, so snake_case and `:white_check_mark:` stay literal), `***` both, `~~` strike,
  backtick code (contents never formatted), `[label](url "title")`, `![alt](url)` → `[Image: alt]` link, `<http…>` and bare http(s) URLs
  (trailing punctuation excluded), backslash escapes.
- Tables become a monospace grid if they fit `gridMaxChars` (computed from screen width and font scale), otherwise one card per row.

### `MessageFormatter` (Android)
Maps `Doc` ranges to API-7 spans: `StyleSpan`, `StrikethroughSpan`, `TypefaceSpan("monospace")`, `BackgroundColorSpan`, `RelativeSizeSpan`,
`URLSpan`, `LeadingMarginSpan.Standard` (hanging indents measured with the marker's own typeface), plus three custom spans:
`BlockSpan` (full-width code background + padding), `RuleSpan` (horizontal rule), and `QuoteBarSpan` (quote bar).
Rows are full width (no bubbles), with a pressed/focused highlight. All sizes are in dp/sp, so spacing is identical at every resolution.

### `EmojiMap` (Emoji 18)
Android 2.x–4.x fonts lack most emoji, so emoji are shown as amber `:shortcode:` text. `assets/emoji.tsv` (5,244 rows, generated by
`scripts/gen_emoji_table.py`) is loaded once. A 64K `boolean[]` of first UTF-16 units filters candidates, then the longest key
(≤ 15 units) wins, so ZWJ families, flags and skin tones beat their parts. Stray U+FE0F/U+FE0E/U+200D are dropped.
Keycap starts (`#`, `*`, `0-9`) are only tried when followed by U+FE0F/U+20E3.

### `TimeGrounding`
When enabled (`GeminiPrefs/time_grounding`, default true), `GeminiTask` appends
`Current date and time: <Weekday>, <ISO 8601 local with ms and offset>; Unix: <epoch ms>ms` to the system instruction at send time.

## 8. Gemini API Integration & Payload Structure

### REST endpoint (checked against ai.google.dev, 2026-10-22)
`POST https://generativelanguage.googleapis.com/v1beta/models/{model}:generateContent`
Headers: `Content-Type: application/json; charset=utf-8`, `x-goog-api-key: {apiKey}`.
Timeouts: 30 s connect, 180 s read.

### Request (built by `GeminiTask.buildBody` from the SQLite history; system text = user instruction + time grounding)
```json
{
  "systemInstruction": { "parts": [{ "text": "System prompt / persona" }] },
  "contents": [
    { "role": "user",  "parts": [ { "text": "What is this?" },
                                  { "inlineData": { "mimeType": "image/jpeg", "data": "<base64>" } } ] },
    { "role": "model", "parts": [ { "text": "A cat." } ] }
  ]
}
```
- Rows with role `system` (local notices) are never sent.
- Consecutive rows with the same role are merged into one turn (text joined with a blank line, images appended), so turns always alternate.
- A user row whose `model` column starts with `data:image/` gets an `inlineData` part.

### Response (`GeminiTask.parseResponse`)
- Text = concatenation of `candidates[0].content.parts[].text`, skipping `"thought": true` parts.
- No candidates → `promptFeedback.blockReason`, if any. No text → `finishReason`. `MAX_TOKENS` → text kept plus a "cut off" note.
- HTTP errors → `Error <code>: <error.message>`.
- Failures set `GeminiTask.failed`. They're shown as a System message and not saved.

### Models offered in Settings (see section 9 for streaming; 0.8.6 default: gemini-3.5-flash-lite, plus Custom model...)
`gemini-3.8-flash` (default), `gemini-3.6-flash`, `gemini-3.5-flash-lite`, `gemini-3.1-flash-lite`, `gemini-3-flash-preview`.

---

## 9. Streaming, Thinking, Retry, Auto-naming (0.8.6)

### Streaming (`GeminiTask.request`)
- `POST .../models/{model}:streamGenerateContent?alt=sse`. The body is read line by line; each `data:` event (blank line ends it)
  is a full `GenerateContentResponse` chunk fed to `ReplyParser`. An `error` object inside the stream becomes a failure.
- Progress is published at most every 250 ms (`publishProgress((Object) new String[]{thoughts, text})`); `ChatActivity.showStreaming`
  renders a temporary, non-long-clickable row: `MessageFormatter.formatThinking` while only thoughts exist, the normal reply format
  once answer text arrives. The row is removed when the task ends or is cancelled, and replaced by the saved message.

### Thinking
- `generationConfig.thinkingConfig.thinkingLevel` from Settings (empty = model default; `ReplyParser.levelFor` maps "minimal" to "low"
  on 3.8 Flash), `includeThoughts` from "Show thought process".
- Levels per the Gemini docs (2026-10): 3.8 Flash low/medium*/high; 3.6 Flash minimal/low/medium*/high; 3.5 and 3.1 Flash-Lite
  minimal*/low/medium/high; 3 Flash minimal/low/medium/high* (* = default). Thinking can't be turned off on Gemini 3.
- Thought parts (`"thought": true`) are collected apart from the answer and stored in `messages.thoughts`. If the model thought
  (`usageMetadata.thoughtsTokenCount > 0`) but sent no summary, a short note is stored instead. Long-press → Show Thought Process.

### Retry
- HTTP 500/502/503/504 → retried after 2 s and 4 s (`MAX_RETRIES = 2`), only before any data was streamed; the input hint shows
  the state. 429 is never retried.

### Auto-naming
- After a successful reply, if Settings → Auto-name chats is on and `chats.named = 0`, `TitleTask` sends the first user message and
  first reply (each cut to 1,500 chars) to `gemini-3.5-flash-lite` (non-streaming, `thinkingLevel: minimal`) and asks for a 2-6 word
  title. `cleanTitle` strips markdown/quotes/"Title:", keeps the first line, caps it at 40 chars. On success the title is saved and
  `named = 1`; on any failure nothing changes and it is tried again after the next reply.

## 10. Message Actions and Layout (0.8.6)

- Long-press opens `ChatActivity.MessageMenu` (a native list dialog). User: Regenerate, Edit Message (Resend / Save / Cancel), Delete.
  Model: Show Thought Process (if any), Edit Message (Save only: rewrites the model side of the history), Regenerate (deletes it and
  later rows, asks again), Share, Delete. System lines: Share, Retry (only if the last saved row is a user message).
  Copy Entire Message / Copy Code Block N everywhere.
- Colors: header text and a 3 dp left bar per role (`MessageFormatter.RoleBar` under the press feedback in a `LayerDrawable`):
  user `#8AB4F8`, model `#81C995`, system `#F28B82`.
- Press feedback is the platform's: `?android:selectableItemBackground` (raw id `0x0101030e`) on API 11+, resolved through the
  activity theme (Material ripple on 5.0+, Holo on 3.x/4.x), `android.R.drawable.list_selector_background` on 2.x.
- Attachment bar (built in code above the input row): 40 dp thumbnail, "Image attached (N KB)", small native "Remove" button.
  The image is converted to a JPEG data URI when picked. Image-only messages send only the `inlineData` part.

## 11. Gemini Live (0.8.6)

```
LiveActivity ── Mic thread (AudioRecord 16 kHz → 100 ms chunks) ──┐
     │  UI: status, transcript rows, text input, Talk/End           ├─> LiveSession.post() ─> writer thread ─> LiveSocket.send()
     │  tick() every 80 ms: reveal text whose audio has played      │
     └─ Player thread (AudioTrack 24 kHz, MODE_STREAM) <─ onAudio <─┴── reader thread <─ LiveSocket.receive()
```

- **Socket (`LiveSocket`):** `wss://generativelanguage.googleapis.com/ws/google.ai.generativelanguage.v1beta.GenerativeService.BidiGenerateContent`.
  Plain `Socket` (via HTTP proxy CONNECT when `ProxySelector` returns one), layered with `HttpsURLConnection.getDefaultSSLSocketFactory()`
  (TLS 1.2 on API 16-19 via `TLSSocketFactory`), SNI via `setHostname` reflection, hostname check with the default `HostnameVerifier`.
  Handshake sends `x-goog-api-key` and checks `Sec-WebSocket-Accept`. Client frames are masked; text and binary messages are read as
  UTF-8 JSON; fragments, ping/pong, 16/64-bit lengths and close codes (shown to the user as the disconnect reason) are handled.
- **Setup (`LiveSession.setupMessage`):** `model`, `generationConfig{responseModalities:["AUDIO"], speechConfig.voiceConfig.prebuiltVoiceConfig.voiceName,
  thinkingConfig.thinkingLevel (extended-thinking models only)}`, `systemInstruction` (user instruction + time grounding),
  `inputAudioTranscription{}`, `outputAudioTranscription{}`, `contextWindowCompression{slidingWindow{}}`,
  `realtimeInputConfig.automaticActivityDetection.disabled = true` for push-to-talk, and `historyConfig.initialHistoryInClientContent`
  when the chat has earlier text. After `setupComplete`, the history goes out as one `clientContent` (same-role rows merged,
  newest ≤ 24,000 chars, `turnComplete: true`: not answered).
- **Input:** `realtimeInput.text`; `realtimeInput.audio{mimeType:"audio/pcm;rate=N", data}` (N = 16000, or the first rate the
  device's AudioRecord accepts of 8000/11025/22050/44100); push-to-talk wraps speech in `activityStart` / `activityEnd`;
  hands-free sends `audioStreamEnd` when the mic is turned off and skips mic chunks while the model is speaking (echo).
- **Output:** `serverContent.modelTurn.parts[].inlineData` (audio, odd-length chunks re-aligned), `inputTranscription.text`,
  `outputTranscription.text`, `interrupted` (flush the AudioTrack, show the rest of the text), `turnComplete`.
- **Sync:** each output-transcript piece is tagged with the frame position where the latest audio chunk starts; `tick()` shows it once
  `getPlaybackHeadPosition()` (relative to the last flush) reaches that frame. No audio device, a stalled device (head not moving
  for 1.5 s) or Settings → Mute voice: text is shown at once.
- **Saving:** a user turn (spoken transcript or typed text) is saved when the model starts answering; a model turn when its audio has
  finished (or on interrupt/close), with `model` = the live model id. The chat id goes back to `ChatActivity` in the result Intent.
- **Limits (Google):** audio-only sessions 15 min without compression, connections about 10 min (`goAway`); then "Disconnected" +
  Reconnect. Session resumption is not implemented.

## 12. 0.8.7 additions

- **Live text box (`LiveActivity.Transcriber`):** `LiveSession.transcriber()` opens `gemini-3.5-transcribe-live` (setup: TEXT
  modality, `inputAudioTranscription{}`, its own voice detection) when the conversation is ready; the Mic thread sends every chunk
  to both sessions. `interimInputTranscription.text` (cumulative for the current utterance) and final `inputTranscription.text`
  are shown as `typedPrefix + finals + interim`. The user turn is finalized when the model starts answering: the row uses what the
  model heard (its own `inputTranscription`), falling back to the transcriber's text.
- **Echo gate:** `modelTurnActive` is set by the first audio/text of a reply and cleared when the turn is complete and played;
  `micOpenAfter` adds 0.7 s. `micMuted()` (hands-free only) checks both plus `Player.isPlaying()`.
- **Player jitter buffer:** from silence, writing to the AudioTrack waits for 0.3 s of queued audio, the end of the turn
  (`endOfTurn()`), or 600 ms.
- **Resumption:** setup always asks for `sessionResumption`; `sessionResumptionUpdate.newHandle` (when resumable) is kept as
  `lastHandle`. `tick()` resumes on `goAway` when idle; `Main.onClosed` resumes after a drop (not for 1007/1008 errors, max 3 in a
  row, reset by a completed turn). A resumed session sends no history. Callbacks carry a session generation; older sessions'
  callbacks are ignored.
- **AutoNamer:** shared by `ChatActivity` (after a reply) and `LiveActivity` (after a saved model turn); one request per chat at a
  time; skipped if the user renamed the chat meanwhile.
- **Math (`Markdown.mathAt` / `texToText`):** `$...$` only when it looks like math (single letter, or contains `\ ^ _ = + < > { }`),
  no space just inside the dollars, no digit after the closing one; `$$...$$` may span lines. Converted: Greek, operators,
  relations, arrows, `\frac`, `\sqrt`, `\text`, `^`/`_` (superscripts only ¹²³ⁿ, which 2.x fonts draw).
- **DatabaseHelper.onOpen** adds missing columns (`PRAGMA table_info`); messages are ordered by `id`.
