#!/usr/bin/env python3
"""
Verify README.md includes Live API documentation.

Checks that the README includes:
- Live API in Features section
- Live API in API Coverage section
- Live example file reference

Usage:
    python3 .claude/skills/websocket-updater/scripts/verify_readme.py

Exit codes:
    0 - All checks pass
    1 - Issues found
    2 - Error (wrong directory, missing files, etc.)
"""

import re
import sys
from pathlib import Path


# Required Live API features to document
LIVE_FEATURES = {
    'liveClient': ('LiveClient for WebSocket connections',
                   ['liveclient', 'live client', 'websocket']),
    'audioInput': ('Audio input support',
                   ['audio input', '16khz', 'pcm input']),
    'audioOutput': ('Audio output support',
                    ['audio output', '24khz', 'pcm output']),
    'toolCalling': ('Tool calling in live sessions',
                    ['tool call', 'function call']),
    'sessionResumption': ('Session resumption',
                          ['session resumption', 'resume session', 'resumption token']),
    'vad': ('Voice activity detection',
            ['voice activity', 'vad', 'activity detection']),
}


def check_readme():
    readme = Path('README.md')
    if not readme.exists():
        print("Error: README.md not found.")
        sys.exit(2)

    content = readme.read_text().lower()
    issues = []
    warnings = []

    # Check for Live API section
    if 'live api' not in content and 'liveapi' not in content:
        issues.append("Live API not mentioned in README")

    # Check for LiveClient
    if 'liveclient' not in content and 'live client' not in content:
        issues.append("LiveClient not documented")

    # Check for example reference
    if 'live_example.dart' not in content:
        issues.append("live_example.dart not referenced in Examples section")

    # Check for each feature
    for feature_id, (description, keywords) in LIVE_FEATURES.items():
        found = any(kw in content for kw in keywords)
        if not found:
            warnings.append(f"Feature not documented: {description}")

    # Check API coverage section
    # Live API uses section-based documentation, not table format
    # Look for Live API section patterns like "### Live API" or "Live API (`client.createLiveClient()`)"
    live_api_section_patterns = [
        '### live api',
        'live api (',
        'createlive',
        'livesession',
    ]
    has_live_api_section = any(pattern in content for pattern in live_api_section_patterns)
    if not has_live_api_section:
        warnings.append("Live API not documented in API Coverage section")

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
        print("✓ README Live API documentation looks complete")
        sys.exit(0)
    elif issues:
        print("Fix issues before proceeding.")
        sys.exit(1)
    else:
        print("Warnings are informational - review if they apply.")
        sys.exit(0)


def main():
    print("Checking README for Live API documentation...")
    print()
    check_readme()


if __name__ == '__main__':
    main()
