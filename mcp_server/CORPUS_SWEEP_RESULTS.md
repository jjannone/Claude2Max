# Corpus Sweep Results — Rule-enforcement task, item 2

**Run 2026-08-20, Sonnet.** Full run over the 11,873-file corpus enumerated in
`maxhelp/maxhelp_crawl_state.json` (the same file list the `.maxhelp` corpus
crawl already built — core `help/`, bundled `packages/`, and the user's
`~/Documents/Max 9/Packages`), using `verify_patch_file()` /
`spec2maxpat.py verify` (item 1 of this task). Wall time: **10.84s** for all
11,873 files — the rule library is cheap; scale was never the constraint.

This is the measurement item 3 depends on: **Opus reads this and decides**
which rule families are well-calibrated (safe to promote warn→block) vs.
which are noisy against real-world (non-Claude2Max) patches. This file is
the record of what was run and what came back — not the judgment.

Regenerate with the driver at the bottom of this file, or approximately via
the shipped CLI:

```bash
python3 spec2maxpat.py verify \
  "/Applications/Max.app/Contents/Resources/C74/help" \
  "/Applications/Max.app/Contents/Resources/C74/packages" \
  "$HOME/Documents/Max 9/Packages" \
  --summary --json
```

(The CLI directory-walks by extension; the run recorded here instead used
the exact `maxhelp_crawl_state.json` file list, so the two won't be
byte-identical, but should be very close — same three roots, same three
kinds.)

## Headline numbers

- **Total files:** 11,873
- **Checked:** 11,824 (99.6%)
- **Unchecked:** 49, all `not-a-patcher-file` (user-packages tier only —
  malformed or non-patcher JSON; not investigated further here)
- **Resolver:** healthy (built against this machine's live C74 refpages +
  `packages/package_objects.json`)

## Per-tier breakdown

| tier | checked | unchecked | error files | warning files | style files | clean files |
|---|---:|---:|---:|---:|---:|---:|
| core (`help/`) | 1,015 | 0 | 255 | 727 | 17 | 16 |
| bundled-packages | 1,994 | 1 | 1,335 | 604 | 6 | 49 |
| user-packages | 8,815 | 48 | 3,634 | 4,037 | 65 | 1,079 |
| **total** | **11,824** | **49** | **5,224** | **5,368** | **88** | **1,144** |

**~44% of checked files have at least one `error`-severity violation.** That
is the single most important number for item 3 to reckon with — it is far
higher than the "presentation-required fires on thousands of adversarial
patches, that's expected" framing anticipated in the task write-up. The
`error` tier is currently three resolver rules
(`object-unresolved`/`attribute-invalid`/`connection-missing-object`), and
`spec2maxpat.py convert` already treats `error` as build-blocking. Before any
promotion work happens elsewhere, Opus should look hard at whether this 44%
reflects real invented-name detection working correctly on old/exotic C74
content, or a false-positive problem already living in the *existing*
resolver tier (not just the principle-tier warnings item 3 was written to
worry about).

## Per-rule table (all 12 registered rules fired at least once)

| rule | severity | hit count | distinct files | sample locations |
|---|---|---:|---:|---|
| `hidden-box-cord-visible` | warning | 44,854 | 4,236 | see JSON |
| `attribute-invalid` | **error** | 23,708 | 946 | see JSON |
| `object-unresolved` | **error** | 23,161 | 5,053 | see JSON |
| `presentation-required` | warning | 17,767 | 8,676 | see JSON |
| `message-unverified` | warning | 16,206 | 3,405 | see JSON |
| `allcaps-name` | style | 14,195 | 2,616 | see JSON |
| `subpatcher-label-missing` | warning | 13,211 | 3,882 | see JSON |
| `redundant-message-box` | warning | 12,096 | 3,099 | see JSON |
| `prefer-v8` | style | 2,177 | 2,064 | see JSON |
| `empty-newobj` | warning | 1,345 | 689 | see JSON |
| `maxclass-unresolved` | warning | 776 | 361 | see JSON |
| `connection-missing-object` | **error** | 8 | 7 | see JSON |

