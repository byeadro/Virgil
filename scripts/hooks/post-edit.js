#!/usr/bin/env node

// Post-edit hook: warn on TODO/console.log additions
let data = '';
process.stdin.on('data', chunk => data += chunk);
process.stdin.on('end', () => {
  try {
    const input = JSON.parse(data);
    const newString = input.tool_input?.new_string || '';

    if (/TODO|FIXME|HACK|XXX/.test(newString)) {
      console.error('[Virgil] NOTE: TODO/FIXME added — consider creating an issue to track it.');
    }

    if (/console\.log/.test(newString)) {
      console.error('[Virgil] WARNING: console.log added. Remove before committing.');
    }

    if (/@ts-ignore|@ts-expect-error/.test(newString)) {
      console.error('[Virgil] WARNING: TypeScript suppression added. Document the reason.');
    }

    if (/eslint-disable/.test(newString)) {
      console.error('[Virgil] WARNING: ESLint rule disabled. Document the reason.');
    }

    console.log(data);
  } catch (e) {
    console.log(data);
  }
});
