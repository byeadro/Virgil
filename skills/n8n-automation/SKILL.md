---
name: n8n-automation
description: n8n workflow patterns for outreach, data pipelines, and integrations
trigger: manual
---

# n8n Automation Patterns

## Workflow Architecture
- One workflow per concern (outreach, data sync, notifications)
- Use sub-workflows for reusable logic
- Error handling on every HTTP node
- Webhook triggers for real-time, Schedule triggers for batch

## Outreach Workflow Pattern
```
Schedule Trigger (daily)
  → Google Sheets: Read contacts (filter: status = "pending")
  → Loop: For each contact
    → IF: Has email?
      → Gmail: Send personalized email
      → Google Sheets: Update status = "sent", add timestamp
    → ELSE:
      → Google Sheets: Update status = "needs_email"
  → Gmail: Send summary to self
```

## Data Pipeline Pattern
```
Webhook Trigger (or Schedule)
  → HTTP Request: Fetch data from source
  → Code Node: Transform/clean data
  → IF: Valid data?
    → Supabase: Upsert records
    → Slack: Notify success
  → ELSE:
    → Slack: Notify error with details
```

## Best Practices
- Always add error handling workflows (Error Trigger node)
- Use credentials, never hardcode API keys in Code nodes
- Test with small batches before running full lists
- Add rate limiting (Wait nodes) for API-heavy workflows
- Log everything to a Google Sheet for debugging
- Use the Code node for complex transforms, not long IF chains

## Common Integrations
- Google Sheets ↔ Supabase (data sync)
- Gmail → Google Sheets (outreach tracking)
- Webhook → Supabase → Email (event-driven notifications)
- Schedule → HTTP → Slack (monitoring)
