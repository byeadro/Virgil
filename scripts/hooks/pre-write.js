#!/usr/bin/env node

// Pre-write hook: block files over 800 lines
let data = '';
process.stdin.on('data', chunk => data += chunk);
process.stdin.on('end', () => {
  try {
    const input = JSON.parse(data);
    const content = input.tool_input?.content || '';
    const filePath = input.tool_input?.file_path || '';
    const lines = content.split('\n').length;

    // Block files over 800 lines
    if (lines > 800) {
      console.error(`[Virgil] BLOCKED: File exceeds 800 lines (${lines} lines). Split into smaller modules.`);
      process.exit(2);
    }

    // Warn on console.log in production code
    if (/\.(ts|tsx|js|jsx)$/.test(filePath) && !/\.test\.|\.spec\./.test(filePath)) {
      const logCount = (content.match(/console\.log/g) || []).length;
      if (logCount > 0) {
        console.error(`[Virgil] WARNING: ${logCount} console.log statement(s) found. Remove before committing.`);
      }
    }

    console.log(data);
  } catch (e) {
    console.log(data);
  }
});
