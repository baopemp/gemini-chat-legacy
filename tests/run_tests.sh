#!/usr/bin/env bash
# JVM test suite for the smali code (no device needed).
#  1. converts the built APK's dex to a jar with dex2jar
#  2. force-loads every class with -Xverify:all (catches type/register errors in the bytecode)
#  3. unit-tests the Gemini request/response code, the emoji table (every entry), the Markdown parser,
#     time grounding and backup validation, using AOSP-compatible org.json (stleary/JSON-java) + android.jar stubs.
# A JVM pass is NOT a Dalvik pass: still smoke-test on an emulator/device before release.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
T="$ROOT/tests"; C="$T/.cache"; mkdir -p "$C"
cd "$ROOT"

APK=$(ls -t build/gemini_chat_v*.apk 2>/dev/null | head -1 || true)
[ -n "$APK" ] || { ./scripts/build_apk.sh; APK=$(ls -t build/gemini_chat_v*.apk | head -1); }

if [ ! -d "$C/dex-tools" ]; then
    curl -fsSL -o "$C/d2j.zip" https://github.com/pxb1988/dex2jar/releases/download/v2.4/dex-tools-v2.4.zip
    unzip -q -o "$C/d2j.zip" -d "$C" && mv "$C/dex-tools-v2.4" "$C/dex-tools" && rm "$C/d2j.zip"
fi
[ -s "$C/android-14.jar" ] || curl -fsSL -o "$C/android-14.jar" https://raw.githubusercontent.com/Sable/android-platforms/master/android-14/android.jar
if [ ! -d "$C/jsonclasses" ]; then
    rm -rf "$C/JSON-java"; git clone -q --depth 1 https://github.com/stleary/JSON-java.git "$C/JSON-java"
    mkdir -p "$C/jsonclasses"; javac -nowarn -d "$C/jsonclasses" $(find "$C/JSON-java/src/main/java" -name "*.java") 2>/dev/null
fi

D2J="$C/dex-tools/d2j-dex2jar.sh"; chmod +x "$C"/dex-tools/*.sh
"$D2J" -f -o "$C/app.jar" "$APK" >/dev/null 2>&1

CP="$C/jsonclasses:$C/app.jar:$C/android-14.jar"
rm -rf "$C/classes" && mkdir -p "$C/classes"
javac -nowarn -XDignore.symbol.file -d "$C/classes" -cp "$CP" \
    "$T/jvm/android/os/Environment.java" "$T/jvm/com/gemini/chat/FakeDb.java" "$T/jvm/Tests.java" "$T/jvm/VerifyAll.java" "$T/jvm/WsLoopback.java" 2>&1 | grep -v "warning\|Note:" || true

echo "== Bytecode verification ($APK)"
java -Xverify:all -cp "$C/classes:$CP" VerifyAll "$C/app.jar" 2>&1 | grep -v "deprecated"
echo "== Unit tests"
java -cp "$C/classes:$CP" Tests "$ROOT/android_project/assets/emoji.tsv"
