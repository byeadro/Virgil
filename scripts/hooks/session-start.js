#!/usr/bin/env node

// Session start hook: load working context
const fs = require('fs');
const path = require('path');

let data = '';
process.stdin.on('data', chunk => data += chunk);
process.stdin.on('end', () => {
  try {
    // Check for WORKING-CONTEXT.md in the project root
    const workingContext = path.join(process.cwd(), 'WORKING-CONTEXT.md');
    if (fs.existsSync(workingContext)) {
      const content = fs.readFileSync(workingContext, 'utf8');
      console.error(`[Virgil] Loaded working context (${content.split('\n').length} lines)`);
    }

    // Check for session state from last session
    const sessionState = path.join(process.cwd(), '.virgil', 'last-session.json');
    if (fs.existsSync(sessionState)) {
      const state = JSON.parse(fs.readFileSync(sessionState, 'utf8'));
      console.error(`[Virgil] Previous session: ${state.summary || 'no summary'}`);
      console.error(`[Virgil] Last task: ${state.lastTask || 'none'}`);
    }

    console.log(data);
  } catch (e) {
    console.log(data);
  }
});
