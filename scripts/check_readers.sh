#!/bin/bash
# Flags smali files that construct a BufferedReader more often than they close one.
# (Closing on both the normal and the exception path legitimately gives closes > opens.)
SMALI_DIR="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/android_project/smali}"
status=0
for file in $(find "$SMALI_DIR" -name "*.smali"); do
    opened=$(grep -c "Ljava/io/BufferedReader;-><init>(" "$file")
    closed=$(grep -c "Ljava/io/BufferedReader;->close()V" "$file")
    if [ "$opened" -gt 0 ]; then
        if [ "$closed" -lt "$opened" ]; then
            echo "POTENTIAL LEAK  $(basename "$file"): opened $opened, closed $closed"; status=1
        else
            echo "ok              $(basename "$file"): opened $opened, closed $closed"
        fi
    fi
done
exit $status
