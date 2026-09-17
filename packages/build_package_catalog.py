#!/usr/bin/env python3
"""
build_package_catalog.py — Build the package catalog spreadsheet.

Joins two files:
  - packages/package_objects.json  what each object is (ports, kind, use_when)
  - packages/package_catalog.json  judgments per object: function, category,
                                   usefulness 1-5, built-in it wraps, built-in
                                   alternative, superseded by, comments
and adds facts read from the machine: package author and version, whether a
compiled external runs natively on Apple Silicon, and name clashes with Max's
own objects or with another package.

Only packages installed in ~/Documents/Max 9/Packages get rows. Library
packages that are not installed are reported, not written.

Usage:
    python3 packages/build_package_catalog.py            # write packages/package_catalog.xlsx
    python3 packages/build_package_catalog.py --check    # report gaps and invalid entries only
"""

import argparse
import datetime
import json
import struct
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
LIBRARY = HERE / "package_objects.json"
CATALOG = HERE / "package_catalog.json"
OUTPUT = HERE / "package_catalog.xlsx"
USER_PACKAGES = Path.home() / "Documents" / "Max 9" / "Packages"
MAX_C74 = Path("/Applications/Max.app/Contents/Resources/C74")

CATEGORIES = [
    ("Audio I/O & mixing", "Audio in and out, gain, mixing, channel routing, sends."),
    ("Synthesis", "Oscillators, synth voices, physical and modal models, noise."),
    ("Sampling & playback", "Sample and buffer playback, loopers, recording."),
    ("Granular & concatenative", "Grain engines and corpus-based concatenation."),
    ("Effects: time & modulation", "Delay, reverb, chorus, flanger, phaser, pitch shift."),
    ("Effects: filters & EQ", "Filters and equalizers."),
    ("Effects: dynamics & distortion", "Compressors, limiters, saturation, bit crushing."),
    ("Spectral (FFT) processing", "Processing in the frequency domain."),
    ("Spatial audio & panning", "Stereo and multichannel panning, ambisonics, binaural, distance, doppler."),
    ("Audio analysis & descriptors", "Pitch, onset and envelope tracking; audio features."),
    ("Buffers & offline audio", "Non-realtime buffer work, sound files, impulse responses."),
    ("Pitch, harmony & MIDI", "MIDI handling, scales, chords, tuning."),
    ("Notation & composition", "Score and roll editors, computer-aided composition."),
    ("Rhythm, time & sequencing", "Clocks, tempo, sequencers, timing, envelopes over time."),
    ("Generative & algorithmic", "Randomness, Markov chains, cellular automata, chaos, L-systems."),
    ("Math & signal conditioning", "Arithmetic, scaling, smoothing, interpolation, easing, coordinates."),
    ("Lists, data & storage", "List manipulation, data structures, databases, text."),
    ("Machine learning & corpus analysis", "Classification, regression, clustering, dimension reduction."),
    ("Gesture, sensors & hardware", "Controllers, HID, serial, sensors, mapping devices to parameters."),
    ("Networking & communication", "OSC, web, sockets, Link, collaboration."),
    ("Video & image processing", "Jitter matrix processing, video effects, video synthesis."),
    ("OpenGL, 3D & shaders", "GPU drawing, 3D scenes, shaders."),
    ("Computer vision", "Tracking, detection, blobs, faces, optical flow."),
    ("UI & visualization", "GUI widgets, scopes, meters, displays."),
    ("Patching utilities & scripting", "Patcher scripting, presets, debugging, JS helpers."),
    ("Max for Live & DAW integration", "Live API helpers, plug-in hosting, DAW sync."),
]
CATEGORY_NAMES = [name for name, _ in CATEGORIES]

USEFULNESS = {
    5: ("Everyday", "Useful in many kinds of patches, whatever the domain."),
    4: ("Broad", "A standard tool inside a big domain (audio effects, video, MIDI)."),
    3: ("Domain", "Valuable for a specific area of work (spectral, ambisonics, notation, ML)."),
    2: ("Specialized", "A narrow technique, one variant among siblings, or a part that needs its package's other objects."),
    1: ("Niche", "Very specific use, internal helper, demo, legacy, deprecated, or replaced."),
}

JUDGMENT_FIELDS = ("function", "category", "usefulness", "wraps_builtin",
                   "builtin_alternative", "superseded_by", "comments")

SOURCE_LABELS = {"refpage": "refpage", "helpfile": "help file", "abstraction": "abstraction patch"}

CPU_X86_64 = 0x01000007
CPU_ARM64 = 0x0100000C


