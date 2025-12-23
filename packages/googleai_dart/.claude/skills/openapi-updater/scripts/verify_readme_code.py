#!/usr/bin/env python3
"""
Verify README code examples match actual Dart API.

Extracts dart code blocks from README.md and checks for common
documentation drift patterns where the documentation uses APIs
that don't actually exist or have different signatures.

Usage:
    python3 .claude/skills/openapi-updater/scripts/verify_readme_code.py

Exit codes:
    0 - No issues found
    1 - Errors detected (must fix)
    2 - Error (wrong directory, missing files, etc.)
"""

import re
import sys
from pathlib import Path

# Patterns that indicate documentation drift
# Each pattern is checked against code blocks extracted from README
DRIFT_PATTERNS = [
    {
        'pattern': r'response\.text\b',
        'message': 'response.text does not exist on GenerateContentResponse - '
                   'use response.candidates?.first.content?.parts',
        'severity': 'error',
    },
    {
        'pattern': r'delta\.query\b(?!ies)',  # 'query' not followed by 'ies'
        'message': 'GoogleSearchCallDelta uses .queries (plural List<String>?), not .query',
        'severity': 'error',
    },
    {
        'pattern': r'delta\.url\b(?!s)',  # 'url' not followed by 's'
        'message': 'UrlContextCallDelta uses .urls (plural List<String>?), not .url',
        'severity': 'error',
    },
    {
        'pattern': r'delta\.result\b(?!s)',  # 'result' not followed by 's'
        'message': 'Delta classes use .results (plural), not .result',
        'severity': 'warning',
    },
    {
        'pattern': r'\bToolConfig\s*\(',
        'message': 'ToolConfig is Map<String, dynamic>?, not a typed class with constructor',
        'severity': 'warning',
    },
    {
        'pattern': r'\bRetrievalConfig\s*\(',
        'message': 'RetrievalConfig should be a Map in toolConfig, not a typed class',
        'severity': 'warning',
    },
    {
        'pattern': r'\bLatLng\s*\(',
        'message': 'LatLng should be a Map in toolConfig.retrievalConfig, not a typed class',
        'severity': 'warning',
    },
]


def extract_dart_blocks(readme_path: Path) -> list[tuple[int, str]]:
    """
    Extract dart code blocks with their starting line numbers.

    Returns list of (line_number, code_content) tuples.
    """
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
    """
    Check a code block for drift patterns.

    Returns list of issue dictionaries with line, match, message, severity.
    """
    issues = []
    for pattern_info in DRIFT_PATTERNS:
        for match in re.finditer(pattern_info['pattern'], code):
            # Calculate line number within the code block
            block_line = code[:match.start()].count('\n') + 1
            issues.append({
                'line': line_num + block_line,
                'match': match.group(),
                'message': pattern_info['message'],
                'severity': pattern_info['severity'],
            })
    return issues


def main():
    # Verify we're in the right directory
    readme = Path('README.md')
    if not readme.exists():
        print("Error: README.md not found. Run from package root directory.")
        sys.exit(2)

    print("Checking README code examples for API drift...\n")

    blocks = extract_dart_blocks(readme)
    all_issues = []

    for line_num, code in blocks:
        all_issues.extend(check_block(line_num, code))

    if all_issues:
        errors = [i for i in all_issues if i['severity'] == 'error']
        warnings = [i for i in all_issues if i['severity'] == 'warning']

        if errors:
            print("ERRORS (must fix):\n")
            for issue in errors:
                print(f"  Line {issue['line']}: `{issue['match']}`")
                print(f"    → {issue['message']}\n")

        if warnings:
            print("WARNINGS (review):\n")
            for issue in warnings:
                print(f"  Line {issue['line']}: `{issue['match']}`")
                print(f"    → {issue['message']}\n")

        print(f"Summary: {len(errors)} error(s), {len(warnings)} warning(s)")

        if errors:
            print("\nFix errors before proceeding.")
            sys.exit(1)
        else:
            print("\nWarnings are informational - review if they apply.")
    else:
        print("✓ No README code drift detected")

    sys.exit(0)


if __name__ == '__main__':
    main()
