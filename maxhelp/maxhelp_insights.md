# .maxhelp Corpus Insights

Discoveries from reading Cycling '74's shipped help patches (and installed
package help). Topic-organized like `c74-forum/forum_insights.md`. Entries
broadly useful enough to migrate into the reference docs are marked
**[PROMOTION-CANDIDATE]** with a target file.

See `MAXHELP_CRAWL_LOG.md` for the crawl recipe and coverage. The mechanical
attr-tally (`maxhelp_observed_attrs.json`, all patcher kinds) and the JS API
census (`maxhelp_js_api.json`) are complete corpus-wide; prose extraction is
just beginning.

The attr-tally now spans **all patcher document kinds**, not just help patches:
`.maxhelp` (5,264) + `.maxpat` abstractions/bpatchers/examples (6,498) + `.amxd`
Max for Live devices (104) = **11,866 files / 797,407 boxes / 4,201 distinct
objects**. Broadening past `.maxhelp` raised refpage-gap coverage from 323→498
objects (829→1,155 attrs) and no-refpage objects from 2,527→3,180, and put the
four silent-no-op confirmations on a ~13K-box-per-class sample. The numbers
below reflect the full patcher corpus.

---

## Attribute ground truth — the observed-attrs map

The whole-corpus attr-tally (5,264 files, 306,478 boxes, 3,496 distinct
objects) produced `maxhelp_observed_attrs.json`: for each object, the set of
attributes Cycling '74's own patches actually set, with occurrence counts.
Cross-checked against the live resolver (`refpage ∪ jbox`), three categories
emerge.

### 1. Real refpage gaps the union should fill — [PROMOTION-CANDIDATE → spec2maxpat.build_resolver]

323 objects that *have* a refpage carry ≥1 observed attribute absent from
`refpage ∪ jbox` (829 distinct). The high-frequency, clearly-real ones:

- `comment` → `linecount` (26,026×), `frgb` (foreground rgb, 2,081×),
  `presentation_linecount`.
- `message` / `umenu` → the `bgfillcolor_*` family (`bgfillcolor_color`,
  `_color1`, `_color2`, `_type`, `_autogradient`, `_proportion`, `_angle`) —
  the modern gradient-fill attribute group, set together (~3,400× on message).
- `flonum` → `format` (6,840×). `number~` → `sig`, `mode` (1,561× each).
- `inlet` / `outlet` → `index` (5,363× / 4,969×) — the inlet/outlet ordinal.
- `bpatcher` → `viewvisibility` (6,103×), `extract`.
- `panel` → `proportion` (4,598×), `pt1`, `pt2`.
- `js` → `filename` (1,764×); `jsui` → `embedstate`.
- `live.dial` → `parameter_enable` (1,702×) — i.e. the parameter system flag is
  on essentially every live.* object in the corpus.
- `style`, `linecount` recur as gaps on many text objects (`prepend`, `route`,
  `loadmess`, `loadbang`, `print`, `t`) — both are real, broadly-inherited.

**Integration:** union `maxhelp_observed_attrs.json` into the valid set so it
becomes `own refpage ∪ jbox ∪ observed-in-help`. Apply a frequency floor
(observed on ≥3 boxes) to drop one-off noise. This cuts false positives without
weakening real-error detection. See cautions below.

### 2. The 4 gate-flagged production attrs are confirmed silent no-ops — [resolved]

DESIGN_DECISIONS.md § (h) flagged `panel/locked_bgcolor`,
`number/tribordercolor`, `multislider/contrast`, `multislider/bgfillcolor` as
suspected silent no-ops (absent from refpage AND jbox). The whole-corpus tally
confirms it independently: **none of the four appears on ANY box** across 5,175
`panel` / 6,316 `number` / 1,537 `multislider` boxes in the entire help corpus.
Three independent signals (refpage, jbox, every shipped patch) all agree these
are family-resemblance guesses a prior session introduced, not refpage gaps.
The observed map will NOT mask them — exactly the desired behavior.

### 3. Objects with no enumerable refpage — observed-attrs is the sole source

2,527 of 3,496 distinct objects return `(None, "no-refpage")` from
`resolver.attrs_for` today, so the checker validates none of their attributes.
Two sub-cases:

- **Operator / abbreviation aliases counted as no-refpage** — `t`, `*~`, `+`,
  `*`, `s`, `sel`, `r`, `-`, `/`, `&`, `>>` all rank near the top of the
  "no-refpage" list, but they DO have refpages via the alias map. The cause is a
  real resolver gap (see § Resolver-integration notes). Not genuinely missing.
- **Genuinely-no-refpage package externals** — `bach.print`, `rnbo~`, `imubu`
  (127 distinct attrs!), `o.display`, `fl.tomax~`, `bach.roll` (239 distinct
  attrs!). For these the help-patch observed set is the only attribute ground
  truth in the toolkit. High-vocabulary externals (`imubu`, `bach.roll`) are
  where this matters most — no other source enumerates their attributes.

**Caution:** for no-refpage objects the observed set is a *positive allowlist
only*. Help patches don't exercise every attribute, so "not observed" does NOT
prove "invalid" — never use the observed set to FLAG attrs on a no-refpage
object, only to confirm known-good ones.

---

## Resolver-integration notes (for the payoff-#1 session)

When wiring `maxhelp_observed_attrs.json` into `spec2maxpat.build_resolver`:

1. **[PROMOTION-CANDIDATE → spec2maxpat] `attrs_for()` doesn't alias-resolve.**
   `resolve_object()` applies the operator/abbreviation alias map
   (`+`→plus, `t`→trigger, …) but `attrs_for()` calls `self._rp.lookup(name)`
   on the raw name, so `attrs_for('t')`/`attrs_for('+')` return `None` and skip
   attribute validation for every operator box in a real patch. Mirror the
   alias resolution from `resolve_object()` into `attrs_for()` so operator
   attributes get checked. (Independent of the help corpus, but surfaced by it.)

2. **Filter export/freeze artifact keys before unioning.** The tally captures
   keys RNBO-export and the freeze feature inject, which are not user-facing
   object attributes: `rnbo_serial` (6,442×), `rnbo_classname`, `rnbo_uniqueid`,
   `rnbo_extra_attributes`, `rnboinfo`, `rnboattrcache`, `rnboversion`,
   `frozen_object_attributes`, `frozen_box_attributes`. Drop any key matching
   `^rnbo` or `^frozen` at integration time. Harmless if left in (a user would
   never typo them), but they pollute the "real attributes of this object" view.

3. **Apply a frequency floor.** Use observed-on-≥3-boxes to admit an attr into
   the union; one-off keys are more likely export/version cruft than real attrs.

