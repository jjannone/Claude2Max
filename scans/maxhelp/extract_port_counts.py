#!/usr/bin/env python3
"""
extract_port_counts.py — which Max objects have fixed port counts, which vary.

Reads every patch Max itself saved (core help, bundled packages, user packages)
and records, per object class, the inlet and outlet counts on each saved box.
Writes `maxhelp_port_counts.json`:

  fixed     — every saved box agrees, across at least two different positional
              argument lists and three boxes. Arguments do not change the ports,
              so the converter uses these counts without looking further.
  flexible  — saved boxes disagree. The ports depend on context (arguments,
              attributes, contents). For object boxes the file keeps each
              argument list whose boxes all agree, so an exact match can be
              read back; every other case falls to the converter's own rules.
  unmarked  — too little evidence to say. `sync` adds evidence from patches
              Max saved, which can later move a class to fixed or flexible.

A file counts as evidence when Max saved it (its JSON is not indented by two
spaces, which is how spec2maxpat writes) and it was saved by the same major
version of Max as the one installed. Older versions saved some objects
differently: Max 7 gave `route a b c` one inlet, Max 9 gives it four.

Usage:
    python3 scans/maxhelp/extract_port_counts.py            # write the file
    python3 scans/maxhelp/extract_port_counts.py --summary  # print counts only
"""
from __future__ import annotations

import argparse
import json
import os
import sys
from collections import Counter, defaultdict
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parent.parent
sys.path.insert(0, str(REPO))
import spec2maxpat as s  # noqa: E402

OUT = HERE / "maxhelp_port_counts.json"
ROOTS = [
    Path("/Applications/Max.app/Contents/Resources/C74/help"),
    Path("/Applications/Max.app/Contents/Resources/C74/packages"),
    Path(os.path.expanduser("~/Documents/Max 9/Packages")),
]


def harvest():
    ev = defaultdict(lambda: {"ui": False, "keys": defaultdict(Counter),
                              "texts": defaultdict(Counter), "types": Counter()})
    stats = Counter()
    for root in ROOTS:
        if not root.is_dir():
            continue
        for f in root.rglob("*"):
            if f.suffix not in (".maxhelp", ".maxpat", ".amxd"):
                continue
            try:
                data, raw = s.read_patch_file(str(f))
            except Exception:
                stats["unreadable"] += 1
                continue
            if not s.counts_as_port_evidence(data, raw):
                stats["not-evidence"] += 1   # not saved by Max, or by another Max version
                continue
            stats["files"] += 1
            for box in s.iter_boxes(data.get("patcher", {}), max_only=True):
                obs = s.port_observation(box, source=str(f))
                if obs is None:
                    continue
                cls, args_key, text_key, counts, types, ui = obs
                e = ev[cls]
                e["ui"] = ui
                e["keys"][args_key][counts] += 1
                e["texts"][text_key][counts] += 1
                e["types"][(counts, tuple(types))] += 1
    return ev, stats


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--summary", action="store_true")
    args = ap.parse_args()
    ev, stats = harvest()
    reg = s.PortCounts.from_evidence(ev)
    print(f"{stats['files']:,} files saved by Max {s.installed_max_major()} "
          f"({stats['not-evidence']:,} skipped, {stats['unreadable']} unreadable); "
          f"{len(reg.data['objects']):,} classes: " +
          ", ".join(f"{n} {k}" for k, n in sorted(Counter(o['kind'] for o in reg.data['objects'].values()).items())))
    if not args.summary:
        reg.save(OUT)
        print(f"wrote {OUT.relative_to(REPO)} ({OUT.stat().st_size:,} bytes)")


if __name__ == "__main__":
    main()
