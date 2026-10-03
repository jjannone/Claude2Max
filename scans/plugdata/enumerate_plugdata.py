#!/usr/bin/env python3
"""
Enumerate the plugdata / Pure Data vanilla / heavylib / pdlua documentation
and keep the crawl state file.

Two kinds of source are enumerated:

1. The local plugdata install (default ~/Documents/plugdata). Only the parts
   this scan covers are listed:

       Documentation/1.manual            Pd's HTML manual (chapters + figures)
       Documentation/2.control.examples  control tutorial patches
       Documentation/3.audio.examples    audio tutorial patches
       Documentation/4.data.structures   data-structure tutorial patches
       Documentation/5.reference         one help patch per vanilla object
       Documentation/6.externs           how to write a C external
       Documentation/7.stuff             extra patches
       Documentation/8.topics            HTML topic pages (expr, FUDI, slop~)
       Documentation/11.heavylib         heavylib help patches
       Documentation/13.pdlua            pdlua help, examples, tutorial
       Abstractions/*.pd                 top-level abstractions (param, playhead, ...)
       Abstractions/heavylib             heavylib abstractions
       Extra/pdlua                       pd.lua, pdx.lua, README
       Extra/Presets                     example plugin patches

   Documentation/9.else, 10.cyclone, 12.live-electronics-tutorial, 14.gem and
   Abstractions/else, cyclone, Gem belong to other scans and are NOT listed.
   Externals/ is counted so the log can say whether extra packages exist.

2. The web documentation:

       https://plugdata.org/                 site pages linked from the home page
       https://plugdata.org/docs/book/       the official documentation book (HonKit)
       https://plugdata.org/assets/reference-data.json   the object reference bundle
       GitHub: plugdata-team/plugdata README and wiki pages
       https://wasted-audio.github.io/hvcc/latest/   Heavy compiler docs
       https://agraef.github.io/pd-lua/tutorial/pd-lua-intro.html   pd-lua tutorial

Usage:
    python3 scans/plugdata/enumerate_plugdata.py                 # local + web, merge
    python3 scans/plugdata/enumerate_plugdata.py --local-only    # no network
    python3 scans/plugdata/enumerate_plugdata.py --status        # counts only
    python3 scans/plugdata/enumerate_plugdata.py /path/to/plugdata
    PLUGDATA_DIR=/path/to/plugdata python3 scans/plugdata/enumerate_plugdata.py

State file (plugdata_crawl_state.json), a dict keyed by path relative to the
plugdata folder, or by URL:
    {"title", "path" or "url", "group",
     "status": "pending"|"extracted"|"skipped",
     "session": "YYYY-MM-DD" | null, "notes"}

Merging never touches "status", "session" or "notes" of an entry already in
the file. An entry that is in the file and no longer found is kept and gets
"listed": false so the disappearance is visible. A new entry starts "pending",
except binary assets (pictures, sounds, fonts, licences), which start
"skipped" with the reason in "notes".

If the plugdata folder is missing, or holds none of the folders above, or any
web index fetch fails, the script prints the cause and exits non-zero WITHOUT
writing the state file. An empty or shrunken list is never written in place
of a failed read.

Stdlib only; runs on Python 3.9.
"""
from __future__ import annotations

import argparse
import html
import json
import os
import re
import sys
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path

HERE = Path(__file__).resolve().parent
STATE_FILE = HERE / "plugdata_crawl_state.json"
UA = "Mozilla/5.0 (Claude2Max doc scan; stdlib urllib)"

# --- local -----------------------------------------------------------------

# (folder relative to the plugdata dir, recursive?)
LOCAL_FOLDERS = [
    ("Documentation/1.manual", True),
    ("Documentation/2.control.examples", True),
    ("Documentation/3.audio.examples", True),
    ("Documentation/4.data.structures", True),
    ("Documentation/5.reference", True),
    ("Documentation/6.externs", True),
    ("Documentation/7.stuff", True),
    ("Documentation/8.topics", True),
    ("Documentation/11.heavylib", True),
    ("Documentation/13.pdlua", True),
    ("Abstractions", False),          # top-level .pd files only
    ("Abstractions/heavylib", True),
    ("Extra/pdlua", True),
    ("Extra/Presets", True),
]

