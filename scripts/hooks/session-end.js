#!/usr/bin/env node

// Session end hook: save state for the next session
const fs = require('fs');
const path = require('path');

let data = '';
process.stdin.on('data', chunk => data += chunk);
process.stdin.on('end', () => {
  try {
    const virgilDir = path.join(process.cwd(), '.virgil');
    if (!fs.existsSync(virgilDir)) {
      fs.mkdirSync(virgilDir, { recursive: true });
    }

    const sessionState = {
      timestamp: new Date().toISOString(),
      summary: 'Session ended — review WORKING-CONTEXT.md for handoff',
      lastTask: null,
    };

    fs.writeFileSync(
      path.join(virgilDir, 'last-session.json'),
      JSON.stringify(sessionState, null, 2)
    );

    console.error('[Virgil] Session state saved to .virgil/last-session.json');
    console.log(data);
  } catch (e) {
    console.log(data);
  }
});
