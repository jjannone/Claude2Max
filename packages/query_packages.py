#!/usr/bin/env python3
"""
query_packages.py — Read-only inspection of the package_objects.json library.

Two subcommands:

  list      Show every installed Max package with its curation status,
            refpage count, and helpfile count. Identifies what's curated,
            what's uncurated but extractable (refpages or helpfiles
            present), and what has neither (truly help-less, requires a
            different approach).

  search    Grep across `digest` and `use_when` fields and print matching
            objects, ranked by where the term appears (use_when matches
            first, then digest, then object name).

  validate  Check every record in the library against the canonical schema
            in package_schema.py. Reports missing keys, type mismatches,
            unknown keys, and (with --strict) soft issues like uncurated
            entries or zero-I/O extractions.

Examples:
    python3 query_packages.py list
    python3 query_packages.py list --uncurated      # only uncurated
    python3 query_packages.py search "face detection"
    python3 query_packages.py search "convolve" --package "HISSTools*"
    python3 query_packages.py search "fft" --limit 5
    python3 query_packages.py validate              # hard schema issues only
    python3 query_packages.py validate --strict     # also flag soft issues

Subcommands read from ./package_objects.json (override with --library).
The `list` subcommand also walks the installed packages directory
(defaults to ~/Documents/Max 9/Packages, override with --root).
"""

import argparse
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from package_schema import validate as validate_record, CANONICAL_DEFAULTS

DEFAULT_ROOT    = Path.home() / "Documents" / "Max 9" / "Packages"
DEFAULT_LIBRARY = Path(__file__).parent / "package_objects.json"


# ─────────────────────────────────────────────────────────────────────────────
# list
# ─────────────────────────────────────────────────────────────────────────────

def survey_installed(root):
    """Return [(pkg_name, refpage_count, helpfile_count), ...] sorted by name."""
    if not root.is_dir():
        return []
    rows = []
    for d in sorted(root.iterdir()):
        if not d.is_dir():
            continue
        refpages  = sum(1 for _ in d.rglob("*.maxref.xml"))
        helpfiles = sum(1 for _ in d.rglob("*.maxhelp"))
        rows.append((d.name, refpages, helpfiles))
    return rows


def _norm(s):
    """Normalise a package name for fuzzy matching against curated keys."""
    return s.lower().replace(" ", "").replace("-", "").replace("_", "")


def match_curated(installed_name, curated_keys):
    """Return the curated key that matches this installed dir, or None."""
    target = _norm(installed_name)
    for key in curated_keys:
        if _norm(key) == target:
            return key
        # Allow curated key to be a prefix of the installed name
        # (e.g. "HISSTools..." curated matches "HISSTools Impulse Response Toolbox").
        if target.startswith(_norm(key)) or _norm(key).startswith(target):
            return key
    return None


def cmd_list(args):
    library = load_library(args.library)
    curated_keys = set(library.keys())
    rows = survey_installed(Path(args.root).expanduser())

    if not rows:
        print(f"No packages found at {args.root}", file=sys.stderr)
        return 1

    # Header
    print(f"{'Package':<45} {'Refs':>5} {'Helps':>5}  {'Status':<30} {'Objects':>7}")
    print("-" * 100)

    counts = {"curated": 0, "extractable": 0, "helpless": 0}
    shown  = 0

    for name, refs, helps in rows:
        curated_key = match_curated(name, curated_keys)
        n_objects = len(library.get(curated_key, {})) if curated_key else 0

        if curated_key:
            status = f"curated ({n_objects} obj)"
            counts["curated"] += 1
        elif refs > 0:
            status = "uncurated — has refpages"
            counts["extractable"] += 1
        elif helps > 0:
            status = "uncurated — helpfiles only"
            counts["extractable"] += 1
        else:
            status = "no docs (needs other approach)"
            counts["helpless"] += 1

        if args.uncurated and curated_key:
            continue
        if args.curated and not curated_key:
            continue

        print(f"{name:<45} {refs:>5} {helps:>5}  {status:<30} {n_objects:>7}")
        shown += 1

    print()
    total = sum(counts.values())
    print(f"Total: {total} packages   "
          f"curated: {counts['curated']}   "
          f"extractable (uncurated): {counts['extractable']}   "
          f"no-docs: {counts['helpless']}")

    if shown == 0:
        print("(no rows matched filters)", file=sys.stderr)

    return 0


# ─────────────────────────────────────────────────────────────────────────────
# search
# ─────────────────────────────────────────────────────────────────────────────

def _glob_to_regex(pattern):
    """Convert a simple shell glob to a regex (case-insensitive)."""
    return re.compile(
        "^" + re.escape(pattern).replace(r"\*", ".*").replace(r"\?", ".") + "$",
        re.IGNORECASE,
    )


