#!/usr/bin/env python3
"""
Enumerate the ELSE library, the cyclone library and the Live Electronics
Tutorial as they ship inside a plugdata install, and keep the crawl state file.

Everything is local. plugdata copies its documentation into the user's
Documents folder on first launch, so there is nothing to fetch. Six folders are
listed, each with its own group name in the state file:

    Documentation/9.else                         group "else"
    Documentation/10.cyclone                     group "cyclone"
    Documentation/12.live-electronics-tutorial   group "live-electronics-tutorial"
    Extra/else                                   group "else-extra"
    Abstractions/else                            group "else-abstractions"
    Abstractions/cyclone                         group "cyclone-abstractions"

Help files are `.pd` text files. Their documentation is the `#X text` comment
lines plus the objects and arguments they demonstrate.

Usage:
    python3 scans/plugdata-else/enumerate_plugdata_else.py               # enumerate + merge
    python3 scans/plugdata-else/enumerate_plugdata_else.py /path/to/plugdata
    PLUGDATA_HOME=/path/to/plugdata python3 scans/plugdata-else/enumerate_plugdata_else.py
    python3 scans/plugdata-else/enumerate_plugdata_else.py --status      # counts only
    python3 scans/plugdata-else/enumerate_plugdata_else.py --text FILE.pd  # print one file's comment text

The plugdata folder is taken from the first positional argument, then from the
PLUGDATA_HOME environment variable, then defaults to ~/Documents/plugdata.

State file (plugdata_else_crawl_state.json), keyed by path relative to the
plugdata folder:
    {"title", "url" (the same relative path), "group",
     "status": "pending"|"extracted"|"skipped",
     "session": "YYYY-MM-DD" | null, "notes", "listed": true|false}

Merging never touches "status", "session" or "notes" of an entry already in
the file. A path that was in the file and is no longer on disk is kept and gets
"listed": false, so the disappearance is visible.

A file that is not text (audio, image, PDF, MIDI, SoundFont) is given the
status "skipped" with the reason the first time it is listed. That is the only
status this script ever sets by itself.

If the plugdata folder, or any of the six source folders, is missing, the
script prints the cause and exits non-zero WITHOUT writing the state file. An
empty or shrunken list is never written in place of a missing folder.

Stdlib only; runs on Python 3.9.
"""
from __future__ import annotations

import argparse
import json
import os
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
STATE_FILE = HERE / "plugdata_else_crawl_state.json"

DEFAULT_HOME = "~/Documents/plugdata"

# (folder relative to the plugdata home, group name)
SOURCES = [
    ("Documentation/9.else", "else"),
    ("Documentation/10.cyclone", "cyclone"),
    ("Documentation/12.live-electronics-tutorial", "live-electronics-tutorial"),
    ("Extra/else", "else-extra"),
    ("Abstractions/else", "else-abstractions"),
    ("Abstractions/cyclone", "cyclone-abstractions"),
]

# Extensions that hold no readable documentation. Compared in lower case,
# because the tutorial ships both ".wav" and ".WAV".
MEDIA_EXT = {
    ".wav": "audio file",
    ".aif": "audio file",
    ".aiff": "audio file",
    ".flac": "audio file",
    ".mp3": "audio file",
    ".mid": "MIDI file",
    ".gif": "image",
    ".png": "image",
    ".ppm": "image",
    ".sf2": "SoundFont",
    ".brn": "preset data for the brane.m~ module",
}

SKIP_NAMES = {".DS_Store"}


class EnumerationError(Exception):
    pass


def plugdata_home(arg):
    raw = arg or os.environ.get("PLUGDATA_HOME") or DEFAULT_HOME
    return Path(raw).expanduser()


def title_for(rel: Path, group: str) -> str:
    """A readable title. Help files are titled by the object they document."""
    name = rel.name
    if name.endswith("-help.pd"):
        return name[: -len("-help.pd")] + " (help file)"
    if group == "live-electronics-tutorial":
        # Keep the chapter folder, which is what orders the tutorial.
        parts = rel.parts[2:]  # drop Documentation/12.live-electronics-tutorial
        return " / ".join(parts)
    if group.endswith("abstractions") and name.endswith(".pd"):
        return name[:-3] + " (abstraction source)"
    return name


