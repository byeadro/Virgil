---
description: "Git workflow and commit conventions"
alwaysApply: true
---

# Git Workflow

## Commit Format
```
type(scope): description

[optional body]
[optional footer]
```

Types: `feat`, `fix`, `refactor`, `docs`, `test`, `chore`, `perf`, `ci`

Examples:
- `feat(auth): add OAuth2 login with Google`
- `fix(dashboard): prevent crash on empty data set`
- `refactor(api): extract validation middleware`
- `test(auth): add tests for token refresh flow`

## Branch Naming
- `feat/short-description`
- `fix/short-description`
- `refactor/short-description`

## PR Process
1. Create feature branch from `main`
2. Implement with TDD
3. Run verification loop (build, test, lint, typecheck)
4. Self-review the diff
5. Open PR with description of what and why
6. Address review feedback
7. Squash merge to main

## Never Commit
- `.env` or `.env.local` (use `.env.example` with placeholder values)
- `node_modules/`
- Build artifacts (`dist/`, `.next/`, `out/`)
- IDE files (`.idea/`, `.vscode/settings.json` with personal settings)
- OS files (`.DS_Store`, `Thumbs.db`)
- Secrets, API keys, tokens
