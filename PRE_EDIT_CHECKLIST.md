# Pre-Edit Checklist {!pre-edit}

You're about to write or edit a file. Scan this list — each item is "if X applies, did I Y?" Skip items whose trigger doesn't match.

## Reference material — consult before acting
- For every Max object or external API I'm about to encode in this edit: have I read its refpage / docs / header file in the last few seconds? Family resemblance to other objects is not evidence — names that "sound right" are guesses.
- For this task area (presentation view, tutorials, specs, packages, Max patching, converter): have I re-read the relevant repo docs this session — MAX_PATCHING.md, SPEC_REFERENCE.md, TUTORIAL_GUIDELINES.md, packages/package_concepts.md?
- Have I scanned WORK_HISTORY.md (and insights.md if on a user branch) for prior notes on this area before starting?
- For visual changes (presentation view, layout, color, object position): have I taken a screenshot via computer-use MCP to verify how the last build actually looks before iterating?
- Before composing a long chain of native Max objects to do something: have I run `python3 packages/query_packages.py search <term>` to check whether an installed package handles it in one object?

## Verification (silent failure if wrong)
- Any method, attribute, property, CSS rule, shell flag, or env var name I'm about to write: verified in the last few seconds against an authoritative source (refpage / docs / header)? Names that "sound right" for the kind of object are guesses.
- For Max attribute names specifically: confirmed it appears in `<obj>.maxref.xml`? Max silently accepts unknown attributes and ignores them — no error message will catch the mistake.
- If asserting external state (GitHub repo visibility, remote branch existence, CI status, whether a file exists on a remote): did I verify with the right tool (`gh`, `git ls-remote`, `curl`) rather than from memory?
- If writing a parser that coerces a field with `int()` / `float()` / etc.: does the documented schema's full value space include non-numeric sentinels like "variable", "auto", "none", "all"? If unsure, accept the textual form and only coerce at use site with a fallback.

## Workflow integrity (round-trip safety)
- If editing an existing .maxpat: did I run `python3 spec2maxpat.py sync -i patches/X.maxpat` before this edit? No exceptions — convert regenerates from scratch and silently destroys manual edits not captured in the embedded spec.
- If creating a standalone spec .json file: am I writing it to /tmp/ rather than the project folder? The .maxpat is the single source of truth; spec files are temporary scratch.
- If this edit produces a .maxpat: does it include a hidden `text.codebox` (`id: "obj-spec-embed"`, `hidden: 1`) with the full spec wrapped in `--- CLAUDE2MAX SPEC ---` / `--- END SPEC ---` delimiters?
- If building a new version of an existing patch: am I defaulting to extract → edit → convert (preserving the original's working details), rather than rebuilding the spec from scratch?
- If creating a new version: have I preserved every pattern noted as "what's working" in any prior critique — alignment offsets, init defaults, wiring, naming? Praising-without-applying is the named failure mode; observed-good patterns are binding.
- If modifying a patch programmatically: have I preserved existing box IDs on existing boxes? Renaming a box silently breaks every patchline that references it. Only assign new IDs to newly added boxes.
- If creating a new version: have all `loadbang → init` / `loadmess` chains and hardcoded defaults from the original survived into the new version?
- If a working feature (display, control, behavior, format) is moving to a new modality: does it arrive at least as capable as it left? Inventory every piece of information in the old format and confirm it's all present in the new one.

## Patch construction
- For any user-defined name (send/receive symbols, pv/v variables, buffer~/coll names, patcher names, JS variables): is it ALL CAPS, to distinguish from Max built-ins?
- If writing presentation view: does every presented control have an adjacent comment label?
- If writing presentation view: is `openinpresentation: 1` set on the patcher, AND has each presented box had `presentation_rect` set during post-conversion?
- If the spec contains an `inlet` or `outlet` object inside a subpatcher / abstraction / poly~: is it labeled in BOTH places — (a) `attrs.comment` on the inlet/outlet box AND an adjacent `comment` box inside, AND (b) `attrs.comment` on the parent `p`/`poly~` describing every inlet/outlet by index, type, and purpose?
- If adding a `v8` or `js` object: are `inlets`, `outlets`, and `outlettype` specified explicitly in the spec? (v8/js aren't in the converter's lookup table.)
- If adding a `jsui` object: is the JS file linked via `attrs.filename` (NOT via `type:newobj, text:"jsui X.js"`)? Without `attrs.filename` the object is non-functional.
- If putting logic in a JS object: is it stateless string/date/list manipulation only? DSP and signal processing must not live inside JS.

## Visual verification
- If I just produced or modified a presentation view, layout, color, or object position: have I taken a screenshot before claiming the change is done?
- If reporting a UI task complete: did I either verify visually OR explicitly state that visual verification wasn't available?

## Externally-sourced patches (when modifying)
- If modifying a patch that was pasted from outside: do changed message boxes have amber bg `[1.0, 0.82, 0.45, 1.0]` + black text `[0.0, 0.0, 0.0, 1.0]`?
- If modifying an externally-sourced patch: do changed `newobj` boxes have orange border `[1.0, 0.55, 0.0, 1.0]`?
- If modifying an externally-sourced patch: are added or rerouted patchcords colored the same orange?
- If modifying an externally-sourced patch: are annotation comments placed at the right margin (x ≥ 565) with no bgcolor, labeling what changed?

## Converter changes (when editing spec2maxpat.py)
- If adding any auto-injected attribute to a converter code path: have I created the object fresh in Max and inspected its JSON to confirm Max actually sets that attribute by default? Don't add what Max leaves unset.

## Documentation upkeep
- If this edit adds or changes a rule in CLAUDE.md or any *.md at the repo root: did I first propose the exact wording in chat and receive user confirmation, before writing it?
- If writing a rule prompted by an error: have I stated the underlying concern (general principle), not the specific incident (recipe)? Lead with intent, follow with "for instance".
- If a rule references a specific file as "what correct looks like": is the rule pinned to the structural contract (attributes, invariants, shape), with the file mentioned as "for instance" rather than as the rule's source of truth?
- If this session produced an insight: have I propagated it to all relevant files — SPEC_REFERENCE.md / MAX_PATCHING.md / TUTORIAL_GUIDELINES.md / CLAUDE.md / WORK_HISTORY.md?
- If this rule applies to the repo (not just my personal context with this user): is it going into the repo's CLAUDE.md or other tracked *.md, NOT into personal memory? Memory holds user/feedback/project context only — repo rules go to disk where collaborators see them.
- If meaningful work happened this session: has WORK_HISTORY.md been appended proactively, not held until end of session?

## Communication
- If the user asked a multi-part question and I'm replying without addressing every part: am I re-asking the unanswered parts, rather than guessing or treating silence as consent?

## Model selection
- If this task is dense patch analysis, complex documentation reading, package curation, complex forum-thread synthesis, complex patch planning, or presentation UI design: have I paused and asked the user to switch with `/model claude-opus-4-7` before proceeding on Sonnet?
