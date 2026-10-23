#!/usr/bin/env python3
"""Lists smali methods that touch android.database.Cursor without calling close().
Methods that return a Cursor (ownership passes to the caller) and cursor-adapter
plumbing are reported as INFO, not as leaks.
Usage: check_cursors.py [smali_dir]"""
import os, re, sys

ROOT = sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'android_project', 'smali')
leaks = 0
for root, _, files in os.walk(ROOT):
    for f in files:
        if not f.endswith('.smali'): continue
        content = open(os.path.join(root, f), encoding='utf-8').read()
        if 'Landroid/database/Cursor;' not in content: continue
        for m in re.findall(r'(\.method.*?\.end method)', content, re.DOTALL):
            head = m.split('\n', 1)[0].strip()
            opens = 'SQLiteDatabase;->query(' in m or 'SQLiteDatabase;->rawQuery(' in m or 'DatabaseHelper;->get' in m and ')Landroid/database/Cursor;' in m
            if not opens or 'Cursor;->close()V' in m: continue
            if head.endswith(')Landroid/database/Cursor;') or 'startManagingCursor' in m or 'CursorAdapter' in m or 'access$' in head:
                print(f"INFO  {f}: {head} (cursor returned or managed by Activity)")
            else:
                print(f"LEAK? {f}: {head}"); leaks += 1
print("Cursor check complete:", leaks, "possible leak(s)")
sys.exit(1 if leaks else 0)