# Not documentation text. New entries of these kinds start "skipped".
ASSET_SUFFIXES = {
    ".png": "picture", ".jpg": "picture", ".jpeg": "picture", ".gif": "picture",
    ".ico": "picture", ".svg": "picture", ".css": "stylesheet",
    ".wav": "sound file", ".aiff": "sound file", ".aif": "sound file",
    ".ttf": "font", ".otf": "font",
}
ASSET_NAMES = {"LICENSE": "licence text", "COPYING": "licence text", ".DS_Store": "Finder file"}

TITLE_RE = re.compile(r"<title\b[^>]*>(.*?)</title>", re.DOTALL | re.IGNORECASE)
TAG_RE = re.compile(r"<[^>]+>")


def clean(text: str) -> str:
    return re.sub(r"\s+", " ", html.unescape(TAG_RE.sub("", text))).strip()


def local_title(path: Path) -> str:
    """A .htm file's <title>; otherwise the file name."""
    if path.suffix.lower() in (".htm", ".html"):
        try:
            head = path.read_text(encoding="utf-8", errors="replace")[:4000]
        except OSError:
            return path.name
        m = TITLE_RE.search(head)
        if m and clean(m.group(1)):
            return clean(m.group(1))
    return path.name


def local_group(rel: str) -> str:
    """'Documentation/5.reference/x.pd' -> '5.reference'; 'Abstractions/param.pd' -> 'Abstractions'."""
    parts = rel.split("/")
    if parts[0] == "Documentation":
        return parts[1]
    if parts[0] == "Abstractions" and len(parts) > 2:
        return "Abstractions/" + parts[1]
    if parts[0] == "Extra":
        return "Extra/" + parts[1]
    return parts[0]


def enumerate_local(root: Path) -> dict:
    """Map relative path -> {title, group, _skip}. Raises SystemExit on a bad folder."""
    if not root.is_dir():
        raise SystemExit(f"ERROR: plugdata folder not found: {root}\n"
                         "Pass the folder as an argument or set PLUGDATA_DIR. State file left unchanged.")
    listed, missing = {}, []
    for rel_folder, recursive in LOCAL_FOLDERS:
        folder = root / rel_folder
        if not folder.is_dir():
            missing.append(rel_folder)
            continue
        if recursive:
            # os.walk follows the Abstractions -> Versions/... symlink plugdata installs.
            files = []
            for dirpath, _dirs, names in os.walk(folder, followlinks=True):
                files += [Path(dirpath) / n for n in names]
        else:
            files = [p for p in folder.iterdir() if p.is_file()]
        for path in sorted(files):
            if path.name == ".DS_Store":
                continue
            rel = (Path(rel_folder) / path.relative_to(folder)).as_posix()
            skip = ASSET_SUFFIXES.get(path.suffix.lower()) or ASSET_NAMES.get(path.name)
            listed[rel] = {"title": local_title(path), "group": local_group(rel),
                           "_skip": f"{skip}, not documentation text" if skip else None}
    if not listed:
        raise SystemExit(f"ERROR: {root} exists but holds none of the documentation folders "
                         f"this scan covers ({', '.join(f for f, _ in LOCAL_FOLDERS)}). "
                         "State file left unchanged.")
    if missing:
        print(f"note: folders not present in {root}: {', '.join(missing)}", file=sys.stderr)
    return listed


def count_externals(root: Path) -> int:
    ext = root / "Externals"
    if not ext.is_dir():
        return 0
    return sum(1 for p in ext.iterdir() if p.name != ".DS_Store")


# --- web -------------------------------------------------------------------

