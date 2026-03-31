# Work History

- 2026-03-30: Set up GitHub connection, configured global Stop hook to auto-update work history, added Work History tracking to CLAUDE.md and moved log to this file.
- 2026-03-30: Replaced `11clicks` with `shell` in mouse-control patch, reformatting all commands as cliclick CLI calls. Clarified in CLAUDE.md that spec embedding is required whenever the Claude2Max workflow is used, not just when running the converter binary.
- 2026-03-31: Reviewed prior session work, verified WORK_HISTORY.md structure, and configured automatic work history updates for all Claude Code instances via stop hook.
- 2026-03-31: Created one-sound-a-day repo (local only — git server proxy restricts to Claude2Max; push manually). Original patch on main; JS-refactored branch `claude/js-refactor` replaces date/time/match/blink/newday logic with `v8 onesound.js`. Documented v8 object usage, external JS files, message routing, dialog/playlist~/umenu patterns in CLAUDE.md and SPEC_REFERENCE.md.
