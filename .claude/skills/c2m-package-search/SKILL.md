---
name: c2m-package-search
description: Search the Claude2Max curated package library (2,795+ installed Max package objects across 68+ packages — bach, FluCoMa, HISSTools, FFTease, cv.jit, FrameLib, MuBu, etc.) for an object that solves a problem in one external instead of a long native chain. Use BEFORE composing any chain of 3+ native objects to do something — convolution, granular synthesis, FFT, computer vision, ML, OSC, list manipulation, descriptor analysis, etc. Also use when the user asks "is there a package object for X?", "what does <package object> do?", or invokes /c2m-package-search. Skip for built-in Max objects (consult the C74 refpages instead).
argument-hint: "<search-term>"
---

# c2m-package-search — find a package object instead of a native chain

Use this skill when the user (or you, while planning) is about to write a chain of native Max objects to do something a curated package object handles in one external. The CLAUDE.md rule **"Consult Installed Packages Before Long Native Chains"** is what this skill operationalizes.

## Step 1 — Run the query

Pass the search term in `$ARGUMENTS` (one or more words). Run:

```bash
python3 packages/query_packages.py search "$ARGUMENTS"
```

This ranks matches across `digest` + `use_when` fields in `packages/package_objects.json`, with `use_when` matches scored highest. Output is one line per hit: `<package>/<object> — <digest>`.

If the user passed a specific package, narrow with `--package`:

```bash
python3 packages/query_packages.py search "$ARGUMENTS" --package "FluidCorpusManipulation" --limit 10
```

## Step 2 — Read the top hits

For each promising hit, read the `use_when` field — that is the load-bearing operational entry. Curated entries fold in decision-relevant control surface (message selectors, key attributes, constructor args, output behavior), so you can configure and wire the object from the entry alone.

Direct lookup of one record (when you know the package + object name):

```bash
python3 -c "
import json
db = json.load(open('packages/package_objects.json'))
print(json.dumps(db['<package>']['<object>'], indent=2))
"
```

If `numinlets` or `numoutlets` is `0`, treat it as **unknown** and consult the refpage at `<package>/docs/refpages/<package_ref>/<object>.maxref.xml`. Some packages document I/O in prose rather than structured tags.

## Step 3 — Read package concepts if relevant

For packages with custom data types or paradigms (bach lllls, FrameLib frames/contexts, FluCoMa corpus workflow, MuBu containers, odot bundles, etc.), read the relevant section of `packages/package_concepts.md` before recommending the object. The concepts file captures the mental model required to use any object in the package — it's not a duplicate of the per-object entries.

## Step 4 — Recommend or fall back

If a package object covers the use case, recommend it with:

- The exact `<package>/<object>` name and a one-sentence summary of what it does
- A worked example wiring or message sequence pulled from the `use_when` text
- Whether `numinlets`/`numoutlets` are known (treat `0` as unknown — consult the refpage)
- Any concept-section references the user should skim first

If no package object covers it, say so explicitly and proceed with the native chain. **Coverage is partial** — only ~58 of 79 installed packages are curated, and within those only objects that meaningfully outperform native chains. Absence from the library means "not yet curated," not "no advantage." If the user wants to extend coverage, point them at `packages/build_package_objects.py` (refpage-documented) or `packages/build_helpfile_objects.py` (helpfile-only).

## Step 5 — When to invoke without `$ARGUMENTS`

If invoked bare (`/c2m-package-search`), ask the user what they're trying to accomplish in one sentence, then derive search terms from the description. Don't make them know the right keyword in advance.

## See also

- `python3 packages/query_packages.py list` — every installed package + curation status (curated / extractable-uncurated / no-docs)
- `python3 packages/query_packages.py validate` — sanity-check the library against the canonical schema
- `packages/package_concepts.md` — per-package paradigms (lllls, frames, corpus workflow, etc.)
- `CLAUDE.md` § "Consult Installed Packages Before Long Native Chains" — the underlying rule and schema reference