def macho_archs(data):
    """CPU architectures in a Mach-O binary, from its header bytes."""
    if len(data) < 8:
        return set()
    magic_be = struct.unpack(">I", data[:4])[0]
    if magic_be in (0xCAFEBABE, 0xCAFEBABF):
        count = struct.unpack(">I", data[4:8])[0]
        size = 20 if magic_be == 0xCAFEBABE else 32
        archs = set()
        for i in range(count):
            off = 8 + i * size
            if len(data) < off + 4:
                break
            archs.add(struct.unpack(">I", data[off:off + 4])[0])
        return archs
    magic_le = struct.unpack("<I", data[:4])[0]
    if magic_le in (0xFEEDFACF, 0xFEEDFACE):
        return {struct.unpack("<I", data[4:8])[0]}
    return set()


def mxo_bundles(package_dir):
    """{object name: .mxo bundle path} for every compiled macOS external in a package."""
    index = {}
    for bundle in sorted(package_dir.rglob("*.mxo")):
        if bundle.is_dir():
            index.setdefault(bundle.stem, bundle)
    return index


def apple_silicon(bundle):
    """'Yes', 'No (Intel only)', 'unknown', or '' when there is no .mxo bundle."""
    if bundle is None:
        return ""
    macos = bundle / "Contents" / "MacOS"
    binaries = sorted(macos.iterdir()) if macos.is_dir() else []
    if not binaries:
        return "unknown"
    with binaries[0].open("rb") as f:
        archs = macho_archs(f.read(4096))
    if CPU_ARM64 in archs:
        return "Yes"
    if CPU_X86_64 in archs:
        return "No (Intel only)"
    return "unknown"


def max_object_names(c74=MAX_C74):
    """Every object name and alias in Max's own registries, core and bundled."""
    names = set()
    for path in [c74 / "interfaces" / "obj-qlookup.json",
                 *sorted((c74 / "packages").glob("*/interfaces/obj-qlookup.json"))]:
        try:
            data = json.loads(path.read_text())
        except (OSError, json.JSONDecodeError):
            continue
        for key, entry in data.items():
            names.add(key)
            if isinstance(entry, dict) and entry.get("alias"):
                names.add(entry["alias"])
    return names


def name_clashes(objects_by_package, builtin_names):
    """{(package, object): text} for names shared with Max or with another installed package.

    Compared without regard to case: Max on macOS finds an abstraction file
    whatever the case of the name typed in the box."""
    builtin = {}
    for name in builtin_names:
        builtin.setdefault(name.lower(), name)
    owners = {}
    for pkg, names in objects_by_package.items():
        for name in names:
            owners.setdefault(name.lower(), []).append((pkg, name))
    clashes = {}
    for key, entries in owners.items():
        for pkg, name in entries:
            parts = []
            if key in builtin:
                parts.append(f"same name as built-in {builtin[key]}")
            others = [f"{n} in {p}" for p, n in entries if p != pkg]
            if others:
                parts.append("also " + ", ".join(others))
            if parts:
                clashes[(pkg, name)] = "; ".join(parts)
    return clashes


def package_info(package_dir):
    try:
        info = json.loads((package_dir / "package-info.json").read_text(errors="replace"), strict=False)
    except (OSError, json.JSONDecodeError):
        return {}
    return info if isinstance(info, dict) else {}


def validate_entry(entry):
    """Problems with one catalog entry, as strings. Empty list means valid."""
    problems = []
    missing = [f for f in JUDGMENT_FIELDS if f not in entry]
    if missing:
        problems.append("missing " + ", ".join(missing))
    if entry.get("category") not in CATEGORY_NAMES:
        problems.append(f"unknown category {entry.get('category')!r}")
    if entry.get("usefulness") not in USEFULNESS:
        problems.append(f"usefulness {entry.get('usefulness')!r} is not 1-5")
    return problems


def check(library, catalog, installed):
    problems = []
    for pkg in sorted(installed):
        for name in sorted(library.get(pkg, {})):
            entry = catalog.get(pkg, {}).get(name)
            if entry is None:
                problems.append(f"{pkg} / {name}: no catalog entry")
            else:
                problems.extend(f"{pkg} / {name}: {p}" for p in validate_entry(entry))
    for pkg, entries in catalog.items():
        for name in entries:
            if name not in library.get(pkg, {}):
                problems.append(f"{pkg} / {name}: catalog entry for an object not in the library")
    return problems


