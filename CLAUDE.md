# Claude2Max

> **When you think you've read enough, you haven't. Read it all. Use the tokens. You don't know Max and you can't fake it.**

## If You Are A Claude Instance Reading This From Another Repo — Why You're Here

You arrived because your global CLAUDE.md told you to consult this repo before doing Max work. Here is why that pointer exists and what reading it actually means.

**You do not know Max.** Your training-data knowledge of Max/MSP is broadly correct on shape but wrong on specifics often enough to break patches silently. Max's failure mode is not exceptions, it is *acceptance* — unknown attributes get accepted and silently ignored (a `bgcolor` you wrote on an object that doesn't have one does nothing, no warning), made-up object names load as missing-object red boxes that are easy to miss in a 100-box patch, and presentation / wiring conventions you don't know produce patches that "work" but are unusable for the operator. None of these surface as errors. They surface as the student's patch behaving weirdly hours later, in a session you're no longer part of.

**The minimum reading before any tool call that produces Max content is three files, in this order:**

1. The rest of this file — `Claude2Max/CLAUDE.md`. Workflow, binding rules (always create a presentation view, always hide plumbing patchcords, never write API names from memory), the `c2m.inspect` debugging convention, the preferred-objects table, the multi-user-template if mobile is involved.
2. `Claude2Max/SPEC_REFERENCE.md`. The spec format the converter consumes; object types and correctness notes; presentation layout specifics; jit.cellblock conventions; the v8 / JavaScript section.
3. `Claude2Max/patching/MAX_PATCHING.md`. Common Pitfalls (the load-bearing section for silent-failure modes — read every bullet), presentation aesthetic checklist, per-object guidance.

Add as relevant: `patching/GEN_PATCHING.md` for `gen~` work, `patching/JIT_GEN_PATCHING.md` for `jit.gen` / `jit.gl.pix`, `patching/JITTER_JS_PATCHING.md` for `[js]` / `[v8]` touching matrices, `patching/M4L_PATCHING.md` for Max for Live devices.

Before producing any Max content in this session, also consult `packages/package_objects.json` (via `python3 packages/query_packages.py search "<term>"`) before composing any chain of 3+ native objects — there is often a single installed package object that does what your chain does, and you would not have known about it from training data alone.

The cost of reading is a few minutes of context. The cost of skipping is a debugging session that may not surface for hours and that you cannot help with after the fact. Read.

---

## What This Repo Is

This repo is a tool for generating Max/MSP patches from Claude-authored JSON specs. Your role is to **write specs and convert them to .maxpat files**.

**Audience**: This tool is designed for students with little coding or CLI experience. CLAUDE.md serves as the primary knowledge base — when their instance of Claude reads it, it should learn everything needed to work with Max/MSP, the spec format, and the converter without requiring prior expertise. Include helpful general information here even if it seems basic — students benefit from it and Claude instances need it to assist them effectively.

## Default Workflow — Your Own GitHub Fork (Claude Handles the Setup)

The recommended workflow for every student is to work in their **own GitHub fork** of Claude2Max. Why:

- The student's session history, insights, and any patches they commit travel with them across machines and survive disk failure.
- The student can pull upstream improvements into their fork without losing their work.
- Discoveries the student makes during a session can be contributed back to the main repo as a pull request — see the community knowledge pipeline described in the **Community Knowledge — Insights Flow Upstream** section.
- An instructor (or peer) can read the student's fork to see what they've been working on without needing access to their machine.

**Students do not run `gh` or `git` commands themselves.** Claude is the interface. The student says "set me up" or "fork this so I have my own copy" and Claude runs the commands. The student's job is to describe what they want; Claude's job is to translate that into the right shell actions. Students with no prior CLI / git experience should never see a `git` invocation in the chat unless they ask to learn how the underlying mechanics work.

The intended setup flow (driven by the `New User Setup` section below):

