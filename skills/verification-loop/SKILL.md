---
name: verification-loop
description: Build, test, lint, typecheck, and security check pipeline
trigger: after-implementation
---

# Verification Loop

## When This Triggers
After any implementation task is complete. Run the full loop before marking a task done.

## The Loop

### Step 1: Build
```bash
npm run build
```
Must exit 0. If it fails, fix before proceeding.

### Step 2: Type Check
```bash
npx tsc --noEmit
```
Zero type errors. Fix all errors — no `@ts-ignore` without documented reason.

### Step 3: Lint
```bash
npx eslint . --ext .ts,.tsx,.js,.jsx
```
Fix all errors. Warnings are acceptable if documented.

### Step 4: Test
```bash
npm test
```
All tests pass. No skipped tests without documented reason.

### Step 5: Security
```bash
npm audit --production
grep -rn "password\|secret\|api_key" --include="*.ts" --include="*.tsx" --include="*.env*"
```
No critical/high vulnerabilities. No secrets in code.

## Pass/Fail

ALL five steps must pass. If any step fails:
1. Fix the issue
2. Re-run the ENTIRE loop (not just the failed step)
3. Report results

## Output Format
```
Verification Loop Results:
  Build:     ✅ PASS
  TypeCheck: ✅ PASS
  Lint:      ✅ PASS (2 warnings)
  Tests:     ✅ PASS (47 passing, 0 failing)
  Security:  ✅ PASS
  
  Overall: ✅ ALL CLEAR
```
