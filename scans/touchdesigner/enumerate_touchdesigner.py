#!/usr/bin/env python3
"""
Enumerate the TouchDesigner documentation (Derivative) into a crawl-state file.

Source: https://docs.derivative.ca/ — a MediaWiki (1.39 when first scanned,
2026-10-02). The wiki exposes the standard MediaWiki API at /api.php, so the
page list comes from the wiki's own registry of pages (list=allpages plus
prop=categories) and not from scraping index pages.

Usage:
    # Enumerate every main-namespace page and merge into the state file
    python3 scans/touchdesigner/enumerate_touchdesigner.py

    # Coverage summary (reads the state file only, no network)
    python3 scans/touchdesigner/enumerate_touchdesigner.py --status

    # Save the raw wikitext of pages, to read them (one title per line in FILE)
    python3 scans/touchdesigner/enumerate_touchdesigner.py --fetch FILE --out DIR

    # Record what a session actually read (one title per line in FILE)
    python3 scans/touchdesigner/enumerate_touchdesigner.py \
        --mark extracted --titles FILE --session 2026-10-02 --note "..."

State file (touchdesigner_crawl_state.json), keyed by page URL:
    {
      "https://docs.derivative.ca/Movie_File_In_TOP": {
        "title": "Movie File In TOP",
        "url": "https://docs.derivative.ca/Movie_File_In_TOP",
        "group": "TOP operators",
        "categories": ["TOPs"],
        "status": "pending" | "extracted" | "skipped",
        "session": "2026-10-02" | null,
        "notes": ""
      }
    }

Re-running merges: `status`, `session` and `notes` already in the file are
kept; `title`, `group` and `categories` are refreshed from the wiki. A page
that has left the wiki is kept and its notes gain "no longer listed".

If any fetch fails, the script stops with a non-zero exit and says why. It
never writes a partial or empty list over an existing state file.
"""
from __future__ import annotations

import argparse
import json
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path

HERE = Path(__file__).parent
STATE_FILE = HERE / "touchdesigner_crawl_state.json"

BASE = "https://docs.derivative.ca"
API = BASE + "/api.php"
USER_AGENT = "Claude2Max-doc-scan/1.0 (stdlib urllib; documentation index)"
PAUSE = 0.3  # seconds between API calls
RETRIES = 3  # per call; the first run met one TLS handshake timeout

# First match wins. Each rule: (group, category names that select it).
CATEGORY_GROUPS = [
    ("TOP operators", {"TOPs"}),
    ("CHOP operators", {"CHOPs"}),
    ("SOP operators", {"SOPs"}),
    ("POP operators", {"POPs"}),
    ("DAT operators", {"DATs"}),
    ("MAT operators", {"MATs"}),
    ("COMP operators", {"COMPs"}),
    ("python reference", {"Python Reference", "TOP Classes", "CHOP Classes",
                          "SOP Classes", "POP Classes", "DAT Classes",
                          "MAT Classes", "COMP Classes", "OP Classes",
                          "TD Python Modules"}),
    ("palette", {"Palette", "Palette Extensions"}),
    ("operator topics", {"TOP Topics", "CHOP Topics", "COMP Topics",
                         "Panel COMP Topics"}),
    ("glossary", {"Touch Glossary"}),
    ("concepts", {"TDPages", "Rendering", "Time", "Geometry", "Texturing",
                  "Materials", "Audio", "MIDI", "Input Devices", "Hardware",
                  "VR", "GLSL", "CUDA", "C++", "Shared Memory", "Python",
                  "Programming in TouchDesigner", "Extensions", "Components",
                  "Panels", "Optimize", "Interoperability",
                  "External Libraries", "GPU - Advanced Setup", "Attributes",
                  "TouchDesigner Tips", "Troubleshooting", "File Types",
                  "Protection", "Licensing and Keying", "Settings"}),
    ("interface", {"Dialogs and Menus", "Panes", "Flags"}),
    ("legacy tscript", {"Tscript", "Commands"}),
    ("release notes", {"Release Notes", "Videos"}),
    ("operator help fragments", {"OP Help Common Pages"}),
]

FAMILY_SUFFIXES = ("TOP", "CHOP", "SOP", "POP", "DAT", "MAT", "COMP")


class FetchError(Exception):
    pass


