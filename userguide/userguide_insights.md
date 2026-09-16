# Max Userguide Insights

Principles distilled from the Max userguide topic files at
`/Applications/Max.app/Contents/Resources/C74/docs/userguide/content/`.
Refpages are out of scope; this captures the cross-cutting "how Max works"
material that doesn't fit into per-object reference.

Topic-organized to mirror `c74-forum/forum_insights.md` and
`cookbook/cookbook_insights.md`. Two flag conventions:

- **`[PROMOTION-CANDIDATE]`** — entry is proposed for promotion to
  `patching/MAX_PATCHING.md` (or a sibling companion) and awaits user
  confirmation. Future userguide-crawl sessions will continue to use
  this flag for newly-extracted insights.
- **`[PROMOTED <date> → <file>]`** — entry was confirmed and written to
  the target file. The source insight stays here as research context
  without being re-considered for promotion.

Userguide content is C74's first-party documentation, so the candidate
bar is lower than for forum/cookbook (community sources need vetting;
official sources are generally trustworthy). Even so, every promotion
goes through user confirmation per the "Rules from Corrected Errors"
pattern in `CLAUDE.md`.

---

## Patcher Lifecycle

Source: `patcher_lifecycle.json`.

### Init order is fixed and worth memorizing — eight phases

When a patcher opens, Max executes initialization in eight phases, in this
order:

1. **Object initialization** — every object is constructed; some objects do
   synchronous work here (e.g. `buffer~` with a file argument loads the file
   synchronously at this stage; later `replace` messages are async).
2. **Patchcord connection** — patchcords are reconnected. Crucially, **any
   message an object tries to send during phase 1 may not route as expected**,
   because cords don't exist yet.
3. **Parameter initialization** — objects with Parameter Mode enabled set
   themselves to their initial values and emit them.
4. **`pattr` restoration** — `pattr` objects with `@autorestore` enabled
   restore the last-saved value and emit it.
5. **`loadbang` and `loadmess`** — fire only now, after all the above.
6. **`live.thisdevice`** — fires after `loadbang` (M4L-specific; in a regular
   patcher, equivalent to `loadbang` but later in the sequence).
7. **Window activity** — window appears, `active` objects emit; `patcherargs`
   initial output is deferred to here.
8. **`dspstate~` and DSP graph** — DSP graph is built; `dspstate~` emits
   sample rate, DSP on/off, etc.

**Subpatchers init before their parents within each phase.** A `loadbang` in
a subpatcher fires before a `loadbang` in the parent. But a `buffer~` (object
init, phase 1) in the parent loads before any `loadbang` (phase 5) anywhere —
phase order trumps depth.

`[PROMOTED 2026-05-07 → MAX_PATCHING.md]` to `MAX_PATCHING.md` — propose adding a "Patcher
Lifecycle" section. The phase list is the kind of cross-cutting reference
Claude needs to reason about init ordering correctly without re-deriving it
from refpages.

### Don't rely on init ordering between objects of different types

Even within the eight-phase model, the order in which two objects emit during
the same phase is not guaranteed. **Use `trigger` (or explicit chains via
`loadmess`) to make ordering explicit when it matters.** This is the same
principle that makes `trigger` essential during normal patcher execution,
extended to load time.

`[PROMOTED 2026-05-07 → MAX_PATCHING.md]` to `MAX_PATCHING.md` patching-principles section.

### `dspstate~` is the one reliable "DSP is ready" signal

DSP graph construction is phase 8 — last. If you need to do something only
once DSP is actually running, route through `dspstate~`'s outlet, not
`loadbang`. By the time `loadbang` fires, DSP isn't built yet.

### `closebang` in subpatchers fires only on direct close

Closing a parent window does **not** fire `closebang` in subpatchers — only
manually closing the subpatcher window does. Cleanup logic that lives in a
subpatcher and assumes "patch is closing → I run" will silently not fire.
Put `closebang` in the top-level patcher, or use `freebang` (which fires for
every object on free, regardless of how it got freed).

