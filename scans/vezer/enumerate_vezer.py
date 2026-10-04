#!/usr/bin/env python3
"""
Enumerate the Vezér documentation into a crawl-state file.

Sources (verified 2026-10-03):
  * The official help pages: https://imimot.com/help/vezer (plain HTML pages on
    Imimot's own site, one page per topic). The script starts there and
    follows every link that stays under /help/vezer, breadth first.
  * Two extra pages from imimot.com: the Vezér product page and the
    "Vezér 1.9 released" blog post. Group "imimot.com".

Usage:
    python3 scans/vezer/enumerate_vezer.py            # enumerate + merge
    python3 scans/vezer/enumerate_vezer.py --status   # counts only
    python3 scans/vezer/enumerate_vezer.py --fetch DIR
        # also save each page's visible text to DIR, to read
    python3 scans/vezer/enumerate_vezer.py \
        --mark extracted --urls FILE --session 2026-10-03 --note "..."

State file (vezer_crawl_state.json), keyed by URL:
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
import urllib.parse
import urllib.request
from pathlib import Path

HERE = Path(__file__).parent
STATE_FILE = HERE / "vezer_crawl_state.json"

ROOT = "https://imimot.com/help/vezer"
PREFIX = ROOT  # follow links that start with this
USER_AGENT = "Claude2Max-doc-scan/1.0 (stdlib urllib; documentation index)"
PAUSE = 0.2
RETRIES = 3
MAX_PAGES = 200

EXTRA_PAGES = [
    ("https://imimot.com/vezer", "Vezér product page"),
    ("https://imimot.com/blog/vezer-1-9-released/", "Blog: Vezér 1.9 released"),
]

# Pages that are about licensing or the beta programme, not about the tool.
GROUPS = [
    ("/faq/license", "account"),
    ("/public-betas", "account"),
    ("/changelog", "changelog"),
    ("/faq", "faq"),
    ("/tutorials", "tutorials"),
]


class FetchError(Exception):
    pass


def get(url: str) -> str:
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    cause = ""
    for attempt in range(RETRIES):
        try:
            with urllib.request.urlopen(req, timeout=30) as resp:
                return resp.read().decode("utf-8", "replace")
        except urllib.error.HTTPError as e:
            cause = "HTTP %s" % e.code
            if e.code < 500 and e.code not in (403, 429):
                break
        except (urllib.error.URLError, OSError) as e:
            cause = "%s: %s" % (type(e).__name__, e)
        time.sleep(2 * (attempt + 1))
    raise FetchError("%s failed: %s" % (url, cause))


def norm(url: str) -> str:
    url = urllib.parse.urldefrag(url)[0]
    return url.rstrip("/") if url.count("/") > 3 else url


def title_of(page: str) -> str:
    m = re.search(r"<title>(.*?)</title>", page, re.S | re.I)
    t = html.unescape(m.group(1)).strip() if m else ""
    return re.sub(r"\s+", " ", t)


def visible_text(page: str) -> str:
    page = re.sub(r"(?is)<(script|style|nav|footer|header)\b.*?</\1>", " ", page)
    page = re.sub(r"(?i)<br\s*/?>|</p>|</li>|</h\d>|</tr>", "\n", page)
    page = re.sub(r"(?i)<h(\d)[^>]*>", lambda m: "\n" + "#" * int(m.group(1)) + " ", page)
    page = re.sub(r"(?i)<li[^>]*>", "- ", page)
    text = html.unescape(re.sub(r"<[^>]+>", " ", page))
    lines = [re.sub(r"[ \t]+", " ", ln).strip() for ln in text.splitlines()]
    return "\n".join(ln for ln in lines if ln)


def group_for(url: str) -> str:
    rest = url[len(ROOT):]
    for frag, group in GROUPS:
        if rest.startswith(frag):
            return group
    return "help" if rest else "home"


def enumerate_pages(fetch_dir=None) -> dict:
    pages, queue, seen = {}, [ROOT], {ROOT}
    while queue:
        url = queue.pop(0)
        page = get(url)
        time.sleep(PAUSE)
        pages[url] = {"title": title_of(page), "url": url, "group": group_for(url)}
        if fetch_dir is not None:
            save_text(fetch_dir, url, page)
        for href in re.findall(r'href="([^"]+)"', page):
            link = norm(urllib.parse.urljoin(url, html.unescape(href)))
            if link.startswith(PREFIX) and link not in seen:
                seen.add(link)
                queue.append(link)
        if len(seen) > MAX_PAGES:
            raise FetchError("more than %d links under %s; stopping" % (MAX_PAGES, PREFIX))
    if len(pages) < 2:
        raise FetchError("only %d page found under %s" % (len(pages), ROOT))
    for url, title in EXTRA_PAGES:
        page = get(url)
        if fetch_dir is not None:
            save_text(fetch_dir, url, page)
        pages[url] = {"title": title, "url": url, "group": "imimot.com"}
    return pages


def save_text(fetch_dir, url, page) -> None:
    name = re.sub(r"[^A-Za-z0-9]+", "_", url.split("://", 1)[1]).strip("_") + ".txt"
    dest = Path(fetch_dir) / name
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_text(visible_text(page), encoding="utf-8")


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
            "notes": old.get("notes", ""),
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
        print("  %-12s %-10s %d" % (grp, st, n))


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
