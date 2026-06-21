#!/usr/bin/env python3
"""
claude2max_verify.verify — the public entry points.

``verify_spec(spec)``        run the rule library against a spec dict.
``verify_spec_json(text)``   parse a JSON string, then verify_spec.
``format_report(result)``    render the result dict as a readable block.

The result dict shape (stable — both the MCP tool and the converter consume it):

    {
      "ok":         bool,             # True iff zero errors AND zero warnings
      "counts":     {"error": n, "warning": n, "style": n},
      "violations": [ {rule, severity, location, message, source}, ... ],
      "summary":    str,              # one-line headline
    }
"""

from __future__ import annotations

import json

from .rules import ERROR, STYLE, WARNING, run_all


def verify_spec(spec: dict, resolver=None) -> dict:
    """Run every binding-rule check against a parsed spec dict.

    Pass ``resolver`` (see spec2maxpat.build_resolver) to also run the
    anti-guessing rules — object names and attributes checked against the
    authoritative C74 refpages + package library.
    """
    violations = run_all(spec, resolver=resolver)
    counts = {ERROR: 0, WARNING: 0, STYLE: 0}
    for v in violations:
        counts[v.severity] = counts.get(v.severity, 0) + 1
    ok = counts[ERROR] == 0 and counts[WARNING] == 0
    if counts[ERROR]:
        headline = (
            f"{counts[ERROR]} error(s), {counts[WARNING]} warning(s), "
            f"{counts[STYLE]} style — patch will break or misbehave."
        )
    elif counts[WARNING]:
        headline = (
            f"0 errors, {counts[WARNING]} warning(s), {counts[STYLE]} style — "
            f"binding-rule violations to fix."
        )
    elif counts[STYLE]:
        headline = f"Clean — {counts[STYLE]} style nudge(s) only."
    else:
        headline = "Clean — no violations."
    return {
        "ok": ok,
        "counts": counts,
        "violations": [v.to_dict() for v in violations],
        "summary": headline,
    }


def verify_spec_json(spec_json: str, resolver=None) -> dict:
    """Parse a JSON spec string then verify it. JSON errors come back as a result."""
    try:
        spec = json.loads(spec_json)
    except (json.JSONDecodeError, TypeError) as exc:
        return {
            "ok": False,
            "counts": {ERROR: 1, WARNING: 0, STYLE: 0},
            "violations": [{
                "rule": "invalid-json",
                "severity": ERROR,
                "location": "(input)",
                "message": f"spec_json is not valid JSON: {exc}",
                "source": "SPEC_REFERENCE.md",
            }],
            "summary": "Could not parse spec_json as JSON.",
        }
    if not isinstance(spec, dict):
        return {
            "ok": False,
            "counts": {ERROR: 1, WARNING: 0, STYLE: 0},
            "violations": [{
                "rule": "invalid-spec",
                "severity": ERROR,
                "location": "(input)",
                "message": "Top-level spec must be a JSON object with "
                           "'objects' and 'connections'.",
                "source": "SPEC_REFERENCE.md",
            }],
            "summary": "Top-level spec is not an object.",
        }
    return verify_spec(spec, resolver=resolver)


_SEV_GLYPH = {ERROR: "✗ ERROR  ", WARNING: "⚠ WARNING", STYLE: "· style  "}


def format_report(result: dict) -> str:
    """Render a result dict as a readable text block for humans / reasoning."""
    lines = [result.get("summary", "")]
    violations = result.get("violations", [])
    if not violations:
        return lines[0]
    for v in violations:
        glyph = _SEV_GLYPH.get(v["severity"], "  ")
        lines.append(f"  {glyph}  [{v['location']}] {v['message']}")
        if v.get("source"):
            lines.append(f"             ↳ {v['source']}  (rule: {v['rule']})")
    return "\n".join(lines)
