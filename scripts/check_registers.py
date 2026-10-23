#!/usr/bin/env python3
"""Checks every smali method for register-limit problems:
 - a vN above the declared .locals/.registers budget
 - 4-bit-format instructions (non-range invoke, 2addr, iget/iput, if-eq...) addressing a register above v15
Usage: check_registers.py [smali_dir]   (default: ../android_project/smali)"""
import os, re, sys

ROOT = sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'android_project', 'smali')

def param_slots(sig, static):
    args = sig[sig.index('(') + 1:sig.index(')')]
    n = 0 if static else 1
    i = 0
    while i < len(args):
        c = args[i]
        if c in 'JD': n += 2; i += 1
        elif c == 'L': n += 1; i = args.index(';', i) + 1
        elif c == '[':
            while args[i] == '[': i += 1
            if args[i] == 'L': i = args.index(';', i) + 1
            else: i += 1
            n += 1
        else: n += 1; i += 1
    return n

def is_4bit(op):
    """Instruction formats whose register fields are only 4 bits wide (v0-v15)."""
    if op.startswith('invoke-') and '/range' not in op: return True                 # 35c
    if op in ('move', 'move-wide', 'move-object', 'array-length', 'instance-of', 'new-array'): return True  # 12x/22c
    if op.endswith('/2addr') or op.endswith('/lit16'): return True                  # 12x / 22s
    if op.startswith(('neg-', 'not-', 'int-to-', 'long-to-', 'float-to-', 'double-to-')): return True
    if op in ('if-eq', 'if-ne', 'if-lt', 'if-ge', 'if-gt', 'if-le'): return True    # 22t
    if op.startswith(('iget', 'iput')): return True                                  # 22c
    return False

problems = 0
for root, _, files in os.walk(ROOT):
    for f in files:
        if not f.endswith('.smali'): continue
        path = os.path.join(root, f)
        for m in re.findall(r'(\.method.*?\.end method)', open(path, encoding='utf-8').read(), re.DOTALL):
            head = m.split('\n', 1)[0]
            if ' abstract ' in head or ' native ' in head: continue
            sig = head.split()[-1]
            pcount = param_slots(sig, ' static ' in head)
            loc = re.search(r'\.locals\s+(\d+)', m); reg = re.search(r'\.registers\s+(\d+)', m)
            if loc: locals_ = int(loc.group(1)); total = locals_ + pcount
            elif reg: total = int(reg.group(1)); locals_ = total - pcount
            else: continue
            for line in m.split('\n')[1:]:
                s = line.strip()
                if not s or s[0] in '.#:': continue
                op = s.split()[0]
                for r in re.findall(r'\b([vp])(\d+)\b', s.split('"')[0]):
                    idx = int(r[1]) if r[0] == 'v' else locals_ + int(r[1])
                    if idx >= total:
                        print(f"{f}: {head.strip()} uses {r[0]}{r[1]} beyond {total} registers"); problems += 1
                    elif idx > 15 and is_4bit(op):
                        print(f"{f}: {head.strip()} non-range '{op}' uses {r[0]}{r[1]} (= v{idx} > v15)"); problems += 1
print("Register check complete:", problems, "problem(s)")
sys.exit(1 if problems else 0)