4. **Object-name keying matches the resolver.** The map keys objects exactly as
   the resolver looks them up: first whitespace token of `text` for `newobj`,
   else the `maxclass`. So a union is a direct `valid |= observed.get(name, {})`.

---

---

## Max JavaScript API ground truth — the JS census

`extract_js_api.py` classified 8,811 `.js`/`.mjs` files and tallied the API
surface of the **477 in-process** `js`/`v8`/`jsui` files + **20 Node-for-Max**
files (8,314 were RNBO runtime / npm libs / web assets, correctly excluded).
Everything below was extracted structurally (regex over `new X(`, `function
name(`, declarations, calls) and ranked by how many independent files use it —
**no API name was written from memory**, so this is a clean empirical record of
the real vocabulary. Output: `maxhelp_js_api.json`.

### Constructors — the Max JS host classes that actually get used

By file count: `JitterObject` (45), `Task` (36), `Dict` (25), `JitterMatrix`
(24), `Buffer` (12), `JitterListener` (10), `Global` (10), `File` (8), `Image`
(7), `MGraphics` (6). (Generic JS — `Array`, `RegExp`, `Date`, `Error`, `Map` —
also rank, as expected.) This cross-validates `JITTER_JS_PATCHING.md`: the
Jitter trio (`JitterObject`/`JitterMatrix`/`JitterListener`) dominates the host
classes, and `Task`/`Dict`/`Buffer`/`Global` are the non-Jitter mainstays.

### Lifecycle handlers — the function names a Max JS object defines

`bang` (98), `paint` (44, jsui), `onclick`/`onresize`/`ondrag`/`ondblclick`
(jsui mouse + layout), `list` (30), `anything` (29), `msg_int`/`msg_float`
(29/19), `loadbang` (24), `notifydeleted` (20), `setvalueof`/`getvalueof` (14
each — the `pattr` integration pair), `jit_matrix`/`jit_gl_texture` (13/11 —
Jitter message handlers), `onidle` (9). These are the canonical entry points;
`draw`/`drawfx` (24 each) are the jsui paint helpers.

### Globals & declarations

Called globals: `outlet` (384), `inlet` (141), `post` (83), `declareattribute`
(55), `error` (53). Top-level declarations: `outlets` (137 files), `inlets`
(118), `autowatch` (52), `inspector` (4). Confirms the converter's requirement
that `js`/`v8` specs declare `inlets`/`outlets` explicitly — that's how every
real file does it.

### Node-for-Max is a separate, tiny surface

Only 20 files import `max-api`; their handlers register via
`Max.addHandler("name", …)`. Distinct from the in-process API (no `outlet()`
global; uses `Max.outlet`/`Max.post`). Kept in its own `node_handlers` bucket.

**[PROMOTION-CANDIDATE → patching/JITTER_JS_PATCHING.md + SPEC_REFERENCE.md v8
section]:** the ranked constructor/handler/declaration lists are a
documentation-ready "this is the real Max JS surface" reference. Fold the top
constructors and lifecycle handlers into the JS guidance so future `v8` work
mirrors observed convention rather than guessing.

---

## Wiring idioms & per-object gotchas

*Extracted from core `help/max/` (2026-06-27). Each entry is confirmed from
the `.maxhelp` text; nothing written from memory. Mark promotion candidates
with target file.*

---

### Timing & clock

**`metro` — transport sync and musical time**

- `metro 4n @active 1` — ties the metro to the global transport and fires in
  quarter notes. All Max time-format strings (`4n`, `1.2.12`, `0:0:2.500`)
  work as the interval argument. Passing `@active 1` makes it start
  automatically when the transport starts without a separate `start` message.
- `metro @defer 1` — pushes metro bangs to the low-priority queue, avoiding
  audio-scheduler conflicts. `qmetro` is NOT a separate class; it is exactly
  `metro @defer 1` and the help patch says so. Always use `qmetro` in code
  documentation or comments where you'd say "low-priority metro" — never say
  "the qmetro class" as if it differs from metro.

**`clocker` — elapsed time output companion to metro**

