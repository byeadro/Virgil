---
name: backend-patterns
description: API design, Supabase, database, caching, edge functions
trigger: auto
globs: ["**/api/**", "**/supabase/**", "**/*.sql", "**/edge-functions/**"]
---

# Backend Patterns

## Supabase Conventions

### Client Setup
```typescript
// lib/supabase/client.ts — browser client
import { createBrowserClient } from "@supabase/ssr";

export const createClient = () =>
  createBrowserClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  );

// lib/supabase/server.ts — server client  
import { createServerClient } from "@supabase/ssr";
import { cookies } from "next/headers";

export const createClient = () => {
  const cookieStore = cookies();
  return createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    { cookies: { /* cookie handlers */ } }
  );
};
```

### RLS Policies — MANDATORY
Every table with user data MUST have RLS enabled and policies defined:
```sql
ALTER TABLE my_table ENABLE ROW LEVEL SECURITY;

-- Users can only read their own data
CREATE POLICY "Users read own data" ON my_table
  FOR SELECT USING (auth.uid() = user_id);

-- Users can only insert their own data
CREATE POLICY "Users insert own data" ON my_table
  FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Users can only update their own data
CREATE POLICY "Users update own data" ON my_table
  FOR UPDATE USING (auth.uid() = user_id);

-- Users can only delete their own data
CREATE POLICY "Users delete own data" ON my_table
  FOR DELETE USING (auth.uid() = user_id);
```

### Database Migrations
- One migration per logical change
- Migration files are immutable after deployment
- Always include rollback SQL
- Test migrations against production data snapshot

## API Design

### Route Structure (Next.js App Router)
```
app/api/
  resource/
    route.ts          # GET (list), POST (create)
    [id]/route.ts     # GET (read), PATCH (update), DELETE (delete)
```

### Response Format
```typescript
// Success
return Response.json({ data: result }, { status: 200 });

// Error
return Response.json(
  { error: { code: "NOT_FOUND", message: "Resource not found" } },
  { status: 404 }
);

// Validation error
return Response.json(
  { error: { code: "VALIDATION_ERROR", message: "Invalid input", details: errors } },
  { status: 400 }
);
```

### Error Handling
- Never expose internal errors to clients
- Log full errors server-side, return sanitized messages to client
- Use typed error codes, not just HTTP status codes
- Always validate request body with Zod or similar
