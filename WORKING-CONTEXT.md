# Working Context

## Project: Virgil
## Status: v1.0 — Initial merged release
## Last Updated: 2026-04-13

## What This Is
Unified AI development operating system combining Everything Claude Code, Superpowers, and Get Shit Done.

## Current State
- All three repos merged into single project
- Hooks unified into single hooks/hooks.json (14 hook scripts)
- Agents deduplicated and categorized (48 total)
- Skills integrated (36 total)
- Commands consolidated (9 core + 73 GSD)
- GSD context engine installed at get-shit-done/
- Install script updated for full merged structure
- CLAUDE.md rewritten as master brain with skill auto-routing
- AGENTS.md rewritten with full routing guide

## Architecture
- `CLAUDE.md` — Master instruction file, read every message. Skill auto-routing table.
- `AGENTS.md` — Agent manifest with routing guide.
- `agents/` — 48 agent definitions (17 core + 31 GSD).
- `skills/` — 36 workflow skills (12 Virgil + 14 Superpowers + 10 ECC).
- `commands/` — 9 core + 73 GSD slash commands.
- `hooks/hooks.json` — Unified hook config referencing scripts/hooks/.
- `scripts/hooks/` — 14 hook implementations (5 Virgil + 9 GSD).
- `get-shit-done/` — GSD context engine (workflows, contexts, templates, references).
- `rules/` — Common + TypeScript coding standards.
- `contexts/` — Dev, research, review output profiles.

## Key Integration Points
- Superpowers skills are invoked via Skill tool: brainstorm, write-plan, execute-plan
- GSD hooks monitor context window and inject warnings at 35%/25% remaining
- Session start loads both Virgil working context AND GSD project state
- Commit validation enforces conventional commits format

## Next Steps
- Test the full workflow: /brainstorm -> spec -> /write-plan -> plan -> /execute-plan -> implement -> /verify
- Test autonomous loop with loop-operator + subagent-driven-development
- Test context management across long sessions (GSD context monitor)
- Test GSD commands: /gsd:new-project, /gsd:plan-phase, /gsd:execute-phase
- Publish to GitHub and test install.sh on a fresh machine
