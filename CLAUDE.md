# Claude2Max

> **When you think you've read enough, you haven't. Read it all. Use the tokens. You don't know Max and you can't fake it.**

## If You Are A Claude Instance Reading This From Another Repo — Why You're Here

You arrived because your global CLAUDE.md told you to consult this repo before doing Max work. Here is why that pointer exists and what reading it actually means.

**You do not know Max.** Your training-data knowledge of Max/MSP is broadly correct on shape but wrong on specifics often enough to break patches silently. Max's failure mode is not exceptions, it is *acceptance* — unknown attributes get accepted and silently ignored (a `bgcolor` you wrote on an object that doesn't have one does nothing, no warning), made-up object names load as missing-object red boxes that are easy to miss in a 100-box patch, and presentation / wiring conventions you don't know produce patches that "work" but are unusable for the operator. None of these surface as errors. They surface as the student's patch behaving weirdly hours later, in a session you're no longer part of.

**The minimum reading before any tool call that produces Max content is three files, in this order:**

1. The rest of this file — `Claude2Max/CLAUDE.md`. Workflow, binding rules (always create a presentation view, never hide patchcords or boxes, never write API names from memory), the `c2m.inspect` debugging convention, the preferred-objects table, the multi-user-template if mobile is involved.
2. `Claude2Max/SPEC_REFERENCE.md`. The spec format the converter consumes; object types and correctness notes; presentation layout specifics; jit.cellblock conventions; the v8 / JavaScript section.
3. `Claude2Max/patching/MAX_PATCHING.md`. Common Pitfalls (the load-bearing section for silent-failure modes — read every bullet), presentation aesthetic checklist, per-object guidance.

Reading these three files covers everything `load(["core"])` from the Claude2Max MCP server would send, because core is cut verbatim from them. So do one or the other, not both: after reading them, load only the other domains you need.

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
- Discoveries the student makes during a session can be contributed back to the main repo as a pull request.
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

**Examples are exemplars, not limits.** When writing a rule, name enough instances to make the principle recognizable and say so. When reading one, extrapolate from them; see *Examples in Rules Are Exemplars, Not Limits*.

## Examples in Rules Are Exemplars, Not Limits — Binding Rule {!core}

Every rule in this repo states a principle and then illustrates it, usually with "for instance." The illustration shows the shape of the principle at one point; it does not fence the principle in. A rule that names `live.dial` over `dial` covers `live.gain~` over `gain~` and every pair it did not name. A pitfall recorded for one object covers the next object with the same behavior. A layout rule shown on a three-column row covers a five-column row. Reading an example as the whole rule turns a general principle back into the single incident it was generalized from, which is the failure *Rules from Corrected Errors* exists to prevent.

So when a situation resembles a rule's example without matching it, the rule applies. When it matches none of the examples but fits the principle, the rule applies. The examples are there to make the principle recognizable, and to show what counts as an instance. Extrapolate from them. If a case seems to fit the principle but you are unsure, apply the rule and say which principle you applied, rather than treating the absence of a matching example as permission.

The recognition signal: the thought "the rule only mentions X, and this is Y." That is the moment to reread the rule's first sentence, which states the principle, and decide from that.

## Ask Before Taking Control of the Computer — Binding Rule

Never drive the user's screen, mouse, keyboard, or a running application (the computer-use tools, Max itself, a browser acting on the user's own sessions) without asking first and waiting for a yes, in that conversation, for that task. The user is at the machine and can check a running Max faster and more safely than an automated click can; a request to verify something in Max is a request for the user to look, unless they say otherwise. Loading the tool schemas is fine; calling `request_access` or any action tool is not. This is a per-task permission: a yes for one check does not carry over to the next. (John, 2026-09-09, after Claude reached for computer control to test a click in Max.)

## Verify External State — Never Assert from Memory {!core}

Before making any claim about the state of an external or shared system — GitHub repo visibility, remote branch status, CI results, whether a file exists on a remote, whether a service is available — verify it with the appropriate tool first. Memory, inference from local context, and reasonable assumptions are not sufficient. A wrong assertion is worse than a delayed one.

For example: don't say a repo is private because it looks like a personal project; run `gh repo view --json visibility` and check. Don't say a branch exists remotely without `git ls-remote`. Don't say a URL is unreachable without trying it.

This applies beyond GitHub to any external state that can change independently of the local working directory.

**This repo's own tooling counts as state to verify.** The converter, the verifier, the MCP server, and the hooks change independently of the prose that describes them — `CLAUDE.md`, `WORK_HISTORY.md`, `TASK_QUEUE.md`, and the design docs record intent at the time of writing, and code drifts from it. So before scoping work against any of them, or claiming what one of them does or doesn't cover, determine the current behavior by importing and running it. A `grep` for the function definitions or a call to the entry point is seconds of work and removes the inference entirely.

For instance: `WORK_HISTORY.md` accurately noted that the gate's "principle checks still warn-not-block." Read as prose, that supports the inference "those checks aren't built yet" — and a task was scoped around writing them. `grep "^def rule_" mcp_server/claude2max_verify/rules.py` shows 16 rule functions, 8 of them exactly those checks, already implemented and running at `WARNING`. The prose was correct; the inference from it was not. Running the code makes the inference unnecessary.

Know which tier a claim falls in, because the verification differs and only the first is a plain execution:

| Claim about… | How to verify |
|---|---|
| Repo Python tooling — converter, verifier, MCP server, hooks | Import and run it; read the output |
| Max static facts — object names, attributes, messages | `lookup_object` / `list_attributes` / refpages / `package_objects.json` / the observed-attrs corpus |
| Max runtime behavior — what a patch does when it executes | `c2m.inspect` against a running patch, which requires the user driving Max |

Max itself cannot be executed from here — that limitation is why the second and third rows exist as separate lookup paths rather than collapsing into "just run it."

## Never Write API Names From Memory {!core}

Never write a method name, property name, attribute name, function name, CSS property, shell flag, environment variable, or any other API identifier from memory. If the name didn't come from a documentation page, header file, refpage, autocomplete, or other authoritative source within the last few seconds, it is a guess — and a guess is forbidden. This applies across every language and every environment, not just Max.

The reason this rule needs to be explicit: environments differ only in *how loudly they catch a guess*. Typed languages throw at compile time; untyped languages throw at runtime; Max attributes, CSS properties, and similar APIs **fail silently** — the wrong name is accepted and quietly ignored, doing nothing. **Silent failure is more dangerous than loud failure, not less**, because there is no error message to surface the mistake. The discipline must therefore be the same across all environments: do not write the name unless you have just confirmed it exists.

The recognition signal: **if I find myself reaching for an attribute or method name because it "sounds right" for this kind of object, that is the exact moment verification is non-optional.** Family resemblance ("it's a UI control, surely it has `bgcolor`") is not evidence that the name exists on this specific object. Each object's vocabulary is its own.

For instance: writing `bgcolor`, `peakcolor`, `knobcolor`, or `needlecolor` on `live.gain~` because those names exist on other UI objects is the same kind of mistake as writing `arr.contains()` in JavaScript because it sounds right (the actual method is `arr.includes()`). JS throws `TypeError`. Max silently accepts the unknown attribute and ignores it — the mistake survives a code review I would never let it survive in JS. The valid `live.gain~` color attrs are `coldcolor`, `warmcolor`, `hotcolor`, `overloadcolor`, `slidercolor`, `textcolor`, `tricolor`, `trioncolor`, `tribordercolor`, `focusbordercolor`, `modulationcolor`, `inactivecoldcolor`, `inactivewarmcolor` — confirmed by reading `/Applications/Max.app/Contents/Resources/C74/docs/refpages/m4l-ref/live.gain~.maxref.xml`.

The verification mechanics for Max specifically — the refpage paths, the `grep` patterns, the `RefpageCache.lookup()` API — live in `patching/MAX_PATCHING.md`. This rule states *why*; that file states *how*.

**Verification is per-attribute, not per-object.** If I am writing N attributes for an object, I must verify N names against the refpage. Batching N attrs into one edit without per-name verification is the failure mode this rule is designed to prevent.

**The rule applies independent of the workflow — including direct `.maxpat` edits.** The converter's lookup against `packages/package_objects.json` catches an unknown object name when a spec is converted. Hand-editing `.maxpat` JSON, modifying an existing patch with the Edit tool, or generating boxes via Python — those paths are now *also* covered by a PostToolUse content gate (`hooks/claude2max_maxpat_content_gate.py` → `spec2maxpat.gate_maxpat_file`) that runs the SAME anti-guessing rules over the written patch and feeds any invented object/attribute/message names back as a system reminder. But that gate is **post-hoc and non-blocking** (the edit already happened) — a safety net, not a license to guess. The verification discipline is the same in all paths. The recognition signal is identical to the attribute case: **if I'm typing an object's class name (the `text` field of a `newobj`) because it "sounds like the obvious name" for what I want to do, that is the moment verification is non-optional, regardless of which tool is producing the file.**

For instance: writing `[oscparse]` between `[udpreceive]` and `[route /user]` because it's "the obvious complement to `udpreceive`" is the same kind of guess as `arr.contains()` in JS. Max 9 has no `oscparse`, and the path was a silent failure because the patch loaded with `[oscparse]` shown as a missing-object red box that's easy to overlook in a 100-box patch. Confirmed by `ls /Applications/Max.app/Contents/Resources/C74/docs/refpages/max-ref/ | grep -i osc` returning only `osc.codebox`, `osc.packet`, `param.osc` — none of which route by address.

**Practical check before adding any `newobj` text to a patch, regardless of source:**

1. Check Max's own object registry — `interfaces/obj-qlookup.json` in the Max install (see the rule below). It is the list Max itself consults, it covers objects that ship no refpage, and it records each object's `alias`. `mcp__claude2max__lookup_object` reads it for you.
2. Search the refpage directory: `ls /Applications/Max.app/Contents/Resources/C74/docs/refpages/max-ref/ | grep -i <name-fragment>` — fast, and gives you the documentation, not just existence.
3. For package externals, search the curated list: `python3 packages/query_packages.py search "<name>"` from the Claude2Max repo.
4. If all three come up empty, the object doesn't exist as named. Either the wrong name, the wrong package assumption, or the wrong workflow (e.g. needs `[v8 …]` instead of a built-in).

This is one extra lookup per never-used object name — cheap insurance against the silent-failure mode the rest of this rule describes.

## Prefer the Tool's Own Registry Over Reconstructing One

When you need to know whether a name exists in an external system, look first for a **machine-readable registry that the system ships and consults itself** — before globbing its documentation, scraping its help files, or inferring from a corpus of its output. Documentation coverage is always incomplete, and inference blurs distinctions the registry already draws precisely. A derived list is a model of the truth; the registry *is* the truth, and it stays correct when the tool updates.

The recognition signal: if you are about to build a lookup table by scanning docs, harvesting examples, or hand-maintaining a list of exceptions, stop and search the install for a `.json` / `.db` / index file first. Hand-maintained tables in particular are a standing drift hazard — they are correct on the day they are written and quietly wrong afterwards.

For instance: Max object existence was being decided by refpage filename globbing plus two hand-maintained alias tables. That combination missed `/`, `&`, `|`, `>>`, `<<`, `!-`, `!/` and the whole `mc.*` operator family, so the convert gate **blocked patches using division** — while also missing real objects that ship no refpage at all (`jit.gl.layer`, the `jit.mo.*` family). The Max install already ships `Contents/Resources/C74/interfaces/obj-qlookup.json`: every instantiable object, each with an optional `alias` field (`v` → value, `i` → int, `t` → trigger), plus per-package `obj-qlookup.json` and `max.db.json` → `maxdb.aliases`. Consulting it cut false-positive object errors by 97% and attribute errors by 99.6% across 3,009 shipped C74 patches. It also draws a boundary no derived list would have: gen and RNBO operators (`history`, `swiz`, `clamp`) are absent from it *because they are not Max objects*, so the registry separates Max's vocabulary from adjacent languages for free — a distinction a corpus harvest would have erased.

A second, narrower instance of the same principle: a refpage's real object name lives in the XML root's `name` attribute (`div.maxref.xml` declares `name="/"`), because a filename cannot contain `/`. Reading that attribute harvests the operator alias map mechanically — 56 entries with zero collisions — instead of maintaining 23 by hand.

## The Closing Delimiter Is the Outermost One — Binding Rule

When content is wrapped between a start marker and an end marker, the real end marker is the **last** one, not the first. The wrapped content may legitimately contain the marker text itself — a quoted example, a box whose text repeats it, a document that discusses the format — and a parser that stops at the first match returns a truncated body that fails in a way that looks like corruption. The same trap exists for any quoting, fencing, or wrapping scheme: code fences inside a document about code fences, a string delimiter inside a string, a comment terminator inside a comment.

For instance: the Claude2Max spec is stored in a patch between `--- CLAUDE2MAX SPEC ---` and `--- END SPEC ---`. A stale stub box in `4step-sequencer.maxpat` carried those markers as its own text, sync copied that text into the spec, and `extract_spec` stopped at the inner end marker — half a spec, reported as invalid JSON. The fix was one call: `rfind` instead of `find`. Confirmed by John, 2026-09-10.

## Parsers Must Tolerate the Schema's Full Value Space, Not Just the Sample You Tested Against

When parsing third-party data (XML, JSON, configs, refpages), don't coerce a field's type based on the values you happened to see in your test sample. The first input you didn't test against is the one that breaks. Fields that look numeric in examples may legitimately carry string sentinels like `"variable"`, `"auto"`, `"none"`, or `"all"`. Either confirm the documented schema's full value space before coercing, or accept the textual form and only coerce at the point of use, with a fallback for non-numeric values.

For instance: a Max refpage attribute's `size` is usually an integer, but `"variable"` is also valid. `int(attr.get("size", 1))` crashes the parser the first time it meets such a refpage; a `try int → fall back to the original string` pattern preserves both numeric and sentinel cases without losing information.

A second instance, in this repo's own converter (2026-09-07): `guess_newobj_io` derived inlet counts with `int(args[0])`, which is right for `join 3` and raises `ValueError` on `join @triggers -1` — a **valid** object whose first token after the name is an attribute, not a count. Two fixes, both general rather than per-object: strip `@name value…` runs before counting anything positional (attributes are never positional, and may appear anywhere after the object name), and read counts through a helper that falls back to the object's documented default instead of raising. Eight object families shared the bug; only `join` had been exercised.

## A Silent Fallback Is Indistinguishable From a Genuine No-Match — Binding Rule

Any tool that degrades to a simpler path when its preferred path fails — an LLM call replaced by keyword matching, a semantic search replaced by substring scoring, a cache miss served from a slower source — must **say so in its output, with the cause.** An `except Exception: pass` that quietly takes the fallback produces a result that looks exactly like the preferred path finding nothing, and the reader debugs the wrong thing: they broaden the query, re-check the data, or conclude the answer does not exist, when the real problem was a missing key, a network error, or a bug upstream of the fallback.

The recognition signal: any `except` whose body is `pass`, or any branch that returns a "no results" shape without recording which path produced it. Capture the exception type (not the secret-bearing message) and put it in the result the caller sees. For instance: `assess()` in the MCP server reported `method: keyword-fallback` and a `_fallback` reason, so a missing API key was diagnosable in one call. `search_packages()` swallowed its exception, and a candidate-ordering bug hid for as long as it took someone to step through the semantic path by hand.

## Rank by Breadth of Match Before Applying a Candidate Cap — Binding Rule