Full per-rule data (5 sample `path:location` examples each) is in
`corpus_sweep_summary.json` (7.9K, committed alongside this file). The
complete per-file breakdown (11,824 records: path, tier, kind, checked,
mode, scopes_checked, counts) is 3.6MB and was **not** committed — it lives
in the session scratchpad this run was produced in and is trivially
regenerable (10.84s) via the driver below. Re-run it if item 3 needs to
drill into specific files rather than aggregate counts.

## Item 3 — Opus read (2026-08-20). **Conclusion: do not promote anything yet; the existing block tier is misfiring.**

The Sonnet observations below are superseded by this section, which decomposed
the error tier by root cause instead of reasoning from aggregate counts.

### The corpus measures specificity, not sensitivity — and specificity is the problem

Two separate properties, and the corpus can only speak to one:

- **Sensitivity** (does the gate catch genuinely invented names?) — **intact,
  verified directly.** `oscparse`, `jit.pwindo`, `metroo`, `bgcolorize` all fail
  to resolve, and a spec containing `oscparse` still blocks `convert`. The
  corpus cannot measure this, because C74 does not ship help patches full of
  broken objects — there are no seeded errors to find.
- **Specificity** (does it leave real names alone?) — **badly broken.** This is
  what the corpus does measure, and the answer is decisive.

### Root-cause decomposition of the error tier

Every error-severity violation was attributed to a cause (script:
`categorize.py`, run over all 11,873 files):

| rule | total | cause | count | share |
|---|---:|---|---:|---:|
| `attribute-invalid` | 21,487 | **`rnbo_*` tool-stamped attrs** | 21,185 | **98.6%** |
| | | other | 300 | 1.4% |
| | | gen-domain | 2 | — |
| `object-unresolved` | 8,291 | operator/shorthand aliases | ~3,396 | 41% |
| | | gen-domain vocabulary | 1,248 | 15% |
| | | local abstraction (same dir) | 962 | 12% |
| | | real objects w/o refpage entry | remainder | — |

Four distinct systematic causes, none of them a real defect in the patch:

1. **Symbolic-operator aliases are incomplete.** C74 stores operator refpages
   under word filenames and declares the real name in the root's `name`
   attribute — `div.maxref.xml` is `name="/"`, `bitand.maxref.xml` is
   `name="&"`, `shiftright.maxref.xml` is `name=">>"`, `rminus.maxref.xml` is
   `name="!-"`. The repo's alias table is hand-maintained across two files
   (`_VERIFIED_WORD_ALIASES` in `spec2maxpat.py` + `REFPAGE_ALIAS` in
   `add_tutorial.py`, 23 entries) and is missing `/`, `&`, `|`, `>>`, `<<`,
   `!-`, `!/`, `!-~`, `!/~`, `/~`, and the entire `mc.*` operator family.
2. **gen is treated as Max.** `_iter_patcher_scopes` descends into `gen~` /
   `jit.gen` / `jit.gl.pix` subpatchers and checks their contents against the
   *Max* object set. gen is a separate language with its own vocabulary
   (`history`, `swiz`, `clamp`, `mix`, `sah`, `delta`, `param`, …) — a fact
   `CLAUDE.md` states explicitly. Same applies to `rnbo~` subpatchers.
3. **RNBO stamps its own attributes onto boxes** (`rnbo_serial`,
   `rnbo_uniqueid`, `rnbo_classname`, `rnbo_extra_attributes`, `rnboinfo`), as
   does patch-freezing (`frozen_object_attributes`, `frozen_box_attributes`).
   These are tool-written structural metadata, not user attributes — the same
   category as the keys already in `_MAXPAT_STRUCTURAL_KEYS`.