def enumerate_sources(home: Path) -> dict:
    """Return {relative path: entry} for every file under the six folders."""
    if not home.is_dir():
        raise EnumerationError(f"plugdata folder not found: {home}")
    missing = [folder for folder, _ in SOURCES if not (home / folder).is_dir()]
    if missing:
        raise EnumerationError(
            "source folder(s) missing under " + str(home) + ": " + ", ".join(missing)
        )
    found = {}
    for folder, group in SOURCES:
        base = home / folder
        count = 0
        for path in sorted(base.rglob("*")):
            if not path.is_file() or path.name in SKIP_NAMES:
                continue
            rel = path.relative_to(home)
            key = rel.as_posix()
            entry = {
                "title": title_for(rel, group),
                "url": key,
                "group": group,
                "status": "pending",
                "session": None,
                "notes": "",
                "listed": True,
            }
            ext = path.suffix.lower()
            if ext in MEDIA_EXT or path.is_dir():
                entry["status"] = "skipped"
                entry["notes"] = MEDIA_EXT.get(ext, "not text") + ", not documentation"
            found[key] = entry
            count += 1
        if count == 0:
            raise EnumerationError(f"no files found in {base}; refusing to write an empty list")
    return found


def load_state() -> dict:
    if not STATE_FILE.exists():
        return {}
    with STATE_FILE.open(encoding="utf-8") as fh:
        data = json.load(fh)
    if not isinstance(data, dict):
        raise EnumerationError(f"{STATE_FILE.name} is not a JSON object")
    return data


def merge(old: dict, new: dict) -> tuple:
    """Merge a fresh listing into the old state. Returns (state, added, gone)."""
    merged = {}
    added = []
    for key, entry in new.items():
        if key in old:
            kept = dict(old[key])
            # Refresh what the listing owns; keep what a reader wrote.
            kept["title"] = entry["title"]
            kept["url"] = entry["url"]
            kept["group"] = entry["group"]
            kept["listed"] = True
            for field in ("status", "session", "notes"):
                kept.setdefault(field, entry[field])
            merged[key] = kept
        else:
            merged[key] = entry
            added.append(key)
    gone = []
    for key, entry in old.items():
        if key not in new:
            kept = dict(entry)
            kept["listed"] = False
            merged[key] = kept
            gone.append(key)
    return merged, added, gone


def counts(state: dict) -> dict:
    table = {}
    for entry in state.values():
        row = table.setdefault(entry.get("group", "?"), {"listed": 0, "extracted": 0, "pending": 0, "skipped": 0})
        row["listed"] += 1
        status = entry.get("status", "pending")
        row[status] = row.get(status, 0) + 1
    return table


def print_counts(state: dict) -> None:
    table = counts(state)
    total = {"listed": 0, "extracted": 0, "pending": 0, "skipped": 0}
    print(f"{'group':30} {'listed':>7} {'extracted':>10} {'pending':>8} {'skipped':>8}")
    for group in sorted(table):
        row = table[group]
        print(f"{group:30} {row['listed']:>7} {row['extracted']:>10} {row['pending']:>8} {row['skipped']:>8}")
        for field in total:
            total[field] += row.get(field, 0)
    print(f"{'TOTAL':30} {total['listed']:>7} {total['extracted']:>10} {total['pending']:>8} {total['skipped']:>8}")


# ---------------------------------------------------------------------------
# Reading one .pd file: the comment text and the object boxes
# ---------------------------------------------------------------------------

RECORD_END = re.compile(r"(?<!\\);\s*\n")
WIDTH_SUFFIX = re.compile(r",\s*f \d+\s*$")


