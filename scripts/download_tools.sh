#!/usr/bin/env bash
# Fetches the build tools into ./tools if they are missing. Everything comes from GitHub releases.
#   apktool 2.7.0        - smali/resources -> APK      (Apache-2.0, iBotPeaches/Apktool)
#   uber-apk-signer 1.3.0 - zipalign + apksig signing  (Apache-2.0, patrickfav/uber-apk-signer)
# Test-only tools (dex2jar, JSON-java, android.jar stubs) are fetched by tests/run_tests.sh.
set -euo pipefail
TOOLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../tools" && pwd)"

fetch() {  # url dest
    if [ -s "$2" ]; then echo "ok        $(basename "$2")"; return; fi
    echo "download  $(basename "$2")"
    curl -fL --retry 3 -o "$2.part" "$1" && mv "$2.part" "$2"
}
fetch https://github.com/iBotPeaches/Apktool/releases/download/v2.7.0/apktool_2.7.0.jar "$TOOLS_DIR/apktool.jar"
fetch https://github.com/patrickfav/uber-apk-signer/releases/download/v1.3.0/uber-apk-signer-1.3.0.jar "$TOOLS_DIR/uber-apk-signer.jar"
echo "Tools ready in $TOOLS_DIR"
