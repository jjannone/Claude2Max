# Claude2Max

This repo is a tool for generating Max/MSP patches from Claude-authored JSON specs. Your role is to **write specs and convert them to .maxpat files**.

## Workflow

1. User describes a Max patch they want
2. You write a JSON spec following the format in `SPEC_REFERENCE.md`
3. You convert it with: `python3 spec2maxpat.py convert -i spec.json -o patch.maxpat`
4. You verify round-trip with: `python3 spec2maxpat.py extract -i patch.maxpat`
5. User opens in Max, gives feedback, you iterate

Save specs to `patches/` as `.json` files. Generated `.maxpat` files go alongside them.

## Key Files

- `SPEC_REFERENCE.md` — **Read this first.** Complete spec format reference with all object types, connection format, layout guidelines, presentation view, and worked examples.
- `spec2maxpat.py` — The converter. Handles inlet/outlet profiles for 130+ Max objects, auto-layout, subpatchers, and spec embedding.

## What the Converter Handles for You

- Correct `numinlets`, `numoutlets`, `outlettype` for known objects
- Variable-argument objects (trigger, pack, unpack, select, route, gate, etc.)
- `parameter_enable` and `saved_attribute_attributes` for `live.*` objects
- Spec embedding as hidden `text.codebox` for round-tripping
- Auto-layout (but always use explicit `pos` — auto-layout is a fallback)

## What You Must Handle

- **Object text** — write it exactly as you'd type it in Max (e.g. `"metro 500"`, `"cycle~ 440"`, `"jit.noise 4 char 320 240"`)
- **Connections** — get outlet/inlet indices right. Max objects have specific inlet/outlet meanings; know them.
- **Layout** — use explicit `pos` for every object. Follow the layout guidelines in SPEC_REFERENCE.md.
- **Presentation** — use `presentation` field for user-facing layouts. Every presented control needs a comment label.
- **Objects not in the converter's lookup tables** — use `inlets`, `outlets`, and `outlettype` overrides in the spec. This is common for third-party externals.

## Max Patching Knowledge

- Use `loadmess` to set sensible defaults for controls on patch load. For multiple init values, use `loadmess` → `unpack` to distribute to separate controls.
- When a source produces stereo output, preserve both channels through the entire chain to `dac~`/`ezdac~`. Don't merge to mono. `live.gain~` handles stereo natively (2 signal inlets, 2 signal outlets).
- Set `width` and `height` large enough to contain all objects without scrolling, including info comments. Leave margin below the lowest object.

## Common Pitfalls

- `multislider` `fetch N` outputs from **outlet 1** (right), not outlet 0. A single int sent to a `multislider` sets all sliders to that value.
- `gate N`: inlet 0 = open/close control, inlet 1 = data input
- `trigger` / `t` fires outlets **right-to-left** — rightmost outlet fires first
- `makenote` needs pitch on inlet 0, velocity on inlet 1, duration on inlet 2
- For MIDI synths in Max: `makenote` → `pack` → `midiformat` → synth object
- `ezdac~` and `gain~` are their own maxclass types, not `newobj`
- Spec `size` field overrides converter defaults — use it for non-standard dimensions
- `live.gain~` with `"orientation": 1` for horizontal layout
