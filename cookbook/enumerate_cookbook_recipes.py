#!/usr/bin/env python3
"""
Enumerate Max Cookbook recipes (Christopher Dobrian / UC Irvine) and download
their attached example patches. Used by the Max Cookbook Analysis task — see
TASK_QUEUE.md and COOKBOOK_CRAWL_LOG.md.

The cookbook lists 741 recipes alphabetically at
https://music.arts.uci.edu/dobrian/maxcookbook/examples but each recipe page
also carries a "Chapter" taxonomy field (MSP, Jitter, MIDI, etc.) and a
"Keywords" list. Insights live in the patches themselves, not just the page
text — every recipe must have its attachments downloaded and read in full.

Usage:
    # Bootstrap the state file from the alphabetical examples list
    python3 cookbook/enumerate_cookbook_recipes.py --bootstrap

    # Enumerate metadata (chapter, keywords, attachments) for unscanned recipes
    python3 cookbook/enumerate_cookbook_recipes.py --scan-meta --limit 20

    # Download attachments for scanned recipes that haven't been downloaded
    python3 cookbook/enumerate_cookbook_recipes.py --download --limit 20

    # Filter to a single chapter
    python3 cookbook/enumerate_cookbook_recipes.py --scan-meta --chapter MSP

    # Show coverage summary
    python3 cookbook/enumerate_cookbook_recipes.py --status

State file format (cookbook_crawl_state.json):
    {
      "<slug>": {
        "title": "...",
        "url": "https://music.arts.uci.edu/dobrian/maxcookbook/<slug>",
        "chapter": "MSP" | null,
        "keywords": ["abstraction", "triangle~"] | null,
        "attachments": [{"filename": "pinger.maxpat", "url": "..."}],
        "body_text": "...",  # plain-text body, for cross-reference
        "status": "pending" | "scanned" | "downloaded" | "scraped" | "skipped",
        "downloads_dir": "/tmp/cookbook/<slug>/" | null,
        "scraped_at": "2026-05-01" | null
      }
    }

Status flow: pending → scanned (page metadata fetched) → downloaded
(attachments saved to /tmp/cookbook/<slug>/) → scraped (insights extracted to
cookbook_insights.md). `skipped` is for recipes with no patch attachment.
"""
from __future__ import annotations

import argparse
import html
import json
import re
import sys
import time
import urllib.parse
import urllib.request
from pathlib import Path

COOKBOOK_BASE = "https://music.arts.uci.edu/dobrian/maxcookbook"
EXAMPLES_URL = f"{COOKBOOK_BASE}/examples"
HERE = Path(__file__).resolve().parent
STATE_FILE = HERE / "cookbook_crawl_state.json"
DOWNLOAD_ROOT = Path("/tmp/cookbook")

# Markup patterns from the Drupal site — verified against
# /dobrian/maxcookbook/beeping-test-sound on 2026-05-01.
TITLE_RE = re.compile(r'<h1 class="page-header">(.+?)</h1>', re.DOTALL)
ATTACH_RE = re.compile(
    r'<a href="(https://music\.arts\.uci\.edu/dobrian/maxcookbook/system/files_force/[^"]+)"'
    r'[^>]*type="application/[^"]+"[^>]*>([^<]+)</a>'
)
CHAPTER_RE = re.compile(
    r'field-name-field-chapter[^<]*<div class="field-label">[^<]*</div>'
    r'<div class="field-items">(.*?)</div></div>',
    re.DOTALL,
)
KEYWORDS_RE = re.compile(
    r'field-name-field-keywords[^<]*<div class="field-label">[^<]*</div>'
    r'<div class="field-items">(.*?)</div></div>',
    re.DOTALL,
)
LINK_TEXT_RE = re.compile(r'<a [^>]*>([^<]+)</a>')
BODY_RE = re.compile(
    r'field-name-body[^<]*<div class="field-items"><div class="field-item even">(.*?)</div></div></div>',
    re.DOTALL,
)
TAG_RE = re.compile(r"<[^>]+>")


