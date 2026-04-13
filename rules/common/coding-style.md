---
description: "Universal coding principles — always active"
alwaysApply: true
---

# Common Rules

## Code Quality
- Files must be under 800 lines. Split into focused modules if larger.
- Functions must be under 50 lines. Extract helpers if longer.
- One component/class per file.
- No dead code. No commented-out code. Delete it — git remembers.
- No `any` type in TypeScript. Use proper types or `unknown` with type guards.

## Naming
- Files: kebab-case (`user-profile.tsx`)
- Components: PascalCase (`UserProfile`)
- Functions/variables: camelCase (`getUserProfile`)
- Constants: UPPER_SNAKE_CASE (`MAX_RETRY_COUNT`)
- Types/Interfaces: PascalCase (`UserProfile`)
- Database tables: snake_case (`user_profiles`)

## Error Handling
- Never swallow errors with empty catch blocks.
- Always log the actual error, then return a user-friendly message.
- Use typed error classes for domain errors.
- API errors return structured JSON, not raw strings.

## Git
- Conventional commits: `feat:`, `fix:`, `refactor:`, `docs:`, `test:`, `chore:`
- One logical change per commit.
- Never commit: `.env`, `node_modules`, `.DS_Store`, secrets, build artifacts.
- Write meaningful commit messages — future you will thank present you.

## Documentation
- Every exported function needs a JSDoc comment explaining what it does and why.
- Every API endpoint needs a comment with the request/response shape.
- Complex logic needs a comment explaining the WHY (the code shows the WHAT).
- Update README when adding features that change usage.

## Testing
- TDD: write tests first.
- Target 80%+ coverage on new code.
- Test behavior, not implementation details.
- Use descriptive test names that read like specifications.

## Security
- Validate all user input server-side.
- Use parameterized queries (no string concatenation in SQL).
- Never log sensitive data (passwords, tokens, PII).
- Use environment variables for all secrets.
