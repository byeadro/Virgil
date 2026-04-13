---
description: "TypeScript and JavaScript coding standards"
globs: ["**/*.ts", "**/*.tsx", "**/*.js", "**/*.jsx"]
alwaysApply: false
---

# TypeScript Rules

## Strict Mode
- `strict: true` in tsconfig.json — non-negotiable
- No `any` type. Use `unknown` with type guards, generics, or proper typing.
- No `@ts-ignore` without a comment explaining why it's necessary.

## Imports
- Use path aliases (`@/components/...`) instead of relative paths beyond 2 levels.
- Sort imports: external packages → internal aliases → relative → types
- No unused imports. No barrel re-exports that aren't used.

## React Patterns
- Prefer `FC<Props>` for typed functional components.
- Destructure props at the function signature level.
- Use `useState` initializer functions for expensive computations.
- Clean up effects: return cleanup functions in `useEffect`.
- No inline function definitions in JSX for callbacks that don't depend on render scope.

## Next.js Specifics
- Default to Server Components. Add `"use client"` only when state/effects are needed.
- Use `generateMetadata` for SEO, not hardcoded `<head>` tags.
- Data fetching in Server Components, not `useEffect`.
- Use `loading.tsx` and `error.tsx` for route-level states.

## Type Definitions
```typescript
// Prefer interfaces for objects
interface User {
  id: string;
  name: string;
  email: string;
}

// Use type for unions, intersections, and computed types
type Status = "active" | "inactive" | "pending";
type ApiResponse<T> = { data: T; error: null } | { data: null; error: string };
```

## Async Patterns
- Always handle errors in async functions (try/catch or .catch)
- Use `Promise.all` for concurrent independent operations
- Use `Promise.allSettled` when some failures are acceptable
- Never fire-and-forget promises without error handling