SITE_ROOT = "https://plugdata.org/"
SITE_DOC_INDEX = "https://plugdata.org/documentation.html"   # links the book and outside docs
BOOK_ROOT = "https://plugdata.org/docs/book/"                # HonKit book, loaded in an iframe by docs.html
REFERENCE_BUNDLE = "https://plugdata.org/assets/reference-data.json"
GITHUB_README = "https://raw.githubusercontent.com/plugdata-team/plugdata/develop/README.md"
WIKI_ROOT = "https://github.com/plugdata-team/plugdata/wiki"
WIKI_RAW = "https://raw.githubusercontent.com/wiki/plugdata-team/plugdata/"
HVCC_ROOT = "https://wasted-audio.github.io/hvcc/latest/"
PDLUA_TUTORIAL = "https://agraef.github.io/pd-lua/tutorial/pd-lua-intro.html"

HREF_RE = re.compile(r'href="([^"#?]+)"')
BOOK_NAV_RE = re.compile(r'<a\b[^>]*href="([^"#?:]+\.html)"[^>]*>(.*?)</a>', re.DOTALL)
WIKI_LINK_RE = re.compile(r'href="/plugdata-team/plugdata/wiki/([A-Za-z0-9._-]+)"')


class FetchError(Exception):
    pass


def fetch(url: str, timeout: int = 40) -> str:
    """Return the body of `url` as text, or raise FetchError naming the cause."""
    req = urllib.request.Request(url, headers={"User-Agent": UA})
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


def enumerate_web() -> dict:
    """Map URL -> {title, group}. Raises FetchError / ValueError; the caller writes nothing then."""
    listed = {}

    # 1. plugdata.org pages linked from the home page and the documentation index.
    home = fetch(SITE_ROOT)
    doc_index = fetch(SITE_DOC_INDEX)
    site_pages = set()
    for page in (home, doc_index):
        for href in HREF_RE.findall(page):
            if href.endswith(".html") and "://" not in href:
                site_pages.add(urllib.parse.urljoin(SITE_ROOT, href))
    site_pages.add(SITE_ROOT)
    if len(site_pages) < 3:
        raise ValueError(f"{SITE_ROOT} loaded but fewer than 3 site pages were linked from it; "
                         "the page layout may have changed")
    for url in sorted(site_pages):
        name = url.rsplit("/", 1)[-1] or "index.html"
        if name == "index.html":
            url = SITE_ROOT
        listed[url] = {"title": "plugdata.org " + (name[:-5] if name.endswith(".html") else name),
                       "group": "web:plugdata.org"}
    listed[REFERENCE_BUNDLE] = {"title": "plugdata object reference bundle (JSON behind reference.html)",
                                "group": "web:plugdata.org"}

    # 2. The documentation book. Its sidebar lists every chapter.
    book_index = fetch(BOOK_ROOT + "index.html")
    chapters = {}
    for href, label in BOOK_NAV_RE.findall(book_index):
        if "/" in href.strip("./"):
            continue
        chapters.setdefault(urllib.parse.urljoin(BOOK_ROOT, href), clean(label))
    chapters.setdefault(BOOK_ROOT + "index.html", "Introduction")
    if len(chapters) < 2:
        raise ValueError(f"{BOOK_ROOT}index.html loaded but its chapter list was not found")
    for url, title in chapters.items():
        listed[url] = {"title": "plugdata book: " + (title or url.rsplit('/', 1)[-1]),
                       "group": "web:plugdata-book"}

    # 3. GitHub README and wiki.
    fetch(GITHUB_README)            # existence check only
    listed[GITHUB_README] = {"title": "plugdata README (develop branch)", "group": "web:github"}
    wiki_html = fetch(WIKI_ROOT)
    wiki_pages = sorted(set(WIKI_LINK_RE.findall(wiki_html)) - {"_history", "_new"})
    if not wiki_pages:
        raise ValueError(f"{WIKI_ROOT} loaded but no wiki page links were found in it")
    listed[WIKI_RAW + "Home.md"] = {"title": "plugdata wiki: Home", "group": "web:github"}
    for page in wiki_pages:
        if page == "Home":
            continue
        listed[WIKI_RAW + page + ".md"] = {"title": "plugdata wiki: " + page.replace("-", " "),
                                           "group": "web:github"}

    # 4. Heavy compiler (hvcc) docs: every page in the site navigation.
    hvcc_index = fetch(HVCC_ROOT)
    hvcc_pages = set()
    for href in HREF_RE.findall(hvcc_index):
        if "://" in href or href.startswith(("mailto:", "assets/", "img/", "..")) or "." in href.rsplit("/", 1)[-1]:
            continue
        hvcc_pages.add(urllib.parse.urljoin(HVCC_ROOT, href))
    hvcc_pages.add(HVCC_ROOT)
    if len(hvcc_pages) < 5:
        raise ValueError(f"{HVCC_ROOT} loaded but its navigation links were not found")
    for url in sorted(hvcc_pages):
        path = url[len(HVCC_ROOT):].strip("/") or "index"
        listed[url] = {"title": "hvcc docs: " + path, "group": "web:hvcc"}

    # 5. The pd-lua tutorial (one long page; the local copy is a PDF).
    fetch(PDLUA_TUTORIAL)
    listed[PDLUA_TUTORIAL] = {"title": "A Quick Introduction to Pd-Lua (HTML edition)", "group": "web:pd-lua"}
    return listed


