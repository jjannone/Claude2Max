#!/usr/bin/env python3
"""Build the list of what other tools do that Max does not, does less well, or does differently.

    python3 scans/max-gaps/build_max_gaps.py            # import new candidates, render
    python3 scans/max-gaps/build_max_gaps.py --check    # report only, write nothing

`max_gaps.json` is the list itself and the file to edit by hand. Each entry
starts as a candidate from one of the per-tool scans
(`scans/<tool>/<tool>_max_gap_candidates.json`). This script adds candidates
that are not in the list yet and never overwrites an entry that is already
there, so review notes and corrected statuses survive a re-run. It then
renders `max_gaps.md` from the list.

Fields a reviewer changes: `max_status`, `max_closest`, `installable`,
`theme`, `review` and `review_notes`. `installable` lists third-party Max
packages, not bundled with Max, that cover the entry: each item is
{package, object, url, how_checked}. `theme` groups entries from different tools that describe
the same capability; give two entries the same theme text to group them.
`review` is one of:

    unreviewed  as the scan wrote it; the Max side has had one quick check
    confirmed   someone checked the Max side and the entry stands
    rejected    Max does this as well or better; kept so it is not re-added
"""
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).parent
SCANS = HERE.parent
LIST_FILE = HERE / "max_gaps.json"
MD_FILE = HERE / "max_gaps.md"

# scan folder -> candidates file
SOURCES = {
    "touchdesigner": "touchdesigner_max_gap_candidates.json",
    "madmapper": "madmapper_max_gap_candidates.json",
    "isadora": "isadora_max_gap_candidates.json",
    "cables-gl": "cables_gl_max_gap_candidates.json",
    "plugdata": "plugdata_max_gap_candidates.json",
    "plugdata-else": "plugdata_else_max_gap_candidates.json",
    "plugdata-gem": "plugdata_gem_max_gap_candidates.json",
    "ossia-score": "ossia_score_max_gap_candidates.json",
    "qlab": "qlab_max_gap_candidates.json",
    "vezer": "vezer_max_gap_candidates.json",
    "resolume": "resolume_max_gap_candidates.json",
}

# absent / partial: Max lacks it, or has part of it.
# better-elsewhere / different-approach: both have it; the other tool's way is
# better, or just different in a way worth knowing. These carry `advice`.
STATUS_ORDER = ["absent", "partial", "better-elsewhere", "different-approach", "unsure"]
STATUS_LABEL = {
    "absent": "Not in Max",
    "partial": "Partly in Max",
    "better-elsewhere": "In Max, better elsewhere",
    "different-approach": "In both, done differently",
    "unsure": "Unsure",
}
REVIEWS = ("unreviewed", "confirmed", "rejected")


def slug(text):
    return re.sub(r"[^a-z0-9]+", "-", str(text).lower()).strip("-")


def as_list(value):
    """A field a scan may have written as a string, a list or nothing."""
    if value is None or value == "":
        return []
    if isinstance(value, (list, tuple)):
        return [str(v) for v in value]
    return [str(value)]


def load_candidates():
    """Every candidate from every scan, with the problems met on the way."""
    found, problems = [], []
    for folder, filename in SOURCES.items():
        path = SCANS / folder / filename
        if not path.exists():
            problems.append(f"{folder}: no candidates file ({filename})")
            continue
        try:
            items = json.loads(path.read_text(encoding="utf-8"))
        except ValueError as err:
            problems.append(f"{folder}: {filename} is not valid JSON ({err})")
            continue
        if not isinstance(items, list):
            problems.append(f"{folder}: {filename} holds a {type(items).__name__}, not a list")
            continue
        for item in items:
            if not isinstance(item, dict) or not item.get("capability"):
                problems.append(f"{folder}: skipped an item with no capability")
                continue
            found.append((folder, item))
    return found, problems


def to_entry(folder, item):
    status = item.get("max_status", "unsure")
    if status not in STATUS_ORDER:
        status = "unsure"
    return {
        "id": f"{folder}--{slug(item['capability'])}",
        "capability": item["capability"],
        "category": item.get("category", "uncategorized"),
        "tool": item.get("tool", folder),
        "tool_names": as_list(item.get("tool_names")),
        "what_it_does": item.get("what_it_does", ""),
        "source_urls": as_list(item.get("source_urls")),
        "max_status": status,
        "max_closest": as_list(item.get("max_closest")),
        "max_check": item.get("max_check", ""),
        "confidence": item.get("confidence", "low"),
        "advice": item.get("advice", ""),
        "notes": item.get("notes", ""),
        "theme": "",
        "review": "unreviewed",
        "review_notes": "",
    }


def cell(text):
    return str(text).replace("|", "\\|").replace("\n", " ").strip()


