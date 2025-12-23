#!/usr/bin/env python3
"""
Verify Live API example files exist.

Checks that example/live_example.dart exists and contains expected content.

Usage:
    python3 .claude/skills/websocket-updater/scripts/verify_examples.py

Exit codes:
    0 - All checks pass
    1 - Issues found
    2 - Error (wrong directory, etc.)
"""

import sys
from pathlib import Path


def check_examples():
    example_dir = Path('example')
    if not example_dir.exists():
        print("Error: example/ directory not found.")
        sys.exit(2)

    issues = []
    warnings = []

    # Check for live_example.dart
    live_example = example_dir / 'live_example.dart'
    if not live_example.exists():
        issues.append("example/live_example.dart not found")
    else:
        content = live_example.read_text().lower()

        # Check for expected patterns
        if 'liveclient' not in content:
            warnings.append("live_example.dart doesn't mention LiveClient")
        if 'connect' not in content:
            warnings.append("live_example.dart doesn't show connect()")
        if 'session' not in content:
            warnings.append("live_example.dart doesn't use session")
        if 'close' not in content:
            warnings.append("live_example.dart doesn't show close()")

    # Report results
    if issues:
        print("ISSUES (must fix):")
        for issue in issues:
            print(f"  - {issue}")
        print()

    if warnings:
        print("WARNINGS (review):")
        for warning in warnings:
            print(f"  - {warning}")
        print()

    if not issues and not warnings:
        print("✓ Live API example file exists and looks complete")
        sys.exit(0)
    elif issues:
        print("Fix issues before proceeding.")
        print()
        print("Create example/live_example.dart using the template at:")
        print("  .claude/skills/websocket-updater/assets/example_template.dart")
        sys.exit(1)
    else:
        print("Warnings are informational - review if they apply.")
        sys.exit(0)


def main():
    print("Checking Live API examples...")
    print()
    check_examples()


if __name__ == '__main__':
    main()