4. **Abstraction resolution is scoped too narrowly** for objects living in a
   package's `patchers/` dir while the patch lives in `help/`.

### Production impact — this is a live defect, not a future risk

Not hypothetical. A four-box spec using `[/ 2]` and `[i]`:

```
[verify]   ✗ ERROR  [HALVE] '/' is not a known Max object …
[verify]   ✗ ERROR  [COUNT] 'i' is not a known Max object …
[verify] BLOCKED: 2 error(s) above must be fixed before converting.
EXIT=1
```

**Division is blocked from converting.** `/` and `i` are among the most common
objects in Max. A student asking for "divide this by 2" gets a hard build
failure telling them a real object isn't real — and the only escape is
`--allow-unverified`, which disables the whole anti-guessing layer. A blocking
gate that misfires on basic objects doesn't just annoy; it *trains users to
turn the gate off*, which costs exactly the protection the gate exists to give.

### Simulated fix — measured, not argued

Simulating four fixes (`simulate_fix.py`, no repo edits): mechanical alias map
harvested from refpage `@name` (56 aliases, **zero collisions**, versus 23
hand-maintained), `i`/`f` added, gen scopes skipped, `rnbo_*`/`frozen_*`
treated as structural, abstraction search widened to package root:

| | before | after | change |
|---|---:|---:|---:|
| `object-unresolved` | 8,291 | 1,101 | **−87%** |
| `attribute-invalid` | 21,487 | 162 | **−99.2%** |
| files with residual error | ~5,224 | 645 | **−88%** |

And the 1,101 residual is *still* dominated by real objects — `jit.gl.layer`
(103, documented in `CLAUDE.md` itself), `jit.mo.*` / `jit.time.*` (Jitter
families), `M4L.*` / `pluggo.*` / `bp.*` (M4L + BEAP abstractions), and RNBO
operator names (`param~`, `setparam`, `expr~`, `bufferop~`, `pan~`, `xfade~`)
from `rnbo~` scopes the gen-skip didn't cover. **No confirmed genuine
invented-name detection was found anywhere in the 11,873-file corpus.**

### Why the corpus cannot authorize principle-tier promotion either

The task scoped item 2 as the evidence base for promoting the 8 structural
rules warn→block. It does not serve that purpose, for a reason worth stating:
**C74's patches are a different population from Claude2Max-authored patches.**
`presentation-required` (8,676 files) and `hidden-box-cord-visible` (4,236
files, 44,854 hits — the largest single rule by volume) fire at that rate
because C74 never adopted these conventions, exactly as the task predicted
("measuring our preference, not a defect"). Both rules appear to be working as
designed; the corpus simply isn't authored to the standard they encode.

So the corpus gives an **upper bound on noise** for the principle rules and no
signal at all about whether they are correct on patches that *do* follow the
conventions. The original blocker stands unchanged: 5 in-repo patches yielding
1 warning is still too thin to promote on. Item 3's promotion question needs a
corpus of Claude2Max-authored patches, which does not exist yet — that is a
finding about the plan, not a step that can be executed today.

### Recommendation

1. **Fix the block tier before promoting anything into it.** Ordered by
   measured impact: RNBO/frozen structural keys (−99% of `attribute-invalid`),
   mechanical alias harvesting (−41% of `object-unresolved`), gen/rnbo scope
   exclusion (−15%), package-wide abstraction search (−12%).
2. **Replace both hand-maintained alias tables with harvesting from refpage
   `@name`.** It is strictly more correct (56 vs 23, zero collisions, catches
   `mc.*~`, `ggate`→`gswitch2`, `swap`→`fswap`), and it removes a whole class
   of drift — the same class the `lookup_attribute`-vs-gate divergence already
   bit this repo once.
3. **Consider harvesting observed object names from the corpus**, mirroring the
   blessed `observed-attrs` pattern (`attrs = refpage ∪ jbox ∪ observed`).
   Carries a real tradeoff — see the open question below.
