#!/usr/bin/env python3
"""diff_max_versions.py — what changed between two Max installs, as a Markdown report.

Max ships no machine-readable changelog, and its userguide's "What's New" page
covers only the major version. The installs themselves are the record: two
Max.app bundles side by side say exactly which objects, attributes, messages,
help patches and userguide pages changed. Run this whenever Max is updated,
with the old version mounted from its .dmg (Cycling '74's installers keep the
previous one in ~/Downloads), then read the report and update the repo.

What it compares, all under Contents/Resources/C74:
  - the object registry (interfaces/obj-qlookup.json) and the init/ object
    mappings of the install and its bundled packages
  - every refpage (*.maxref.xml): new and removed pages; per page, top-level
    attributes, messages, arguments, inlets, outlets, inherited Jitter
    attributes, enum values, and word-level changes to digests and descriptions
  - help patches (*.maxhelp): object and message boxes added or removed
  - userguide pages (docs/userguide/content/*.json): word-level prose changes
  - files added or removed anywhere else (binaries listed by name only)

Usage:
    python3 scans/max-versions/diff_max_versions.py OLD_APP NEW_APP [-o report.md]

    OLD_APP / NEW_APP are Max.app bundles, e.g.
    /Volumes/Max915/Max.app /Applications/Max.app. Without -o the report is
    written next to this script as max_<old>_to_<new>_diff.md.

Stdlib only. Reads both installs; writes only the report.
"""
from __future__ import annotations

import argparse
import difflib
import filecmp
import json
import plistlib
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

HERE = Path(__file__).resolve().parent
C74 = Path("Contents/Resources/C74")


# ── helpers ──────────────────────────────────────────────────────────────────

def version(app: Path) -> str:
    info = plistlib.loads((app / "Contents/Info.plist").read_bytes())
    return str(info["CFBundleShortVersionString"]).split(" ")[0]


def text_of(e) -> str:
    return re.sub(r"\s+", " ", " ".join(e.itertext())).strip() if e is not None else ""


def word_diff(a: str, b: str, limit: int = 600) -> str:
    aw, bw = a.split(), b.split()
    parts = []
    for op, i1, i2, j1, j2 in difflib.SequenceMatcher(None, aw, bw, autojunk=False).get_opcodes():
        if op == "equal":
            continue
        old, new = " ".join(aw[i1:i2]), " ".join(bw[j1:j2])
        parts.append((f"~~{old}~~ " if old else "") + (f"**{new}**" if new else ""))
    out = " … ".join(parts)
    return out if len(out) <= limit else out[:limit] + "…"


def walk_files(root: Path):
    for p in root.rglob("*"):
        if p.is_file() and ".mxo/" not in str(p) and "__pycache__" not in p.parts:
            yield p.relative_to(root)


def md_cell(s: str) -> str:
    return s.replace("|", "\\|").replace("\n", " ")


# ── object registry and mappings ─────────────────────────────────────────────

def registry_section(old: Path, new: Path) -> list[str]:
    out = ["## Object registry (`interfaces/obj-qlookup.json`)", ""]
    try:
        a = json.loads((old / "interfaces/obj-qlookup.json").read_text())
        b = json.loads((new / "interfaces/obj-qlookup.json").read_text())
    except (OSError, ValueError) as exc:
        return out + [f"Not compared: {type(exc).__name__}.", ""]
    out.append(f"{len(a)} objects before, {len(b)} after.")
    out.append("")
    for name in sorted(set(b) - set(a)):
        out.append(f"- **added** `{name}`: {b[name].get('digest', '')}")
    for name in sorted(set(a) - set(b)):
        out.append(f"- **removed** `{name}`: {a[name].get('digest', '')}")
    for name in sorted(set(a) & set(b)):
        if a[name] != b[name]:
            keys = sorted(k for k in set(a[name]) | set(b[name]) if a[name].get(k) != b[name].get(k))
            out.append(f"- **changed** `{name}`: " + "; ".join(
                f"{k}: `{a[name].get(k)}` → `{b[name].get(k)}`" for k in keys))
    out.append("")
    out.append("### Object mappings (`init/*.txt`, install and bundled packages)")
    out.append("")
    files = sorted({p for p in walk_files(old) if p.suffix == ".txt" and "init" in p.parts} |
                   {p for p in walk_files(new) if p.suffix == ".txt" and "init" in p.parts})
    for rel in files:
        la = (old / rel).read_text(errors="replace").splitlines() if (old / rel).exists() else []
        lb = (new / rel).read_text(errors="replace").splitlines() if (new / rel).exists() else []
        if la == lb:
            continue
        diff = [l for l in difflib.unified_diff(la, lb, lineterm="", n=0)
                if l[:1] in "+-" and not l.startswith(("+++", "---")) and l[1:].strip()]
        if diff:
            out.append(f"`{rel}`")
            out.append("```")
            out.extend(diff)
            out.append("```")
    out.append("")
    return out


