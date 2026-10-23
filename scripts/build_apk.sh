#!/usr/bin/env bash
# One-command build: smali + resources -> APK -> zipalign -> sign with the release keystore.
# Output: build/gemini_chat_v<versionName>.apk
# Needs only Java 8+. Tools are fetched on first run (scripts/download_tools.sh).
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

APKTOOL_JAR=tools/apktool.jar
SIGNER_JAR=tools/uber-apk-signer.jar
KEYSTORE=keystore/gemini_chat.keystore

command -v java >/dev/null 2>&1 || { echo "Error: Java 8+ is required (java not found)."; exit 1; }
[ -s "$APKTOOL_JAR" ] && [ -s "$SIGNER_JAR" ] || ./scripts/download_tools.sh

VERSION_NAME=$(sed -n 's/^ *versionName: *//p' android_project/apktool.yml | tr -d "'\"")
VERSION_CODE=$(sed -n 's/^ *versionCode: *//p' android_project/apktool.yml | tr -d "'\"")
EXPECTED_CODE=$(echo "$VERSION_NAME" | tr -d '.' | sed 's/^0*//')
if [ "$VERSION_CODE" != "$EXPECTED_CODE" ]; then
    echo "Error: versionCode ($VERSION_CODE) does not match versionName ($VERSION_NAME). Expected $EXPECTED_CODE."
    exit 1
fi

echo "=== Building Gemini Chat v$VERSION_NAME (versionCode $VERSION_CODE) ==="
rm -rf android_project/build build
mkdir -p build

echo "==> [1/3] Audits"
python3 scripts/check_registers.py >/dev/null || { python3 scripts/check_registers.py; exit 1; }
python3 scripts/check_cursors.py   >/dev/null || { python3 scripts/check_cursors.py; exit 1; }

echo "==> [2/3] apktool b"
java -jar "$APKTOOL_JAR" b android_project -o build/unsigned.apk

echo "==> [3/3] zipalign + sign (v1 uses SHA-1 automatically because minSdk < 18, required by Android 2.x-4.2)"
java -jar "$SIGNER_JAR" -a build/unsigned.apk -o build/signed \
    --ks "$KEYSTORE" --ksAlias geminichat --ksPass geminipass --ksKeyPass geminipass

OUT="build/gemini_chat_v$VERSION_NAME.apk"
mv build/signed/unsigned-aligned-signed.apk "$OUT"
rm -rf build/signed build/unsigned.apk android_project/build

echo "=== Done: $ROOT/$OUT ==="
echo "Install (keeps data):  adb install -r $OUT"
