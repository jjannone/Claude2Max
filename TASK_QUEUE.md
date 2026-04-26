# Task Queue

Pending tasks for future sessions. Claude reads this at session start and
reports any incomplete items to the user before beginning other work.

Format: `- [ ]` = pending, `- [x]` = complete (move to Done section).

## Pending

- [ ] **Attribute metadata in `RefpageCache`** — extend `RefpageCache` in `spec2maxpat.py` to also return attribute metadata (name, type, default, valid values/enums) from the maxref.xml. This makes attribute verification programmatic rather than manual, directly supporting the "always check the docs" rule.

- [ ] **Presentation layout engine + screenshot verification** — build a layout engine that computes presentation_rects automatically from logical positions and sizes, so layout is mathematically correct before conversion. Follow up with a screenshot (patching view + presentation view) to catch visual issues the math can't detect. Requires computer-use MCP enabled.

## Done

<!-- Completed tasks moved here with [x] and a completion date -->
