#!/usr/bin/env python3
"""
Enumerate MadMapper's official documentation and keep the crawl state file.

Four sources are enumerated:

1. The manual at https://docs.madmapper.com/ ("Madmapper Documentations").
   Its landing page carries the full table of contents as <li> items with
   data-page-title / data-page-href attributes, of the form
   /madmapper/<version>/<chapter>/<page>, so one fetch lists every page.
   With --deep each page is fetched as well and scanned for manual links the
   landing page did not list.
2. The product pages named in https://madmapper.com/sitemap.xml (features,
   extensions, miniMAD, tutorials, FAQ). Group "website".
3. The PDF guides linked from the tutorial index pages on madmapper.com
   (numbered tutorial guides, MadLaser Guide, MiniMad user guide, ...).
   Group "pdf-guide". Only the links are listed; the PDFs are not downloaded.
4. The Markdown documents in the GitHub repository
   madmappersoftware/MadMapper-Materials, which the manual points to for the
   Materials, Surface FX and Laser Materials shader formats. Group
   "github-materials". The shader source folders themselves are not listed.

Usage:
    python3 scans/madmapper/enumerate_madmapper.py            # enumerate + merge
    python3 scans/madmapper/enumerate_madmapper.py --deep     # also scan each page for links
    python3 scans/madmapper/enumerate_madmapper.py --cache DIR  # also save each page as text in DIR
    python3 scans/madmapper/enumerate_madmapper.py --status   # counts only, no network

State file (madmapper_crawl_state.json), keyed by page URL:
    {"title", "url", "group", "status": "pending"|"extracted"|"skipped",
     "session": "YYYY-MM-DD" | null, "notes"}

Merging never touches "status", "session" or "notes" of an entry already in
the file. A page that was in the file and is no longer listed by the source is
kept and gets "listed": false so the disappearance is visible.

If a fetch of any index fails, the script prints the cause and exits
non-zero WITHOUT writing the state file. An empty or shrunken list is never
written in place of a failed fetch.

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

HERE = Path(__file__).resolve().parent
STATE_FILE = HERE / "madmapper_crawl_state.json"

DOCS_ROOT = "https://docs.madmapper.com/"
SITEMAP_URL = "https://madmapper.com/sitemap.xml"
UA = "Mozilla/5.0 (Claude2Max doc scan; stdlib urllib)"

# Pages on madmapper.com that link the PDF guides (checked 2026-10-02).
PDF_INDEX_PAGES = [
    "https://madmapper.com/madmapper/tutorials",
    "https://madmapper.com/extensions/tutorials",
    "https://madmapper.com/minimad/tutorials",
    "https://madmapper.com/minimad/userguides",
    "https://madmapper.com/learning/tutorials",
]
PDF_LINK_RE = re.compile(r'href="([^"]+\.pdf)"', re.IGNORECASE)

# The shader-format documentation the manual links to.
GITHUB_REPO = "madmappersoftware/MadMapper-Materials"
GITHUB_TREE_URL = f"https://api.github.com/repos/{GITHUB_REPO}/git/trees/HEAD?recursive=1"
GITHUB_RAW_ROOT = f"https://raw.githubusercontent.com/{GITHUB_REPO}/HEAD/"

# Verified against the landing page on 2026-10-02. The table of contents is a
# list of <li data-page-title="Title" data-page-href="/madmapper/6/..."> items,
# not <a> links; 99 of them. Links inside page bodies are ordinary <a href>.
# Both shapes are read, so a change to either one still leaves the other.
TOC_ITEM_RE = re.compile(r'data-page-title="([^"]*)"\s+data-page-href="(/madmapper/[^"#?]+)"')
MANUAL_LINK_RE = re.compile(r'<a\b[^>]*href="(/madmapper/[^"#?]+)"[^>]*>(.*?)</a>', re.DOTALL)
SITEMAP_LOC_RE = re.compile(r"<loc>\s*([^<\s]+)\s*</loc>")
H1_RE = re.compile(r"<h1\b[^>]*>(.*?)</h1>", re.DOTALL)
MAIN_RE = re.compile(r"<main\b[^>]*>(.*?)</main>", re.DOTALL)
TAG_RE = re.compile(r"<[^>]+>")

# Sitemap pages that are not documentation at all.
WEBSITE_SKIP = {
    "privacy_policy": "legal page, not documentation",
    "legal_mentions": "legal page, not documentation",
    "aboutus": "company page, not documentation",
    "gallery": "project gallery, not documentation",
    "usersmeetup": "event page, not documentation",
    "user_talks_for_the_meetup": "event page, not documentation",
    "educational-offer": "pricing page, not documentation",
    "support": "support contact page, not documentation",
    "madbundle": "pricing bundle page, not documentation",
}


class FetchError(Exception):
    pass


def fetch(url: str, timeout: int = 30) -> str:
    """Return the body of `url` as text, or raise FetchError naming the cause."""
    # The apostrophe stays literal: the docs server answers 404 to "what%27s-new"
    # and 200 to "what's-new" (checked with curl, 2026-10-02).
    quoted = urllib.parse.quote(url, safe=":/?&=%#'")
    req = urllib.request.Request(quoted, headers={"User-Agent": UA})
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            status = getattr(resp, "status", 200)
            body = resp.read()
    except urllib.error.HTTPError as exc:
        raise FetchError(f"HTTP {exc.code} for {url}") from exc
    except (urllib.error.URLError, OSError) as exc:
        raise FetchError(f"{type(exc).__name__} for {url}: {exc}") from exc
    if status != 200:
        raise FetchError(f"HTTP {status} for {url}")
    if not body:
        raise FetchError(f"empty body for {url}")
    return body.decode("utf-8", errors="replace")


def clean(text: str) -> str:
    return re.sub(r"\s+", " ", html.unescape(TAG_RE.sub("", text))).strip()


def manual_links(page_html: str) -> dict:
    """Map absolute manual URL -> link text for every manual link in a page."""
    found = {}
    pairs = [(href, title) for title, href in TOC_ITEM_RE.findall(page_html)]
    pairs += MANUAL_LINK_RE.findall(page_html)
    for href, label in pairs:
        href = html.unescape(href).rstrip("/")
        url = urllib.parse.urljoin(DOCS_ROOT, href)
        title = clean(label)
        if url not in found or (title and not found[url]):
            found[url] = title
    return found


def manual_group(url: str) -> str:
    """Chapter folder of a manual URL, e.g. '6.-outputs'; 'manual' if none."""
    parts = urllib.parse.urlparse(url).path.strip("/").split("/")
    # parts: ["madmapper", "<version>", "<chapter>", ...]
    return parts[2] if len(parts) > 2 else "manual"


def page_text(page_html: str) -> str:
    """Plain text of a manual page's <main>, with headings kept on own lines."""
    m = MAIN_RE.search(page_html)
    body = m.group(1) if m else page_html
    # The table of contents is repeated inside <main> on every page. The page's
    # own text starts after the last TOC item.
    last_toc = body.rfind("data-page-href=")
    if last_toc != -1:
        start = body.find("</li>", last_toc)
        body = body[start if start != -1 else last_toc:]
    body = re.sub(r"<(script|style)\b.*?</\1>", "", body, flags=re.DOTALL)
    body = re.sub(r"<h([1-6])\b[^>]*>", lambda g: "\n\n" + "#" * int(g.group(1)) + " ", body)
    body = re.sub(r"<li\b[^>]*>", "\n- ", body)
    body = re.sub(r"<(p|div|tr|table|ul|ol|pre|br)\b[^>]*>", "\n", body)
    body = re.sub(r"</(td|th)>", " | ", body)
    body = html.unescape(TAG_RE.sub("", body))
    body = re.sub(r"[ \t]+", " ", body)
    return re.sub(r"\n\s*\n\s*", "\n\n", body).strip()


