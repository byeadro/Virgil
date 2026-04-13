---
name: spec-driven-dev
description: Spec before code — design before implementation
trigger: auto
---

# Spec-Driven Development

## Core Rule
Never write implementation code until a specification exists and is approved.

## When a User Asks to Build Something

### Step 1: Clarify
Ask questions to understand:
- What problem does this solve?
- Who uses it?
- What does success look like?
- What are the constraints (time, tech, budget)?
- What's explicitly out of scope?

### Step 2: Write the Spec
Produce a structured specification:

```markdown
# Feature Spec: [Name]

## Problem Statement
[One paragraph — what problem exists and for whom]

## Proposed Solution
[One paragraph — what we're building]

## User Stories
- As a [role], I want [action], so that [benefit]

## Acceptance Criteria
- [ ] [Specific, testable criterion]
- [ ] [Another criterion]

## Technical Approach
- [High-level technical decisions]

## Out of Scope
- [What we're NOT building]

## Open Questions
- [Things we need to decide]
```

### Step 3: Present for Review
Show the spec in chunks small enough to actually read:
1. Problem + Solution (get alignment on the "what")
2. User Stories + Acceptance Criteria (get alignment on the "done")
3. Technical Approach (get alignment on the "how")

### Step 4: Get Approval
Wait for explicit approval before proceeding to implementation planning.

## Why This Matters
- Prevents building the wrong thing (most expensive mistake)
- Creates shared understanding before code exists
- Acceptance criteria become test cases
- Out of scope prevents scope creep
- Open questions surface blockers early
