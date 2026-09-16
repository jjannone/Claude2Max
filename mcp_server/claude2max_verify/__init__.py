"""
claude2max_verify — static binding-rule checker for Claude2Max specs.

A dependency-free rule library (no ``mcp``, no ``spec2maxpat``) so it can be
imported by BOTH the MCP server (``verify_spec`` tool) and ``spec2maxpat.py``
(surfacing violations at convert time).

Public API:
    verify_spec(spec: dict)        -> result dict
    verify_spec_json(text: str)    -> result dict
    format_report(result: dict)    -> str
    iter_spec_scopes(spec: dict)   -> (prefix, sub_spec) for every nested scope
    ERROR, WARNING, STYLE          severity constants
    Violation                      dataclass (rules return these)
"""

from .rules import ERROR, STYLE, WARNING, Violation, iter_spec_scopes
from .verify import (
    format_report,
    verify_resolver_only,
    verify_spec,
    verify_spec_json,
)

__all__ = [
    "verify_spec",
    "verify_spec_json",
    "verify_resolver_only",
    "iter_spec_scopes",
    "format_report",
    "Violation",
    "ERROR",
    "WARNING",
    "STYLE",
]
