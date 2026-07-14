#!/usr/bin/env python3
"""Generate BaniData.swift from the bani source texts in extracted.json.

Splits each bani into stanza blocks on the numbered pauri markers
(॥੧॥ in Gurmukhi, ||1|| in romanization/English), keeps per-language
block arrays, and flags banis whose marker sequences align across all
three languages (those get the interleaved Study mode in the app).

Run from this directory:  python3 generate_bani_data.py
"""
import json
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))
SRC = os.path.join(HERE, 'extracted.json')
OUT = os.path.join(HERE, '..', 'GuruBani.swiftpm', 'BaniData.swift')

GURMUKHI_DIGITS = {c: str(i) for i, c in enumerate('੦੧੨੩੪੫੬੭੮੯')}

META = {
    'Mool Mantar': dict(gurmukhiTitle='ਮੂਲ ਮੰਤਰ', subtitle='The Root Mantra',
                        timeOfDay='anytime', durationMinutes=1),
    'Japji Sahib': dict(gurmukhiTitle='ਜਪੁਜੀ ਸਾਹਿਬ', subtitle='Morning Prayer',
                        timeOfDay='morning', durationMinutes=16),
    'So Dar (Rehras)': dict(gurmukhiTitle='ਸੋ ਦਰੁ ਰਹਿਰਾਸ', subtitle='Evening Prayer',
                            timeOfDay='evening', durationMinutes=20),
    'Sohila': dict(gurmukhiTitle='ਸੋਹਿਲਾ ਸਾਹਿਬ', subtitle='Night Prayer',
                   timeOfDay='night', durationMinutes=5),
}


def gurmukhi_lines(block):
    """Split a Gurmukhi block into display lines at ॥ boundaries."""
    tokens = block.split('॥')
    lines, cur = [], ''
    for tok in tokens[:-1]:
        stripped = tok.strip()
        if stripped and all(c in GURMUKHI_DIGITS for c in stripped):
            # numbered marker like ੧ — glue onto the previous line: ...॥੧॥
            if lines:
                lines[-1] += stripped + '॥'
            else:
                cur += stripped + '॥'
            continue
        if stripped == 'ਰਹਾਉ':
            # ॥ ਰਹਾਉ ॥ belongs to the line it closes
            if lines:
                lines[-1] += ' ਰਹਾਉ ॥'
            continue
        cur += tok + '॥'
        if stripped:
            lines.append(re.sub(r'\s+', ' ', cur).strip())
            cur = ''
    tail = tokens[-1].strip()
    if cur.strip():
        lines.append(re.sub(r'\s+', ' ', cur).strip())
    if tail:
        lines.append(tail)
    return [l for l in lines if l]


def roman_lines(block):
    parts = re.split(r'\s*\|\|\s*', block)
    return [re.sub(r'\s+', ' ', p).strip() for p in parts if p.strip()]


def clean_english(block):
    text = re.sub(r'\s*\|\|\s*', ' ', block)
    return re.sub(r'\s+', ' ', text).strip()


def split_blocks(text, marker_re, digit_map=None):
    """Split text on numbered markers; the marker closes the block before it."""
    chunks = re.split(marker_re, text)
    blocks = []  # (marker or None, chunk_text)
    for i in range(0, len(chunks), 2):
        chunk = chunks[i].strip()
        marker = chunks[i + 1] if i + 1 < len(chunks) else None
        if marker and digit_map:
            marker = ''.join(digit_map[c] for c in marker)
        if chunk or marker:
            blocks.append((marker, chunk))
    return blocks


def build_bani(item):
    title = item['title']
    g_text = item['punjabi']
    r_text = item['hinglish'].replace('II', '||')
    e_text = re.sub(r'\(SGGS[^)]*\)', ' ', item['english'])

    if title == 'Mool Mantar':
        return build_mool_mantar(g_text, r_text, e_text)

    g_raw = split_blocks(g_text, r'॥\s*([੦-੯]+)\s*॥', GURMUKHI_DIGITS)
    r_raw = split_blocks(r_text, r'\|\|\s*(\d+)\s*\|\|')
    e_raw = split_blocks(e_text, r'\|\|\s*(\d+)\s*\|\|')

    digits = '੦੧੨੩੪੫੬੭੮੯'
    gurmukhi = [(m, '\n'.join(gurmukhi_lines(
                    c + (' ॥' + ''.join(digits[int(d)] for d in m) + '॥' if m else ''))))
                for m, c in g_raw]
    # keep the authentic ॥n॥ marker inside the Gurmukhi text; strip from others
    gurmukhi = [(m, t) for m, t in gurmukhi if t]
    translit = [(m, '\n'.join(roman_lines(c))) for m, c in r_raw if c]
    english = [(m, clean_english(c)) for m, c in e_raw if c]

    aligned = ([m for m, _ in gurmukhi] == [m for m, _ in translit] == [m for m, _ in english])
    return gurmukhi, translit, english, aligned


