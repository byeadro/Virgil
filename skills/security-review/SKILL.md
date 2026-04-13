---
name: security-review
description: Comprehensive security checklist for every PR and deployment
trigger: before-merge
---

# Security Review

## Mandatory Checks

### Authentication
- [ ] All protected routes require valid auth token
- [ ] Tokens have appropriate expiration
- [ ] Refresh token rotation is implemented
- [ ] Password reset flow is secure (time-limited, single-use tokens)
- [ ] OAuth state parameter prevents CSRF

### Authorization
- [ ] Supabase RLS policies on ALL tables with user data
- [ ] Row-level checks: users can only access their own data
- [ ] Admin routes require admin role verification
- [ ] API endpoints validate resource ownership before mutations

### Input Validation
- [ ] All user input is validated server-side (client validation is UX, not security)
- [ ] SQL queries use parameterized statements (Supabase handles this, but check raw queries)
- [ ] File uploads validate type, size, and content
- [ ] URL parameters are sanitized before use

### Secrets Management
- [ ] No API keys, passwords, or tokens in source code
- [ ] `.env` files are in `.gitignore`
- [ ] Environment variables used for all secrets
- [ ] Different secrets for dev/staging/production

### Headers & Transport
- [ ] HTTPS enforced in production
- [ ] CORS configured to allow only expected origins
- [ ] Security headers set: X-Content-Type-Options, X-Frame-Options, CSP
- [ ] Cookies use Secure, HttpOnly, SameSite flags

### Dependencies
- [ ] `npm audit` shows no critical/high vulnerabilities
- [ ] Dependencies are reasonably up to date
- [ ] No unnecessary dependencies (attack surface reduction)

## Quick Scan Commands
```bash
# Secrets in code
grep -rn "sk_\|pk_\|ghp_\|AKIA\|password\s*=" --include="*.ts" --include="*.tsx" --include="*.js" --include="*.env*" .

# Dependency vulnerabilities
npm audit --production

# Outdated packages
npm outdated
```