When several search terms feed one substring scan and a cap bounds how many candidates go forward (to a reranker, a prompt, a display), order the candidates by **how many terms hit each record** before any other key. One short term can match hundreds of records by accident — "IR" matches every name or description containing "ir" — and if those ties break on something relevance-blind, such as name order, the cap fills with alphabetical noise and the genuine multi-term hits never reach the next stage. The stage after the cap then correctly reports nothing, and the failure looks like a no-match (see the rule above).

Keep any per-field score for labeling; add a hit count for ordering. For instance: `_substring_matches` in `mcp_server/server.py` now sorts by hits, then field score, then name, so "convolution reverb with a real impulse response" reaches the reranker with `hirt.convolutionreverb~` in the candidate set instead of `2threshattack~`, `@`, `anti-bis`.

## When You Add a Step to a Chain of Fallbacks, Check What It Steals — Binding Rule

A fallback chain tries one thing, then the next, then the next. Slip a new step into the middle and it grabs some of the inputs the old last step was already handling **correctly** — and those are exactly the ones you were not thinking about, because they were fine. You were looking at the cases the old default got wrong. Those are the only cases in your head while you write the new step, and they are not the only cases it will run on.

So after adding the step, go and look at what the old step used to answer, and confirm the new one did not take any of it. The recognition signal: inserting a lookup ahead of an existing default, and reasoning only about the inputs that default got wrong.

For instance: `resolve_box_size` in `spec2maxpat.py` gained a step that reads a UI class's default size from its own C74 help file, to fix UI objects converting at 40 × 22. It also captured `message` and `comment`, which have help files like any other class — so every comment and message box in every patch would have been given one fixed width regardless of its text, which is the one thing the text-width estimate underneath it had always got right. `TEXT_SIZED_CLASSES` restores them to the estimate. (2026-09-15.)

## A Test Spells Out Its Own Examples — Never Read Them From the Thing Being Tested — Binding Rule

A test that loops over the same list, table, or config it is checking passes when that thing is emptied, because there is nothing left to loop over. It goes green exactly when the breakage is worst, which is the opposite of what a test is for.

Write the examples into the test by hand, and assert separately that they are present in the thing under test. Then ask: if the list I am reading were empty, would this test still pass? If yes, it is testing nothing. The general form covers any test whose inputs, expected values, or iteration count come from the code under test rather than from the test author.

The cheap way to find these is to break the code on purpose and check that a test notices. A test nobody has ever seen fail is a test nobody has verified.

For instance: `test_text_bearing_classes_keep_the_text_estimate` in `tests/test_ui_default_size.py` looped over `spec2maxpat.TEXT_SIZED_CLASSES`. Deleting the guard the test existed to protect emptied that constant, so the loop ran zero times and the test passed. It now names `newobj`, `message` and `comment` literally and asserts each is in the constant. Found by mutation-testing every new test in the file rather than trusting a green run. (2026-09-15.)

## An Installer's "Already Exists" Is Not Success When the Step Carries New Configuration — Binding Rule

Setup steps that look idempotent — register a server, add a hook, merge a config block — must compare what already exists against what was requested. Skip only when they match; replace when they differ. Treating "already exists" as success means a re-run that carries new settings quietly leaves the old ones in place, and the user believes the change landed. For instance: `install_global.py --env ANTHROPIC_API_KEY=…` on a machine whose MCP server was already registered hit `claude mcp add`'s refusal to touch an existing entry, reported "already registered — skipping", and the key never reached the server. The fix removes and re-adds the registration when `--env` is passed.

A companion rule for building CLI invocations programmatically: **put positional arguments before any variadic option, and test the exact assembled command against the real tool**, not against the help text's example. `claude mcp add`'s `--env <env...>` is variadic, so a server name placed after it was consumed as an env pair and the command failed with "Invalid environment variable format: claude2max".

## Reference Instances Illustrate Principles — They Don't Constitute Them

When a rule, checklist, or repair procedure refers to "what correct looks like," enshrine the **structural contract** (the attributes, invariants, shape) — not a specific file as the source of truth. Specific files are illustrations introduced as "for instance," and they may be renamed, edited, or deleted without the rule needing to change. A rule pinned to a file becomes wrong the moment that file moves; a rule pinned to the contract stays correct as long as the contract holds.

This is a corollary of "always generalize before enshrining." It applies anywhere a working example is being used as a reference: tutorial structure, patch conventions, file layout, JS module shape, anything. Before writing "match the way `<file>` does it," ask: what are the actual properties this file has that make it correct? Write those. Then mention the file as one place to see them, not as the rule itself.

## Partial Answers Are Not Consent — Re-Ask the Unanswered Part

When asking the user a multi-part clarifying question (e.g. "should I do A like X or Y? and should B be P or Q?"), and the user replies addressing only some of the parts, the silence on the others is **not** authorization to proceed with my best guess. The right behavior is to act on what was answered, then re-ask the unanswered parts — or hold all action until the full picture is clarified.

Acting on my own interpretation of an un-answered branch produces work the user didn't authorize and that may need to be undone. The cost of one short follow-up question is much lower than the cost of restoring an unintended change.

## A Correction Is Not a Request to Redo the Work — Ask Before Rebuilding

When the user corrects something in work already delivered, such as a snippet, a patch, a spec, or a file, the correction is information: record it, and enshrine it when asked. It is not permission to regenerate what was delivered. Ask first ("Want me to rebuild the snippet with `b 2`?"), and rebuild only on a yes. A rebuild the user did not ask for costs time and attention, and it replaces something they may already have pasted, opened, or approved. Often the user is teaching a preference for next time, not asking for this output again.

For instance: John pointed out that `t b b` can always be `b 2` in an MCT snippet he had just approved. The snippet was rebuilt unasked, and he stopped the rebuild: "no need to rebuild, and ask before rebuilding in the future." (2026-09-15.) The recognition signal: the user's message states a fact or a preference and contains no request to change the delivered work. Answer the fact, and offer the rebuild as a question.

## Write Responses in Plain Language — Especially on Opus

Explanations here are read by students who are new to Max and often new to code. A response that is technically complete but hard to parse has not done its job. Density is not the same thing as substance. Aim for prose the reader understands on the first pass, without rereading a sentence to find its subject.

This applies to every model and is **most important on Opus**, whose default register runs long and clause-heavy — the failure mode that prompted this rule.

**Aim for the register of Sonnet: simpler words and fewer of them.** John, 2026-09-16: "Opus is good but a bit verbose and overcomplicated in its language." Length is part of the problem, not only sentence shape.

In practice:

- **Answer first, then stop.** Don't restate the question or narrate the steps taken to get the answer. When the answer is given, end the reply.
- **Match the length to the question.** A simple question gets a few sentences, with no headings or bullet lists. Structure is for results that need it.
- **Use everyday words.** Don't coin terms. Pick the plain word over the precise-sounding one.
- **Cut caveats that don't change what the reader would do.** Keep the ones that do, and say them plainly.
- **When in doubt, go shorter.** The reader can ask for more; they can't un-read a wall of text.
- **Lead with the plain fact, then the detail.** "Your work isn't on `main` yet" before the branch mechanics. Say the thing, then explain it.
- **One idea per sentence.** Most hard-to-parse writing is three clauses stacked with dashes and parentheticals. Split them.
- **Spell out jargon or drop it.** Prefer "the check was wrong about which objects are real" over "the resolver's specificity was degraded." Terms of art are fine once introduced in plain words — and in this repo, assume Max vocabulary itself needs introducing.
- **Say what it means for the reader.** A number or a finding usually needs a sentence saying why it matters or what to do next.
- **End decisions as a clear question with named options**, not a paragraph the reader has to mine for the actual choice.
- **Keep the structure light.** Tables and metrics are welcome for results; the sentences around them still have to be plain.

This governs the prose, not the rigor. Do not simplify the underlying work, drop caveats, or soften bad news to make a sentence shorter — say the complicated thing in clear words. Telling a student their patch is broken, plainly, is the helpful version.

The recognition signal: if a sentence needs a second read to find its subject, or stacks more than one dash-clause, rewrite it before sending. When in doubt, imagine restating it out loud to someone who just walked in.

**A short sentence is not automatically a plain one.** The signal above catches sprawl. Compression fails the same way: a brief sentence that packs several ideas together, coins a compound noun on the spot, or points at something by category instead of naming it ("the same hazard the repo has a rule about") leaves the reader to supply what you left out. **Second signal: if a sentence assumes the reader can fill in a name, a definition, or a step you didn't state, rewrite it.** Name the file, name the rule, spell out the shorthand — or cut the reference.

The principle underneath both signals is the same: the reader should not have to supply anything you didn't give them. Sprawl buries it; compression omits it.

## Describe Flow in the Target Environment's Own Directional Vocabulary — Binding Rule {!core}

When describing how parts of a system connect, use the spatial and directional words that system itself uses. Vocabulary borrowed from an adjacent domain reads as non-native — and is actively wrong when the borrowed word already means something *else* in the target, because the reader applies the local meaning and understands the opposite of what was meant.

**In Max, patches flow top→bottom and left→right.** Say one object sits **under** or **downstream of** another; say **connect A to B**; say **A feeds B** or **A drives B**.

**Do not say "behind" or "in front of" to describe signal or data order.** That phrasing comes from guitar-pedal signal chains, and in Max the word is already taken: "behind" describes **z-order** — the `background` attribute that renders a panel behind other objects (see the tutorial panel conventions, which depend on exactly that meaning). So "put `[playlist~]` behind `[cv.jit.faces]`" reads as a layering instruction, not a wiring one. Say "have `[cv.jit.faces]` drive `[playlist~]`" instead.

This governs every surface where the language reaches a reader — chat explanations, `comment` boxes in a patch, tutorial step descriptions, docs, and commit messages. Comment boxes and tutorial text matter most: those ship with the patch and outlive the conversation.

**"Inside" and "outside" name the two views of an encapsulated object, and the words are fixed.** *Inside* is what you see when viewing the contents of a `patcher` / `p`, `poly~`, `gen~`, `jit.gen`, `jit.gl.pix`, `rnbo~`, or any other box that holds a sub-graph: the `inlet` / `outlet` / `in` / `out` objects, the sub-graph's own boxes and cords. *Outside* is what you see looking at that box from the parent patch: its ports, its box text, its hover tooltips. A label can be written in one view and shown in the other, and the words follow where it *shows*: the `comment` attribute on an `inlet` object is written inside and displays outside, as the parent box's port tooltip; `setinletassist` in a `v8` writes that same outside tooltip from the script. Use the words this way in chat, in `comment` boxes, and in the docs, and do not let "inside" drift to mean "in the script" or "outside" to mean "in the spec."


The recognition signal: any time you reach for a positional word to describe a connection, check whether the environment has its own word for that relationship — and whether the one you picked already means something different there. The same trap recurs beyond Max with different words in each environment (z-order vs. render order vs. execution order), so apply the check, not just this instance's answer.

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

## Never Use `convert` Unless It Is Specifically Needed — Binding Rule {!core}

Changes to a patch are edits and updates made by the user. They must be reflected in the spec, not removed. `convert` rebuilds the whole `.maxpat` from the spec, and the spec cannot describe everything Max saves: a plug-in loaded into a `vst~` box, `parameter_enable` flags, a panel's gradient settings, and whatever else Max writes on save. Convert drops all of it without a warning. The patch opens, the plug-in is gone, and nobody finds out until later.

So the default for any change to an existing patch is: **edit the boxes in the `.maxpat` directly, then run `sync`** so the spec follows the patch. The patch is the source of truth; the spec is a description of it. `convert` is for building a new patch from a spec, or for a rebuild the user has specifically asked for. Before running it on any patch that has ever been saved from Max, say what it will lose and get the go-ahead.

For instance: adding `@embed 1` to one `v8` box in `kslider-restrike` by sync → convert threw away the loaded Podolski plug-in. Editing that box in the file and syncing kept it, and the spec still matched the boxes afterwards.

John's wording, 2026-09-09: "never use convert unless it's specifically needed — in general, changes to a patch are edits/updates made by the user, and they should be reflected in the spec, not removed."

**If anything has changed that the spec cannot include, update the spec design.** A patch carrying state the spec has no field for is a gap in the spec format, not a reason to accept the loss. Add the field, teach `sync` to fill it from the file and `convert` to write it back, and add a test that round-trips it. The two pass-through fields that exist for this reason are `patcher_extras` at the root (Snapshots, the parameter registry) and `box_extras` on each object (a plug-in snapshot on `vst~`, `parameter_enable`, panel gradient keys, anything else Max writes on a box); `sync` also mirrors the saved `inlets` / `outlets` / `outlettype` into the spec's own fields. Both were added the day the loss was found. The recognition signal: any key in a `.maxpat` that a sync → convert round trip does not reproduce. The check is a few lines — diff the boxes of the file against the boxes of a convert of its synced spec — and it belongs in the repo's tests, not in memory.

## Inside a Subpatcher Is Still Max — Binding Rule {!core}

There is no difference between Max inside a patcher and Max outside it. A `p` box, a tab, a `poly~` voice, an abstraction: each holds ordinary boxes and cords, and every rule, tool, and check that applies to a patch applies at every depth of nesting, without exception. Sync captures an edit made inside a subpatcher exactly as it captures one at the root. The staleness check reports a nested difference. The verifier walks every nested scope. Script reconciliation finds a `v8` three levels down. Labeling, layout, presentation, display-in-the-path, attribute visibility: all of it binds inside as it binds outside, because the reader who opens the subpatcher is looking at Max.

The failure this rule names is code or reasoning that handles the root and stops. It is easy to write, because the root is where a function starts, and it fails silently, because nothing inside a subpatcher complains about being ignored. For instance: until 2026-09-13 `sync` reconciled only the root's boxes, so an `attrui` John added inside a tab of the MIDI examples patch was reported by the staleness check and then quietly dropped by the next convert. The verifier, the staleness check, and the script reconciler already recursed; sync was the one that did not, and nothing about the root-level result said so.

So when a capability is added to the toolkit, it is not done until it reaches nested patchers, and its test includes a nested case. When reading a patch, read inside the boxes. The recognition signal: a loop over `patcher["boxes"]` with no recursion into `box["patcher"]`, or a description of a patch that never mentions what its subpatchers contain.

## Modify, Don't Rebuild — and Treat Observed-Good Patterns as Binding {!core}

When the task is a new version of an existing patch, the default workflow is `edit the .maxpat → sync`: change only the boxes that are changing, then let sync carry the change into the spec (see *Never Use `convert` Unless It Is Specifically Needed*). When a rebuild is specifically needed, it is `extract → edit → convert`: pull the embedded spec, modify only what is changing, write back. Rebuilding the spec from scratch is the wrong default — it silently drops every working detail of the original that does not make it into the new build. Alignment offsets, init defaults, wiring patterns, sub-systems, naming conventions, and dozens of micro-decisions that took prior sessions to get right vanish without warning. Only build from scratch when the new version shares less than half its structure with the original.

**The companion rule: observed-good patterns are binding.** Any pattern noticed as "what's working" in analysis or critique creates an obligation to preserve that pattern in any subsequent implementation. Praising-without-applying is worse than not noticing at all — it proves the information was available and ignored. Marking something as good is an implicit commitment to keep it.

For instance: writing in design critique that "the comment-padding compensation gives clean visual alignment of labels with controls" creates a binding constraint on any redesign that follows. The compensation must survive into the new version. The robust fix is not "remember to re-apply it" — that is the failure mode this rule names. The robust fix is to start from the existing spec so the pattern survives by default, and only deviate where the change is intentional.

**Two practical consequences:**

1. **Default to spec extraction, not spec construction.** The phrase "build a new spec" should trigger the question "why not extract and edit?" before any code is written. Construction is reserved for genuinely new patches.

