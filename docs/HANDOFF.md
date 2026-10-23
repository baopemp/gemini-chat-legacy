# Gemini Chat (Legacy Android Client): Handoff

Gemini Chat is a tiny native Android client for Google's Gemini API, aimed at very old devices.
The build input is the **smali** in `android_project/`, built with apktool. There is no Gradle project.
Most classes are now written in **Java** (`java/`) and compiled to smali by `scripts/build_java.sh`, against the
Android 2.1 (API 7) android.jar, so any newer API fails to compile. The rest is still hand-written smali:
`ChatListActivity`, `ConfigBinder`, `ConfigManager`, `FileExplorerActivity`, `ImageUtil`, `ImageUtilApi8`, `R`, `SafActivity`,
`TLSSocketFactory`. `java_sources/` holds a jadx decompile of exactly those smali-only classes, for reading only.

- **minSdk 7** (Android 2.1), **targetSdk 14** (Android 4.0), package `com.gemini.chat`
- No AndroidX, Play Services or Kotlin. APK is about 145 KB.
- Current version: **0.8.7** (`versionCode 87`)

---

## 1. Layout

```
├── docs/HANDOFF.md            this file
├── README.md                  quick start
├── AGENTS.md                  hard rules (short version of section 3)
├── android_project/           apktool project: AndroidManifest.xml, apktool.yml, res/, assets/emoji.tsv, smali/
├── java/                      Java sources (see section 2); GENERATED_SMALI.txt lists the smali they produce
├── java_sources/              jadx decompile of the smali-only classes (reference only, not compilable)
├── keystore/                  signing key (git-ignored, generated on first build if missing)
├── tools/                     apktool.jar (2.7.0), uber-apk-signer.jar (1.3.0), src/Dex2Smali.java, src/Smali2Dex.java
├── scripts/
│   ├── build_apk.sh           audits, then build, align, sign: build/gemini_chat_v<ver>.apk
│   ├── download_tools.sh      re-fetches tools/ from GitHub if missing
│   ├── build_java.sh          hand smali -> classpath jar; java/ -> javac (API 7) -> dx -> baksmali -> android_project/smali
│   ├── gen_emoji_table.py     regenerates assets/emoji.tsv from the `emoji` pip package (Unicode emoji list)
│   ├── check_registers.py     .locals budget + 4-bit register-format violations
│   ├── check_uninit.py        registers read by invoke before any write (approximate)
│   ├── check_cursors.py       Cursor open/close audit
│   └── check_readers.sh       BufferedReader open/close audit
├── tests/
│   ├── run_tests.sh           dex2jar + JVM bytecode verify + unit tests (no device needed)
│   ├── jvm/                   Tests.java, VerifyAll.java, WsLoopback.java, FakeDb (Cursor double), Environment stub
│   ├── live/LiveCheck.java    drives LiveSession against the real Live API from a desktop JVM (key from $GEMINI_KEY)
│   └── emulator/              mock Gemini server (SSE), mock Live server (WebSocket), Markdown sample, how-to
└── docs/ARCHITECTURE.md, docs/CHANGELOG.md
```

## 2. Classes

| Class | Source | What it does |
|---|---|---|
| `ChatListActivity` | smali | chat list, New Chat / Settings / Delete All; installs `TLSSocketFactory` on API 16-19 |
| `ChatActivity` | Java | chat screen, streaming request (`GeminiTask`), long-press actions, attachment bar, Read Aloud menu items, Stop keeps partial |
| `ReadAloud` | Java | Read Aloud: Interactions API text-to-speech (SSE audio deltas) → `AudioTrack`, in the Live voice |
| `AutoNamer` | Java | auto-naming after the first reply (used by chat and Live) |
| `SettingsActivity` | Java | settings (XML layout + sections built in code: custom model, thinking, auto-name, Live) |
| `LiveActivity` | Java | Live voice screen: mic (`AudioRecord`) to the model and the transcriber, speaker (`AudioTrack`, jitter buffer), synced transcript, echo gate, auto-resume, saves turns |
| `LiveSession` | Java, pure | Live API protocol (setup, history, resumption, realtimeInput, events); transcribe-only mode; writer thread for all sends |
| `LiveSocket` | Java, pure | RFC 6455 WebSocket client over the system TLS factory (proxy CONNECT, SNI) |
| `ReplyParser` | Java, pure | accumulates generateContent / SSE chunks; thoughts kept apart; thinking-level mapping |
| `DatabaseHelper` | Java | SQLite v3 |
| `Markdown`, `MessageFormatter`, `EmojiMap`, `TimeGrounding`, `Thumbnail`, `B64`, `Compat` | Java | rendering and helpers |
| `ConfigManager`, `ConfigBinder`, `SafActivity`, `FileExplorerActivity` | smali | backups (SAF on 4.4+, file browser below) |
| `ImageUtil` → `ImageUtilApi8` | smali | image → JPEG data URI (API 8+, `android.util.Base64`) |