# --- state -----------------------------------------------------------------

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
        g = by_group.setdefault(entry.get("group"), {})
        g[entry.get("status")] = g.get(entry.get("status"), 0) + 1
    print(f"{len(state)} entries in {STATE_FILE.name}")
    for key in sorted(by_status, key=str):
        print(f"  status {key}: {by_status[key]}")
    for key in sorted(by_group, key=str):
        parts = ", ".join(f"{s} {n}" for s, n in sorted(by_group[key].items(), key=lambda kv: str(kv[0])))
        print(f"  group  {key}: {sum(by_group[key].values())} ({parts})")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("plugdata_dir", nargs="?",
                    default=os.environ.get("PLUGDATA_DIR", "~/Documents/plugdata"),
                    help="the plugdata folder (default: $PLUGDATA_DIR or ~/Documents/plugdata)")
    ap.add_argument("--local-only", action="store_true", help="skip the web pages; no network")
    ap.add_argument("--status", action="store_true", help="print counts from the state file and exit")
    args = ap.parse_args()

    state = load_state()
    if args.status:
        print_status(state)
        return 0

    root = Path(args.plugdata_dir).expanduser()
    try:
        local = enumerate_local(root)
    except SystemExit as exc:
        print(exc, file=sys.stderr)
        return 2

    web = {}
    if not args.local_only:
        try:
            web = enumerate_web()
        except FetchError as exc:
            print(f"ERROR: a web index could not be fetched: {exc}", file=sys.stderr)
            print("State file left unchanged. Use --local-only to list the local files alone.",
                  file=sys.stderr)
            return 2
        except ValueError as exc:
            print(f"ERROR: {exc}. State file left unchanged.", file=sys.stderr)
            return 3

    added = 0
    for key, info in list(local.items()) + list(web.items()):
        skip_reason = info.pop("_skip", None)
        is_url = key.startswith("http")
        if key in state:
            entry = state[key]
            entry["title"] = info["title"] or entry.get("title", "")
            entry["group"] = info["group"]
            entry.pop("listed", None)
            continue
        entry = {"title": info["title"], "group": info["group"],
                 "status": "skipped" if skip_reason else "pending",
                 "session": None, "notes": skip_reason or ""}
        entry["url" if is_url else "path"] = key
        state[key] = entry
        added += 1

    # Entries no longer found. With --local-only the web entries were not checked.
    gone = 0
    for key, entry in state.items():
        if key in local or key in web:
            continue
        if args.local_only and key.startswith("http"):
            continue
        if entry.get("listed") is not False:
            gone += 1
        entry["listed"] = False

    STATE_FILE.write_text(json.dumps(state, indent=2, sort_keys=True, ensure_ascii=False) + "\n",
                          encoding="utf-8")
    print(f"plugdata folder: {root}")
    print(f"local files listed: {len(local)}; web pages listed: {len(web)}"
          + (" (web skipped: --local-only)" if args.local_only else ""))
    print(f"Externals/ entries (extra packages installed by the user): {count_externals(root)}")
    print(f"new entries: {added}; entries no longer found: {gone}")
    print_status(state)
    return 0


if __name__ == "__main__":
    sys.exit(main())
