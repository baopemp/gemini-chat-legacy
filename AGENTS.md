# Agent Rules: Gemini Chat (Legacy Android Client)

Full context: `docs/HANDOFF.md`. All paths are relative to the project root.

## Build pipeline
1. Java classes live in `java/` (ChatActivity, SettingsActivity, LiveActivity, LiveSession, LiveSocket, ReplyParser, AutoNamer, DatabaseHelper,
   Markdown, MessageFormatter, EmojiMap, TimeGrounding, Thumbnail, B64, Compat). Edit them and run `./scripts/build_java.sh`; their smali is generated.
   The remaining hand-written smali (ChatListActivity, ConfigManager, ConfigBinder, SafActivity, FileExplorerActivity, ImageUtil*, TLSSocketFactory, R)
   is edited in `android_project/smali/com/gemini/chat/`.
2. Bump the version in `android_project/apktool.yml` only: `versionCode` = `versionName` without dots (0.8.7 → `'87'`).
3. `./scripts/build_apk.sh` runs the audits, `apktool b`, zipalign and signing → `build/gemini_chat_v<ver>.apk`.
4. `./tests/run_tests.sh` runs the JVM bytecode verification and unit tests. It must report 0 failures.
5. Smoke-test on ARM emulators: API 7 (240x320, 120 dpi) and API 19 at least (`tests/emulator/README.md`).
6. Add a `docs/CHANGELOG.md` entry and regenerate `java_sources/` with jadx from the new APK.

## Keystore
- `keystore/gemini_chat.keystore` is git-ignored and created on the first build if missing (override: `KEYSTORE`, `KS_ALIAS`, `KS_PASS`).
- Never switch signing keys once a build is installed somewhere (users would lose their data). v1 signature digests must stay SHA-1 (minSdk 7); uber-apk-signer handles this automatically.

## Platform constraints
- minSdk 7 / targetSdk 14, Dalvik, 256 MB RAM devices. No AndroidX, Play Services or Kotlin.
- API 8+ classes only inside separately loaded classes behind an `SDK_INT` check (`ImageUtil` → `ImageUtilApi8`), or via reflection.
- No network on the UI thread: `AsyncTask.doInBackground` for HTTP, `LiveSession`'s writer thread for WebSocket sends.
- Close every Cursor and stream on every path.
- Settings take effect only on "Save Settings".

## Gemini API (checked 2026-10-23)
- Text: `POST https://generativelanguage.googleapis.com/v1beta/models/{model}:streamGenerateContent?alt=sse`, auth header `x-goog-api-key` (never in the URL).
- Body: `systemInstruction.parts[].text`, `contents[]{role: user|model, parts[]{text | inlineData{mimeType,data}}}`,
  optional `generationConfig.thinkingConfig{thinkingLevel, includeThoughts}`.
- Reply: `candidates[0].content.parts[]`; parts with `"thought": true` are the thought summary, the rest is the answer.
- Retry 500/502/503/504 twice (2 s, 4 s); never retry 429.
- Text models (no billing): `gemini-3.8-flash`, `gemini-3.6-flash`, `gemini-3.5-flash-lite` (default), `gemini-3.1-flash-lite`, `gemini-3-flash-preview`,
  `gemini-flash-latest`, `gemini-flash-lite-latest`, `gemma-4-31b-it`, `gemma-4-26b-a4b-it` (Gemma: thinkingLevel minimal|high only).
- Live: `wss://generativelanguage.googleapis.com/ws/google.ai.generativelanguage.v1beta.GenerativeService.BidiGenerateContent`,
  key in the `x-goog-api-key` handshake header. Models: `gemini-3.8-live` (default), `gemini-3.8-live-extended-thinking`
  (needs `thinkingConfig.thinkingLevel`), `gemini-3.1-flash-live-preview`. Audio in 16-bit PCM (`audio/pcm;rate=N`), out 24 kHz.
  `sessionResumption` handles are used to resume. The text box is filled by a parallel `gemini-3.5-transcribe-live` session
  (TEXT modality; `interimInputTranscription` while speaking, `inputTranscription` final).
- Time grounding (Settings checkbox, default on): `"Current date and time: Thursday, 2026-10-22T23:06:27.791+07:00; Unix: 1792685187791ms"`
  is appended to the system instruction on every request (text and Live). It's the only hidden instruction.
- Auto-naming (default on, `AutoNamer`): one `generateContent` call to `gemini-3.5-flash-lite` after a chat's first reply (chat or Live).
- Messages are ordered by `id` (never by timestamp: device clocks jump).
