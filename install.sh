#!/bin/bash
set -e

# Virgil Installer
# Usage:
#   ./install.sh                    # Install core (common rules + hooks)
#   ./install.sh typescript         # Install core + TypeScript rules
#   ./install.sh --profile full     # Install everything
#   ./install.sh --target cursor    # Install for Cursor IDE

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
TARGET="claude"
PROFILE="standard"
LANGS=()

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile) PROFILE="$2"; shift 2 ;;
    --target) TARGET="$2"; shift 2 ;;
    typescript|python|golang|swift|php) LANGS+=("$1"); shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

echo "╔══════════════════════════════════════╗"
echo "║         VIRGIL INSTALLER             ║"
echo "║  Spec first. Build right. Ship fast. ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "Target: $TARGET | Profile: $PROFILE | Languages: ${LANGS[*]:-common only}"
echo ""

# Create directories
mkdir -p "$CLAUDE_DIR/rules/common"
mkdir -p "$CLAUDE_DIR/agents"
mkdir -p "$CLAUDE_DIR/commands"
mkdir -p "$CLAUDE_DIR/commands/gsd"
mkdir -p "$CLAUDE_DIR/scripts/hooks"
mkdir -p "$CLAUDE_DIR/hooks"
mkdir -p "$CLAUDE_DIR/skills"
mkdir -p "$CLAUDE_DIR/contexts"

# Step 1: Install rules (common always)
echo "→ Installing common rules..."
cp -r "$SCRIPT_DIR/rules/common/"* "$CLAUDE_DIR/rules/common/"

# Install language-specific rules
for lang in "${LANGS[@]}"; do
  if [ -d "$SCRIPT_DIR/rules/$lang" ]; then
    echo "→ Installing $lang rules..."
    mkdir -p "$CLAUDE_DIR/rules/$lang"
    cp -r "$SCRIPT_DIR/rules/$lang/"* "$CLAUDE_DIR/rules/$lang/"
  else
    echo "⚠ No rules found for: $lang (skipping)"
  fi
done