def api_get(params: dict) -> dict:
    """One API call. Raises FetchError naming the cause."""
    params = dict(params, format="json", formatversion="2")
    url = API + "?" + urllib.parse.urlencode(params)
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    raw = None
    cause = ""
    for attempt in range(RETRIES):
        try:
            with urllib.request.urlopen(req, timeout=60) as resp:
                raw = resp.read()
            break
        except urllib.error.HTTPError as e:
            cause = "HTTP %s" % e.code
            if e.code < 500 and e.code != 429:
                break  # a 4xx will not get better on a retry
        except (urllib.error.URLError, OSError) as e:
            cause = "%s: %s" % (type(e).__name__, e)
        time.sleep(2 * (attempt + 1))
    if raw is None:
        raise FetchError("%s, after %d attempt(s), from %s"
                         % (cause, attempt + 1, url))
    try:
        data = json.loads(raw.decode("utf-8"))
    except ValueError as e:
        raise FetchError("response was not JSON (%s) from %s" % (e, url))
    if not isinstance(data, dict):
        raise FetchError("response was %s, not an object, from %s"
                         % (type(data).__name__, url))
    if "error" in data:
        raise FetchError("API error %r from %s" % (data["error"], url))
    return data


def page_url(title: str) -> str:
    return BASE + "/" + urllib.parse.quote(title.replace(" ", "_"), safe="/:()',")


def group_for(title: str, categories: list) -> str:
    cats = set(categories)
    if title.endswith(" Class") or title.endswith(" Module"):
        return "python reference"
    for group, names in CATEGORY_GROUPS:
        if cats & names:
            return group
    last = title.rsplit(" ", 1)[-1]
    if last in FAMILY_SUFFIXES and " " in title:
        return last + " operators"
    if title.startswith("Release Notes") or "Build Notes" in title:
        return "release notes"
    return "uncategorized"


def enumerate_pages(namespace: int = 0) -> dict:
    """Every non-redirect page in the namespace -> {title: [categories]}."""
    pages = {}
    cont = {}
    calls = 0
    while True:
        params = {
            "action": "query",
            "generator": "allpages",
            "gapnamespace": str(namespace),
            "gapfilterredir": "nonredirects",
            "gaplimit": "500",
            "prop": "categories",
            "cllimit": "max",
            "clshow": "!hidden",
        }
        params.update(cont)
        data = api_get(params)
        calls += 1
        for page in data.get("query", {}).get("pages", []):
            title = page.get("title")
            if not title:
                continue
            cats = pages.setdefault(title, [])
            for c in page.get("categories", []) or []:
                name = c.get("title", "")
                if name.startswith("Category:"):
                    name = name[len("Category:"):]
                if name and name not in cats:
                    cats.append(name)
        if "continue" not in data:
            break
        cont = data["continue"]
        if calls > 400:
            raise FetchError("more than 400 continuation calls; stopping "
                             "instead of looping forever")
        time.sleep(PAUSE)
    return pages


def load_state() -> dict:
    if not STATE_FILE.exists():
        return {}
    with STATE_FILE.open(encoding="utf-8") as f:
        state = json.load(f)
    if not isinstance(state, dict):
        raise SystemExit("state file %s holds a %s, expected an object"
                         % (STATE_FILE, type(state).__name__))
    return state


def save_state(state: dict) -> None:
    tmp = STATE_FILE.with_suffix(".json.tmp")
    with tmp.open("w", encoding="utf-8") as f:
        json.dump(state, f, indent=1, ensure_ascii=False, sort_keys=True)
        f.write("\n")
    tmp.replace(STATE_FILE)


def cmd_enumerate() -> int:
    try:
        pages = enumerate_pages(0)
    except FetchError as e:
        print("FETCH FAILED, state file not touched: %s" % e, file=sys.stderr)
        return 2
    if len(pages) < 100:
        print("FETCH SUSPICIOUS, state file not touched: the wiki returned "
              "only %d pages (expected a few thousand)" % len(pages),
              file=sys.stderr)
        return 2

    state = load_state()
    added = 0
    seen = set()
    for title, cats in pages.items():
        url = page_url(title)
        seen.add(url)
        old = state.get(url)
        entry = {
            "title": title,
            "url": url,
            "group": group_for(title, cats),
            "categories": sorted(cats),
            "status": "pending",
            "session": None,
            "notes": "",
        }
        if old:
            for key in ("status", "session", "notes"):
                if key in old:
                    entry[key] = old[key]
        else:
            added += 1
        state[url] = entry
    gone = 0
    for url, entry in state.items():
        if url not in seen and "no longer listed" not in (entry.get("notes") or ""):
            entry["notes"] = ((entry.get("notes") or "") + " no longer listed "
                              "by the wiki as of this enumeration.").strip()
            gone += 1
    save_state(state)
    print("Enumerated %d pages from %s (%d new, %d no longer listed)."
          % (len(pages), API, added, gone))
    print_status(state)
    return 0


