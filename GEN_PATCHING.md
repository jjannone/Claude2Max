# gen~ Patching Reference

Specialized companion to `MAX_PATCHING.md`. Covers `gen~` (audio rate,
per-sample) and `gen` (control rate, per-event) — the two audio/control
flavors of the gen language family. For the per-pixel / per-cell flavor
(`jit.gen` and `jit.gl.pix`), see `JIT_GEN_PATCHING.md`.

`gen~` is **not** Max — it is a separate dataflow language with its own
object set, its own type model (everything is float at signal rate inside
gen~), and its own performance characteristics (per-sample evaluation,
compiled to native code at edit time). Patterns that work in MSP do not
necessarily work in gen~, and vice versa. `gen` (no `~`) shares the
language but executes per-event at control rate rather than per-sample;
most idioms below translate, with the obvious exception of `samplerate`
and signal-rate-only operators.

## Always Verify Against Max Documentation — Never Guess

The "never write API names from memory" rule from `CLAUDE.md` applies in
gen~ with the same force as in Max — possibly more, because gen~'s object
vocabulary is smaller and less well-known than MSP's. Verify every gen~
operator name in Max's gen~ refpages (`/Applications/Max.app/Contents/Resources/C74/docs/refpages/gen-ref/`)
or by creating the object fresh inside a `gen~` and inspecting its
behavior. Do not assume an MSP object exists in gen~ — many do not
(`buffer~`, `groove~`, `cycle~`-with-buffer-input, etc., are MSP-only).

## The gen~ Programming Model

Inside a `gen~` patch, every object processes one sample at a time. Wires
carry single floats per sample, not buffers. Objects you may know from
MSP exist with the same names but different semantics:

- **`+`, `-`, `*`, `/`** — sample-rate arithmetic.
- **`cycle`** — table-lookup oscillator (no `~` suffix inside gen~).
- **`phasor`** — sample-rate ramp.
- **`delay N`** — feed-forward delay line of N samples (not milliseconds).
- **`history`** — explicit one-sample feedback storage; required to break
  signal-flow cycles (gen~ otherwise rejects loops as zero-delay
  feedback).
- **`param NAME`** — exposes a control-rate parameter from outside the
  `gen~`.
- **`in N` / `out N`** — signal inlets/outlets to the parent patcher.
- **`Data NAME size`** — gen~'s buffer equivalent (random-access lookup).

The big constraint: **no millisecond-aware objects exist in gen~.** Every
time you see "ms" anywhere in a gen~ patch, it's because someone wrote
`samplerate * (ms_value / 1000)` to convert to samples manually.

## Canonical Idioms

### `slide` is the canonical gen~ envelope follower

The `slide` object takes two arguments — a **slide-up time** and a
**slide-down time**, expressed in samples. Feeding `abs(signal)` into
`slide(attack_samples, decay_samples)` produces a smoothed amplitude
envelope at signal rate. This is the gen~-domain equivalent of an
attack/release follower, and the pair-of-arguments form is the
standard expression.

For instance, the `slide` configuration that drives a transient/tonal
crossfader looks like:

```
abs → slide(attack, decay) → clip 0 1 → output
```

with separate `param attack 2 @min 0 @max 20` and `param decay 2000
@min 0 @max 3000` driving the slide times via the `samplerate * (ms/1000)`
conversion below.

Students reaching for envelope-follower patterns in gen~ should land on
`slide` first, not roll their own with `+` / `*` / `history` smoothing
chains. (Source: `transient_crossfade` by jbaylies, MIT licensed,
analyzed during the 2026-05-03 c74 projects crawl.)

### `samplerate * (ms / 1000) → delay N` — the canonical ms→sample idiom

gen~ has no millisecond-aware delay. Conversion is on the patcher.
The standard idiom uses gen~'s `samplerate` operator (which returns the
host samplerate as a continuously-updated signal) and a `delay N` object
with N set to the maximum sample count you want to support:

```
ms_param → / 1000 → samplerate → * → delay 48000
```

The `delay 48000` declares an upper bound of one second at 48 kHz; the
`*` modulates the read tap within that bound. Pair this with a
`param @name predelay @default 0 @min 0 @max <max_ms>` to cap the
parameter range to whatever fits the declared `delay N`.

### Equal-power and linear crossfade can co-exist via `selector 2`

A naive crossfade uses linear amplitude:
```
mix = a*x + (1-a)*y
```
which dips ~3 dB at the midpoint when `x` and `y` are uncorrelated.
The equal-power crossfade preserves total power:
```
mix = sqrt(a)*x + sqrt(1-a)*y
```
A common student instinct is to duplicate the patch — one with `mix`,
one with `sqrt`. Don't. Both can co-exist in the same gen~ subgraph,
selected by a `selector 2` driven by a runtime parameter:

```
linear_branch:    mix(a, x, y) ─┐
equal_power_branch:               selector 2 → out
  sqrt(a) * x + sqrt(1-a) * y ─┘
                       ↑
                  param interpolate_crossfades
```

The `param @default 0 @min 0 @max 1` switch picks linear when 0 and
equal-power when 1. Crossfading between the two branches at a value
between gives an interpolated crossfade — useful when the right curve
depends on the source material.

## Latency Compensation in gen~ Signal Splits

When an envelope-follower drives a crossfade, the **env path is the
latency-budget bottleneck**. Pre-crossfade FX latency on the audio
inputs becomes "lookahead" relative to the env (free); FX latency on
the env path becomes a gate-against-signal misalignment that
comb-filters the output.

General principle: in any signal+control split, route the control path
to its source as directly as possible, and put any expensive processing
on the audio path where its latency is a feature (lookahead) rather than
a bug (misaligned gate).

## Cross-References

- **MSP-side patterns** — see `MAX_PATCHING.md`. Anything outside the
  `gen~` box uses Max + MSP rules, not gen~ rules.
- **Per-pixel / per-cell variants (`jit.gen`, `jit.gl.pix`)** —
  see `JIT_GEN_PATCHING.md`. The dataflow model is identical (compiled
  graph, `in N` / `out N` / `param NAME` / `history`), but the iteration
  is over matrix cells or pixel coordinates rather than samples.
  `samplerate`, `cycle`, MSP-rate `phasor`, and the audio-time idioms in
  this doc do not apply there.
- **Refpage source of truth** —
  `/Applications/Max.app/Contents/Resources/C74/docs/refpages/gen-ref/<obj>.maxref.xml`.
  These follow the same `<c74object>` schema as MSP refpages and are
  parsed by `RefpageCache._parse` in `spec2maxpat.py`.