"Pure" classes use no Android API and are tested on the JVM.

## 3. Build, test, install

```bash
./scripts/build_java.sh           # after editing java/ (fetches dex2jar + android-7.jar on first run)
./scripts/build_apk.sh            # needs Java 8+; fetches tools on first run if missing
./tests/run_tests.sh              # needs Java + git + network to GitHub on first run
adb install -r build/gemini_chat_v0.8.7.apk
GEMINI_KEY=... java ... LiveCheck gemini-3.8-live Kore ptt text "Hello"   # see tests/live/LiveCheck.java
```

`build_apk.sh` refuses to build if `versionCode` doesn't match `versionName` (0.8.7 → 87) or if the register or cursor audits fail.
Smali generated from `java/` must not be edited by hand: change the Java source and rerun `build_java.sh`.

## 4. Rules

1. **Keep signing with the same key.** `build_apk.sh` uses `keystore/gemini_chat.keystore` (git-ignored; created on the first build if missing; override with `KEYSTORE`, `KS_ALIAS`, `KS_PASS`). A different key means users must uninstall and lose their chats, so back the keystore up.
   v1 signatures must use **SHA-1** digests, because Android < 4.3 can't verify SHA-256 JAR signatures. uber-apk-signer/apksig picks this automatically from minSdk. Don't switch to plain `jarsigner` defaults.
2. **API-7 verifier rule.** Never reference an API 8+ class from a class that can load on Android 2.1. Gate with `Build.VERSION.SDK_INT` and put the newer API in its own class (pattern: `ImageUtil` → `ImageUtilApi8`), or use reflection (`Compat`, `LiveSocket.enableSni`). Newer attribute ids are used as raw ints (`MessageFormatter.ATTR_SELECTABLE_ITEM_BACKGROUND`).
3. **No network on the UI thread** (StrictMode kills it on 3.0+, silently on 2.x). Text: `AsyncTask.doInBackground`. Live: every send goes through `LiveSession`'s writer thread. 0.8.6 hit this: Live text worked on 2.1 and silently failed on 4.4.
4. **Close every Cursor and stream on every path**, including the exception path.
5. **Models:** `SettingsActivity.MODELS` (all models usable without billing per ai.google.dev/gemini-api/docs/pricing, 2026-10-23):
   `gemini-3.8-flash`, `gemini-3.6-flash`, `gemini-3.5-flash-lite`, `gemini-3.1-flash-lite`, `gemini-3-flash-preview` (legacy),
   `gemini-flash-latest`, `gemini-flash-lite-latest`, `gemma-4-31b-it`, `gemma-4-26b-a4b-it` (Gemma: thinking minimal/high only).
   Default for new installs: `ChatActivity.DEFAULT_MODEL` = `gemini-3.5-flash-lite`. Live: `LiveActivity.LIVE_MODELS`
   (`gemini-3.8-live` default, `-extended-thinking`, `gemini-3.1-flash-live-preview`). Both pickers have "Custom model...".
   Re-check the pricing / models / deprecations pages before changing the lists.
