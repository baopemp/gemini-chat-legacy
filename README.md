# Gemini Chat: Legacy Android Client

A native Gemini API chat client for Android 2.1+ (API 7), about 145 KB, with no external libraries.
Supports streamed replies with thought summaries, Gemini Live voice chat (mic + speaker, your words typed into the box as you
speak, synced transcripts, 30 voices, auto-reconnect), Read Aloud for replies in the same voice, readable LaTeX math, adjustable text size,
editing/regenerating/deleting messages, chat history in SQLite, auto-named chats, system instructions, optional time grounding,
image attachments (API 8+), Markdown rendering with native text spans, Emoji 18 → `:shortcode:` conversion for old fonts,
and chat/settings backup and restore.

> This project was built with the assistance of AI.

## Quick start

```bash
./scripts/build_apk.sh                         # Java 8+ required
adb install -r build/gemini_chat_v0.8.8.apk    # -r keeps chats and settings
./tests/run_tests.sh                           # optional: JVM verification + unit tests
```

Needs a JDK 8+ (for `keytool`), Python 3 and `curl`. The first build downloads apktool and uber-apk-signer into `tools/`
(`scripts/download_tools.sh`) and creates a local signing key in `keystore/`. Keep that key: an APK signed with a different key
can't update an installed copy, so you'd have to uninstall first (that deletes chats).

## Layout

| Path | What it is |
|---|---|
| `android_project/` | apktool project: smali, resources, manifest, `apktool.yml` (version) |
| `java/` | Java sources of the newer classes (compiled to smali by `scripts/build_java.sh`) |
| `java_sources/` | readable jadx decompile of the classes that exist only as hand-written smali (reference, not compilable) |
| `scripts/` | build script and smali audits |
| `tests/` | dex2jar-based JVM test suite, Live API harness, emulator mocks |
| `keystore/` | your signing key (git-ignored, generated on first build) |
| `docs/` | `ARCHITECTURE.md`, `CHANGELOG.md`, `HANDOFF.md` |

Read `docs/HANDOFF.md` before changing anything. It lists the rules, smali pitfalls and known limitations.

## Setup

1. Install the APK and open **Settings**.
2. Paste a Gemini API key from [Google AI Studio](https://aistudio.google.com/apikey). The free tier works.
3. Pick a model and chat. Gemini Live needs a microphone and a recent network connection.

The key is stored in the app's private preferences on the device and is sent only to `generativelanguage.googleapis.com`.

## Credits

- Build tools: [Apktool](https://github.com/iBotPeaches/Apktool) and [uber-apk-signer](https://github.com/patrickfav/uber-apk-signer) (both Apache-2.0), downloaded on first build.
- Emoji list: the Python [`emoji`](https://pypi.org/project/emoji/) package, which tracks the official Unicode emoji data.
- Built with the assistance of AI.

## License

[MIT](LICENSE) © 2026 baopemp
