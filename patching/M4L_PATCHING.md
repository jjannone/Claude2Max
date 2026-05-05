# Max for Live Patching Reference

Specialized companion to `MAX_PATCHING.md`. Covers patterns specific to
Max for Live (M4L) — the Live Object Model (LOM), `live.*` UI objects,
device lifecycle, host-Live communication, and `.amxd` packaging.

For shared Max patterns (presentation view, gen~, jit.gl, package
layout), the parent docs apply unchanged. This file collects M4L-only
knowledge — anything that wouldn't appear in a standalone Max patch.

## The Live Object Model (LOM) — canonical access chain

The LOM is Live's tree-of-objects abstraction (tracks, clips, devices,
parameters, ...). Every M4L patch that observes or controls Live state
walks the same chain:

```
live.path → live.object → get <property> → route <property>
```

- **`live.path <path>`** — outputs an `id N` token for the object at
  `<path>`. Path is a sequence of LOM tokens: `live_set tracks 0
  clip_slots 1 clip` is "the clip in slot 1 of track 0". Tokens mix
  symbolic (`tracks`) and numeric (`0` = first); `id`-numeric paths
  also work when the id is known.
- **`live.object`** — receives an `id` and is the access point for
  property reads / writes / observation.
- **`get <property>`** — outputs `<property> <value>` from the
  `live.object`'s right outlet.
- **`route <property>`** — peels the prefix so downstream gets just the
  value.

When listening for changes (rather than one-shot reads), use
`live.observer` instead of `get`. Same chain otherwise.

(Source pattern: half a dozen pass-2 forum threads, summarized in
`c74-forum/forum_insights.md` § Max for Live.)

## `live.thisdevice` — the self-reference and load-complete signal

`live.thisdevice` is the device's reference to itself in the LOM. It
serves two distinct purposes:

1. **Init-complete bang** (left outlet) — fires once when the M4L device
   has finished loading AND Live's project context is ready. Use this
   instead of `loadbang` for any init that needs Live state to be
   queryable. Bare `loadbang` fires before Live finishes wiring up the
   device, so any LOM query from that path may return stale or missing
   data.
2. **Self-id** (right outlet) — emits `id <self>` continuously, suitable
   for feeding into a `live.object` to query the device's own path,
   parent track, parent clip, etc.

Send `getpath` to `live.thisdevice` for the device's own LOM path —
useful for namespacing send/receive symbols by device location, or for
reporting "I am here" to a parent controller.

## `getpath` from a clip needs `deferlow`

LOM `getpath` queries on a `clip` object are subject to a host-side
timing race: when the clip-trigger fires, the `clip` object exists in
the LOM tree but its path-resolution metadata isn't yet populated. A
direct `clip-id → getpath` chain returns blank intermittently.

The working pattern:

```
clip-id → deferlow → getpath
```

`deferlow` pushes the message to the next scheduler turn, by which time
Live has finished populating the clip's metadata. The same fix applies
to any LOM property that depends on Live's internal sync state (clip
name, clip start time, clip length, slot index — anything Live computes
asynchronously after the clip object instantiates).

(Source: 40-reply thread `getpath of a clip only with deferlow?` —
summarized in `c74-forum/forum_insights.md`.)

## Push 3 polyphonic key pressure (per-pad MPE)

The naive path — `notein` / `midiin` for Push pad pressure — gives only
**global** pressure (max across all currently-pressed pads), not
per-pad. Per-pad pressure is exposed via the **LOM `Control_Surfaces`
path**, not standard MIDI:

```
live_set → control_surfaces → 0 → ...
```

Walk that path with the standard `live.path → live.object` chain to
subscribe to per-pad pressure events with full velocity-per-pad
resolution. This is undocumented in the M4L API reference; the working
pattern from the forum thread is the canonical answer.

(Source: forum thread `polyphonic key pressure of Push via Live Object
Model (Control_Surfaces)`.)

## `live.*` UI objects — color and style on light themes

`live.*` UI objects (gain, dial, slider, numbox, textbutton, ...) carry
a default look that assumes Live's dark theme. When the parent patch
uses a non-default `bgcolor` (especially light-theme presentation
views), some `live.*` controls' fixed-color elements vanish into the
background unless their non-default color attributes are set.

The canonical fix per object family — verified against
`<Max>/Contents/Resources/C74/docs/refpages/m4l-ref/<obj>.maxref.xml`:

