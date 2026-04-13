# VIRGIL

**The AI co-founder operating system. Spec first. Build right. Ship fast.**

Built for non-technical founders who build with AI. Combines the best of three systems:

| Source | Stars | What Virgil Takes |
|--------|-------|-------------------|
| [Everything Claude Code](https://github.com/affaan-m/everything-claude-code) | 153k | Agents, skills, hooks, rules, security, cross-platform |
| [Superpowers](https://github.com/obra/superpowers) | 149k | Spec-driven workflow, autonomous subagent loops |
| [Get Shit Done](https://github.com/gsd-build/get-shit-done) | 49k | Context engineering, anti-context-rot, meta-prompting |

**What Virgil adds**: A founder-operator layer (investor updates, outreach, GTM, content), Supabase-deep patterns, n8n automation skills, and a context management system that prevents quality degradation across long sessions.

---

## Quick Start

### Option 1: Clone and Install (Recommended)

```bash
git clone https://github.com/yourusername/virgil.git
cd virgil

# Install everything
./install.sh --profile full

# Or install for your stack only
./install.sh typescript
```

### Option 2: Manual Setup

```bash
# Copy what you need to ~/.claude/
cp -r virgil/agents/*.md ~/.claude/agents/
cp -r virgil/rules/common ~/.claude/rules/
cp -r virgil/rules/typescript ~/.claude/rules/
cp -r virgil/commands/*.md ~/.claude/commands/
```

### Option 3: Claude Code Plugin

```
/plugin marketplace add yourusername/virgil
/plugin install virgil@virgil
```

### Step 2: Configure Settings

Add to `~/.claude/settings.json`:

```json
{
  "model": "sonnet",
  "env": {
    "MAX_THINKING_TOKENS": "10000",
    "CLAUDE_AUTOCOMPACT_PCT_OVERRIDE": "50"
  }
}
```

### Step 3: Open VS Code + Claude Code

Install the recommended extensions (VS Code will prompt you), then start Claude Code. Virgil is loaded automatically.

---

## What's Inside

```
virgil/
├── CLAUDE.md              # The soul — core principles, workflow, context management
├── AGENTS.md              # Cross-platform agent manifest
├── agents/                # 11 specialized subagents
│   ├── planner.md             # Implementation planning
│   ├── architect.md           # System design decisions
│   ├── tdd-guide.md           # Test-driven development
│   ├── code-reviewer.md       # Quality review
│   ├── security-reviewer.md   # Vulnerability analysis
│   ├── build-error-resolver.md # Fix broken builds
│   ├── loop-operator.md       # Autonomous execution loops
│   └── ...
├── skills/                # 12 workflow skills
│   ├── tdd-workflow/          # RED → GREEN → REFACTOR
│   ├── verification-loop/     # Build + typecheck + lint + test + security
│   ├── context-engineering/   # Anti-context-rot system (from GSD)
│   ├── spec-driven-dev/       # Spec before code (from Superpowers)
│   ├── strategic-compact/     # Smart compaction timing
│   ├── search-first/          # Research before coding
│   ├── security-review/       # Security checklist
│   ├── frontend-patterns/     # Next.js + React + Tailwind
│   ├── backend-patterns/      # API + Supabase + Edge Functions
│   ├── supabase-patterns/     # Deep Supabase patterns
│   ├── n8n-automation/        # n8n workflow patterns
│   └── founder-ops/           # Investor updates, outreach, GTM
├── commands/              # Slash commands
│   ├── plan.md                # /plan — create implementation plan
│   ├── tdd.md                 # /tdd — enforce TDD
│   ├── code-review.md         # /code-review — quality review
│   ├── build-fix.md           # /build-fix — fix build errors
│   ├── security-scan.md       # /security-scan — security audit
│   └── verify.md              # /verify — full verification loop
├── hooks/                 # Event-driven automation
│   └── hooks.json             # PreToolUse, PostToolUse, SessionStart, Stop
├── scripts/hooks/         # Hook implementations (Node.js)
│   ├── pre-bash.js            # Block dev servers outside tmux, warn on destructive cmds
│   ├── pre-write.js           # Block 800+ line files, warn on console.log
│   ├── post-edit.js           # Warn on TODO/console.log/ts-ignore additions
│   ├── session-start.js       # Load working context from previous session
│   └── session-end.js         # Save session state for next session
├── rules/                 # Always-follow guidelines
│   ├── common/                # Language-agnostic (coding style, git workflow)
│   └── typescript/            # TypeScript/React/Next.js standards
├── mcp-configs/           # MCP server configurations
├── examples/              # Example configs for real projects
├── .vscode/               # VS Code workspace settings
│   ├── settings.json          # Formatter, linter, TypeScript config
│   ├── extensions.json        # Recommended extensions
│   ├── launch.json            # Debug configurations
│   └── tasks.json             # Virgil verification tasks
└── install.sh             # One-command installer
```

---

## The Workflow

Virgil enforces a four-phase development cycle:

### 1. Specify → `/plan "Add user auth"`
Don't code yet. Virgil asks questions, writes a spec with acceptance criteria, and gets your approval.

### 2. Plan
The planner agent breaks the spec into ordered, testable tasks with verification criteria.

### 3. Execute → `/tdd`
Each task follows TDD: write failing test → implement → refactor → verify. The loop-operator can run multiple tasks autonomously.

### 4. Review → `/verify` + `/code-review` + `/security-scan`
Full verification pipeline: build, typecheck, lint, test, security audit.

---

## Context Management

The #1 reason AI coding sessions go sideways is **context rot** — quality degrades as the context window fills. Virgil prevents this:

- **Auto-compact at 50%** instead of the default 95%
- **Strategic compaction** at logical breakpoints (not mid-implementation)
- **Session handoff documents** preserve state across sessions
- **WORKING-CONTEXT.md** restores project context instantly

---

## VS Code Setup

Virgil includes full VS Code integration:

1. Open the project in VS Code
2. Install recommended extensions when prompted (or run `Extensions: Show Recommended Extensions`)
3. The `.vscode/` folder configures:
   - **Formatting**: Prettier on save
   - **Linting**: ESLint with auto-fix
   - **TypeScript**: Workspace SDK, strict mode
   - **Debugging**: Next.js server/client, Jest/Vitest
   - **Tasks**: `Ctrl+Shift+B` runs the full Virgil verification loop

### Required VS Code Extensions
- **Claude Code** (`anthropic.claude-code`) — The AI coding agent
- **Prettier** (`esbenp.prettier-vscode`) — Code formatter
- **ESLint** (`dbaeumer.vscode-eslint`) — Linter
- **Tailwind CSS IntelliSense** (`bradlc.vscode-tailwindcss`) — Tailwind autocomplete
- **Error Lens** (`usernamehw.errorlens`) — Inline error display
- **GitLens** (`eamodio.gitlens`) — Git history and blame

### Optional but Recommended
- **Pretty TypeScript Errors** (`yoavbls.pretty-ts-errors`) — Readable TS errors
- **Playwright** (`ms-playwright.playwright`) — E2E test runner
- **Vitest** (`vitest.explorer`) — Test explorer

---

## Customization

### Add Your Own Skills
Create `skills/my-skill/SKILL.md` with YAML frontmatter:
```yaml
---
name: my-skill
description: What this skill does
trigger: auto | manual | before-merge
globs: ["**/*.ts"]
---
```

### Add Your Own Agents
Create `agents/my-agent.md` with frontmatter:
```yaml
---
name: my-agent
description: What this agent specializes in
tools: ["Read", "Write", "Edit", "Bash", "Grep", "Glob"]
model: sonnet | opus | haiku
---
```

### Add Your Own Rules
Create `rules/common/my-rule.md` or `rules/typescript/my-rule.md` with:
```yaml
---
description: "What this rule enforces"
alwaysApply: true | false
globs: ["**/*.ts"]
---
```

---

## Philosophy

> "The best code is the code you don't have to debug at 3am."

Virgil exists because the three biggest problems in AI-assisted development are:

1. **Building the wrong thing** — Solved by spec-driven development (Superpowers)
2. **Quality degradation** — Solved by context engineering (Get Shit Done)  
3. **Missing the fundamentals** — Solved by agents, rules, and hooks (Everything Claude Code)

No single repo solved all three. Virgil does.

---

## Credits

Built on the shoulders of:
- [Everything Claude Code](https://github.com/affaan-m/everything-claude-code) by Affaan Mustafa
- [Superpowers](https://github.com/obra/superpowers) by Jesse Vincent
- [Get Shit Done](https://github.com/gsd-build/get-shit-done) by TÂCHES

---

## License

MIT — Use freely, modify as needed, build something great.