def build_mool_mantar(g_text, r_text, e_text):
    """Mool Mantar has no numbered markers — hand-aligned three-way split."""
    g = re.sub(r'\s+', ' ', g_text).strip()
    jap = g.index('॥ ਜਪੁ ॥')
    g1 = g[:jap].strip()
    g2 = '॥ ਜਪੁ ॥'
    g3 = '\n'.join(gurmukhi_lines(g[jap + len('॥ ਜਪੁ ॥'):].strip()))

    r_sents = re.split(r'(?<=[.!])\s+', re.sub(r'\s+', ' ', r_text).strip())
    e_sents = re.split(r'(?<=[.!])\s+', re.sub(r'\s+', ' ', e_text).strip())
    assert len(r_sents) == 3, r_sents
    # english: first sentence = invocation, second = Jap, rest = Aad sach
    e1, e2, e3 = e_sents[0], e_sents[1], ' '.join(e_sents[2:])

    gurmukhi = [(None, g1), (None, g2), (None, g3)]
    translit = [(None, r_sents[0]), (None, r_sents[1]), (None, r_sents[2])]
    english = [(None, e1), (None, e2), (None, e3)]
    return gurmukhi, translit, english, True


def swift_str(s):
    return '"' + s.replace('\\', '\\\\').replace('"', '\\"').replace('\n', '\\n') + '"'


def swift_blocks(blocks, indent):
    pad = ' ' * indent
    out = []
    for i, (marker, text) in enumerate(blocks, 1):
        m = swift_str(marker) if marker else 'nil'
        out.append(f'{pad}LanguageBlock(id: {i}, marker: {m}, text: {swift_str(text)}),')
    return '\n'.join(out)


def main():
    data = json.load(open(SRC))
    entries = []
    for item in data:
        title = item['title']
        meta = META[title]
        gurmukhi, translit, english, aligned = build_bani(item)
        print(f"{title}: {len(gurmukhi)}/{len(translit)}/{len(english)} blocks, aligned={aligned}")
        entries.append(f'''        Shabad(
            id: {item['id']},
            title: {swift_str(title)},
            gurmukhiTitle: {swift_str(meta['gurmukhiTitle'])},
            subtitle: {swift_str(meta['subtitle'])},
            timeOfDay: .{meta['timeOfDay']},
            audioFileName: {swift_str(item['audioFileName'])},
            durationMinutes: {meta['durationMinutes']},
            isAligned: {'true' if aligned else 'false'},
            gurmukhi: [
{swift_blocks(gurmukhi, 16)}
            ],
            translit: [
{swift_blocks(translit, 16)}
            ],
            english: [
{swift_blocks(english, 16)}
            ]
        ),''')

    body = '\n'.join(entries)
    swift = f'''// BaniData.swift
// GENERATED by tools/generate_bani_data.py — edit the script, not this file.
// Bani texts split into stanza blocks on their numbered pauri markers.

import Foundation

extension Shabad {{
    static let allShabads: [Shabad] = [
{body}
    ]
}}
'''
    open(OUT, 'w').write(swift)
    print(f"wrote {OUT} ({len(swift)} chars)")

    # validation: spot-check Japji pauri 1 across languages
    japji = [d for d in data if d['title'] == 'Japji Sahib'][0]
    g, t, e, _ = build_bani(japji)
    print('\n--- Japji block 2 (pauri 1) spot check ---')
    print('G:', g[1][1][:120])
    print('T:', t[1][1][:120])
    print('E:', e[1][1][:120])


if __name__ == '__main__':
    main()
