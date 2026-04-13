---
name: supabase-patterns
description: Supabase-specific patterns — RLS, auth, edge functions, realtime, storage
trigger: auto
globs: ["**/supabase/**", "**/*.sql", "**/migrations/**"]
---

# Supabase Patterns

## Auth Flow
```typescript
// Sign up
const { data, error } = await supabase.auth.signUp({
  email,
  password,
  options: { data: { full_name: name } }
});

// Sign in
const { data, error } = await supabase.auth.signInWithPassword({ email, password });

// Get current user (server-side)
const { data: { user } } = await supabase.auth.getUser();

// Protected route check
if (!user) return Response.json({ error: "Unauthorized" }, { status: 401 });
```

## Type Generation
Always regenerate types after schema changes:
```bash
npx supabase gen types typescript --local > lib/supabase/database.types.ts
```

Use generated types everywhere:
```typescript
import { Database } from "@/lib/supabase/database.types";
type Profile = Database["public"]["Tables"]["profiles"]["Row"];
type InsertProfile = Database["public"]["Tables"]["profiles"]["Insert"];
```

## Edge Functions
```typescript
// supabase/functions/my-function/index.ts
import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

serve(async (req) => {
  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
  );
  
  // Verify the user
  const authHeader = req.headers.get("Authorization")!;
  const { data: { user } } = await supabase.auth.getUser(
    authHeader.replace("Bearer ", "")
  );
  
  if (!user) return new Response("Unauthorized", { status: 401 });
  
  // Your logic here
  return new Response(JSON.stringify({ success: true }), {
    headers: { "Content-Type": "application/json" },
  });
});
```

## Realtime Subscriptions
```typescript
const channel = supabase
  .channel("my-channel")
  .on("postgres_changes", {
    event: "INSERT",
    schema: "public",
    table: "messages",
    filter: `room_id=eq.${roomId}`,
  }, (payload) => {
    // Handle new message
  })
  .subscribe();

// Always clean up
return () => supabase.removeChannel(channel);
```

## Common Mistakes
- Forgetting RLS policies (data exposed to all authenticated users)
- Using service role key on the client (bypasses RLS)
- Not handling auth state changes (user logs out, subscriptions persist)
- Storing files without RLS on storage buckets
