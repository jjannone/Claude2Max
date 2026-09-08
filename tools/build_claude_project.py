#!/usr/bin/env python3
"""
build_claude_project.py — assemble `claude-project/` from canonical sources.

`claude-project/` is the knowledge payload a free-plan Claude.ai user uploads
to a Project (or attaches to one chat) so Claude can write Claude2Max specs
that `tools/patchgen.js` builds inside Max. Nothing in that folder is edited
by hand; this script regenerates it so it cannot drift from the sources:

    tools/claude-project-src/CLAUDE_INSTRUCTIONS.md   → copied
    tools/claude-project-src/README.md                → copied
    tools/claude-project-src/examples/*.json          → copied (validated)
    SPEC_REFERENCE.md                                 → condensed by section
    tools/patchgen.js, tools/patchgen-loader.maxpat   → copied

Usage:
    python3 tools/build_claude_project.py           # write claude-project/
    python3 tools/build_claude_project.py --check   # exit 1 if it would change

The condensation keeps only the `## ` sections of SPEC_REFERENCE.md listed in
KEEP_SECTIONS, drops the paragraphs that only mean something inside this
repository (converter internals, MCT, externally-sourced-patch highlighting),
and prefixes a short note on what the in-Max generator ignores. Total size is
reported so the ~150 KB Project budget is visible at every build.
"""

from __future__ import annotations

import argparse
import filecmp
import json
import re
import shutil
import sys
import tempfile
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
SRC = REPO / "tools" / "claude-project-src"
OUT = REPO / "claude-project"
SPEC_REF = REPO / "SPEC_REFERENCE.md"
BUDGET_BYTES = 150 * 1024

# `## ` headings of SPEC_REFERENCE.md that reach the payload, in file order.
# Everything else (serialization formats, MCT, externally-sourced patches) is
# repo-side knowledge the free-plan workflow never touches.
KEEP_SECTIONS = [
    "## Spec Structure",
    "## Objects",
    "## jit.cellblock Notes",
    "## jit.gl.text Notes",
    "## Object Correctness Notes",
    "## Object Relationships",
    "## Connections",
    "## Subpatchers",
    "## Extra Attributes",
    "## Layout Guidelines",
    "## Presentation View",
    "## Complete Examples",
    "## v8 / JavaScript Objects",
]

# Lines inside kept sections that point at repo-only machinery.
DROP_LINE_PATTERNS = [
    r"^> \*\*Read `CLAUDE\.md` before using this file",
    r"RefpageCache\.describe",
    r"`spec2maxpat\.py`",
    r"MAXCLASS_DEFAULTS",
    r"UI_SIZES",
]

HEADER = """# Claude2Max Spec Reference (Project edition)

This is the spec format Claude2Max uses to describe a Max/MSP patch, condensed
for use inside a Claude.ai Project. The person you are helping turns your JSON
into a patch **inside Max** with `patchgen.js`, so:

- `inlets`, `outlets`, `outlettype` are accepted but ignored — Max supplies them.
- The `layout` grid hints and the `{"col", "row"}` form of `presentation` are
  not supported — give every object a `pos` and a 4-element `presentation` rect.
- Never set `hidden`; never add a fifth element to a connection.
- A top-level `"_comment"` key is ignored (the examples use it for a description).

"""


def _split_sections(text: str) -> list[tuple[str, str]]:
    """[(heading_line, body)] for every `## ` section; body includes `### ` children."""
    out: list[tuple[str, str]] = []
    cur, buf = None, []
    for line in text.splitlines():
        if line.startswith("## "):
            if cur is not None:
                out.append((cur, "\n".join(buf)))
            cur, buf = line, []
        elif cur is not None:
            buf.append(line)
    if cur is not None:
        out.append((cur, "\n".join(buf)))
    return out


