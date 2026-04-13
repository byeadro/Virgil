---
name: build-fix
description: Fix build errors by reading output, finding root cause, applying fix
agent: build-error-resolver
---

Fix the current build error. Read the full error output, identify root cause, apply minimal fix, verify with build + typecheck.

Usage: /build-fix