def print_status(state: dict) -> None:
    by_group = {}
    for entry in state.values():
        g = by_group.setdefault(entry.get("group", "?"), {})
        s = entry.get("status", "?")
        g[s] = g.get(s, 0) + 1
    statuses = ["pending", "extracted", "skipped"]
    print("%-28s %8s %9s %8s %7s" % ("group", *statuses, "total"))
    totals = dict.fromkeys(statuses, 0)
    for group in sorted(by_group):
        row = [by_group[group].get(s, 0) for s in statuses]
        for s, n in zip(statuses, row):
            totals[s] += n
        print("%-28s %8d %9d %8d %7d" % (group, *row, sum(by_group[group].values())))
    print("%-28s %8d %9d %8d %7d" % ("TOTAL", *[totals[s] for s in statuses],
                                     len(state)))


def read_titles(path: str) -> list:
    with open(path, encoding="utf-8") as f:
        return [line.strip() for line in f if line.strip() and not line.startswith("#")]


def cmd_fetch(titles_file: str, out_dir: str) -> int:
    out = Path(out_dir)
    out.mkdir(parents=True, exist_ok=True)
    failed = []
    for title in read_titles(titles_file):
        try:
            data = api_get({"action": "query", "prop": "revisions",
                            "rvprop": "content", "rvslots": "main",
                            "redirects": "1", "titles": title})
            pages = data.get("query", {}).get("pages", [])
            if not pages or pages[0].get("missing"):
                raise FetchError("page missing: %r" % title)
            text = pages[0]["revisions"][0]["slots"]["main"]["content"]
            real = pages[0]["title"]
        except (FetchError, KeyError, IndexError) as e:
            failed.append((title, "%s: %s" % (type(e).__name__, e)))
            print("FAILED %s -- %s" % (title, e), file=sys.stderr)
            continue
        name = real.replace("/", "_").replace(" ", "_") + ".wiki"
        (out / name).write_text("<!-- %s | %s -->\n%s" % (real, page_url(real), text),
                                encoding="utf-8")
        print("ok %6d chars  %s" % (len(text), real))
        time.sleep(PAUSE)
    if failed:
        print("%d page(s) failed to fetch" % len(failed), file=sys.stderr)
        return 1
    return 0


def cmd_mark(status: str, titles_file: str, session, note: str) -> int:
    state = load_state()
    if not state:
        print("state file is missing or empty; run the enumeration first",
              file=sys.stderr)
        return 2
    missing = []
    for title in read_titles(titles_file):
        url = page_url(title)
        if url not in state:
            missing.append(title)
            continue
        state[url]["status"] = status
        state[url]["session"] = session
        if note:
            state[url]["notes"] = note
    save_state(state)
    if missing:
        print("not in the state file (not marked): %s" % missing, file=sys.stderr)
        return 1
    print_status(state)
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--status", action="store_true", help="print coverage and exit")
    ap.add_argument("--fetch", metavar="FILE", help="file of page titles to download as wikitext")
    ap.add_argument("--out", metavar="DIR", help="where --fetch writes .wiki files")
    ap.add_argument("--mark", choices=["pending", "extracted", "skipped"])
    ap.add_argument("--titles", metavar="FILE", help="file of page titles for --mark")
    ap.add_argument("--session", default=None, help="session date for --mark, e.g. 2026-10-02")
    ap.add_argument("--note", default="", help="notes text for --mark")
    args = ap.parse_args()

    if args.status:
        state = load_state()
        if not state:
            print("no state file yet at %s" % STATE_FILE)
            return 1
        print_status(state)
        return 0
    if args.fetch:
        if not args.out:
            ap.error("--fetch needs --out DIR")
        return cmd_fetch(args.fetch, args.out)
    if args.mark:
        if not args.titles:
            ap.error("--mark needs --titles FILE")
        return cmd_mark(args.mark, args.titles, args.session, args.note)
    return cmd_enumerate()


if __name__ == "__main__":
    sys.exit(main())
