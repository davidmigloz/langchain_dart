#!/usr/bin/env python3
"""
Analyze changes between current and latest Live API schema.

Compares two schema files and generates a changelog and implementation plan.

Usage:
    python3 .claude/skills/websocket-updater/scripts/analyze_changes.py \\
        live-api-schema.json /tmp/websocket-updater/latest-live.json \\
        --format all \\
        --changelog-out /tmp/websocket-updater/changelog-live.md \\
        --plan-out /tmp/websocket-updater/plan-live.md

Exit codes:
    0 - Analysis complete
    1 - Error
"""

import argparse
import json
import sys
from pathlib import Path
from typing import Any


def load_schema(path: Path) -> dict | None:
    """Load schema from file, returning None if not found."""
    if not path.exists():
        return None
    return json.loads(path.read_text())


def compare_message_types(
    current: dict | None,
    latest: dict,
    side: str
) -> tuple[list, list, list]:
    """Compare message types and return added, removed, modified."""
    current_types = set(current.get('message_types', {}).get(side, {}).keys()) if current else set()
    latest_types = set(latest.get('message_types', {}).get(side, {}).keys())

    added = list(latest_types - current_types)
    removed = list(current_types - latest_types)

    # Check for modified (field changes)
    modified = []
    for msg_type in current_types & latest_types:
        current_fields = set(current['message_types'][side][msg_type].get('fields', {}).keys())
        latest_fields = set(latest['message_types'][side][msg_type].get('fields', {}).keys())
        if current_fields != latest_fields:
            new_fields = latest_fields - current_fields
            removed_fields = current_fields - latest_fields
            modified.append({
                'name': msg_type,
                'added_fields': list(new_fields),
                'removed_fields': list(removed_fields)
            })

    return sorted(added), sorted(removed), modified


def compare_config_types(
    current: dict | None,
    latest: dict
) -> tuple[list, list, list]:
    """Compare config types."""
    current_types = set(current.get('config_types', {}).keys()) if current else set()
    latest_types = set(latest.get('config_types', {}).keys())

    added = list(latest_types - current_types)
    removed = list(current_types - latest_types)

    # Check for modified
    modified = []
    for config_type in current_types & latest_types:
        current_fields = set(current['config_types'][config_type].get('fields', {}).keys())
        latest_fields = set(latest['config_types'][config_type].get('fields', {}).keys())
        if current_fields != latest_fields:
            new_fields = latest_fields - current_fields
            removed_fields = current_fields - latest_fields
            modified.append({
                'name': config_type,
                'added_fields': list(new_fields),
                'removed_fields': list(removed_fields)
            })

    return sorted(added), sorted(removed), modified


def compare_enums(
    current: dict | None,
    latest: dict
) -> tuple[list, list, list]:
    """Compare enum types."""
    current_enums = set(current.get('enums', {}).keys()) if current else set()
    latest_enums = set(latest.get('enums', {}).keys())

    added = list(latest_enums - current_enums)
    removed = list(current_enums - latest_enums)

    # Check for modified (new values)
    modified = []
    for enum_type in current_enums & latest_enums:
        current_values = set(current['enums'][enum_type].get('values', []))
        latest_values = set(latest['enums'][enum_type].get('values', []))
        if current_values != latest_values:
            new_values = latest_values - current_values
            removed_values = current_values - latest_values
            modified.append({
                'name': enum_type,
                'added_values': list(new_values),
                'removed_values': list(removed_values)
            })

    return sorted(added), sorted(removed), modified


