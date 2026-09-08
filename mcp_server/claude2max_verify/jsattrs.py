#!/usr/bin/env python3
"""
claude2max_verify.jsattrs — scan a Max JavaScript file for attribute and
assist-string conventions (TASK_QUEUE item 13 (u)).

Two conventions from CLAUDE.md, both binding and both unenforceable from the
spec alone because they live in a file the spec only points at:

  * Attribute Labels Must Begin With the Attribute's Own Word — attrui and the
    Inspector sort by label, so `@slidermode` labelled "Per-key Slider Mode" is
    unfindable; it must be "Slider Mode (per key)".
  * Match the Generated Control to the Attribute's Value Space — an attribute
    with min 0 / max 1 needs style "onoff", an enum needs "enum"/"enumindex",
    an rgba default needs "rgba", or the auto-generated control misrepresents
    the value.

Plus the v8/js half of the inlet/outlet labelling rule (CLAUDE.md > What You
Must Handle): every index below `inlets` / `outlets` needs a matching
setinletassist(n, …) / setoutletassist(n, …).

Parsing is a tolerant regex over the source — JavaScript is NOT parsed.
Only the object-literal form `declareattribute("name", {…})` carries a label
or style; the older getter/setter form `declareattribute("name", "get", "set")`
has nothing to check and is skipped. Dependency-free, like rules.py.
"""

from __future__ import annotations

import re
from pathlib import Path

_DECL_RE = re.compile(r'declareattribute\s*\(\s*["\']([A-Za-z_][\w]*)["\']\s*,\s*(\{)', re.S)
# `inlets = 1; outlets = 2;` on one line is common — a statement may follow `;`.
_INLETS_RE = re.compile(r'(?:^|;)\s*(?:var|let|const)?\s*inlets\s*=\s*(\d+)', re.M)
_OUTLETS_RE = re.compile(r'(?:^|;)\s*(?:var|let|const)?\s*outlets\s*=\s*(\d+)', re.M)
_INASSIST_RE = re.compile(r'setinletassist\s*\(\s*(\d+)')
_OUTASSIST_RE = re.compile(r'setoutletassist\s*\(\s*(\d+)')

_SRC_LABEL = "CLAUDE.md > Attribute Labels Must Begin With the Attribute's Own Word"
_SRC_STYLE = "CLAUDE.md > Match the Generated Control to the Attribute's Value Space"
_SRC_ASSIST = "CLAUDE.md > What You Must Handle (v8/js inlet/outlet labeling)"


def find_script(name: str, base_dir) -> Path | None:
    """Resolve a script name against the patch directory (and common sub-dirs)."""
    if not name or base_dir is None:
        return None
    base = Path(base_dir)
    for cand in (base / name, base / "code" / name, base / "javascript" / name):
        if cand.is_file():
            return cand
    return None


def _balanced_literal(src: str, start: int) -> str:
    """The `{…}` object literal starting at src[start] (brace-balanced, string-aware)."""
    depth, i, in_str, quote = 0, start, False, ""
    while i < len(src):
        ch = src[i]
        if in_str:
            if ch == "\\":
                i += 2
                continue
            if ch == quote:
                in_str = False
        elif ch in "\"'`":
            in_str, quote = True, ch
        elif ch == "{":
            depth += 1
        elif ch == "}":
            depth -= 1
            if depth == 0:
                return src[start:i + 1]
        i += 1
    return src[start:]


def _field(lit: str, key: str):
    """Value of `key:` in an object literal — a quoted string, a number, or a bracket list."""
    m = re.search(r'\b' + key + r'\s*:\s*("([^"]*)"|\'([^\']*)\'|(\[[^\]]*\])|(-?\d+(?:\.\d+)?))', lit)
    if not m:
        return None
    if m.group(2) is not None:
        return m.group(2)
    if m.group(3) is not None:
        return m.group(3)
    if m.group(4) is not None:
        return m.group(4)
    return m.group(5)