# ── refpages ─────────────────────────────────────────────────────────────────

def parse_refpage(p: Path) -> dict:
    r = ET.parse(p).getroot()

    def top(tag):
        lst = r.find(tag)
        return {e.get("name"): e for e in (lst if lst is not None else [])}

    def sub(e, key):
        al = e.find("attributelist")
        for s in (al if al is not None else []):
            if s.get("name") == key:
                return s.get("value")
        return None

    def enums(e):
        return [x.get("name") for x in e.iter("enum")]

    return {
        "name": r.get("name"),
        "digest": text_of(r.find("digest")),
        "description": text_of(r.find("description")),
        "attribute": top("attributelist"),
        "message": top("methodlist"),
        "argument": top("objarglist"),
        "inlet": {e.get("id"): e for e in r.iter("inlet")},
        "outlet": {e.get("id"): e for e in r.iter("outlet")},
        "jitter": sorted(e.get("name") for e in r.iter("jitterattribute")),
        "sub": sub,
        "enums": enums,
        "entries": {e.get("name"): e for e in r.iter("entry")},
    }


def refpage_changes(a: dict, b: dict) -> list[str]:
    out = []
    if a["name"] != b["name"]:
        out.append(f"object name in the file: `{a['name']}` → `{b['name']}`")
    for k in ("digest", "description"):
        if a[k] != b[k]:
            out.append(f"{k}: {word_diff(a[k], b[k])}")
    for kind in ("argument", "inlet", "outlet", "message", "attribute"):
        A, B = a[kind], b[kind]
        for n in sorted(set(B) - set(A), key=str):
            e = B[n]
            extra = ""
            if kind == "attribute":
                bits = [f"{k} {b['sub'](e, k)}" for k in ("default", "introduced") if b["sub"](e, k)]
                if e.get("type"):
                    bits.insert(0, f"{e.get('type')}×{e.get('size')}")
                extra = f" ({', '.join(bits)})" if bits else ""
            if kind in ("inlet", "outlet"):
                extra = f" ({e.get('type')})"
            out.append(f"**+{kind}** `{n}`{extra}: {text_of(e.find('digest'))} {text_of(e.find('description'))[:300]}".rstrip())
        for n in sorted(set(A) - set(B), key=str):
            out.append(f"**−{kind}** `{n}`: {text_of(A[n].find('digest'))}")
        for n in sorted(set(A) & set(B), key=str):
            x, y = A[n], B[n]
            if (x.get("type"), x.get("size")) != (y.get("type"), y.get("size")):
                out.append(f"~{kind} `{n}` type: {x.get('type')}×{x.get('size')} → {y.get('type')}×{y.get('size')}")
            if kind == "attribute":
                for k in ("default", "label", "style", "category", "introduced"):
                    if a["sub"](x, k) != b["sub"](y, k):
                        out.append(f"~attribute `{n}` {k}: `{a['sub'](x, k)}` → `{b['sub'](y, k)}`")
                ea, eb = a["enums"](x), b["enums"](y)
                if ea != eb:
                    out.append(f"~attribute `{n}` values: {ea} → {eb}")
            for k in ("digest", "description"):
                ta, tb = text_of(x.find(k)), text_of(y.find(k))
                if ta != tb:
                    out.append(f"~{kind} `{n}` {k}: {word_diff(ta, tb, 400)}")
    for n in sorted(set(b["jitter"]) - set(a["jitter"])):
        out.append(f"**+inherited Jitter attribute** `{n}`")
    for n in sorted(set(b["entries"]) - set(a["entries"])):
        out.append(f"**+entry** `{n}`: {text_of(b['entries'][n])[:300]}")
    return out