4. **Hold all warn→block promotion** until a Claude2Max-authored corpus exists.
5. Keep `prefer-v8` and `allcaps-name` at STYLE permanently (preferences).

### Open question — RESOLVED, and better than either option on the table

The question was how to resolve real-but-unrefpaged objects (`rnbo~`,
`jit.mo.*`, `jit.gl.layer`) without whitelisting gen operators (`history`,
`swiz`, `clamp`) as valid Max objects. Both proposed answers involved
harvesting from the corpus and tracking scope.

Neither was needed. **The Max install ships its own object database**, and it
draws the boundary correctly on its own:

- `Contents/Resources/C74/interfaces/obj-qlookup.json` — every object Max will
  instantiate (1,323 core), each optionally carrying an `alias` field naming
  what it is shorthand for (`v` → value, `i` → int, `f` → float, `t` → trigger).
- `packages/*/interfaces/obj-qlookup.json` — package objects.
- `packages/*/interfaces/max.db.json` → `maxdb.aliases` — package-level alias
  registry (`jit.mo.sin` → jit.mo.func, `jit.time` → jit.mo.time,
  `jit.gl.layer` → jit.gl.videoplane).

Together: 1,342 names and 361 aliases. It resolves every real object in the
residual **and rejects every negative control** — `oscparse`, `metroo`,
`jit.pwindo`, `bgcolorize`, and the gen operators `clamp`, `history`, `swiz`
are all absent from it, because they are not Max objects. The gen/Max boundary
is preserved for free, with no scope tracking and no corpus harvesting.

This is strictly more authoritative than anything derived: it is the database
Max itself consults, rather than an inference from what patches happen to
contain.

## Implemented — measured A/B (2026-08-20)

All four approved fixes landed, plus three tail fixes the measurement exposed.

**Method note.** The re-measurement is restricted to the 3,009 patcher files
inside `/Applications/Max.app` and excludes the `~/Documents/Max 9/Packages`
tier, because macOS began denying reads there (`Operation not permitted`)
between the first sweep and the re-run. Both arms of the A/B run over the
identical 3,009-file set, so the comparison is sound; the absolute totals are
not comparable to the 11,873-file figures earlier in this document. The "before"
arm runs the pre-fix code materialized from `git HEAD`, not a simulation.

| rule | before | after | change |
|---|---:|---:|---:|
| `attribute-invalid` (ERROR) | 21,487 | **95** | **−99.6%** |
| `object-unresolved` (ERROR) | 8,291 | **203** | **−97.6%** |
| **files with ≥1 error** | **1,590** | **169** | **−89.4%** |
| `maxclass-unresolved` | 229 | 124 | −46% |
| `presentation-required` | 5,210 | 4,606 | −12% (gen scopes no longer walked) |
| `allcaps-name` | 2,799 | 2,665 | −5% |
| `message-unverified` | 4,657 | 4,717 | +1.3% |

`message-unverified` rising slightly is expected and correct: objects that now
resolve (via alias or the object DB) have a checkable methodlist where before
they were skipped as unknown. It is a WARNING and explicitly a suspicion, not a
block.

### What changed

1. **Max's object database is now a resolution source** —
   `RefpageCache.object_db()` loads `obj-qlookup.json` + `max.db.json` aliases;
   `_GateResolver.resolve_object` consults it for existence when refpage and
   package library both miss.
2. **The alias table is harvested, not hand-written** —
   `RefpageCache.name_aliases()` reads each refpage root's `name` attribute
   (`div.maxref.xml` declares `name="/"`). The two hand-maintained tables are
   replaced; `_VERIFIED_WORD_ALIASES` now holds only the shorthands nothing
   mechanical can discover (`t`, `sel`, `s`, `r`, `b`, `del`, `j`, `i`, `f`, `v`).
3. **Foreign-language scopes are not walked** — `_iter_patcher_scopes` no longer
   descends into `gen` / `gen~` / `jit.gen` / `jit.pix` / `jit.gl.pix` /
   `jit.gl.slab` / `jit.expr` / `rnbo~` boxes.
