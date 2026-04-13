# Project: My SaaS App

## Stack
- Next.js 14 (App Router) + TypeScript + Tailwind CSS
- Supabase (PostgreSQL, Auth, RLS, Edge Functions)
- Vercel (deployment)
- Stripe (payments)

## Architecture
- `/app` — Next.js App Router pages and API routes
- `/components` — React components (ui/ for primitives, features/ for domain)
- `/lib` — Utilities, Supabase client, hooks, types
- `/supabase` — Migrations, edge functions, seed data

## Current Sprint
- [ ] User authentication (email + OAuth)
- [ ] Dashboard with analytics
- [ ] Billing integration (Stripe)

## Environment Variables Required
```
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
STRIPE_SECRET_KEY=
STRIPE_WEBHOOK_SECRET=
NEXT_PUBLIC_APP_URL=
```

## Commands
```bash
npm run dev        # Start dev server
npm run build      # Production build
npm test           # Run tests
npx tsc --noEmit   # Type check
```

## Conventions
- All database tables have RLS enabled
- All API routes validate auth before processing
- All user input validated with Zod
- TDD for all business logic