`[PROMOTED 2026-05-07 → MAX_PATCHING.md]` — common-pitfall entry for `MAX_PATCHING.md`.

### `Edit > Reinitialize` is a fast init-test loop

Resets every parameter-mode-enabled object to its initial value without
closing/reopening. Useful when iterating on init-time behavior.

---

## Scheduler & Priority

Source: `scheduler.json`.

### Two priority lanes — high-priority scheduler and low-priority queue

Every event in Max is one or the other. **High-priority** events have timing
information attached (MIDI input, `metro`, audio-driven events) — handled by
the scheduler at specific times. **Low-priority** events are everything else
(UI, file I/O, drawing) — handled FIFO in a queue.

This split is invisible at the box level — most of the time you don't think
about it — but it determines what happens when the system is under load,
when threads are split, and when backlog can crash Max.

`[PROMOTED 2026-05-07 → MAX_PATCHING.md]` to `MAX_PATCHING.md` — propose new section
"Scheduler and Priority", with the two-lane model as the entry point.

### Message propagation is depth-first

Within one event, Max walks the patcher graph depth-first: a path is followed
to its terminal node before adjacent paths receive any message. This is what
makes `trigger`'s right-to-left ordering deterministic, and why `[t b b]`
fires its right outlet before its left.

### Overdrive — separate threads for high vs low priority

With Overdrive ON, Max runs the high-priority scheduler on a separate thread
from the low-priority queue. **Best practice**: ON for MIDI/audio work, OFF
for Jitter (GL drawing needs to share thread with patcher logic). Default OFF.

**Important caveat**: the debugging features only work with Overdrive
disabled. If you're stepping through cords to find a bug, turn it off first.

### Scheduler in Audio Interrupt (SIAI) — couple scheduler to DSP time

SIAI runs the high-priority scheduler **inside the audio thread**, advancing
scheduler time with DSP time. Trade-offs:

- Best timing accuracy w.r.t. the audio sample counter
- Worst timing accuracy w.r.t. real-world clock (events clump within audio
  vectors)
- Worst multi-CPU exploitation (scheduler and audio share one thread)
- Risk: an expensive scheduler computation can drop audio vectors → clicks

Use SIAI when audio↔event sync matters (sample-accurate sequencing). Disable
when external-hardware sync matters (live MIDI sync, OSC).

### Stack overflow on infinite message loops — break with `pipe`/`delay`/`deferlow`

Max **does not catch message-graph cycles at compile time** — only DSP
cycles. A feedback loop in messages will recurse until stack overflow, at
which point Max disables outputs and posts an error. **Break the cycle with**:

- `pipe N` or `delay N` — schedule a high-priority deferred event (back into
  the scheduler later)
- `deferlow` — schedule a low-priority event (back of the queue)

Each of these turns "send-and-recurse" into "send-and-yield".

`[PROMOTED 2026-05-07 → MAX_PATCHING.md]` — common-pitfall entry for `MAX_PATCHING.md`.

### `defer` vs `deferlow` — understand the order semantics

- **`defer`**: front of the low-priority queue; if already running in low
  priority, passes through unchanged. Can reverse the order of a sequence
  because it's LIFO into the front.
- **`deferlow`**: back of the low-priority queue; always defers, even from
  low priority. Preserves order.

**Use `deferlow` when order matters.** Use `defer` only when "now-ish"
deferral with no order requirement is fine.

`[PROMOTED 2026-05-07 → MAX_PATCHING.md]` for `MAX_PATCHING.md`.

### Some objects always execute at low priority — backlog hazard

`buffer~` (file ops), file-reading objects, drawing/UI objects, `v8`/`js`,
dialog launchers — all execute at low priority regardless of how the
triggering message arrived. Connecting a high-rate source (e.g.
`snapshot~ @interval 1`) to one of these creates **event backlog**: events
pile up faster than the queue can drain, eventually crashing Max.

The canonical fix is **data rate reduction** with `speedlim`, `qlim`, or
`onebang`. For instance: `snapshot~ → speedlim 20 → v8` caps the v8 input at
50 Hz regardless of how fast snapshot~ produces.