def fetch(url: str, retries: int = 2) -> str:
    last_err: Exception | None = None
    for attempt in range(retries + 1):
        try:
            req = urllib.request.Request(
                url, headers={"User-Agent": "Claude2Max-cookbook-crawl/1.0"}
            )
            with urllib.request.urlopen(req, timeout=30) as resp:
                return resp.read().decode("utf-8", errors="replace")
        except Exception as e:
            last_err = e
            time.sleep(1 + attempt)
    raise RuntimeError(f"fetch failed for {url}: {last_err}")


def fetch_bytes(url: str, retries: int = 2) -> bytes:
    last_err: Exception | None = None
    for attempt in range(retries + 1):
        try:
            req = urllib.request.Request(
                url, headers={"User-Agent": "Claude2Max-cookbook-crawl/1.0"}
            )
            with urllib.request.urlopen(req, timeout=60) as resp:
                return resp.read()
        except Exception as e:
            last_err = e
            time.sleep(1 + attempt)
    raise RuntimeError(f"fetch failed for {url}: {last_err}")


def strip_html(s: str) -> str:
    return html.unescape(TAG_RE.sub("", s)).strip()


def parse_recipe_page(src: str, slug: str) -> dict:
    """Extract chapter/keywords/attachments/body from one recipe HTML page."""
    out: dict = {}

    if m := TITLE_RE.search(src):
        out["title_from_page"] = strip_html(m.group(1))

    if m := CHAPTER_RE.search(src):
        chapter_html = m.group(1)
        chapters = LINK_TEXT_RE.findall(chapter_html)
        out["chapter"] = chapters[0] if chapters else None
    else:
        out["chapter"] = None

    if m := KEYWORDS_RE.search(src):
        kw_html = m.group(1)
        out["keywords"] = LINK_TEXT_RE.findall(kw_html)
    else:
        out["keywords"] = []

    out["attachments"] = [
        {"url": url, "filename": fname} for url, fname in ATTACH_RE.findall(src)
    ]

    if m := BODY_RE.search(src):
        out["body_text"] = strip_html(m.group(1))[:2000]
    else:
        out["body_text"] = ""

    return out


def load_state() -> dict:
    if not STATE_FILE.exists():
        return {}
    return json.loads(STATE_FILE.read_text())


def save_state(state: dict) -> None:
    STATE_FILE.write_text(json.dumps(state, indent=2, ensure_ascii=False) + "\n")


def bootstrap(raw_path: Path) -> None:
    """Populate state from the alphabetical examples list."""
    raw = json.loads(raw_path.read_text())
    state = load_state()
    added = 0
    for r in raw:
        slug = r["slug"]
        if slug in state:
            continue
        state[slug] = {
            "title": r["title"],
            "url": f"{COOKBOOK_BASE}/{slug}",
            "n": r["n"],
            "chapter": None,
            "keywords": None,
            "attachments": [],
            "body_text": "",
            "status": "pending",
            "downloads_dir": None,
            "scraped_at": None,
        }
        added += 1
    save_state(state)
    print(f"bootstrap: added {added} recipes; state now has {len(state)} entries")


def scan_meta(state: dict, limit: int, chapter_filter: str | None) -> int:
    """Fetch page metadata for pending recipes."""
    pending = [
        slug for slug, info in state.items()
        if info["status"] == "pending"
        or (info["status"] == "scanned" and not info.get("attachments"))
    ]
    if chapter_filter:
        pending = [s for s in pending if state[s].get("chapter") == chapter_filter]

    if limit > 0:
        pending = pending[:limit]
    print(f"scan-meta: {len(pending)} recipes queued", file=sys.stderr)

    scanned = 0
    for slug in pending:
        info = state[slug]
        try:
            html_src = fetch(info["url"])
        except Exception as e:
            print(f"  ERR {slug}: {e}", file=sys.stderr)
            continue
        meta = parse_recipe_page(html_src, slug)
        info["chapter"] = meta["chapter"]
        info["keywords"] = meta["keywords"]
        info["attachments"] = meta["attachments"]
        info["body_text"] = meta["body_text"]
        info["status"] = "scanned" if meta["attachments"] else "skipped"
        scanned += 1
        if scanned % 10 == 0:
            print(f"  ... {scanned} scanned", file=sys.stderr)
            save_state(state)
        time.sleep(0.3)  # be polite to the server
    save_state(state)
    return scanned


