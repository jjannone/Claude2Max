# Package Library Curation

Reference for extending and maintaining `packages/package_objects.json`. Read this before running extractors or adding new packages.

## Extending Coverage

Coverage is partial — only curated packages are present, and within those only objects that meaningfully outperform native chains. Absence from the library means "not yet curated," not "no advantage."

```bash
# Refpage-documented packages
python3 packages/build_package_objects.py --package "<package name>" --merge packages/package_objects.json

# Help-file-only packages (no refpages — Vsynth, jasch objects, etc.)
python3 packages/build_helpfile_objects.py --package "<package name>" --merge packages/package_objects.json
```

Then fill the empty `use_when` fields for the objects worth keeping. Skip pure alternatives with no advantage over built-ins. Both extractors preserve existing `use_when` values across re-extractions.

Run `python3 packages/query_packages.py validate` after each merge to confirm zero hard issues.

## What Makes a Good use_when Entry

**Curated entries are operational, not just descriptive.** A `use_when` field that says "what the object is and when to reach for it" stops short — at decision time the next question is *how do I drive it?*, and a refpage round-trip breaks the flow. Fold in the decision-relevant control surface: message selectors, key attributes, important arguments, and any output-routing quirks. Aim for enough detail that a reader can configure and wire the object from the entry alone, only consulting the refpage for edge cases.

For instance: HISSTools `bufconvolve~` should list both the operation messages (`convolve`, `deconvolve`) and the attributes that gate deconvolution behaviour (`deconvmode`, `deconvphase`, `deconvfilter`, `deconvrange`, `deconvdelay`). A shorter "convolve two buffers offline" forces a refpage trip.

## Conceptual Knowledge — When to Write a package_concepts.md Entry

**Extract conceptual knowledge with every package, not just per-object docs.** Some packages introduce custom data types, scripting languages, address schemes, callback protocols, or domain paradigms foundational to using *any* object in the package. Re-explaining these in every `use_when` entry wastes space and produces drift.

The trigger: when curating a new package, before writing per-object entries, scan the package's tutorials and key foundational refpages. If you can't write `use_when` for the package's central object without first explaining a custom data type, paradigm, or vocabulary, that explanation belongs in `packages/package_concepts.md` under a `## <PackageName>` section. If everything is just "wrappers around well-known Max idioms," skip the concepts section.

For instance: bach has lllls (Lisp-like nested lists), addresses, lambda inlets/outlets, midicents, rationals, slots, and the bell scripting language. Together they're the mental model required to read *any* bach object's `use_when`. They live under `## bach` in `packages/package_concepts.md`.

## Schema Enforcement

`packages/package_schema.py` defines the canonical record shape (`CANONICAL_DEFAULTS`) and provides `normalize()` (auto-coerce a record to fit) and `validate()` (check semantic correctness). Both extractors call `normalize()` from inside `merge_into()` — every record going to disk passes through normalization exactly once, including untouched prior records in the same package bucket. This makes silent schema drift impossible.

**Adding a new extractor.** If a future approach handles a third documentation style (e.g. inspecting example abstractions), it MUST:
1. `from package_schema import normalize, OPTIONAL_KEYS`
2. Call `normalize(record)` before persisting any record
3. Preserve any `OPTIONAL_KEYS` from prior entries during merge

Underscore-prefixed keys (`_description`, `_attrs_seen`, etc.) are recognised as transient curator scratch and stripped automatically by `normalize()`.

## CLI Reference

```bash
python3 packages/query_packages.py list              # every installed package + curation status
python3 packages/query_packages.py list --uncurated  # only the ones still to do
python3 packages/query_packages.py search "convolve" # rank matches across digest + use_when
python3 packages/query_packages.py search "fft" --package "FFTease" --limit 5
python3 packages/query_packages.py validate          # check every record against schema
python3 packages/query_packages.py validate --strict # also flag soft issues (uncurated, empty digest, zero I/O)
```

`list` distinguishes three states: curated, uncurated-but-extractable (refpages or help-files present), and no-docs (neither — needs a different approach).

## Converter Fallback

When `spec2maxpat.py` resolves an object whose I/O isn't in its built-in `NEWOBJ_IO` table or in the C74 RefpageCache, it consults `packages/package_objects.json` as a final fallback before requiring explicit `inlets`/`outlets` in the spec. So third-party externals like `cv.jit.faces` or `bufconvolve~` work in a spec without overrides as long as they're curated. Spec-supplied overrides still win.