`[PROMOTED 2026-05-07 → MAX_PATCHING.md]` for `MAX_PATCHING.md` — high-priority pitfall, very
easy to write into a v8-driven patch unintentionally.

### Stop scheduler with ⌘. (Cmd-period) — debugging trick

Stops every metro/MIDI/timing object without closing the patch. Resume with
⌘R (or Edit menu → Stop/Resume Scheduler). Useful when a patch is firing too
fast to inspect.

### Scheduler preferences cheatsheet

For tuning when default behavior isn't right (Preferences → Scheduler):

| Setting | Default | Effect |
|---|---|---|
| Event Interval | 2 ms | Low-priority queue throttle interval |
| Poll Throttle | 20 events | High-priority events per servicing |
| Queue Throttle | 10 events | Low-priority events per servicing |
| Redraw Queue Throttle | 1000 events | UI redraw events per servicing |
| Refresh Rate | 33.3 ms | Min UI redraw interval (~30fps) |
| Scheduler slop | 25 ms | Allowed lag before correction |

These are usually fine; tweak only when diagnosing specific timing or
responsiveness issues.

---

## Polyphony

Source: `polyphony.json`.

### Three (really four) approaches to polyphony — pick by need

Max has multiple polyphony solutions; they are not equivalent:

| Approach | Use when |
|---|---|
| `ddg.mono` | You want monophonic output from poly input (last-key-priority) |
| `poly` | You need MIDI voice routing only — no per-voice DSP instances |
| `poly~` | You need both voice routing AND independent DSP per voice (loaded abstraction × N) |
| `mc.noteallocator~` / `mc.voiceallocator~` | MC-style polyphony without `poly~`'s subpatcher model |

The most common production pattern is `poly~` — its abstraction-per-voice
model is the cleanest way to scale a synth voice to N copies.

`[PROMOTED 2026-05-07 → MAX_PATCHING.md]` to `MAX_PATCHING.md` — propose a "Polyphony" section
with this decision matrix as the entry point.

### `poly~` voice routing — five input methods

`poly~` accepts five distinct routing message families. Don't mix them up:

- **`@target N`** — direct routing to voice N (`@target 0` = broadcast to all)
- **`note <pitch> <vel>`** — auto-route to first available voice (uses busy
  state to pick); requires `thispoly~` setup inside the abstraction
- **`midinote <pitch> <vel>`** — MIDI note-on/off pair; voice is tracked by
  pitch on note-off
- **`midievent <bytes>`** — for `midiparse`/`mpeparse` rightmost-outlet output
- **`mpeevent <bytes>`** — MPE-aware (per-note pitch bend, aftertouch, etc.);
  use with `mpeparse`/`mpeformat`
- **`notemessage`** — route to whichever voice currently holds a given pitch
  (different from `target` which uses index)

### `poly~` abstraction inlets — `in`/`out`, not `inlet`/`outlet`

Inside a `poly~` abstraction, declare I/O with `in N` / `out N` / `in~ N` /
`out~ N` instead of `inlet`/`outlet`. The argument is the index. **Multiple
`in N` boxes with the same index share that inlet** (multi-receive at one
inlet). Left-to-right placement does not matter — only the argument does.

This contrasts with regular abstractions/subpatchers where `inlet`/`outlet`
order is determined by left-to-right placement and silently breaks if you
swap.

`[PROMOTED 2026-05-07 → MAX_PATCHING.md]` for `MAX_PATCHING.md` polyphony section — this is
genuinely a different inlet model and easy to get wrong.

### Busy state via `thispoly~` — and the `adsr~` shortcut

`poly~` needs to know when a voice is "busy" so it can avoid stealing it.
Inside the abstraction, send `thispoly~`:

- A `1` to mark busy
- A `0` to mark free
- A signal — non-zero = busy, zero = free

**The canonical idiom is `adsr~` → `thispoly~`** because `adsr~`
automatically sends mute/unmute messages too. This single connection covers
both busy state and DSP muting in one wiring.

### Muting saves CPU on idle voices

