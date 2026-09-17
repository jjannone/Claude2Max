#!/usr/bin/env python3
"""MCP tools say when a knowledge source or the resolver is missing.
Run with the server's venv:

    mcp_server/.venv/bin/python3 mcp_server/tests/test_degraded_sources.py

Each builder in server.py used to skip a missing file, and `_build_resolver_safe`
swallowed every exception, so a tool running without part of its knowledge
returned a smaller answer that looked complete. Rule: CLAUDE.md > A Silent
Fallback Is Indistinguishable From a Genuine No-Match.

Each test breaks one source on purpose, checks the tool reports it, and restores it.
"""
import json
import sys
from pathlib import Path

_MCP = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(_MCP))

import server  # noqa: E402

_NOWHERE = server._REPO_ROOT / "scans" / "no-such-crawl" / "no_such_insights.md"


def _patched(name, value, fn):
    saved = getattr(server, name)
    setattr(server, name, value)
    try:
        return fn()
    finally:
        setattr(server, name, saved)


def test_pitfall_search_names_a_missing_source():
    sources = list(server._PITFALL_SOURCES) + [_NOWHERE]
    r = _patched("_PITFALL_SOURCES", sources, lambda: server.search_pitfalls("textedit"))
    assert r.get("missing_sources") == ["scans/no-such-crawl/no_such_insights.md"], r.get("missing_sources")
    assert r["message"].startswith("WARNING: could not read scans/no-such-crawl/no_such_insights.md")
    assert "missing_sources" not in server.search_pitfalls("textedit")


def test_rule_lookup_names_a_missing_source():
    docs = list(server._RULE_DOCS) + [_NOWHERE]
    r = _patched("_RULE_DOCS", docs, lambda: server.lookup_rule("presentation"))
    assert r.get("missing_sources") == ["scans/no-such-crawl/no_such_insights.md"], r.get("missing_sources")
    assert "missing_sources" not in server.lookup_rule("presentation")


def test_module_names_a_missing_tagged_source():
    docs = list(server._TAGGED_DOCS) + [_NOWHERE]
    text = _patched("_TAGGED_DOCS", docs, lambda: server._build_tagged("core"))
    assert "[Knowledge source missing: scans/no-such-crawl/no_such_insights.md" in text
    assert "Knowledge source missing" not in server._build_tagged("core")


def test_resolver_build_failure_records_its_cause():
    def boom(*_a, **_k):
        raise ValueError("secret-bearing detail")
    r = _patched("_build_resolver", boom, server._build_resolver_safe)
    assert r is None
    assert server._resolver_error == "resolver failed to build (ValueError)", server._resolver_error
    assert "secret-bearing" not in server._resolver_error
    r = _patched("_build_resolver", lambda *_a, **_k: None, server._build_resolver_safe)
    assert r is None and server._resolver_error == "verify library unavailable"
    assert server._build_resolver_safe() is not None and server._resolver_error is None


def test_tools_attach_a_note_when_the_resolver_is_missing():
    spec = json.dumps({"objects": {"m": {"type": "newobj", "text": "metro 500"}}, "connections": []})
    def run():
        server._resolver_error = "resolver failed to build (ValueError)"
        return (server.lookup_attribute("live.gain~", "coldcolor"),
                server.list_attributes("live.gain~"),
                server.lookup_object("metro"),
                server.verify_spec(spec))
    saved_error = server._resolver_error
    try:
        results = _patched("_resolver", lambda: None, run)
    finally:
        server._resolver_error = saved_error
    for r in results:
        assert "resolver failed to build (ValueError)" in r.get("resolver_note", ""), r.get("resolver_note")
    assert results[3].get("degraded") is True
    for r in (server.lookup_attribute("live.gain~", "coldcolor"), server.verify_spec(spec)):
        assert "resolver_note" not in r and not r.get("degraded")


def _run():
    fns = [v for k, v in sorted(globals().items()) if k.startswith("test_") and callable(v)]
    failed = 0
    for fn in fns:
        try:
            fn(); print(f"  PASS  {fn.__name__}")
        except AssertionError as e:
            failed += 1; print(f"  FAIL  {fn.__name__}: {e}")
    print(f"\n{len(fns) - failed} passed, {failed} failed of {len(fns)}")
    return failed == 0


if __name__ == "__main__":
    sys.exit(0 if _run() else 1)
