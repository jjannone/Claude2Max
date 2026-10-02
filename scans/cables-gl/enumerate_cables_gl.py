#!/usr/bin/env python3
"""
Enumerate the cables.gl documentation and op reference into
cables_gl_crawl_state.json. See CABLES_GL_CRAWL_LOG.md in this folder.

Three public pages are read, and nothing else:

  https://cables.gl/sitemap.xml   every /docs/... page and every /op/<name> page
  https://cables.gl/docs/docs     the documentation index (page titles, and a
                                  cross-check on the sitemap's doc list)
  https://cables.gl/ops           the op index: every namespace with its
                                  one-line description, every current op with
                                  its one-line digest

The site's JSON API (/api/...) is NOT used: robots.txt disallows it.

Usage:
    python3 scans/cables-gl/enumerate_cables_gl.py            # enumerate + merge
    python3 scans/cables-gl/enumerate_cables_gl.py --status   # coverage summary
    python3 scans/cables-gl/enumerate_cables_gl.py --dry-run  # fetch, report, write nothing

State file format (cables_gl_crawl_state.json), a dict:

    key   a doc page's full URL, an op's full name ("Ops.Gl.Meshes.Cube_v2"),
          or "namespace:<Ops.X.Y>" for a namespace overview page
    value {
      "title":   page title, or the op's short name
      "url":     the page
      "group":   "docs/<section>" for prose, the namespace for an op
      "kind":    "doc" | "op" | "namespace"
      "digest":  the one-line description from the op index ("" for docs)
      "status":  "pending" | "extracted" | "skipped"
      "session": "YYYY-MM-DD" or null    (the session that read it)
      "notes":   free text
    }

Merging: an entry already in the state file keeps its status, session and
notes. Only title / url / group / kind / digest are refreshed. Entries that
have disappeared from the site are kept and get "gone_from_site": true, so
notes written against them are not lost.

A failed fetch, or a fetch that parses to nothing, exits non-zero with the
cause and writes nothing. An empty list is never written.

Python 3.9 compatible, standard library only.
"""
import argparse
import html
import json
import re
import sys
import time
import urllib.error
import urllib.request
from pathlib import Path
from typing import Dict, List, Optional, Tuple

BASE = "https://cables.gl"
SITEMAP_URL = BASE + "/sitemap.xml"
DOCS_INDEX_URL = BASE + "/docs/docs"
OPS_INDEX_URL = BASE + "/ops"

HERE = Path(__file__).resolve().parent
STATE_FILE = HERE / "cables_gl_crawl_state.json"

USER_AGENT = "Claude2Max-cables-gl-crawl/1.0 (documentation index; stdlib urllib)"

# Sanity floors. The 2026-10-02 run found 130 doc pages, 1,358 ops in the
# sitemap and 1,469 in the op index. A parse that returns far fewer means the
# markup changed, and that must be reported, not written.
MIN_DOCS = 50
MIN_OPS = 500

LOC_RE = re.compile(r"<loc>([^<]+)</loc>")
TAG_RE = re.compile(r"<[^>]+>")
DOC_LINK_RE = re.compile(r'<a[^>]*href="(/docs/[^"#]+)"[^>]*>(.*?)</a>', re.DOTALL)
# Op index markup, verified 2026-10-02:
#   <div id="ns_Ops.Anim" class="... namespacetitle "><h2 ...><a href="/ops/Ops.Anim">Ops.Anim</a></h2>
#       <br/><span class="namespace-description text">Animations</span>...
#   <div class="... opelement "><h3>[icon]<a href="/op/Ops.Anim.Bang">Bang</a></h3>digest text</div>
NS_SPLIT_RE = re.compile(r'<div id="ns_(Ops\.[^"]+)"')
NS_DESC_RE = re.compile(r'<span class="namespace-description[^"]*">(.*?)</span>', re.DOTALL)
OP_RE = re.compile(
    r'<a href="/op/(Ops\.[^"]+)">([^<]*)</a></h3>(.*?)</div>', re.DOTALL
)


class FetchError(RuntimeError):
    pass