def cmd_search(args):
    library = load_library(args.library)
    term    = args.term.lower()
    pkg_re  = _glob_to_regex(args.package) if args.package else None

    # Score each match: 3 = use_when hit, 2 = digest hit, 1 = name hit
    matches = []
    for pkg, objs in library.items():
        if pkg_re and not pkg_re.match(pkg):
            continue
        for name, rec in objs.items():
            digest   = rec.get("digest", "") or ""
            use_when = rec.get("use_when", "") or ""
            score    = 0
            if term in use_when.lower():
                score = 3
            elif term in digest.lower():
                score = 2
            elif term in name.lower():
                score = 1
            if score:
                matches.append((score, pkg, name, digest, use_when))

    if not matches:
        print(f"No matches for {args.term!r}", file=sys.stderr)
        return 1

    # Highest-relevance first, then by package then by name for stability
    matches.sort(key=lambda m: (-m[0], m[1], m[2]))
    if args.limit:
        matches = matches[: args.limit]

    for score, pkg, name, digest, use_when in matches:
        marker = {3: "★", 2: "◆", 1: "·"}[score]
        print(f"{marker} {pkg} / {name}")
        if digest:
            print(f"    digest:  {digest}")
        if use_when:
            wrapped = use_when if len(use_when) <= 300 else use_when[:297] + "..."
            print(f"    use_when: {wrapped}")
        print()

    print(f"{len(matches)} match{'es' if len(matches) != 1 else ''} "
          f"(★=use_when, ◆=digest, ·=name)", file=sys.stderr)
    return 0


# ─────────────────────────────────────────────────────────────────────────────
# validate
# ─────────────────────────────────────────────────────────────────────────────

def cmd_validate(args):
    library = load_library(args.library)

    hard_count = 0
    soft_count = 0
    total      = 0
    pkg_issues = {}

    for pkg, objs in sorted(library.items()):
        for name, rec in sorted(objs.items()):
            total += 1
            issues = validate_record(rec, strict=args.strict)
            if not issues:
                continue
            for iss in issues:
                if iss.startswith("[soft]"):
                    soft_count += 1
                else:
                    hard_count += 1
            pkg_issues.setdefault(pkg, []).append((name, issues))

    # Print per-package report
    if pkg_issues:
        for pkg in sorted(pkg_issues):
            print(f"=== {pkg} ===")
            for name, issues in pkg_issues[pkg]:
                print(f"  {name}")
                for iss in issues:
                    print(f"    - {iss}")
            print()

    print(f"Schema canonical keys: {list(CANONICAL_DEFAULTS.keys())}")
    print(f"Records checked: {total}")
    print(f"Hard issues: {hard_count}", end="")
    if args.strict:
        print(f"   Soft issues: {soft_count}")
    else:
        print()

    # Hard issues fail; soft issues are informational
    return 1 if hard_count else 0


# ─────────────────────────────────────────────────────────────────────────────
# shared
# ─────────────────────────────────────────────────────────────────────────────

def load_library(path):
    p = Path(path).expanduser()
    if not p.exists():
        print(f"Library not found: {p}", file=sys.stderr)
        sys.exit(2)
    with p.open() as f:
        return json.load(f)


def main():
    p = argparse.ArgumentParser(description=__doc__,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--library", default=str(DEFAULT_LIBRARY),
                   help="Path to package_objects.json")
    sub = p.add_subparsers(dest="cmd", required=True)

    p_list = sub.add_parser("list", help="List installed packages with curation status")
    p_list.add_argument("--root", default=str(DEFAULT_ROOT),
                        help=f"Packages dir (default: {DEFAULT_ROOT})")
    p_list.add_argument("--uncurated", action="store_true",
                        help="Show only uncurated packages")
    p_list.add_argument("--curated", action="store_true",
                        help="Show only curated packages")
    p_list.set_defaults(func=cmd_list)

    p_search = sub.add_parser("search", help="Search digest + use_when for a term")
    p_search.add_argument("term", help="Search term (case-insensitive substring)")
    p_search.add_argument("--package", help="Restrict to packages matching glob")
    p_search.add_argument("--limit", type=int, help="Max results to print")
    p_search.set_defaults(func=cmd_search)

    p_validate = sub.add_parser("validate",
        help="Check every record against the canonical schema")
    p_validate.add_argument("--strict", action="store_true",
        help="Also flag soft issues (empty digest, uncurated, zero I/O)")
    p_validate.set_defaults(func=cmd_validate)

    args = p.parse_args()
    sys.exit(args.func(args) or 0)


if __name__ == "__main__":
    main()
