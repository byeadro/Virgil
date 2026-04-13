# Virgil Agents

This file is the universal cross-tool agent manifest. It is read by Claude Code, Cursor, Codex, OpenCode, and Gemini CLI.

## Agent Routing

When working on a task, delegate to the most specific agent available:

### Planning & Architecture
- **planner** — Creates implementation plans from specs. Breaks features into ordered, testable tasks.
- **architect** — Makes system design decisions. Database schema, API contracts, service boundaries.
- **gsd-planner** — GSD-style phase planning with task breakdown and goal-backward verification.
- **gsd-roadmapper** — Creates project roadmaps with phase breakdown and requirement mapping.
- **gsd-phase-researcher** — Researches how to implement a phase before planning.
- **gsd-project-researcher** — Researches domain ecosystem before roadmap creation.
- **gsd-research-synthesizer** — Synthesizes research outputs from parallel researcher agents.
- **gsd-framework-selector** — Evaluates and selects frameworks for a project.
- **gsd-pattern-mapper** — Maps codebase patterns and conventions.

### Implementation & Execution
- **tdd-guide** — Enforces test-driven development. RED -> GREEN -> REFACTOR cycle.
- **loop-operator** — Runs autonomous implementation loops across multiple tasks.
- **gsd-executor** — Executes GSD plans with atomic commits and checkpoint protocols.
- **gsd-code-fixer** — Fixes code issues identified during reviews or builds.
- **gsd-debugger** — Investigates bugs using scientific method with debug sessions.
- **gsd-debug-session-manager** — Manages persistent debug sessions and checkpoints.

### Quality & Review
- **code-reviewer** — Reviews code for quality, security, maintainability. Checks for anti-patterns.
- **security-reviewer** — OWASP Top 10 audit. Checks auth, RLS, input validation, secrets exposure.
- **typescript-reviewer** — TypeScript/JavaScript specific review. Type safety, React patterns.
- **python-reviewer** — Python specific review. PEP 8, type hints, security.
- **go-reviewer** — Go specific review. Idiomatic Go, concurrency, error handling.
- **database-reviewer** — Database schema review. Supabase RLS, query optimization.
- **gsd-code-reviewer** — GSD-style code review with phase context awareness.
- **gsd-security-auditor** — Security audit across phase changes.
- **gsd-plan-checker** — Verifies plans will achieve phase goals before execution.
- **gsd-ui-checker** — Validates UI design contracts against quality dimensions.
- **gsd-ui-auditor** — Retroactive visual audit of implemented frontend code.
- **gsd-nyquist-auditor** — Fills validation gaps by generating tests and verifying coverage.
- **gsd-eval-auditor** — Evaluates and audits completed work.
- **gsd-eval-planner** — Plans evaluation strategies for completed phases.

### Verification & Integration
- **gsd-verifier** — Verifies phase goal achievement through goal-backward analysis.
- **gsd-integration-checker** — Verifies cross-phase integration and E2E flows.
- **gsd-doc-verifier** — Verifies documentation accuracy and completeness.

### Documentation & Research
- **doc-updater** — Keeps documentation in sync with code changes.
- **docs-lookup** — Looks up documentation, API references, library docs.
- **gsd-doc-writer** — Writes structured documentation for completed phases.
- **gsd-domain-researcher** — Deep domain research for project requirements.
- **gsd-ai-researcher** — AI-specific research for implementation decisions.
- **gsd-advisor-researcher** — Researches gray area decisions with structured comparisons.
- **gsd-assumptions-analyzer** — Analyzes codebase for assumptions with evidence.
- **gsd-intel-updater** — Updates project intelligence and context.

### Codebase Analysis
- **gsd-codebase-mapper** — Explores codebase and writes structured analysis documents.
- **gsd-ui-researcher** — Produces UI design contracts for frontend phases.
- **gsd-user-profiler** — Analyzes developer behavioral profiles.

### Maintenance & Operations
- **build-error-resolver** — Fixes build errors. Reads error output, identifies root cause.
- **refactor-cleaner** — Removes dead code, unused imports, redundant abstractions.
- **e2e-runner** — Generates and runs Playwright end-to-end tests.
- **harness-optimizer** — Analyzes and improves agent harness configuration.
- **chief-of-staff** — Personal communication triage across email, Slack, LINE, Messenger.

## Counts

- **Total agents: 48**
- Core (ECC + Superpowers): 17
- GSD specialized: 31

## Usage

Agents are invoked by referencing them in conversation or via slash commands:
- `/plan "Add user authentication"` -> routes to planner
- `/tdd` -> routes to tdd-guide
- `/code-review` -> routes to code-reviewer
- `/build-fix` -> routes to build-error-resolver
- `/security-scan` -> routes to security-reviewer
- `/write-plan` -> routes to Superpowers writing-plans skill
- `/execute-plan` -> routes to Superpowers executing-plans skill
- `/brainstorm` -> routes to Superpowers brainstorming skill
