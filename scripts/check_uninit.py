#!/usr/bin/env python3
"""Approximate, linear (branch-insensitive) scan for registers read by an invoke before any
instruction in the method has written them. Wide writes (move-result-wide, const-wide, iget-wide,
...) mark both halves of the pair. Expect occasional false positives on unusual control flow.
Usage: check_uninit.py [smali_dir]"""
import os, re, sys

ROOT = sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'android_project', 'smali')
NO_DEST = ('invoke-', 'return', 'goto', 'if-', 'throw', 'monitor-', 'check-cast', 'fill-array-data',
           'packed-switch', 'sparse-switch', 'iput', 'sput', 'aput', 'nop', 'filled-new-array')

def expand(regs_text):
    m = re.match(r'\{\s*([vp])(\d+)\s*\.\.\s*[vp](\d+)\s*\}', regs_text.strip())
    if m: return [f"{m.group(1)}{i}" for i in range(int(m.group(2)), int(m.group(3)) + 1)]
    return re.findall(r'[vp]\d+', regs_text)

problems = 0
for root, _, files in os.walk(ROOT):
    for f in files:
        if not f.endswith('.smali'): continue
        for m in re.findall(r'(\.method.*?\.end method)', open(os.path.join(root, f), encoding='utf-8').read(), re.DOTALL):
            lines = m.split('\n'); head = lines[0]
            if ' abstract ' in head or ' native ' in head: continue
            written = {f"p{i}" for i in range(32)}
            for line in lines[1:]:
                s = line.strip()
                if not s or s[0] in '.#:': continue
                op = s.split()[0]
                code = s.split('"')[0]
                if op.startswith('invoke-'):
                    for r in expand(code[code.index('{'):code.index('}') + 1]):
                        if r not in written:
                            print(f"{f}: {head.strip()}: {s} -> {r} read before any write"); problems += 1
                    continue
                if op.startswith(NO_DEST): continue
                regs = re.findall(r'[vp]\d+', code)
                if not regs: continue
                written.add(regs[0])
                if '-wide' in op or op in ('const-wide', 'cmp-long') and False:
                    pass
                if '-wide' in op and not op.startswith(('cmp', 'long-to-int', 'double-to-int', 'double-to-float', 'long-to-float')):
                    written.add(regs[0][0] + str(int(regs[0][1:]) + 1))
                if op.startswith(('long-to-', 'double-to-', 'int-to-long', 'int-to-double', 'float-to-long', 'float-to-double')) \
                        and op.endswith(('long', 'double')):
                    written.add(regs[0][0] + str(int(regs[0][1:]) + 1))
                if op.split('/')[0] in ('add-long', 'sub-long', 'mul-long', 'div-long', 'rem-long', 'and-long', 'or-long',
                                        'xor-long', 'shl-long', 'shr-long', 'ushr-long', 'neg-long', 'not-long',
                                        'add-double', 'sub-double', 'mul-double', 'div-double', 'rem-double', 'neg-double'):
                    written.add(regs[0][0] + str(int(regs[0][1:]) + 1))
print("Uninitialized-register check complete:", problems, "possible issue(s)")
sys.exit(1 if problems else 0)
