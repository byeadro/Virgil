---
name: verify
description: Run the full verification loop — build, typecheck, lint, test, security
---

Run the complete verification pipeline:
1. npm run build
2. npx tsc --noEmit
3. npx eslint . --ext .ts,.tsx,.js,.jsx
4. npm test
5. npm audit --production

Report pass/fail for each step.

Usage: /verify
