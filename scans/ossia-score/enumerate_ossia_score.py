#!/usr/bin/env python3
"""
Enumerate the ossia score documentation into a crawl-state file.

Sources (verified 2026-10-03):
  * The published docs: https://ossia.io/score-docs/ (a Jekyll "just-the-docs"
    site served from GitHub Pages).
  * Their Markdown source: the GitHub repo ossia/score-docs, branch master.
    Each page's public URL is its front-matter `permalink`, which does NOT
    follow the repo path (docs/reference-manual/processes/library/scenario.md
    is published at /score-docs/processes/scenario.html), so the script reads
    every page's front matter to build the URL.
  * Four extra pages from ossia.io: the libossia API reference (ossia-docs,
    which covers the Max binding ossia-max), the libossia Max and OSCQuery
    feature stubs and the shared address model. Group "ossia.io".

Usage:
    python3 scans/ossia-score/enumerate_ossia_score.py            # enumerate + merge
    python3 scans/ossia-score/enumerate_ossia_score.py --status   # counts only
    python3 scans/ossia-score/enumerate_ossia_score.py --fetch DIR
        # save every page's raw Markdown to DIR (named by repo path), to read
    python3 scans/ossia-score/enumerate_ossia_score.py \
        --mark extracted --urls FILE --session 2026-10-03 --note "..."

State file (ossia_score_crawl_state.json), keyed by public URL:
    {"title", "url", "group", "source_path", "status": "pending"|"extracted"|"skipped",
     "session": "2026-10-03"|null, "notes"}

Re-running merges: status, session and notes already in the file are kept;
title, group and source_path are refreshed. A page that has left the docs is
kept and its notes gain "no longer listed". If any fetch fails the script
exits non-zero naming the cause, and never writes an empty or partial list.
Stdlib only; runs on Python 3.9.
"""
from __future__ import annotations

import argparse
import json
import re
import sys
import time
import urllib.error
import urllib.request
from pathlib import Path

HERE = Path(__file__).parent
STATE_FILE = HERE / "ossia_score_crawl_state.json"

REPO = "ossia/score-docs"
BRANCH = "master"
TREE_API = "https://api.github.com/repos/%s/git/trees/%s?recursive=1" % (REPO, BRANCH)
RAW = "https://raw.githubusercontent.com/%s/%s/" % (REPO, BRANCH)
SITE = "https://ossia.io/score-docs"
USER_AGENT = "Claude2Max-doc-scan/1.0 (stdlib urllib; documentation index)"
PAUSE = 0.05
RETRIES = 3

EXTRA_PAGES = [
    ("https://ossia.io/site-libossia/features/max.html", "libossia: Max (ossia-max)"),
    ("https://ossia.io/score/features/addresses.html", "score feature: addresses"),
    ("https://ossia.io/site-libossia/features/oscquery.html", "libossia: OSCQuery"),
    ("https://ossia.io/ossia-docs/", "libossia API reference (all bindings, incl. Max)"),
]

# Repo-path prefix -> group. First match wins.
PATH_GROUPS = [
    ("docs/quick-start/", "quick start"),
    ("docs/in-depth/", "in depth"),
    ("docs/common-practices/", "common practices"),
    ("docs/reference-manual/processes/", "processes"),
    ("docs/reference-manual/devices/", "devices"),
    ("docs/reference-manual/panels/", "panels"),
    ("docs/reference-manual/references/", "reference"),
    ("docs/reference-manual/", "reference"),
    ("docs/examples/", "examples"),
    ("docs/faq/", "faq"),
    ("docs/integrations/", "integrations"),
    ("docs/development/", "development"),
    ("docs/troubleshooting.md", "faq"),
    ("index.md", "home"),
]


class FetchError(Exception):
    pass


def get(url: str) -> bytes:
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    cause = ""
    for attempt in range(RETRIES):
        try:
            with urllib.request.urlopen(req, timeout=60) as resp:
                return resp.read()
        except urllib.error.HTTPError as e:
            cause = "HTTP %s" % e.code
            if e.code < 500 and e.code not in (403, 429):
                break
        except (urllib.error.URLError, OSError) as e:
            cause = "%s: %s" % (type(e).__name__, e)
        time.sleep(2 * (attempt + 1))
    raise FetchError("%s failed: %s" % (url, cause))


def group_for(path: str) -> str:
    for prefix, group in PATH_GROUPS:
        if path.startswith(prefix):
            return group
    return "other"


