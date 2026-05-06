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

### A 2-sample feedback delay = a quadrature oscillator

An oscillator can emerge from `gen~` without an explicit `cos` / `sin`
call or a wavetable. The construction is two feedback delays of one and
two samples summed via gain coefficients — mathematically the same as
a complex multiplication, which is a rotation of a 2-vector around the
origin. Frequency is set by the gain coefficients; the rotating vector
*is* the oscillation. Same math as waveguide synthesis and the standard
quadrature-oscillator state-variable formulation.

For instance, a working 2-state feedback loop in a `gen~` codebox:

```
History x1, x2;
y = a*x1 + b*x2;
x2 = x1;
x1 = y;
```

with `a` and `b` chosen so that `a² + b² = 1` and `cos(angle) = a/2`
gives a stable rotation at the corresponding frequency. Reach for this
pattern when CPU is critical and many oscillators are needed — the
2-state form can beat a `cycle()` lookup chain on tight budgets.
(Source: Cycling '74 forum, "gen~: oscillator without delays lines or
cos/sin function", Graham Wakefield.)

### Multi-stage envelopes as `accum → clip 0 1 → shape(t) → scale → out` with `>= 1` stage transitions

A general way to model any envelope stage in `gen~` is a normalised
0..1 ramp, a shape function over that ramp, and a scale to the desired
target range. The stage advances when the ramp reaches 1.

```
samples_for_stage = mstosamps(stage_duration_ms)
ramp_increment = 1 / samples_for_stage
t = accum(ramp_increment)            // 0..1 ramp at stage rate
t_clipped = clip(t, 0, 1)
shaped = pow(t_clipped, k)           // any function of t in [0,1]
out = scale(shaped, 0, 1, start, end)
advance_stage = (t >= 1)             // single-comparator stage transition
```

The decoupling matters: timing lives in the `accum`/`mstosamps` chain;
shape lives in the function applied to `t`; mapping lives in `scale`.
ADSR, ADHSR, multi-segment, and arbitrary breakpoint envelopes all
share this template — only the per-stage parameters differ. (Source:
Cycling '74 forum, "Gen~ adsr with curved stages", Graham Wakefield.)

### `cycle()` inside a codebox `for` loop is *one* oscillator run N times — not N independent oscillators

A naive harmonic-stack attempt
```
for (i = 0; i < N; i += 1) sum += cycle(freq * (i + 1));
```
produces a single high-frequency tone rather than N partials. The body
of the `for` loop runs N times within one sample's evaluation; each
iteration calls `cycle()` on a fresh internal state, so all iterations
collapse into one oscillator advanced N times in zero time.

To run N independent oscillators inside a codebox loop, store N phases
in a `Data` buffer and advance each one explicitly:

```
Data phases(16);
for (i = 0; i < N; i += 1) {
    f = freq * (i + 1);
    phase = peek(phases, i);
    phase = wrap(phase + (f / samplerate), 0, 1);
    poke(phases, phase, i);
    sum += sin(phase * twopi) / (i + 1);
}
```

This is the canonical "additive synthesis in a loop" pattern — phase
state lives in the `Data` buffer because gen's per-sample evaluation
discards local-variable state across iterations. (Source: Cycling '74
forum, "Why won't the for loop do what I want it to", Graham
Wakefield.)

### Windowed accumulator (moving sum) via "tape-overdub" pattern in `Data`

For a rolling sum / moving-average / moving-RMS at signal rate, the
naive circular-subtract pattern leaks values when the window length
changes mid-stream. The robust pattern is "tape overdubbing" — every
input sample is guaranteed to be subtracted exactly once because the
read cell is zeroed after the subtract, and the new sample is `poke`d
N samples ahead with overdub mode.

The shape:

```
read  = peek(buf, idx);        // sample leaving the window
sum   = sum + input - read;    // add new, subtract old
poke(buf, 0,     idx);         // zero the read cell
poke(buf, input, (idx + N) % len, 1);   // overdub-mode write N samples ahead
idx   = (idx + 1) % len;
```

Because the `0` write happens before the future `input` write to the
same cell, and the future write uses overdub, dynamic N (window resize)
never produces a stale-value leak: a cell that no longer falls inside
the window has been zeroed before any later overdub touches it.
Generalises to any windowed statistic (RMS, peak, variance) by
substituting the running operator. (Source: Cycling '74 forum, "How to
make a leaky accumulator in Gen?", Graham Wakefield.)

### Click-free circular buffers in `gen~`: `@boundmode wrap` AND a one-cell index overshoot

A circular buffer with `peek` / `poke` clicking at the wrap boundary
isn't a rate or interpolation problem — it's a boundary-cell problem.
All `gen~` `@interp` modes respect `@boundmode wrap` correctly, but
only when the index range itself extends one cell past the buffer
length. Without the overshoot, the interpolator at the boundary fetches
the wrap-side cell unsmoothed and clicks.

```
peek buf @boundmode wrap @interp linear     // or @interp cubic / spline
poke buf @boundmode wrap
```

Drive the index range as `0 ≤ idx ≤ len` (note: `≤ len`, not `< len`)
so the interpolator can fetch the boundary lookahead. A click that
persists after dropping playback rate to 1× is the diagnostic — it
means the issue is the boundary state, not a rate-related artifact.
(Source: Cycling '74 forum, "circular buffer - click between the last
and first sample", Graham Wakefield.)

### Store envelope/curve data as breakpoint coordinates, not as rasterised samples

For envelope-like data inside `gen~`, the efficient representation is
control points (time, value pairs) stored in a buffer, with `gen~`
interpolating between them on the fly. The naive approach pre-fills a
sample-rate buffer with every interpolated value — wasting memory and
buffer-write cost.

Vector-style approach:

```
// buffer holds [t0, v0, t1, v1, ..., tN, vN]
counter += 1 / total_samples;
seg     = find_segment(counter, breakpoints);  // which (ti, ti+1) bracket?
t_norm  = (counter - ti) / (t_{i+1} - ti);
output  = scale(t_norm, 0, 1, vi, v_{i+1});
```

Editing breakpoints (or changing total duration) is one or a few
buffer-writes, not a full rasterisation pass. The pattern generalises
to any piecewise representation — multi-stage envelopes, parameter
trajectories, lookup tables with sparse control points. (Source:
Cycling '74 forum, "Gen~ simple data management with buffer", Graham
Wakefield.)

### N-band crossover: cascade allpasses on every previously-split branch when adding a new lowpass stage

A phase-coherent N-band crossover preserves the property that summing
all bands recovers the input. The rule for extending a 2-band split
(LP1 / HP1) to a 3-band (LP1 / HP1 with LP1 already split, then LP2 /
HP2 inside HP1) is: **every previously-split branch needs an allpass
at the new split's frequency**, not just the band being newly split.

For a 5-band split with crossover frequencies f1 < f2 < f3 < f4:

```
out_1 (lowest)  = LP_f1 → AP_f2 → AP_f3 → AP_f4
out_2           = HP_f1 → LP_f2 → AP_f3 → AP_f4
out_3           = HP_f1 → HP_f2 → LP_f3 → AP_f4
out_4           = HP_f1 → HP_f2 → HP_f3 → LP_f4
out_5 (highest) = HP_f1 → HP_f2 → HP_f3 → HP_f4
```

Without the trailing allpass cascade on each non-newest band, summing
the bands no longer reconstructs the input — instead it produces a
comb-filtered version with phase notches at the missing-allpass
frequencies. This is the same mechanism behind Linkwitz-Riley
multi-band design, generalised to N bands. (Source: Cycling '74 forum,
"Modify gen~ crossover example", Graham Wakefield.)

### Codebox compiler limitation: function return values cannot be used directly in `if`-conditions — store them in `History` first

In `gen` codebox (this is `gen` only, not `jit.gen`), a function call
inside an `if`-statement condition produces the misleading compile
error `attempt to index local 'instance' (a nil value)`. The naive
form fails:

```
if (myFunction() == 1) { … }   // compile error
```

The canonical workaround is a `History` declaration that captures the
function's return value, then references that variable in the
condition:

```
History result(0);
result = myFunction();
if (result == 1) {
    out1 = 1;
}
```

Generalises to any "use-this-function-return-here-once" pattern in
codebox: the History acts as a single-cycle latch even when its
"history" semantics aren't otherwise needed. The error message points
at the wrong abstraction layer and is not a useful diagnostic; pattern
recognition of the error string is the fastest path to the fix.
(Source: Cycling '74 forum, "Impossible to use returned value from
function in if-statement", Tarik Barri.)

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