6. **Versioning:** `versionCode` = `versionName` with the dots removed (0.8.7 → 87). Set it only in `apktool.yml`.
7. **Java:** Java 8 syntax compiles, but no lambdas (no desugaring), no try-with-resources (`addSuppressed`, API 19), no static
   methods in inner classes, nothing missing from android-7.jar. Avoid `String.isEmpty()` (API 9). `AsyncTask.publishProgress`
   is varargs: wrap an array argument as `(Object) array` (0.8.6 crashed on this).
8. **Settings apply only on "Save Settings"** (all of them, including the ones built in code).

## 5. Smali pitfalls (hand-written smali only)

- Non-range `invoke-*`, `iget/iput`, `*/2addr`, two-register `if-*` and `move` can only address **v0–v15**.
- Two **`.catchall` blocks can't overlap** with different handlers.
- If a handler can throw, place it *inside* the outer try range.
- Check branch direction every time; always rebuild, decompile (`jadx`) and run the tests.

## 6. Current state (0.8.8)

`tests/run_tests.sh`: 95/95 classes pass `-Xverify:all`; 116/116 checks pass.

0.8.8 (2026-10-23), Android 2.1 emulator with the mocks: Read Aloud (request body, toast, Stop Reading in both menus, in-stream
error toast), Settings layout, Rename only in the chat list, Live hands-free and push-to-talk turns saved exactly once (late
transcripts update the saved turn; DB rows alternate user/model). Real API: one Read Aloud request (flash-lite TTS, 41 audio events).
The owner confirmed Live works on his Galaxy Y (real mic and speaker) before the duplicate-turn fix. `tests/live/LiveCheck2.java`: resumption + transcriber against the real API.

Verified (2026-10-23, see `docs/CHANGELOG.md` for the full list):
| Where | What passed |
|---|---|
| Android 2.1 (API 7), 240x320 / 120 dpi, mock server | every long-press action, 503 retry, streaming + thinking + thought dialog, auto-naming, colors, all Settings sections, Live (text, push-to-talk with emulator mic at 8 kHz, synced transcript, mute, saving, new chat) |
| Android 4.4 (API 19), real API | streaming thoughts (3 Flash Preview, 3.6 Flash), 503 → retry → error, image attach/Remove/Change/image-only, Live via system proxy (TLS 1.2 + SNI) with history, no-mic handling |
| Desktop JVM, real Live API | 3.8-live, 3.8-live-extended-thinking, 3.1-flash-live-preview; text and recorded speech (push-to-talk, hands-free); transcripts; history |

Real device: the owner confirmed chat works on a **Samsung Galaxy Y (Android 2.3, TLS 1.0)**. His TLS scan (2026-10-03) shows
Google's endpoint accepts TLS 1.0 (ECDHE and plain RSA AES-CBC-SHA) and serves a `*.googleapis.com` certificate without SNI.

### Known limitations / open items

- **Not verified:** Read Aloud sound on a real phone (emulators have no audio out), the 5.0+ ripple
  (no 5.0 image here), 3.8 Flash thinking (free tier answered 503 every time; same code path as 3.6 Flash).
- **Live on a phone speaker:** no echo cancellation on old phones. Push-to-talk is the default; hands-free mutes the mic for the
  whole reply + 0.7 s, so you can't interrupt by voice there (tap the mic button or type to interrupt).
- **Live text box streaming** uses a second session (gemini-3.5-transcribe-live): about twice the upload while talking. Off in
  Settings for slow links.
- **Live sessions:** resumed automatically (goAway or drop, up to 3 times in a row); after that the screen shows the reason and
  a Reconnect button.
- **TLS on Android 2.1–4.0:** TLS 1.0 only; Google still accepts it but could stop without notice.
- **Thought signatures** aren't stored or sent back (only required for function calling).
- **Image conversion runs on the UI thread** when picked (two-pass decode, ≤ 1024 px).
- **Emoji are always converted to `:shortcodes:`**, even where some render natively.
- **Settings backups contain the API key in plain text.**
- **Math rendering** is a small LaTeX subset to Unicode (no layout of fractions/matrices); unknown commands show their name.