def build_rows(library, catalog, installed):
    builtin = max_object_names()
    clashes = name_clashes({p: list(library[p]) for p in installed}, builtin)
    rows = []
    for pkg in sorted(installed, key=str.lower):
        bundles = mxo_bundles(USER_PACKAGES / pkg)
        for name in sorted(library[pkg], key=str.lower):
            rec = library[pkg][name]
            j = catalog.get(pkg, {}).get(name, {})
            level = USEFULNESS.get(j.get("usefulness"), ("", ""))[0]
            unknown_ports = not rec["numinlets"] and not rec["numoutlets"]
            superseded = j.get("superseded_by") or rec.get("deprecated_by", "")
            rows.append([
                name, pkg, j.get("function", ""), j.get("category", ""),
                j.get("usefulness"), level, rec["kind"],
                None if unknown_ports else rec["numinlets"],
                None if unknown_ports else rec["numoutlets"],
                j.get("wraps_builtin", ""), j.get("builtin_alternative", ""),
                superseded, apple_silicon(bundles.get(name)),
                clashes.get((pkg, name), ""), rec["use_when"],
                SOURCE_LABELS.get(rec["source"], rec["source"]), j.get("comments", ""),
            ])
    return rows


COLUMNS = [
    ("Object", 26, "The name you type in an object box."),
    ("Package", 22, "The package folder in ~/Documents/Max 9/Packages."),
    ("General function", 44, "What it does, in one plain sentence."),
    ("Category", 26, "One primary category; see the Categories sheet."),
    ("Usefulness (1-5)", 11, "5 = everyday patching, 1 = highly specific use. See the Usefulness sheet."),
    ("Usefulness level", 12, "The name of the usefulness rating."),
    ("Kind", 12, "external (compiled), abstraction (a Max patch), or javascript."),
    ("Inlets", 7, "Inlet count. Blank when unknown (for instance ports built by a script)."),
    ("Outlets", 7, "Outlet count. Blank when unknown."),
    ("Wraps built-in", 24, "The built-in Max object(s) doing the real work, when this is essentially a wrapper or front panel for them. Built-in includes Max's bundled packages."),
    ("Built-in alternative", 34, "A built-in Max object that does the same or a similar job, and how it differs."),
    ("Superseded by", 20, "A newer object that replaces this one."),
    ("Apple Silicon native", 13, "For compiled externals: Yes, or No (Intel only, needs Rosetta). Blank for patches and scripts."),
    ("Name clash", 24, "Shares its name with a built-in Max object or an object in another installed package. Max loads whichever it finds first."),
    ("use_when", 60, "The curated guidance from packages/package_objects.json: when to reach for it and how to drive it."),
    ("Doc source", 12, "Where the object's documentation came from: refpage, help file, or the abstraction patch itself."),
    ("Comments", 44, "Gotchas, required companions, platform limits, anything else that changes a decision."),
]

LEVEL_FILLS = {5: "C6EFCE", 4: "DDEBF7", 3: "FFF2CC", 2: "F2F2F2", 1: "E7E6E6"}


