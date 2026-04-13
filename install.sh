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

# Step 2: Install agents
echo "→ Installing agents..."
cp "$SCRIPT_DIR/agents/"*.md "$CLAUDE_DIR/agents/"

# Step 3: Install commands
echo "→ Installing commands..."
mkdir -p "$CLAUDE_DIR/commands"
cp "$SCRIPT_DIR/commands/"*.md "$CLAUDE_DIR/commands/"

# Step 4: Install hooks (resolve paths)
echo "→ Installing hooks..."
mkdir -p "$CLAUDE_DIR/hooks"
mkdir -p "$CLAUDE_DIR/scripts/hooks"
cp "$SCRIPT_DIR/scripts/hooks/"*.js "$CLAUDE_DIR/scripts/hooks/"

# Rewrite hooks.json with resolved paths
sed "s|scripts/hooks/|$CLAUDE_DIR/scripts/hooks/|g" \
  "$SCRIPT_DIR/hooks/hooks.json" > "$CLAUDE_DIR/hooks/hooks.json"

# Step 5: Copy CLAUDE.md and AGENTS.md to user config
echo "→ Installing CLAUDE.md and AGENTS.md..."
cp "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
cp "$SCRIPT_DIR/AGENTS.md" "$CLAUDE_DIR/AGENTS.md"

# Step 6: Copy MCP configs (don't overwrite existing)
echo "→ Installing MCP configs..."
mkdir -p "$CLAUDE_DIR/mcp-configs"
if [ ! -f "$CLAUDE_DIR/mcp-configs/mcp-servers.json" ]; then
  cp "$SCRIPT_DIR/mcp-configs/mcp-servers.json" "$CLAUDE_DIR/mcp-configs/"
else
  echo "  (mcp-servers.json exists, skipping — merge manually if needed)"
fi

echo ""
echo "✅ Virgil installed successfully!"
echo ""
echo "Installed:"
echo "  Rules:    $CLAUDE_DIR/rules/"
echo "  Agents:   $CLAUDE_DIR/agents/"
echo "  Commands: $CLAUDE_DIR/commands/"
echo "  Hooks:    $CLAUDE_DIR/hooks/hooks.json"
echo "  Scripts:  $CLAUDE_DIR/scripts/hooks/"
echo ""
echo "Next steps:"
echo "  1. Add your API keys to mcp-configs/mcp-servers.json"
echo "  2. Add to ~/.claude/settings.json:"
echo '     { "model": "sonnet", "env": { "MAX_THINKING_TOKENS": "10000", "CLAUDE_AUTOCOMPACT_PCT_OVERRIDE": "50" } }'
echo "  3. Open Claude Code and start building!"
echo ""
echo "Commands available: /plan, /tdd, /code-review, /build-fix, /security-scan, /verify"
