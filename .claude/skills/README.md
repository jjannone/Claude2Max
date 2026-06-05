# Claude2Max slash-command skills

Six skills ship in this directory. Claude Code auto-discovers them as slash
commands when the cwd is this repo. Each `<name>/SKILL.md` is the
authoritative per-skill doc; this README is a one-line discovery aid.

| Slash command | One-line summary | Backing CLAUDE.md section |
|---|---|---|
| `/c2m-sync` | Explicit sync of a `.maxpat`'s embedded spec — captures manual edits before convert. | "Working on an existing patch — sync first, always" |
| `/c2m-tutorial` | Add an interactive step-by-step tutorial to a patch (two-pass: analyze → enhance → generate). | "Tutorial System" |
| `/c2m-package-search` | Find an installed package object instead of composing a long native chain. | "Consult Installed Packages Before Long Native Chains" |
| `/c2m-design` | Design a themed presentation-mode UI using the c2m-themes design system. | "Always Create a Presentation View" + Model Selection (Opus trigger) |
| `/c2m-explain` | Read-only plain-English walkthrough of a patch, stage by stage. | "Plugin / Slash Commands" |
| `/c2m-inspect` | Dump the live contents of a running patch's `dict` / `buffer~` / `jit.matrix` over OSC. | "Always Inspect, Never Guess" |

Skill manifests in `.claude/skills/<name>/SKILL.md` are the in-repo source of
truth. `<tool>/UPSTREAM-SKILL.md` files at the repo root (currently
`c2m-themes/`, `c2m-explain/`) are snapshot manifests intended for export to
a separate distribution repo — see `CLAUDE.md` § "Plugin / Slash Commands"
for the distinction.
