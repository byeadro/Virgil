---
name: search-first
description: Research-before-coding workflow — check docs and prior art first
trigger: auto
---

# Search First

## Rule
Before writing ANY new code, search for:
1. **Existing code** — Does this project already have something similar? `grep -rn` and `glob`.
2. **Library solutions** — Is there a well-maintained package that does this?
3. **Documentation** — What do the official docs say about this pattern?
4. **Prior art** — Has this been solved before in a way we can learn from?

## Search Order
1. Current codebase (Grep/Glob)
2. Project dependencies (check what's already installed)
3. Official documentation (framework docs, library docs)
4. npm/community packages (only if no existing solution)

## When to Write New Code
Only after confirming:
- No existing utility in the codebase handles this
- No installed dependency provides this
- The official docs don't recommend a different approach
- Building it ourselves is justified (simpler, fewer dependencies, better fit)

## Anti-Patterns
- Reinventing `lodash.debounce` because you didn't check
- Building a date formatter when `date-fns` is already installed
- Writing custom auth middleware when Supabase Auth handles it
- Creating a new API pattern when the project has an established one