1. `git clone` the upstream repo once (one-time, by hand or via Claude on first session).
2. Claude detects on first session whether a fork exists for this user and offers to create one via `gh repo fork --remote --remote-name origin`. If `gh` isn't authenticated, Claude walks the student through `gh auth login` interactively — explaining each prompt in plain language.
3. Claude creates an `insights/<name>` branch on the fork to track session-specific observations.
4. From then on, normal use: edit patches, log discoveries, periodically Claude proposes pushing to the fork and (when there's broadly useful material) opening a PR upstream.

**Fallback — local-only is still supported.** If a student explicitly declines a GitHub account, or `gh auth login` fails repeatedly and they don't want to troubleshoot, Claude falls back to a purely local-folder workflow: no remote, no push, no PR. Everything still works — the toolkit is self-contained — but the student's session history doesn't survive disk loss and can't be shared. Treat this as the exception, not the default. If a student lands here through reluctance rather than informed choice, gently re-offer the fork setup at the start of later sessions (not every session — once or twice is enough, then stop).

**Implications for Claude operating in this repo:**

- At session start, run the `New User Setup` flow to determine which mode the student is in (forked-with-remote, cloned-no-fork, or local-only).
- For forked-with-remote: `git push`, `gh pr create`, and PR-related commands are all fair game when the work reaches a natural commit boundary or the student opts to share insights.
- For cloned-no-fork: proactively offer to create a fork via `gh` when the moment is right — usually right at session start, or when the student first asks about sharing / backing up their work.
- For local-only: do not run `git push` or `gh` commands. Do still write to `insights.md` locally so the notes survive in the working directory.
- Never expect the student to type a `git` or `gh` command themselves. If a command needs to run, Claude runs it. If the student wants to learn what the command does, explain it after running it — not by asking them to type it.
- State files (`WORK_HISTORY.md`, `TASK_QUEUE.md`, `insights.md`) follow the convention in **State-File Location for External Projects** further down.

## Rules from Corrected Errors {!pre-commit}

After fixing any error, derive a general rule that would have prevented it. Present the proposed rule(s) to the user in plain language before writing them to CLAUDE.md or SPEC_REFERENCE.md. Only enshrine rules the user confirms. This keeps the knowledge base accurate and user-approved rather than accumulating unreviewed assumptions.

**Always generalize before enshrining — regardless of where the rule comes from.** This applies to rules derived from errors, rules stated by the user, rules observed in practice, and rules inferred from context. Before writing any rule, ask: what is the underlying concern this is guarding against? A rule scoped to the specific incident only helps when that exact incident recurs. A rule scoped to the underlying concern applies across a much broader range of situations. Do not wait for the user to ask for generalization — it is always the right default.

**When writing rules, state the general principle — not the specific fix.** A rule that says "do X in situation Y" only helps when Y recurs exactly. A rule that identifies the underlying concern applies across a broader range of circumstances. Ask: what is the real problem this rule is guarding against? Write the rule around that.

**Lead with intent, follow with example.** State what you're trying to achieve in plain terms first, then illustrate with a concrete case introduced as "for instance." This keeps the principle readable and applicable broadly, while still giving actionable guidance. Rules that lead with a specific method risk being read as recipes rather than principles.

## Verify External State — Never Assert from Memory

Before making any claim about the state of an external or shared system — GitHub repo visibility, remote branch status, CI results, whether a file exists on a remote, whether a service is available — verify it with the appropriate tool first. Memory, inference from local context, and reasonable assumptions are not sufficient. A wrong assertion is worse than a delayed one.

For example: don't say a repo is private because it looks like a personal project; run `gh repo view --json visibility` and check. Don't say a branch exists remotely without `git ls-remote`. Don't say a URL is unreachable without trying it.

This applies beyond GitHub to any external state that can change independently of the local working directory.

## Never Write API Names From Memory

Never write a method name, property name, attribute name, function name, CSS property, shell flag, environment variable, or any other API identifier from memory. If the name didn't come from a documentation page, header file, refpage, autocomplete, or other authoritative source within the last few seconds, it is a guess — and a guess is forbidden. This applies across every language and every environment, not just Max.

The reason this rule needs to be explicit: environments differ only in *how loudly they catch a guess*. Typed languages throw at compile time; untyped languages throw at runtime; Max attributes, CSS properties, and similar APIs **fail silently** — the wrong name is accepted and quietly ignored, doing nothing. **Silent failure is more dangerous than loud failure, not less**, because there is no error message to surface the mistake. The discipline must therefore be the same across all environments: do not write the name unless you have just confirmed it exists.

The recognition signal: **if I find myself reaching for an attribute or method name because it "sounds right" for this kind of object, that is the exact moment verification is non-optional.** Family resemblance ("it's a UI control, surely it has `bgcolor`") is not evidence that the name exists on this specific object. Each object's vocabulary is its own.

For instance: writing `bgcolor`, `peakcolor`, `knobcolor`, or `needlecolor` on `live.gain~` because those names exist on other UI objects is the same kind of mistake as writing `arr.contains()` in JavaScript because it sounds right (the actual method is `arr.includes()`). JS throws `TypeError`. Max silently accepts the unknown attribute and ignores it — the mistake survives a code review I would never let it survive in JS. The valid `live.gain~` color attrs are `coldcolor`, `warmcolor`, `hotcolor`, `overloadcolor`, `slidercolor`, `textcolor`, `tricolor`, `trioncolor`, `tribordercolor`, `focusbordercolor`, `modulationcolor`, `inactivecoldcolor`, `inactivewarmcolor` — confirmed by reading `/Applications/Max.app/Contents/Resources/C74/docs/refpages/m4l-ref/live.gain~.maxref.xml`.

The verification mechanics for Max specifically — the refpage paths, the `grep` patterns, the `RefpageCache.lookup()` API — live in `patching/MAX_PATCHING.md`. This rule states *why*; that file states *how*.

**Verification is per-attribute, not per-object.** If I am writing N attributes for an object, I must verify N names against the refpage. Batching N attrs into one edit without per-name verification is the failure mode this rule is designed to prevent.

**The rule applies independent of the workflow — including direct `.maxpat` edits.** The converter's lookup against `packages/package_objects.json` would have caught an unknown object name, but only when a spec is being converted. Hand-editing `.maxpat` JSON, modifying an existing patch with the Edit tool, generating boxes into a patch via Python or shell — none of those paths are gated by the converter. The verification discipline is the same in all of them. The recognition signal is identical to the attribute case: **if I'm typing an object's class name (the `text` field of a `newobj`) because it "sounds like the obvious name" for what I want to do, that is the moment verification is non-optional, regardless of which tool is producing the file.**

For instance: writing `[oscparse]` between `[udpreceive]` and `[route /user]` because it's "the obvious complement to `udpreceive`" is the same kind of guess as `arr.contains()` in JS. Max 9 has no `oscparse`; OSC address-routing requires `[OSC-route]` from CNMAT Externals, and the path was a silent failure because the patch loaded with `[oscparse]` shown as a missing-object red box that's easy to overlook in a 100-box patch. Confirmed by `ls /Applications/Max.app/Contents/Resources/C74/docs/refpages/max-ref/ | grep -i osc` returning only `osc.codebox`, `osc.packet`, `param.osc` — none of which route by address.

**Practical check before adding any `newobj` text to a patch, regardless of source:**

1. Search the refpage directory: `ls /Applications/Max.app/Contents/Resources/C74/docs/refpages/max-ref/ | grep -i <name-fragment>` — fast and authoritative for built-ins.
2. For package externals, search the curated list: `python3 packages/query_packages.py search "<name>"` from the Claude2Max repo.
3. If both come up empty, the object doesn't exist as named. Either the wrong name, the wrong package assumption, or the wrong workflow (e.g. needs `[v8 …]` instead of a built-in).

This is one extra `ls` per never-used object name — cheap insurance against the silent-failure mode the rest of this rule describes.

## Parsers Must Tolerate the Schema's Full Value Space, Not Just the Sample You Tested Against

When parsing third-party data (XML, JSON, configs, refpages), don't coerce a field's type based on the values you happened to see in your test sample. The first input you didn't test against is the one that breaks. Fields that look numeric in examples may legitimately carry string sentinels like `"variable"`, `"auto"`, `"none"`, or `"all"`. Either confirm the documented schema's full value space before coercing, or accept the textual form and only coerce at the point of use, with a fallback for non-numeric values.

For instance: a Max refpage attribute's `size` is usually an integer, but `"variable"` is also valid. `int(attr.get("size", 1))` crashes the parser the first time it meets such a refpage; a `try int → fall back to the original string` pattern preserves both numeric and sentinel cases without losing information.

## Reference Instances Illustrate Principles — They Don't Constitute Them

When a rule, checklist, or repair procedure refers to "what correct looks like," enshrine the **structural contract** (the attributes, invariants, shape) — not a specific file as the source of truth. Specific files are illustrations introduced as "for instance," and they may be renamed, edited, or deleted without the rule needing to change. A rule pinned to a file becomes wrong the moment that file moves; a rule pinned to the contract stays correct as long as the contract holds.

This is a corollary of "always generalize before enshrining." It applies anywhere a working example is being used as a reference: tutorial structure, patch conventions, file layout, JS module shape, anything. Before writing "match the way `<file>` does it," ask: what are the actual properties this file has that make it correct? Write those. Then mention the file as one place to see them, not as the rule itself.

## Partial Answers Are Not Consent — Re-Ask the Unanswered Part

When asking the user a multi-part clarifying question (e.g. "should I do A like X or Y? and should B be P or Q?"), and the user replies addressing only some of the parts, the silence on the others is **not** authorization to proceed with my best guess. The right behavior is to act on what was answered, then re-ask the unanswered parts — or hold all action until the full picture is clarified.

Acting on my own interpretation of an un-answered branch produces work the user didn't authorize and that may need to be undone. The cost of one short follow-up question is much lower than the cost of restoring an unintended change.

## Flag Natural Commit Moments — Proactively Suggest Commit, Sync, and New Session

Long conversations accumulate uncommitted work and stale context — both compound. The default cadence is: commit early, sync often, start a new session frequently. When the work reaches a natural commit boundary — a self-contained chunk that could land as one logical commit — **proactively suggest committing and starting a new session**. Don't wait to be asked, and err on the side of suggesting more often rather than less. If a GitHub remote is configured and the user has opted in to pushing, include `git push origin <branch>` as part of the same step; if not, the local commit is the whole story.

**Suggest starting a new session, not clearing the current one.** Old sessions are kept as reference — the transcript of how a decision was reached, what was tried, what was rejected, and the back-and-forth that led to the working answer is often more valuable than the diff alone. Starting a new session preserves that history; clearing destroys it. Phrase the prompt accordingly: never tell the user to `/clear`. The new-session prompt is what they should hear.

A commit moment is "natural" when ALL of the following hold:

- A coherent unit of work is complete — a feature, a fix, a refactor, a doc pass, a knowledge-base chunk, a queued task. No in-flight iteration; no "I'll fix that next."
- All decisions, rules, and learnings have been propagated to the relevant repo files (`CLAUDE.md`, `SPEC_REFERENCE.md`, `patching/MAX_PATCHING.md`, `TUTORIAL_GUIDELINES.md`, `WORK_HISTORY.md`, etc.) — the next session can rebuild context purely from disk.
- `WORK_HISTORY.md` has the work logged.
- No pending verification is owed (e.g. "check that this works in Max and let me know").
- The user is not mid-decision on something where the conversation's recent reasoning is the working memory.

When such a moment arrives, surface it concretely. For instance: "This looks like a natural commit point — want me to commit `<short description>`? After that, this is a good place to start a new session for the next chunk." Add "and push to origin" only when a remote is configured and pushes have been opted into. Include the proposed commit subject so the user can accept or redirect quickly.

Bad commit moments (do NOT suggest here): mid-debug, mid-iteration, after a partial fix that hasn't been verified, when external verification is pending, or when the user is exploring options whose tradeoffs are still actively in conversation.

When the user does commit at one of these moments, the follow-up is: (a) confirm `WORK_HISTORY.md` has the session's summary; (b) verify any pending changes in the actual application before they start the next session — easier to iterate while context is warm than after a cold restart; (c) note any chips/follow-ups that should survive into the next session via files rather than memory.

## Modify, Don't Rebuild — and Treat Observed-Good Patterns as Binding

When the task is a new version of an existing patch, the default workflow is `extract → edit → convert`: pull the embedded spec, modify only what is changing, write back. Rebuilding the spec from scratch is the wrong default — it silently drops every working detail of the original that does not make it into the new build. Alignment offsets, init defaults, wiring patterns, sub-systems, naming conventions, and dozens of micro-decisions that took prior sessions to get right vanish without warning. Only build from scratch when the new version shares less than half its structure with the original.

**The companion rule: observed-good patterns are binding.** Any pattern noticed as "what's working" in analysis or critique creates an obligation to preserve that pattern in any subsequent implementation. Praising-without-applying is worse than not noticing at all — it proves the information was available and ignored. Marking something as good is an implicit commitment to keep it.

For instance: writing in design critique that "the comment-padding compensation gives clean visual alignment of labels with controls" creates a binding constraint on any redesign that follows. The compensation must survive into the new version. The robust fix is not "remember to re-apply it" — that is the failure mode this rule names. The robust fix is to start from the existing spec so the pattern survives by default, and only deviate where the change is intentional.

**Two practical consequences:**

1. **Default to spec extraction, not spec construction.** The phrase "build a new spec" should trigger the question "why not extract and edit?" before any code is written. Construction is reserved for genuinely new patches.

2. **Critique creates checkpoints.** Anything noted as good during analysis is a checkpoint that must be revisited before declaring the implementation done. Did the new build preserve every observed-good pattern from the original? If no, either restore it or document why it was deliberately dropped.

## When Building a New Version from an Existing Patch

- **Retain all default values.** Any `loadbang → init` chain, `loadmess`, or hardcoded default in the JS must survive unchanged into the new version. Defaults represent deliberate configuration — they are not incidental and must not be silently dropped.

- **Preserve wiring integrity when modifying patches programmatically.** Patchlines reference boxes by `id`, so renaming a box that has connections silently breaks all wiring to and from it. Keep original IDs intact; only assign new IDs to newly added boxes.

## Always Create a Presentation View — Binding Rule

Every patch that has a user interface gets a presentation view. "Has a user interface" means: it contains any object an operator will interact with at runtime — toggle, number, slider, dial, button, textedit, attrui, comment label, `jit.pwindow`, `jit.cellblock`, `live.*`, etc. The presentation is the patch's actual interface; the patching view is for editing the graph. Shipping a patch without a presentation forces the operator to navigate the editor view — friction even when the graph is well-organized.

The mechanics:

- Set `openinpresentation: 1` at the patcher root so the patch opens in presentation by default.
- Set `presentation: 1` on every UI object the operator should see.
- Set `presentation_rect: [x, y, w, h]` on each such object so it has an explicit position in the presentation layout. Presentation positions are independent of patching positions — optimize each view for its own purpose.
- Include comment labels for every visible control. A control worth showing is worth labelling.
- Omit internal logic objects from the presentation (`route`, `prepend`, `sprintf`, hidden message boxes used as routers, `print`, etc.). They live only in the patching view.

The threshold is "any UI," not "lots of UI." A patch with four UI elements (a START button, a status comment, a port number box, a `jit.cellblock` monitor) still gets a presentation — those four are the operator's interface and the rest is editing scaffolding. See `SPEC_REFERENCE.md > Presentation View` for layout specifics, and `patching/MAX_PATCHING.md > Presentation Aesthetic` for the visual checklist (panel grouping, monospace labels, color semantics, action prominence hierarchy).

Exempt cases: utility subpatchers embedded inside a parent's presentation (the parent supplies the UI), and pure-DSP / pure-utility patches with no operator at all (codebox modules called from elsewhere).

## Always Hide Redundant Message Boxes — Binding Rule

When a UI control (button, number, slider, dial, toggle, textedit, attrui, live.*) sits directly upstream of a message box that exists only to format / dispatch the UI's output to its consumer, **the message box is plumbing.** Set `"hidden": 1` on the message box AND on every patchcord touching it.

The pattern: `[UI control] → [message word $1] → [some receiver]`. The UI control is the operator-facing affordance. The message box is a formatter that the graph requires but the operator doesn't. Showing it clutters the locked view with a copy of the value the operator just set — and worse, invites the operator to click it as if it were an action button.

Examples that must be hidden:

- `[number] → [setport $1] → [node.script]` — the message box reformats the int as a `setport <n>` command. Hide it.
- `[button] → [start] → [node.script]` — the message box converts the bang into a `start` symbol. Hide it.
- `[textedit] → [prepend setpassword] → [node.script]` — the prepend (functionally a message-shaped formatter) reshapes the textedit value. Hide it.
- `[live.toggle] → [if $1 == 1 then play else stop] → [transport]` — only the toggle is the operator surface; the conditional message is plumbing.

Examples that stay visible (NOT redundant — operator-clickable):

- A `[bang]` button or message box that the operator hits directly to fire a one-shot action.
- A preset `[message setduration 30]` that the operator clicks to recall a specific value (no UI control upstream).
- An `[init defaults]` message wired off a `[loadbang]` and intended to be visible as a recall affordance.

The test: **remove the message box mentally. Does the operator still have a way to invoke the same action?** If yes (because the upstream UI control IS the action), the message box is redundant — hide it. If no (because the message box is itself the only way to fire the action), keep it visible.

The rule is symmetric with [Always Hide Plumbing Patchcords](#always-hide-plumbing-patchcords--binding-rule): hiding the message box creates an obligation to hide every cord touching it. A visible cord ending in a hidden box (or a visible box receiving from a hidden cord) is worse than no cord at all.

## Always Hide Plumbing Patchcords — Binding Rule

A patchcord whose sole job is to satisfy the graph — carrying a value between objects without itself communicating anything to a reader — must be hidden. Visible cords should mean something to the reader; everything else is noise on stage.

**Cords that must be hidden** (`"hidden": 1` on the patchline):

- Formatter cords — incoming and outgoing on any `prepend`, `sprintf`, `tosymbol`, `fromsymbol`, `pak/pack/unpack`, `zl` (when shaping), or message box that only reformats an upstream UI value.
- Cords feeding a display-only UI element — `comment` used as a status display, `number`/`flonum` used as a readout, `live.toggle` / `live.numbox` used as indicators, `jit.cellblock`, `multislider`, `jit.pwindow`, similar.
- Cords from operator-facing preset messages into internal logic (`node.script`, `js`, `v8`). The message box is the surface; the cord is plumbing.
- Cords between hidden boxes. If a box has `"hidden": 1`, every cord touching it must also be hidden.

**Cords that stay visible:**

- The main data router lines (e.g. `[node.script] → [route ...]`) — visible because they communicate the data path to anyone reading the patch.
- Connections between user-facing UI controls (e.g. `[live.gain~] → [ezdac~]`) where seeing the chain helps the operator reason about behavior.
- Cords going into a `print` object — debug visibility is the *point*.
- Cords inside a section deliberately presented as a wiring diagram for pedagogical reasons.

The rule is symmetric: hiding a box for being plumbing creates an obligation to hide every cord touching it. A visible cord that terminates in nothing is worse than no cord at all.

For instance: `[number] → [setport $1] → [node.script]`. The `[setport $1]` message box exists only because Node-for-Max can't read a raw int. Hide both incoming and outgoing cords on `[setport $1]`, and hide the message box itself. The locked view shows only the number box; the operator twiddles it and the message + cords stay invisible.

## Don't Use `[textedit]` for Set-Once Configuration — Binding Rule

`[textedit]` is the wrong object for any configuration value that is set once and then largely left alone (URLs, identifiers, file paths, hostnames, slugs, API keys, sample paths). It has three properties that make it brittle for this use case:

1. **Output only fires on Enter, not on patch load.** A patch that has the right value displayed in a textedit but hasn't been Enter-confirmed since reopen sends nothing downstream. Anything reading the value gets stale state (a default, an empty string, or whatever previous value it cached). The user sees a populated field and assumes the downstream side has the value too. It doesn't.

2. **Bang emits a `text`-prefixed list, not the bare content.** Patches that try to fix #1 by adding `[loadbang] → bang → textedit` discover that banging a textedit outputs `text <content>` as a multi-element list, NOT `<content>` alone. Downstream handlers that expect the value as the first argument silently receive the literal symbol `text`, producing surprises like `setpiece text-multi-user-template` (where the handler joined args with `-`). The bug is data corruption, not a parse error — the patch keeps running with the wrong value baked in.

3. **Visible-but-rarely-touched is a UX smell.** A set-once value displayed prominently in presentation trains the operator to think it's something they should be twiddling. It isn't. The presence of an editable field implies editability is intended; for true config, that's a lie.

### What to use instead

| use case | preferred object | why |
|---|---|---|
| **Value is truly set once per piece / per deploy** | hardcode in the upstream code (Node-for-Max, JS, the Worker, etc.); reference it from the patch via a fixed message if the patch needs to "send" it | source-of-truth in code, no Max-side UI surface, no Enter-required step |
| **Value is set occasionally and the operator types it** | `[dialog]` — modal popup, banged to prompt, outlet emits the entered symbol cleanly with no `text` prefix | explicit "open dialog → type → OK" workflow makes editing intentional; no risk of forgotten Enter |
| **Value is chosen from a small finite set** | `[umenu]` | typing-free, surfaces the available options to the operator, emits the selected item |
| **Value needs persistence + per-patch override** | `pattr` + `autopattr` with `@autorestore 1` | restores saved value at load time, banging outputs cleanly; emits on `parameter_initial` if wired |
| **A click-to-recall preset** | `[message <value>]` | visible, intentional click action; no Enter required; no `text` prefix |
| **Free-form text the user types repeatedly during a show** (chat, dynamic labels, search) | `[textedit]` — this is what it's actually for | the Enter-emit and `text`-prefix-on-bang behaviors are correct here |

### Recognition signal

If I'm about to add a `[textedit]` and the typical use is "the operator types in their URL / their server / their API key / their slug once and forgets about it," that is the moment to stop and pick a different object. Default to hardcoding in source. Escalate to `[dialog]` or `pattr` only if the value genuinely needs runtime mutability.

### Concrete worked example

The `multi-user-template` patch shipped a Cloud URL `[textedit]` with `parameter_initial` set to the deployed Worker URL. Symptoms during testing:

- First use: user typed URL → didn't press Enter → Cloud connect refused with "set cloud URL first" (textedit value never reached server).
- After adding `[loadbang] → bang → [textedit]`: Cloud connect dialled `wss://text wss://mu-relay…/mu/text-multi-user-template/text-main/host` (the `text` prefix corrupting every downstream arg).
- After adding `teArgs()` to strip `text`: Cloud connect dialled the literal placeholder `wss://mu-relay.<your-subdomain>.workers.dev` (the textedit's `parameter_initial` was never updated to the real URL, only the displayed `text`).

Three rounds of patching, three layers of workaround, all because a set-once config value was bound to a `[textedit]`. The fix that closed the bug class: delete the textedit, set the URL as a const in `server.js`. Derived repos override the const, not a UI field.

## Never Render an Empty Container When Server-Driven State Hasn't Arrived — Binding Rule

A UI region whose content comes from a server (snapshot, roster, role list, sensor stream, anything pushed) must distinguish three states in the rendering, not collapse them into one empty `<div>`:

1. **Haven't received any state yet** — transport pending, server unreachable, host not online, etc.
2. **State received but the field is genuinely empty** — operator configured no entries, no performers have joined, no events yet.
3. **State received with content** — normal rendering.

Rendering an empty container for cases (1) and (2) produces the same DOM as case (3) — the user sees nothing and has no way to tell which problem they have. "Nothing" reads as either "no entries exist" or "this app is broken," and the user reloads / closes / blames the network until they hit something else.

**The fix is explicit labeling.** Each not-yet state must surface a visible placeholder that names *which* not-yet it is. For instance, in the multi-user-template Join page:

- `!lastSnap && isCloud && cloudHello && cloudHello.connections.host === 0` → "Connected to the relay, but no Max host is online for this piece/room yet."
- `!lastSnap && isCloud` → "Connecting to the relay…"
- `!lastSnap` → "Connecting to the Max server…"
- `lastSnap && availableRoles.length === 0` → "The host hasn't configured any roles."
- `lastSnap && availableRoles.length > 0` → render the role tiles.

The five branches use the same UI region, but a confused user now knows whether to wait, switch wifi, restart Max, or ask the operator to type roles into a textedit.

**Where this applies.** Anywhere server state shapes the UI: WebSocket-driven dashboards, REST-fetched lists, real-time roster panels, async-arriving config, anything that starts `null` / `undefined` / `[]` and gets populated later. The rule is symmetric with [Always Hide Plumbing Patchcords] — silence isn't neutral. Visible state that turns out to be incomplete is much less confusing than absence that turns out to mean "still loading."

**The recognition signal:** if I'm writing `(arr || []).map(...)` or `if (data) { ...render... }` and the falsy branch produces nothing — that's the moment a placeholder is required. The fix is not adding a "loading" spinner everywhere (spinners conflate loading with broken); it's naming the specific not-yet condition the user is in.

For instance: an empty role grid on the Join page initially looked indistinguishable for the user between (a) WebSocket still connecting, (b) connected to relay but no Max host registered, (c) Max host registered but no roles configured. Three different fixes; one rendering. Replaced with an explicit "Waiting:" banner that names which case is current.

## Never Regress Functionality When Changing Modality

**General rule**: when any working feature — display, control, behavior, format — is moved, replaced, or reimplemented in a different modality, it must arrive at least as capable as it left. A change of modality is not a reason to lose functionality.

This applies to: switching UI objects, reformatting data for a new display, replacing a message with a UI element, moving logic from patch to JS or vice versa, or any other substitution. If the user didn't ask for a feature to be removed, it must survive the transition.

**Specific case — display format**: when moving information from one display context to another (Max console → cellblock, message box → UI element, etc.), carry over all essential elements of the working format — indexing, orientation, field order, readable structure. Do not drop features just because the new modality doesn't force you to include them.

Before implementing any new display for existing data, inventory every piece of information in the current format and confirm all of it is present in the new one.

## Model Selection — When to Use Opus vs Sonnet

Claude Sonnet is the default and handles most tasks. **Do not proceed silently on Sonnet when Opus is warranted** — pause and prompt the user first. Use the exact phrasing below so the prompt is unambiguous.

### Prompt to switch to Opus

When any of the following tasks arises, stop before beginning and say:

> "This task warrants Opus for better results — run `/model claude-opus-4-7`, then let me know and I'll continue."

Trigger cases:

1. **Analyzing a dense or complex existing patch** — non-obvious signal flow, reverse-engineering intent, structural problems
2. **Studying complex documentation** — Max refpages, third-party package docs, API references where subtle distinctions matter
3. **Analyzing installed packages** — evaluating objects, writing `use_when` judgments for `packages/package_objects.json`
4. **Reading complex Cycling '74 forum threads** — synthesizing community knowledge, distinguishing good advice from outdated workarounds
5. **Planning a new complex patch** — architecture decisions, subpatcher decomposition, signal flow design before any spec is written
6. **Designing a presentation mode UI** — layout hierarchy, panel grouping, visual weight, control placement. Stop and offer the user two options:

   > "Before we design the presentation UI, choose an approach:
   > - **Option A** — run `/model claude-opus-4-7` and we'll design it here (Opus = same model as Claude Design)
   > - **Option B** — take the design to [claude.ai/design](https://claude.ai/design), which has separate usage included with your account, then bring the layout back and I'll translate it into spec coordinates
   >
   > Which would you prefer?"

   Wait for the user's choice before proceeding. If they choose Option B, ask them to describe or paste the layout when they return and you'll handle the spec translation on Sonnet.

   **Periodic check**: Claude Design is evolving rapidly. At the start of any session involving presentation UI work, do a quick web search for recent Claude Design news — new capabilities, API availability, Claude Code integration, or workflow changes. If anything materially affects how it can be used here, update this rule before proceeding.

### Prompt to switch back to Sonnet

When the analytical or design phase is complete and implementation begins (spec writing, conversion, file editing), say:

> "The analysis/design phase is done — you can switch back to Sonnet now: `/model claude-sonnet-4-6`."

## Before Beginning Any Work

Read and review the entire Claude2Max repo before starting — `CLAUDE.md`, `SPEC_REFERENCE.md`, `TUTORIAL_GUIDELINES.md`, and `spec2maxpat.py` — so your understanding of the current spec format, converter behavior, and conventions is fully up to date. Do not rely on prior session knowledge alone; the repo is the authoritative source.

**Before constructing or editing any patch**, read `patching/MAX_PATCHING.md`. It contains all patching principles, presentation view guidelines, documentation verification rules, and common pitfalls. Treat its presentation section as a checklist before starting any presentation layout.

**Before designing or analyzing anything inside a `gen~` / `gen` box**, also read `patching/GEN_PATCHING.md`. gen~ is a separate dataflow language with its own object set and per-sample evaluation model — patterns from MSP do not necessarily translate.

**Before designing or analyzing anything inside a `jit.gen` / `jit.gl.pix` box**, read `patching/JIT_GEN_PATCHING.md`. Same gen language as gen~, but iteration is per-cell or per-pixel rather than per-sample — `samplerate` and audio-time idioms do not apply; position primitives (`norm`, `cell`, `dim`) and texture sampling do.

**Before writing a `[js]` or `[v8]` script that reads or writes a `jit_matrix`**, read `patching/JITTER_JS_PATCHING.md`. The JitterMatrix API has several silent-failure modes — most notably the constructor-name-as-first-arg trap, where passing a name as the first positional arg makes JS silently bind to a (possibly nonexistent) named peer and ignore the rest of the constructor args. The matrix then stays empty and every `setall` / `setcell2d` is a no-op with no warning. The file also covers inlet/outlet declaration, the canonical "consume a matrix, paint and emit another" template, and when to reach for `jit.gen` / `jit.gl.pix` / `jit.expr` instead of JS.

**Before working on a Max for Live device**, read `patching/M4L_PATCHING.md`. M4L adds the Live Object Model, `live.*` UI objects, device-lifecycle considerations, and `.amxd` packaging — none of which appear in standalone Max patches.

## Always Use Absolute Paths in Bash Commands — Never `cd`

The Bash tool's working directory persists across calls within a session. A single `cd subdir/` silently shifts the cwd for every subsequent Bash call until it is manually restored — including cwd-relative tool configs, hook scripts, and env-var-sensitive imports that depend on the repo root. This is a session-wide silent failure: commands that looked correct keep running from the wrong directory with no error output.

The defensive pattern: use absolute paths in every Bash command. When a tool genuinely needs a specific base directory (e.g. a Claude Code hook pointing at `$CLAUDE_PROJECT_DIR/...`), use the documented env var rather than `cd`. Do not use `cd` to set up an environment for subsequent calls — each call should be self-contained with absolute or env-var-anchored paths.

## Workflow

### Working on an existing patch — sync first, always

**Before any work on an existing .maxpat**, run sync to capture manual edits the user made in Max. No exceptions — not even for small fixes. `convert` regenerates the .maxpat from scratch and will silently destroy moved objects, added/deleted objects, hidden objects, and hidden cords.

**The sync-first rule applies to any source of edits — not just user GUI changes.** Any direct modification to a .maxpat — whether a user edit in Max's GUI or a programmatic post-processing script — is invisible to the embedded spec and will be silently overwritten on the next `convert`. Use `/c2m-sync` or run `python3 spec2maxpat.py sync -i <patch>` immediately after any direct .maxpat modification.

### Sync preserves; it does not prune — verify object count before every convert

`sync` is a one-way mirror from `.maxpat` into the embedded spec. It captures whatever it finds, including orphan boxes that no longer wire to anything. If a prior session (or an imported patch) accumulated duplicate orphans — most commonly via repeated sync→convert cycles where each round adds another copy of a control box — `sync` will faithfully preserve every one of them, and the next `convert` will re-emit them as visible boxes in the regenerated patch. The patch silently re-explodes.

For instance: a recent IMMER session's embedded spec held 1669 objects while the visible patch had 135. The 1534-object delta was a single message — `setfadein $1` — duplicated 1535 times in the spec, none of them wired. Converting that spec without pruning would have re-bloated the patch back to 1669 boxes, drowning the operator's view in clones during performance.

**Right after every `sync` and before every `convert`, compare `len(spec.objects)` to `len(patch.boxes)`.** If they diverge by more than a handful, prune the spec before converting. Drop unreferenced `message` / `newobj` boxes (those genuinely serve no purpose without wiring). Keep unreferenced `comment` / `panel` / `pwindow` / `bpatcher` boxes — those are legitimate UI orphans (labels, background panels, presentation-only elements, embedded sub-patchers).

Reference pruner:

```python
referenced = {n for c in spec['connections'] for n in (c[0], c[2])}
to_drop = [n for n, o in spec['objects'].items()
           if o.get('type') in ('message','newobj') and n not in referenced]
for n in to_drop: del spec['objects'][n]
```

This is one extra check per sync — cheap insurance against a failure mode that does not surface until the patch is reopened and the operator scrolls into a forest of orphan controls.

### Spec files are temporary — do not leave them in the project

The spec is embedded inside every `.maxpat`. Standalone `.json` spec files are only needed as a scratch file during `convert`. Write them to `/tmp/` rather than the project folder, then delete after converting. The `.maxpat` is the single source of truth.

### New patch (from scratch)

1. User describes a Max patch they want
2. Write a JSON spec following `SPEC_REFERENCE.md`
3. Convert: `python3 spec2maxpat.py convert -i /tmp/spec.json -o patches/patch.maxpat`
4. User opens in Max, gives feedback, iterate

### Suggested Student Workflow — Description → Plan → Instructor Review → First Draft

This is the recommended path for building a new patch from scratch, especially in a classroom context. It is deliberately slower than "describe it and Claude builds it in one shot" — the extra steps give the student a chance to refine their thinking and let the instructor catch problems before they are baked into a patch. Treat this as a starting point, not a fixed rule; refine it with the student as you go.

1. **Student describes the patch.** Plain English — what it should do, what it should sound like or react to, what the controls should be. No Max objects yet.
2. **Claude proposes a planned structure.** A high-level workflow: input → main processing stages → output, including any sub-systems (sequencer, voice manager, FX bus, GUI). Still no specific object names — just the shape of the patch and the data flow between stages.
3. **Student edits the proposal.** The student adjusts the structure until it matches what they actually want. Claude treats this as iterative — every change is folded back into the plan before moving on.
4. **Claude proposes a concrete object approach.** Now Claude names specific Max objects for each stage (`metro`, `groove~`, `cv.jit.faces`, etc.), consulting `packages/package_objects.json` first to avoid long native chains when a single package object covers the need. The proposal includes inlet/outlet wiring at a high level and identifies any sub-patchers.
5. **Submit the object proposal to the instructor.** The student copies the proposal out and asks their instructor for revisions or additional suggestions. Claude does not build yet.
6. **Student returns the instructor's response.** Paste it into the conversation. Claude reads it as authoritative — instructor feedback overrides Claude's earlier choices unless the student says otherwise.
7. **Claude asks follow-up questions.** Anything ambiguous in the instructor's response, anything that conflicts with the earlier plan, or anything Claude would otherwise have to guess at — surface it as a question rather than silently picking an answer.
8. **Student and/or instructor answer the questions.** Loop on steps 7–8 until Claude has enough to build without guessing.
9. **Claude builds the first-draft .maxpat.** Write the spec, embed it, run `convert`, and hand the patch back for student testing in Max.

After the first draft, normal Claude2Max iteration applies — sync before any edit, observe what's working before changing it, and keep `WORK_HISTORY.md` and `insights.md` up to date.

### Preferred Objects for Common Tasks

When planning a patch for a student, default to the objects in the table below for each task. These are the first-instinct choices — Max often has three or four ways to do anything, but the entries here are the ones that are simplest to wire, easiest to explain, and most likely to be what a beginner actually wants. Reach for an alternative only when there's a specific reason the default doesn't fit (e.g. the student has asked for something the default can't do, an external they're already using exposes a different interface, or the package library surfaces a single-object solution to an otherwise-long chain).

| Task | Default | Notes |
|---|---|---|
| Play a sound file | `playlist~` | One object, multi-file with crossfades; vastly better than rolling `sfplay~` + bank logic by hand. |
| Play video | `jit.playlist` | Same idea on the Jitter side — multi-clip playlist with crossfades. |
| Audio I/O | `ezadc~` (input) / `ezdac~` (output) | The toggle-style I/O objects. Click the speaker icon to enable. Don't use `adc~` / `dac~` for student patches — the toggle UI is the point. |
| MIDI input | `notein` / `ctlin` / `bendin` directly | Skip `midiin` + `midiparse` — go straight to the object that emits the data you need. |
| MIDI output | `noteout` / `ctlout` directly | Same as input — direct objects, no `midiformat` + `midiout` intermediate. |
| Audio synthesis — basic oscillators | `saw~` / `tri~` / `rect~` | The trio of bandlimited classic waveforms. Pick the one whose harmonic content matches the timbre you want; layer two or more for richer tones. |
| Audio synthesis — sample playback | `groove~` | Needs a named `buffer~` upstream; supports loop points, playback speed, and direction. |
| Recording audio into a buffer | `record~` | Needs a named `buffer~`. Toggle to start/stop. |
| Reverb | `bp.Gigaverb` (BEAP, ships with Max) | The lush default. `bp.Freeverb` is a lighter Schroeder-style alternative — also BEAP, also ships with Max. For higher fidelity, `hirt.convolutionreverb~` from HISSTools with a real IR — install the HISSTools package first. |
| Delay line | `tapin~` / `tapout~` | `tapin~` holds the buffer; one or more `tapout~` objects read from it at different delay times. Don't reach for `delay~` — `tapin~/tapout~` is the standard idiom. |
| Filter | `biquad~` with `filtergraph~` | `filtergraph~` is the editor — drag the graphical handle, send its output into `biquad~`'s right inlet to set coefficients. Visual + audible at the same time. |
| Multi-value input | `multislider` | One object, N sliders, list output. Configure via inspector. |
| Multi-column data display | `jit.cellblock` | The spreadsheet-style readout. Drive with `cell <col> <row> set <val>` messages. |
| Sequencer / clock | `metro` | Send `1` to start, `0` to stop. Set interval as a creation argument or via the right inlet. |
| Random / probability | `random` with attributes | Use creation argument or `@range` / `@seed` attributes — don't roll your own with `expr`. |
| Scale / map a number range | `scale` | `scale <in_lo> <in_hi> <out_lo> <out_hi>` — one object, no math. Don't reach for `expr` for simple range mapping. |
| Comparing / routing values | `v8` JavaScript | Branching logic with multiple conditions is far cleaner expressed as a few lines of JS than as a tree of `if` / `select` / `route` boxes. Use `v8`, not `js`. |
| Single button / toggle / dial / slider | Varies by context | `button` for momentary, `toggle` for on/off state, `dial` or `live.dial` for continuous, `slider` or `multislider` for linear ranges. Pick the affordance that matches the operator's mental model for that control. |
| Number readout (display only, no input) | `message` box with input to right inlet, OR `comment` with `set <value>` message | Send `flonum → sprintf "%.2f" → (right inlet of message)` for a clean float readout. The message displays the value but doesn't fire. Alternative: `flonum → sprintf "set %.2f" → comment` if you want the styling of a comment rather than a message. |
| Text input from the user | `dialog` | A modal popup — bang to prompt, the entered text comes out the outlet. Avoid `textedit` for set-once configuration values (see the binding rule "Don't Use `[textedit]` for Set-Once Configuration"). |
| List manipulation | `v8` JavaScript | Filtering, reshaping, mapping, sorting a list is one line of JS. Don't chain `zl` / `pak` / `unpack` / `vexpr` for anything beyond the trivial cases. |
| Long-term storage | `dict` (default) | Key/value storage with nested structures, JSON-compatible. Other choices apply when the data shape calls for them: `coll` for indexed lists, `text` for plain-text bodies, `pattr` + `autopattr` when the values must persist with the patch. |
| Jitter — load an image | `jit.matrix` + `importmovie <path>` message | One matrix, one message — the image lives in the matrix. From there, send it through any Jitter chain or `jit.gl.videoplane`. |
| Jitter — display a matrix | `jit.world` + `jit.gl.videoplane` (sometimes called `jit.gl.layer` — an alias prototype with attributes pre-set) | Two-stage render: a first `jit.world` runs your scene, captured to a texture; a second `jit.world` reads that texture via `jit.gl.videoplane`, optionally routed through `jit.gl.cornerpin` for projector keystone correction. |
| Webcam capture | `jit.grab` | Open the device, send `bang` per frame (or wire a `qmetro` upstream). One object, no driver wrangling. |
| GL drawing | No strong preference | Pick the `jit.gl.*` object that matches the primitive you need — `jit.gl.gridshape`, `jit.gl.mesh`, `jit.gl.sketch`, `jit.gl.text`, etc. |
| OSC | `udpreceive` + CNMAT odot `o.route` | Use `o.route` rather than the native `OSC-route` when CNMAT odot is installed — `o.route` has cleaner semantics and is what the rest of the OSC community converged on. Install via Package Manager → CNMAT Externals. |
| Networking / WebSocket | `node.script` + the multi-user-template | When the patch needs to talk to phones, browsers, or the cloud, build on `multi-user-template` (see the dedicated section above) — don't roll a Node-for-Max LAN server from scratch. |
| Send / receive between distant parts of a patch | `send` / `receive` for messages, `value` for shared scalar state, `pv` / `v` for patcher-scoped variables, `send~` / `receive~` for signal | Pick by lifetime and scope. `send`/`receive` for cross-patch broadcast of messages; `value` when two boxes need to read the same shared scalar; `pv`/`v` when the scope should not leak past the parent patcher; the `~` variants for signal-rate. |
| JS / scripting | `v8` (default) | Modern JavaScript engine — ES6+, faster, better-supported. Use the older `js` object only when you have a specific reason (e.g. you're modifying an existing patch that already uses it). |

When in doubt — or before composing any chain of 3+ native objects — run `python3 packages/query_packages.py search "<term>"` to see whether an installed package handles the whole task in a single object. The package library (2,795+ entries) often shortcuts a long chain into one well-named external.

### Existing patch (externally sourced or manually edited)

Run `/c2m-sync` first. Extract, edit, convert. All patches live in `patches/`.

## Max Compressed Text (MCT)

**Produce MCT only when the user requests it, or when the user has already provided MCT in the conversation.** Never paste raw `.maxpat` JSON — users can't open it. MCT is the format Max uses for "Copy Compressed": the user copies the block and does **File > New From Clipboard** to reconstruct the patch.

```bash
python3 spec2maxpat.py mct -i patches/patch.maxpat   # produce MCT
```

To decode MCT received in the conversation: `python3 -c "from spec2maxpat import mct_decode; import sys,json; print(json.dumps(json.loads(mct_decode(sys.stdin.read())),indent=2))"` piped from the MCT block. See `SPEC_REFERENCE.md` § "MCT Encoding Algorithm" for the encoding detail.

## Key Files

- `SPEC_REFERENCE.md` — **Read this first.** Complete spec format, object types, connection format, layout guidelines, v8/JS objects, MCT encoding, worked examples.
- `patching/MAX_PATCHING.md` — Patching principles, presentation guidelines, documentation verification rules, common pitfalls. Read before any patch work.
- `patching/GEN_PATCHING.md` — gen~ / gen programming model (audio rate / control rate), canonical idioms (slide envelope follower, samplerate→ms, equal-power crossfade), latency-compensation discipline. Read before any work inside a `gen~` / `gen` box.
- `patching/JIT_GEN_PATCHING.md` — jit.gen / jit.gl.pix programming model (per-cell / per-pixel), position primitives (`norm`, `cell`, `dim`), texture sampling, distance-field idioms. Read before any work inside a `jit.gen` / `jit.gl.pix` box.
- `patching/JITTER_JS_PATCHING.md` — JitterMatrix API from `[js]` / `[v8]`: constructor forms (and the name-as-first-arg trap), `setall` / `setcell2d` / `getcell2d`, inlet/outlet declaration, the canonical "consume and emit" template, and when to reach for `jit.gen` / `jit.gl.pix` / `jit.expr` instead. Read before any JS-driven matrix work.
- `patching/M4L_PATCHING.md` — Max for Live patterns: Live Object Model access chain, `live.thisdevice` init signal, `getpath` + `deferlow` race, Push 3 polyphonic pressure, `live.*` UI styling, `.amxd` packaging. Read before any M4L device work.
- `spec2maxpat.py` — The converter. I/O data from C74 maxref.xml via `RefpageCache`; no external database.
- `TUTORIAL_GUIDELINES.md` — Tutorial structural contract, panel/annotation attrs, comment-pile pattern, breakage diagnostic.
- `packages/package_objects.json` — Curated reference of installed Max package objects with `use_when` judgments.
- `packages/package_concepts.md` — Per-package paradigms (bach lllls, FrameLib frames, FluCoMa corpus workflow, etc.).
- `packages/package_schema.py` — Canonical schema; `normalize()`/`validate()` for `package_objects.json`.
- `packages/query_packages.py` — `list`, `search <term>`, `validate`. Read-only CLI for the package library.
- `packages/CURATION.md` — How to extend package coverage: extractor CLIs, schema norms, `use_when` quality bar.
- `c74-forum/forum_insights.md` / `cookbook/cookbook_insights.md` / `c74-projects/c74_projects_database.md` — Community knowledge, non-obvious patterns, real examples, and a catalog of community projects.

## Knowledge Resources — Consult Before Designing

When designing or debugging a patch, consult these curated sources — not just the official docs:

- **`packages/package_objects.json`** — 2,795 package objects with `use_when`. Search: `python3 packages/query_packages.py search "<term>"`. Check before building any multi-object native chain.
- **`packages/package_concepts.md`** — Paradigms for packages with custom types (bach lllls, FrameLib chains, FluCoMa workflow). Read when using a new package.
- **`c74-forum/forum_insights.md`** — Non-obvious behaviors, preferred patterns, performance pitfalls from Cycling '74 forums.
- **`cookbook/cookbook_insights.md`** — Insights from Max Cookbook examples (Dobrian/UCI).
- **`c74-projects/c74_projects_database.md`** — Catalog of community projects from <https://cycling74.com/projects>. Search this when answering "is there an existing Max for Live device that does X?" or "who has built something like Y?". Note: most gallery entries link to commercial products (paid M4L on gumroad / vstopia / vendor stores) — patch source is rarely available. Free patches that are extracted go to `c74-projects/c74_projects_insights.md`.

_Add new scraped resources here. Every knowledge folder: `<source>/CRAWL_LOG.md`, `<source>/crawl_state.json`, `<source>/<source>_insights.md`._

## Multi-User Template — Available Pattern for Phone-Driven Pieces

There is a shared infrastructure repo, **`multi-user-template`**, at:

```
/Users/johnjannone/Library/CloudStorage/Dropbox-JohnJannone/john jannone/_Projects__________________/_GitHub/multi-user-template
```

Whenever a student (or John) asks for a Max patch that uses **multiple
phones in the room as controllers / sensors / displays**, default to
basing the work on this template instead of building the WebSocket /
HTTP / OSC plumbing from scratch in a spec. The template already
provides:

### What's in the template

- **LAN server** — Node-for-Max (`server.js`) loaded by `node.script` in
  the patch. HTTP serves a static client; WebSocket fans events both
  ways; OSC over UDP forwards sensor data to a `[udpreceive] → [oscparse]`
  chain in the patch.
- **Lobby + role flow** — name entry, role multi-select, admin
  password (set in the patch), transport gate.
- **Stage UI with 15 tabs** — every sensor the browser exposes (motion,
  gyro, orientation, heading, geolocation, mic + STT, camera, multi-
  touch, pointer/pencil, gamepad, ambient light, battery, network,
  screen state, barometer, proximity, Bluetooth scan, NFC read) plus
  test pages (4-slider + 4-dial, 16-pad grid, text keyboard, 2-octave
  MIDI keyboard).
- **Output engine on the phone** — Max → phone commands for `vibrate`,
  `speak` (TTS), `beep`, `display`, and a full Web Audio synth engine
  with osc / FM / wavetable / sample modes. All parameters drivable
  live from Max.
- **Cloudflare Worker cloud relay** (`cloud/worker/`) — a generic
  Durable-Object-based WebSocket fan-out for remote performers and
  audience members. **Deployed once for ALL pieces built on the
  template** — a derived repo doesn't redeploy. The patch's "Piece" and
  "Room" fields select which Durable Object it opens.

### Message surface available to the patch

When you generate a patch that ingests data from the template, route
the `node.script` outlet by leading symbol:

```
performer add|remove|role|roles <name> [args]
roster <name1> <name2> ...
status <text>
url <http://...>
started <0|1>
admincount <n>
sensor <name> <kind> <args...>     kinds: motion gyro orient heading
                                           geo mic touch pointer
                                           gamepad button slider dial
                                           key text midi battery net
                                           light gravity linaccel
                                           magnet pressure proximity
                                           screen speech
cloud status|connected <args>
audience input|react|ping|join|leave <name> [args]
```

OSC arrives at `[udpreceive <port>] → [oscparse]` with addresses:

```
/user/<name>/<kind>[/<sub>]   sensors and controls
/audience/<name>/<kind>/<id>  audience inputs
```

Message surface from the patch back to phones (just send to
`node.script`'s inlet):

```
vibrate <ms>                  [vibrateto <name> <ms>]
speak <text...>               [speakto <name> <text...>]
beep <freq> <ms>              [beepto <name> <freq> <ms>]
display <text...>             [displayto <name> <text...>]
synthnote <note> <vel>        [synthnoteto <name> <note> <vel>]
synthset <param> <value>      [synthsetto <name> <param> <value>]
synthmode osc|fm|wavetable|sample   [synthmodeto <name> <mode>]
```

And, for cloud-relay control:

```
setcloudurl wss://...   setpiece <slug>   setroom <slug>
cloudon                 cloudoff
```

### `/lan/<piece>/<room>` — static landing pages can link to the live LAN URL

The relay also exposes a tiny HTTP redirect at
`GET /lan/<piece>/<room>` that 302s to whatever LAN URL the host most
recently announced. The host announces by sending
`{type:"host-info", lanUrl:"http://<lan-ip>:<port>/"}` on its outbound
WebSocket (the template's `server.js` does this on `sock.on("open")`
and re-sends after `setport`). The relay stores it in the Durable
Object and serves it back as a redirect; returns a friendly 404 with
"No Max host is currently connected to this room" when nothing has
registered.

This is what lets a static landing page (e.g. john.jann.one) carry a
"Local mode" button that resolves to the operator's *current* laptop
IP without the static page knowing it. Pattern is:

```
john.jann.one card → /lan/<piece>/<room> on the relay
                  → 302 → http://192.168.x.y:<port>/   (lifted from host-info)
                  → the operator's LAN server serves the client
```

Multi-user-template's home-page card uses this; IMMER v2's does too.
Any derived piece can adopt the pattern by sending `host-info` from
its bridge — no Worker change.

### Cloud-relay quirks worth knowing

These bit IMMER v2 and would bite any derived piece in the same way.

- **`textedit` outlet 0 emits `text <symbol>` by default
  (`outputmode 0`).** Wiring it into `[setcloudurl $1]` captures the
  literal symbol `"text"`. Set `@outputmode 1`, route through
  `[route text]`, or skip the textedit and hardcode in code. Full
  rule in the "Common Pitfalls" list further up.
- **Broadcast ordering: `toRole:"perform"` first, per-name `to:<name>`
  second.** The relay forwards both to a joined remote performer's
  socket. The generic broadcast omits the `you` field; if it arrives
  *after* the personalized one, it clobbers `you` on the client. The
  inverse of "specific then general" — here specific arrives last so
  it wins.
- **`node.script @watch 1` re-execs the script but doesn't re-fire
  loadbang.** Patch-side loadbang seeds vanish on every save unless
  the same values are hardcoded in the script's initial literals.
  Belt-and-suspenders: keep both — script defaults survive hot
  restart, loadbang messages re-assert on fresh patch open.
- **Hold-in-progress UI state is server-derived; let the snapshot
  pipeline handle reverts.** For any UI signal driven by an
  accumulator that can break before it locks (pair-hold, solo-hold),
  expose the live accumulator set in every snapshot and have the
  client re-apply the class on each render. Removal from the set in
  the next snapshot drops the class — no client-side state machine
  needed for the "revert when the hold breaks" behaviour.

### Time-bounded pieces — `completed` is its own state, not `started=false`

A piece with a fixed duration (countdown to zero) has three transport
states, not two: `countingIn → started → completed`. Without an
explicit `completed` flag, "started=false" is ambiguous between "not
yet started" and "finished" — clients drop back to the lobby with no
end-of-run indication. Add a third boolean to the snapshot, set it
true when the countdown hits zero (`Max.outlet("complete", "bang")`
moment), and clear it on the next `beginCountIn` / `stopPiece` /
`resetState` / `clear` so a fresh run is fresh. Clients use this to
hold an end-of-run report screen instead of evaporating back to the
join screen.

Companion: manual STOP is NOT a natural end. Clear `completed` on
manual stop so the end-report screen only ever appears after a clean
durationMs countdown.

### Pre-piece role staking — reset on phase entry, not on phase transition

If the piece has a count-in phase with UI controls visible (role
buttons, etc.), think about WHICH state mutations are allowed during
count-in and WHEN you reset. The intuitive ordering — "reset on the
actual piece start" — silently wipes any pre-staking the user did
during count-in: buttons "work" then visibly revert to idle the
moment the piece begins.

Move the per-performer reset into `beginCountIn` instead, and remove
the role-mutation guard (`if (!started) return`). Count-in begins from
a clean slate; choices made during the staking window persist into the
live piece; `accumulateTime` is already a no-op while `!started` so
no time accrues prematurely.

The general rule: **for any transitional phase with live UI, reset at
phase entry, not at phase exit.** Exit-time reset and during-phase UI
contradict each other.

### Local-clock interpolation between server snapshots

The template's `broadcastSnapshot` cadence is ~2 s during a running
piece. UI signals that need sub-second resolution — countdown digits,
threshold-crossing flashes ("turn red at 10 s remaining"), time-in-
current-role displays — pin the server value at snapshot time and
tick locally on a 1 Hz `setInterval`:

```js
let valueAtSnap = null, snapLocal = 0;
// in render() on each snapshot:
valueAtSnap = snap.someMs;
snapLocal   = Date.now();
// in setInterval(1000):
const current = valueAtSnap - (Date.now() - snapLocal);
applyUIState({ ...lastSnap, someMs: current });
```

Without this, threshold-crossing UI stutters with the snapshot cadence
— users see "switch to red at 10 s" cross up to 2 seconds late. Used
twice in IMMER v2: countdown digits and the red-urgency flash
thresholds.

### Null-user / watcher mode — body class, not a server role

A monitoring phone that wants to see live state without joining the
performer roster does NOT need a separate server-side role. The
relay's `audience` role exists for a heavier audience tier
(constrained input vocabulary, separate broadcast scope); a "just
watch" phone is lighter than that. Skip it.

Instead: the client just *doesn't send* `{type:"join"}`. Set a local
`iAmWatching` flag and toggle a `body.watching` class. CSS rules swap
performer-only DOM (role buttons, personal stats, "haven't played
with" lists) for watcher-only DOM ("currently playing music" lists, a
watching badge, a stop-watching button). The server side is
completely untouched — the relay sees a connected perform socket
with no name, the host's mu-presence handler ignores it (no name
means no performer record to disconnect). Zero protocol change.

Same `body.<state>` pattern works for the end-of-piece urgency
classes (`.urgent-slow`, `.urgent-fast`, `.urgent-solid`,
`.end-state`) and any other mutually-exclusive UI variant. CSS-driven
state machines on `<body>` are cleaner than imperative show/hide in JS
when the variants are mutually exclusive and span many DOM nodes.

### Design for failure modes, not just the happy path

In any live multi-user piece, the dominant UX failure isn't a bug in
the code — it's a phone that drops mid-piece (lost wifi, screen lock,
OS sleep, app backgrounded, accidental refresh, browser tab
suspended, host laptop reboot). Plan for it from day one — recovery
needs to be a single tap, not a name-typing exercise.

**Server side** (most of this is already documented above; recap):

- Don't conflate "WS closed" with "performer left." Preserve the
  performer record across drops, set `connected: false`, force the
  role to idle so accumulators stop ticking, and require an explicit
  `{type:"leave"}` to actually delete state. See the "Disconnect ≠
  leave" rule.
- Use a heartbeat sweep — `ws.on("pong")` + periodic `ws.ping()` +
  `terminate()` of stale sockets. `ws.on("close")` only fires on
  *clean* TCP close; a phone in airplane mode or with a hung network
  stack leaves the server-side socket "open" indefinitely without
  this.
- Duplicate-name join order matters: overwrite the `sockets` map
  entry with the NEW socket FIRST, then close the old socket. The
  reverse order has the old socket's close handler see its own entry
  still in the map and call `disconnectPerformer` on the brand-new
  connection. See the "Duplicate-name join must close the old socket"
  rule.
- For cloud-relay pieces: the relay's host-singleton lets a restarted
  Max patch kick the old host without remote clients noticing.
  Server-side restart is invisible to remotes as long as the new
  host re-announces via `host-info` and broadcasts the current
  snapshot on `open`.

**Client side** — three affordances IMMER v2 carries; copy them for
any derived piece:

1. **Tap-to-rejoin on the roster chips.** When the viewer hasn't
   joined yet, every chip in the "already joined" roster is clickable;
   tapping fills the name input and fires Join. Because the server's
   `addPerformer` is already idempotent on name, this re-attaches
   to the existing performer record with all accumulated time,
   pairings, and solo flags intact. No re-typing.

2. **Visible disconnected status.** Expose a `disconnected: [name,
   ...]` list in the snapshot. Style those chips on the client with
   a `.gone` class — faded colour, dashed border. A returning user
   sees their own dimmed chip immediately and knows to tap it,
   without scanning the whole roster.

3. **No `localStorage` for identity.** Refresh is the canonical
   "reset me" gesture. Don't auto-rejoin under a previously-typed
   name from local storage — that traps stale names after a CLEAR
   and causes different phones to render different "already joined"
   lists depending on when each one happened to load the page. Keep
   `myName` in script memory only, so WS reconnects within the same
   page session still auto-rejoin, but a hard refresh wipes it.

The three combine: a phone that drops wifi and comes back after a
refresh sees its own dimmed chip and re-joins with one tap. A phone
that loses wifi momentarily without refreshing auto-rejoins on WS
reconnect. A user who closes the tab is gone until they reopen the
URL and tap.

**The general principle.** For any live piece, list every way a
client can vanish (refresh, lock, sleep, airplane mode, app
background, OS update, host restart, server crash). For each, write
down: (a) how the server notices, (b) what state survives, (c) how
the user comes back, (d) how many taps that costs them. If any answer
is "they re-type their name" or "they re-pick a role" or "they have
to wait for someone to restart something" — the design is incomplete.
The piece will hit that failure during the run, and the affordance is
what saves the moment.

### Authoritative documentation

The template's own docs cover patterns, gotchas, and feature-detection
tables in detail. Before designing a patch on top of the template,
read:

- `multi-user-template/README.md` — architecture, the LAN + cloud
  topology, deployment notes.
- `multi-user-template/CLAUDE.md` — load-bearing patterns (disconnect ≠
  leave, heartbeat, duplicate-name handling, host singleton, sensor-by-
  name dispatch, audience whitelist, etc.).
- `multi-user-template/cloud/worker/README.md` — the relay's URL shape
  and role conventions.

### When to use it

- A piece where **performers' phones drive Max** (motion, touch, MIDI,
  text, voice).
- A piece where **Max drives phone outputs** (synthesis, speech,
  display, haptics).
- A piece that needs **a lobby + admin gate + roles**.
- A piece intended to support **remote performers or audience over the
  internet** (use the cloud relay; no new Worker to deploy).
- A spec where the student would otherwise reinvent the LAN HTTP+WS
  scaffold — point them at the template instead.

### When NOT to use it

- A pure desktop / hardware-driven patch with no mobile component.
- A patch using a fixed external controller (TouchOSC, MIDI keyboard
  hardware) — those can still be wired alongside but the template is
  overkill if there are no phones in the loop.

## Consult Installed Packages Before Long Native Chains

Check `packages/package_objects.json` before composing any 3+ native-object chain. The `use_when` field is the load-bearing entry — it tells you when and how to drive the object. Use `/c2m-package-search` or `python3 packages/query_packages.py search "<term>"`.

**Library schema:**

| Key | Type | Notes |
|-----|------|-------|
| `digest` | str | One-line description. |
| `numinlets` | int | 0 = unknown; consult refpage. |
| `numoutlets` | int | 0 = unknown; consult refpage. |
| `outlettype` | list[str] | Per-outlet type. |
| `kind` | str | `external`, `abstraction`, `javascript`, or "". |
| `source` | str | `refpage` or `helpfile`. |
| `use_when` | str | The curated judgement — load-bearing field. |
| `deprecated_by` | str | Optional. Present when refpage flagged the object. |

**Converter fallback.** `spec2maxpat.py` consults `package_objects.json` as final I/O fallback — externals like `cv.jit.faces` work in a spec without overrides if curated. To extend coverage, see `packages/CURATION.md`.

## Converter Design Rule — Match Max's Defaults, Never Exceed Them

The converter should only add attributes that Max doesn't set by default. The goal is to match what you'd get from a fresh object instantiation in Max, plus whatever the spec explicitly requests. Injecting "helpful" extras — even well-intentioned ones — overrides Max's defaults and can lock controls, suppress normal behavior, or produce states the user never asked for.

For instance: `live.*` objects were getting `parameter_enable: 1` and `saved_attribute_attributes` unconditionally, but a freshly placed `live.gain~` in Max has neither. The injected attrs forced parameter automation state on load, locking the gain slider. The correct behavior: don't add them unless the spec asks for them.

**When adding any auto-generated attr to the converter, verify first by creating the object fresh in Max and inspecting its JSON — only inject what's absent but required for correct wiring, never what's absent because Max intentionally leaves it unset.**

## What You Must Handle

- **Object text, connections, layout** — write text exactly as you'd type it in Max. Get outlet/inlet indices right. Use explicit `pos`. See `SPEC_REFERENCE.md` and `patching/MAX_PATCHING.md` for all rules.
- **Presentation** — see `patching/MAX_PATCHING.md` for all layout, spacing, and design rules. Key invariants: every presented control needs a comment label; set `openinpresentation: 1`; exclude infrastructure objects; use screenshots (computer-use MCP) to verify.
- **Subpatcher, abstraction, and poly~ inlet/outlet labeling** — every `inlet` and `outlet` in a subpatcher/abstraction/poly~ must be labeled in two places: (1) **outside** — `attrs: {"comment": "in 0: bang — purpose | out 0: list — result"}` on the `p`/`poly~` object; (2) **inside** — `attrs: {"comment": "..."}` on each inlet/outlet spec entry AND an adjacent `comment` box. Never create an encapsulated unit without both levels.
- **Objects not in converter's tables** — supply `inlets`, `outlets`, `outlettype` in the spec.
- **Always embed the spec** — every .maxpat produced via Claude2Max must include a hidden `text.codebox` (`id: "obj-spec-embed"`, `"hidden": 1`) below all other objects, with the full spec JSON wrapped in `--- CLAUDE2MAX SPEC ---` / `--- END SPEC ---` delimiters. This applies whether the output is from the converter or assembled manually.

## Naming Convention

Use **ALL CAPS** for all user-defined names: `send TEMPO`, `receive PITCH`, `pv CURRENT_STATE`, `buffer~ LOOPBUF`, `var STEP_COUNT = 0;`. Applies to patcher names, send/receive names, pv/v variables, buffer~ names, coll names, JS variables. Does NOT apply to Max built-in names, object names, or message selectors.

## Tutorial System

To add an interactive step-by-step tutorial to a patch, invoke `/c2m-tutorial`. The skill handles the full two-pass workflow (sync → analyze → enhance descriptions → generate). Read `TUTORIAL_GUIDELINES.md` for the structural contract, panel/annotation attrs, comment-pile pattern, and breakage diagnostic before modifying any tutorial code.

## Plugin / Slash Commands

These skills ship with the repo in `.claude/skills/` — cloners get slash commands automatically:

| Command | Fires when | What it does |
|---------|-----------|--------------|
| `/c2m-sync` | Explicit sync request; "did my edits make it back?"; pasting in external .maxpat | Runs `sync -i <patch>` to capture manual edits before any convert |
| `/c2m-tutorial` | Add tutorial; "walk through this patch"; make self-teaching | Two-pass: sync → analyze → enhance descriptions → generate |
| `/c2m-package-search` | "Is there a package for X?"; before building 3+ native chain | Searches `package_objects.json`, recommends or falls back |
| `/c2m-design` | Design presentation UI; panel layout; themed UI; jsui canvas | Reads c2m-themes, designs layout, translates to spec coordinates |
| `/c2m-explain` | Explain a patch; "what does this do?" | Single-pass explanation without modifying the patch |
| `/c2m-inspect` | Debugging a running patch; need to see what's actually in a dict / buffer~ / jit.matrix | Sends OSC to `[c2m.inspect]` in the open patch; reads the dumped JSON from `/tmp/c2m_inspect_<tag>.json` |

## Always Inspect, Never Guess — Reach for `/c2m-inspect` During Patch Debugging

When debugging a running Max patch, any question whose answer hinges on the runtime contents of a named data structure (`dict`, `buffer~`, `jit.matrix`) gets answered by *dumping it*, not by reasoning from the upstream wiring. Wiring tells you what *should* happen; the dump tells you what *did* happen. Guessing from upstream logic is the failure mode this rule exists to prevent — the recognition signal is any sentence in your reasoning that begins "the dict probably contains…" or "the buffer should have…" or "the matrix is presumably…" — that's the moment to stop and run the dump instead.

The mechanics:

1. **If `[c2m.inspect]` is already in the patch**, run `python3 tools/c2m_inspect_send.py --timeout 1 ping` to confirm connectivity, then dump each suspect structure with distinct tags (`dump <tag> <kind> <name>`).
2. **If `[c2m.inspect]` is NOT in the patch**, add it autonomously via the normal sync → edit-spec → convert workflow before debugging. Mark it as a debug addition per the convention in **Clearly Mark Debug Additions** below. Ask the user to reload the patch in Max, then proceed.
3. **Read the resulting `/tmp/c2m_inspect_<tag>.json`** and interpret it against the expected state.

This is the *first* tool to reach for in Max-runtime debugging, not the last. Most "why isn't this working?" questions in patches built on `dict` / `buffer~` / `jit.matrix` are answered in one round-trip by the dump.

For coll/table (v1 gap), the same discipline applies but the workaround is different — see the v8 `messnamed` pitfall in `patching/MAX_PATCHING.md > Common Pitfalls`.

## Clearly Mark Debug Additions to a User's Patch — Binding Rule

Any object added to a user's patch for diagnostic purposes — `[c2m.inspect]`, extra `[print]` boxes, scope displays, value-watch comments, anything that is NOT part of the patch's intended functionality — must be visually unmistakable as debugging scaffolding. The user must be able to (a) see at a glance what Claude added vs. what's part of the patch, and (b) remove the scaffolding confidently when debugging is done, without second-guessing whether each box is "really part of the design."

The rule is symmetric with **Always Hide Plumbing Patchcords**: visibility matches intent. Plumbing hides because it doesn't communicate to the reader; debug additions stand out because they MUST communicate "this is temporary."

Conventions for every debug addition:

- **Distinct bgcolor** — magenta `[1.0, 0.3, 0.8, 1.0]` reserved repo-wide for debug additions, with matching `bordercolor`. Not used elsewhere in Claude2Max's style guide.
- **Adjacent comment label** — text `🔍 DEBUG (Claude) — remove when done`, same magenta bgcolor. One label per cluster, not per box.
- **Spatially grouped** — place the cluster in the bottom-right corner of the patching view (or another corner the working graph doesn't occupy), physically separated from the patch's main flow so the operator's eye can ignore it.
- **Tracked in the embedded spec** — add a top-level `debug_additions: ["<id1>", "<id2>", …]` array to the spec listing every debug object's ID. This lets a future cleanup pass find and remove all of them mechanically without parsing colors.
- **NOT in the presentation view** — debug additions are patching-view scaffolding only; never set `presentation: 1` on them. The operator's UI must not be polluted by them.

When debugging is complete and the user has confirmed the patch is working, propose a cleanup pass: remove every object listed in `debug_additions`, prune the array, sync/convert. Do this proactively — leaving scaffolding in a working patch is the same failure mode as a stale link on a landing page.

The recognition signal during patch authoring: if I'm about to add a box that exists only to help *me* understand the patch's state — and the operator wouldn't ever look at it — that box needs the magenta marking. If it's part of the patch's actual functionality, it doesn't.

## Debugging Data Structures Live — `c2m.inspect`

When a patch is running and the question is *"what's actually inside this data structure right now?"*, drop the `[c2m.inspect]` abstraction (`patching/abstractions/c2m.inspect.maxpat`) into it. The abstraction listens on UDP 7474 for OSC; `tools/c2m_inspect_send.py` (stdlib-only, no python-osc dependency) talks to it and reads the dump back. Wrapped end-to-end by the `/c2m-inspect` skill.

v1 supported kinds — those with a direct v8 wrapper class:

- `dict` — via `Dict.stringify()`
- `buffer~` — via `Buffer.peek()` (capped at `@samplecap`, default 4096 per channel)
- `jit.matrix` — via `JitterMatrix.getcell()` (capped at `@cellcap`, default 10000)

Not supported in v1: `coll`, `table`, `multislider`, `pattr`, `jit.cellblock`. These have no v8 wrapper and `messnamed` doesn't route to them. The graceful error response documents the workaround.

The OSC pathway is one-way: Max writes JSON to disk, the Python sender polls disk for the updated mtime. Reads, then prints. No UDP reply, so no return-path dependency.

## Admonition Tags

Headings in any `*.md` at the repo root tagged `{!pre-edit}` or `{!pre-commit}` are re-surfaced by `hooks/inject_admonitions.py` as `additionalContext` at the matching moment — `pre-edit` fires on Edit/Write tool calls; `pre-commit` fires when a Bash command contains `git commit`. To add a new at-action-point reminder: append the tag to any heading. No Python changes needed.

## Keeping Docs in Sync {!pre-commit}

Whenever you learn something new about Max behavior, fix a bug, or add/change a feature, **immediately** propagate that knowledge to all relevant files before committing:

- `SPEC_REFERENCE.md` — object behavior, .maxpat format details, layout rules; object-specific behavioral notes and pitfalls
- `patching/MAX_PATCHING.md` — patching principles, presentation guidelines, documentation rules, common pitfalls
- `TUTORIAL_GUIDELINES.md` — tutorial generation lessons and conventions
- `CLAUDE.md` — workflow, process rules, cross-cutting conventions
- `WORK_HISTORY.md` — session summary (create it if absent)

**Before every commit** (and before every push, when a remote is configured), check: did this session produce insights that belong in the reference docs? If so, update them in the same commit. Do not wait for the user to ask — this is automatic.

**Never use local Claude memory as a substitute for repo documentation.** This repo is specifically designed so that every Claude instance — across all users who clone it — has the same knowledge. Saving a Max behavioral insight or Claude2Max convention to `~/.claude/…/memory/` instead of the repo docs defeats that purpose entirely: it stays private to one machine, it won't travel with the repo, and future instances won't have it. If an insight is worth remembering, it belongs here.

## New User Setup

**At the start of every conversation**, after the long-gap check, determine the student's mode (forked-with-remote / cloned-no-fork / local-only) and act accordingly. **Claude runs every `git` and `gh` command itself** — the student is never asked to type them. If the student wants to learn what a command does, explain it after running it; never make them type it.

### Step 1 — Is the working directory a git checkout?

```bash
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "LOCAL_ONLY"
fi
```

If the output is `LOCAL_ONLY`, fall through to the **Local-only fallback** further down. Otherwise continue.

### Step 2 — Is this the maintainer?

```bash
USER_EMAIL=$(git config user.email)
echo "$USER_EMAIL"
```

If `USER_EMAIL` is `jannone@mac.com`, skip the rest of this section entirely.

### Step 3 — Install the global pointer to Claude2Max

This step runs for every non-maintainer mode (forked-with-remote, cloned-no-fork, and local-only). It is independent of GitHub setup. Do it before the GitHub steps below, because the pointer is what makes Claude2Max consultable from *other* projects on this machine — without it, a future Claude instance opening an unrelated Max patch elsewhere on the disk has no way to know Claude2Max exists, and will fall back to inventing object names, attributes, and presentation conventions from training-data memory. The repo exists precisely because that fallback is wrong; the pointer is what wires up the corrective.

Determine the absolute path of the current clone:

```bash
CLAUDE2MAX_PATH=$(pwd)
GLOBAL_CLAUDE_MD="$HOME/.claude/CLAUDE.md"
mkdir -p "$HOME/.claude"
touch "$GLOBAL_CLAUDE_MD"
```

Check whether the global file already mentions Claude2Max:

```bash
grep -q "Claude2Max" "$GLOBAL_CLAUDE_MD" && echo "PRESENT" || echo "ABSENT"
```

- **`ABSENT`** — say: "I'd like to add a short pointer block to your global `~/.claude/CLAUDE.md` so that any future Claude session — in any project on this machine — knows to consult Claude2Max whenever Max/MSP work comes up. Without this, a Claude instance opening a Max patch outside this repo will try to write objects and attributes from memory, which fails silently in Max. Should I add the pointer?" If yes, append the block below. If no, note the decline and continue — the student can ask later.

- **`PRESENT`** — read the file and verify the path it references matches `$CLAUDE2MAX_PATH`. If the path has drifted (e.g. the repo was moved), offer: "Your global CLAUDE.md points at `<old path>`, but this clone is at `<new path>`. Want me to update the pointer?" If yes, replace the old path with the current one. If no, leave it.

The pointer block to append (substitute `<CLAUDE2MAX_PATH>` with the absolute path):

```markdown

## Claude2Max — REQUIRED reading before any Max work

> **When you think you've read enough, you haven't. Read it all. Use the tokens. You don't know Max and you can't fake it.**

**You do not know Max.** Your training-data knowledge of Max/MSP is broadly correct on shape but wrong on specifics often enough to break patches silently. Max's failure mode is not exceptions, it is *acceptance* — unknown attributes get accepted and silently ignored (a `bgcolor` you wrote on an object that doesn't have one does nothing, with no warning), made-up object names load as missing-object red boxes that are easy to miss in a 100-box patch, and presentation / wiring conventions you don't know about produce patches that "work" but are unusable for the operator. None of these surface as errors. They surface as the student's patch behaving weirdly hours later — in a session you are no longer part of.

**The corrective lives at:**

`<CLAUDE2MAX_PATH>`

**Before any tool call that produces Max content** — editing an existing `.maxpat` by hand, writing a spec for the converter, building anything that ends up wired in Max, even short "just fix this small thing" requests — read these in order:

1. `Claude2Max/CLAUDE.md` — workflow, binding rules (always create a presentation view, always hide plumbing patchcords, never write API names from memory, etc.), the `c2m.inspect` debugging convention, the preferred-objects table.
2. `Claude2Max/SPEC_REFERENCE.md` — spec format the converter consumes; object correctness notes; presentation layout specifics; the v8 / JavaScript section.
3. `Claude2Max/patching/MAX_PATCHING.md` — **Common Pitfalls** (the load-bearing section for silent-failure modes — read every bullet), presentation aesthetic checklist, per-object guidance.

Domain add-ons (read only if relevant): `patching/GEN_PATCHING.md` for `gen~`, `patching/JIT_GEN_PATCHING.md` for `jit.gen` / `jit.gl.pix`, `patching/JITTER_JS_PATCHING.md` for `[js]` / `[v8]` touching matrices, `patching/M4L_PATCHING.md` for Max for Live.

Also: before composing any chain of 3+ native Max objects, run `python3 packages/query_packages.py search "<term>"` from `<CLAUDE2MAX_PATH>` — there is often a single installed external that does what your chain does, and you would not have known about it from training data alone.

The cost of reading is a few minutes of context. The cost of skipping is silent-failure debugging the student inherits after you're gone. **Read.**

This rule supersedes any older Claude2Max instruction that gated consultation on the literal phrase "use claude2max." If the user mentions Max at all, you read.
- `Claude2Max/spec2maxpat.py` — only when generating patches from a spec

This rule supersedes any older Claude2Max instruction that gated consultation on the literal phrase "use claude2max."
```

Confirm the result with the student in plain language: "Added a Claude2Max pointer to your global CLAUDE.md. From now on, any Claude session on this machine — in any project — will know to consult this repo when Max work comes up."

### Step 4 — Is `gh` available and authenticated?

```bash
which gh >/dev/null 2>&1 && gh auth status 2>&1 | head -3
```

Three outcomes:

- **`gh` is missing entirely** — say: "GitHub CLI (`gh`) isn't installed. I can install it via Homebrew if you'd like — that's the smoothest path to having your own fork of Claude2Max where your work lives. Want me to install it, or work locally for now?" If yes, run `brew install gh`. If no, fall through to the **Local-only fallback**.
- **`gh` is installed but not authenticated** (`gh auth status` shows "not logged in") — say: "I'd like to set you up with your own GitHub fork of Claude2Max so your session work is backed up and shareable. To do that, I need to log you into GitHub via `gh auth login`. I'll walk you through each prompt in plain language. Should I start, or would you rather work locally for now?" If yes, run `gh auth login` interactively (default settings: GitHub.com, HTTPS, login with a web browser — Claude explains each prompt as it appears). If no, fall through to the **Local-only fallback**.
- **`gh` is installed and authenticated** — continue to Step 4.

### Step 4 — Is the current clone already a fork of jjannone/Claude2Max?

```bash
gh repo view --json parent,nameWithOwner 2>/dev/null
```

If the JSON shows `"parent"` pointing at `jjannone/Claude2Max` (or the `nameWithOwner` already starts with `jjannone/`), the student is on their fork (or on the upstream itself). Continue to Step 5.

Otherwise, the clone is upstream and the student doesn't have a fork yet. Offer one:

> "I can create your own GitHub fork of Claude2Max — that way your patches, your insights, and your session history live in your account and survive any disk problem. I'll do it for you; you don't need to type any commands. Should I go ahead?"

If yes, run:

```bash
gh repo fork --remote=true --remote-name=origin --clone=false
git remote rename origin upstream 2>/dev/null || true   # if origin already existed
git remote add upstream https://github.com/jjannone/Claude2Max.git 2>/dev/null || true
# `gh repo fork --remote-name=origin` already points origin at the new fork
```

Then verify `git remote -v` shows: `origin` → student's fork, `upstream` → `jjannone/Claude2Max`.

If no, fall through to the **Local-only fallback**.

### Step 5 — Create the `insights/<name>` branch on the fork

```bash
USER_NAME=$(git config user.name | tr ' ' '_' | tr '[:upper:]' '[:lower:]')
BRANCH="insights/${USER_NAME}"
git rev-parse --verify "$BRANCH" >/dev/null 2>&1 || git checkout -b "$BRANCH"
git push --set-upstream origin "$BRANCH" 2>/dev/null
```

Create `insights.md` (template under **`insights.md` template** below).

Greet:

> "Welcome to Claude2Max. You're set up with your own fork — I've made a branch **`insights/<your-name>`** to track this session. As we work, I'll log useful discoveries to `insights.md` and push them to your fork. When something looks broadly useful to other students, I'll offer to open a pull request back to the upstream repo so it becomes part of the shared knowledge."

### Local-only fallback

Use this branch when the student declined the fork setup, `gh` is unavailable, or the working directory isn't a git checkout.

If a git checkout exists, create a local-only branch:

```bash
USER_NAME=$(git config user.name | tr ' ' '_' | tr '[:upper:]' '[:lower:]')
BRANCH="insights/${USER_NAME}"
git rev-parse --verify "$BRANCH" >/dev/null 2>&1 || git checkout -b "$BRANCH"
```

Create `insights.md` (template below) regardless of whether a git checkout exists. Greet:

> "Welcome to Claude2Max. You're working locally without a GitHub fork for now — fully supported. I'll log useful discoveries to `insights.md` in this folder as we work. If you change your mind later, just say the word and I'll set up the fork for you."

Re-offer the fork setup **once or twice on later sessions**, then stop. Do not re-offer every session — that's nagging, not helpful.

### `insights.md` template

```markdown
# Claude2Max Insights — <user name>

Discoveries, corrections, and workflow improvements gathered during use.
Entries broadly useful to other users are marked **[shareable]** — these are
candidates for an upstream pull request via the **Community Knowledge** pipeline.

## Log

```

From that point forward in the session:
- Append any confirmed new rule, correction, or non-obvious workflow insight to `insights.md` under the `## Log` section with today's date
- Mark entries `**[shareable]**` when they seem broadly useful (not just specific to this user's patch)
- At the end of the session, if there are any unshared `[shareable]` entries **and the student is in forked-with-remote mode**, say: "There are N shareable entries in `insights.md` — want me to open a pull request to contribute them upstream?" In local-only mode, skip the reminder — the notes stay on disk for the student's own reference, and Claude can offer to set up the fork at a future session if appropriate.

## State-File Location for External Projects

When a student is using Claude2Max as a tool against an external project folder (see **Local-Folder Use Is Fully Supported**), the per-project state files belong with the project, not with the toolkit:

- `WORK_HISTORY.md`, `TASK_QUEUE.md`, and `insights.md` should live in the external project folder so they travel with the student's work.
- The Claude2Max repo's own `WORK_HISTORY.md` is reserved for changes to the toolkit itself (converter, skills, docs).

At session start, if the student has told Claude that they are working on a project at a specific path, treat that path as the home for these files. If the student has not pointed at an external folder, default to this repo as today. Ask once when it's ambiguous and remember the answer for the rest of the session.

## Work History {!pre-commit}

**At the start of every conversation, and after any gap of more than one hour within a conversation:**
1. Read `WORK_HISTORY.md` to get up to date with recent changes.
2. Read `TASK_QUEUE.md` and report any pending tasks to the user before beginning other work. Say something like: "There are N pending tasks in the queue — [list them briefly]. Want to work on any of these, or something else?"

To detect a long gap within a conversation, run this on every incoming message:
```bash
LAST=/tmp/claude2max_session_check
NOW=$(date +%s)
if [ ! -f "$LAST" ] || [ $(( NOW - $(cat "$LAST") )) -gt 3600 ]; then
    echo "CHECK_NEEDED"
    echo $NOW > "$LAST"
else
    echo "OK"
fi
```
If the output is `CHECK_NEEDED`, run the session-start checks above. If `OK`, proceed normally. This resets on reboot, which is fine — a reboot implies a fresh start.

When a queued task is completed, mark it `- [x]` and move it to the Done section with a completion date.

**Task queue notation** — always use plain English markers, never checkbox symbols:
- `[pending]` — not yet started
- `[in progress]` — currently being worked on (include a brief note of where things stand)
- `[complete]` — finished (move to Done section)

When adding a task to the queue, always write a full expanded description — enough for any Claude instance to pick it up cold without this conversation's context. Include: what to build, where (file/function), why it's needed, implementation notes, prerequisites, and how it fits into the larger system. Also present the expanded description to the user in chat so they can confirm it captures the intent correctly before it's committed.

At the end of any session where meaningful work was done, append an entry to `WORK_HISTORY.md`. Do this automatically — no need for the user to ask. Format: `- YYYY-MM-DD: <1-2 sentence summary>`

**If `WORK_HISTORY.md` does not exist, create it** with a minimal header before appending:

```markdown
# Work History
```

**Do not rely solely on the stop hook.** Sessions that hit the context limit are cut off without firing the hook. Instead, update `WORK_HISTORY.md` proactively — after any significant milestone within a session, not only at the very end.
