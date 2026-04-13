# Virgil Agents

This file is the universal cross-tool agent manifest. It is read by Claude Code, Cursor, Codex, OpenCode, and Gemini CLI.

## Agent Routing

When working on a task, delegate to the most specific agent available:

### Planning & Architecture
- **planner** — Creates implementation plans from specs. Breaks features into ordered, testable tasks.
- **architect** — Makes system design decisions. Database schema, API contracts, service boundaries.
- **spec-writer** — Converts user requirements into structured specifications with acceptance criteria.

### Implementation
- **tdd-guide** — Enforces test-driven development. RED → GREEN → REFACTOR cycle.
- **loop-operator** — Runs autonomous implementation loops across multiple tasks without human intervention.

### Quality & Review
- **code-reviewer** — Reviews code for quality, security, maintainability. Checks for anti-patterns.
- **security-reviewer** — OWASP Top 10 audit. Checks auth, RLS, input validation, secrets exposure.
- **typescript-reviewer** — TypeScript/JavaScript specific review. Type safety, React patterns, Next.js conventions.
- **database-reviewer** — Database schema review. Supabase RLS policies, query optimization, migration safety.

### Maintenance
- **build-error-resolver** — Fixes build errors. Reads error output, identifies root cause, applies fix.
- **refactor-cleaner** — Removes dead code, unused imports, redundant abstractions.
- **doc-updater** — Keeps documentation in sync with code changes.
- **e2e-runner** — Generates and runs Playwright end-to-end tests.

### Research
- **docs-lookup** — Looks up documentation, API references, library docs before writing code.
- **search-first** — Forces research-before-coding workflow. Checks existing solutions before inventing.

## Usage

Agents are invoked by referencing them in conversation or via slash commands:
- `/plan "Add user authentication"` → routes to planner
- `/tdd` → routes to tdd-guide  
- `/code-review` → routes to code-reviewer
- `/build-fix` → routes to build-error-resolver
- `/security-scan` → routes to security-reviewer