2. **Critique creates checkpoints.** Anything noted as good during analysis is a checkpoint that must be revisited before declaring the implementation done. Did the new build preserve every observed-good pattern from the original? If no, either restore it or document why it was deliberately dropped.

## When Building a New Version from an Existing Patch {!core}

- **Retain all default values.** Any `loadbang → init` chain, `loadmess`, or hardcoded default in the JS must survive unchanged into the new version. Defaults represent deliberate configuration — they are not incidental and must not be silently dropped.

- **Preserve wiring integrity when modifying patches programmatically.** Patchlines reference boxes by `id`, so renaming a box that has connections silently breaks all wiring to and from it. Keep original IDs intact; only assign new IDs to newly added boxes.

## Always Create a Presentation View — Binding Rule {!core}

Every patch that has a user interface gets a presentation view. "Has a user interface" means: it contains any object an operator will interact with at runtime — toggle, number, slider, dial, button, textedit, attrui, comment label, `jit.pwindow`, `jit.cellblock`, `live.*`, etc. The presentation is the patch's actual interface; the patching view is for editing the graph. Shipping a patch without a presentation forces the operator to navigate the editor view — friction even when the graph is well-organized.

The mechanics:

- Set `openinpresentation: 1` at the patcher root so the patch opens in presentation by default.
- Set `presentation: 1` on every UI object the operator should see.
- Set `presentation_rect: [x, y, w, h]` on each such object so it has an explicit position in the presentation layout. Presentation positions are independent of patching positions — optimize each view for its own purpose.
- Include comment labels for every visible control. A control worth showing is worth labelling.
- Omit internal logic objects from the presentation (`route`, `prepend`, `sprintf`, message boxes used as routers, `print`, etc.). They live only in the patching view — visible there, absent here. Omitting them from the presentation is the whole mechanism; never also mark them `hidden` (see *Never Hide Patchcords or Boxes*).

The threshold is "any UI," not "lots of UI." A patch with four UI elements (a START button, a status comment, a port number box, a `jit.cellblock` monitor) still gets a presentation — those four are the operator's interface and the rest is editing scaffolding. See `SPEC_REFERENCE.md > Presentation View` for layout specifics, and `patching/MAX_PATCHING.md > Presentation Aesthetic` for the visual checklist (panel grouping, monospace labels, color semantics, action prominence hierarchy).

Exempt cases: utility subpatchers embedded inside a parent's presentation (the parent supplies the UI), and pure-DSP / pure-utility patches with no operator at all (codebox modules called from elsewhere).

## Never Hide Patchcords or Boxes — Binding Rule {!core}

Do not set `"hidden": 1` on any patchcord or on any box. **The presentation view already decides what the operator sees** — a box without `presentation: 1` does not appear there, and patchcords never appear there at all. `hidden` is a second mechanism chasing the same goal, and it acts only on the *patching* view, which belongs to whoever is editing or learning the patch. Hiding things there takes information away from the only readers who have it, in exchange for a tidiness nobody ever sees.

This reverses two earlier binding rules — *Always Hide Plumbing Patchcords* and *Always Hide Redundant Message Boxes* — retired 2026-09-07 at John's direction. What retired them: the tidiness they bought was already free from the presentation view, while the cost fell entirely on the student trying to follow the patching view, where boxes wired to nothing and cords vanishing into empty space are the normal result.

**In practice:**

- Never emit a `{"hidden": 1}` attrs dict on a connection. Every cord in a spec is visible.
- Never set `"hidden": 1` on a box. Every box in a spec is visible in the patching view.
- Keep plumbing (`prepend`, `sprintf`, formatter message boxes, `route`, `select`) off the operator's screen by **not giving it `presentation: 1`**. That is the entire mechanism, and it needs no second half.
- If a region of the patching view looks like a mess once its cords are visible, **the layout is the problem** — space the objects out, stagger the fan-outs, and honor the right-to-left ordering rule in `patching/MAX_PATCHING.md`. Do not reach for `hidden` to tidy up a tangle.

**Two things stay exempt**, and they share a property: neither is an authoring choice about tidiness, which is the only thing the rule forbids.

1. **The embedded spec codebox** (`id: "obj-spec-embed"`) keeps `"hidden": 1`. It is not part of the patch's graph at all — storage in the shape of a box, with no inlets, no outlets, and nothing to read.
2. **Boxes whose visibility is runtime state owned by code.** The tutorial system's highlight panels and bubble annotations start hidden and are unhidden one step at a time by the generated v8 controller through `patcher.getnamed()` (contract: a `tut-panel-N` / `tut-ann-N` varname, see `TUTORIAL_GUIDELINES.md`). There `hidden` is a state machine's initial value, not a decision about what a reader gets to see.

The test that separates them from a violation: **who changes it?** If the answer is "nobody, it was authored that way to keep the view tidy," it is a violation. If the answer is "code, while the patch runs," it is state.

The judgment the retired rules encoded is still right: plumbing should not clutter the operator's screen. Only the mechanism changed — omission from the presentation view, not invisibility in the patching view.

The general principle, which outlives this instance: **when an environment already gives you one mechanism that decides what a reader sees, do not run a second one alongside it.** Two mechanisms with overlapping scope have to be held in agreement by hand, and the one that operates invisibly is the one that quietly drifts wrong.

## Prefer an Object's Own Attribute Over an Adapter Chain — Binding Rule {!core}

Before wiring an object into another object that reshapes its output — a `scale`, an `expr`, an offset `+`, a `clip` — check whether the source object has an attribute or inlet that produces the value you want directly. A chain built to correct a source you could have configured is more objects to place, a second place the numbers can go stale, and one more index to get wrong.

The recognition signal: **any time the object immediately downstream exists only to move the upstream object's output into the range you actually wanted**, stop and read the upstream object's refpage attribute list first.

For instance: `random 1000 → scale 0 999 4000 8000` was two objects doing what `random @range 4000 8000` does in one — the refpage states the range "can be any two numerical values, including negative values," so `random` emits the final range itself and the `scale` was pure adapter. Set such a range live by sending a `range <lo> <hi>` message to the left inlet; the refpage marks the attribute `set="1"`, and `range $1 $2` message boxes appear in C74's own patches.

**Watch the bound, though — `random`'s high value is exclusive.** C74's `random.maxhelp` states it outright: "for an int range it is one less than the high value," and labels its own `random @range 25 50` demo "output will be between 25 and 49." For a float range the output comes arbitrarily close to the high value without reaching it. So a range meant to *include* its top needs the high value plus one: picking one of N clips numbered from 1 is `random @range 1 <N+1>`, with the `+ 1` written once where N is computed, not in each consumer. This is the kind of detail that makes the adapter chain look safer than it is — the chain was wrong too, just wrong in a way nobody had checked. Replacing a chain with an attribute means re-verifying the endpoints, not assuming they carry over.

This is the small-scale sibling of *Consult Installed Packages Before Long Native Chains* — that rule asks whether one external replaces your chain, this one asks whether one attribute does. Both are checked against a source of truth, never from memory (see *Never Write API Names From Memory*).

## Prefer the Object That States Its Behavior in an Attribute — Binding Rule {!core}

Where Max offers two objects for the same job and one carries its behavior in an **attribute** while the other encodes it in its **name or inlet layout**, use the one with the attribute. An attribute is readable in the box, greppable in the file, changeable at runtime, and checkable by the verifier against the refpage. Behavior encoded in a name is none of those — it is lore the reader has to already know, and a one-character difference that changes semantics silently.

**In practice, for list packing and unpacking: use `join` and `unjoin`, not `pack` / `pak` / `unpack`.**

- **`join @triggers -1` replaces `pak`.** The refpage: setting `triggers` to `-1` "will cause the object to trigger output for any inlet (all inlets will be 'hot')" — which is exactly what `pak` means, except stated instead of spelled. C74's own `join.maxhelp` ships `join 3 @triggers -1`. The attribute also does what the name cannot: `@triggers 1 3` makes *some* inlets hot, a case `pack`/`pak` cannot express at all.
- **`join` replaces `pack`** (no `triggers` — left inlet hot, the default).
- **Reach for `@triggers -1` only when the inlets are fed independently.** If one upstream multi-outlet object feeds every inlet, Max's right-to-left output already loads the cold inlets before the hot one fires, and a plain `join` is correct — `[unjoin 3]` into `[join]` needs no attribute. Use it when the sources are genuinely separate (two `r` objects, two controls the operator touches at unrelated times). Right-to-left output is a Max language rule, not a promise each object makes: `trigger`'s refpage states it ("Outputs any input received in order from right to left"), while `unjoin`'s and `unpack`'s own refpages do not restate it.
- **`unjoin` replaces `unpack`.** Both take untyped items, so neither needs the per-slot type declarations `unpack 0 0 0` carries.

**Two details to get right when substituting** (verified against the refpages, and the reason this is a substitution rather than a rename):

1. **`unjoin`'s creation arg is not the outlet count.** The refpage's `outlets` argument "specifies the number of outlets (in addition to the rightmost outlet, which is always present)" — so `unjoin 3` has **four** outlets: three groups plus a remainder. `@outsize` (default 1) sets how many items go to each. The converter derives the n+1 count itself, so a spec that declares three outlets for `unjoin 3` is wrong.
2. **`join`'s creation arg is the inlet count, so it cannot carry initial values the way `pak 4000 8001` does.** `join` starts its slots at `int 0`. If a stored default mattered, it now has to live somewhere else — a `loadmess`, or the downstream object's own creation args.

The general form of this rule, beyond lists: any time you are choosing between two objects that do the same thing, prefer the one whose behavior you can *read off the box*. Related but distinct from *Prefer an Object's Own Attribute Over an Adapter Chain* — that rule is about not adding an object, this one is about which object to add.

## Prefer the Most Modern Member of an Object Family — Binding Rule {!core}

When Max offers several objects for the same job, default to the newest and most capable one, not the one that appears first in the training data or the tutorials. The older objects still work, and that is exactly why they linger: they come to mind first, they are shorter to type, and nothing warns that a better one exists. The newer member carries what was learned since: a parameter block, styling, a value range that is set and read in the Inspector, a richer set of messages. Reach for the older member only when a specific limitation of the newer one is in the way, and say what it is.

For instance, the pairs John named on 2026-09-12, newer first: `live.gain~` over `gain~`, `live.dial` over `dial`, `multislider` over `slider`. These are exemplars, not a list to match against. Any family with an older and a newer member falls under the rule, whether or not it appears here; extend the same judgment to every such pair you meet. The *Preferred Objects for Common Tasks* table records the same preference per task. The recognition signal: the object I am about to type has a `live.` twin or a multi-valued twin, and I have not checked which one the current Max ships as the intended choice. This is the sibling of *Prefer the Object That States Its Behavior in an Attribute*: that rule picks the object whose behavior can be read off the box; this one picks the object that carries the most behavior in the first place.

## Use the Dedicated Object by Its Short Name When a General One Would Only Imitate It — Binding Rule {!core}

When a general-purpose object is set up to do nothing but the one job a dedicated object exists for, use the dedicated object, and write its short alias. The dedicated box says what it does in fewer characters, and it cannot be edited halfway into something else by a later change to one of its arguments.

For instance: a `trigger` whose every argument is `b` is `bangbang`. So `t b b` is `b 2`, `t b b b` is `b 3`, and so on for any count. (John, 2026-09-15.) Verified: `obj-qlookup.json` registers `b` as the alias of `bangbang`, and the refpage says it sends a bang out of every outlet, right to left, when any message arrives, with an argument of 1 to 40 outlets. So the firing order is the same as the `trigger` it replaces. Keep `t` whenever the outlets send different things (`t b i`, `t l b`), because that is the job `trigger` exists for.

Do not take Cycling '74's own patches as the guide here: the shipped help files use `t b b` about fifteen times as often as `b 2`. How common a form is says nothing about whether it is the clearer one. The recognition signal: every argument of the box repeats one letter. Check whether a dedicated object does exactly that, and confirm its name and alias in `obj-qlookup.json` before writing it (see *Never Write API Names From Memory*).

## Several Views in One Window: Patcher Tabs, Not bpatchers — Binding Rule {!core}

When one window has to hold several self-contained views, so that the operator switches between whole pages of controls or whole example patches, use Max's own patcher tabs. A `p` box whose inner patcher carries `showontab: 1` appears as a tab in the parent window, titled with the box's name, and the parent's `showrootpatcherontab` decides whether the parent itself gets a tab. This is how every Cycling '74 help file is built, and `thispatcher setactivetab <name>` switches tabs from a message. In a spec it is one line per page, `"patcher_extras": {"showontab": 1}` on the sub-spec (see `SPEC_REFERENCE.md` > `patcher_extras`).

Do not build the same thing out of `bpatcher` boxes stacked on one presentation rect, hidden and shown by a script, or scrolled with `offset`. That construction needs a controller object, a varname per page, code that owns visibility state, and a layout in which ten pages occupy one rectangle, and each of those is a thing to read, keep in agreement, and debug. Patcher tabs need none of it: each page is an ordinary subpatcher with its own patching and presentation view, the tab bar is the whole switching mechanism, and nothing is hidden. For instance, the ten MIDI teaching examples for John's Brooklyn College course (2026-09-12) are ten `p "1 Key sends"` … `p "10 CC mapping"` boxes and nothing else; the first design, ten embedded bpatchers with a `v8` hiding nine of them, was discarded at John's direction.

**This does not retire the `tab` / `live.tab` object.** Those are selectors inside one view: they choose which of several things one shared set of controls acts on, and drive routing, `selector~`, a highlight, a `umenu` of presets. The reverb-shootout's `live.tab` picks which of sixteen reverbs the master dry/wet listens to, and that is exactly a selector's job, not a page switch. The test is what changes when the operator clicks: if the answer is "which patch fills the window," use patcher tabs; if it is "which item the same controls address," use the object.

## If You Mention an Attribute, Show It — Binding Rule {!core}

When a comment, label, header, tutorial step, or document sentence names an attribute of an object, the patch must make that attribute visible at the object. For a plain object box the attribute belongs in the box text, as in `random @range 60 84`. For a UI object whose box shows no text, a `kslider`, a `live.dial`, a `multislider`, put an `attrui` for that attribute above the object, wired to its left inlet, the way Cycling '74's own `kslider.maxhelp` shows `mode`. An attribute set only in the Inspector is invisible: a reader told "mode 1 (polyphonic)" and shown nothing has to take it on faith or go looking, and the comment is describing something the patch does not display. The same premise as *Put the Display in the Path*: in Max the patch is its own documentation, so what the words claim, the boxes show.

If showing it is not worth a box, do not mention it. A comment that names an attribute the reader cannot see is worse than one that describes the behaviour in plain words.

For instance: John added an `attrui` for `mode` to the "Held keys" tab of the MIDI examples on 2026-09-13, whose header says "mode 1 (polyphonic)"; every `kslider` in the ten examples now carries one, and a readout comment that named `ignoreclick 1` was reworded to "display-only" rather than adding three more `attrui` boxes. The recognition signal: typing an attribute name into a comment for an object whose box does not already show it.

`attrui` mechanics, verified against the help corpus (1,827 cords, every one to inlet 0): the attrui connects to the object's **left** inlet, never another one; its `attr` attribute names the attribute; `text_width` sets the label column. It reads the current value back from the object, so it is a display as well as a control.

## Put the Display in the Path — Binding Rule {!core}

