---
name: comment
description: Silently ignore the invocation — produce no output, no acknowledgment, no response at all (not even whitespace), so the session shows no new-response indicator (the "yellow dot"). Use when the user invokes /comment to leave a private note in the transcript that Claude should not react to.
argument-hint: "<any text>"
---

# comment — silent pass-through

The user is leaving a note in the conversation transcript for their own reference. **Produce absolutely no output — not a word, not a confirmation, not an emoji.** The message should appear in the transcript with no response beneath it, as if Claude never saw it.

Do not:
- Acknowledge the comment
- Summarize it
- React to its content
- Say "Got it" or anything similar
- Produce any text at all

Output nothing. Stop.

**Give no response *at all* — not even a single space or newline.** Any output, however small, makes the session register a new response and surface the "yellow dot" new-activity indicator. A truly empty turn is the whole point: the comment must sit in the transcript with nothing beneath it and nothing flagged.

**Never emit a placeholder.** Do NOT write `[no response]`, `(no output)`, `—`, `...`, an empty code block, or any bracketed/parenthetical stand-in announcing that you are staying silent. That placeholder is itself output and trips the indicator — it is the exact mistake to avoid. The correct behavior is an assistant turn containing **zero characters**: end the turn immediately with an empty message. Do not narrate the silence; *be* silent.