When a `poly~` voice is muted, Max skips DSP for that voice's signal-rate
objects (messages still flow). For an N-voice synth where most voices are
idle most of the time, this is the difference between viable and unviable.
**Always wire mute control through `thispoly~`** unless you have a specific
reason not to.

`[PROMOTED 2026-05-07 → MAX_PATCHING.md]` for `MAX_PATCHING.md`.

### `param` inside `poly~` — custom attributes on the parent

`param NAME` inside the abstraction defines a custom attribute on the parent
`poly~` object, controllable via `attrui`. Set `@min`/`@max` for ranges. This
is how to expose voice-level parameters (filter cutoff, resonance, modulation
depth) at the parent level without manual `send`/`receive` plumbing.

### `mc.poly~` vs `mcs.poly~` — pick by I/O topology

Two MC-flavored wrappers for `poly~`:

- **`mc.poly~`** — each signal input becomes a multichannel input where
  channel count = voice count. Output is per-voice channels (no summing).
  Use when you want per-voice signal access at the parent level.
- **`mcs.poly~`** — collapses all signals to one multichannel input + one
  multichannel output. Each input is copied to every voice. Use when you
  want a shared multichannel I/O.

The choice is "do I want to address each voice's channel separately or share
multichannel I/O across all voices?"

---

## Abstractions, Subpatchers, bpatchers

Sources: `abstractions.json`, `subpatchers.json`, `bpatchers.json`.

### Abstraction vs subpatcher — file-referenced vs embedded

- **Abstraction**: external `.maxpat` file referenced by name. **Editing the
  file modifies every instance.** Loaded by Max when a `newobj` named like
  the file is created and the file is on the search path.
- **Subpatcher** (`p` / `patcher`): contents embedded inline in the parent
  patcher. **Each instance is independent** — editing one does not affect
  others. Lives in the parent's JSON.

The trade-off: abstractions give you DRY and shared updates; subpatchers give
you isolated state and no external dependencies.

`[PROMOTED 2026-05-07 → MAX_PATCHING.md]` for `MAX_PATCHING.md` — propose an
"Abstractions, Subpatchers, bpatchers" section.

### `#` argument substitution in abstractions

Inside an abstraction, `#1`, `#2`, ... are textual placeholders replaced by
the corresponding argument when the abstraction is loaded. Locking/unlocking
the abstraction toggles between the substituted and unsubstituted views.

For instance: an abstraction with the box `buffer~ #1` instantiated as
`my_abs LOOPBUF` becomes `buffer~ LOOPBUF` after substitution.

### `#0` is the per-instance unique number

`#0` (only when at the start of a word) gets replaced with a number unique
to that abstraction instance. **Use `#0-NAME` for `send`/`receive` symbols
inside an abstraction** to keep instances from sharing a bus.

For instance: `send #0-TRIGGER` and `receive #0-TRIGGER` inside an
abstraction give per-instance trigger buses with no manual numbering.

`[PROMOTED 2026-05-07 → MAX_PATCHING.md]` for `MAX_PATCHING.md` — pairs naturally with the
existing CLAUDE.md "ALL CAPS for user-defined names" rule. The rule
extension: in abstractions, prefix bus names with `#0-` for instance
isolation.

### `patcherargs` — alternative to `#` syntax

Outputs the abstraction's arguments out the left outlet at load time, and
attribute-style `@name value` pairs out the right outlet (one at a time,
followed by `done`). Behaves like a `loadmess` for arguments. Use when the
abstraction logic needs to consume args programmatically rather than as
inline text.

### Encapsulation resets internal state — common gotcha

When you select a group of objects and press ⌘-Shift-E (Ctrl-Shift-E) to
encapsulate, Max **copies** the selected objects into a new subpatcher and
**deletes** the originals. The new objects are fresh — their internal state
is back to initial values.

If you encapsulated a `delay` line that was holding a queued event, that
event is gone. If you encapsulated a `coll` with table data, the data is gone
unless persisted via `read`. **Save state externally before encapsulating
anything that holds runtime state.**

