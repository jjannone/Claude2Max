# Claude2Max

Vibecoding Max/MSP — generate Max patches from plain JSON specs using Claude.

## What It Does

Claude2Max lets you describe a Max/MSP patch in a simple JSON format and convert it into a valid `.maxpat` file that opens directly in Max. The spec is embedded in the generated patch so Claude can read it back, enabling iterative modifications without starting from scratch.

## Files

- **`spec2maxpat.py`** — The converter. Turns a Claude2Max JSON spec into a `.maxpat` file, or extracts the spec back out from an existing `.maxpat`.
- **`SPEC_REFERENCE.md`** — Complete reference for the spec format, including all supported object types and worked examples.

## Usage

Convert a spec to a Max patch:

```
python3 spec2maxpat.py convert -i my-patch.json -o my-patch.maxpat
```

Extract the spec from an existing patch:

```
python3 spec2maxpat.py extract -i my-patch.maxpat -o my-patch.json
```

## How It Works

1. You (or Claude) write a JSON spec describing objects and connections
2. `spec2maxpat.py` converts it to a `.maxpat` with auto-layout and correct inlet/outlet profiles for 130+ Max objects
3. The original spec is embedded as a hidden comment in the patch for round-tripping
4. Open the `.maxpat` in Max — it just works

## Example Spec

```json
{
  "name": "simple-synth",
  "objects": {
    "toggle": { "type": "toggle" },
    "metro": { "type": "newobj", "text": "metro 500" },
    "random": { "type": "newobj", "text": "random 128" },
    "makenote": { "type": "newobj", "text": "makenote 100 200" },
    "noteout": { "type": "newobj", "text": "noteout" }
  },
  "connections": [
    ["toggle", 0, "metro", 0],
    ["metro", 0, "random", 0],
    ["random", 0, "makenote", 0],
    ["makenote", 0, "noteout", 0],
    ["makenote", 1, "noteout", 1]
  ]
}
```

See [SPEC_REFERENCE.md](SPEC_REFERENCE.md) for the full format documentation.

## Setup

After cloning, run this once to enable spec-only diffs for `.maxpat` files:

```
git config diff.claude2max.textconv "python3 spec2maxpat.py extract -i"
```

This makes `git diff` show changes to the embedded spec rather than the raw `.maxpat` JSON.

## Requirements

Python 3.6+ (no external dependencies).
