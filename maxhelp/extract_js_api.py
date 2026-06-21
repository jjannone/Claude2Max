#!/usr/bin/env python3
"""Census of Max JavaScript API usage across the installed `.js` / `.mjs` corpus.

The `.maxhelp` attribute crawl covers patcher boxes but not the JavaScript that
backs `js` / `v8` / `jsui` objects (and Node-for-Max `node.script`). Those files
are the authoritative record of how the Max JS API is *actually* used. This tool
walks every `.js` / `.mjs` under the corpus roots, classifies each file, and —
for the Max-relevant ones — tallies the API surface **empirically**: it extracts
`new X(...)` constructors, `function name(...)` definitions (lifecycle handlers +
helpers), top-level declarations (`inlets`/`outlets`/`autowatch`/`inspector`),
and called identifiers, then ranks by how many files use each. Nothing is
hardcoded from memory — the Max API names surface as the high-frequency
identifiers, which is the point: the data tells us the real vocabulary.

Classification (a single file may match `node` OR `inprocess`; `other` is the
runtime/library noise we count but don't tally):
  * `node`      — Node-for-Max: imports `max-api` / uses `Max.addHandler`,
                  `Max.outlet`, etc. Distinct API from in-process js/v8.
  * `inprocess` — js / v8 / jsui: uses `outlet(`, declares `inlets`/`outlets`,
                  uses `mgraphics`/`sketch`, `messnamed`, `jsthis`, etc.
  * `other`     — neither (RNBO generated runtime, npm libs, web assets). The
                  bulk of the raw `.js` count; excluded from the API tally.

Usage:
    python3 maxhelp/extract_js_api.py            # full corpus
    python3 maxhelp/extract_js_api.py --summary  # print ranked API surface
    python3 maxhelp/extract_js_api.py --limit 200

Output (next to this script):
    maxhelp_js_api.json  -- classification + ranked constructors/handlers/calls

Stdlib only.
"""

import argparse
import datetime
import os
import re
import sys
from collections import Counter, defaultdict
from pathlib import Path

CORPUS_ROOTS = [
    ("core", Path("/Applications/Max.app/Contents/Resources/C74/help")),
    ("bundled-packages", Path("/Applications/Max.app/Contents/Resources/C74/packages")),
    ("user-packages", Path(os.path.expanduser("~/Documents/Max 9/Packages"))),
]

HERE = Path(__file__).resolve().parent
OUT = HERE / "maxhelp_js_api.json"

# --- Classification signals (substring tests, not an API allowlist) ---------
# Node-for-Max: the import of the max-api module is the definitive signal.
NODE_SIGNALS = ("require('max-api')", 'require("max-api")', "from 'max-api'",
                'from "max-api"', "Max.addHandler", "Max.outlet", "Max.getDict")
# In-process js/v8/jsui: any of these idioms marks a Max JS object file.
INPROCESS_SIGNALS = ("outlet(", "inlets =", "inlets=", "outlets =", "outlets=",
                     "messnamed(", "jsthis", "mgraphics", "sketch.",
                     "this.patcher", "arguments.callee", "setinletassist",
                     "setoutletassist", "embedmessage", "declareattribute")

# --- Empirical extractors ---------------------------------------------------
RE_CTOR = re.compile(r"\bnew\s+([A-Z][A-Za-z0-9_.]*)\s*\(")
RE_FUNC = re.compile(r"\bfunction\s+([A-Za-z_]\w*)\s*\(")
RE_DECL = re.compile(r"^\s*(inlets|outlets|autowatch|inspector)\s*=", re.M)
RE_CALL = re.compile(r"\b([a-z_]\w*)\s*\(")
# JS keywords / common control words that RE_CALL would otherwise capture.
CALL_STOPWORDS = frozenset({
    "if", "for", "while", "switch", "catch", "function", "return", "typeof",
    "do", "else", "with", "in", "of", "new", "delete", "void", "yield",
    "await", "super", "this", "var", "let", "const", "case",
})


def classify(text):
    is_node = any(s in text for s in NODE_SIGNALS)
    is_inproc = any(s in text for s in INPROCESS_SIGNALS)
    if is_node:
        return "node"
    if is_inproc:
        return "inprocess"
    return "other"


def iter_js(limit=None):
    n = 0
    for tier, root in CORPUS_ROOTS:
        if not root.exists():
            continue
        for ext in ("*.js", "*.mjs"):
            for path in sorted(root.rglob(ext)):
                yield tier, path
                n += 1
                if limit and n >= limit:
                    return