- **`live.gain~`** — set `coldcolor`, `warmcolor`, `hotcolor`, and the
  meter-segment colors as a group. Don't reach for `bgcolor`/
  `fgcolor` from family resemblance — they don't exist on `live.gain~`.
  See `MAX_PATCHING.md` § "Always Verify Against Max Documentation" for
  the verified attribute list.
- **`live.dial`** — set `tricolor`/`trioncolor` for the indicator arrow
  on light themes; without these, the arrow is invisible on a cream/
  light background.
- All `live.*` UI — when changing `bgcolor` significantly, audit every
  fixed-color attribute on the object before declaring the restyle
  done.

## `parameter_enable` and `_parameter_initial` — don't inject by default

The Claude2Max converter does **not** auto-inject `parameter_enable: 1`
or `_parameter_initial` on `live.*` objects. A freshly-placed `live.*`
object in Max has neither attribute set; injecting them globally
produces locked controls and forced-on-load values that the user didn't
ask for.

If the spec needs parameter automation, set `parameter_enable: 1`
explicitly in the spec for that object. Don't depend on the converter
to add it — the converter intentionally matches Max's defaults, never
exceeds them. (See `CLAUDE.md` § "Converter Design Rule — Match Max's
Defaults, Never Exceed Them".)

## Namespace isolation inside per-instance subpatchers — `---` prefix every internal name

When the same M4L device is instantiated on multiple Live tracks (or
multiple times on one track), every globally-named Max object inside
the device shares state across all instances unless its name is
prefixed with `---`. The prefix is a Max convention: an object name
starting with `---` is rewritten per-instance into a unique symbol,
isolating each device copy.

The non-obvious part is that the convention extends through every
*content* object inside a per-instance subpatcher — not just the
subpatcher's declaration. For instance, a `pfft~` subpatch declared
`pfft~ ---my-fft 1024` only escapes per-instance for the `pfft~` name
itself; every `s` / `r` / `buffer~` / `jit.matrix` / `coll` *inside*
that subpatch is still global until each of those is also `---`-
prefixed. Symptoms of incomplete prefixing range from cross-talk
between instances (parameter changes on one device affect the other) to
hard crashes when two instances try to write the same global resource
simultaneously.

The rule generalises beyond `pfft~`: any subpatcher meant to be
per-instance — `poly~` voices that hold global state, `gen~` patches
with named buffers, abstractions wrapping per-device assets — must
prefix every internal global name. The prefix is structural; missing
one breaks instance isolation silently. (Source: Cycling '74 forum,
"Problems with pfft~ in Max4Live".)

## `.amxd` packaging — what the file holds

A `.amxd` file is a Live device wrapper around a `.maxpat`:

- The `.maxpat` content is preserved verbatim (same JSON shape as a
  standalone patch — see `SPEC_REFERENCE.md` § "Max's Three Patch
  Serialization Formats").
- A wrapper layer adds the device type (audio effect / MIDI effect /
  instrument), the device-version metadata, and Live-side serialization
  hooks.
- Embedded media (samples, presets, dependencies) lives inside the
  `.amxd` bundle alongside the patch.

For Claude2Max-generated M4L devices, the production workflow is to
generate the `.maxpat` first via the standard Claude2Max pipeline, then
have the user open it in Max and "Save As..." with the `.amxd`
extension to wrap it. The `.amxd`-wrapping step is not currently
automated in `spec2maxpat.py`.

## Cross-References

- **General Max patching** — `MAX_PATCHING.md`. Presentation view rules,
  layout spacing, common pitfalls, Jitter knowledge, packaging.
- **Spec format & object internals** — `SPEC_REFERENCE.md`. The
  `live.*` object family and their inlet/outlet shapes are documented
  there.
- **Forum-sourced M4L insights** — `c74-forum/forum_insights.md` § Max
  for Live. Source-of-record for the patterns canonized in this file.
- **Refpage source of truth** —
  `/Applications/Max.app/Contents/Resources/C74/docs/refpages/m4l-ref/<obj>.maxref.xml`.
  Every `live.*` object, plus M4L-only objects like `live.path`,
  `live.object`, `live.observer`, `live.thisdevice`, lives in
  `m4l-ref/`. Same `<c74object>` schema as MSP refpages; parsed by
  `RefpageCache._parse` in `spec2maxpat.py`.
