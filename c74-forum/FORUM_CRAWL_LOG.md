# Forum Crawl Log

Tracks progress of the Cycling '74 forum knowledge crawl. Each session reads
this log to see what has been covered, picks the next focused area, performs
one focused crawl pass, appends entries to `forum_insights.md`, and updates
this log.

## How to use this log

- **Before starting a session**: read the "Resume point" section, pick the next
  focused area or continue an in-progress thread cluster.
- **During the session**: keep notes on threads visited, value yielded, and
  threads queued for later.
- **At end of session**: update "Coverage", "Resume point", and "Queue".

## Coverage

Threads or topic clusters whose insights have been folded into
`forum_insights.md` (or deliberately skipped as low value).

| Date       | Area | Threads in chunk | Artifact-bearing | Insights written | Notes |
|------------|------|------------------|------------------|------------------|-------|
| 2026-05-01 | First chunk: Jitter pp.1-3 + JS pp.1-3 + MaxMSP p.1 + RNBO p.1 (M4L excluded) | 81 | 44 | 28 | 119 artifact files (88 .maxpat / 9 .js / 8 .zip / 6 .rnbopack / 3 .jxs / others) saved to `/tmp/forum/`. State file `forum_crawl_state.json` records every slug with decision: `downloaded` (44) / `scraped` (6 Phase C) / `skipped-no-artifact` (31). |
| 2026-05-04 | Pass-2 chunk: MaxMSP pp.2-5 + Jitter pp.4-7 + RNBO pp.2-5 + Javascript pp.4-7 + Gen pp.1-4 (NEW subforum) + Misc pp.1-3 + Max For Live pp.1-2 | 240 | 103 | 32 (across 7 sections incl. fresh Gen / gen~ section) | 212 artifact files (167 .maxpat / 18 .zip / 24 other / 1 .js / 1 .jxs / 1 .rnbopack) saved to `/tmp/forum-pass2/`. Patched a Unicode-slug bug in the enumerator (`urllib.parse.quote(slug, safe='/-')`). 5 PROMOTION-CANDIDATE flags applied; will be promoted in the closing sweep. State file now totals 321 entries across both chunks. |

## Resume point

Next session should start at one of these (artifact density tends to drop on later pages — verify with `--has-content` first):

- **Jitter pages 4-6** — continuing the largest contributor of artifact-bearing threads
- **Javascript pages 4-5** — covers up to thread #189 (forum total)
- **MaxMSP pages 2-4** — 75% of the subforum still unscanned
- **RNBO pages 2-4** — only page 1 covered so far
- **Gen pages 1-3** — entirely unscanned, novel territory
- **Misc page 1** — also unscanned; broader-purpose threads

To check what's NEW vs UNCHANGED on any page, use `--diff` against the state file:

```bash
python3 enumerate_forum_threads.py --category Jitter --pages 1-6 --diff --detect-content
```

That command will show only NEW (slug never in state) or UPDATED (new replies since last scrape) threads — already-done ones are silently filtered out.

## Queue

Topics, threads, or search queries spotted but not yet crawled. Add as you go.

- (empty — explore via `--diff` against the state file rather than maintaining a manual queue)

## Skipped

Threads visited but not worth extracting from (basic "how do I", unanswered,
docs links only). One line each so future sessions don't re-evaluate them.

- (none yet)

## Session notes / process observations

- WebFetch summarises pages aggressively — re-asking with a tighter prompt that names the desired structure (the problem, the workaround, code snippets, the authoritative responder) yields much better extracts than a generic "summarise this thread" prompt.

## Canonical enumeration recipe (use this — don't fight WebFetch pagination)

The forum's `?category=X&page=N` URLs work correctly at the HTTP layer (verified
with `curl` — different MD5 per page, different thread sets per page), but
WebFetch caches by path and may return stale page-1 content for `?page=2+`
calls. The reliable path is the helper script in this repo.

**Prioritization principle:** rank by *artifacts*, not engagement. A
single-reply thread that includes a working patch (MCT) or attached file is
often more valuable than a 20-reply discussion with no artifacts. Reply count
is a weak signal; the presence of executable evidence is a strong one. Do
**not** routinely use `--min-replies` — it silently drops high-value
artifact-bearing threads.

