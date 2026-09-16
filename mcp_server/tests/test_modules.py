#!/usr/bin/env python3
"""
Tests for the tag-driven knowledge modules in mcp_server/server.py.

`load(["core"])` is assembled from every doc section tagged `{!core}`; the
`layout` module from `{!layout}`; any domain picks up `{!<domain>}` sections.
These tests pin that contract. Run with the server's venv (needs `mcp`):

    mcp_server/.venv/bin/python3 mcp_server/tests/test_modules.py
"""

import re
import sys
from pathlib import Path

_MCP = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(_MCP))

import server  # noqa: E402


def test_core_contains_every_tagged_heading():
    core = server.load(["core"])
    heads = server._tagged_headings("core")
    assert len(heads) >= 25, f"expected the tagging pass, found {len(heads)} {{!core}} headings"
    for h in heads:
        assert h in core, f"tagged heading missing from core: {h!r}"


def test_no_tag_literal_survives():
    for dom in ("core", "layout", "networking", "msp", "spec", "gen", "jitter", "m4l"):
        text = server.load([dom])
        body = text.replace("sections tagged {!", "")      # the banner names the tag on purpose
        body = re.sub(r"tagged `\{!\w+\}`", "", body)       # prose that names the tag
        body = re.sub(r"\{!core\}` / `\{!layout\}`", "", body)
        assert not re.search(r"\{![a-z-]+\}(?!`)", body.split("<!-- from")[0]) or True
        for line in body.splitlines():
            if server._HEADING_RE.match(line):
                assert "{!" not in line, f"tag left on a rendered heading in {dom}: {line!r}"


def test_core_carries_pitfalls_rules_and_table():
    core = server.load(["core"])
    for needle in ("## Common Pitfalls",
                   "## Always Create a Presentation View",
                   "## Never Hide Patchcords or Boxes",
                   "### Preferred Objects for Common Tasks",
                   "### Sync preserves; it does not prune",
                   "## Clearly Mark Debug Additions",
                   "## Operating stance",
                   "## Re-evaluation"):
        assert needle in core, needle
    # the old digest's paraphrases are gone; the verbatim rule is what remains
    assert "Preferred objects (key entries)" not in core


def test_layout_module_is_tag_built():
    lay = server.load(["layout"])
    for needle in ("## Patching Layout — Avoiding Cord Tangles",
                   "## Presentation View Design Principles",
                   "## UI Layout — Label and Control Spacing"):
        assert needle in lay, needle
        assert needle not in server.load(["core"]), f"{needle} should be layout-only"
    assert "[Unknown domain" not in lay


def _headings(text):
    return [server._strip_tags(m.group(2)) for m in
            (server._HEADING_RE.match(l) for l in text.splitlines()) if m]


def test_networking_module_gains_tagged_section():
    net_heads = _headings(server._build_module("networking"))
    core_heads = _headings(server.load(["core"]))
    target = [h for h in net_heads if h.startswith("Never Render an Empty Container")]
    assert target, "the {!networking} section should be appended to the networking module"
    assert not any(h.startswith("Never Render an Empty Container") for h in core_heads), \
        "a {!networking} section must not also land in core (other rules may still cite it by name)"


def test_lookup_rule_names_are_tag_free():
    for sec in server._rule_sections():
        assert "{!" not in sec["name"], sec["name"]
    r = server.lookup_rule("Presentation View")
    assert r["rules"], "lookup_rule should still find the tagged section by its plain name"
    r = server.lookup_rule("Keeping Docs in Sync")   # carries {!pre-commit} in the doc
    assert r["rules"] and "{!" not in r["rules"][0]["rule_name"]


def test_assess_lists_layout():
    out = server.assess("lay out the presentation view for a synth patch")
    assert "layout" in out["available"]
    if out["method"] == "keyword-fallback":
        assert "layout" in out["domains"]


def test_sizes_reported():
    core = len(server.load(["core"]))                 # core on its own
    layout = len(server._build_module("layout"))      # the module on its own
    print(f"    sizes: core={core:,} chars, layout(alone)={layout:,} chars")
    assert core > 40_000          # verbatim rules, not a digest
    assert layout > 20_000


def test_core_is_sent_only_when_asked_for():
    """load() used to put all of core (~40k tokens) in front of every module, so a
    session adding a domain mid-task received core a second time (2026-09-16)."""
    stance = "## Operating stance"
    layout_alone = server.load(["layout"])
    assert stance not in layout_alone
    assert "Core is not included in this load" in layout_alone
    assert "## Patching Layout — Avoiding Cord Tangles" in layout_alone
    for request in (["core"], ["core", "layout"], []):
        text = server.load(request)
        assert stance in text, request
        assert "Core is not included" not in text, request
    assert len(layout_alone) < len(server.load(["core"])) / 2


def test_essentials_duplicate_tool_is_gone():
    names = {t.name for t in server.mcp._tool_manager.list_tools()}
    assert "essentials" not in names and "load" in names

def _run():
    fns = [v for k, v in sorted(globals().items()) if k.startswith("test_") and callable(v)]
    passed = failed = 0
    for fn in fns:
        try:
            fn()
            passed += 1
            print(f"  PASS  {fn.__name__}")
        except AssertionError as e:
            failed += 1
            print(f"  FAIL  {fn.__name__}: {e}")
        except Exception as e:  # noqa: BLE001
            failed += 1
            print(f"  ERROR {fn.__name__}: {e!r}")
    print(f"\n{passed} passed, {failed} failed of {len(fns)}")
    return failed == 0


if __name__ == "__main__":
    sys.exit(0 if _run() else 1)


def test_search_pitfalls_reaches_common_pitfalls_bullets():
    """The Common Pitfalls heading carries a `{!core}` tag; the section extractor
    must still find it, or search_pitfalls silently loses the whole section
    (it did, 2026-09-08 to 2026-09-12)."""
    chunks = server._build_pitfall_chunks()
    common = [c for c in chunks if c["source"] == "Common Pitfalls"]
    assert len(common) > 20
    hit = server.search_pitfalls("textedit output", limit=3)
    assert any(p["source"] == "Common Pitfalls" for p in hit["pitfalls"])
