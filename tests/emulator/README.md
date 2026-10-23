# Emulator smoke test (no Google access needed)

Tested on 2026-10-22 with SDK tools r25.2.5 (`emulator -engine classic -skin 480x800`, no KVM needed) and the
`armeabi-v7a-10_r05` Google APIs image (Android 2.3.7, API 10), at 320x480 and 480x800 (hdpi).
Without `-skin`, the classic emulator ignores `hw.lcd.width/height` in config.ini.

1. Build a mock-endpoint variant (never ship it), on a *copy* of the project:
   ```bash
   sed -i 's#https://generativelanguage.googleapis.com/v1beta/models/#http://10.0.2.2:8765/v1beta/models/#g' android_project/smali/com/gemini/chat/*.smali
   sed -i 's#https://generativelanguage.googleapis.com/v1beta/interactions#http://10.0.2.2:8765/v1beta/interactions#g' android_project/smali/com/gemini/chat/*.smali
   sed -i 's#"wss://generativelanguage.googleapis.com/ws/google.ai.generativelanguage.v1beta.GenerativeService.BidiGenerateContent"#"ws://10.0.2.2:8766/ws"#' android_project/smali/com/gemini/chat/*.smali
   ```
   Replace the URL *prefix* (`/g`): javac folds constant concatenations (e.g. the auto-naming URL) into one string.
   Then build and sign as usual.
2. On the host run `python3 mock_gemini.py requests.log` (port 8765) and, for Live, `python3 mock_live.py live_requests.log`
   (port 8766, needs `pip install websockets`). The emulator reaches the host at 10.0.2.2.
   The API key must be `TESTKEY`. Prompt keywords: `think` (streams thought summaries first, when "Show thought process" is on),
   `busy` (two 503s, then a reply: tests auto-retry), `blockme`, `slow`, `thought`, `markdown` (replies with `markdown_sample.md`),
   `emojitest`, `math` (LaTeX sample incl. prices that must stay text). Title requests (auto-naming) get "Mock Chat Title".
   `:streamGenerateContent` is answered as SSE.
   The Live mock answers text and push-to-talk audio with a 3 s tone plus word-by-word transcripts (first chunk odd-sized);
   hands-free sessions get a reply after every 30 audio chunks (simulated voice detection; the timestamped log shows whether
   the app kept the mic muted during the reply); `goaway` in a text triggers goAway + disconnect (tests auto-resume);
   the transcriber model gets interim text every 5 chunks and a final text on audioStreamEnd.
   Every request is logged (audio data shortened).
3. Install with `adb install -r`, use the app, and inspect the logs for the exact request bodies.

The real Live protocol is easier to test without a device: `tests/live/LiveCheck.java` runs `LiveSession` on a desktop JVM
(`GEMINI_KEY=... java -cp <classes>:<org.json> LiveCheck <model> <voice> ptt|free text "..."|audio file.pcm16k [out.pcm] [hist]`),
printing transcripts and saving the 24 kHz reply audio. Recorded speech can be produced by asking the model to say a sentence
and resampling its output to 16 kHz.

Android 2.3 has no `input tap`: drive the UI with `input keyevent 19/20/21/22` (D-pad) and `23` (center),
or inject touches with `sendevent /dev/input/event0` (ABS_X=3 0, ABS_Y=3 1, BTN_TOUCH=1 330);
grab screenshots from `/dev/graphics/fb0` (RGB565; size from `/sys/class/graphics/fb0/virtual_size`, front buffer
from `/sys/class/graphics/fb0/pan`).

## Version-specific notes (learned the hard way)
- **Android 2.1 (API 7)**: images come from the platform package `android-2.1_r03-linux.zip` (`images/`), not `sys-img/`.
  It never sets `sys.boot_completed`; wait for `dev.bootcomplete=1`. Set `hw.keyboard=no`, or an "open" slide-out keyboard
  forces landscape. The default IME is Pinyin: run `ime disable com.android.inputmethod.pinyin/.PinyinIME` and
  `ime set com.android.inputmethod.latin/.LatinIME`. `am start` can't launch non-exported activities from the shell; use the menus.
  `chown` needs names (`app_28.app_28`), not numeric uids.
- **Android 4.4 (API 19)**: `input tap/swipe` work. For live HTTPS through a TLS-intercepting proxy, push the proxy CA as
  `/system/etc/security/cacerts/<subject_hash_old>.0` (after `adb root && adb remount`; lost on reboot), and set
  `settings put global http_proxy 10.0.2.2:<port>`. Don't combine this with the emulator's own `-http-proxy` flag.
- Galaxy Y profile: `-skin 240x320` and `hw.lcd.density=120`.
- **Audio:** the API 7 emulator offers a silent microphone at 8 kHz only (good for testing the rate fallback and push-to-talk)
  and an AudioTrack that may stall (`obtainBuffer timed out`); the API 19 image has neither (tests the "Microphone not available"
  and text-only paths). Real voice quality can't be judged on these emulators.
- **Live through a TLS-intercepting proxy:** the proxy needs SNI; `LiveSocket` sets it via `setHostname` (Android's own
  HttpsURLConnection does the same). The WebSocket uses the system proxy (`settings put global http_proxy ...`) via CONNECT.
