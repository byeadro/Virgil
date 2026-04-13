# Virgil Agents

48 specialized agents. Route work to the right specialist.

## Routing Guide

| User Says | Use Agent |
|-----------|-----------|
| "Plan this feature" | planner |
| "Design the architecture" | architect |
| "Write tests first" | tdd-guide |
| "Review this code" | code-reviewer |
| "Check for security issues" | security-reviewer |
| "Fix the build" | build-error-resolver |
| "Run this autonomously" | loop-operator |
| "Review my TypeScript" | typescript-reviewer |
| "Review my Python" | python-reviewer |
| "Review my Go" | go-reviewer |
| "Check the database schema" | database-reviewer |
| "Run E2E tests" | e2e-runner |
| "Clean up dead code" | refactor-cleaner |
| "Update the docs" | doc-updater |
| "Look up the API docs" | docs-lookup |
| "Optimize the harness" | harness-optimizer |
| "Triage my messages" | chief-of-staff |
| "Start a new GSD project" | gsd-roadmapper |
| "Plan this phase" | gsd-planner |
| "Execute the plan" | gsd-executor |
| "Debug this issue" | gsd-debugger |
| "Verify the phase is done" | gsd-verifier |
| "Review code (GSD style)" | gsd-code-reviewer |
| "Security audit (GSD)" | gsd-security-auditor |

## Planning & Architecture

| Agent | Description |
|-------|-------------|
| **planner** | Creates implementation plans from specs. Breaks features into ordered, testable tasks. |
| **architect** | System design decisions. Database schema, API contracts, service boundaries. |
| **gsd-planner** | GSD phase planning with task breakdown and goal-backward verification. |
| **gsd-roadmapper** | Creates project roadmaps with phase breakdown and requirement mapping. |
| **gsd-phase-researcher** | Researches implementation approaches before planning. |
| **gsd-project-researcher** | Domain ecosystem research before roadmap creation. |
| **gsd-research-synthesizer** | Synthesizes outputs from parallel researcher agents. |
| **gsd-framework-selector** | Evaluates and selects frameworks. |
| **gsd-plan-checker** | Verifies plans will achieve phase goals before execution. |

## Implementation & Execution

| Agent | Description |
|-------|-------------|
| **tdd-guide** | Enforces RED -> GREEN -> REFACTOR cycle. |
| **loop-operator** | Autonomous implementation loops across multiple tasks. |
| **gsd-executor** | Executes GSD plans with atomic commits and checkpoints. |
| **gsd-code-fixer** | Fixes code issues from reviews or builds. |
| **gsd-debugger** | Bug investigation using scientific method. |
| **gsd-debug-session-manager** | Manages persistent debug sessions and checkpoints. |

## Quality & Review

| Agent | Description |
|-------|-------------|
| **code-reviewer** | Quality, security, maintainability. Anti-patterns. |
| **security-reviewer** | OWASP Top 10. Auth, RLS, input validation, secrets. |
| **typescript-reviewer** | TypeScript/JavaScript. Type safety, React patterns. |
| **python-reviewer** | Python. PEP 8, type hints, security. |
| **go-reviewer** | Go. Idiomatic patterns, concurrency, error handling. |
| **database-reviewer** | Database schema. Supabase RLS, query optimization. |
| **gsd-code-reviewer** | GSD-style review with phase context awareness. |
| **gsd-security-auditor** | Security audit across phase changes. |
| **gsd-ui-checker** | Validates UI design contracts. |
| **gsd-ui-auditor** | Retroactive visual audit of frontend code. |
| **gsd-nyquist-auditor** | Fills validation gaps, generates tests. |
| **gsd-eval-auditor** | Evaluates completed work quality. |
| **gsd-eval-planner** | Plans evaluation strategies. |

## Verification & Integration

| Agent | Description |
|-------|-------------|
| **gsd-verifier** | Phase goal verification through goal-backward analysis. |
| **gsd-integration-checker** | Cross-phase integration and E2E flow verification. |
| **gsd-doc-verifier** | Documentation accuracy and completeness checks. |

## Documentation & Research

| Agent | Description |
|-------|-------------|
| **doc-updater** | Keeps docs in sync with code changes. |
| **docs-lookup** | Library docs, API references via Context7. |
| **gsd-doc-writer** | Structured documentation for completed phases. |
| **gsd-domain-researcher** | Deep domain research for requirements. |
| **gsd-ai-researcher** | AI-specific implementation research. |
| **gsd-advisor-researcher** | Gray area decisions with structured comparisons. |
| **gsd-assumptions-analyzer** | Codebase assumptions analysis with evidence. |
| **gsd-intel-updater** | Project intelligence and context updates. |

## Codebase Analysis

| Agent | Description |
|-------|-------------|
| **gsd-codebase-mapper** | Structured codebase analysis documents. |
| **gsd-pattern-mapper** | Maps codebase patterns and conventions. |
| **gsd-ui-researcher** | UI design contracts for frontend phases. |
| **gsd-user-profiler** | Developer behavioral profile analysis. |

## Maintenance & Operations

| Agent | Description |
|-------|-------------|
| **build-error-resolver** | Reads error output, identifies root cause, applies fix. |
| **refactor-cleaner** | Dead code, unused imports, redundant abstractions. |
| **e2e-runner** | Generates and runs Playwright E2E tests. |
| **harness-optimizer** | Agent harness configuration optimization. |
| **chief-of-staff** | Communication triage: email, Slack, LINE, Messenger. |

## Duplicates Resolved

The following agents from different sources overlap. Both are kept because they serve different contexts:

- **planner** (Virgil core) vs **gsd-planner** (GSD) — planner is general-purpose; gsd-planner is GSD-workflow-specific with phase/milestone awareness. Both kept.
- **code-reviewer** (Virgil core) vs **gsd-code-reviewer** (GSD) — code-reviewer is standalone; gsd-code-reviewer produces structured REVIEW.md tied to GSD state. Both kept.
- **security-reviewer** (Virgil core) vs **gsd-security-auditor** (GSD) — security-reviewer is OWASP-focused; gsd-security-auditor verifies threat mitigations from PLAN.md. Both kept.

No true duplicates found — all GSD agents are prefixed `gsd-` and serve the GSD workflow specifically.