# Full profile: install all languages
if [ "$PROFILE" = "full" ]; then
  for lang_dir in "$SCRIPT_DIR/rules"/*/; do
    lang=$(basename "$lang_dir")
    if [ "$lang" != "common" ]; then
      echo "→ Installing $lang rules..."
      mkdir -p "$CLAUDE_DIR/rules/$lang"
      cp -r "$lang_dir"* "$CLAUDE_DIR/rules/$lang/"
    fi
  done
fi

# Step 2: Install agents (all 48)
echo "→ Installing agents..."
cp "$SCRIPT_DIR/agents/"*.md "$CLAUDE_DIR/agents/"

# Step 3: Install commands (core + GSD)
echo "→ Installing core commands..."
cp "$SCRIPT_DIR/commands/"*.md "$CLAUDE_DIR/commands/"

echo "→ Installing GSD commands..."
cp -r "$SCRIPT_DIR/commands/gsd/"*.md "$CLAUDE_DIR/commands/gsd/"

# Step 4: Install hooks and hook scripts
echo "→ Installing hooks..."
cp "$SCRIPT_DIR/scripts/hooks/"*.js "$CLAUDE_DIR/scripts/hooks/" 2>/dev/null || true
cp "$SCRIPT_DIR/scripts/hooks/"*.sh "$CLAUDE_DIR/scripts/hooks/" 2>/dev/null || true

# Rewrite hooks.json with resolved paths
sed "s|scripts/hooks/|$CLAUDE_DIR/scripts/hooks/|g" \
  "$SCRIPT_DIR/hooks/hooks.json" > "$CLAUDE_DIR/hooks/hooks.json"

# Step 5: Install skills
echo "→ Installing skills..."
cp -r "$SCRIPT_DIR/skills/"* "$CLAUDE_DIR/skills/"

# Step 6: Install contexts
echo "→ Installing contexts..."
if [ -d "$SCRIPT_DIR/contexts" ]; then
  cp -r "$SCRIPT_DIR/contexts/"* "$CLAUDE_DIR/contexts/" 2>/dev/null || true
fi

# Step 7: Install GSD core system
echo "→ Installing GSD context engine..."
if [ -d "$SCRIPT_DIR/get-shit-done" ]; then
  mkdir -p "$CLAUDE_DIR/get-shit-done"
  cp -r "$SCRIPT_DIR/get-shit-done/"* "$CLAUDE_DIR/get-shit-done/"
fi

# Step 8: Install SDK (if exists)
if [ -d "$SCRIPT_DIR/sdk" ]; then
  echo "→ Installing GSD SDK..."
  mkdir -p "$CLAUDE_DIR/sdk"
  cp -r "$SCRIPT_DIR/sdk/"* "$CLAUDE_DIR/sdk/"
fi

# Step 9: Install ECC script library
echo "→ Installing script library..."
if [ -d "$SCRIPT_DIR/scripts/lib" ]; then
  mkdir -p "$CLAUDE_DIR/scripts/lib"
  cp -r "$SCRIPT_DIR/scripts/lib/"* "$CLAUDE_DIR/scripts/lib/"
fi

# Step 10: Copy CLAUDE.md and AGENTS.md to user config
echo "→ Installing CLAUDE.md and AGENTS.md..."
cp "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
cp "$SCRIPT_DIR/AGENTS.md" "$CLAUDE_DIR/AGENTS.md"

# Step 11: Copy MCP configs (don't overwrite existing)
echo "→ Installing MCP configs..."
mkdir -p "$CLAUDE_DIR/mcp-configs"
if [ ! -f "$CLAUDE_DIR/mcp-configs/mcp-servers.json" ]; then
  cp "$SCRIPT_DIR/mcp-configs/mcp-servers.json" "$CLAUDE_DIR/mcp-configs/"
else
  echo "  (mcp-servers.json exists, skipping — merge manually if needed)"
fi

# Count what was installed
AGENT_COUNT=$(ls "$SCRIPT_DIR/agents/"*.md 2>/dev/null | wc -l | tr -d ' ')
SKILL_COUNT=$(ls -d "$SCRIPT_DIR/skills/"*/ 2>/dev/null | wc -l | tr -d ' ')
CORE_CMD_COUNT=$(ls "$SCRIPT_DIR/commands/"*.md 2>/dev/null | wc -l | tr -d ' ')
GSD_CMD_COUNT=$(ls "$SCRIPT_DIR/commands/gsd/"*.md 2>/dev/null | wc -l | tr -d ' ')
HOOK_COUNT=$(ls "$SCRIPT_DIR/scripts/hooks/"* 2>/dev/null | wc -l | tr -d ' ')

echo ""
echo "✅ Virgil installed successfully!"
echo ""
echo "Installed:"
echo "  Agents:     $AGENT_COUNT  → $CLAUDE_DIR/agents/"
echo "  Skills:     $SKILL_COUNT  → $CLAUDE_DIR/skills/"
echo "  Commands:   $CORE_CMD_COUNT core + $GSD_CMD_COUNT GSD  → $CLAUDE_DIR/commands/"
echo "  Hooks:      $HOOK_COUNT scripts  → $CLAUDE_DIR/scripts/hooks/"
echo "  Rules:      $CLAUDE_DIR/rules/"
echo "  GSD Engine: $CLAUDE_DIR/get-shit-done/"
echo "  Contexts:   $CLAUDE_DIR/contexts/"
echo ""
echo "Next steps:"
echo "  1. Add your API keys to mcp-configs/mcp-servers.json"
echo "  2. Add to ~/.claude/settings.json:"
echo '     { "model": "sonnet", "env": { "MAX_THINKING_TOKENS": "10000", "CLAUDE_AUTOCOMPACT_PCT_OVERRIDE": "50" } }'
echo "  3. Open Claude Code and start building!"
echo ""
echo "Core commands: /plan, /write-plan, /execute-plan, /brainstorm, /tdd, /code-review, /build-fix, /security-scan, /verify"
echo "GSD commands:  /gsd:new-project, /gsd:plan-phase, /gsd:execute-phase, /gsd:debug, /gsd:ship, /gsd:progress"
