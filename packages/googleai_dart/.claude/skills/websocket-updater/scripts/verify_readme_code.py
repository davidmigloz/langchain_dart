#!/usr/bin/env python3
"""
Verify README code examples match actual Live API.

Extracts dart code blocks from README.md and checks for common
documentation drift patterns.

Usage:
    python3 .claude/skills/websocket-updater/scripts/verify_readme_code.py

Exit codes:
    0 - No issues found
    1 - Errors detected
    2 - Error (wrong directory, etc.)
"""

import re
import sys
from pathlib import Path

# Live API-specific drift patterns
DRIFT_PATTERNS = [
    {
        'pattern': r'session\.text\b',
        'message': 'session.text does not exist - use session.sendText()',
        'severity': 'error',
    },
    {
        'pattern': r'session\.audio\b',
        'message': 'session.audio does not exist - use session.sendAudio()',
        'severity': 'error',
    },
    {
        'pattern': r'liveClient\.send\b',
        'message': 'liveClient.send() does not exist - use session.sendXxx()',
        'severity': 'error',
    },
    {
        'pattern': r'LiveClient\s*\(\s*\)',
        'message': 'LiveClient() requires config or client.createLiveClient()',
        'severity': 'warning',
    },
    {
        'pattern': r'session\.response\b',
        'message': 'session.response does not exist - use session.messages stream',
        'severity': 'error',
    },
    {
        'pattern': r'session\.on\w+\s*=',
        'message': 'LiveSession uses Stream, not callbacks - use await for',
        'severity': 'warning',
    },
]


def extract_dart_blocks(readme_path: Path) -> list[tuple[int, str]]:
    """Extract dart code blocks with line numbers."""
    content = readme_path.read_text()
    blocks = []
    in_dart = False
    start_line = 0
    current_block = []

    for i, line in enumerate(content.split('\n'), 1):
        if line.strip() == '```dart':
            in_dart = True
            start_line = i
            current_block = []
        elif line.strip() == '```' and in_dart:
            in_dart = False
            blocks.append((start_line, '\n'.join(current_block)))
        elif in_dart:
            current_block.append(line)

    return blocks


def check_block(line_num: int, code: str) -> list[dict]:
    """Check a code block for drift patterns."""
    issues = []
    for pattern_info in DRIFT_PATTERNS:
        for match in re.finditer(pattern_info['pattern'], code):
            block_line = code[:match.start()].count('\n') + 1
            issues.append({
                'line': line_num + block_line,
                'match': match.group(),
                'message': pattern_info['message'],
                'severity': pattern_info['severity'],
            })
    return issues


def main():
    readme = Path('README.md')
    if not readme.exists():
        print("Error: README.md not found.")
        sys.exit(2)

    print("Checking README Live API code examples...")
    print()

    blocks = extract_dart_blocks(readme)
    all_issues = []

    # Only check blocks that mention Live API concepts
    live_keywords = ['live', 'session', 'websocket', 'audio', 'realtime']

    for line_num, code in blocks:
        code_lower = code.lower()
        if any(kw in code_lower for kw in live_keywords):
            all_issues.extend(check_block(line_num, code))

    if all_issues:
        errors = [i for i in all_issues if i['severity'] == 'error']
        warnings = [i for i in all_issues if i['severity'] == 'warning']

        if errors:
            print("ERRORS (must fix):")
            for issue in errors:
                print(f"  Line {issue['line']}: `{issue['match']}`")
                print(f"    → {issue['message']}")
            print()

        if warnings:
            print("WARNINGS (review):")
            for issue in warnings:
                print(f"  Line {issue['line']}: `{issue['match']}`")
                print(f"    → {issue['message']}")
            print()

        print(f"Summary: {len(errors)} error(s), {len(warnings)} warning(s)")

        if errors:
            print("\nFix errors before proceeding.")
            sys.exit(1)
        else:
            print("\nWarnings are informational.")
    else:
        print("✓ No Live API README code drift detected")

    sys.exit(0)


if __name__ == '__main__':
    main()
