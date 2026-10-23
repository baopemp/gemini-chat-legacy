#!/bin/bash
# Flags smali files whose query()/rawQuery() calls outnumber Cursor.close() calls.
# Methods that *return* a Cursor (DatabaseHelper.getChats/getMessages) hand ownership
# to the caller, so they are subtracted from the count.
SMALI_DIR="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/android_project/smali}"
status=0
for file in $(find "$SMALI_DIR" -name "*.smali"); do
    q=$(grep -c "Landroid/database/sqlite/SQLiteDatabase;->query(" "$file")
    r=$(grep -c "Landroid/database/sqlite/SQLiteDatabase;->rawQuery(" "$file")
    returned=$(grep -c "^\.method.*)Landroid/database/Cursor;$" "$file")
    closed=$(grep -c "Landroid/database/Cursor;->close()V" "$file")
    owned=$((q + r - returned))
    if [ $((q + r)) -gt 0 ]; then
        if [ "$closed" -lt "$owned" ]; then
            echo "POTENTIAL LEAK  $(basename "$file"): owned $owned, closed $closed"; status=1
        else
            echo "ok              $(basename "$file"): queries $((q + r)) (returned to caller: $returned), closes $closed"
        fi
    fi
done
exit $status