def download(state: dict, limit: int, chapter_filter: str | None) -> int:
    """Download attachments for scanned recipes."""
    queue = [
        slug for slug, info in state.items()
        if info["status"] == "scanned" and info.get("attachments")
    ]
    if chapter_filter:
        queue = [s for s in queue if state[s].get("chapter") == chapter_filter]

    if limit > 0:
        queue = queue[:limit]
    print(f"download: {len(queue)} recipes queued", file=sys.stderr)

    downloaded = 0
    for slug in queue:
        info = state[slug]
        target = DOWNLOAD_ROOT / slug
        target.mkdir(parents=True, exist_ok=True)
        ok = True
        for att in info["attachments"]:
            outpath = target / att["filename"]
            if outpath.exists() and outpath.stat().st_size > 0:
                continue
            try:
                data = fetch_bytes(att["url"])
                outpath.write_bytes(data)
                print(f"  + {slug}/{att['filename']} ({len(data)} B)", file=sys.stderr)
            except Exception as e:
                print(f"  ERR {slug}/{att['filename']}: {e}", file=sys.stderr)
                ok = False
        if ok:
            info["status"] = "downloaded"
            info["downloads_dir"] = str(target)
            downloaded += 1
        time.sleep(0.3)
    save_state(state)
    return downloaded


def status_summary(state: dict) -> None:
    by_status: dict[str, int] = {}
    by_chapter: dict[str, int] = {}
    by_chapter_status: dict[tuple[str, str], int] = {}
    for slug, info in state.items():
        st = info["status"]
        by_status[st] = by_status.get(st, 0) + 1
        ch = info.get("chapter") or "(unscanned)"
        by_chapter[ch] = by_chapter.get(ch, 0) + 1
        by_chapter_status[(ch, st)] = by_chapter_status.get((ch, st), 0) + 1

    print(f"Total recipes in state: {len(state)}\n")
    print("By status:")
    for st in sorted(by_status):
        print(f"  {st:12s} {by_status[st]:4d}")
    print("\nBy chapter:")
    for ch in sorted(by_chapter):
        print(f"  {ch:30s} {by_chapter[ch]:4d}")
    print("\nBy chapter × status:")
    for (ch, st) in sorted(by_chapter_status):
        print(f"  {ch:30s} {st:12s} {by_chapter_status[(ch, st)]:4d}")


def main() -> int:
    p = argparse.ArgumentParser()
    p.add_argument("--bootstrap", action="store_true",
                   help="Populate state from /tmp/cookbook_recipes_raw.json")
    p.add_argument("--bootstrap-from", default="/tmp/cookbook_recipes_raw.json",
                   help="Path to the alphabetical recipe list JSON")
    p.add_argument("--scan-meta", action="store_true",
                   help="Fetch chapter/keywords/attachments for pending recipes")
    p.add_argument("--download", action="store_true",
                   help="Download attachments for scanned recipes")
    p.add_argument("--limit", type=int, default=0,
                   help="Cap how many recipes to process this run (0 = no cap)")
    p.add_argument("--chapter", default=None,
                   help="Filter to one chapter (e.g. MSP, Jitter, MIDI)")
    p.add_argument("--status", action="store_true",
                   help="Print coverage summary and exit")
    args = p.parse_args()

    if args.status:
        status_summary(load_state())
        return 0

    if args.bootstrap:
        bootstrap(Path(args.bootstrap_from))

    state = load_state()

    if args.scan_meta:
        n = scan_meta(state, args.limit, args.chapter)
        print(f"scan-meta done: {n} recipes scanned")

    if args.download:
        n = download(state, args.limit, args.chapter)
        print(f"download done: {n} recipes downloaded")

    return 0


if __name__ == "__main__":
    sys.exit(main())