def extract(limit=None, verbose=False):
    cls_counts = Counter()                    # classification -> file count
    cls_by_tier = defaultdict(Counter)        # tier -> classification -> count
    # Per-API tallies are scoped to in-process files (the js/v8/jsui surface).
    ctor_files = Counter(); ctor_calls = Counter()
    func_files = Counter()
    call_files = Counter()
    decl_files = Counter()
    node_handlers = Counter()                 # Max.addHandler("name", ...) on node side
    files_scanned = files_failed = 0
    inproc = 0

    RE_NODE_HANDLER = re.compile(r"Max\.addHandler\(\s*['\"]([^'\"]+)['\"]")

    for tier, path in iter_js(limit=limit):
        try:
            text = path.read_text(encoding="utf-8", errors="replace")
        except Exception as exc:
            files_failed += 1
            if verbose:
                print(f"  SKIP {path}: {exc}", file=sys.stderr)
            continue
        files_scanned += 1
        kind = classify(text)
        cls_counts[kind] += 1
        cls_by_tier[tier][kind] += 1

        if kind == "node":
            for h in RE_NODE_HANDLER.findall(text):
                node_handlers[h] += 1
            continue
        if kind != "inprocess":
            continue
        inproc += 1

        seen_ctor = set(); seen_func = set(); seen_call = set()
        for m in RE_CTOR.finditer(text):
            name = m.group(1)
            ctor_calls[name] += 1
            seen_ctor.add(name)
        for name in RE_FUNC.findall(text):
            seen_func.add(name)
        for name in RE_CALL.findall(text):
            if name not in CALL_STOPWORDS:
                seen_call.add(name)
        for name in RE_DECL.findall(text):
            decl_files[name] += 1
        for name in seen_ctor:
            ctor_files[name] += 1
        for name in seen_func:
            func_files[name] += 1
        for name in seen_call:
            call_files[name] += 1

    # Frequency floors filter local helpers / one-off names; the Max API
    # surface is what recurs across many independent files.
    def floor(counter, n):
        return dict(sorted(((k, v) for k, v in counter.items() if v >= n),
                           key=lambda kv: -kv[1]))

    result = {
        "_meta": {
            "generated": datetime.date.today().isoformat(),
            "files_scanned": files_scanned,
            "files_failed": files_failed,
            "inprocess_files_tallied": inproc,
            "corpus_roots": [str(r) for _, r in CORPUS_ROOTS],
            "note": ("Empirical Max JS API census. Constructors/handlers/calls "
                     "are ranked by file count across in-process js/v8/jsui "
                     "files (node handlers from Node-for-Max separately). "
                     "Names are extracted structurally, never hardcoded."),
        },
        "classification": dict(cls_counts.most_common()),
        "classification_by_tier": {t: dict(c) for t, c in cls_by_tier.items()},
        "declarations": dict(decl_files.most_common()),
        "constructors": {  # the Max JS classes, ranked
            name: {"files": ctor_files[name], "calls": ctor_calls[name]}
            for name in sorted(ctor_files, key=lambda n: -ctor_files[n])
            if ctor_files[name] >= 2
        },
        "defined_functions": floor(func_files, 3),   # lifecycle handlers + helpers
        "called_identifiers": floor(call_files, 5),  # global API fns + helpers
        "node_handlers": floor(node_handlers, 1),
    }
    return result


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--limit", type=int, default=None)
    ap.add_argument("--summary", action="store_true")
    ap.add_argument("--no-write", action="store_true")
    ap.add_argument("--verbose", action="store_true")
    args = ap.parse_args()

    import json
    result = extract(limit=args.limit, verbose=args.verbose)
    m = result["_meta"]
    if not args.no_write:
        OUT.write_text(json.dumps(result, indent=2) + "\n")

    print(f"files scanned    : {m['files_scanned']}")
    print(f"classification   : {result['classification']}")
    print(f"in-process tallied: {m['inprocess_files_tallied']}")
    if not args.no_write:
        print(f"wrote            : {OUT.name}")

    if args.summary:
        print("\nDeclarations (file counts):", result["declarations"])
        print("\nTop constructors (Max JS classes), files/calls:")
        for name, rec in list(result["constructors"].items())[:20]:
            print(f"  {name:<18} files={rec['files']:<4} calls={rec['calls']}")
        print("\nTop defined functions (lifecycle handlers + helpers):")
        for name, c in list(result["defined_functions"].items())[:25]:
            print(f"  {name:<22} files={c}")
        print("\nTop called identifiers (global API fns + helpers):")
        for name, c in list(result["called_identifiers"].items())[:30]:
            print(f"  {name:<22} files={c}")
        if result["node_handlers"]:
            print("\nNode-for-Max handler names:")
            for name, c in list(result["node_handlers"].items())[:20]:
                print(f"  {name:<22} files={c}")


if __name__ == "__main__":
    main()