def fetch(url: str, retries: int = 2) -> str:
    last = None  # type: Optional[BaseException]
    for attempt in range(retries + 1):
        try:
            req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
            with urllib.request.urlopen(req, timeout=60) as resp:
                status = getattr(resp, "status", 200)
                body = resp.read().decode("utf-8", errors="replace")
                if status != 200:
                    raise FetchError("HTTP %s" % status)
                if not body.strip():
                    raise FetchError("empty body")
                return body
        except (urllib.error.URLError, OSError, FetchError) as e:
            last = e
            time.sleep(1 + attempt)
    raise FetchError("could not fetch %s: %s: %s" % (url, type(last).__name__, last))


def text_of(fragment: str) -> str:
    return re.sub(r"\s+", " ", html.unescape(TAG_RE.sub("", fragment))).strip()


def doc_group(url: str) -> str:
    """https://cables.gl/docs/5_writing_ops/dev_ops/dev_ops -> docs/5_writing_ops"""
    parts = url.split("/docs/", 1)[1].split("/")
    if len(parts) == 1:
        return "docs"
    return "docs/" + parts[0]


def op_namespace(name: str) -> str:
    """Ops.Gl.Meshes.Cube_v2 -> Ops.Gl.Meshes"""
    return name.rsplit(".", 1)[0]


def parse_sitemap(src: str) -> Tuple[List[str], List[str]]:
    locs = LOC_RE.findall(src)
    docs = [u for u in locs if u.startswith(BASE + "/docs/")]
    ops = [u.rsplit("/op/", 1)[1] for u in locs if u.startswith(BASE + "/op/")]
    return docs, ops


def parse_docs_index(src: str) -> Dict[str, str]:
    """url -> link text. The longest link text for a URL wins (nav repeats links)."""
    out = {}  # type: Dict[str, str]
    for href, inner in DOC_LINK_RE.findall(src):
        url = BASE + href
        title = text_of(inner)
        if len(title) > len(out.get(url, "")):
            out[url] = title
    return out


def parse_ops_index(src: str) -> Tuple[Dict[str, str], Dict[str, Dict[str, str]]]:
    """Returns (namespace -> description, op name -> {short, digest})."""
    namespaces = {}  # type: Dict[str, str]
    ops = {}  # type: Dict[str, Dict[str, str]]
    pieces = NS_SPLIT_RE.split(src)
    # pieces = [preamble, ns1, body1, ns2, body2, ...]
    for i in range(1, len(pieces) - 1, 2):
        ns, body = pieces[i], pieces[i + 1]
        m = NS_DESC_RE.search(body)
        namespaces[ns] = text_of(m.group(1)) if m else ""
        for name, short, digest in OP_RE.findall(body):
            ops[name] = {"short": text_of(short), "digest": text_of(digest)}
    return namespaces, ops


def load_state() -> dict:
    if not STATE_FILE.exists():
        return {}
    data = json.loads(STATE_FILE.read_text(encoding="utf-8"))
    if not isinstance(data, dict):
        raise SystemExit(
            "ERROR: %s holds a %s, expected a dict. Not overwriting it."
            % (STATE_FILE.name, type(data).__name__)
        )
    return data


def merge(state: dict, key: str, fresh: dict) -> bool:
    """Refresh descriptive fields; keep status / session / notes. True if new."""
    old = state.get(key)
    if old is None:
        entry = dict(fresh)
        entry.update({"status": "pending", "session": None, "notes": ""})
        state[key] = entry
        return True
    for k, v in fresh.items():
        if v or k not in old:
            old[k] = v
    old.setdefault("status", "pending")
    old.setdefault("session", None)
    old.setdefault("notes", "")
    old.pop("gone_from_site", None)
    return False