def parse_declarations(src: str) -> list[dict]:
    """[{name, label, style, min, max, enumvals, default}] for every object-literal declareattribute."""
    out = []
    for m in _DECL_RE.finditer(src):
        lit = _balanced_literal(src, m.start(2))
        out.append({
            "name": m.group(1),
            "label": _field(lit, "label"),
            "style": _field(lit, "style"),
            "min": _field(lit, "min"),
            "max": _field(lit, "max"),
            "enumvals": _field(lit, "enumvals"),
            "default": _field(lit, "default"),
        })
    return out


def _first_word(s: str) -> str:
    s = re.sub(r"[^A-Za-z0-9 ]", " ", s or "").strip().lower()
    return s.split()[0] if s.split() else ""


def _attr_first_word(name: str) -> str:
    """The attribute name's leading word — split on _ or camelCase, else the whole name."""
    parts = re.split(r"[_]|(?<=[a-z])(?=[A-Z])", name)
    return (parts[0] if parts and parts[0] else name).lower()


def check_declarations(decls: list[dict]) -> list[dict]:
    out = []
    for d in decls:
        name, label, style = d["name"], d["label"], d["style"]
        if label:
            lw, aw = _first_word(label), _attr_first_word(name)
            if lw and not (lw == aw or lw.startswith(aw) or aw.startswith(lw)):
                out.append({"rule": "attr-label-leading-word",
                            "message": f"@{name} is labelled \"{label}\" — the label must begin with "
                                       f"the attribute's own word so it can be found in the alphabetical "
                                       f"attrui/Inspector list (e.g. \"{name.capitalize()} (…)\").",
                            "source": _SRC_LABEL})
        if d["min"] in ("0", "0.0") and d["max"] in ("1", "1.0") and style != "onoff":
            out.append({"rule": "attr-style-mismatch",
                        "message": f"@{name} is min 0 / max 1 but has style {style!r}; declare "
                                   f"style:\"onoff\" so attrui renders a checkbox, not a number box.",
                        "source": _SRC_STYLE})
        if d["enumvals"] and style not in ("enum", "enumindex"):
            out.append({"rule": "attr-style-mismatch",
                        "message": f"@{name} has enumvals but style {style!r}; declare style:\"enum\" "
                                   f"(symbols) or \"enumindex\" (int index) so attrui renders a dropdown.",
                        "source": _SRC_STYLE})
        dflt = d["default"]
        if isinstance(dflt, str) and dflt.startswith("["):
            items = [x for x in re.split(r"[,\s]+", dflt.strip("[]").strip()) if x]
            if len(items) == 4 and all(re.fullmatch(r"-?\d+(\.\d+)?", x) for x in items) and style != "rgba":
                out.append({"rule": "attr-style-mismatch",
                            "message": f"@{name} defaults to a 4-float list but has style {style!r}; "
                                       f"declare style:\"rgba\" (and paint:1) so attrui renders a swatch.",
                            "source": _SRC_STYLE})
    return out


def check_assist(src: str) -> list[dict]:
    """v8/js: every declared inlet/outlet index needs an assist string."""
    out = []
    for kind, count_re, assist_re, fn in (("inlet", _INLETS_RE, _INASSIST_RE, "setinletassist"),
                                          ("outlet", _OUTLETS_RE, _OUTASSIST_RE, "setoutletassist")):
        m = count_re.search(src)
        if not m:
            continue
        n = int(m.group(1))
        have = {int(x) for x in assist_re.findall(src)}
        missing = [i for i in range(n) if i not in have]
        if missing:
            out.append({"rule": "script-io-unlabelled",
                        "message": f"script declares {kind}s = {n} but has no {fn}() for "
                                   f"{kind}(s) {missing}. Label each one — the string is the hover "
                                   f"tooltip on the box, the same surface a subpatcher's inlet comment reaches.",
                        "source": _SRC_ASSIST})
    return out


def check_script(path, want_assist: bool = True) -> list[dict]:
    """All findings for one script file: [{rule, message, source}]. Unreadable → []."""
    try:
        src = Path(path).read_text(encoding="utf-8", errors="replace")
    except OSError:
        return []
    findings = check_declarations(parse_declarations(src))
    if want_assist:
        findings.extend(check_assist(src))
    return findings