4. **Tool-stamped attributes are not attributes** — `rnbo*` / `frozen*` are
   skipped by `rule_attribute_resolves`, matching the filter the resolver
   already applied to the observed-attrs allowlist.
5. **Bundled abstractions resolve** — abstractions under
   `Max.app/.../patchers/**` and `packages/**` (M4L.*, pluggo.*, thru, ~700
   others) are on Max's search path; matched case-insensitively, as Max does.
6. **Package refpages nested a level deeper are found** — RNBO ships
   `packages/RNBO/docs/refpages/max/rnbo~.maxref.xml`; the flat check missed it.
7. **Bare numbers and `linecount`** — a numeric object-box text (`5`, `-1`,
   `1.`) is an int/float constant, not an unknown object; `linecount` is
   universal box metadata (observed across unrelated classes, in no refpage).

### Sensitivity re-verified — the gate still catches guesses

The point of the gate is unchanged and confirmed working after every fix:

- `oscparse`, `metroo`, `jit.pwindo`, `bgcolorize`, `notarealobject~` → all
  still unresolved; a spec containing `oscparse` still **blocks** convert (exit 1).
- gen operators (`clamp`, `history`, `swiz`) written in a *Max* scope → still flagged.
- `bgcolor` on `live.gain~` → still `attribute-invalid`; `coldcolor` still valid.
- All 38 golden tests in `mcp_server/tests/test_verify.py` pass unchanged.
- The five in-repo `patches/*.maxpat` verify identically to before the change.

And the reported defect is gone: the `[/ 2]` + `[i]` spec that was blocked now
builds, leaving only the (correct) `presentation-required` warning.

## Immediate read (Sonnet's first-pass observations — SUPERSEDED by the section above)

A few things worth flagging for the Opus read, without deciding them:

- **`hidden-box-cord-visible` is the single biggest hitter** (44,854 hits,
  4,236 files) — worth checking whether its firing condition is too broad
  for patches that were never authored with the "hide plumbing cords"
  convention in mind, vs. genuinely catching something. C74's own patches
  have no reason to follow that convention, so a high hit count here may be
  expected noise rather than signal — but it's the rule most in need of a
  false-positive read given its volume dwarfs everything else.
- **`object-unresolved` (5,053 distinct files) and `attribute-invalid` (946
  files) are ERROR-tier already** and already block `convert`. This sweep is
  the first time they've been run at corpus scale — worth sampling actual
  hits (not just trusting the count) to confirm they're catching real
  invented names and not, say, package-only objects the resolver doesn't
  know about, or attributes valid on newer/older Max versions than this
  machine's refpage set.
- **`presentation-required` (8,676 distinct files — the widest reach of any
  rule)** matches the task's own prediction almost exactly: "a rule that
  flags thousands of C74's own patches is measuring our preference, not a
  defect." This one was anticipated to be noisy against the corpus; the data
  confirms it. Strong candidate to stay WARNING (never promote), consistent
  with the task body's own framing.
- **`allcaps-name` and `prefer-v8` are STYLE already** and were never
  candidates for promotion — the task body says as much for `prefer-v8`
  explicitly. Numbers here are for completeness, not a promotion question.

## Driver script (for reference / re-run)

The exact script used, `corpus_sweep.py`, iterates
`maxhelp/maxhelp_crawl_state.json`'s file list, builds one resolver up front
(`spec2maxpat.build_resolver()`), and calls `verify_patch_file()` per file —
i.e. it is a thin wrapper around the item-1 deliverables, not new checking
logic. It was run from the session scratchpad and is not part of the repo's
permanent tooling; if this needs to become a repeatable repo command, prefer
extending `spec2maxpat.py verify` (e.g. a `--from-crawl-state` flag reading
`maxhelp_crawl_state.json` directly) over keeping a separate script.
