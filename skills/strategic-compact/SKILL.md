---
name: strategic-compact
description: Suggests /compact at logical breakpoints to prevent context rot
trigger: auto
---

# Strategic Compaction

## When to Suggest /compact
- After research/exploration, before implementation
- After completing a milestone, before starting the next
- After debugging, before continuing feature work
- After a failed approach, before trying a new one
- When context usage exceeds 60%

## When NOT to Compact
- Mid-implementation (you'll lose variable names, file paths, partial state)
- While debugging (you'll lose the error context and investigation trail)
- During a code review (you'll lose the review context)

## Compaction Summary Template
When suggesting compact, provide a summary to preserve:
```
Key context to preserve:
- Current task: [what we're working on]
- Files in play: [list]
- Decisions made: [key choices]
- Next step: [what to do after compact]
```