def write_workbook(rows, library, catalog, installed, path):
    from openpyxl import Workbook
    from openpyxl.styles import Alignment, Font, PatternFill
    from openpyxl.utils import get_column_letter

    font = Font(name="Arial", size=10)
    bold = Font(name="Arial", size=10, bold=True)
    header_fill = PatternFill("solid", fgColor="D9E1F2")
    top = Alignment(vertical="top")
    wrap = Alignment(vertical="top", wrap_text=True)

    def header(ws, names_widths):
        for col, (name, width) in enumerate(names_widths, 1):
            cell = ws.cell(row=1, column=col, value=name)
            cell.font, cell.fill, cell.alignment = bold, header_fill, wrap
            ws.column_dimensions[get_column_letter(col)].width = width
        ws.freeze_panes = "B2"

    wb = Workbook()
    ws = wb.active
    ws.title = "Objects"
    header(ws, [(n, w) for n, w, _ in COLUMNS])
    wrapped = {"General function", "Wraps built-in", "Built-in alternative", "Name clash", "use_when", "Comments"}
    for r, row in enumerate(rows, 2):
        for c, value in enumerate(row, 1):
            cell = ws.cell(row=r, column=c, value=value if value != "" else None)
            cell.font = font
            cell.alignment = wrap if COLUMNS[c - 1][0] in wrapped else top
        if row[4] in LEVEL_FILLS:
            fill = PatternFill("solid", fgColor=LEVEL_FILLS[row[4]])
            ws.cell(row=r, column=5).fill = fill
            ws.cell(row=r, column=6).fill = fill
    ws.auto_filter.ref = f"A1:{get_column_letter(len(COLUMNS))}{len(rows) + 1}"

    counted = f"Counted by packages/build_package_catalog.py on {datetime.date.today().isoformat()}."

    wp = wb.create_sheet("Packages")
    header(wp, [("Package", 30), ("Author", 28), ("Version", 10), ("Objects", 9),
                ("Main category", 28), ("Everyday or broad (4-5)", 12), ("Description", 80)])
    for r, pkg in enumerate(sorted(installed, key=str.lower), 2):
        info = package_info(USER_PACKAGES / pkg)
        pkg_rows = [row for row in rows if row[1] == pkg]
        cats = [row[3] for row in pkg_rows if row[3]]
        main = max(sorted(set(cats), key=CATEGORY_NAMES.index), key=cats.count) if cats else ""
        text = lambda v: ", ".join(map(str, v)) if isinstance(v, list) else str(v or "")
        values = [pkg, text(info.get("author")), text(info.get("version")), len(pkg_rows), main,
                  sum(1 for row in pkg_rows if (row[4] or 0) >= 4), text(info.get("description"))]
        for c, value in enumerate(values, 1):
            cell = wp.cell(row=r, column=c, value=value if value != "" else None)
            cell.font, cell.alignment = font, wrap
    wp.cell(row=len(installed) + 3, column=1, value=counted).font = font

    wc = wb.create_sheet("Categories")
    header(wc, [("Category", 34), ("What belongs here", 70), ("Objects", 9)])
    for r, (name, desc) in enumerate(CATEGORIES, 2):
        for c, value in enumerate([name, desc, sum(1 for row in rows if row[3] == name)], 1):
            cell = wc.cell(row=r, column=c, value=value)
            cell.font, cell.alignment = font, wrap
    wc.cell(row=len(CATEGORIES) + 3, column=1, value=counted).font = font

    wu = wb.create_sheet("Usefulness")
    header(wu, [("Rating", 8), ("Level", 14), ("Meaning", 80), ("Objects", 9)])
    for r, rating in enumerate(sorted(USEFULNESS, reverse=True), 2):
        level, meaning = USEFULNESS[rating]
        for c, value in enumerate([rating, level, meaning, sum(1 for row in rows if row[4] == rating)], 1):
            cell = wu.cell(row=r, column=c, value=value)
            cell.font, cell.alignment = font, wrap
        wu.cell(row=r, column=1).fill = PatternFill("solid", fgColor=LEVEL_FILLS[rating])
    wu.cell(row=8, column=1, value="Ratings compare each object with what Max already does: "
            "an object a built-in does just as easily is rated lower.").font = font
    wu.cell(row=9, column=1, value=counted).font = font

    wd = wb.create_sheet("Columns")
    header(wd, [("Column", 24), ("Meaning", 100)])
    for r, (name, _, meaning) in enumerate(COLUMNS, 2):
        for c, value in enumerate([name, meaning], 1):
            cell = wd.cell(row=r, column=c, value=value)
            cell.font, cell.alignment = font, wrap
    wd.cell(row=len(COLUMNS) + 3, column=1,
            value="Sources: packages/package_objects.json and packages/package_catalog.json in the "
                  "Claude2Max repo. Rebuild with python3 packages/build_package_catalog.py.").font = font

    wb.save(path)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--check", action="store_true", help="report problems without writing")
    p.add_argument("-o", "--output", default=str(OUTPUT))
    args = p.parse_args()

    library = json.loads(LIBRARY.read_text())
    catalog = json.loads(CATALOG.read_text()) if CATALOG.exists() else {}
    if not USER_PACKAGES.is_dir():
        sys.exit(f"Packages folder not found: {USER_PACKAGES}")
    present = {d.name for d in USER_PACKAGES.iterdir() if d.is_dir()}
    installed = sorted(p for p in library if p in present)
    absent = sorted(p for p in library if p not in present)
    if absent:
        print(f"In the library but not installed, left out: {', '.join(absent)}", file=sys.stderr)

    problems = check(library, catalog, installed)
    for line in problems:
        print(line, file=sys.stderr)
    print(f"{len(problems)} problem(s) across {len(installed)} installed packages", file=sys.stderr)
    if args.check:
        sys.exit(1 if problems else 0)

    rows = build_rows(library, catalog, installed)
    write_workbook(rows, library, catalog, installed, args.output)
    print(f"Wrote {len(rows)} objects to {args.output}", file=sys.stderr)


if __name__ == "__main__":
    main()
