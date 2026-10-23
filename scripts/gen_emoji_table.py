#!/usr/bin/env python3
"""Regenerates android_project/assets/emoji.tsv ("<emoji>\t<shortcode>" per line, UTF-8)
from the `emoji` package (pip install emoji), which tracks the official Unicode emoji list.

Naming rule ("short codes"):
  1. the shortest Slack/GitHub-style alias made of [a-z0-9_]  (😂 -> joy, 👍 -> thumbsup, 🎉 -> tada)
  2. else the CLDR name, lower-cased, '-' and spaces -> '_', accents stripped  (🫠 -> melting_face)
  3. skin-tone variants of an aliased emoji get _tone1.._tone5 (👍🏽 -> thumbsup_tone3)
Every qualification status (fully/minimally/unqualified, components) is included so that
text missing U+FE0F still converts."""
import os, re, sys, unicodedata
import emoji

OUT = sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'android_project', 'assets', 'emoji.tsv')
TONES = {'\U0001F3FB': 'tone1', '\U0001F3FC': 'tone2', '\U0001F3FD': 'tone3', '\U0001F3FE': 'tone4', '\U0001F3FF': 'tone5'}

def clean(name):
    n = name.strip(':')
    n = unicodedata.normalize('NFKD', n).encode('ascii', 'ignore').decode()
    n = n.lower().replace('-', '_').replace(' ', '_')
    n = re.sub(r'[^a-z0-9_+]', '', n)
    return re.sub(r'_+', '_', n).strip('_')

def alias_of(data):
    al = [clean(a) for a in data.get('alias', []) if re.fullmatch(r':[a-z0-9_]+:', a)]
    return min(al, key=len) if al else None

def name_for(e, d):
    a = alias_of(d)
    if a: return a
    # skin-tone variant of a single aliased base emoji -> base_toneN
    tones = [c for c in e if c in TONES]
    if len(tones) == 1:
        base = e.replace(tones[0], '')
        for cand in (base, base + '️'):
            if cand in emoji.EMOJI_DATA:
                ba = alias_of(emoji.EMOJI_DATA[cand])
                if ba: return ba + '_' + TONES[tones[0]]
    return clean(d['en'])

rows = {}
for e, d in emoji.EMOJI_DATA.items():
    rows[e] = name_for(e, d)
with open(OUT, 'w', encoding='utf-8', newline='\n') as f:
    for e in sorted(rows, key=lambda k: (-len(k), k)):
        f.write(e + '\t' + rows[e] + '\n')
print(f"emoji {emoji.__version__}: wrote {len(rows)} entries "
      f"(Emoji {max(d['E'] for d in emoji.EMOJI_DATA.values())}) to {OUT} ({os.path.getsize(OUT)} bytes)")
