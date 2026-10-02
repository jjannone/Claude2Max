#!/usr/bin/env python3
"""
Enumerate Isadora (TroikaTronix) documentation into isadora_crawl_state.json.

Sources (all verified by fetching on 2026-10-02):

  1. Knowledge base  https://support.troikatronix.com/support/solutions
     A Freshdesk portal. The index lists categories and folders; each folder
     is paginated at /support/solutions/folders/<id>/page/<n>.
  2. Product pages   https://troikatronix.com/wp-sitemap-posts-page-1.xml
     Only the /isadora/... and /izzycast/... feature pages are kept.
  3. Add-ons         https://troikatronix.com/wp-sitemap-posts-plugin-1.xml
     One page per downloadable plugin / user actor / example file.
  4. The manual      https://troikatronix.com/files/isadora-manual.pdf
     About 69 MB, so it is NOT downloaded here. Pass a local copy with
     --manual-pdf to add one entry per line of its printed table of contents
     (the PDF has no outline). Reading a PDF needs the third-party `pypdf`
     module; without it the script says so and leaves any manual entries
     already in the state file alone. Everything else is stdlib-only.

Usage:
    python3 scans/isadora/enumerate_isadora.py               # KB + site + add-ons
    python3 scans/isadora/enumerate_isadora.py --manual-pdf /path/manual.pdf
    python3 scans/isadora/enumerate_isadora.py --status      # counts only, no network

State file: a dict keyed by page URL (or, for the manual,
"manual#p<page>-<slug>"):
    {"title", "url", "group", "status": "pending"|"extracted"|"skipped",
     "session": "YYYY-MM-DD" or null, "notes"}

Merging: an entry already in the state file keeps its status, session and
notes. Only title, url and group are refreshed. Entries no longer found are
kept, never deleted.

Failure: if any index fetch fails or yields no entries, the script prints the
cause to stderr and exits non-zero WITHOUT writing the state file, so a
network problem can never be mistaken for an empty documentation set.
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

HERE = Path(__file__).resolve().parent
STATE_FILE = HERE / "isadora_crawl_state.json"

KB_BASE = "https://support.troikatronix.com"
KB_INDEX = KB_BASE + "/support/solutions"
SITE_PAGES = "https://troikatronix.com/wp-sitemap-posts-page-1.xml"
SITE_ADDONS = "https://troikatronix.com/wp-sitemap-posts-plugin-1.xml"
MANUAL_URL = "https://troikatronix.com/files/isadora-manual.pdf"
UA = "Mozilla/5.0 (Claude2Max documentation enumerator)"

FOLDER_RE = re.compile(
    r'href="(/support/solutions/folders/(\d+))"[^>]*>\s*([^<]+?)\s*<')
CATEGORY_RE = re.compile(
    r'href="/support/solutions/(\d+)"[^>]*>\s*([^<]+?)\s*<')
ARTICLE_RE = re.compile(
    r'<a href="(/support/solutions/articles/[^"]+)"[^>]*class="c-link"[^>]*>(.*?)</a>',
    re.DOTALL)
PAGE_RE = re.compile(r'/support/solutions/folders/\d+/page/(\d+)')
LOC_RE = re.compile(r"<loc>([^<]+)</loc>")


class FetchError(Exception):
    pass


def fetch(url, tries=3):
    last = None
    for attempt in range(tries):
        try:
            req = urllib.request.Request(url, headers={"User-Agent": UA})
            with urllib.request.urlopen(req, timeout=60) as resp:
                return resp.read().decode("utf-8", errors="replace")
        except (urllib.error.URLError, OSError) as exc:
            last = exc
            time.sleep(1 + attempt)
    raise FetchError("%s: %s: %s" % (url, type(last).__name__, last))


def clean(text):
    return re.sub(r"\s+", " ", html.unescape(re.sub(r"<[^>]+>", "", text))).strip()


def enumerate_kb():
    """Return {url: (title, group)} for every knowledge-base article."""
    index = fetch(KB_INDEX)
    # Map each folder to the category heading that precedes it in the page.
    marks = [(m.start(), "cat", m.group(1), clean(m.group(2)))
             for m in CATEGORY_RE.finditer(index)]
    marks += [(m.start(), "folder", m.group(2), clean(m.group(3)))
              for m in FOLDER_RE.finditer(index)]
    marks.sort()
    folders = {}
    category = ""
    for _pos, kind, ident, name in marks:
        if kind == "cat":
            category = name
        elif ident not in folders and not name.lower().startswith("see all"):
            folders[ident] = (category, name)
    if not folders:
        raise FetchError("%s: fetched, but no folder links matched" % KB_INDEX)

    out = {}
    for ident, (category, name) in sorted(folders.items()):
        base = "%s/support/solutions/folders/%s" % (KB_BASE, ident)
        first = fetch(base)
        pages = [int(n) for n in PAGE_RE.findall(first)] or [1]
        bodies = [first] + [fetch("%s/page/%d" % (base, n))
                            for n in range(2, max(pages) + 1)]
        group = "kb/%s/%s" % (category, name)
        found = 0
        for body in bodies:
            for m in ARTICLE_RE.finditer(body):
                out[KB_BASE + m.group(1)] = (clean(m.group(2)), group)
                found += 1
        print("  kb folder %-48s %3d articles" % (name[:48], found))
        time.sleep(0.2)
    if not out:
        raise FetchError("knowledge base: folders found, but no articles matched")
    return out


def slug_title(url):
    slug = url.rstrip("/").rsplit("/", 1)[-1]
    return slug.replace("-", " ")


def enumerate_site():
    pages = LOC_RE.findall(fetch(SITE_PAGES))
    if not pages:
        raise FetchError("%s: fetched, but no <loc> entries" % SITE_PAGES)
    out = {}
    for url in pages:
        m = re.match(r"https://troikatronix\.com/(isadora|izzycast)/(.*)", url)
        if m:
            out[url] = (slug_title(url) or m.group(1), "site/" + m.group(1))
    addons = LOC_RE.findall(fetch(SITE_ADDONS))
    if not addons:
        raise FetchError("%s: fetched, but no <loc> entries" % SITE_ADDONS)
    for url in addons:
        out[url] = (slug_title(url), "add-ons")
    return out


TOC_LINE_RE = re.compile(r"^(.*?\S)\s*\.{3,}\s*(\d+)\s*$")


def enumerate_manual(pdf_path):
    """Return {key: (title, group, url)} from the manual's printed table of
    contents, or None when the PDF cannot be read here.

    The v4.0 manual (October 2024, 887 pages) carries no PDF outline, so the
    entries come from the dot-leader lines of the TABLE OF CONTENTS pages. A
    heading set in capitals starts a new group; headings under it share it.
    """
    try:
        import pypdf  # third-party; optional
    except ImportError as exc:
        print("manual: cannot read the PDF (%s). Run this with an interpreter "
              "that has pypdf, e.g. one in a scratch virtualenv. Manual "
              "entries already in the state file are left as they are."
              % exc, file=sys.stderr)
        return None
    reader = pypdf.PdfReader(str(pdf_path))
    out = {}
    group = ""
    seen_toc = False
    for page in reader.pages[:40]:
        text = page.extract_text() or ""
        lines = [TOC_LINE_RE.match(line) for line in text.split("\n")]
        lines = [m for m in lines if m]
        if not lines:
            if seen_toc:
                break  # first page after the table of contents
            continue
        seen_toc = True
        for m in lines:
            title, page_no = clean(m.group(1)), int(m.group(2))
            if title.upper() == "TABLE OF CONTENTS":
                continue
            letters = sum(c.isalpha() for c in title)
            # A chapter heading is set in capitals. Five letters is the
            # floor so the "FPS" control is not mistaken for a chapter.
            if title == title.upper() and letters >= 5:
                group = title
            slug = re.sub(r"[^a-z0-9]+", "-", title.lower()).strip("-")[:60]
            key = "manual#p%04d-%s" % (page_no, slug)
            out[key] = (title, "manual/" + (group or title),
                        "%s#page=%d" % (MANUAL_URL, page_no))
    if not out:
        raise FetchError("%s: opened, but no table-of-contents lines were "
                         "found in its first 40 pages" % pdf_path)
    return out


def load_state():
    if STATE_FILE.exists():
        return json.loads(STATE_FILE.read_text())
    return {}


def merge(state, key, title, url, group):
    entry = state.get(key)
    if entry is None:
        state[key] = {"title": title, "url": url, "group": group,
                      "status": "pending", "session": None, "notes": ""}
        return True
    entry["title"], entry["url"], entry["group"] = title, url, group
    entry.setdefault("status", "pending")
    entry.setdefault("session", None)
    entry.setdefault("notes", "")
    return False


def report(state):
    by_group = {}
    for entry in state.values():
        top = entry["group"].split("/")[0]
        counts = by_group.setdefault(top, {})
        counts[entry["status"]] = counts.get(entry["status"], 0) + 1
    print("%d entries" % len(state))
    for top in sorted(by_group):
        print("  %-10s %s" % (top, ", ".join(
            "%s %d" % kv for kv in sorted(by_group[top].items()))))


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--manual-pdf", type=Path,
                    help="local copy of isadora-manual.pdf (needs pypdf)")
    ap.add_argument("--status", action="store_true",
                    help="print counts from the state file; no network")
    args = ap.parse_args()

    state = load_state()
    if args.status:
        report(state)
        return 0

    try:
        found = {}
        for url, (title, group) in enumerate_kb().items():
            found[url] = (title, url, group)
        for url, (title, group) in enumerate_site().items():
            found[url] = (title, url, group)
        if args.manual_pdf:
            if not args.manual_pdf.exists():
                raise FetchError("manual PDF not found: %s" % args.manual_pdf)
            manual = enumerate_manual(args.manual_pdf)
            if manual:
                for key, (title, group, url) in manual.items():
                    found[key] = (title, url, group)
    except FetchError as exc:
        print("ENUMERATION FAILED, state file not written: %s" % exc,
              file=sys.stderr)
        return 1

    added = sum(merge(state, key, *vals) for key, vals in found.items())
    STATE_FILE.write_text(json.dumps(state, indent=2, sort_keys=True,
                                     ensure_ascii=False) + "\n")
    print("found %d, new %d, state now holds:" % (len(found), added))
    report(state)
    return 0


if __name__ == "__main__":
    sys.exit(main())