- `clocker 1000` — driven by the same transport or by `bang`, outputs elapsed
  ms since last `reset`. The interval arg sets the meter denominator.
  `reset` resets the counter only (doesn't stop); `stop` stops output.
- Float arg form: `clocker 4n` — tempo-relative, same time-format as metro.
  Works alongside `bbus`-based timing.

**`delay` vs `pipe`**

- `delay` — delays a single bang by N ms; input in the right inlet sets the
  time. Accepts tempo-relative time strings when transport is running.
- `pipe` — delays full lists (and any message type). Separate right inlet for
  each list slot plus a time inlet. Key distinction: `pipe` can delay
  heterogeneous lists (`pak 0 0. s` → `pipe 500`); `delay` only delays bangs.
- **`pipe` + `coll` for arbitrary-data delay** (from help patch "DelayAnythingWithAnyLength"):
  send data to `coll` indexed by a counter; delay only the counter index
  through `pipe`; on the delayed bang, retrieve from `coll` by that index.
  This pattern handles variable-length lists or any data type that `pipe`
  can't accept natively.
- `pipe @quantize 4n` — quantizes pipe's output to the next beat boundary.

**`defer` / `deferlow`**

- `defer` — moves a message from the audio-rate scheduler to the main
  low-priority thread. This reverses output ordering: if you `trigger b b`
  and only the left outlet goes through `defer`, the deferred branch fires
  AFTER the un-deferred branch even though `trigger` fires left-to-right.
  Use `defer` anywhere a buffer or audio operation (like `waveform~`) must
  receive a message from an audio-thread callback.
- `deferlow` — very low priority; fires after ALL pending low-priority events
  (including `defer`). Use when order-of-operations with multiple deferred
  sources matters. The help patch shows: a `uzi 64 → t l l → deferlow` pair
  — both arms fire but `deferlow`'s arm always arrives after all 64 triggers'
  left-arm output.

---

### Fan-out & sequencing

**`trigger` — right-to-left fire order, constant injection**

- Outlets fire **right-to-left**: the rightmost argument outputs first.
  Reading `t b l` left-to-right, the LAST symbol fires first. This is the
  single most commonly misunderstood rule in Max. When you need "do A then B",
  A's outlet goes RIGHTMOST. Example: clear a menu then fill it: `t l b` —
  outlet 1 (`b`, rightmost, fires first) → clear; outlet 0 (`l`) → fill.
  **[PROMOTION-CANDIDATE → patching/MAX_PATCHING.md Common Pitfalls — already present; reinforce with the menu example]**
- Constant values in trigger arguments inject that constant into the output
  chain: `t b -0.125` outputs bang (right, first) then the constant `-0.125`
  (left, second). Used to inject offsets, seeds, or state-resets mid-chain
  without extra message boxes.
- `bangbang` / `bb` — trigger with all-bang outlets. `b 3` = three bang
  outlets. Cleaner than `t b b b` when only bangs are needed.

**`gate` vs `switch`**

- `gate N` — one inlet routes to one of N outlets. `gate N 2` sets outlet 2
  open at load (2-indexed from 1). Sending `0` closes all outlets. Passes
  ALL message types, not just bangs. Right-most-always idiom: the "outlet
  select" message arrives at the left inlet; data at the right.
- `switch N` — opposite of gate: selects ONE of N data inlets and routes it
  to the single outlet. Use switch when you have N sources and want to monitor
  or route one at a time; use gate when you have one source and want to
  distribute it conditionally.
- **[PROMOTION-CANDIDATE → patching/MAX_PATCHING.md preferred-objects table]**:
  explicitly distinguish gate and switch — their names are confusing (gate =
  distributor, switch = selector) and beginners often reach for the wrong one.

---

### Routing

**`route` — type dispatch and `set`-message stripping**

- `route int float list` — dispatches by **message type**, not value. Useful
  for making an object handle ints, floats, and lists through different
  signal chains without explicit `zl.len`/`type-check` logic.
- `route set` — strips the `set` selector from a `set N` message and outputs
  just the bare int/float. Pattern: UI sends `set 42` to update a number box
  without triggering output; `route set` can intercept and re-emit the value.
- Multiple matches are possible when mixing type names and symbol names.
- `routepass` variant: unmatched messages pass through to ALL outlets
  (including match outlets), not just the rightmost "else" outlet. Use when
  you want both a specific branch AND pass-through.
- Shorthand: `sel` = `select`; these are different from `route`:
  `select`/`sel` matches on value (int or float or symbol); `route` matches
  on the leading selector symbol or message type.

**`select` — float fuzzy matching**

- `@fuzzy 0.001` attribute — essential when the input comes from a UI object
  (dial, slider) that outputs long floating-point values like `0.14999999`.
  Without `@fuzzy`, `select 0.15` misses those inputs. The help patch calls
  out this exact failure. Always add `@fuzzy 0.001` when using `select` with
  float values from UI sources.
- `@matchfloat` attribute also affects float-matching behavior.
- Right inlet sets the match value at runtime (same as `set` message).

---

### List construction & manipulation

**`pack` / `unpack` — inlet-type conversion rules**

- Each inlet's type is set by its **creation argument**, not by what arrives.
  An `int` inlet silently **truncates floats** to int. A `float` inlet
  promotes ints to float. A `symbol` inlet only passes symbols.
- `set` message updates the FIRST element without triggering output. Use this
  with `trigger` to update and then fire: `t i i → [set $1] → pack`.
- `nth $1` message — outputs only the Nth element from the assembled list.
  Useful for extracting a single slot without unpacking the whole list.
- Right inlets store values; ONLY the left inlet also causes output.
- **Conversion cheat-sheet** (from help patch): int inlet: float→truncated,
  symbol→blank; float inlet: int→promoted, symbol→blank; symbol inlet: int
  and float→blank, only symbols pass through.

**`iter` and `uzi`**

- `iter` — explodes a list into individual items fired synchronously.
  "Can be used to play chords from lists" — each item goes downstream in
  sequence within the same scheduler tick.
- `uzi N` — fires N bangs synchronously (like iter but for bangs). Second
  arg sets the base index of the counter outlet. `break` pauses mid-run;
  `resume` continues. Carry outlet fires when the last bang fires.

**`append` / `prepend`**

- `append` adds words at the END of the incoming message; `prepend` adds at
  the START. Both use `set` to change their word(s) at runtime.
- `prepend` is the canonical way to build selector-prefixed messages from
  UI output: `prepend setport` turns an int into `setport N`. This is the
  main plumbing pattern for driving `[node.script]` and similar objects.

**`sprintf`**

- `symout` as the first argument makes `sprintf` output a single symbol
  instead of a parsed list: `sprintf symout %s%i` joins a symbol and int
  into one concatenated symbol. Critical for file paths and OSC addresses
  where spaces would split the output into a list.
- Use `%ld` for integers (not `%d`) — Max's sprintf is C-style; `%d` may
  produce unexpected results on 64-bit.
- `%c` converts ASCII codes to characters: `76 79 86 69` → `LOVE`.
- For building file paths: chain `sprintf symout %s%s`, then `prepend open`
  to produce `open MyHD:/Folder/file.aiff`. Don't try to build the path in a
  message box with a `$1` — use sprintf to assemble it first.
- **[PROMOTION-CANDIDATE → patching/MAX_PATCHING.md Common Pitfalls]**: When
  building selector-prefixed paths (e.g. `open <path>`), use `sprintf symout`
  to produce a single symbol, then `prepend open`. Using a message box
  `open $1` works only if the path is a single symbol with no spaces.

**`tosymbol` / `fromsymbol`**

- `tosymbol` — concatenates a list into a single symbol. Default separator is
  none (items glued together). `separator /` attr inserts `/` between items;
  `separator` with no args removes all spaces; `separator " "` restores
  space as separator. Use for building OSC address strings from multiple path
  segments.
- `fromsymbol` — splits a symbol at the separator character (default: space).
  `@separator /` splits paths: `/my_device/param/42` → list. Use to parse
  incoming OSC addresses or colon-separated identifiers like MAC addresses
  (`separator :`).

---

### Data storage

**`coll` — core patterns**

- `refer <name>` — redirects the coll to a differently-named coll. All
  subsequent read/write operations apply to the new name. Pattern: share
  data between multiple coll objects by giving them the same name, or switch
  between datasets by `refer`-ing.
- Symbol association: `assoc <symbol> <index>` binds a symbol to a numeric
  index; `symbol <sym>` then retrieves as if you sent the integer. `deassoc`
  removes the binding. `subsym <old> <new>` replaces one symbol alias with
  another. These are the only ways to use non-numeric keys in a coll.
- `swap 1 2` — exchanges data at two indices without temp storage.
- `renumber` — renumbers from 1 sequentially; `renumber N` starts from N.
  Use after gaps in the index space accumulate.
- `sort 1` — sorts entries by first element of their value list.
- File I/O: `read`/`readagain`/`write`/`writeagain`. Named colls (creation
  arg) that set `@savemode 1` are saved with the patcher. Colls backed by
  a file can be edited in Max's external text editor (Inspector → "Open in
  Text Editor" affordance).
- `open` opens the built-in coll editor window (like double-clicking).

**`dict` — nested access and embedding**

- `::` double-colon for nested key access: `get wheels::front::spokecount`.
  Arbitrary depth. No whitespace in key strings.
- `[N]` for array elements: `get drivetrain::cassette::cogs[2]`. Indexing
  starts at 0. Set with `set drivetrain::cassette::cogs[9] 25`.
- `gettype <key>` — returns the type of the value at a key (`integer`,
  `float`, `symbol`, `list`, `dictionary`).
- `getsize <key>` — returns the number of elements at a key (array length
  or 1 for scalars).
- `@embed 1` — dict content is saved with the patcher (not in a separate
  file). **[PROMOTION-CANDIDATE → SPEC_REFERENCE.md dict attrs]**: `@embed`
  is the primary way to ship initial data with a patch.
- Setting a nested dict from another named dict: `set wheels::bob dictionary nouns`
  — inserts the dict named "nouns" as a sub-dict under `wheels::bob`.
- Complex structures (arrays of dicts) are better accessed in `[v8]`/`[js]`
  than in a patcher: the help patch says "Accessing complex structures such as
  arrays of dictionaries is best done using the js object."
- `combine` — merges two dicts; `@triggers 0 2` controls which inlets trigger
  output. The argument convention is "outlet triggers on inlet N" — read the
  refpage before using, as the numbering is not obvious.

**`table` — traversal messages and second outlet**

- `prev` / `next` — retrieve the previous or next value without sending an
  explicit index. Companion to `goto N` which sets the current index.
- `goto 0` + repeated `next` bangs = sequential dump without using `dump`.
- `inv $1` — inverse lookup: returns the FIRST index whose value is greater
  than the argument. Use for threshold-crossing detection.
- `dump` — outputs all values as a sequence of ints (index not included).
  `length` outputs the table size; `sum` outputs the sum of all values.
- **Second outlet** — bangs whenever the user changes a value in the table's
  editor window. Wire this to a `print` or save-trigger so UI edits don't
  silently fail to propagate.
- Named tables share data (two `table myTable` objects see the same values).
  `refer` redirects at runtime.

**`value` / `pv` — scoped shared state**

- `value` / `v` — global (patch-wide) shared scalar storage. All `value foo`
  objects in the entire Max environment share the same value. Ints, floats,
  lists, and symbols. Creation arg initializes: `value foo 60 70 80` initializes
  to the list `60 70 80`. Bang recalls current value.
- `pv` — patcher-scoped: `pv public` crosses to parent/sibling patchers;
  `pv private` stays inside the current patcher. Same storage model as value,
  but scoped. Creation args initialize; `status` message reports all linked
  objects. Use `pv` over `value` whenever the scope should NOT be global.
- **[PROMOTION-CANDIDATE → preferred-objects table in CLAUDE.md]**: add `pv`
  as the preferred choice over `value` when sharing state within a subpatcher;
  use `value` only when truly global state is needed.

---

### Initialization

**`loadbang` and `loadmess`**

- `loadbang` — fires at patcher load. Double-clicking (or banging) also fires.
  Shift-Cmd (Mac) / Shift-Ctrl (PC) disables loadbang firing at load — useful
  for testing patches without triggering initialization.
- `loadmess <value>` — outputs a message at load. `loadmess 42` outputs the
  int 42; `loadmess 3.14 22` outputs the list; `loadmess cycling 74 9` outputs
  the symbol-headed list. Bang also triggers output (same as double-click).
  Use `loadmess` over `[loadbang] → [message <val>]` chains — one object.

**`change` — value filtering and direction**

- `change` — only passes a value when it DIFFERS from the previous one.
  Second outlet fires on nonzero→zero transition; third on zero→nonzero.
- `change 0.` (float arg) — enables float change detection.
- `change +` / `change -` — directional modes. `+` outputs 1 when increasing;
  `-` outputs -1 when decreasing. Wire to `sel 1` / `sel -1` for rise/fall
  edge detection.
- `set N` — stores N without output, setting the baseline for comparison.

**`onebang` — first-pass gate**

- Passes only the FIRST bang after a right-inlet reset. Subsequent bangs go to
  the right outlet until a reset arrives. Right outlet fires when a non-first
  bang arrives with no pending reset.
- `onebang 1` — auto-resets after each pass (effectively the same as `change`
  for bangs but with an explicit blocking output).
- Canonical use: "detect the first time middle C is played; ignore subsequent
  occurrences until reset" — the help patch shows exactly this.

---

### Output & debugging

**`print`**

- Label arg distinguishes outputs in the Max console: `print label` prefixes
  every line with `label:`. Essential for multi-print patches.
- `@popup 1` — opens a local floating window instead of the console. Use for
  debugging inside a presentation where the console isn't visible.
- `@time 1` — prepends the scheduler time to each line.
- `@deltatime 1` — prepends time elapsed since the last message. Use for
  timing profiling.
- `@floatprecision N` — sets the float precision for display.
- **[PROMOTION-CANDIDATE → patching/MAX_PATCHING.md]**: `@popup 1` is the
  debug idiom for patches where the console isn't accessible. Suggest it
  as the first debug step in any presentation-mode context.

---

### Send / receive scope

**`send` / `receive` and dynamic naming**

- `r` / `s` — shorthand aliases for receive/receive. Both are unambiguous.
- `receive` without a creation arg grows an **inlet** that accepts a `set <name>`
  message at runtime to change which sender it's listening to. Same for `send`.
  Pattern: `[umenu] → [prepend set] → [receive]` to dynamically switch
  which send/receive bus a receiver monitors.
- `send` / `receive` are patcher-global (visible to all patchers in the same
  Max environment); they do NOT scope to the containing subpatcher.

---

### Number box (`number`)

- `min N` / `max N` — set bounds; `min` / `max` (no args) removes them.
- `set N` — stores value without output (no bang from the right outlet).
- Tab outlet — fires when the user presses Tab while the number box is
  selected. Wire to `select` objects to chain tab focus across number boxes.
- Format inspector options: Decimal (int/float), Roland Octal — set in the
  Inspector, not via messages. The `@format` attribute controls this (also
  confirmed by the attr-tally: `format` appears 6,840× on `flonum` in the
  help corpus).

---

## MSP audio objects — wiring idioms & per-object gotchas

*(Pass 2 — 2026-06-27 — core `help/msp/`)*

### buffer~

- **Creation arg = duration in ms.** `buffer~ NAME 1000` creates a 1-second mono buffer named `NAME`. Second arg is optional channel count (`buffer~ NAME 1000 2` = stereo).
- **`fill` command family** — many ways to pre-load a buffer without a file:
  - `fill sin N` — N cycles of a sine wave; `fill cos N` — cosine; `fill sinc N` — sinc with N zero-crossings.
  - `fill 0.5` — constant value; `clear` — zero all samples.
  - `apply hamming` / `apply triangle` / `apply gain 0.9` — post-process the buffer contents. Cumulative — can chain: `fill 1, apply triangle half, apply gain -1, apply offset 1`.
- **`normalize 1.`** — scale all samples so the maximum value is 1. Destructive.
- **`sizeinsamps 1024`** — resize the buffer to exactly N samples (useful when building a wavetable for `cycle~`).
- **`resize N`** — resize to N ms (alternative to `sizeinsamps`).
- **`peek~` / `poke~`** — the signal-rate equivalents of `index~`/`record~`; `peek~` reads from a named buffer by sample index at signal rate. Used internally in the help patch to hand-generate a wavetable.

### groove~

- **Drive with a `sig~ 1` into inlet 1** — groove~'s right inlet is playback speed as a signal. `sig~ 1` = normal forward speed. `sig~ 0` = freeze. `sig~ -1` = reverse (when `@loop 1`).
- **`@loop 1` attribute** — enables looping. Without it, groove~ plays once and stops.
- **`@timestretch 1`** — enables timestretching (pitch stays constant while playback speed changes). Adds CPU cost.
- **`@followglobaltempo 1`** — syncs the loop to Max's global transport tempo. Combine with `@loop 1`. Send `originallength <ticks>` to tell groove~ the loop's original duration (e.g. `originallength 1.0.0` = 1 bar).
- **`phase <value>`** — offset the loop start phase. Accepts metrical time format (`phase 8n`).
- **`replace <filename>`** — load a new audio file into the associated `buffer~` by name. Convenient for swapping files without clicking `waveform~`.
- **`waveform~`** — the companion display object; shows the buffer content. Double-clicking opens the editor. Sends start/end selection positions out its outlets.

### record~

- **Inlet 0 = start/stop toggle, inlet 1 = audio input.** Send `1` to start recording, `0` to stop — not `bang`.
- **`@append 1`** — append-mode: new recordings add after existing content rather than overwriting from the start.
- **`@loop 1`** — loop recording: wraps around when the buffer fills.
- **`set <name>`** — switch to a different buffer~ by name without recreating the object.
- **Sync outlet (outlet 1)** — emits a ramp from 0. to 1. tracking progress through the buffer. Useful for syncing a display or a groove~ reader.
- **After recording, play back** with `play~ BUFNAME` or `groove~ BUFNAME`.

### wave~

- **`wave~` requires a `phasor~` driver** — wave~ reads from a named buffer~ using a 0.–1. phase signal as its position. Wire `phasor~` frequency outlet into wave~ inlet 0, then `freq` signal into phasor~ for pitch.
- **Start/end points** — inlet 1 = start offset (ms), inlet 2 = end offset (ms). Can be signals or floats. Default: full buffer.
- **vs `groove~`:** groove~ is self-clocking (speed signal); wave~ is externally-clocked (phase signal). Use groove~ for sample playback; use wave~ for wavetable synthesis where phasor~ frequency IS the pitch.
- **`set <name>`** — switch buffer by name.

### line~

- **Standard ramp idiom: `<initial>, <target> <duration_ms>`** — send a message like `0, 1 2000` to ramp from 0 to 1 over 2 seconds. The comma makes it a single message with an initial value set immediately followed by a list.
- **Multi-segment:** `0, 1 1000 0 500` = ramp to 1 over 1s, then to 0 over 500ms. Up to 128 value-time pairs.
- **`stop`** — halts the ramp at the current value.
- **`pause` / `resume`** — suspend and resume mid-ramp.
- **`@activeout 1`** — adds a second signal outlet that outputs `1` while the ramp is running, `0` when idle. Useful for gating downstream when line~ is busy.
- **`@maxpoints N`** (default 129) — increase for multi-segment ramps with more than 129 breakpoints.
- **Metrical time format works:** `0, 1 2n 0 2.0.0` ramps to 1 over 2 beats then back to 0 over 2 bars. Requires global transport running.

### adsr~

- **Designed for use inside `poly~`** — adsr~ is the standard envelope for polyphonic synths. It handles voice stealing, anti-click retriggering, and DSP-on/off switching per voice. Using it outside poly~ is possible but misses most of its value.
- **Inlets: 0=gate, 1=attack ms, 2=decay ms, 3=sustain level (0–1), 4=release ms.**
- **Send `1` to start (note on), `0` to release (note off).**
- **`@retrigger N`** — sets retriggering time in ms (default 5ms). When a new note-on arrives before release, adsr~ ramps to 0 quickly, allowing parameter changes, then triggers the new attack.
- **`legato 1`** — when retriggering, skips the ramp-to-0 phase (envelope continues from its current level). Useful for legato phrasing.
- **`target 0`** from outside poly~ broadcasts to all voices simultaneously. Use `target N` for voice-specific control.
- **Metrical time args** — attack/decay/release times accept tempo-relative formats: `adsr~ 4n 4n 0.3 4n`. Requires global transport.

### phasor~

- **Right inlet = frequency; right inlet with a signal = phase-reset trigger.** A non-zero signal sample resets the phase to 0 at that sample. `edge~` output fed into phasor~'s right inlet makes a sync-to-zero on a rising edge.
- **`@syncupdate 1`** — frequency only updates at the beginning of each cycle (when phasor wraps to 0). Prevents pitch glitches when changing frequency mid-cycle — especially useful when driving `wave~` for wavetable synthesis.
- **`@jitter <amount>` + `@limit <amount>`** — introduce randomized per-cycle frequency deviation. Creates natural ensemble spread. Change `limit` to increase/decrease divergence. Combined with `mc.phasor~` and `mc.wave~` for multi-voice chorus.
- **Oscillator sync:** connect one phasor~'s output into another phasor~'s right inlet via `<~ 0` + `delta~` to create hard sync effects (the slave resets on the master's negative edge).
- **vs `saw~`:** phasor~ is a pure mathematical ramp — use for LFOs, wavetable position, sync sources. Use `saw~` for audio-rate oscillators (bandlimited, no aliasing).

### saw~ / tri~ / rect~

- **All three are bandlimited** — they apply anti-aliasing internally. Never use `phasor~` as an audio oscillator; use `saw~` instead.
- **Oscillator sync:** all three accept a `phasor~` signal in their right inlet (same reset-signal mechanism as `phasor~`). Creates hard sync effects.
- **`rect~` second arg = duty cycle** (0.–1., default 0.5 = square). Change with a signal or message: `rect~ 440. 0.25`.
- **`tri~` has a moveable peak:** second arg or signal = symmetry point (0.=ramp-down, 0.5=symmetric triangle, 1.=ramp-up). Can make a sawtooth-style shape from tri~ by setting to 0 or 1.
- **Pitch control:** inlet 0 = frequency in Hz. Wire `mtof` output here for MIDI-to-frequency conversion.

### noise~ / rand~

- **`noise~`** outputs white noise (all frequencies, full amplitude). No arguments, no inlets. Just wire it.
- **`rand~`** outputs a band-limited random signal that generates new random values at a given rate (arg = Hz). The output ramps between values — useful as a slow random LFO. **Not white noise** — use for randomly ramping control-rate signals at audio rate. For true randomness, use `noise~`.

### tapin~ / tapout~

- **`tapin~` arg = maximum delay time in ms.** This sets the buffer size — cannot change after instantiation. Typical: `tapin~ 5000` = 5 seconds max delay.
- **`tapout~` args = delay times (ms), one per outlet.** Multiple tapout~ delay times give multiple delay taps off a single tapin~. All tapout~s connected to the same tapin~ share its buffer.
- **`tapin~ → tapout~` is the standard delay idiom.** Do not use `delay~` — tapin~/tapout~ is the canonical pair (see CLAUDE.md preferred objects table).
- **Minimum delay = signal vector size.** The shortest delay available is one vector (typically 64 or 256 samples depending on audio settings). Trying to set shorter causes audio artifacts. The help patch notes this explicitly.
- **Continuously variable delay time** — send a signal into tapout~'s right inlet for smooth delay time modulation. For click-free changes, crossfade the output through a `line~`-controlled VCA: fade to 0 → change delay time → fade back to 1. Help patch shows this exact pattern with `pipe 25` for a 25ms fade time.
- **`clear`** — wipes the delay buffer content (fills with zeros). Useful to remove old material when changing delay time drastically.
- **Feedback:** connect tapout~ output back to tapin~ input through a gain stage. Minimum feedback delay is limited by vector size.

### biquad~

- **`biquad~` takes five coefficients: a1, a2, b0, b1, b2.** It is a direct-form II biquad filter; the standard "just works" interface is to wire `filtergraph~`'s coefficient outlet into biquad~'s left inlet.
- **`filtergraph~` → `biquad~` is the canonical filter pair** for interactive filter design. `filtergraph~` outputs a list of coefficients; `biquad~` accepts them as a list via inlet 0.
- **`clear`** — resets filter state (delay memory to zero). Use when the filter "blows up" due to unstable coefficients.
- **[PROMOTION-CANDIDATE → MAX_PATCHING.md Common Pitfalls]** The `biquad~` stoke message: `stoke a1 a2 b1 b2` artificially initializes the filter's internal memory — used to create a self-sustaining oscillation from feedback alone (no input signal), by seeding the delay line with an appropriate phase. Rare but exists.
- **`filterdesign`** (separate object) — generates filter designs from parameters (order, topology). Use when you need Butterworth / Chebyshev filter designs programmatically. Its output connects to `biquad~`.

### filtergraph~

- **`filtergraph~` is the visual editor** — drag the curve handle to set frequency, Q, and gain. Its left outlet emits the biquad~ coefficients.
- **`query <freq>`** — returns amplitude and phase at the specified frequency (no drag needed). Outlets 1 and 2.
- **`dbdisplay 1, numdisplay 1`** — enable dB and frequency labels in the display.
- **Display mode** — `filtergraph~` can show any custom filter shape by sending it `displaydot <x>` and plotting arbitrary coefficient lists via the `cascade` message (up to 24 biquad stages). Useful for visualizing algorithmic filters.
- **`cascade` message** — accepts up to 24 groups of 5 biquad coefficients; displays the product response. Useful for parametric EQ chains.

### lores~ / svf~

- **`lores~`** is a low-resonance (non-self-oscillating) lowpass filter. Args: `lores~ <cutoff_hz> <resonance>`. Resonance 0–1 (1 = maximum, no self-oscillation). The companion to `reson~` which self-oscillates.
- **`svf~`** is a state-variable filter — provides lowpass, highpass, bandpass, and bandstop simultaneously from four outlets. Args: `svf~ <cutoff> <Q>`.
  - **Three frequency input modes** (set as creation arg or message): `Hz` (default, direct Hz), `linear` (0–1 → 0 to sr/4), `radians` (0–1 mapped as quarter-cycle sine → more perceptually uniform). The `radians` mode is slightly more CPU-efficient and has better perceptual response — prefer it for LFO-swept filters.
  - **[PROMOTION-CANDIDATE → CLAUDE.md preferred objects]** For a general-purpose filter the outlet order of svf~ is: outlet 0 = lowpass, 1 = highpass, 2 = bandpass, 3 = bandstop. One object, four filter types.
  - Maximum cutoff frequency = `samplerate / 4` (not `samplerate / 2`). At sr=44100, max is 11025 Hz.

### gain~

- **gain~ is a logarithmically-scaled volume control with interpolation.** Internal scale: 0=silence, 157≈+18dB; 10 units ≈ 6 dB.
- **`scale <value>`** — set gain value (0–157 range). For a "set volume" message, send `scale $1`.
- **`inc <value>`** — increment the gain by value (positive or negative). Useful for "up/down" nudge buttons.
- **`@interp <ms>`** (default 20ms) — smoothing time. Increase to taste for slow fades; decrease for snappier response.
- **vs `*~`:** gain~ is the preferred alternative to a raw `*~` multiplier for user-facing volume controls — it provides logarithmic scaling (matching human loudness perception) and built-in smoothing.

### meter~

- **Displays signal level as an LED strip.** Takes a signal input; outputs nothing.
- **LED counts configurable:** number of leds, hot leds, warm leds, tepid leds — via Inspector or messages. No standard message to change these at runtime; set via attributes.
- **`mc.meter~`** auto-adapts to the number of channels of a multichannel signal (no extra configuration needed).
- **Horizontal or vertical orientation:** Inspector `@style` attribute. No runtime message to switch.

### scope~

- **Two-channel X-Y mode:** when both inlets are connected, scope~ plots inlet 0 (X) vs inlet 1 (Y). Creates Lissajous figures. Good for phase analysis between two signals.
- **`bufsize <N>`** (8–256, default 128) — number of points in the display buffer. More points = finer time resolution.
- **`calccount <N>`** (2–8092, default 128) — samples collected per display point. Lower = faster update, more CPU.
- **`-1 1` / `-10 10`** — min/max display range messages. Send as a list to outlet's right inlet.
- **`@automatic`** mode — automatic DC offset removal.

### peakamp~

- **Reports peak amplitude over a window.** Arg = window size in ms. Outputs current peak every window.
- **`mc.peakamp~`** outputs a list with one peak value per channel.

### slide~

- **Exponential smoothing filter** (not a biquad). Args: `slide~ <up_time_samples> <down_time_samples>`. Separate smoothing times for rising vs falling signals. Specified in **samples**, not ms.
- **Use for:** pitch glide (portamento), control-signal smoothing, envelope followers (asymmetric attack/release). More CPU-efficient than `line~` for smoothing incoming streams.
- **For ms-based smoothing**, convert: samples = ms * samplerate / 1000.

---

## Jitter objects — wiring idioms & per-object gotchas

*(Pass 3 — 2026-06-27 — core `help/jitter/`)*

### jit.matrix

- **Creation syntax: `jit.matrix <planecount> <type> <dim0> <dim1>`** — e.g. `jit.matrix 4 char 320 240` = 4-plane, 8-bit RGBA, 320×240. All four args are optional. Named matrices share data — any object using the same name accesses the same buffer.
- **`setcell2d <x> <y> <v0> [v1 v2 v3]`** — set one cell's values. Number of values = planecount.
- **`fillplane <plane_idx> <value>`** — fill a single plane with a constant. Faster than `setall` when only one plane needs updating.
- **`setall <value>`** — fill ALL planes. `clear` = `setall 0`.
- **`plane <idx>`** — set which plane a downstream `jit.pwindow` displays. `plane -1` = all planes.
- **`importmovie <filename>`** — load an image or video file into the matrix. Works with stills (jpg, png, tiff). Bang afterward to output.
- **`exportimage <filename> <type>`** — save matrix to file. Types: `jpeg`, `png`, `tiff`.
- **`write` / `read`** — save/load in Jitter's binary format (`.jxf`). Fast, lossless, preserves type and plane info.
- **Type conversion:** connecting a `jit.matrix 4 char` to a `jit.matrix 1 float32` and banging converts automatically — use this to convert between formats without extra objects.
- **`@planemap`** — reorder/select planes on output. `@planemap 1 1 2 3` = copy green channel into red, keep G, B, A. Applied at output time.

### jit.pwindow

- **The standard Jitter display object.** Receives a matrix and renders it. Send a matrix to inlet 0.
- **Mouse output:** outlet 0 emits mouse events — list of 11 values including x, y, button state. Use `route mouse mouseidle` to separate click from hover; `unpack 0 0 0 0 0 0 0 0 0 0 0` to destructure.
- **Texture display:** can directly display `jit.gl.texture` outputs from `jit.world @visible 0 @enable 1 @output_texture 1`. Acts as an in-patcher preview without a separate window. Note: when displaying textures, `jit.pwindow` is always topmost in the patch.

### jit.world

- **`jit.world` is the preferred modern GL render destination** — replaces `jit.gl.render` + `jit.window` in new patches. Manages context, window, and render loop in one object.
- **Context name:** first creation arg (e.g. `jit.world my-world`). All `jit.gl.*` objects sharing this name render into it.
- **`@fps N`** — auto-renders at N fps (no qmetro needed). `@fps 0` = render only on demand (bang).
- **`@visible 0 @enable 1 @output_texture 1`** — headless mode: renders to a texture without a window. Wire into `jit.pwindow` for preview.
- **`@fsaa 1`** — full-screen anti-aliasing. Set at creation time.
- **`worldbox <x> <y> <w> <h>`** — set window position/size. `getworldbox` — query current values.
- **`reset`** — clear the render context.

### jit.grab

- **`open` to start, `close` to stop** — explicit messages, not a toggle. Wire a toggle to `route open close` → the respective messages.
- **Bang or qmetro drives output** — `qmetro 30` for ~30 fps capture.
- **`getvdevlist`** — list available video devices (via `route vdevlist`). `vdevice <name>` selects one.
- **`getformatlist`** — list capture formats. `format <name>` or `format -1` for auto.
- **Creation args `<width> <height>`** — default capture resolution; actual resolution depends on the device.

### jit.playlist

- **Multi-clip video player** — equivalent to `playlist~` for audio.
- **`setclip <idx> <attr> <value>`** — per-clip control. E.g. `setclip 2 loop 1`, `setclip 2 rate 0.5`.
- **`selection <idx> <start_norm> <end_norm>`** — in/out points as normalized (0–1). `selectionms` uses milliseconds.
- **Outlet 1 emits notifications** — `done`, `loop`, `start`, `stop` and (with `@reportprogress 1`) progress floats. Use `route done` to auto-advance.
- **Preset/pattr compatible** — `pattrstorage` can save/recall the full playlist state.

### jit.gl.videoplane

- **The primary texture-to-screen object.** Wire `jit.world` → `jit.gl.videoplane` for basic video display.
- **`jit.gl.layer`** is an alias for `jit.gl.videoplane` with sensible layering defaults: `preserve_aspect 1`, `blend_enable 1`, `depth_enable 0`. Prefer `jit.gl.layer` when compositing multiple video planes.
- **`@layer N`** — render order (lower = behind). `@preserve_aspect 1` — letterbox/pillarbox source.
- **[PROMOTION-CANDIDATE → CLAUDE.md preferred objects]** Add note: `jit.gl.layer` is the preferred alias when stacking; it sets blend/depth/aspect defaults automatically.

### jit.gl.render (legacy)

- **Pre-`jit.world` pipeline:** `jit.gl.render` + `jit.window`, driven by `qmetro 33 → t b erase`. `erase` clears the frame, bang triggers drawing.
- **Prefer `jit.world` for new patches** — it handles context, window, and render loop in one object.
- **`drawto <ctx>`** — redirect output to another context. `fullscreen 1/0` — toggle fullscreen.

### jit.gl.gridshape

- **Creates a 3D primitive** in the GL context. **`@shape` values:** `cube`, `sphere`, `cylinder`, `torus`, `plane`, `tetrahedron`, `octahedron`, `circle`, `cone`, `open_cylinder`, `ring`.
- **Standard OB3D attributes** (shared by all `jit.gl.*` objects): `@scale`, `@position`, `@rotate`, `@color`, `@lighting_enable`, `@smooth_shading`, `@depth_enable`, `@poly_mode`.
- Can output geometry as a matrix → feed into `jit.gl.mesh` for further manipulation.

### jit.gl.texture

- **Holds image data on the GPU.** Load with a matrix; reference by `@name` in downstream GL objects.
- **Two-texture swap:** maintain two named textures and alternate source/destination to avoid read/write conflicts on the same texture.
- **`@usedstdim 1` + `dstdimstart / dstdimend`** — sub-texture placement: render into a specific region.
- **Texture readback (GPU→CPU):** wire into `jit.matrix`. For non-blocking readback, use `jit.gl.asyncread`.
- **`jit.gl.slab`** outputs texture name as `jit_gl_texture <name>` message — wire directly into `jit.matrix` or other `jit.gl.*` objects.

### jit.gl.sketch

- **Immediate-mode drawing** — send drawing commands as messages. Commands append to a list re-executed every frame.
- **Primitives:** `moveto x y z`, `lineto x y z`, `sphere r`, `cube s`, `torus r1 r2`, `plane s`, `glcolor r g b a`, etc.
- **`reset`** — clear command list. Edit list: `cmd_delete`, `cmd_enable`, `cmd_insert`, `cmd_replace`, `getcmdlist`.
- **`drawobject <name>`** — include another named `jit.gl.*` object as a drawing step.
- **Use for:** generative geometry, drawing overlays, custom shapes. Prefer `jit.gl.gridshape` for standard primitives.

### jit.op

- **Per-cell math.** `@op <operator>` sets the operation; inlet 1 = right operand (matrix or scalar via `@val`).
- **Key operators:** `*`, `/`, `+`, `-`, `%`, `min`, `max`, `abs`, `avg`, `absdiff`. Float: `sin`, `cos`, `sqrt`, `pow`, `hypot`, `floor`, `ceil`. Bitwise: `&`, `|`, `^`. Logical: `==`, `!=`, `>`, `<`. **Pass operators:** `>p`, `<p`, `==p` — pass left value where condition true, 0 otherwise (masking).
- **`prepend op`** → `jit.op` — change operator dynamically: send `op *` as a message.
- **First reach for `jit.op`** before `jit.expr` for simple single-operator per-cell math — faster and simpler.

### jit.expr

- **Expression language for per-cell computation.** More flexible than `jit.op`; set via `@expr "..."` or `expr <string>`.
- **Variables:** `in[0]`/`in[1]` (matrix inlets), `cell[0]`/`cell[1]` (coords), `norm[0]`/`norm[1]` (0.–1.), `snorm[0]`/`snorm[1]` (−1.–1.), `dim[0]`/`dim[1]` (matrix size).
- **Constants:** `PI`, `TWOPI`, `HALFPI`, `E`, `DEGTORAD`, `SQRT2`, etc.
- **Functions:** standard C math + `jit.noise()`, `jit.clip(in[0], @min 0. @max 1.)`, `noise.gradient(...)`, BFG functions.
- **Caching:** expressions with no matrix inputs are cached by default. Add `@cache 0` for `jit.noise()` and anything that must re-evaluate per-call.
- **Escape commas** in expressions with `\,` — bare commas are Max message separators.
- **vs `jit.op`:** use `jit.op` for one operation; use `jit.expr` for multi-step formulas or position-dependent calculations. Use `jit.gen`/`jit.gl.pix` for GPU performance or complex control flow.

### jit.cellblock

- **`jit.cellblock` help lives in `help/max/`** not `help/jitter/`.
- **Drive with `cell <col> <row> <value>`** — `cell 0 0 hello` sets column 0, row 0.
- **`insert <row> <v0> [v1 ...]`** — insert a full row. `clear` — remove all content.
- **`refer <collname>`** — connect to a `coll` and display its contents (read-only; modify the coll to change content).
- **Per-column/row formatting:** `col <idx> width <px>`, `row <idx> height <px>`, `col <idx> just <0|1|2>`, `col <idx> frgb <r> <g> <b>`.
- **Per-cell formatting:** `cell <c> <r> label <text>`, `cell <c> <r> frgb/brgb <r> <g> <b>`, `cell <c> <r> readonly 1`, `cell <c> <r> precision <N>`.

### jit.noise

- **Outputs a matrix of random values on each bang.** Args: `jit.noise <planecount> <type> <dim0> <dim1>`. Use `float32` for 0.–1. range.
- **Wire `qmetro`** for continuous updates.
- **`jit.3m`** — companion that outputs mean, min, max of a matrix (useful for inspecting jit.noise output).

### jit.rota

- **2D affine transform (rotate/zoom/translate)** applied per-cell. Attributes: `@theta` (radians), `@zoom_x`/`@zoom_y`, `@offset_x`/`@offset_y`, `@anchor_x`/`@anchor_y`.
- **`@boundmode`:** 0=ignore/wrap (default), 1=clear, 2=wrap, 3=clip, 4=fold.
- **CPU-intensive at high resolution** — consider `jit.gl.pix` for GPU-accelerated rotation.

### jit.alphablend

- **Composite two matrices using alpha.** Inlet 0 = background, inlet 1 = foreground with alpha. Output = blended result.
- **Mask from a grayscale source:** use `jit.op @op !pass pass pass pass` to replace the alpha channel of a 4-plane matrix with a separate grayscale mask. The `!pass` operator copies the right-inlet plane into the left-inlet's output; `pass` passes other planes unchanged.
- **`@planemap` on `jit.matrix`** maps a 1-plane grayscale into one plane of a 4-plane matrix (e.g. as alpha): `jit.matrix 4 char 320 240 @planemap 2 1 2 3`.

### jit.chromakey

- **Replace a color range with transparency.** Inlet 0 = source video. Output = RGBA with keyed-color made transparent.
- **Select key color** by clicking in the associated `jit.pwindow` (outputs an RGBA float list), or send programmatically: `pak 0. 1. 0. 0.` (green screen).
- **Works best on `float32` matrices** for better color precision.

## Log

- 2026-06-27: Prose-insight extraction pass 1 — core `help/max/` foundational
  objects. Read and extracted from 20+ help patches: metro/qmetro/clocker,
  delay/pipe/defer/deferlow, trigger/bangbang/gate/switch, route/select,
  pack/unpack/iter/uzi/append/prepend/sprintf/tosymbol/fromsymbol,
  coll/dict/table/value/pv, loadbang/loadmess/change/onebang, print, number,
  send/receive. Wrote structured per-object notes with PROMOTION-CANDIDATE tags
  for entries that belong in MAX_PATCHING.md or CLAUDE.md. crawl_state not
  yet updated (pending commit).

- 2026-06-21: Built `extract_observed_attrs.py`; ran the mechanical attr-tally
  over the whole corpus (5,264 files). Wrote `maxhelp_observed_attrs.json` +
  `maxhelp_crawl_state.json`. Cross-checked against the resolver and recorded
  the three attribute categories above + the four integration cautions.
- 2026-06-21 (same session, extension): broadened the attr-tally to **all
  patcher kinds** — added `.maxpat` abstractions/bpatchers/examples + `.amxd`
  M4L devices (amxd via `ampf`-header strip + `raw_decode`; JSON `strict=False`
  for control-char-bearing files). Corpus 5,264→11,866 files, 3,496→4,201
  objects; refpage-gap 323→498 objects, no-refpage 2,527→3,180; 4 no-ops still
  absent on the larger sample. Built `extract_js_api.py` + `maxhelp_js_api.json`
  — empirical Max JS API census (8,811 `.js`/`.mjs` → 477 in-process + 20 node).
  Prose-insight extraction still queued (start: core `help/max/`).
