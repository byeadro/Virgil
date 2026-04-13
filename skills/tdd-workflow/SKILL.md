---
name: tdd-workflow
description: Test-driven development workflow with 80%+ coverage target
trigger: auto
---

# TDD Workflow

## When This Triggers
Automatically when implementing any new feature, fixing a bug, or modifying existing behavior.

## The Cycle

### RED — Write a Failing Test
1. Identify the behavior to implement
2. Write a test that describes the expected behavior
3. Run the test — it MUST fail
4. If it passes, the test is wrong or the feature already exists

### GREEN — Minimal Implementation
1. Write the MINIMUM code to make the test pass
2. No extra features. No optimization. Just green.
3. Run the test — it MUST pass now

### REFACTOR — Clean Up
1. Improve code quality without changing behavior
2. Extract functions, rename variables, remove duplication
3. Run tests after EVERY change — they must stay green

## Coverage Target
- New code: 80%+ line coverage
- Critical paths (auth, payments, data mutations): 95%+
- Utility functions: 100%

## Test Types by Priority
1. **Unit tests** — Pure functions, utilities, business logic
2. **Integration tests** — API routes, database operations, auth flows
3. **E2E tests** — Critical user journeys (sign up, core feature, payment)

## Verification Command
```bash
npm test -- --coverage
```