In Max a UI object is not a view of data that lives somewhere else. It is a stage in the dataflow: the message that reaches its inlet is what it draws, and what it draws is what it sends on. There is no model behind the patch for the picture to be a view of; the messages on the cords are the only state there is, and every object that shows something shows what passed through it. So a UI object that can display a value belongs **in series**, between the source and whatever consumes the value, never in parallel beside the source. In series, the picture cannot disagree with the data, because they are the same message. In parallel, the object shows only what it was given directly, and what it shows and what actually flows drift apart the first time the two sources differ.

The mistake this rule names is importing a model-and-view split from other environments, where a widget is a separate thing that has to be kept in sync with the real state. Max has no such split, and a patch built as if it did throws away visualization that Max gives for free.

For instance, on 2026-09-12 the MIDI teaching examples had `notein` and a `kslider` both wired into the same downstream inlets, as two alternative sources. The keyboard lit only the keys that were clicked; a note played on hardware went past it unseen, and the two could show different things at once. The correction is `notein` → `kslider` → downstream, pitch to the left inlet and velocity to the right: the keyboard now lights every note that arrives, from either source, and is the only thing feeding the rest of the patch. The same for `ctlin` → `live.dial` → downstream, and the same principle anywhere a `number`, `flonum`, `multislider`, `live.gain~`, `button`, or `slider` can sit on a cord instead of beside it.

More generally: do not make a structural choice that removes visualization Max already offers, or that lets two visible things about the same data disagree. The recognition signal: a UI object and a source both feeding the same inlet, or a UI object that only ever shows what the operator did to it. That is the moment to move it onto the cord.

## Don't Add an Object That Duplicates What an Object Already in the Patch Does — Binding Rule {!core}

Before adding any object, check whether an object already in the patch does that job on its own, through a creation argument, an attribute, a message it accepts, or its default behavior. An object added to do what a neighbor already does is one more box to read, one more cord to trace, and a second place the behavior is set, so the two can disagree later. The essential objects of a patch carry a great deal of built-in behavior, and a reader should learn that behavior from the object itself, not from a helper wired beside it.

For instance, three additions removed from the MIDI teaching examples on 2026-09-08 at John's direction: a `[loadmess 12]` feeding a number box whose only destination was `[+ 12]`, when the argument already sets the starting value; a `[loadmess 0]` into a toggle, when a toggle starts off and sends nothing until it is clicked; and a `[flush]` object under a `[kslider]`, when `kslider` accepts a `flush` message itself in polyphonic mode.

The recognition signal: the object I am about to add exists only to initialize, reset, convert, or clear something for one neighbor. That is the moment to read the neighbor's refpage for the argument, attribute, or message that does it directly. This is the third rule of a family. *Prefer an Object's Own Attribute Over an Adapter Chain* asks whether an attribute replaces a downstream object; *Prefer the Object That States Its Behavior in an Attribute* asks which of two objects to add; this rule asks whether to add one at all. It also bounds *Every control must initialize to a known state on patch load* in `patching/MAX_PATCHING.md`: an init object is owed only when the control's default state is not the intended one, or when a downstream object has no default of its own.

## Don't Use `[textedit]` for Set-Once Configuration — Binding Rule {!core}

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

## Never Render an Empty Container When Server-Driven State Hasn't Arrived — Binding Rule {!networking}

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

**Where this applies.** Anywhere server state shapes the UI: WebSocket-driven dashboards, REST-fetched lists, real-time roster panels, async-arriving config, anything that starts `null` / `undefined` / `[]` and gets populated later. Silence isn't neutral. Visible state that turns out to be incomplete is much less confusing than absence that turns out to mean "still loading."

**The recognition signal:** if I'm writing `(arr || []).map(...)` or `if (data) { ...render... }` and the falsy branch produces nothing — that's the moment a placeholder is required. The fix is not adding a "loading" spinner everywhere (spinners conflate loading with broken); it's naming the specific not-yet condition the user is in.

For instance: an empty role grid on the Join page initially looked indistinguishable for the user between (a) WebSocket still connecting, (b) connected to relay but no Max host registered, (c) Max host registered but no roles configured. Three different fixes; one rendering. Replaced with an explicit "Waiting:" banner that names which case is current.

## Never Regress Functionality When Changing Modality {!core}

**General rule**: when any working feature — display, control, behavior, format — is moved, replaced, or reimplemented in a different modality, it must arrive at least as capable as it left. A change of modality is not a reason to lose functionality.

This applies to: switching UI objects, reformatting data for a new display, replacing a message with a UI element, moving logic from patch to JS or vice versa, or any other substitution. If the user didn't ask for a feature to be removed, it must survive the transition.

**Specific case — display format**: when moving information from one display context to another (Max console → cellblock, message box → UI element, etc.), carry over all essential elements of the working format — indexing, orientation, field order, readable structure. Do not drop features just because the new modality doesn't force you to include them.

Before implementing any new display for existing data, inventory every piece of information in the current format and confirm all of it is present in the new one.

## Building Reusable Objects — Generalize, and Mirror the Vocabulary You Inherit {!core}

When writing a `v8`/`js`/`jsui` object — or any new object that is **not** highly specific patch logic — the goal is a **reusable, drop-in building block**, not a one-off. A custom object is most valuable when it behaves like the Max objects it resembles, so anyone (including a future Claude) can wire it from existing knowledge without reading its source. Bespoke message/attribute names invented per-patch produce objects nobody can reuse and that silently break when wired like the object they look like. The discipline:

1. **Generalize — build it for many situations, not the task in front of you.** Lift the specific patch's needs into parameters, attributes, and messages instead of hardcoding them. *Recognition signal:* if a value, range, count, or behavior is baked in because "that's what this patch needs," stop and expose it as an attribute/message with a sensible default.

2. **If it is based on an existing object, it must be backwards-compatible** — it behaves as expected with **all** the existing messages and attributes of that object, so it can stand in for the original, **in every mode the new object adds.** Everything new is additional: a base-object message never changes meaning because a new attribute is set, and a mode that needs a colliding name gets a new name for its version instead (see point 5). The only exceptions are the specific messages/attributes the rewrite is deliberately changing — and those changes should be intentional and noted, not incidental.

3. **If it inherits functionality from another object, reuse that object's message and attribute names** rather than inventing new ones — so the inherited behavior is driven exactly the way users already know. If reusing a name would create a conflict, **do not silently rename or resolve it — flag the conflict and let the user decide.**

4. **If it is truly hybridizing two objects, import the full vocabulary of the base object and as much of the second object's as possible.** Import **all** attributes/messages from the base object; import as many as possible from the second. Keep the combined behavior as easy and transparent as you can, and **flag any confusions or conflicts (overlapping names, incompatible semantics) for the user to decide** rather than guessing. *For instance:* `butter_keys` (`[v8ui]`, Butter_tools) hybridizes `kslider` (base) with `multislider` (second) — it imports the kslider attributes (`mode`, `offset`, `range`, …) and kslider messages (`int`/`float`, `set`, `chord`, `clear`, `flush`), adds the multislider-flavoured side (`setminmax`, `setval`, `fetch`, `list`, `clearvals`), and selects between the two faces with one new attribute (`@z_displaymode`); the multislider messages whose names kslider already owns (`bang`, `int`/`float`, `set`) are sent as `z_dump`, `z_setall`; multislider's `set <slider> <value>` needs no `z_` form because `select` already does it, so a bare number plays a note on either face, as on kslider. Where the two objects' conventions couldn't both be honored (e.g. right-inlet velocity passthrough), that was surfaced rather than silently dropped.

5. **New attributes go at the end of the list: start their names with `z_`.** `attrui` and the Inspector list attributes alphabetically, so an expanded object's additions would otherwise be shuffled in among the base object's, and a reader who knows the base object could not tell at a glance which entries are inherited and which are new. A `z_` prefix on every new attribute name (and, by the label rule below, on its label) puts the whole addition after the base object's own vocabulary, in one block, and keeps a new name from ever colliding with one the base object gains in a later Max. The same prefix resolves a message collision: when a message the second object contributes has the name of a message the base object already owns, the second object's version is `z_<name>`, and the base object's keeps the bare name in every mode. When the addition is an *option* on an attribute the base object already has, do not add a new attribute for it: extend the existing attribute and put the prefix on the new option instead, listed after the base object's own values so those keep their names and positions. For instance, butter_keys's `@mode` keeps Monophonic, Polyphonic and Touchscreen and adds `z_mono` (monophonic, but re-clicking the lit key sends the note-off); a separate `@z_mono` attribute would have been wrong. (John, 2026-09-14.) Legacy unprefixed names may stay accepted as messages, forwarded to the `z_` attribute, so patches saved before the rename keep working. *For instance:* butter_keys's `@z_displaymode`, `@z_lohikey`, `@z_dotsize`, `z_dump`, `z_setall`. (John, 2026-09-14.)

