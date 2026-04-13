---
name: context-engineering
description: Anti-context-rot patterns — keeps output quality high across long sessions
trigger: auto
---

# Context Engineering

## The Problem
As Claude's context window fills, output quality degrades. This is "context rot" — the agent starts hallucinating, forgetting instructions, producing generic code, and losing track of the project structure.

## Prevention Strategies

### 1. Structured Session Phases
Every session follows phases. Don't mix them:
- **Research phase** — Read files, understand codebase, gather information
- **Planning phase** — Create specs and implementation plans
- **Implementation phase** — Write code following the plan
- **Review phase** — Verify, test, review

**Compact between phases.** Research context is noise during implementation.

### 2. Context Budget Awareness
- Monitor usage with `/cost`
- At 40% usage: evaluate what's in context — is it all relevant?
- At 50%: auto-compact triggers (with `CLAUDE_AUTOCOMPACT_PCT_OVERRIDE=50`)
- At 60%: manually compact with `/compact` and a summary of what to preserve
- At 80%: STOP and start a fresh session with a handoff document

### 3. Handoff Documents
When context is getting full, write a handoff document before compacting or starting a new session:

```markdown
# Session Handoff

## What Was Done
- [completed tasks]

## Current State
- [what's working, what's broken]

## What's Next
- [remaining tasks from the plan]

## Key Decisions Made
- [architecture choices, tradeoffs accepted]

## Files Modified
- [list of changed files and why]
```

### 4. Working Context File
Maintain a `WORKING-CONTEXT.md` in the project root that tracks:
- Current sprint/feature being built
- Active implementation plan
- Known issues and blockers
- Environment setup notes

This file is read at session start so context is instantly restored.

### 5. Avoid Context Waste
- Don't dump entire files into context when you only need a function
- Use Grep/Glob to find specific content instead of Read on large files
- Don't repeat information that's already in context
- Don't ask Claude to re-explain things it already explained