def enumerate_site() -> Tuple[dict, dict]:
    """Fetch and parse. Returns (fresh entries by key, counts). Raises FetchError."""
    sitemap = fetch(SITEMAP_URL)
    docs_index = fetch(DOCS_INDEX_URL)
    ops_index = fetch(OPS_INDEX_URL)

    sm_docs, sm_ops = parse_sitemap(sitemap)
    titles = parse_docs_index(docs_index)
    namespaces, idx_ops = parse_ops_index(ops_index)

    problems = []
    if len(sm_docs) < MIN_DOCS:
        problems.append(
            "sitemap yielded %d /docs/ pages (expected at least %d)" % (len(sm_docs), MIN_DOCS)
        )
    if len(sm_ops) < MIN_OPS:
        problems.append(
            "sitemap yielded %d /op/ pages (expected at least %d)" % (len(sm_ops), MIN_OPS)
        )
    if len(idx_ops) < MIN_OPS:
        problems.append(
            "op index yielded %d ops (expected at least %d); the page markup may have changed"
            % (len(idx_ops), MIN_OPS)
        )
    if not namespaces:
        problems.append("op index yielded no namespaces; the page markup may have changed")
    if problems:
        raise FetchError("pages fetched but did not parse: " + "; ".join(problems))

    fresh = {}  # type: Dict[str, dict]

    doc_urls = sorted(set(sm_docs) | set(titles))
    for url in doc_urls:
        fresh[url] = {
            "title": titles.get(url, url.rstrip("/").rsplit("/", 1)[1]),
            "url": url,
            "group": doc_group(url),
            "kind": "doc",
            "digest": "",
        }

    for ns in sorted(namespaces):
        fresh["namespace:" + ns] = {
            "title": ns,
            "url": BASE + "/ops/" + ns,
            "group": ns,
            "kind": "namespace",
            "digest": namespaces[ns],
        }

    sm_op_set = set(sm_ops)
    op_names = sorted(sm_op_set | set(idx_ops))
    for name in op_names:
        info = idx_ops.get(name, {})
        fresh[name] = {
            "title": info.get("short") or name.rsplit(".", 1)[1],
            "url": BASE + "/op/" + name,
            "group": op_namespace(name),
            "kind": "op",
            "digest": info.get("digest", ""),
            "listed_in": "+".join(
                s for s, present in (("sitemap", name in sm_op_set), ("opindex", name in idx_ops)) if present
            ),
        }

    counts = {
        "docs_in_sitemap": len(sm_docs),
        "docs_in_index": len(titles),
        "docs_total": len(doc_urls),
        "namespaces": len(namespaces),
        "ops_in_sitemap": len(sm_ops),
        "ops_in_index": len(idx_ops),
        "ops_total": len(op_names),
    }
    return fresh, counts


def status_summary(state: dict) -> None:
    by = {}  # type: Dict[Tuple[str, str], int]
    for info in state.values():
        k = (info.get("kind", "?"), info.get("status", "?"))
        by[k] = by.get(k, 0) + 1
    print("Total entries: %d" % len(state))
    for (kind, st) in sorted(by):
        print("  %-10s %-10s %5d" % (kind, st, by[(kind, st)]))
    groups = {}  # type: Dict[str, List[int]]
    for info in state.values():
        if info.get("kind") != "op":
            continue
        top = ".".join(info.get("group", "?").split(".")[:2])
        g = groups.setdefault(top, [0, 0])
        g[0] += 1
        if info.get("status") == "extracted":
            g[1] += 1
    print("\nOps by top-level namespace (total / extracted):")
    for top in sorted(groups):
        print("  %-22s %5d %5d" % (top, groups[top][0], groups[top][1]))


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--status", action="store_true", help="print coverage and exit")
    ap.add_argument("--dry-run", action="store_true", help="fetch and report, write nothing")
    args = ap.parse_args()

    state = load_state()
    if args.status:
        if not state:
            print("ERROR: %s does not exist or is empty; run without --status first." % STATE_FILE.name,
                  file=sys.stderr)
            return 1
        status_summary(state)
        return 0

    try:
        fresh, counts = enumerate_site()
    except FetchError as e:
        print("ERROR: enumeration failed, state file left untouched.\n  cause: %s" % e, file=sys.stderr)
        return 2

    added = 0
    for key, entry in fresh.items():
        if merge(state, key, entry):
            added += 1
    gone = [k for k in state if k not in fresh]
    for k in gone:
        state[k]["gone_from_site"] = True

    for k, v in sorted(counts.items()):
        print("%-18s %d" % (k, v))
    print("new entries        %d" % added)
    print("gone from site     %d (kept, flagged)" % len(gone))
    print("state entries      %d" % len(state))

    if args.dry_run:
        print("dry run: nothing written")
        return 0

    STATE_FILE.write_text(
        json.dumps(state, indent=1, ensure_ascii=False, sort_keys=True) + "\n", encoding="utf-8"
    )
    print("wrote %s" % STATE_FILE)
    return 0


if __name__ == "__main__":
    sys.exit(main())
