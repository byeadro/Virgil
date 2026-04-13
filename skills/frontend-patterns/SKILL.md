---
name: frontend-patterns
description: Next.js 14+ App Router, React, TypeScript, Tailwind CSS patterns
trigger: auto
globs: ["**/*.tsx", "**/*.jsx", "**/*.css", "app/**/*", "components/**/*"]
---

# Frontend Patterns

## Next.js App Router Conventions

### File Structure
```
app/
  layout.tsx          # Root layout (providers, global styles)
  page.tsx            # Home page
  (auth)/
    login/page.tsx    # Route groups for shared layouts
    signup/page.tsx
  dashboard/
    layout.tsx        # Dashboard-specific layout
    page.tsx          # Dashboard home
    settings/page.tsx
components/
  ui/                 # Reusable UI primitives (Button, Input, Card)
  features/           # Feature-specific components
  layouts/            # Layout components
lib/
  supabase/           # Supabase client, types, helpers
  utils.ts            # Pure utility functions
  hooks/              # Custom React hooks
```

### Server vs Client Components
- **Default to Server Components** — They're the default in App Router. No `"use client"` unless needed.
- **Use Client Components when**: useState, useEffect, event handlers, browser APIs, React context
- **Keep client components small** — Extract the interactive part into a client component, keep the rest server-side.

### Data Fetching
- Server Components: fetch directly, no useEffect
- Client Components: React Query or SWR for caching and revalidation
- Never fetch in useEffect without cleanup and race condition handling

## React Patterns

### Component Structure
```typescript
// 1. Imports
import { type FC } from "react";

// 2. Types
interface Props {
  title: string;
  onAction: () => void;
}

// 3. Component
export const FeatureCard: FC<Props> = ({ title, onAction }) => {
  // hooks first
  const [isOpen, setIsOpen] = useState(false);
  
  // derived state
  const displayTitle = title.toUpperCase();
  
  // handlers
  const handleClick = () => {
    setIsOpen(true);
    onAction();
  };
  
  // render
  return (
    <div className="rounded-lg border p-4">
      <h3>{displayTitle}</h3>
      <button onClick={handleClick}>Open</button>
    </div>
  );
};
```

### State Management
- **Local state** — useState for component-scoped state
- **URL state** — useSearchParams for filterable/shareable state
- **Server state** — React Query/SWR for API data
- **Global state** — React Context for auth/theme. Zustand only if Context isn't enough.
- **Never** — Redux for new projects. It's overkill for most apps.

## Tailwind CSS
- Use design tokens: `text-sm`, `p-4`, `rounded-lg` — not arbitrary values
- Extract repeated patterns into components, not `@apply` classes
- Dark mode: use `dark:` prefix, configure in tailwind.config
- Responsive: mobile-first (`sm:`, `md:`, `lg:` are min-width breakpoints)