def front_matter(text: str) -> dict:
    m = re.match(r"^---\s*\n(.*?)\n---", text, re.S)
    out = {}
    if not m:
        return out
    for line in m.group(1).splitlines():
        if ":" in line and not line.startswith(" "):
            k, v = line.split(":", 1)
            out[k.strip()] = v.strip().strip('"').strip("'")
    return out


def list_doc_paths() -> list:
    data = json.loads(get(TREE_API).decode("utf-8"))
    if data.get("truncated"):
        raise FetchError("GitHub tree listing came back truncated")
    paths = [t["path"] for t in data.get("tree", [])
             if t["path"].endswith(".md")
             and (t["path"].startswith("docs/") or t["path"] in ("index.md",))]
    if not paths:
        raise FetchError("GitHub tree listing held no Markdown pages")
    return sorted(paths)


def enumerate_pages(fetch_dir=None) -> dict:
    pages = {}
    for path in list_doc_paths():
        text = get(RAW + path).decode("utf-8", "replace")
        time.sleep(PAUSE)
        if fetch_dir is not None:
            dest = Path(fetch_dir) / path
            dest.parent.mkdir(parents=True, exist_ok=True)
            dest.write_text(text, encoding="utf-8")
        fm = front_matter(text)
        permalink = fm.get("permalink", "")
        if permalink:
            url = SITE + ("" if permalink.startswith("/") else "/") + permalink
        else:
            url = SITE + "/" + path.replace("docs/", "", 1).replace(".md", ".html")
        if url.endswith("/index.html") or path == "index.md":
            url = SITE + "/"
        title = fm.get("title") or Path(path).stem
        pages[url] = {"title": title, "url": url, "group": group_for(path),
                      "source_path": path, "empty": len(text.strip()) == 0}
    for url, title in EXTRA_PAGES:
        pages[url] = {"title": title, "url": url, "group": "ossia.io",
                      "source_path": "", "empty": False}
    return pages


def load_state() -> dict:
    if STATE_FILE.exists():
        return json.loads(STATE_FILE.read_text(encoding="utf-8"))
    return {}


def save_state(state: dict) -> None:
    STATE_FILE.write_text(json.dumps(state, indent=2, ensure_ascii=False) + "\n",
                          encoding="utf-8")


def merge(state: dict, pages: dict) -> dict:
    for url, p in pages.items():
        old = state.get(url, {})
        state[url] = {
            "title": p["title"], "url": url, "group": p["group"],
            "source_path": p["source_path"],
            "status": old.get("status", "pending"),
            "session": old.get("session"),
            "notes": old.get("notes", "") or ("empty source file" if p["empty"] else ""),
        }
    for url, entry in state.items():
        if url not in pages and "no longer listed" not in entry.get("notes", ""):
            entry["notes"] = (entry.get("notes", "") + " no longer listed").strip()
    return dict(sorted(state.items()))


def status(state: dict) -> None:
    from collections import Counter
    c = Counter(e["status"] for e in state.values())
    print("pages: %d  %s" % (len(state), dict(c)))
    g = Counter((e["group"], e["status"]) for e in state.values())
    for (grp, st), n in sorted(g.items()):
        print("  %-18s %-10s %d" % (grp, st, n))


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--status", action="store_true")
    ap.add_argument("--fetch", metavar="DIR")
    ap.add_argument("--mark", choices=["pending", "extracted", "skipped"])
    ap.add_argument("--urls", metavar="FILE")
    ap.add_argument("--session")
    ap.add_argument("--note", default="")
    a = ap.parse_args()

    state = load_state()
    if a.status:
        status(state)
        return 0
    if a.mark:
        if not a.urls:
            print("--mark needs --urls FILE", file=sys.stderr)
            return 2
        urls = [u.strip() for u in Path(a.urls).read_text().splitlines() if u.strip()]
        missing = [u for u in urls if u not in state]
        if missing:
            print("not in state file: %s" % missing, file=sys.stderr)
            return 1
        for u in urls:
            state[u]["status"] = a.mark
            state[u]["session"] = a.session
            if a.note:
                state[u]["notes"] = a.note
        save_state(state)
        print("marked %d as %s" % (len(urls), a.mark))
        return 0
    try:
        pages = enumerate_pages(a.fetch)
    except FetchError as e:
        print("enumeration failed, state file left unchanged: %s" % e, file=sys.stderr)
        return 1
    save_state(merge(state, pages))
    status(load_state())
    return 0


if __name__ == "__main__":
    sys.exit(main())
