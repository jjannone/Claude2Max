# Task Queue

Pending tasks for future sessions. Claude reads this at session start and
reports any incomplete items to the user before beginning other work.

Format: `- [ ]` = pending, `- [x]` = complete (move to Done section).

## Pending

- [ ] **Extended `RefpageCache` metadata** — extend `RefpageCache` in `spec2maxpat.py` to cache the following from each maxref.xml, in addition to I/O counts:
  - **Attributes** — name, type, default, valid values/enums, get/set permissions. Makes attribute verification programmatic rather than manual.
  - **Messages** — what messages each object accepts, with argument names and types. Enables validation that message boxes and connections are sending what an object can receive.
  - **Arguments** — typed creation-time arguments (e.g. `metro 500`). Enables validation of object text in specs.
  - **Output descriptions** — what each outlet actually outputs (from `<misc name="Output">`). Enables connection type checking.
  - **See-also** — related objects. Useful for suggesting alternatives when an object isn't found.

- [ ] **Presentation layout engine + screenshot verification** — build a layout engine that computes presentation_rects automatically from logical positions and sizes, so layout is mathematically correct before conversion. Follow up with a screenshot (patching view + presentation view) to catch visual issues the math can't detect. Requires computer-use MCP enabled.

## Done

<!-- Completed tasks moved here with [x] and a completion date -->