def render(entries):
    live = [e for e in entries if e.get("review") != "rejected"]
    rejected = [e for e in entries if e.get("review") == "rejected"]
    out = [
        "# What Other Tools Do That Max Does Not, Does Less Well, or Does Differently",
        "",
        "Generated by `build_max_gaps.py` from `max_gaps.json`. Edit the JSON, not this file.",
        "",
        "Each row began as a candidate from a documentation scan of MadMapper,",
        "TouchDesigner, Isadora, cables.gl, plugdata, ossia score, QLab, Vezér or Resolume. **Unreviewed** rows have had one quick",
        "check against Max's object list, refpages and the installed packages, by an",
        "agent that does not know Max well. Treat them as leads, not findings.",
        "",
        f"{len(live)} entries, {sum(1 for e in live if e.get('review') == 'confirmed')} confirmed, "
        f"{len(rejected)} rejected.",
        "",
    ]
    counts = {}
    for e in live:
        counts.setdefault(e["category"], {}).setdefault(e["max_status"], 0)
        counts[e["category"]][e["max_status"]] += 1
    out += ["| Category | " + " | ".join(STATUS_LABEL[s] for s in STATUS_ORDER) + " |",
            "|---|" + "---|" * len(STATUS_ORDER)]
    for category in sorted(counts):
        out.append(f"| {category} | " + " | ".join(
            str(counts[category].get(s, 0)) for s in STATUS_ORDER) + " |")
    out.append("")

    themes = {}
    for e in live:
        if e.get("theme"):
            themes.setdefault(e["theme"], []).append(e)
    if themes:
        out += ["## Themes", "",
                "Entries from different tools that describe the same capability. A theme",
                "more than one tool documents is a stronger lead than a single entry.", "",
                "| Theme | Tools | Entries | " + " | ".join(STATUS_LABEL[s] for s in STATUS_ORDER) + " |",
                "|---|---|---|" + "---|" * len(STATUS_ORDER)]
        order = sorted(themes, key=lambda t: (-len({e["tool"] for e in themes[t]}),
                                              -len(themes[t]), t))
        for theme in order:
            rows = themes[theme]
            tools = ", ".join(sorted({e["tool"] for e in rows}))
            by_status = [str(sum(1 for e in rows if e["max_status"] == s)) for s in STATUS_ORDER]
            out.append(f"| {cell(theme)} | {tools} | {len(rows)} | " + " | ".join(by_status) + " |")
        out.append("")

    for category in sorted(counts):
        out += [f"## {category}", ""]
        rows = [e for e in live if e["category"] == category]
        rows.sort(key=lambda e: (STATUS_ORDER.index(e["max_status"]), e["tool"], e["capability"]))
        for e in rows:
            out.append(f"### {e['capability']} ({e['tool']})")
            out.append("")
            out.append(f"- **Max:** {STATUS_LABEL[e['max_status']]}"
                       f" · confidence {e['confidence']} · {e['review']}")
            if e.get("theme"):
                out.append(f"- **Theme:** {cell(e['theme'])}")
            if e["tool_names"]:
                out.append("- **There:** " + ", ".join(f"`{n}`" for n in e["tool_names"]))
            if e["what_it_does"]:
                out.append(f"- **What it does:** {cell(e['what_it_does'])}")
            if e["max_closest"]:
                out.append("- **Closest in Max:** " + ", ".join(f"`{n}`" for n in e["max_closest"]))
            if e.get("installable"):
                out.append("- **Third-party:** " + " · ".join(
                    f"{i['package']} `{i['object']}` <{i['url']}>" if i.get("url")
                    else f"{i['package']} `{i['object']}`" for i in e["installable"]))
            if e["max_check"]:
                out.append(f"- **Checked:** {cell(e['max_check'])}")
            if e.get("advice"):
                out.append(f"- **Advice for Max:** {cell(e['advice'])}")
            if e["notes"]:
                out.append(f"- **Notes:** {cell(e['notes'])}")
            if e.get("review_notes"):
                out.append(f"- **Review:** {cell(e['review_notes'])}")
            if e["source_urls"]:
                out.append("- **Source:** " + " · ".join(f"<{u}>" for u in e["source_urls"]))
            out.append(f"- id: `{e['id']}`")
            out.append("")

    if rejected:
        out += ["## Rejected", "",
                "Max does these as well or better. Kept so a re-run does not add them back.", ""]
        for e in sorted(rejected, key=lambda e: e["id"]):
            out.append(f"- **{e['capability']}** ({e['tool']}): {cell(e.get('review_notes', ''))}")
        out.append("")
    return "\n".join(out)


def main():
    check_only = "--check" in sys.argv[1:]
    entries = json.loads(LIST_FILE.read_text(encoding="utf-8")) if LIST_FILE.exists() else []
    # Entries written before a field existed get it empty, so every entry has every field.
    for e in entries:
        for field in ("advice", "notes", "theme", "review_notes"):
            e.setdefault(field, "")
        e.setdefault("installable", [])
    known = {e["id"] for e in entries}

    found, problems = load_candidates()
    added = []
    for folder, item in found:
        entry = to_entry(folder, item)
        if entry["id"] in known:
            continue
        known.add(entry["id"])
        entries.append(entry)
        added.append(entry["id"])

    for e in entries:
        if e.get("review") not in REVIEWS:
            problems.append(f"{e['id']}: review is {e.get('review')!r}, expected one of {REVIEWS}")
        if e.get("max_status") not in STATUS_ORDER:
            problems.append(f"{e['id']}: max_status is {e.get('max_status')!r}")

    print(f"{len(entries)} entries in the list, {len(added)} new from the scans")
    for line in problems:
        print("  problem:", line)
    if check_only:
        return 1 if problems else 0

    LIST_FILE.write_text(json.dumps(entries, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    MD_FILE.write_text(render(entries) + "\n", encoding="utf-8")
    print(f"wrote {LIST_FILE.name} and {MD_FILE.name}")
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main())
