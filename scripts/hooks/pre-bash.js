#!/usr/bin/env node

// Pre-bash hook: blocks dev servers outside tmux, warns on destructive commands
let data = '';
process.stdin.on('data', chunk => data += chunk);
process.stdin.on('end', () => {
  try {
    const input = JSON.parse(data);
    const cmd = input.tool_input?.command || '';

    // Block dev servers outside tmux (they eat the terminal)
    const devServerPatterns = [
      /npm run dev/,
      /npx next dev/,
      /yarn dev/,
      /pnpm dev/,
      /bun dev/,
      /node.*server/,
    ];
    const isTmux = process.env.TMUX || process.env.TERM_PROGRAM === 'tmux';
    for (const pattern of devServerPatterns) {
      if (pattern.test(cmd) && !isTmux) {
        console.error('[Virgil] BLOCKED: Dev server commands must run in tmux. Use: tmux new -s dev');
        process.exit(2);
      }
    }

    // Warn on destructive commands
    const destructivePatterns = [
      /rm\s+-rf\s+\//,
      /DROP\s+(TABLE|DATABASE)/i,
      /git\s+push.*--force/,
      /git\s+reset\s+--hard/,
    ];
    for (const pattern of destructivePatterns) {
      if (pattern.test(cmd)) {
        console.error(`[Virgil] WARNING: Destructive command detected: ${cmd.substring(0, 80)}`);
      }
    }

    // Warn on secret exposure
    const secretPatterns = [
      /echo.*\$(.*KEY|.*SECRET|.*TOKEN|.*PASSWORD)/i,
      /export.*(KEY|SECRET|TOKEN|PASSWORD)\s*=/i,
      /curl.*(-H|--header).*Bearer\s+sk[_-]/i,
    ];
    for (const pattern of secretPatterns) {
      if (pattern.test(cmd)) {
        console.error('[Virgil] WARNING: Potential secret exposure in command');
      }
    }

    console.log(data);
  } catch (e) {
    console.log(data);
  }
});