def refpage_section(old: Path, new: Path) -> list[str]:
    ra = {p for p in walk_files(old) if p.name.endswith(".maxref.xml")}
    rb = {p for p in walk_files(new) if p.name.endswith(".maxref.xml")}
    out = ["## Refpages", ""]
    added, removed = sorted(rb - ra), sorted(ra - rb)
    if added:
        out += ["### New refpages", ""]
        for rel in added:
            try:
                d = parse_refpage(new / rel)
            except ET.ParseError as exc:
                out.append(f"- `{rel}`: unreadable ({exc})")
                continue
            ins = [f"{k}:{v.get('type')}" for k, v in d["inlet"].items()]
            outs = [f"{k}:{v.get('type')}" for k, v in d["outlet"].items()]
            out.append(f"- **`{d['name']}`** (`{rel}`): {d['digest']}")
            out.append(f"  - {d['description'][:500]}")
            out.append(f"  - inlets {ins}; outlets {outs}")
            out.append(f"  - messages: {', '.join(map(str, d['message'])) or '—'}")
            out.append(f"  - attributes: {', '.join(map(str, d['attribute'])) or '—'}")
            if d["name"] != rel.name[:-len('.maxref.xml')]:
                out.append(f"  - note: the file names the object `{d['name']}`, not `{rel.name[:-len('.maxref.xml')]}`")
        out.append("")
    if removed:
        out += ["### Removed refpages", ""] + [f"- `{rel}`" for rel in removed] + [""]
    out += ["### Changed refpages", ""]
    quiet = []
    for rel in sorted(ra & rb):
        if filecmp.cmp(old / rel, new / rel, shallow=False):
            continue
        try:
            changes = refpage_changes(parse_refpage(old / rel), parse_refpage(new / rel))
        except ET.ParseError as exc:
            changes = [f"unreadable ({exc})"]
        if not changes:
            quiet.append(rel.name[:-len(".maxref.xml")])
            continue
        out.append(f"#### `{rel.name[:-len('.maxref.xml')]}` (`{rel.parent}`)")
        out.append("")
        out.extend(f"- {md_cell(c)}" for c in changes)
        out.append("")
    if quiet:
        out.append(f"Changed only in ways this report does not track (formatting, nested sub-attributes, see-also links): {', '.join(f'`{q}`' for q in quiet)}.")
        out.append("")
    return out


# ── help patches ─────────────────────────────────────────────────────────────

def box_texts(p: Path):
    from collections import Counter
    out = Counter()
    try:
        data = json.loads(p.read_text(errors="replace"))
    except ValueError:
        return None

    def walk(pt):
        for b in pt.get("boxes", []):
            box = b.get("box", {})
            if box.get("maxclass") in ("newobj", "message") and box.get("text"):
                out[(box["maxclass"], box["text"])] += 1
            if isinstance(box.get("patcher"), dict):
                walk(box["patcher"])
    walk(data.get("patcher", {}))
    return out, (data.get("patcher", {}).get("appversion") or {})


def help_section(old: Path, new: Path, new_version: str) -> list[str]:
    ha = {p for p in walk_files(old) if p.suffix == ".maxhelp"}
    hb = {p for p in walk_files(new) if p.suffix == ".maxhelp"}
    out = ["## Help patches", ""]
    for rel in sorted(hb - ha):
        r = box_texts(new / rel)
        av = r[1] if r else {}
        out.append(f"- **new** `{rel}` (saved by Max {av.get('major')}.{av.get('minor')}.{av.get('revision')})")
    for rel in sorted(ha - hb):
        out.append(f"- **removed** `{rel}`")
    out.append("")
    nv = tuple(int(x) for x in re.findall(r"\d+", new_version)[:3])
    newer = []
    for rel in sorted(ha & hb):
        if filecmp.cmp(old / rel, new / rel, shallow=False):
            continue
        ra, rb = box_texts(old / rel), box_texts(new / rel)
        if ra is None or rb is None:
            continue
        add, rem = rb[0] - ra[0], ra[0] - rb[0]
        if not add and not rem:
            continue
        out.append(f"`{rel}`")
        out.extend(f"- \\+ {k[0]} `{md_cell(k[1][:140])}`" for k in list(add)[:15])
        out.extend(f"- − {k[0]} `{md_cell(k[1][:140])}`" for k in list(rem)[:15])
        out.append("")
    for rel in sorted(hb):
        r = box_texts(new / rel)
        if r:
            av = r[1]
            sv = (av.get("major") or 0, av.get("minor") or 0, av.get("revision") or 0)
            if sv > nv:
                newer.append(f"`{rel}` ({sv[0]}.{sv[1]}.{sv[2]})")
    if newer:
        out.append(f"Help patches saved by a NEWER Max than {new_version}, so not evidence of what "
                   f"{new_version} does: {', '.join(newer)}.")
        out.append("")
    return out


# ── userguide ────────────────────────────────────────────────────────────────

