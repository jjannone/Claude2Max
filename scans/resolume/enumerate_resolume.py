#!/usr/bin/env python3
"""
Enumerate the Resolume manual (Arena / Avenue, plus Wire) into a crawl-state file.

Source (verified 2026-10-03):
  * The support index https://resolume.com/support/en lists every manual page,
    grouped under <h1> section headings (FAQ, Installing & Registering,
    Workflow, Content, Output, Controlling Resolume, Best Practices, Getting
    started with LED Strips, Nerds, Resolume Alley, Resolume Wire,
    Troubleshooting). Each page is https://resolume.com/support/en/<slug>.
  * https://resolume.com/support/wire is a Wire-only index; every link on it
    is also on the main index, so it is not read separately.
  * A page's text is inside its <main> element.
  * The two section index pages linked from the top navigation
    (/support/en/avenue-arena and /support/en/wire) are the index itself and
    are not listed as pages.
  * Two API references linked from the "REST API & Webserver" page, listed as
    EXTRA_PAGES (group "API reference"). Both are Swagger UI pages whose
    content is a swagger.yaml file in the same folder; the URL kept is the
    page's own. They are checked to exist but not saved by --fetch.

Usage:
    python3 scans/resolume/enumerate_resolume.py            # enumerate + merge
    python3 scans/resolume/enumerate_resolume.py --status   # counts only
    python3 scans/resolume/enumerate_resolume.py --fetch DIR
        # also save every page's main text to DIR/<slug>.txt, to read
    python3 scans/resolume/enumerate_resolume.py \
        --mark extracted --urls FILE --session 2026-10-03 --note "..."

State file (resolume_crawl_state.json), keyed by URL:
    {"title", "url", "group", "status": "pending"|"extracted"|"skipped",
     "session": "2026-10-03"|null, "notes"}

Re-running merges: status, session and notes already in the file are kept;
title and group are refreshed. A page that has left the index is kept and its
notes gain "no longer listed". If any fetch fails the script exits non-zero
naming the cause and leaves the state file unchanged.
Stdlib only; runs on Python 3.9.
"""
from __future__ import annotations

import argparse
import html
import json
import re
import sys
import time
import urllib.error
import urllib.request
from pathlib import Path

HERE = Path(__file__).parent
STATE_FILE = HERE / "resolume_crawl_state.json"

INDEX = "https://resolume.com/support/en"
PAGE_PREFIX = "https://resolume.com/support/en/"
USER_AGENT = "Mozilla/5.0 (Claude2Max-doc-scan/1.0; stdlib urllib; documentation index)"
PAUSE = 0.2
RETRIES = 3

EXTRA_PAGES = [
    ("https://resolume.com/docs/restapi/",
     "Arena & Avenue REST API reference (swagger.yaml)",
     "https://resolume.com/docs/restapi/swagger.yaml"),
    ("https://resolume.com/docs/wirerestapi/",
     "Wire REST API reference (Swagger UI)",
     "https://resolume.com/docs/wirerestapi/"),
]


class FetchError(Exception):
    pass


def get(url: str) -> str:
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    cause = ""
    for attempt in range(RETRIES):
        try:
            with urllib.request.urlopen(req, timeout=60) as resp:
                return resp.read().decode("utf-8", "replace")
        except urllib.error.HTTPError as e:
            cause = "HTTP %s" % e.code
            if e.code < 500 and e.code not in (403, 429):
                break
        except (urllib.error.URLError, OSError) as e:
            cause = "%s: %s" % (type(e).__name__, e)
        time.sleep(2 * (attempt + 1))
    raise FetchError("%s failed: %s" % (url, cause))


def strip_tags(fragment: str) -> str:
    fragment = re.sub(r"<(script|style)[^>]*>.*?</\1>", " ", fragment, flags=re.S)
    fragment = re.sub(r"<br\s*/?>|</(p|li|h\d|tr|div|pre)>", "\n", fragment)
    fragment = re.sub(r"<li[^>]*>", "- ", fragment)
    fragment = re.sub(r"<h(\d)[^>]*>", lambda m: "\n" + "#" * int(m.group(1)) + " ", fragment)
    text = html.unescape(re.sub(r"<[^>]+>", "", fragment))
    text = re.sub(r"[ \t]+", " ", text)
    return re.sub(r"\n\s*\n+", "\n\n", text).strip()


def parse_index(page: str) -> dict:
    """Return {url: {"title", "group"}} from the support index."""
    heads = [(m.start(), html.unescape(m.group(1)).strip())
             for m in re.finditer(r"<h1[^>]*>(.*?)</h1>", page, re.S)]
    if not heads:
        raise FetchError("support index has no <h1> section headings")
    pages = {}
    for i, (start, group) in enumerate(heads):
        end = heads[i + 1][0] if i + 1 < len(heads) else len(page)
        chunk = page[start:end]
        for m in re.finditer(r'<a[^>]*href="(https://resolume\.com/support/en/[^"#?]+)"[^>]*>(.*?)</a>',
                             chunk, re.S):
            url = m.group(1).rstrip("/")
            title = re.sub(r"\s+", " ", strip_tags(m.group(2))).strip()
            # Each card links twice: an image link (no text), then the title.
            if url not in pages:
                pages[url] = {"title": title, "group": group}
            elif title and not pages[url]["title"]:
                pages[url]["title"] = title
    for url, p in pages.items():
        if not p["title"]:
            p["title"] = url.rsplit("/", 1)[1]
    if not pages:
        raise FetchError("support index held no manual links")
    return pages


def page_text(page: str) -> tuple:
    m = re.search(r"<main[^>]*>(.*?)</main>", page, re.S)
    body = m.group(1) if m else page
    t = re.search(r"<title>(.*?)</title>", page, re.S)
    title = html.unescape(t.group(1)).strip() if t else ""
    return title, strip_tags(body)


def enumerate_pages(fetch_dir=None) -> dict:
    pages = parse_index(get(INDEX))
    for url, title, check in EXTRA_PAGES:
        get(check)  # raises FetchError if it is gone
        pages[url] = {"title": title, "group": "API reference"}
    if fetch_dir is not None:
        out = Path(fetch_dir)
        out.mkdir(parents=True, exist_ok=True)
        for url in sorted(pages):
            if not url.startswith(PAGE_PREFIX):
                continue
            title, text = page_text(get(url))
            time.sleep(PAUSE)
            slug = url[len(PAGE_PREFIX):]
            (out / (slug + ".txt")).write_text("URL: %s\nTITLE: %s\n\n%s\n" % (url, title, text),
                                              encoding="utf-8")
            pages[url]["empty"] = len(text) < 80
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
        notes = old.get("notes", "") or ("page text nearly empty" if p.get("empty") else "")
        state[url] = {
            "title": p["title"], "url": url, "group": p["group"],
            "status": old.get("status", "pending"),
            "session": old.get("session"),
            "notes": notes,
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
        print("  %-32s %-10s %d" % (grp, st, n))


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