This pairs with **Never Regress Functionality When Changing Modality** (a reimplementation arrives at least as capable) and **Never Write API Names From Memory** (verify the inherited object's real messages/attributes against its refpage before mirroring them). Note for verification: a custom object has no C74 refpage, so the `verify_spec` gate can't check its attributes — shipping a `<name>.maxref.xml` (and a `<name>.maxhelp`) for any reusable object you create lets the gate and other tooling validate it like a built-in.

## Embed the Script in Every v8 Box — Binding Rule {!core}

A patch must carry everything it needs to run. When a box loads its code from a sibling file and the object offers a way to store that code inside the patch, use it — **even when the file is also saved on disk.** The file is the editing surface; the copy inside the patch is what survives transport. A patch that is mailed, copied to another machine, pasted from the clipboard, or committed without its sibling file otherwise opens with a dead box, and Max reports it only as a console line most operators never read.

In practice, for `v8` / `js`, the pattern has **two parts, and both are needed** (verified in Max 9 on 2026-09-10 with a twelve-box test John ran; the matrix is below):

1. **`@embed 1` in the box text** — `v8 mylogic.js @embed 1`, or `v8 highlight.js 15 @embed 1` when the script takes arguments. This is what makes Max *use* the stored copy when the `.js` is missing. A box without it reports "can't find file" and stays dead even when the stored copy is present.
2. **A `[loadmess embed 1]` object wired to the box's left inlet.** This is what makes Max *keep* the stored copy when it saves the patch while the `.js` is present. The creation attribute alone is overridden the moment the file loads: Max writes `embed 0` and drops the text. An `embed 1` message arriving after load sticks, and the Inspector's "Save Javascript with Patcher" tick does the same by hand.

Keep the `.js` next to the patch anyway — that is where the script is edited, and `autowatch` reloads it from there. What each part of the toolkit does with the pattern:

- **The converter** reads the file at convert time and stores the source in the box's `textfile.text` (the block Max itself writes on save, alongside `filename`, `flags`, `embed`, `autowatch`). It looks in the output patch's folder, then the spec's folder, plus `code/` and `javascript/` subfolders, and resolves `v8 name` to `name.js` the way Max does. If the file is not found and the spec holds no copy, convert prints a warning and the patch ships without the source.
- **Sync** reads the intent from the box text, so a Max save that dropped the stored copy is repaired on the next sync (rules below). The file on disk wins whenever it is found.
- **The verifier** warns `script-not-embedded` on a `v8` / `js` box that names a script without `@embed 1`, and `script-embed-not-kept` on one with no `loadmess embed 1` feeding it.

**What Max actually does, observed** (file present means a `.js` beside the patch whose text differs from the stored copy):

| box | file present | runs | Max save writes |
|---|---|---|---|
| `v8 a.js @embed 1` | no | stored copy | embed 1, text kept |
| `v8 a.js @embed 1` | yes | the file | embed 0, text dropped |
| `v8 a.js @embed 1 @autowatch 0` | yes | the file | embed 0, text dropped |
| `v8 a.js` + `loadmess embed 1` | yes | the file | embed 1, the file's text stored |
| `v8 a.js @embed 1` + `loadmess embed 1` | yes | the file | embed 1, the file's text stored |
| `v8 a.js` with embed 1 and text stored, no `@embed 1` | no | nothing: "can't find file" | — |
| `v8 a.js @embed 1` with text stored | no | stored copy | embed 1, text kept |

`flags` in the textfile block made no difference (0 and 1 both ran); C74's own embedded boxes carry 1. Whether the box text names the script with or without `.js` made no difference either.

**Two copies, one editing surface.** The `.js` on disk is where the script is edited; the copy in the patch is what travels. A script-only change is made in the file, never in the embedded copy, and is followed by `sync` on the patch. `sync` is the meeting point, and it applies John's four rules (2026-09-10) to every embedded script:

1. The two copies are identical: nothing to do.
2. They differ and the file exists: the file wins. Sync rewrites the embedded copy and says so.
3. The file is missing: sync writes it out from the embedded copy, restoring it, and says so.
4. They differ and the patch is newer than the file: sync stops, writes nothing, and reports both, because the newer copy may be an edit made in Max's script editor. Resolve with `sync --script-from-disk` or `sync --script-from-patch`.

`sync --check` reports script drift alongside spec drift. Which copy Max runs when both are present has not been verified here; keeping them identical through sync makes the question moot.

The recognition signal: any box whose text names a file. That is the moment to read the object's refpage for an embed attribute before deciding the file alone is enough. `v8ui` documents the same `embed` attribute; the on-disk shape for a UI box has not been observed yet, so verify one saved from Max before relying on it. Embedded patchers are the same principle with a different mechanism — the spec's `maxpat` field on a `bpatcher` (see `SPEC_REFERENCE.md > Embedding an existing patcher verbatim`).

## Attribute Labels Must Begin With the Attribute's Own Word — Binding Rule {!core}

The goal is a list a human can scan: `attrui` and the Inspector list an object's attributes **alphabetically by their human-readable `label`, not by the attribute name.** So when you give an attribute a `label` (the `label:` field in `declareattribute`, or any equivalent), the label **must begin with the same word the attribute name begins with.** Then someone who knows the attribute is `@z_displaymode` can find it by scanning the list for "Z_displaymode…"; if the label leads with some other word, the entry is effectively unfindable — the reader has to open and read every line. Lead with the attribute's own leading word, then add clarifying words or a parenthetical.

For instance: `@z_displaymode` → `"Z_displaymode (Notes / Sliders)"`, **not** `"Display Mode (keyboard or sliders)"`; `@offset` → `"Offset (low MIDI key)"`, **not** `"Low MIDI Key"`; `@range` → `"Range (number of keys)"`, **not** `"Number of Keys"`.

**Cycling '74's own objects routinely break this rule** — `kslider`'s `offset` is labeled "Octave offset", its `range` is "Number of keys to display" — so do not use C74 labels as the model here. This is one of the deliberate places our objects are *better* than the built-ins, not bug-compatible with them. The recognition signal: any time you write a `label:`, check that its first word matches the attribute name's first word before moving on — it is a per-attribute check, like verifying the API name itself.

## Match the Generated Control to the Attribute's Value Space — Binding Rule {!core}

When you declare an attribute on a custom object (`declareattribute`, or any equivalent), its **`style:`** is not optional polish — it is what makes the auto-generated control (`attrui`, the Inspector row, any bound UI) *match the kind of value the attribute holds*. Omit it and Max falls back to a bare number field for everything: a true/false attribute becomes a number box the operator must know to type `0`/`1` into, a one-of-N choice becomes a number with no hint of the options, and a color becomes four mystery floats. The control silently misrepresents the value space — the same failure class as a mislabeled attribute (the information needed to use it correctly is missing from the surface), and like that one it fails silently, never as an error.

Lead with the value space; pick the style that fits it:

- **Binary / on-off** (`min:0 max:1`) → `style:"onoff"` — renders a **checkbox**, the unambiguous on/off affordance. Any attribute that is conceptually "this state or that one" belongs here even when the two aren't literally "enabled/disabled" — label it so the checked state is clear (e.g. `@z_showvalues` → "Z_showvalues (slider values as lines on the keyboard face)").
- **One of a small finite set** → `style:"enum"` (symbol values) or `style:"enumindex"` (integer index, symbols shown in the menu) — renders a **dropdown** that surfaces the choices.
- **Color (rgba)** → `style:"rgba"` — renders a **swatch + picker**, and pairs with `paint:1` so the object repaints when the color changes.

For instance: butter_keys's face selector was first a plain `int 0/1`, so its `attrui` was a number box — the operator had to *know* `1` meant "slider face." Re-declared `style:"onoff"` it became a checkbox, and once the choice was named (`@z_displaymode`, `style:"enumindex"`, `enumvals:["Notes","Sliders"]`) a menu that reads itself; kslider's own `mode` and `inputmode` got the same treatment. The recognition signal mirrors the attribute-label check: every time you write a `declareattribute`, decide its `style:` from its value space before moving on — a per-attribute check, like the label and the API name.

## Group Bound Controls by Function, With Headers — Binding Rule {!core}

A column of `attrui` / `number` / `toggle` controls dumped in declaration order is a wall the operator must read end-to-end to find anything. Controls that act on the same facet of the object belong **together, in a labeled cluster** — the same "what does this touch?" grouping that governs object placement (see `patching/MAX_PATCHING.md` > spatial clustering), applied to the control surface. Give each cluster a short header comment naming the facet; within a cluster, order the controls the way the operator thinks about them, not the order you happened to declare the attributes.

This applies anywhere bound controls are laid out: help files, test/comparison benches, and presentation views. The grouping *is* documentation — it tells the operator which knobs are related without them having to flip each one to find out.

For instance: the `butter_keys` bench first packed all 32 `attrui`s in declaration order; regrouped into labeled bands — *kslider attrs · display · slider values · slider display · slider colors · dots* — the same controls became scannable, and "which attributes affect the slider face?" is answered by reading one header instead of testing every box. Pair this with the demo-visibility rule below: a grouped, labeled control surface where every control also produces visible change is a patch the operator can learn by clicking.

## Every Copy of a List Shows the Same Order and the Same Numbering — Binding Rule {!core}

A list of choices almost never lives in one place. The same set of options appears as `tab` items, as `umenu` entries, as section-header comments in the patching view, as labels in the presentation view, in a `coll` or `dict` that drives the routing, in a JS array, and in the `README` or tutorial text that describes them. The operator switches between those copies constantly: read the label, click the tab, count down the `selector~` inlets. Every copy must present the items **in the same order**, and if the list is numbered, **the number must appear on every copy** — the tab item, the menu entry, the header comment, the presentation label, the doc — not just on some of them. A numbered list where one copy carries the numbers and another does not is two different lists to the person reading them: "9 · Gigaverb" in the header and plain "Gigaverb" in the tab forces the operator to count tab items by hand to find out that the ninth one is the one the header means, and one miscount routes the wrong reverb.

The numbering is a shared index, so it is owned by the whole set of copies, not by whichever one was edited last. **When an item is added, deleted, or moved, every copy is renumbered and reordered in the same edit.** Editing one copy and leaving the others is how a patch ends up with two "item 12"s, a tab that says "Prism" where the header says "Quartz", and a `selector~` inlet that matches neither. Before declaring the change done, walk every surface the list reaches and confirm the same sequence appears on each, with the same numbers in the same positions.

This is a symmetry rule, like *Never Regress Functionality When Changing Modality*: a change to the list in one modality must land in all of them. The recognition signal is any edit that touches an item in *one* of these places — a `tabs` attribute, a `umenu` `items` list, a header comment, a JS array literal — without a matching edit elsewhere. That is the moment to grep for the other copies.

For instance: `patches/shootouts/reverb-shootout.maxpat` numbers each reverb in its patching-view header comment ("9 · bp.Gigaverb — BEAP module, stereo in") and in its short presentation label ("9 · BEAP bp.Gigaverb"), because the number is the `selector~` inlet the reverb feeds. The `tab` that actually selects the reverb lists the same eighteen items in the same order but with no numbers at all ("DRY", "cverb~", "Live-Reverb", …). So the one surface the operator clicks is the one surface that does not show the index every other surface is keyed to. The fix is to number the tab items too, so all three copies read the same.

## Demos, Help Files, and Test Patches Must Demonstrate Functionality Visibly — Binding Rule {!core}

A help file, a test bench, a comparison patch — any patch whose purpose is to *show an object working* — exists so someone can **see the object work**, not merely read a list of its messages. Every demo control must be wired and parameterized so its effect is **visible on screen the instant the user clicks it.** The recurring silent failure: a demo that fires perfectly correctly but displays nothing, because its data lands outside whatever the object is currently showing — so the user concludes "the message does nothing" when in fact it worked off-screen.

Concretely, when building or reviewing any such patch:

- **Every demo input must address currently-visible state — no exceptions.** For a keyboard / `kslider`-like object displaying MIDI 60–72, the demo messages must use notes in 60–72; a `chord 36 …` or `setdots 1 36 …` on that object fires but lands on keys that aren't drawn and reads as a dead message. Either match the demo data to the displayed range, or set the object's range/offset to include the demo data. The general form: any "show this" demo must reference state the object is actually rendering — and this holds for benches and comparison patches exactly as much as for `.maxhelp`. When an attribute changes what's visible (range, offset, min/max, a value type), pick demo data valid for the *displayed* configuration, and prefer values in a canonical test range (e.g. slider values in `0.–1.`) so they read cleanly whatever the bounds.
- **If a message takes arguments, supply them.** A bare `chord` / `setdots` / `setval` / `list` message box demonstrates nothing — give it representative arguments (that also satisfy the visible-state rule above) so one click shows the real effect.
- **Expose the key attributes with `attrui`** — one `attrui` per attribute, wired to the object's inlet — so the user can flip each one live and watch it take effect. This is the only practical way to test attributes, and it doubles as documentation of what's tunable. (Style and grouping per the two rules above.)
- **Make outputs visible** (number boxes, comments, `print`, or a `prepend set` → message box that captures lists/symbols) so the user sees what the object emits, not just what it receives.
- **Label and lay out the demos clearly** — section headers, feeders above / outputs below, no overlapping controls — so the functionality reads at a glance.

The acceptance test is behavioral, not structural: open the patch, click every demo and flip every attrui, and confirm each produces a **visible change**. A click that changes nothing on screen is a broken demo even if the message it sends is "correct."

For instance: the `butter_keys` comparison bench placed `kslider` and `butter_keys` showing MIDI 48–60, but several demos targeted notes outside that range (`chord 60 …`, `set 62`, `setval 62 …`) and the slider-face messages set values against an integer 0–127 range — so the keys lit nothing visible and the slider bars barely moved. The fix: every demo note pulled into 48–60, every arg-taking message given representative args, and slider-face values cast as `0.–1.` floats (with a `setminmax -1. 1.` bipolar example). Earlier the same failure hit `butter_keys.maxhelp` (displayed 36–48 while demos targeted 60–67). This rule is symmetric with **Never Render an Empty Container** and the presentation aesthetic rules: visible-but-wrong is recoverable; silent-and-blank trains the user to distrust the object.

## Model Selection — When to Use Opus or Fable vs Sonnet

Claude Sonnet is the default and handles most tasks. **Do not proceed silently on Sonnet when Opus is warranted** — pause and prompt the user first. Use the exact phrasing below so the prompt is unambiguous.

### Prompt to switch to Opus

When any of the following tasks arises, stop before beginning and say:

> "This task warrants Opus or Fable for better results — run `/model opus` or `/model fable`, then let me know and I'll continue."

Trigger cases:

1. **Analyzing a dense or complex existing patch** — non-obvious signal flow, reverse-engineering intent, structural problems
2. **Studying complex documentation** — Max refpages, third-party package docs, API references where subtle distinctions matter
3. **Analyzing installed packages** — evaluating objects, writing `use_when` judgments for `packages/package_objects.json`
4. **Reading complex Cycling '74 forum threads** — synthesizing community knowledge, distinguishing good advice from outdated workarounds
5. **Planning a new complex patch** — architecture decisions, subpatcher decomposition, signal flow design before any spec is written
6. **Designing a presentation mode UI** — layout hierarchy, panel grouping, visual weight, control placement. Stop and offer the user two options:

   > "Before we design the presentation UI, choose an approach:
   > - **Option A** — run `/model opus` or `/model fable` and we'll design it here (Opus = same model as Claude Design)
   > - **Option B** — take the design to [claude.ai/design](https://claude.ai/design), which has separate usage included with your account, then bring the layout back and I'll translate it into spec coordinates
   >
   > Which would you prefer?"

   Wait for the user's choice before proceeding. If they choose Option B, ask them to describe or paste the layout when they return and you'll handle the spec translation on Sonnet.

### Prompt to switch back to Sonnet

When the analytical or design phase is complete and implementation begins (spec writing, conversion, file editing), say:

> "The analysis/design phase is done — you can switch back to Sonnet now: `/model sonnet`."

## Before Beginning Any Work

Before starting, read `CLAUDE.md`, `SPEC_REFERENCE.md` and `TUTORIAL_GUIDELINES.md` so your understanding of the current spec format and conventions is up to date. Read `spec2maxpat.py` only when the task touches the converter, and then only the functions involved. Do not rely on prior session knowledge alone; the repo is the authoritative source.

**Before constructing or editing any patch**, read `patching/MAX_PATCHING.md`. It contains all patching principles, presentation view guidelines, documentation verification rules, and common pitfalls. Treat its presentation section as a checklist before starting any presentation layout.

**Before designing or analyzing anything inside a `gen~` / `gen` box**, also read `patching/GEN_PATCHING.md`. gen~ is a separate dataflow language with its own object set and per-sample evaluation model — patterns from MSP do not necessarily translate.

**Before designing or analyzing anything inside a `jit.gen` / `jit.gl.pix` box**, read `patching/JIT_GEN_PATCHING.md`. Same gen language as gen~, but iteration is per-cell or per-pixel rather than per-sample — `samplerate` and audio-time idioms do not apply; position primitives (`norm`, `cell`, `dim`) and texture sampling do.

**Before writing a `[js]` or `[v8]` script that reads or writes a `jit_matrix`**, read `patching/JITTER_JS_PATCHING.md`. The JitterMatrix API has several silent-failure modes — most notably the constructor-name-as-first-arg trap, where passing a name as the first positional arg makes JS silently bind to a (possibly nonexistent) named peer and ignore the rest of the constructor args. The matrix then stays empty and every `setall` / `setcell2d` is a no-op with no warning. The file also covers inlet/outlet declaration, the canonical "consume a matrix, paint and emit another" template, and when to reach for `jit.gen` / `jit.gl.pix` / `jit.expr` instead of JS.

**Before working on a Max for Live device**, read `patching/M4L_PATCHING.md`. M4L adds the Live Object Model, `live.*` UI objects, device-lifecycle considerations, and `.amxd` packaging — none of which appear in standalone Max patches.

## Always Use Absolute Paths in Bash Commands — Never `cd`

The Bash tool's working directory persists across calls within a session. A single `cd subdir/` silently shifts the cwd for every subsequent Bash call until it is manually restored — including cwd-relative tool configs, hook scripts, and env-var-sensitive imports that depend on the repo root. This is a session-wide silent failure: commands that looked correct keep running from the wrong directory with no error output.

The defensive pattern: use absolute paths in every Bash command. When a tool genuinely needs a specific base directory (e.g. a Claude Code hook pointing at `$CLAUDE_PROJECT_DIR/...`), use the documented env var rather than `cd`. Do not use `cd` to set up an environment for subsequent calls — each call should be self-contained with absolute or env-var-anchored paths.

## Any Path Handed to a Shell Must Be Shell-Quoted — Binding Rule

Hook commands, MCP registrations, launch configs, and anything else stored as a `command` string are parsed by a shell, not passed as arguments. A path with a space works on the author's machine and fails on the first clone under `Documents/My Projects/`, and the failure surfaces as a blocked tool call rather than an error at install time. Build such strings with `shlex.quote()` and test them by running the exact stored string through `sh -c` before calling the install done. For instance: `install_global.py` wrote `python3 /…/john jannone/…/gate.py` unquoted, Python exited 2, and Claude Code treated that as a hard block on every Edit and Write on the machine until the path was quoted.

## Workflow

### Working on an existing patch — sync first, always {!core}

**Before any work on an existing .maxpat**, run sync to capture manual edits the user made in Max. No exceptions — not even for small fixes. `convert` regenerates the .maxpat from scratch and will silently destroy moved objects, added/deleted objects, hidden objects, and hidden cords.

**Sync reaches every nesting level.** An edit made inside a `p` subpatcher, a tab, or any nested patcher is captured the same way as one at the root (since 2026-09-13; see *Inside a Subpatcher Is Still Max*).

**The sync-first rule applies to any source of edits — not just user GUI changes.** Any direct modification to a .maxpat — whether a user edit in Max's GUI or a programmatic post-processing script — is invisible to the embedded spec and will be silently overwritten on the next `convert`. Use `/c2m-sync` or run `python3 spec2maxpat.py sync -i <patch>` immediately after any direct .maxpat modification.

### A patch that arrives from elsewhere is stale until the spec-vs-boxes check passes — Binding Rule {!core}

The sync-first rule above says "before any work on an existing .maxpat." Analyzing, verifying, and committing a patch are work too. Any `.maxpat` that arrives from another session, another person, or an external source has an embedded spec that may describe an earlier version of the boxes, and every action taken on the file before that is checked acts on the wrong object: an analysis describes boxes the spec does not know about, `verify_patch` in embedded-spec mode judges a spec that does not match the boxes and reports it clean, and a commit enshrines the mismatch so the next `convert` silently reverts the other author's edits.

So the check comes first, before reading the patch for meaning, before running the verifier, and before committing. Run `python3 spec2maxpat.py sync -i <patch>` (which is the check and the repair in one step), then the object-count comparison in the section below, then a content-level comparison: match spec entries to boxes by `(type, text)` — never by id, since spec ids are semantic names and box ids are Max's `obj-N` — and confirm nothing exists on only one side, the connection counts agree, and matched objects share a presentation rect.

The recognition signal: **git shows the file modified, and this session did not modify it.** That is the moment the file is untrusted, whatever the task is.

For instance: `patches/kslider-restrike.maxpat` was analyzed, verified clean, and committed on 2026-09-08 while its embedded spec still described the previous commit exactly. The boxes carried another session's `[s VST]` / `[r VST]` rework, a `[print v8]`, the loaded plug-in name on `vst~`, and two presentation rects Max had resized. None of it was in the spec. The verifier had checked the spec. One `sync` repaired it; the check that would have caught it is `spec_matches_patch()` in `spec2maxpat.py` (added the same day): `python3 spec2maxpat.py sync -i <patch> --check` runs it and writes nothing, and `verify_patch` runs it in embedded-spec mode and reports a `spec-stale` warning *before* any other finding, because every other finding is then about the wrong object.

### Sync preserves; it does not prune — verify object count before every convert {!core}

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

### Preferred Objects for Common Tasks {!core}

When planning a patch for a student, default to the objects in the table below for each task. These are the first-instinct choices — Max often has three or four ways to do anything, but the entries here are the ones that are simplest to wire, easiest to explain, and most likely to be what a beginner actually wants. Reach for an alternative only when there's a specific reason the default doesn't fit (e.g. the student has asked for something the default can't do, an external they're already using exposes a different interface, or the package library surfaces a single-object solution to an otherwise-long chain).

| Task | Default | Notes |
|---|---|---|
| Play a sound file | `playlist~` | One object, multi-file with crossfades; vastly better than rolling `sfplay~` + bank logic by hand. |
| Play video | `jit.playlist` | Same idea on the Jitter side — multi-clip playlist with crossfades. |
| Audio I/O | `ezadc~` (input) / `ezdac~` (output) | The toggle-style I/O objects. Click the speaker icon to enable. Don't use `adc~` / `dac~` for student patches — the toggle UI is the point. **A live input always gets its own mute toggle, loading muted** — `ezadc~`'s button is DSP on/off, not a mute (rule in `patching/MAX_PATCHING.md`). And never mix signals with `+~`: cords landing on one inlet sum by themselves. |
| MIDI input | `notein` / `ctlin` / `bendin` directly | Skip `midiin` + `midiparse` — go straight to the object that emits the data you need. |
| MIDI output | `noteout` / `ctlout` directly | Same as input — direct objects, no `midiformat` + `midiout` intermediate. |
| Audio synthesis — basic oscillators | `saw~` / `tri~` / `rect~` | The trio of bandlimited classic waveforms. Pick the one whose harmonic content matches the timbre you want; layer two or more for richer tones. |
| Audio synthesis — sample playback | `groove~` | Needs a named `buffer~` upstream; supports loop points, playback speed, and direction. |
| Recording audio into a buffer | `record~` | Needs a named `buffer~`. Toggle to start/stop. |
| Reverb | `bp.Gigaverb` (BEAP, ships with Max) | The lush default. `bp.Freeverb` is a lighter Schroeder-style alternative — also BEAP, also ships with Max. For higher fidelity, `hirt.convolutionreverb~` from HISSTools with a real IR — install the HISSTools package first. |
| Delay line | `tapin~` / `tapout~` | `tapin~` holds the buffer; one or more `tapout~` objects read from it at different delay times. Don't reach for `delay~` — `tapin~/tapout~` is the standard idiom. |
| Filter | `biquad~` with `filtergraph~` | `filtergraph~` is the editor — drag the graphical handle, send its output into `biquad~`'s right inlet to set coefficients. Visual + audible at the same time. Alternatives: `svf~` when you need lowpass, highpass, bandpass and bandstop at once, from its four outlets (0=LP, 1=HP, 2=BP, 3=BS; max cutoff = samplerate/4, not samplerate/2), and `lores~` for a simple low-resonance lowpass with no self-oscillation. |
| Multi-value input | `multislider` | One object, N sliders, list output. Configure via inspector. |
| Step sequencer UI | `live.step` (preferred) or `itable` | `live.step` gives a full graphical step sequencer with per-step velocity, pitch, and gate. Drive it with a `next` message on each clock tick (e.g. `metro → [message next] → live.step`); outlet 0 outputs the current step's values as a list (index, pitch, velocity, duration). `itable` is lighter: a graphical table editor where you draw values and query by index — send an int to outlet 0 to retrieve the stored value at that index. Neither requires Max for Live — both work in any Max patch. When the patch needs a step-display UI, offer the user a choice between these before falling back to a row of number boxes. |
| Multi-column data display | `jit.cellblock` | The spreadsheet-style readout. Drive with `cell <col> <row> set <val>` messages. |
| Sequencer / clock | `metro` | `metro` is the clock — send `1` to start, `0` to stop, interval as a creation arg or via the right inlet. For the step UI on top of the clock, see "Step sequencer UI" above. `metro @defer 1` pushes bangs to the low-priority queue to avoid audio-scheduler conflicts — `qmetro` is NOT a separate class, it is exactly `metro @defer 1`. |
| Distribute one source to one of N outputs | `gate N` | `gate` is a *distributor*: data arrives at one inlet and exits through whichever of N outlets is currently selected. Send `1`–`N` to open that outlet; `0` closes all. Second creation arg sets the initially-open outlet (`gate 3 2` = 3 outlets, outlet 2 open at load). Passes all message types. |
| Select one of N input sources | `switch N` | `switch` is a *selector*: one of N data inlets is routed to a single outlet based on the selection int. Use when you have multiple sources and want to monitor or route one at a time. (Note: `gate` and `switch` have inverted names relative to intuition — gate distributes, switch selects.) |
| Random / probability | `random @range <lo> <hi>` | No downstream `scale`, offset `+` or `expr`; mind that the high value is excluded. See *Prefer an Object's Own Attribute Over an Adapter Chain*. `@seed` for reproducibility. |
| Scale / map a number range | `scale` | `scale <in_lo> <in_hi> <out_lo> <out_hi>` — one object, no math. Don't reach for `expr` for simple range mapping. |
| Comparing / routing values | `v8` JavaScript | Branching logic with multiple conditions is far cleaner expressed as a few lines of JS than as a tree of `if` / `select` / `route` boxes. Use `v8`, not `js`. |
| Single button / toggle / dial / slider | Varies by context | `button` for momentary, `toggle` for on/off state, `live.dial` for continuous (not `dial`), `multislider` for linear ranges (not `slider`), `live.gain~` for a level (not `gain~`). Pick the affordance that matches the operator's mental model for that control, and the newest member of its family (see *Prefer the Most Modern Member of an Object Family*). |
| Number readout (display only, no input) | `message` box with input to right inlet, OR `comment` with `set <value>` message | Send `flonum → sprintf "%.2f" → (right inlet of message)` for a clean float readout. The message displays the value but doesn't fire. Alternative: `flonum → sprintf "set %.2f" → comment` if you want the styling of a comment rather than a message. |
| Text input from the user | `dialog` | A modal popup — bang to prompt, the entered text comes out the outlet. Avoid `textedit` for set-once configuration values (see the binding rule "Don't Use `[textedit]` for Set-Once Configuration"). |
| List manipulation | `v8` JavaScript | Filtering, reshaping, mapping, sorting a list is one line of JS. Don't chain `zl` / `join` / `unjoin` / `vexpr` for anything beyond the trivial cases. |
| Combine values into a list / split one apart | `join` / `unjoin` | **Not `pack` / `pak` / `unpack`.** See *Prefer the Object That States Its Behavior in an Attribute*. |
| Long-term storage | `dict` (default) | Key/value storage with nested structures, JSON-compatible. Other choices apply when the data shape calls for them: `coll` for indexed lists, `text` for plain-text bodies, `pattr` + `autopattr` when the values must persist with the patch. |
| Jitter — load an image | `jit.matrix` + `importmovie <path>` message | One matrix, one message — the image lives in the matrix. From there, send it through any Jitter chain or `jit.gl.videoplane`. |
| Jitter — display a matrix | `jit.world` + `jit.gl.videoplane` (sometimes called `jit.gl.layer` — an alias prototype with attributes pre-set) | Two-stage render: a first `jit.world` runs your scene, captured to a texture; a second `jit.world` reads that texture via `jit.gl.videoplane`, optionally routed through `jit.gl.cornerpin` for projector keystone correction. |
| Webcam capture | `jit.grab` | Open the device, send `bang` per frame (or wire a `qmetro` upstream). One object, no driver wrangling. |
| GL drawing | No strong preference | Pick the `jit.gl.*` object that matches the primitive you need — `jit.gl.gridshape`, `jit.gl.mesh`, `jit.gl.sketch`, `jit.gl.text`, etc. |
| Per-pixel work that ends up on screen | A GLSL shader via `jit.gl.slab @file <name>.jxs` | Ask "can this be a shader?" before "how do I write this in JS?" A `[v8]` painting a matrix cell by cell crosses the JS/Jitter boundary per pixel and carries four silent-failure traps that all render black without an error; a shader runs on the GPU, exposes its `<param>`s as live message-settable uniforms, and either compiles or names the line it failed on. See `patching/JITTER_JS_PATCHING.md` > *When NOT to use JS for matrix work*. |
| OSC | `udpreceive` + CNMAT odot `o.route` | Use `o.route` rather than `OSC-route` when CNMAT odot is installed — `o.route` has cleaner semantics and is what the rest of the OSC community converged on. |
| Networking / WebSocket | `node.script` + the multi-user-template | When the patch needs to talk to phones, browsers, or the cloud, build on `multi-user-template` (see the dedicated section above) — don't roll a Node-for-Max LAN server from scratch. |
| Several pages or examples in one window | Patcher tabs: `p "<name>"` with `showontab: 1` | Max's help-file mechanism; every page keeps its own patching and presentation view, nothing is hidden, no controller object. Not for choosing among items one set of controls acts on: that is a `live.tab` / `tab` selector inside one view (see *Several Views in One Window: Patcher Tabs, Not bpatchers*). |
| Send / receive between distant parts of a patch | `s` / `r` for messages, `value` for shared scalar state, `pv` / `v` for patcher-scoped variables, `s~` / `r~` for signal | Pick by lifetime and scope. `s`/`r` for cross-patch broadcast of messages; `value` when two boxes need to read the same shared scalar; `pv`/`v` when the scope should not leak past the parent patcher; the `~` variants for signal-rate. **Write the abbreviations** (`s`, `r`, `s~`, `r~`), not the long forms. Use them where a cord would cross the patch — a short local connection stays a cord, because seeing it is what tells the reader the two objects are one chain. **A name is a channel, not a wire: repeat the sender.** When a second source needs an existing channel, put a new `s NAME` under that source instead of running a cord to the existing one — the refpage states that all same-named senders reach all same-named receivers, and C74's `jit.anim.path.maxhelp` ships nine `send topath` boxes in one patch. The order two receivers fire in is explicitly *not* deterministic, so never lean on it. Multiple `s~` sharing a name **sum** into the matching `r~`, which is what makes a mix bus one object per voice. |
| JS / scripting | `v8` (default) | Modern JavaScript engine — ES6+, faster, better-supported. Use the older `js` object only when you have a specific reason (e.g. you're modifying an existing patch that already uses it). |

When in doubt — or before composing any chain of 3+ native objects — run `python3 packages/query_packages.py search "<term>"` to see whether an installed package handles the whole task in a single object. The package library (2,795+ entries) often shortcuts a long chain into one well-named external.

### Existing patch (externally sourced or manually edited)

Run `/c2m-sync` first. Then edit the boxes in the `.maxpat` and sync again; use `convert` only when a rebuild is specifically needed (see *Never Use `convert` Unless It Is Specifically Needed*). All patches live in `patches/`.

## Max Compressed Text (MCT)

Never paste raw `.maxpat` JSON — users can't open it. MCT is the format Max uses for "Copy Compressed": the user copies the block and does **File > New From Clipboard** to reconstruct the patch.

### Show Max Wiring as MCT, Not as a Drawing — Binding Rule {!core}

When an answer shows Max objects wired together, give the reader something Max can open, not a picture of it. An ASCII diagram of boxes, brackets and pipes has to be rebuilt by hand, one object and one cord at a time, and every outlet index in it is a chance to wire it wrong. The same wiring as MCT is one copy and **File > New From Clipboard**, and what opens is exactly what was meant. So whenever a reply would otherwise draw a chain, however short, build it and paste the MCT instead.

Keep the snippet simple: only the objects that answer the question, laid out top to bottom, plus a `print` or a display where the result would otherwise be invisible. A snippet is an illustration pasted into chat, not a patch file, so it carries no presentation view and no embedded spec: strip the `obj-spec-embed` box before encoding (John confirmed the exemption, 2026-09-15).

**The explanation goes in the patch, as `comment` boxes beside the objects they describe.** What each object does, why it is there, and what to watch out for belong next to the box, where the reader is looking when they need it, and they travel with the snippet once it is pasted and saved. The chat reply keeps only what is not about the boxes: which sources were checked, what has not been verified in Max, a question for the user. The same rules apply to these comments as to any comment in a patch: flow words from *Describe Flow in the Target Environment's Own Directional Vocabulary*, and no attribute named in a comment unless the patch shows it (*If You Mention an Attribute, Show It*).

**The reply around the snippet has a fixed shape**, which John approved on 2026-09-15: one opening sentence saying what the snippet does or what was checked first, then the MCT block, then a few short labeled lines — what was checked (refpages, help files, the converter's name check, the MCT decoding back to the same box and cord count), what has not been tested in Max, and any open question with named options. Nothing that belongs in a `comment` box is repeated in the chat.

The mechanics: write the spec to the scratchpad, `convert` it to a scratch `.maxpat` (the gate checks every object and attribute name on the way), remove the spec box, then `python3 spec2maxpat.py mct -i <scratch>.maxpat`. The recognition signal: typing `[` and `|` into a code block to show cords. (John, 2026-09-15, after a `chooser` answer drew its `thispatcher` chain in ASCII.)

```bash
python3 spec2maxpat.py mct -i patches/patch.maxpat   # produce MCT
```

To decode MCT received in the conversation: `python3 -c "from spec2maxpat import mct_decode; import sys,json; print(json.dumps(json.loads(mct_decode(sys.stdin.read())),indent=2))"` piped from the MCT block. See `SPEC_REFERENCE.md` § "MCT Encoding Algorithm" for the encoding detail.

## Key Files

- `SPEC_REFERENCE.md` — **Read this first.** Complete spec format, object types, connection format, layout guidelines, v8/JS objects, MCT encoding, worked examples.
- `patching/PATCH_ANATOMY.md` — Orientation for the Max landscape: the ten functional roles a box plays in a patch (input, UI, domain processing, state, logic, compiled, routing, external services, output, infrastructure). Read when planning a new patch or decomposing an existing one, before reaching for specific objects.
- `patching/MAX_PATCHING.md` — Patching principles, presentation guidelines, documentation verification rules, common pitfalls. Read before any patch work.
- `patching/GEN_PATCHING.md` — gen~ / gen programming model (audio rate / control rate), canonical idioms (slide envelope follower, samplerate→ms, equal-power crossfade), latency-compensation discipline. Read before any work inside a `gen~` / `gen` box.
- `patching/JIT_GEN_PATCHING.md` — jit.gen / jit.gl.pix programming model (per-cell / per-pixel), position primitives (`norm`, `cell`, `dim`), texture sampling, distance-field idioms. Read before any work inside a `jit.gen` / `jit.gl.pix` box.
- `patching/JITTER_JS_PATCHING.md` — JitterMatrix API from `[js]` / `[v8]`: constructor forms (and the name-as-first-arg trap), `setall` / `setcell2d` / `getcell2d`, inlet/outlet declaration, the canonical "consume and emit" template, and when to reach for `jit.gen` / `jit.gl.pix` / `jit.expr` instead. Read before any JS-driven matrix work.
- `patching/M4L_PATCHING.md` — Max for Live patterns: Live Object Model access chain, `live.thisdevice` init signal, `getpath` + `deferlow` race, Push 3 polyphonic pressure, `live.*` UI styling, `.amxd` packaging. Read before any M4L device work.
- `tools/fx_shootout_builder.py` — first-draft builder for the `patches/shootouts/*-shootout.maxpat` effect comparisons (slot tables per category; shared `patches/shootouts/fx-shootout-highlight.js`). First draft only: once a shootout has been edited in Max, the `.maxpat` is the source of truth — edit the boxes and sync, never re-run the builder over it, and convert only when specifically needed.
- `spec2maxpat.py` — The converter. I/O data from C74 maxref.xml via `RefpageCache`; no external database.
- `TUTORIAL_GUIDELINES.md` — Tutorial structural contract, panel/annotation attrs, comment-pile pattern, breakage diagnostic.
- `packages/package_objects.json` — Curated reference of installed Max package objects with `use_when` judgments.
- `packages/package_concepts.md` — Per-package paradigms (bach lllls, FrameLib frames, FluCoMa corpus workflow, etc.).
- `packages/package_schema.py` — Canonical schema; `normalize()`/`validate()` for `package_objects.json`.
- `packages/query_packages.py` — `list`, `search <term>`, `validate`. Read-only CLI for the package library.
- `packages/CURATION.md` — How to extend package coverage: extractor CLIs, schema norms, `use_when` quality bar.
- `scans/c74-forum/forum_insights.md` / `scans/cookbook/cookbook_insights.md` / `scans/c74-projects/c74_projects_database.md` — Community knowledge, non-obvious patterns, real examples, and a catalog of community projects.

## Knowledge Resources — Consult Before Designing

When designing or debugging a patch, consult these curated sources — not just the official docs:

- **`packages/package_objects.json`** — 2,795 package objects with `use_when`. Search: `python3 packages/query_packages.py search "<term>"`. Check before building any multi-object native chain.
- **`packages/package_concepts.md`** — Paradigms for packages with custom types (bach lllls, FrameLib chains, FluCoMa workflow). Read when using a new package.
- **`scans/c74-forum/forum_insights.md`** — Non-obvious behaviors, preferred patterns, performance pitfalls from Cycling '74 forums.
- **`scans/cookbook/cookbook_insights.md`** — Insights from Max Cookbook examples (Dobrian/UCI).
- **`scans/c74-projects/c74_projects_database.md`** — Catalog of community projects from <https://cycling74.com/projects>. Search this when answering "is there an existing Max for Live device that does X?" or "who has built something like Y?". Note: most gallery entries link to commercial products (paid M4L on gumroad / vstopia / vendor stores) — patch source is rarely available. Free patches that are extracted go to `scans/c74-projects/c74_projects_insights.md`.
- **`scans/jjannone-max/jjannone_max_insights.md`** — Max technique read out of John's own corpus of patches, 2007 to 2026. **Enumeration only so far**: the insights file is still an empty scaffold, so do not read its emptiness as "nothing found"; the continuation is a task in `TASK_QUEUE.md`. The index the crawl built — 2,959 patches with title, project, box count and object vocabulary, which is what answers "has John already built a patch that does X?" — is **local to his machine and not tracked**, because it names private project folders and this repo is public. On his machine it is `scans/jjannone-max/jjannone_max_crawl_state.json`; in a fresh clone that file is absent, and anything reading it must say so rather than report an empty corpus.
- **`scans/userguide/userguide_insights.md`** — the cross-cutting "how Max works" prose from Max's own userguide (`C74/docs/userguide/content/`), which the refpages do not carry: patcher lifecycle, the scheduler and priority, polyphony, abstractions and bpatchers. Session 1 wrote 26 entries and promoted 15 of them into `patching/MAX_PATCHING.md`, which is where to read them; this file is the source of record. `patching/JITTER_PATCHING.md` and `patching/MC_PATCHING.md` are its next two targets and are **scaffolds so far** — a topic table with every row marked pending, not yet a reference.

_Add new scraped resources here. Every crawl lives in its own folder under `scans/` — `scans/<source>/<SOURCE>_CRAWL_LOG.md`, `scans/<source>/<source>_crawl_state.json`, `scans/<source>/<source>_insights.md`, plus its enumerator script, which should locate its own files relative to itself (`Path(__file__).parent`) so the folder can move without breaking it. Code that reads a crawl's output — `spec2maxpat.py` for `scans/maxhelp/maxhelp_observed_attrs.json`, `mcp_server/server.py` for the observed attrs and the forum and cookbook insights — names the `scans/` path explicitly._

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
  ways; OSC over UDP forwards sensor data to a `[udpreceive]`
  in the patch.
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

OSC arrives at `[udpreceive <port>]` with addresses:

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
  rule in `patching/MAX_PATCHING.md` > Common Pitfalls.
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

## Every Global Name Inside a Copied Thing Is Per-Instance — Binding Rule {!core}

Max resolves a name globally: every `s FOO` reaches every `r FOO`, every `buffer~ FOO` is one buffer, every `value FOO` is one value, every `dict FOO` / `coll FOO` is one store, wherever the boxes sit. So inside anything that will exist more than once at the same time — a Live device on two tracks, a `poly~` voice, an abstraction placed twice, a `bpatcher` loading the same file twice — a plain name silently fuses the copies into one machine: they share the store, the display bus, the pass-through. Nothing errors. The failure appears only when the second copy exists, so the names must be written per-instance from the start, not repaired when a second track is added.

Each container has its own mechanism, and they do not substitute for each other. Verified against Max 9's docs, 2026-09-14:

| The copied thing | What makes a name per-instance | Where it is documented |
|---|---|---|
| A Max for Live device (`.amxd`) | Start the name with three dashes: `s ---KEYS`, `r ---KEYS`, `buffer~ ---BUF`. Live replaces `---` with a number unique to the device instance at load. | `send` / `receive` / `send~` / `receive~` refpages; the glossary names `buffer` too |
| An abstraction (a `.maxpat` placed by name) | Start the name with `#0`: `s #0-KEYS`, `buffer~ #0-BUF`. Max replaces `#0` with a number unique to each loaded instance, and the instance's embedded subpatchers share it. | *Abstractions* guide; glossary: "unique to each instance of an abstraction (and its subpatchers)" |
| A `poly~` voice | Same as an abstraction: each voice is a loaded instance of the patcher file, so `#0` is per voice. The voice also knows its own number: `thispoly~` answers a bang with the instance index on its left outlet, counted from 1, so a voice can pick its own slot in a shared `coll`, `buffer~` or `dict` by index instead of by name. | *Abstractions* guide ("each patcher instance"); `thispoly~` refpage ("reports the instance number of the patch. The first instance is reported as 1") |
| A `bpatcher` that loads a file by name | Same as an abstraction (`#0`). An embedded bpatcher (`@embed 1`) has not been verified here; treat it as a `p` until checked. | *Abstractions* guide |
| A `p` subpatcher, a tab, an embedded patcher | No automatic mechanism: it is part of its parent's instance and shares the parent's `#0` or `---`. Two copies of the same `p` are told apart by hand: type an argument on the box (`p VOICE 1`, `p VOICE 2`) and read it inside with `patcherargs`, whose left outlet lists the typed arguments and whose right outlet lists `@attr` pairs. | glossary: "(and its subpatchers)"; `patcherargs` refpage and its help file (`p patcherName 1 foo 11.5 @squiggle 74`) |
| Patcher-local scalar state | `pv NAME` instead of `value NAME`: shared "only within a single patcher, or one of its subpatches," so two top-level copies never meet. Scope, not a prefix. | `pv` refpage |

**Reading the identity at runtime.** No object reports "which copy am I" for every container; each has its own read-out. In an abstraction, `poly~` voice or file-loading bpatcher, a message box whose text starts with `#0` outputs the instance number when clicked or banged (the *Abstractions* guide: the prefix is replaced "if it appears at the beginning of the word"). In a `poly~` voice, `thispoly~` bang → left outlet is the voice number. In a Live device, `live.thisdevice`'s right outlet emits the device's own `id`. In any container, `patcherargs` bang reports the arguments typed on the box. When a copy must address a per-instance resource by *number* rather than by *name* — the nth row of a shared `coll`, the nth channel — these read-outs are what the number comes from.

Two things that look like names but are not global: a `pattr` name and a scripting name (`varname`) are local to their patcher hierarchy, and `#1`…`#9` are arguments, not identity. A device is a top-level patcher, not an abstraction, so `#0` does not do the job there; `---` does. An abstraction used inside a device gets both: `#0` per placement, and `---` if it must also be per device.

For instance: `butter_keymap.amxd` first shipped with `s KEYS_DELETED`, `s KB_PHYS`, `s CLICK_A` and `s MIDI_THRU`. Two instances on two tracks showed one shared deleted set, and each instance's untouched MIDI reached the other's `midiout`; a saved set reopened empty because the last instance to load reset both. Renaming all eight boxes with `---` fixed every symptom at once (John, 2026-09-13). The recognition signal: typing any name into a box inside a file that Max or Live can load twice, without the prefix that file's container uses. That is also the moment to reconsider whether the `s` / `r` pair is needed at all — a cord cannot cross instances.

## A Reusable Object Has One Home on the Search Path — Binding Rule {!core}

Anything more than one patch loads by name — a `v8` / `v8ui` / `jsui` script, an abstraction, a `gen~` file, a `.jxs` shader — gets exactly one copy, in a package on Max's search path, and never a copy beside each patch that uses it. Max resolves files by name, so a second copy is not a convenience but a second source of truth: the moment one copy is edited, in Max's script editor or anywhere else, the other is silently stale, and which one a given patch runs depends on search order nobody is watching. The failure never surfaces as an error. It surfaces as a patch that behaves like last week's version.

So when a script or abstraction is about to be copied next to a patch, stop and put it in the package instead (for John: Butter_tools, below). Edit it there, commit it there, and restart Max, which caches scripts and abstractions for the session. The one exception is a patch that must travel self-contained, where `@embed 1` on a `v8` box stores the source *inside the patch* rather than beside it (see *Embed the Script in Every v8 Box*); that is a copy Max keeps in step through `sync`, not a loose file. For instance: `zkeyboard.js` was copied from Zendrum_Player into `patches/keymap/` on 2026-09-12 so the sample-key-mapper could load it. John caught it the same session, and the fix was a package, not a rule about copying carefully. (John, 2026-09-12.)

## Butter_tools — John's Own Max Package, One Home for Reusable Objects

Reusable objects John writes (a `v8ui` script, a `v8` script, an abstraction that more than one project uses) live in the **Butter_tools** Max package, not beside the patch that first needed them:

```
/Users/johnjannone/Library/CloudStorage/Dropbox-JohnJannone/john jannone/_Projects__________________/_GitHub/Butter_tools
```

It is its own git repo, laid out as a standard Max package (`javascript/`, `help/`, `examples/`, `docs/`), and symlinked into `~/Documents/Max 9/Packages/Butter_tools`, so Max resolves every file in it by name from any patch on the machine. A box such as `v8ui @filename butter_keys.js` in any patch needs no copy of the script next to it, and must not get one: two copies of a script under active development drift the first time one is edited in Max's script editor. Edit the object in the package, commit there, and restart Max (it caches scripts and abstractions for the session).

Currently in the package: `butter_keys` (`javascript/butter_keys.js`), the kslider + multislider hybrid with key tints, dot overlays and click reporting; its help file; two benches; and John's Live devices under `devices/` with their engines under `javascript/` (`butter_keymap.amxd` + `keymap.js`, the sample-key mapper). Devices are worked on in place there — `spec2maxpat.py sync` reads and writes `.amxd`. Read the package `README.md` for the vocabulary before wiring it. The package's `docs/` folder is where a `<name>.maxref.xml` goes so the converter can resolve an object's inlets and outlets without spec overrides (see `patching/MAX_PATCHING.md` > *Shipping a Community Max Package*). `RefpageCache` searches `~/Documents/Max 9/Packages` after Max's built-in packages (since 2026-09-14, following symlinks), so `docs/butter_keys.maxref.xml` is found. **The refpage is keyed by object name, so which form the box text takes decides whether it is found at all.** A box whose text is `butter_keys` — the name `init/butter-tools-objectmappings.txt` maps to `v8ui @filename butter_keys.js @border 0` — converts with 2 inlets and 4 outlets and needs no overrides. A box written out as `v8ui @filename butter_keys.js` is looked up as `v8ui` (1 inlet, 1 outlet), so a spec using that form still declares `inlets`, `outlets` and `outlettype`.

## Consult Installed Packages Before Long Native Chains {!core}

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

## What You Must Handle {!core}

- **Object text, connections, layout** — write text exactly as you'd type it in Max. Get outlet/inlet indices right. Use explicit `pos`. See `SPEC_REFERENCE.md` and `patching/MAX_PATCHING.md` for all rules.
- **Presentation** — see `patching/MAX_PATCHING.md` for all layout, spacing, and design rules. Key invariants: every presented control needs a comment label; set `openinpresentation: 1`; exclude infrastructure objects.
- **Subpatcher, abstraction, and poly~ inlet/outlet labeling** — every `inlet` and `outlet` in a subpatcher/abstraction/poly~ must be labeled in two places: (1) **outside** — `attrs: {"comment": "in 0: bang — purpose | out 0: list — result"}` on the `p`/`poly~` object; (2) **inside** — `attrs: {"comment": "..."}` on each inlet/outlet spec entry AND an adjacent `comment` box. Never create an encapsulated unit without both levels.
- **`v8` / `js` inlet/outlet labeling — the same obligation, met in the script.** A `v8 foo.js` box tells the reader nothing about what each inlet expects or each outlet emits, exactly as an unlabeled `p` box does, so every script that declares `inlets` / `outlets` also calls `setinletassist(n, "…")` and `setoutletassist(n, "…")` for each index. The text becomes the hover tooltip on the box in Max, the same surface a subpatcher's inlet comment reaches. Confirmed in Cycling '74's own shipped scripts (`packages/Jitter Tools/javascript/jitgltextureset.js`) and in Max's code-editor declarations; the second argument may be a string or a function that returns one, and the string form is what C74 uses. *For instance:* `kslider-restrike.js` declares one inlet and two outlets and labels all three; the header comment that already described them is now what Max shows on hover.
- **Objects the converter cannot resolve** — supply `inlets`, `outlets`, `outlettype` in the spec. A `newobj` resolves through `NEWOBJ_IO`, its refpage, then the package library. A UI box (any other `type`) resolves through `MAXCLASS_DEFAULTS`, its own C74 help file, then its refpage (`SPEC_REFERENCE.md` > *UI classes: where the converter gets ports*). Boxes whose ports come from their contents (`bpatcher`, `v8.codebox`, `codebox~`, a `v8` script, a third-party UI object with no C74 help file or refpage) always need the override.
- **Always embed the spec** — every .maxpat produced via Claude2Max must include a hidden `text.codebox` (`id: "obj-spec-embed"`, `"hidden": 1`) below all other objects, with the full spec JSON wrapped in `--- CLAUDE2MAX SPEC ---` / `--- END SPEC ---` delimiters. This applies whether the output is from the converter or assembled manually.

## Some Objects Have Fixed Ports, Others Change — Know Which Before Counting {!core}

An object's inlets and outlets are either fixed or flexible. `metro` always has 2 inlets and 1 outlet. `join 3`, `live.gain~ @channels 8` and any `p` box change with their arguments, attributes or contents. Treat the two differently. For a known-fixed object, use its counts and do not look them up again. For a known-flexible object, work the counts out from the box in front of you. For an object not yet marked either way, find out when it is used, and record what you learn so the next use knows. (John, 2026-09-16.)

The record is `scans/maxhelp/maxhelp_port_counts.json`, built by `scans/maxhelp/extract_port_counts.py` from every patch **the installed version of Max** saved, and read by `PortCounts` in `spec2maxpat.py`. A class is fixed when boxes with at least two different argument lists all agree; flexible when any saved boxes disagree; unmarked otherwise. The converter asks the record first: a fixed class returns its counts, and a flexible class returns the counts Max saved for the exact same box text, if it has seen that text. Otherwise the converter's context rules apply, such as one inlet per `$` argument for `expr`. `sync` adds evidence from any patch Max saved to `maxhelp_port_counts_local.json`, which is gitignored because those patches can be private; a box that contradicts a fixed class turns it flexible.

Two things decide what counts as evidence, and both were found by checking the record against files it had not seen:

- **Only the installed Max version.** Older versions saved some objects differently. Max 9 gives `route a b c` four inlets, one per argument plus one; files Max 7 saved show one. Mixing versions made fixed objects look flexible and taught exact texts wrong counts.
- **Only Max patchers.** Boxes inside `gen~`, `jit.gen`, `jit.gl.pix` and `rnbo~` are another language with the same names: a gen `*` can have one inlet, an RNBO `cycle~` two outlets.

Measured 2026-09-16 against 71,282 boxes Max 9 saved in user packages, with the record built only from the Max install: 3,739 boxes the converter got wrong are now right, and none it got right are now wrong.

## Naming Convention {!core}

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

**In-repo skill manifests vs. upstream-publishable manifests.** Files at `.claude/skills/<name>/SKILL.md` are the in-repo manifests that Claude Code auto-discovers as slash commands when this repo is the cwd. Files named `<tool>/UPSTREAM-SKILL.md` (currently `c2m-themes/UPSTREAM-SKILL.md` and `c2m-explain/UPSTREAM-SKILL.md`) are snapshot manifests intended to be copied to a separate distribution repo (e.g. `Claude2Max-design`) so the skill is usable outside this codebase. The two are not interchangeable — `.claude/skills/<name>/SKILL.md` is the source of truth for slash-command invocation here; `UPSTREAM-SKILL.md` is the bundleable export. `c2m-explain/UPSTREAM-SKILL.md` is generated from the in-repo skill by `tools/build_upstream_skills.py` — edit the in-repo copy and re-run it — and `tests/test_generated_copies_current.py` fails when it, or `claude-project/` (built by `tools/build_claude_project.py`), is stale.

**Global enforcement skill (`max-patching`) — user-level, installed by `install_global.py`**

The source skill lives at `skills/max-patching/SKILL.md` in the repo. Running `python3 install_global.py` copies it to `~/.claude/skills/max-patching/SKILL.md`, where Claude Code discovers it from *any* cwd. It is NOT listed in the in-repo slash-command table above — it fires globally, not just when this repo is the cwd.

The skill calls `mcp__claude2max__assess()` + `mcp__claude2max__load()` to front-load Max knowledge at session start, then writes a sentinel file that the companion enforcement hook (`hooks/claude2max_max_edit_gate.py`) checks before allowing any `.maxpat`/`.maxhelp`/`.amxd` edit. Together they make Max knowledge mandatory rather than advisory.

```bash
python3 install_global.py [--env ANTHROPIC_API_KEY=sk-…]   # install
python3 install_global.py --verify                          # post-install check
python3 uninstall_global.py                                 # remove
```

## Always Inspect, Never Guess — Reach for `/c2m-inspect` During Patch Debugging {!core}

When debugging a running Max patch, any question whose answer hinges on the runtime contents of a named data structure (`dict`, `buffer~`, `jit.matrix`) gets answered by *dumping it*, not by reasoning from the upstream wiring. Wiring tells you what *should* happen; the dump tells you what *did* happen. Guessing from upstream logic is the failure mode this rule exists to prevent — the recognition signal is any sentence in your reasoning that begins "the dict probably contains…" or "the buffer should have…" or "the matrix is presumably…" — that's the moment to stop and run the dump instead.

The mechanics:

1. **If `[c2m.inspect]` is already in the patch**, run `python3 tools/c2m_inspect_send.py --timeout 1 ping` to confirm connectivity, then dump each suspect structure with distinct tags (`dump <tag> <kind> <name>`).
2. **If `[c2m.inspect]` is NOT in the patch**, add it autonomously via the normal sync → edit-spec → convert workflow before debugging. Mark it as a debug addition per the convention in **Clearly Mark Debug Additions** below. Ask the user to reload the patch in Max, then proceed.
3. **Read the resulting `/tmp/c2m_inspect_<tag>.json`** and interpret it against the expected state.

This is the *first* tool to reach for in Max-runtime debugging, not the last. Most "why isn't this working?" questions in patches built on `dict` / `buffer~` / `jit.matrix` are answered in one round-trip by the dump.

For coll/table the same discipline applies, but the reach is indirect: the inspector triggers a `write <file>` and parses it back, and the named object must be reachable by Scripting Name (same patcher) or via a `[receive <NAME>_INSPECT]` wire — see the v8 `messnamed` pitfall in `patching/MAX_PATCHING.md > Common Pitfalls` and the coll/table setup note in the `/c2m-inspect` skill.

## Clearly Mark Debug Additions to a User's Patch — Binding Rule {!core}

Any object added to a user's patch for diagnostic purposes — `[c2m.inspect]`, extra `[print]` boxes, scope displays, value-watch comments, anything that is NOT part of the patch's intended functionality — must be visually unmistakable as debugging scaffolding. The user must be able to (a) see at a glance what Claude added vs. what's part of the patch, and (b) remove the scaffolding confidently when debugging is done, without second-guessing whether each box is "really part of the design."

This is the counterpart to *Never Hide Patchcords or Boxes*: since nothing in a patch is ever invisible, a debug addition cannot be marked by hiding it — it is marked by standing out. Everything in the patching view is visible; debug scaffolding is visible **and unmistakable**, because it MUST communicate "this is temporary."

Conventions for every debug addition:

- **Distinct color** — magenta `[1.0, 0.3, 0.8, 1.0]` reserved repo-wide for debug additions. Not used elsewhere in Claude2Max's style guide. Which attribute carries it depends on the class, so check `list_attributes` per class: `bgcolor` on comments, messages, buttons, panels and most UI objects; `color` on plain object boxes (`r~`, `peakamp~`, `v8`, `jsui` have no `bgcolor`); a border attribute only where the class has one (`bordercolor` exists on `toggle`, `number`, `flonum`, `slider`, `attrui`, `panel`, not on `comment`, `message` or `button`). Verified against the refpage registry 2026-09-08 after the convert gate rejected 20 debug boxes that had been given `bgcolor` and `bordercolor` from memory.
- **Adjacent comment label** — text `🔍 DEBUG (Claude) — remove when done`, same magenta bgcolor. One label per cluster, not per box.
- **Spatially grouped** — place the cluster in the bottom-right corner of the patching view (or another corner the working graph doesn't occupy), physically separated from the patch's main flow so the operator's eye can ignore it.
- **Tracked in the embedded spec** — add a top-level `debug_additions: ["<id1>", "<id2>", …]` array to the spec listing every debug object's ID. This lets a future cleanup pass find and remove all of them mechanically without parsing colors.
- **NOT in the presentation view** — debug additions are patching-view scaffolding only; never set `presentation: 1` on them. The operator's UI must not be polluted by them.

When debugging is complete and the user has confirmed the patch is working, propose a cleanup pass: remove every object listed in `debug_additions`, prune the array, sync/convert. Do this proactively — leaving scaffolding in a working patch is the same failure mode as a stale link on a landing page.

The recognition signal during patch authoring: if I'm about to add a box that exists only to help *me* understand the patch's state — and the operator wouldn't ever look at it — that box needs the magenta marking. If it's part of the patch's actual functionality, it doesn't.

## Debugging Data Structures Live — `c2m.inspect` {!core}

When a patch is running and the question is *"what's actually inside this data structure right now?"*, drop the `[c2m.inspect]` abstraction (`patching/abstractions/c2m.inspect.maxpat`) into it. The abstraction listens on UDP 7474 for OSC; `tools/c2m_inspect_send.py` (stdlib-only, no python-osc dependency) talks to it and reads the dump back. Wrapped end-to-end by the `/c2m-inspect` skill.

Supported kinds with a direct v8 wrapper class (synchronous):

- `dict` — via `Dict.stringify()`
- `buffer~` — via `Buffer.peek()` (capped at `@samplecap`, default 4096 per channel)
- `jit.matrix` — via `JitterMatrix.getcell()` (capped at `@cellcap`, default 10000)

`coll` and `table` (no v8 wrapper, asynchronous): the dumper triggers a `write <file>` on the named object and reads the file back after `@asyncdelay` ms. Because `messnamed` only reaches `[receive]` objects — never a bare `coll NAME` — the user must enable one of two reach paths: (a) set the object's **Scripting Name** (`@varname`) equal to `<name>` and keep `[c2m.inspect]` in the same patcher (the dumper uses `getnamed().message("write", …)`), or (b) wire `[receive <NAME>_INSPECT] → [coll <NAME>]` (the dumper falls back to `messnamed("<NAME>_INSPECT", …)`). If neither is set up, the result is a structured error naming both options. The dump's `reach_method` field reports which path succeeded.

Still unsupported (no reliable v8 reach): `multislider`, `pattr`, `jit.cellblock`.

The OSC pathway is one-way: Max writes JSON to disk, the Python sender polls disk for the updated mtime. Reads, then prints. No UDP reply, so no return-path dependency.

## Admonition Tags

Headings in any `*.md` at the repo root tagged `{!pre-edit}` or `{!pre-commit}` are re-surfaced by `hooks/inject_admonitions.py` as `additionalContext` at the matching moment — `pre-edit` fires on Edit/Write tool calls; `pre-commit` fires when a Bash command actually runs `git commit` (not when the words only appear in a string or heredoc). To add a new at-action-point reminder: append the tag to any heading. No Python changes needed.

The same tag syntax also decides what the MCP server's knowledge modules carry. A heading in `CLAUDE.md`, `patching/MAX_PATCHING.md`, or `SPEC_REFERENCE.md` tagged `{!core}` is included, verbatim, in `load(["core"])` — the module every Max session loads first; `{!layout}` builds the `layout` module (box placement, presentation design, spacing); any other `{!<domain>}` (`{!networking}`, `{!msp}`, `{!jitter}`, …) appends the section to that domain's module. A tagged `## ` heading carries its `### ` children; tag a `### ` on its own when its parent is repo process rather than Max knowledge, or when a subsection belongs in a second module as well (a `### ` tagged `{!core}` under a `## ` tagged `{!layout}` reaches both). Tags are stripped from every heading a module renders. The extractor is `_extract_tagged_sections` in `mcp_server/server.py`, mtime-cached, so a tag added to a doc is live on the next `load()` without a restart. Tag only Max knowledge — a Claude in another repo has no use for fork setup, commit cadence, or model selection. This replaced a hand-written digest literal on 2026-09-08; `mcp_server/tests/test_modules.py` asserts every tagged heading reaches its module.

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

1. `Claude2Max/CLAUDE.md` — workflow, binding rules (always create a presentation view, never hide patchcords or boxes, never write API names from memory, etc.), the `c2m.inspect` debugging convention, the preferred-objects table.
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

**Also in Step 3 — offer to run `install_global.py`**

After the pointer is confirmed, say: "I can also wire up the Max knowledge enforcement layer — it makes Claude2Max knowledge mandatory (not just advisory) for any Max-file edit in any session on this machine. This installs the `max-patching` global skill, an MCP server with fast object-lookup tools, and a PreToolUse hook that blocks `.maxpat` edits until knowledge is loaded. Run `python3 install_global.py` from this repo to install all three, or I can run it for you now. Want me to?"

If yes, run `python3 install_global.py` from the repo root, then `python3 install_global.py --verify`. If either step fails, show the output and troubleshoot before moving on.

### Step 4 — Is `gh` available and authenticated?

```bash
which gh >/dev/null 2>&1 && gh auth status 2>&1 | head -3
```

Three outcomes:

- **`gh` is missing entirely** — say: "GitHub CLI (`gh`) isn't installed. I can install it via Homebrew if you'd like — that's the smoothest path to having your own fork of Claude2Max where your work lives. Want me to install it, or work locally for now?" If yes, run `brew install gh`. If no, fall through to the **Local-only fallback**.
- **`gh` is installed but not authenticated** (`gh auth status` shows "not logged in") — say: "I'd like to set you up with your own GitHub fork of Claude2Max so your session work is backed up and shareable. To do that, I need to log you into GitHub via `gh auth login`. I'll walk you through each prompt in plain language. Should I start, or would you rather work locally for now?" If yes, run `gh auth login` interactively (default settings: GitHub.com, HTTPS, login with a web browser — Claude explains each prompt as it appears). If no, fall through to the **Local-only fallback**.
- **`gh` is installed and authenticated** — continue to Step 4.5.

### Step 4.5 — Is the current clone already a fork of jjannone/Claude2Max?

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
candidates for an upstream pull request.

## Log

```

From that point forward in the session:
- Append any confirmed new rule, correction, or non-obvious workflow insight to `insights.md` under the `## Log` section with today's date
- Mark entries `**[shareable]**` when they seem broadly useful (not just specific to this user's patch)
- At the end of the session, if there are any unshared `[shareable]` entries **and the student is in forked-with-remote mode**, say: "There are N shareable entries in `insights.md` — want me to open a pull request to contribute them upstream?" In local-only mode, skip the reminder — the notes stay on disk for the student's own reference, and Claude can offer to set up the fork at a future session if appropriate.

## State-File Location for External Projects

When a student is using Claude2Max as a tool against an external project folder, the per-project state files belong with the project, not with the toolkit:

- `WORK_HISTORY.md`, `TASK_QUEUE.md`, and `insights.md` should live in the external project folder so they travel with the student's work.
- The Claude2Max repo's own `WORK_HISTORY.md` is reserved for changes to the toolkit itself (converter, skills, docs).

At session start, if the student has told Claude that they are working on a project at a specific path, treat that path as the home for these files. If the student has not pointed at an external folder, default to this repo as today. Ask once when it's ambiguous and remember the answer for the rest of the session.

**Pointer file — `.c2m-current-project`**

When a student opens Claude2Max but their actual work lives elsewhere, they can create a one-line `.c2m-current-project` file at the repo root pointing at the external path:

```
/Users/alice/Documents/max-pieces/spring-concert
```

At session start, if this file exists and the path is valid, Claude reads it and treats that folder as the project home for all state files (`WORK_HISTORY.md`, `TASK_QUEUE.md`, `insights.md`). This is more reliable than asking every session — the pointer persists across conversations and across machines if the repo is on Dropbox.

Create the file with:

```bash
python3 -c "import sys; open('.c2m-current-project','w').write(sys.argv[1])" "/absolute/path/to/your/project"
```

To stop using the pointer, delete the file or leave it blank.

## Work History {!pre-commit}

**At the start of every conversation, and after any gap of more than one hour within a conversation:**
1. Read the last ~10 entries of `WORK_HISTORY.md`, not the whole file: `grep '^- 20' WORK_HISTORY.md | tail -10`.
2. Read only the headlines of open tasks in `TASK_QUEUE.md` — `grep -n '^- \[\(pending\|in progress\)\]' TASK_QUEUE.md | cut -c1-220` — and report them to the user before beginning other work. Read a task's full entry only when picking it up. Say something like: "There are N pending tasks in the queue — [list them briefly]. Want to work on any of these, or something else?"

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

When a queued task is completed, move it to the Done section with a completion date.

**Task queue notation** — always use plain English markers, never checkbox symbols:
- `[pending]` — not yet started
- `[in progress]` — currently being worked on (include a brief note of where things stand)
- `[complete]` — finished (move to Done section)

When adding a task to the queue, always write a full expanded description — enough for any Claude instance to pick it up cold without this conversation's context. Include: what to build, where (file/function), why it's needed, implementation notes, prerequisites, and how it fits into the larger system. Also present the expanded description to the user in chat so they can confirm it captures the intent correctly before it's committed.

At the end of any session where meaningful work was done, append an entry to `WORK_HISTORY.md`. Do this automatically — no need for the user to ask. Format: `- YYYY-MM-DD: <brief, concise summary>`

**If `WORK_HISTORY.md` does not exist, create it** with a minimal header before appending:

```markdown
# Work History
```

**Do not rely solely on the stop hook.** Sessions that hit the context limit are cut off without firing the hook. Instead, update `WORK_HISTORY.md` proactively — after any significant milestone within a session, not only at the very end.