def cache_name(url: str) -> str:
    path = urllib.parse.urlparse(url).path.strip("/") or "index"
    return re.sub(r"[^A-Za-z0-9._-]+", "_", path) + ".txt"


def load_state() -> dict:
    if not STATE_FILE.exists():
        return {}
    data = json.loads(STATE_FILE.read_text(encoding="utf-8"))
    if type(data) is not dict:
        raise SystemExit(f"ERROR: {STATE_FILE.name} is a {type(data).__name__}, expected a dict")
    return data


def print_status(state: dict) -> None:
    by_status, by_group = {}, {}
    for entry in state.values():
        by_status[entry.get("status")] = by_status.get(entry.get("status"), 0) + 1
        by_group[entry.get("group")] = by_group.get(entry.get("group"), 0) + 1
    print(f"{len(state)} pages in {STATE_FILE.name}")
    for key in sorted(by_status, key=str):
        print(f"  status {key}: {by_status[key]}")
    for key in sorted(by_group, key=str):
        print(f"  group  {key}: {by_group[key]}")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--deep", action="store_true",
                    help="fetch every manual page and add manual links the landing page did not list")
    ap.add_argument("--cache", metavar="DIR",
                    help="save each manual page's text into DIR (implies fetching every page)")
    ap.add_argument("--status", action="store_true", help="print counts from the state file and exit")
    ap.add_argument("--delay", type=float, default=0.3, help="seconds between page fetches")
    args = ap.parse_args()

    state = load_state()
    if args.status:
        print_status(state)
        return 0

    # --- the index fetches: a failure in any of them writes nothing -------
    try:
        root_html = fetch(DOCS_ROOT)
    except FetchError as exc:
        print(f"ERROR: could not fetch the manual's table of contents: {exc}", file=sys.stderr)
        print("State file left unchanged.", file=sys.stderr)
        return 2
    manual = manual_links(root_html)
    if not manual:
        print(f"ERROR: {DOCS_ROOT} loaded but no /madmapper/ links were found in it. "
              "The page layout may have changed. State file left unchanged.", file=sys.stderr)
        return 3

    try:
        sitemap_xml = fetch(SITEMAP_URL)
    except FetchError as exc:
        print(f"ERROR: could not fetch the website sitemap: {exc}", file=sys.stderr)
        print("State file left unchanged.", file=sys.stderr)
        return 2
    website = [u.rstrip("/") for u in SITEMAP_LOC_RE.findall(sitemap_xml)]
    if not website:
        print(f"ERROR: {SITEMAP_URL} loaded but held no <loc> entries. "
              "State file left unchanged.", file=sys.stderr)
        return 3

    pdfs = {}
    for index_url in PDF_INDEX_PAGES:
        try:
            index_html = fetch(index_url)
        except FetchError as exc:
            print(f"ERROR: could not fetch a PDF index page: {exc}", file=sys.stderr)
            print("State file left unchanged.", file=sys.stderr)
            return 2
        for href in PDF_LINK_RE.findall(index_html):
            href = html.unescape(href)
            if "${" in href:        # an unfilled JavaScript template, not a link
                continue
            plain = urllib.parse.unquote(urllib.parse.urljoin(index_url, href))
            # One spelling per file: the pages link the same PDF both with
            # spaces and with %20. The key is the percent-encoded form.
            url = urllib.parse.quote(plain, safe=":/?=#")
            pdfs[url] = plain.rsplit("/", 1)[-1][:-4]
    if not pdfs:
        print("ERROR: the tutorial index pages loaded but no PDF links were found in them. "
              "State file left unchanged.", file=sys.stderr)
        return 3

    try:
        tree = json.loads(fetch(GITHUB_TREE_URL))
    except FetchError as exc:
        print(f"ERROR: could not list the GitHub repository {GITHUB_REPO}: {exc}", file=sys.stderr)
        print("State file left unchanged.", file=sys.stderr)
        return 2
    except ValueError as exc:
        print(f"ERROR: the GitHub listing for {GITHUB_REPO} was not JSON ({exc}). "
              "State file left unchanged.", file=sys.stderr)
        return 3
    entries = tree.get("tree") if type(tree) is dict else None
    if type(entries) is not list:
        print(f"ERROR: the GitHub listing for {GITHUB_REPO} has no 'tree' list "
              f"(message: {tree.get('message') if type(tree) is dict else type(tree).__name__}). "
              "State file left unchanged.", file=sys.stderr)
        return 3
    github_docs = {GITHUB_RAW_ROOT + e["path"]: e["path"]
                   for e in entries
                   if e.get("type") == "blob" and str(e.get("path", "")).lower().endswith(".md")}
    if not github_docs:
        print(f"ERROR: no Markdown files found in {GITHUB_REPO}. State file left unchanged.",
              file=sys.stderr)
        return 3

    # --- optional per-page pass -------------------------------------------
    page_failures = []
    if args.deep or args.cache:
        cache_dir = Path(args.cache) if args.cache else None
        if cache_dir:
            cache_dir.mkdir(parents=True, exist_ok=True)
        queue, seen = sorted(manual), set()
        while queue:
            url = queue.pop(0)
            if url in seen:
                continue
            seen.add(url)
            try:
                page_html = fetch(url)
            except FetchError as exc:
                page_failures.append((url, str(exc)))
                print(f"  page fetch failed: {exc}", file=sys.stderr)
                continue
            h1 = H1_RE.search(page_html)
            if h1 and clean(h1.group(1)):
                manual[url] = manual.get(url) or clean(h1.group(1))
            for found_url, title in manual_links(page_html).items():
                if found_url not in manual:
                    manual[found_url] = title
                    queue.append(found_url)
            if cache_dir:
                (cache_dir / cache_name(url)).write_text(
                    f"URL: {url}\n\n{page_text(page_html)}\n", encoding="utf-8")
            time.sleep(args.delay)

    # --- merge ------------------------------------------------------------
    listed = {}
    for url, title in manual.items():
        listed[url] = {"title": title, "group": manual_group(url)}
    for url in website:
        slug = url.rsplit("/", 1)[-1]
        listed[url] = {"title": urllib.parse.urlparse(url).path.strip("/") or "home", "group": "website",
                       "_skip": WEBSITE_SKIP.get(slug)}
    for url, title in pdfs.items():
        listed[url] = {"title": title, "group": "pdf-guide"}
    for url, title in github_docs.items():
        listed[url] = {"title": title, "group": "github-materials"}

    added = 0
    for url, info in listed.items():
        skip_reason = info.pop("_skip", None)
        if url in state:
            entry = state[url]
            # refresh what the source owns; never status / session / notes
            if info["title"]:
                entry["title"] = info["title"]
            entry["url"] = url
            entry["group"] = info["group"]
            entry.pop("listed", None)
            for key, default in (("status", "pending"), ("session", None), ("notes", "")):
                entry.setdefault(key, default)
        else:
            added += 1
            state[url] = {
                "title": info["title"], "url": url, "group": info["group"],
                "status": "skipped" if skip_reason else "pending",
                "session": None,
                "notes": skip_reason or "",
            }
    gone = [u for u in state if u not in listed]
    for url in gone:
        state[url]["listed"] = False

    STATE_FILE.write_text(json.dumps(state, indent=2, ensure_ascii=False, sort_keys=True) + "\n",
                          encoding="utf-8")

    print(f"manual pages listed: {len(manual)}   website pages listed: {len(website)}   "
          f"PDF guides listed: {len(pdfs)}   GitHub docs listed: {len(github_docs)}")
    print(f"new entries: {added}   no longer listed by the source: {len(gone)}")
    if page_failures:
        print(f"page fetches that failed: {len(page_failures)}")
        for url, why in page_failures:
            print(f"  {why}")
    print_status(state)
    return 1 if page_failures else 0


if __name__ == "__main__":
    sys.exit(main())