`[PROMOTED 2026-05-07 → MAX_PATCHING.md]` — common-pitfall for `MAX_PATCHING.md`. Easy to lose
hours to.

### Inlet/outlet ordering is positional, except in `poly~`

In a regular abstraction or subpatcher, the **left-to-right position** of
`inlet`/`outlet` boxes determines which inlet/outlet they map to in the
parent. Swapping their positions silently remaps the parent's connections.

`poly~` is the exception — `in N`/`out N` use the explicit argument as the
index, position-independent.

### Inlet/outlet `@comment` shows tooltip on hover

Setting `@comment` on an `inlet`/`outlet` displays as a tooltip when the user
mouses over the corresponding parent inlet/outlet. This is the in-Max
discoverability mechanism behind the "label inlets/outlets in two places"
rule already in CLAUDE.md.

### bpatcher = embedded patcher view as a UI block

A `bpatcher` shows the visual contents of a patcher (in either patching or
presentation view) as a block in the parent. Two modes:

- **`@embed 1`** — contents saved with the parent (subpatcher-like)
- **`name` attr** — references an external `.maxpat` (abstraction-like;
  changes to the file propagate to every bpatcher referencing it)

Use bpatchers for modular UI components — instrument panels, tabbed views,
reusable controls with embedded layout.

### Show presentation view in bpatcher — `@openinpresentation` on the *contained* patcher

This is a common point of confusion: to make a bpatcher display the
contained patcher's presentation view, set `@openinpresentation 1` **on the
contained patcher** (via its Patcher Inspector), not on the bpatcher object
itself.

`[PROMOTED 2026-05-07 → MAX_PATCHING.md]` — common-pitfall for `MAX_PATCHING.md`.

### bpatcher `@offset` for dynamic display — set via `thispatcher` from inside

Use `@offset x y` to shift the displayed origin within the bpatcher (for
tabbed displays, paged controls, etc.). **You can't message the bpatcher
object directly — set it from a `thispatcher` inside the embedded patcher.**

### Default bpatcher size — `openrect` width/height (x/y ignored)

When a bpatcher is created via the `e` shortcut (type filename), the default
size is determined by:

1. The contained patcher's `openrect` (only width and height; x/y ignored)
2. If no `openrect` and `openinpresentation` is set: the bounding rect of
   presented objects
3. Otherwise: a default

Worth knowing when designing modular UI panels — sizing can be controlled
from the contained patcher rather than at every instantiation site.

---

## Patching Mechanics

Source: `patching_mechanics.json`.

These are user-facing keyboard shortcuts — useful for human Max users but
not directly relevant to spec-driven generation. Recording for completeness.

### Shortcut cheatsheet

| Action | Shortcut |
|---|---|
| Drag-create new connected object | Shift+Alt+drag from existing |
| Insert new object on selected cord | Shift+N |
| Splice object into existing cord | Shift+drag, align to cord |
| Un-splice object from cord | Shift+drag away from cord |
| Select cord into selected object | Alt+Up |
| Select cord out of selected object | Alt+Down |
| Rotate cord selection | Alt+Left / Alt+Right |

Toggle the whole feature with Preferences → Enable Patching Mechanics.

---

## Cross-references

- **Refpage source of truth** —
  `/Applications/Max.app/Contents/Resources/C74/docs/refpages/`, parsed by
  `RefpageCache._parse` in `spec2maxpat.py`. Use refpages for per-object
  attribute / message lookup; this file is for cross-cutting principles.
- **Forum knowledge** — `c74-forum/forum_insights.md`. Real-world traps and
  preferred patterns sourced from community Q&A.
- **Cookbook knowledge** — `cookbook/cookbook_insights.md`. Curated
  educational examples (Dobrian / UCI).
- **Patching companions** — `MAX_PATCHING.md`, `GEN_PATCHING.md`,
  `JIT_GEN_PATCHING.md`, `JITTER_PATCHING.md`, `M4L_PATCHING.md`,
  `MC_PATCHING.md`. Promotion candidates from this file flow into these.