def generate_changelog(analysis: dict) -> str:
    """Generate human-readable changelog."""
    lines = ["# Live API Changelog", ""]

    # Breaking changes (removed)
    removed_count = (
        len(analysis['client_messages']['removed']) +
        len(analysis['server_messages']['removed']) +
        len(analysis['config_types']['removed']) +
        len(analysis['enums']['removed'])
    )

    if removed_count > 0:
        lines.extend(["## Breaking Changes", ""])
        for msg in analysis['client_messages']['removed']:
            lines.append(f"- Removed client message: `{msg}`")
        for msg in analysis['server_messages']['removed']:
            lines.append(f"- Removed server message: `{msg}`")
        for cfg in analysis['config_types']['removed']:
            lines.append(f"- Removed config type: `{cfg}`")
        for enum in analysis['enums']['removed']:
            lines.append(f"- Removed enum: `{enum}`")
        lines.append("")

    # New features
    added_count = (
        len(analysis['client_messages']['added']) +
        len(analysis['server_messages']['added']) +
        len(analysis['config_types']['added']) +
        len(analysis['enums']['added'])
    )

    if added_count > 0:
        lines.extend(["## New Features", ""])
        for msg in analysis['client_messages']['added']:
            lines.append(f"- New client message: `{msg}`")
        for msg in analysis['server_messages']['added']:
            lines.append(f"- New server message: `{msg}`")
        for cfg in analysis['config_types']['added']:
            lines.append(f"- New config type: `{cfg}`")
        for enum in analysis['enums']['added']:
            lines.append(f"- New enum: `{enum}`")
        lines.append("")

    # Modifications
    all_modified = (
        analysis['client_messages']['modified'] +
        analysis['server_messages']['modified'] +
        analysis['config_types']['modified'] +
        analysis['enums']['modified']
    )

    if all_modified:
        lines.extend(["## Modifications", ""])
        for mod in all_modified:
            if mod.get('added_fields'):
                lines.append(f"- `{mod['name']}`: Added fields: {', '.join(mod['added_fields'])}")
            if mod.get('removed_fields'):
                lines.append(f"- `{mod['name']}`: Removed fields: {', '.join(mod['removed_fields'])}")
            if mod.get('added_values'):
                lines.append(f"- `{mod['name']}`: Added values: {', '.join(mod['added_values'])}")
            if mod.get('removed_values'):
                lines.append(f"- `{mod['name']}`: Removed values: {', '.join(mod['removed_values'])}")
        lines.append("")

    # Summary
    lines.extend([
        "## Summary",
        "",
        f"- Breaking changes: {removed_count}",
        f"- New features: {added_count}",
        f"- Modifications: {len(all_modified)}",
    ])

    return "\n".join(lines)


