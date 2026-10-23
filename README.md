# Gemini Chat: Legacy Android Client

A native Gemini API chat client for Android 2.1+ (API 7), about 145 KB, with no external libraries.
Supports streamed replies with thought summaries, Gemini Live voice chat (mic + speaker, your words typed into the box as you
speak, synced transcripts, 30 voices, auto-reconnect), readable LaTeX math, adjustable text size,
editing/regenerating/deleting messages, chat history in SQLite, auto-named chats, system instructions, optional time grounding,
image attachments (API 8+), Markdown rendering with native text spans, Emoji 18 → `:shortcode:` conversion for old fonts,
and chat/settings backup and restore.

> This project was built with the assistance of AI.

## Quick start

```bash
./scripts/build_apk.sh                         # Java 8+ required
adb install -r build/gemini_chat_v0.8.7.apk    # -r keeps chats and settings
./tests/run_tests.sh                           # optional: JVM verification + unit tests
```

The build tools (`tools/apktool.jar`, `tools/uber-apk-signer.jar`) are included.
`scripts/download_tools.sh` re-fetches them from GitHub if they're missing.

## Layout

| Path | What it is |
|---|---|
| `android_project/` | apktool project: smali, resources, manifest, `apktool.yml` (version) |
| `java/` | Java sources of the newer classes (compiled to smali by `scripts/build_java.sh`) |
| `java_sources/` | jadx decompile of the current APK, for reading only |
| `scripts/` | build script and smali audits |
| `tests/` | dex2jar-based JVM test suite, Live API harness, emulator mocks |
| `keystore/` | release key (alias `geminichat`, password `geminipass`) |
| `docs/` | `ARCHITECTURE.md`, `CHANGELOG.md` |

Read `HANDOFF_FOR_CLAUDE.md` before changing anything. It lists the rules, smali pitfalls and known limitations.