_SKIP = re.compile(r'(href|id|src|srcSet|title|width|height|alt|className|"data-[a-z-]+"|patcher|value|language|type)\s*:\s*$')


def userguide_text(p: Path) -> str:
    try:
        c = json.loads(p.read_text())["content"]
    except (OSError, ValueError, KeyError, TypeError):
        return ""
    c = c.split("function _createMdxContent", 1)[-1]
    buf = []
    for m in re.finditer(r'"((?:[^"\\]|\\.)*)"', c):
        pre = c[max(0, m.start() - 40):m.start()]
        if _SKIP.search(pre):
            continue
        buf.append(m.group(1).replace("\\n", "\n").replace('\\"', '"'))
    text = "".join(buf)
    text = re.sub(r"@keyframes[^\n]*", "", text)        # animated figures carry random ids
    text = re.sub(r"patch-[0-9a-f-]{36}", "", text)     # embedded patch ids change on every build
    return re.sub(r"\n\s*\n+", "\n\n", text)


def userguide_section(old: Path, new: Path) -> list[str]:
    base = Path("docs/userguide/content")
    ua = {p for p in walk_files(old / base) if p.suffix == ".json"}
    ub = {p for p in walk_files(new / base) if p.suffix == ".json"}
    out = ["## Userguide", ""]
    for rel in sorted(ub - ua):
        out.append(f"- **new page** `{rel}`")
    for rel in sorted(ua - ub):
        out.append(f"- **removed page** `{rel}`")
    for rel in sorted(ua & ub):
        a, b = userguide_text(old / base / rel), userguide_text(new / base / rel)
        if a == b:
            continue
        diff = [l for l in difflib.unified_diff(a.splitlines(), b.splitlines(), lineterm="", n=0)
                if l[:1] in "+-" and not l.startswith(("+++", "---")) and l[1:].strip()]
        if not diff:
            continue
        out.append(f"### `{rel}`")
        out.append("")
        out.append("```")
        out.extend(l[:300] for l in diff[:120])
        out.append("```")
        out.append("")
    out.append("")
    return out


# ── other files ──────────────────────────────────────────────────────────────

def files_section(old_app: Path, new_app: Path) -> list[str]:
    old, new = old_app / C74, new_app / C74
    fa = {p for p in old.rglob("*") if p.is_dir() and p.suffix == ".mxo"} | set()
    fb = {p for p in new.rglob("*") if p.is_dir() and p.suffix == ".mxo"} | set()
    ea = {p.relative_to(old) for p in fa}
    eb = {p.relative_to(new) for p in fb}
    out = ["## Externals and other files", ""]
    for rel in sorted(eb - ea):
        out.append(f"- **new external** `{rel}`")
    for rel in sorted(ea - eb):
        out.append(f"- **removed external** `{rel}`")
    skip = (".maxref.xml", ".maxhelp", ".pyc")
    na = {p for p in walk_files(old) if not p.name.endswith(skip) and "node_modules" not in p.parts}
    nb = {p for p in walk_files(new) if not p.name.endswith(skip) and "node_modules" not in p.parts}
    for rel in sorted(nb - na):
        out.append(f"- new file `{rel}`")
    for rel in sorted(na - nb):
        out.append(f"- removed file `{rel}`")
    out.append("")
    return out


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("old_app", type=Path)
    ap.add_argument("new_app", type=Path)
    ap.add_argument("-o", "--output", type=Path)
    args = ap.parse_args()
    for app in (args.old_app, args.new_app):
        if not (app / C74).is_dir():
            sys.exit(f"{app} is not a Max.app bundle (no {C74})")
    va, vb = version(args.old_app), version(args.new_app)
    old, new = args.old_app / C74, args.new_app / C74
    lines = [f"# Max {va} → {vb}: what changed in the install", "",
             f"Generated by `scans/max-versions/diff_max_versions.py` from `{args.old_app}` and "
             f"`{args.new_app}`. Do not edit; the curated reading is `max_versions_insights.md`.", ""]
    lines += registry_section(old, new)
    lines += refpage_section(old, new)
    lines += help_section(old, new, vb)
    lines += userguide_section(old, new)
    lines += files_section(args.old_app, args.new_app)
    out = args.output or HERE / f"max_{va}_to_{vb}_diff.md"
    text = "\n".join(lines).rstrip() + "\n"
    out.write_text(text, encoding="utf-8")
    print(f"wrote {out} ({len(text):,} bytes)")


if __name__ == "__main__":
    main()