def generate_plan(analysis: dict) -> str:
    """Generate prioritized implementation plan."""
    lines = ["# Live API Implementation Plan", ""]

    # P0: Breaking changes
    if any(analysis[k]['removed'] for k in ['client_messages', 'server_messages', 'config_types', 'enums']):
        lines.extend(["## P0: Breaking Changes (Handle First)", ""])
        for msg in analysis['client_messages']['removed']:
            lines.append(f"- [ ] Remove `{msg}` client message")
        for msg in analysis['server_messages']['removed']:
            lines.append(f"- [ ] Remove `{msg}` server message")
        for cfg in analysis['config_types']['removed']:
            lines.append(f"- [ ] Remove `{cfg}` config type")
        for enum in analysis['enums']['removed']:
            lines.append(f"- [ ] Remove `{enum}` enum")
        lines.append("")

    # P1: New message types
    if analysis['client_messages']['added'] or analysis['server_messages']['added']:
        lines.extend(["## P1: New Message Types", ""])
        for msg in analysis['client_messages']['added']:
            lines.append(f"- [ ] Implement `{msg}` client message")
        for msg in analysis['server_messages']['added']:
            lines.append(f"- [ ] Implement `{msg}` server message")
        lines.append("")

    # P2: New config/enum types
    if analysis['config_types']['added'] or analysis['enums']['added']:
        lines.extend(["## P2: New Config/Enum Types", ""])
        for cfg in analysis['config_types']['added']:
            lines.append(f"- [ ] Implement `{cfg}` config class")
        for enum in analysis['enums']['added']:
            lines.append(f"- [ ] Implement `{enum}` enum")
        lines.append("")

    # P4: Modifications
    all_modified = (
        analysis['client_messages']['modified'] +
        analysis['server_messages']['modified'] +
        analysis['config_types']['modified'] +
        analysis['enums']['modified']
    )

    if all_modified:
        lines.extend(["## P4: Modifications", ""])
        for mod in all_modified:
            changes = []
            if mod.get('added_fields'):
                changes.append(f"add: {', '.join(mod['added_fields'])}")
            if mod.get('removed_fields'):
                changes.append(f"remove: {', '.join(mod['removed_fields'])}")
            if mod.get('added_values'):
                changes.append(f"add: {', '.join(mod['added_values'])}")
            if mod.get('removed_values'):
                changes.append(f"remove: {', '.join(mod['removed_values'])}")
            lines.append(f"- [ ] Update `{mod['name']}`: {'; '.join(changes)}")
        lines.append("")

    # Cross-reference checks
    lines.extend([
        "## Cross-Reference Checks",
        "- [ ] All new models exported in `lib/googleai_dart.dart`",
        "- [ ] Sealed classes handle new variants",
        "- [ ] Parent models reference new child types",
        "",
        "## Quality Gates",
        "- [ ] `dart analyze --fatal-infos` - no issues",
        "- [ ] `dart format --set-exit-if-changed .` - no changes",
        "- [ ] `dart test test/unit/` - all pass",
        "- [ ] `python3 .claude/skills/.../verify_model_properties.py` - all pass",
    ])

    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(
        description='Analyze changes between Live API schemas.'
    )
    parser.add_argument(
        'current',
        type=Path,
        help='Current schema file (may not exist for initial implementation)'
    )
    parser.add_argument(
        'latest',
        type=Path,
        help='Latest schema file'
    )
    parser.add_argument(
        '--format',
        choices=['changelog', 'plan', 'all'],
        default='all',
        help='Output format'
    )
    parser.add_argument(
        '--changelog-out',
        type=Path,
        help='Output file for changelog'
    )
    parser.add_argument(
        '--plan-out',
        type=Path,
        help='Output file for implementation plan'
    )
    args = parser.parse_args()

    if not args.latest.exists():
        print(f"Error: Latest schema not found: {args.latest}")
        print("Run fetch_schema.py first.")
        sys.exit(1)

    current = load_schema(args.current)
    latest = load_schema(args.latest)

    if current is None:
        print(f"Note: Current schema not found at {args.current}")
        print("This is expected for initial implementation.")
        print()

    # Analyze changes
    client_added, client_removed, client_modified = compare_message_types(current, latest, 'client')
    server_added, server_removed, server_modified = compare_message_types(current, latest, 'server')
    config_added, config_removed, config_modified = compare_config_types(current, latest)
    enum_added, enum_removed, enum_modified = compare_enums(current, latest)

    analysis = {
        'client_messages': {
            'added': client_added,
            'removed': client_removed,
            'modified': client_modified
        },
        'server_messages': {
            'added': server_added,
            'removed': server_removed,
            'modified': server_modified
        },
        'config_types': {
            'added': config_added,
            'removed': config_removed,
            'modified': config_modified
        },
        'enums': {
            'added': enum_added,
            'removed': enum_removed,
            'modified': enum_modified
        }
    }

    # Generate outputs
    if args.format in ['changelog', 'all']:
        changelog = generate_changelog(analysis)
        if args.changelog_out:
            args.changelog_out.parent.mkdir(parents=True, exist_ok=True)
            args.changelog_out.write_text(changelog)
            print(f"✓ Changelog saved to {args.changelog_out}")
        else:
            print(changelog)
            print()

    if args.format in ['plan', 'all']:
        plan = generate_plan(analysis)
        if args.plan_out:
            args.plan_out.parent.mkdir(parents=True, exist_ok=True)
            args.plan_out.write_text(plan)
            print(f"✓ Plan saved to {args.plan_out}")
        else:
            print(plan)

    # Summary
    total_added = (len(client_added) + len(server_added) +
                   len(config_added) + len(enum_added))
    total_removed = (len(client_removed) + len(server_removed) +
                     len(config_removed) + len(enum_removed))
    total_modified = (len(client_modified) + len(server_modified) +
                      len(config_modified) + len(enum_modified))

    print()
    print(f"Summary: +{total_added} added, -{total_removed} removed, ~{total_modified} modified")

    sys.exit(0)


if __name__ == '__main__':
    main()
