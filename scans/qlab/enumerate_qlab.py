#!/usr/bin/env python3
"""
Enumerate the QLab 5 documentation into a crawl-state file.

Sources (verified 2026-10-03):
  * The published docs: https://qlab.app/docs/v5/ (https://qlab.app/docs/
    redirects there). A Next.js site rendered on the server, so each page's
    HTML already holds its text.
  * Two lists of pages, merged: the navigation links on the doc root page
    (every href under /docs/v5/), and the <loc> entries under /docs/v5 in
    https://qlab.app/sitemap.xml. Neither list alone is complete, so both are
    read. Section index pages (/docs/v5/audio/ and so on) are kept; they are
    short overviews.

Usage:
    python3 scans/qlab/enumerate_qlab.py            # enumerate + merge
    python3 scans/qlab/enumerate_qlab.py --status   # counts only
    python3 scans/qlab/enumerate_qlab.py --fetch DIR
        # save every page's visible text to DIR (one .txt per page), to read
    python3 scans/qlab/enumerate_qlab.py \
        --mark extracted --urls FILE --session 2026-10-03 --note "..."

State file (qlab_crawl_state.json), keyed by public URL:
    {"title", "url", "group", "status": "pending"|"extracted"|"skipped",
     "session": "2026-10-03"|null, "notes"}

Re-running merges: status, session and notes already in the file are kept;
title and group are refreshed. A page that has left the docs is kept and its
notes gain "no longer listed". If any fetch fails the script exits non-zero
naming the cause, and never writes an empty or partial list.
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
STATE_FILE = HERE / "qlab_crawl_state.json"

SITE = "https://qlab.app"
ROOT = SITE + "/docs/v5/"
SITEMAP = SITE + "/sitemap.xml"
USER_AGENT = "Mozilla/5.0 (Claude2Max-doc-scan/1.0; stdlib urllib; documentation index)"
PAUSE = 0.1
RETRIES = 3


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


def normalize(path: str) -> str:
    path = path.split("#", 1)[0].split("?", 1)[0]
    if path.startswith(SITE):
        path = path[len(SITE):]
    if not path.endswith("/"):
        path += "/"
    return SITE + path


def group_for(url: str) -> str:
    rest = url[len(ROOT):].strip("/")
    return rest.split("/", 1)[0] if rest else "home"


def list_pages() -> list:
    urls = set()
    root = get(ROOT)
    for href in re.findall(r'href="(/docs/v5/[^"#?]*)', root):
        urls.add(normalize(href))
    sitemap = get(SITEMAP)
    for loc in re.findall(r"<loc>([^<]*)</loc>", sitemap):
        if "/docs/v5" in loc:
            urls.add(normalize(loc))
    urls.add(ROOT)
    if len(urls) < 20:
        raise FetchError("only %d doc pages found; the site layout may have changed" % len(urls))
    return sorted(urls)


def page_text(raw: str) -> tuple:
    m = re.search(r"<title>(.*?)</title>", raw, re.S)
    title = html.unescape(m.group(1)).strip() if m else ""
    title = re.sub(r"\s*[|\-–]\s*QLab.*$", "", title).strip()
    body = raw
    m = re.search(r"<main[^>]*>(.*)</main>", raw, re.S)
    if m:
        body = m.group(1)
    body = re.sub(r"<(script|style|svg|noscript)[^>]*>.*?</\1>", " ", body, flags=re.S)
    body = re.sub(r"<(br|/p|/h\d|/li|/tr|/div|/pre)[^>]*>", "\n", body)
    body = re.sub(r"<h(\d)[^>]*>", lambda mm: "\n" + "#" * int(mm.group(1)) + " ", body)
    body = re.sub(r"<li[^>]*>", "\n- ", body)
    body = re.sub(r"<[^>]+>", "", body)
    body = html.unescape(body)
    body = re.sub(r"[ \t]+", " ", body)
    body = re.sub(r"\n\s*\n+", "\n\n", body).strip()
    # The pages have no <main>: keep from the first top-level heading (the
    # page's own title) to the support footer, dropping the navigation.
    start = re.search(r"^# ", body, re.M)
    if start:
        body = body[start.start():]
    end = body.find("### Still have a question?")
    if end > 0:
        body = body[:end]
    return title, body.strip()


def slug(url: str) -> str:
    rest = url[len(ROOT):].strip("/")
    return (rest.replace("/", "__") or "index") + ".txt"


def enumerate_pages(fetch_dir=None) -> dict:
    pages = {}
    for url in list_pages():
        raw = get(url)
        time.sleep(PAUSE)
        title, body = page_text(raw)
        if fetch_dir is not None:
            dest = Path(fetch_dir) / slug(url)
            dest.parent.mkdir(parents=True, exist_ok=True)
            dest.write_text("URL: %s\nTITLE: %s\n\n%s\n" % (url, title, body), encoding="utf-8")
        pages[url] = {"title": title or url[len(ROOT):].strip("/"), "url": url,
                      "group": group_for(url), "empty": len(body) < 40}
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
            "status": old.get("status", "pending"),
            "session": old.get("session"),
            "notes": old.get("notes", "") or ("no text found on page" if p["empty"] else ""),
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
        print("  %-14s %-10s %d" % (grp, st, n))


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