def clean_atoms(text: str) -> str:
    """Undo Pd's escaping and drop the ', f <width>' suffix a box may carry."""
    text = WIDTH_SUFFIX.sub("", text)
    text = text.replace("\\,", ",").replace("\\;", ";").replace("\\$", "$")
    text = text.replace(" ,", ",").replace(" ;", ";")
    return re.sub(r"\s+", " ", text).strip()


def pd_text(path: Path) -> dict:
    """
    Return {"comments": [...], "subpatches": [...], "boxes": [...]} for a .pd
    file. Comments inside a subpatch are prefixed with the subpatch nesting
    depth as leading spaces, and each subpatch ends with a "<<pd name>>" line,
    so the reader can tell which example a comment belongs to.
    """
    raw = path.read_text(encoding="utf-8", errors="replace")
    comments, boxes, seen = [], [], set()
    depth = 0
    for record in RECORD_END.split(raw):
        record = record.strip()
        if record.startswith("#N canvas"):
            depth += 1
            continue
        match = re.match(r"#X restore \S+ \S+ (.*)", record, re.S)
        if match:
            depth -= 1
            comments.append("  " * max(depth - 1, 0) + "<<" + clean_atoms(match.group(1)) + ">>")
            continue
        match = re.match(r"#X text \S+ \S+ (.*)", record, re.S)
        if match:
            text = clean_atoms(match.group(1))
            if text and text not in seen:
                seen.add(text)
                comments.append("  " * max(depth - 1, 0) + text)
            continue
        match = re.match(r"#X (obj|msg) \S+ \S+ ?(.*)", record, re.S)
        if match:
            text = clean_atoms(match.group(2))
            if not text:
                continue
            box = "[" + text + "]" if match.group(1) == "obj" else "(" + text + ")"
            if box not in boxes:
                boxes.append(box)
    return {"comments": comments, "boxes": boxes}


def print_pd_text(path: Path) -> None:
    data = pd_text(path)
    print("=====", path.name)
    for line in data["comments"]:
        print(line)
    print("BOXES:", " ".join(data["boxes"]))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__.split("\n\n")[0].strip())
    parser.add_argument("home", nargs="?", help="plugdata folder (default: $PLUGDATA_HOME or ~/Documents/plugdata)")
    parser.add_argument("--status", action="store_true", help="print counts from the state file and exit")
    parser.add_argument("--text", metavar="FILE", help="print the comment text and boxes of one .pd file and exit")
    args = parser.parse_args()

    if args.text:
        path = Path(args.text).expanduser()
        if not path.is_file():
            print(f"error: no such file: {path}", file=sys.stderr)
            return 2
        print_pd_text(path)
        return 0

    if args.status:
        try:
            state = load_state()
        except (EnumerationError, OSError, json.JSONDecodeError) as exc:
            print(f"error: cannot read state file: {type(exc).__name__}: {exc}", file=sys.stderr)
            return 2
        if not state:
            print(f"error: {STATE_FILE.name} is absent or empty; run the enumeration first", file=sys.stderr)
            return 2
        print_counts(state)
        return 0

    home = plugdata_home(args.home)
    try:
        listing = enumerate_sources(home)
        old = load_state()
    except (EnumerationError, OSError, json.JSONDecodeError) as exc:
        print(f"error: {type(exc).__name__}: {exc}", file=sys.stderr)
        print("state file NOT written", file=sys.stderr)
        return 2

    state, added, gone = merge(old, listing)
    ordered = {key: state[key] for key in sorted(state)}
    tmp = STATE_FILE.with_suffix(".json.tmp")
    with tmp.open("w", encoding="utf-8") as fh:
        json.dump(ordered, fh, indent=1, ensure_ascii=False, sort_keys=True)
        fh.write("\n")
    tmp.replace(STATE_FILE)

    print(f"plugdata folder: {home}")
    print(f"listed {len(listing)} files; {len(added)} new, {len(gone)} no longer on disk")
    print_counts(ordered)
    return 0


if __name__ == "__main__":
    sys.exit(main())