def condense_spec_reference(text: str) -> str:
    sections = dict(_split_sections(text))
    parts = [HEADER]
    for h in KEEP_SECTIONS:
        if h not in sections:
            raise SystemExit(f"SPEC_REFERENCE.md no longer has a section {h!r}; update KEEP_SECTIONS")
        body = sections[h]
        kept = [l for l in body.splitlines()
                if not any(re.search(p, l) for p in DROP_LINE_PATTERNS)]
        parts.append(h + "\n" + "\n".join(kept).strip() + "\n")
    return "\n".join(parts).rstrip() + "\n"


def validate_example(path: Path) -> None:
    spec = json.loads(path.read_text())
    assert isinstance(spec.get("objects"), dict) and spec["objects"], f"{path.name}: no objects"
    assert isinstance(spec.get("connections"), list), f"{path.name}: no connections list"
    assert isinstance(spec.get("_comment"), str) and spec["_comment"].strip(), f"{path.name}: needs a one-line _comment"
    ids = set(spec["objects"])
    for c in spec["connections"]:
        assert len(c) == 4 and c[0] in ids and c[2] in ids, f"{path.name}: bad connection {c}"
    for oid, o in spec["objects"].items():
        assert "pos" in o, f"{path.name}: {oid} has no pos"
        assert "hidden" not in (o.get("attrs") or {}), f"{path.name}: {oid} is hidden"


def build(into: Path) -> dict[str, int]:
    into.mkdir(parents=True, exist_ok=True)
    (into / "examples").mkdir(exist_ok=True)
    sizes: dict[str, int] = {}

    def put(rel: str, content: str | bytes):
        p = into / rel
        p.parent.mkdir(parents=True, exist_ok=True)
        if isinstance(content, str):
            p.write_text(content)
        else:
            p.write_bytes(content)
        sizes[rel] = p.stat().st_size

    put("CLAUDE_INSTRUCTIONS.md", (SRC / "CLAUDE_INSTRUCTIONS.md").read_text())
    put("README.md", (SRC / "README.md").read_text())
    put("SPEC_REFERENCE.md", condense_spec_reference(SPEC_REF.read_text()))
    for ex in sorted((SRC / "examples").glob("*.json")):
        validate_example(ex)
        put(f"examples/{ex.name}", ex.read_text())
    put("patchgen.js", (REPO / "tools" / "patchgen.js").read_text())
    put("patchgen-loader.maxpat", (REPO / "tools" / "patchgen-loader.maxpat").read_bytes())

    # remove anything stale that no source produced
    produced = {into / rel for rel in sizes}
    for p in list(into.rglob("*")):
        if p.is_file() and p not in produced:
            p.unlink()
    return sizes


def _tree_equal(a: Path, b: Path) -> bool:
    fa = {p.relative_to(a) for p in a.rglob("*") if p.is_file()}
    fb = {p.relative_to(b) for p in b.rglob("*") if p.is_file()}
    if fa != fb:
        return False
    return all(filecmp.cmp(a / r, b / r, shallow=False) for r in fa)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--check", action="store_true", help="report whether claude-project/ is up to date; write nothing")
    args = ap.parse_args()

    if args.check:
        with tempfile.TemporaryDirectory() as tmp:
            sizes = build(Path(tmp))
            same = OUT.is_dir() and _tree_equal(Path(tmp), OUT)
        total = sum(sizes.values())
        print(f"claude-project/ is {'up to date' if same else 'STALE — run tools/build_claude_project.py'} "
              f"({total:,} bytes of {BUDGET_BYTES:,})")
        return 0 if same else 1

    sizes = build(OUT)
    total = sum(sizes.values())
    width = max(len(k) for k in sizes)
    for rel, n in sizes.items():
        print(f"  {rel:<{width}}  {n:>8,}")
    print(f"  {'total':<{width}}  {total:>8,}  (budget {BUDGET_BYTES:,})")
    if total > BUDGET_BYTES:
        print("WARNING: over the Project budget", file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    sys.exit(main())
