#!/usr/bin/env python3
"""
package_schema.py — Canonical schema for package_objects.json records.

Single source of truth. Every record that reaches disk passes through
`normalize()` exactly once, so drift between extractors is impossible:
add a key to CANONICAL_DEFAULTS here, and both extractors automatically
emit it on the next run.

Used by:
  - build_package_objects.py    (refpage extractor)
  - build_helpfile_objects.py   (helpfile extractor)
  - query_packages.py validate  (library health check)

Anyone adding a new extractor MUST run their records through `normalize()`
before merging — `merge_into` enforces this defensively but extractors
should not rely on that.
"""

from collections import OrderedDict


# Required keys with their default values. Adding a key here propagates
# automatically to both extractors and the validator.
CANONICAL_DEFAULTS = OrderedDict([
    ("digest",     ""),
    ("numinlets",  0),
    ("numoutlets", 0),
    ("outlettype", []),
    ("kind",       ""),
    ("tags",       []),
    ("source",     ""),     # "refpage" or "helpfile"
    ("use_when",   ""),
])

# Keys that may or may not be present. If present, they're preserved verbatim
# through normalize. If a record has an OPTIONAL key with an empty value,
# it stays — empty `deprecated_by` means "flagged but replacement TBD".
OPTIONAL_KEYS = frozenset({
    "deprecated_by",
})

# Per-key type constraints. None means "no constraint" (use_when is free-form
# string but could be None on a fresh extract — coerce to "").
TYPE_CONSTRAINTS = {
    "digest":        str,
    "numinlets":     int,
    "numoutlets":    int,
    "outlettype":    list,
    "kind":          str,
    "tags":          list,
    "source":        str,
    "use_when":      str,
    "deprecated_by": str,
}

VALID_SOURCES = frozenset({"refpage", "helpfile"})
VALID_KINDS   = frozenset({"external", "abstraction", "javascript", ""})


def normalize(record):
    """
    Coerce a record into the canonical schema.

    - Fills missing required keys with defaults
    - Drops unknown keys (anything starting with `_` is treated as transient
      and silently removed — used by extractors for curator-only scratch)
    - Preserves any OPTIONAL keys that are present
    - Coerces basic type mismatches (None -> default, str numinlets -> int)

    Returns a new dict; does not mutate the input.
    """
    out = {}

    # Required keys with defaults and type coercion
    for key, default in CANONICAL_DEFAULTS.items():
        val = record.get(key, default)
        expected = TYPE_CONSTRAINTS.get(key)
        if val is None:
            val = default
        elif expected is int and not isinstance(val, int):
            try:
                val = int(val)
            except (TypeError, ValueError):
                val = default
        elif expected is list and not isinstance(val, list):
            val = default if val == "" else [val]
        elif expected is str and not isinstance(val, str):
            val = str(val)
        out[key] = val

    # Optional keys: preserve verbatim if present
    for key in OPTIONAL_KEYS:
        if key in record:
            out[key] = record[key]

    return out


def validate(record, *, strict=False):
    """
    Return a list of issue strings for `record`. Empty list = clean.

    With `strict=True`, also flags soft issues (empty digest, suspicious I/O
    counts) — useful for `query_packages.py validate` runs.
    """
    issues = []

    # Missing required keys
    for key in CANONICAL_DEFAULTS:
        if key not in record:
            issues.append(f"missing required key: {key}")

    # Type checks
    for key, expected in TYPE_CONSTRAINTS.items():
        if key in record and not isinstance(record[key], expected) and record[key] is not None:
            issues.append(f"{key}: expected {expected.__name__}, got {type(record[key]).__name__}")

    # Enum checks
    src = record.get("source", "")
    if src and src not in VALID_SOURCES:
        issues.append(f"source: {src!r} not in {sorted(VALID_SOURCES)}")
    kind = record.get("kind", "")
    if kind and kind not in VALID_KINDS:
        issues.append(f"kind: {kind!r} not in {sorted(VALID_KINDS)}")

    # Unknown keys
    known = set(CANONICAL_DEFAULTS) | OPTIONAL_KEYS
    unknown = [k for k in record if k not in known and not k.startswith("_")]
    if unknown:
        issues.append(f"unknown keys: {sorted(unknown)}")

    if strict:
        if not record.get("digest", "").strip():
            issues.append("[soft] empty digest")
        if not record.get("use_when", "").strip():
            issues.append("[soft] empty use_when (uncurated)")
        nin = record.get("numinlets", 0)
        nout = record.get("numoutlets", 0)
        if nin == 0 and nout == 0:
            issues.append("[soft] zero I/O — extractor couldn't determine inlets/outlets")

    return issues


def normalize_library(library):
    """
    In-place normalise every record in a {pkg: {obj: rec}} library.
    Returns (records_changed, total_records).
    """
    changed = 0
    total   = 0
    for pkg, objs in library.items():
        for name, rec in objs.items():
            total += 1
            new_rec = normalize(rec)
            if new_rec != rec:
                changed += 1
            objs[name] = new_rec
    return changed, total