```bash
# Default workflow: scan threads + flag artifacts, rank artifact-bearing first
python3 enumerate_forum_threads.py --category Jitter --pages 1-3 --detect-content

# Filter to artifact-bearing only
python3 enumerate_forum_threads.py --category Javascript --pages 1-3 --detect-content --has-content

# MCT only (working patches embedded in posts)
python3 enumerate_forum_threads.py --category MaxMSP --pages 1-2 --detect-content --has-mct

# Cheap mode (no per-thread fetch) — only when you need a fast index
python3 enumerate_forum_threads.py --category Javascript --page 1
```

`--detect-content` fetches each thread's `__NEXT_DATA__` and counts:
- **`patcher` nodes** = embedded MCT blocks (working patches)
- **`attachment` nodes** = uploaded files (`.maxpat`, `.js`, `.zip`, etc.)

Output (TSV) with detection: `replies<TAB>mct<TAB>attach<TAB>slug<TAB>title`,
sorted artifact-presence-first then by replies. Without detection: just
`replies<TAB>slug<TAB>title`. Use this to pick targets, then WebFetch the
individual thread URLs (which work fine — only the listing pagination is
flaky).

### Then download and READ the artifacts — that's where the real insight is

The flag is just a flag. Many of the most useful insights live in the *code*
of the attached patch or .js file, not in the discussion text. After
identifying artifact-bearing threads, run the download pass:

```bash
# Pull every artifact (attachments + decoded MCTs) for every Jitter thread
# on page 1 into /tmp/forum/<slug>/
python3 enumerate_forum_threads.py --category Jitter --page 1 \
    --has-content --download /tmp/forum
```

Then **actually read the files**: `.js` and `.jxs` are plain text, `.maxpat`
is JSON, `.zip` extracts to one of the above. For a quick survey of a saved
MCT-derived `.maxpat`:

```bash
python3 -c "import json; p=json.load(open('mct-X.maxpat'))['patcher']; \
    print('\n'.join(b['box'].get('text', b['box']['maxclass']) \
                    for b in p['boxes']))"
```

### MCT retrieval — solved

The "Max Patch / Copy patch and select New From Clipboard in Max" Copy button
fetches each embedded MCT from `https://cycling74.com/api/v1/patchers/<id>`
on click. The endpoint returns:

```json
{
  "_id": "<32-hex patcher_id>",
  "md5": "<same as _id>",
  "patch": "2372.3oc6cks…",   // JUCE-base64 zlib-compressed body, no delimiters
  "format": "juceb64_zip_json",
  "__v": 0
}
```

The `patch` body is exactly the format `spec2maxpat.py`'s `mct_decode()`
already handles — wrap with `----------begin_max5_patcher----------` /
`-----------end_max5_patcher-----------` delimiters and decode.

**The decoded payload is standard Max copy-paste JSON** (see `SPEC_REFERENCE.md`
"Max's Three Patch Serialization Formats"). It is *not* a forum-specific
format — it's exactly what `Cmd-C` in a Max patcher produces and what
`Edit > Paste From Clipboard` consumes:

```json
{
    "boxes": [
        { "box": { "maxclass": "message", "text": "hello world!", … } },
        { "box": { "maxclass": "newobj", "text": "print", … } }
    ],
    "lines": [
        { "patchline": { "source": ["obj-3", 0], "destination": ["obj-1", 0] } }
    ],
    "appversion": { "major": 9, … },
    "classnamespace": "box"
}
```

A standalone `.maxpat` file expects this wrapped in `{"patcher": {...}}`.
Whether the forum body has the wrapper depends on what the author copied —
a selection from inside a patcher gives you the unwrapped form; a copy of an
entire `.maxpat` file gives you the wrapped form. `mct_to_maxpat()` adds the
wrapper only if it's missing, so the saved file always opens cleanly in Max.

This dual nature also means: the decoded text can be **pasted directly into
an open patcher** via Edit > Paste From Clipboard. You don't need to save it
as a `.maxpat` to test — copy the raw decoded JSON to your clipboard and
paste it into a fresh patcher window.

`enumerate_forum_threads.py --download <DIR>` downloads attachments AND
saves every MCT as `mct-<patcher_id_prefix>.maxpat` next to them.

Known categories: `MaxMSP`, `RNBO`, `Jitter`, `Max For Live`, `Javascript`,
`Misc`, `Gen`, `Java`. Case-sensitive; `Max For Live` has spaces.
