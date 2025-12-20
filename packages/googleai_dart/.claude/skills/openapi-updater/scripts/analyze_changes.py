#!/usr/bin/env python3
"""
Compare two OpenAPI specifications and generate changelog/implementation plan.

Usage:
    python3 analyze_changes.py OLD_SPEC NEW_SPEC [--format FORMAT] [--output FILE]

Formats:
    json      - Structured diff data
    changelog - Human-readable changelog
    plan      - Implementation plan
    all       - Generate both changelog and plan (use with --changelog-out and --plan-out)
"""

import argparse
import json
import re
import sys
from dataclasses import dataclass, field, asdict
from datetime import datetime
from pathlib import Path
from typing import Any, Optional


@dataclass
class EndpointInfo:
    """Information about an endpoint."""
    path: str
    method: str
    operation_id: str
    description: str = ""
    request_schema: Optional[str] = None
    response_schema: Optional[str] = None
    parameters: list = field(default_factory=list)


@dataclass
class SchemaInfo:
    """Information about a schema."""
    name: str
    type: str
    description: str = ""
    properties: dict = field(default_factory=dict)
    required: list = field(default_factory=list)
    enum_values: list = field(default_factory=list)


def load_spec(path: Path) -> dict:
    """Load and parse OpenAPI spec."""
    with open(path) as f:
        return json.load(f)


def extract_endpoints(spec: dict) -> dict[str, EndpointInfo]:
    """Extract all endpoints from spec."""
    endpoints = {}
    for path, path_data in spec.get('paths', {}).items():
        for method in ['get', 'post', 'put', 'patch', 'delete']:
            if method not in path_data:
                continue

            op = path_data[method]
            key = f"{method.upper()} {path}"

            # Extract request schema
            request_schema = None
            if 'requestBody' in op:
                content = op['requestBody'].get('content', {})
                if 'application/json' in content:
                    schema_ref = content['application/json'].get('schema', {}).get('$ref', '')
                    request_schema = schema_ref.split('/')[-1] if schema_ref else None

            # Extract response schema
            response_schema = None
            for status, response in op.get('responses', {}).items():
                if status.startswith('2') or status == 'default':
                    content = response.get('content', {})
                    if 'application/json' in content:
                        schema_ref = content['application/json'].get('schema', {}).get('$ref', '')
                        response_schema = schema_ref.split('/')[-1] if schema_ref else None
                    break

            endpoints[key] = EndpointInfo(
                path=path,
                method=method.upper(),
                operation_id=op.get('operationId', ''),
                description=op.get('description', '')[:200],
                request_schema=request_schema,
                response_schema=response_schema,
                parameters=[p.get('name', '') for p in op.get('parameters', [])],
            )

    return endpoints


def extract_schemas(spec: dict) -> dict[str, SchemaInfo]:
    """Extract all schemas from spec."""
    schemas = {}
    for name, schema in spec.get('components', {}).get('schemas', {}).items():
        schemas[name] = SchemaInfo(
            name=name,
            type=schema.get('type', 'object'),
            description=schema.get('description', '')[:100],
            properties=schema.get('properties', {}),
            required=schema.get('required', []),
            enum_values=schema.get('enum', []),
        )
    return schemas


def compare_endpoints(old_endpoints: dict, new_endpoints: dict) -> tuple:
    """Compare endpoints between specs."""
    old_keys = set(old_endpoints.keys())
    new_keys = set(new_endpoints.keys())

    added = [new_endpoints[k] for k in sorted(new_keys - old_keys)]
    removed = [old_endpoints[k] for k in sorted(old_keys - new_keys)]

    modified = []
    for key in sorted(old_keys & new_keys):
        old_ep = old_endpoints[key]
        new_ep = new_endpoints[key]
        changes = []

        # Check for parameter changes
        old_params = set(old_ep.parameters)
        new_params = set(new_ep.parameters)

        for name in new_params - old_params:
            changes.append({'type': 'parameter_added', 'name': name})
        for name in old_params - new_params:
            changes.append({'type': 'parameter_removed', 'name': name, 'breaking': True})

        # Check request/response schema changes
        if old_ep.request_schema != new_ep.request_schema:
            changes.append({
                'type': 'request_schema_changed',
                'old': old_ep.request_schema,
                'new': new_ep.request_schema,
            })

        if old_ep.response_schema != new_ep.response_schema:
            changes.append({
                'type': 'response_schema_changed',
                'old': old_ep.response_schema,
                'new': new_ep.response_schema,
            })

        if changes:
            modified.append({'endpoint': new_ep, 'changes': changes})

    return added, modified, removed


def compare_schemas(old_schemas: dict, new_schemas: dict) -> tuple:
    """Compare schemas between specs."""
    old_keys = set(old_schemas.keys())
    new_keys = set(new_schemas.keys())

    added = [new_schemas[k] for k in sorted(new_keys - old_keys)]
    removed = [old_schemas[k] for k in sorted(old_keys - new_keys)]

    modified = []
    for name in sorted(old_keys & new_keys):
        old_schema = old_schemas[name]
        new_schema = new_schemas[name]
        changes = []

        # Check property changes
        old_props = set(old_schema.properties.keys())
        new_props = set(new_schema.properties.keys())

        for prop in new_props - old_props:
            is_required = prop in new_schema.required
            changes.append({
                'type': 'property_added',
                'property': prop,
                'breaking': is_required and prop not in old_schema.required,
            })

        for prop in old_props - new_props:
            changes.append({'type': 'property_removed', 'property': prop, 'breaking': True})

        # Check required changes
        old_required = set(old_schema.required)
        new_required = set(new_schema.required)

        for prop in new_required - old_required:
            if prop in old_props:
                changes.append({'type': 'required_added', 'property': prop, 'breaking': True})

        # Check enum changes
        if old_schema.enum_values or new_schema.enum_values:
            old_enums = set(old_schema.enum_values)
            new_enums = set(new_schema.enum_values)

            for value in new_enums - old_enums:
                changes.append({'type': 'enum_value_added', 'value': value})
            for value in old_enums - new_enums:
                changes.append({'type': 'enum_value_removed', 'value': value, 'breaking': True})

        if changes:
            modified.append({'schema': new_schema, 'changes': changes})

    return added, modified, removed


def analyze_specs(old_spec: dict, new_spec: dict) -> dict:
    """Analyze differences between two specs."""
    old_endpoints = extract_endpoints(old_spec)
    new_endpoints = extract_endpoints(new_spec)
    old_schemas = extract_schemas(old_spec)
    new_schemas = extract_schemas(new_spec)

    ep_added, ep_modified, ep_removed = compare_endpoints(old_endpoints, new_endpoints)
    sc_added, sc_modified, sc_removed = compare_schemas(old_schemas, new_schemas)

    # Count breaking changes
    breaking_count = len(ep_removed) + len(sc_removed)
    for mod in ep_modified:
        breaking_count += sum(1 for c in mod['changes'] if c.get('breaking'))
    for mod in sc_modified:
        breaking_count += sum(1 for c in mod['changes'] if c.get('breaking'))

    return {
        'metadata': {
            'old_version': old_spec.get('info', {}).get('version', 'unknown'),
            'new_version': new_spec.get('info', {}).get('version', 'unknown'),
            'comparison_date': datetime.now().isoformat(),
            'old_endpoints': len(old_endpoints),
            'new_endpoints': len(new_endpoints),
            'old_schemas': len(old_schemas),
            'new_schemas': len(new_schemas),
        },
        'summary': {
            'new_endpoints': len(ep_added),
            'modified_endpoints': len(ep_modified),
            'removed_endpoints': len(ep_removed),
            'new_schemas': len(sc_added),
            'modified_schemas': len(sc_modified),
            'removed_schemas': len(sc_removed),
            'breaking_changes': breaking_count,
        },
        'endpoints': {
            'added': [asdict(e) for e in ep_added],
            'modified': [{'endpoint': asdict(m['endpoint']), 'changes': m['changes']} for m in ep_modified],
            'removed': [asdict(e) for e in ep_removed],
        },
        'schemas': {
            'added': [asdict(s) for s in sc_added],
            'modified': [{'schema': asdict(m['schema']), 'changes': m['changes']} for m in sc_modified],
            'removed': [asdict(s) for s in sc_removed],
        },
    }


def to_snake_case(name: str) -> str:
    """Convert PascalCase to snake_case."""
    s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower()


def categorize_schema(name: str) -> str:
    """Determine category for schema based on name."""
    name_lower = name.lower()
    if 'embed' in name_lower:
        return 'embeddings'
    if 'corpus' in name_lower or 'document' in name_lower or 'chunk' in name_lower:
        return 'corpus'
    if 'cache' in name_lower:
        return 'caching'
    if 'batch' in name_lower:
        return 'batch'
    if 'file' in name_lower:
        return 'files'
    if 'model' in name_lower or 'tuned' in name_lower:
        return 'models'
    if 'permission' in name_lower:
        return 'permissions'
    if 'harm' in name_lower or 'safety' in name_lower:
        return 'safety'
    if 'tool' in name_lower or 'function' in name_lower:
        return 'tools'
    if 'generate' in name_lower or 'content' in name_lower:
        return 'generation'
    return 'common'


def schema_to_file_path(name: str) -> str:
    """Map schema name to Dart file path."""
    category = categorize_schema(name)
    snake_name = to_snake_case(name)
    return f"lib/src/models/{category}/{snake_name}.dart"


def generate_changelog(analysis: dict) -> str:
    """Generate human-readable changelog."""
    meta = analysis['metadata']
    summary = analysis['summary']

    lines = [
        "# GoogleAI API Changelog",
        "",
        f"**From**: {meta['old_version']} ({meta['old_endpoints']} endpoints, {meta['old_schemas']} schemas)",
        f"**To**: {meta['new_version']} ({meta['new_endpoints']} endpoints, {meta['new_schemas']} schemas)",
        f"**Generated**: {datetime.now().strftime('%Y-%m-%d %H:%M')}",
        "",
        "---",
        "",
        "## Summary",
        "",
        "| Category | Count |",
        "|----------|-------|",
        f"| New Endpoints | {summary['new_endpoints']} |",
        f"| Modified Endpoints | {summary['modified_endpoints']} |",
        f"| Removed Endpoints | {summary['removed_endpoints']} |",
        f"| New Schemas | {summary['new_schemas']} |",
        f"| Modified Schemas | {summary['modified_schemas']} |",
        f"| Removed Schemas | {summary['removed_schemas']} |",
        f"| **Breaking Changes** | **{summary['breaking_changes']}** |",
        "",
    ]

    # Breaking changes (removed endpoints/schemas)
    if analysis['endpoints']['removed'] or analysis['schemas']['removed']:
        lines.extend(["---", "", "## Breaking Changes", ""])
        for ep in analysis['endpoints']['removed']:
            lines.append(f"- **REMOVED**: `{ep['method']} {ep['path']}`")
        for sc in analysis['schemas']['removed']:
            lines.append(f"- **REMOVED**: Schema `{sc['name']}`")
        lines.append("")

    # New endpoints
    if analysis['endpoints']['added']:
        lines.extend(["---", "", "## New Endpoints", ""])
        for ep in analysis['endpoints']['added']:
            lines.extend([
                f"### {ep['method']} {ep['path']}",
                "",
                f"**Operation ID**: `{ep['operation_id']}`",
            ])
            if ep['request_schema']:
                lines.append(f"**Request**: `{ep['request_schema']}`")
            if ep['response_schema']:
                lines.append(f"**Response**: `{ep['response_schema']}`")
            lines.append("")

    # New schemas
    if analysis['schemas']['added']:
        lines.extend(["---", "", "## New Schemas", ""])
        for sc in analysis['schemas']['added']:
            lines.extend([
                f"### {sc['name']}",
                "",
                f"**Type**: {sc['type']}",
            ])
            if sc['properties']:
                lines.append(f"**Properties**: {', '.join(sc['properties'].keys())}")
            if sc['enum_values']:
                lines.append(f"**Enum**: {', '.join(sc['enum_values'])}")
            lines.append("")

    # Modified endpoints
    if analysis['endpoints']['modified']:
        lines.extend(["---", "", "## Modified Endpoints", ""])
        for mod in analysis['endpoints']['modified']:
            ep = mod['endpoint']
            lines.append(f"### {ep['method']} {ep['path']}")
            lines.append("")
            for change in mod['changes']:
                breaking = " **[BREAKING]**" if change.get('breaking') else ""
                lines.append(f"- {change['type']}: `{change.get('name', change.get('property', ''))}`{breaking}")
            lines.append("")

    # Modified schemas
    if analysis['schemas']['modified']:
        lines.extend(["---", "", "## Modified Schemas", ""])
        for mod in analysis['schemas']['modified']:
            sc = mod['schema']
            lines.append(f"### {sc['name']}")
            lines.append("")
            for change in mod['changes']:
                breaking = " **[BREAKING]**" if change.get('breaking') else ""
                prop = change.get('property', change.get('value', ''))
                lines.append(f"- {change['type']}: `{prop}`{breaking}")
            lines.append("")

    return "\n".join(lines)


def generate_plan(analysis: dict) -> str:
    """Generate implementation plan."""
    summary = analysis['summary']
    total = (summary['new_endpoints'] + summary['new_schemas'] +
             summary['modified_endpoints'] + summary['modified_schemas'])

    lines = [
        "# OpenAPI Update Implementation Plan",
        "",
        f"**Generated**: {datetime.now().strftime('%Y-%m-%d %H:%M')}",
        f"**Total Changes**: {total}",
        "",
        "---",
        "",
        "## Priority Order",
        "",
        "1. **P0**: Breaking changes (must handle first)",
        "2. **P1**: New endpoints (new functionality)",
        "3. **P2**: New schemas (supporting models)",
        "4. **P3**: Modified endpoints (updates)",
        "5. **P4**: Modified schemas (model updates)",
        "",
    ]

    change_id = 0

    # Breaking changes
    if analysis['endpoints']['removed'] or analysis['schemas']['removed']:
        lines.extend(["---", "", "## P0: Breaking Changes", ""])
        for ep in analysis['endpoints']['removed']:
            change_id += 1
            lines.extend([
                f"### CHANGE-{change_id:03d}: Remove {ep['method']} {ep['path']}",
                "",
                f"**ID**: CHANGE-{change_id:03d}",
                "**Priority**: P0 (CRITICAL)",
                "**Type**: ENDPOINT_REMOVED",
                "",
                "**Action**: Remove or deprecate this endpoint",
                "",
            ])

    # New endpoints
    if analysis['endpoints']['added']:
        lines.extend(["---", "", "## P1: New Endpoints", ""])
        for ep in analysis['endpoints']['added']:
            change_id += 1
            lines.extend([
                f"### CHANGE-{change_id:03d}: Add {ep['method']} {ep['path']}",
                "",
                f"**ID**: CHANGE-{change_id:03d}",
                "**Priority**: P1 (HIGH)",
                "**Type**: NEW_ENDPOINT",
                f"**Operation ID**: `{ep['operation_id']}`",
                "",
                "**Files to Create/Modify**:",
                "",
            ])
            if ep['request_schema']:
                lines.append(f"- `{schema_to_file_path(ep['request_schema'])}`")
            if ep['response_schema']:
                lines.append(f"- `{schema_to_file_path(ep['response_schema'])}`")
            lines.extend([
                "",
                f"**PR Title**: `feat(googleai_dart): Add {to_snake_case(ep['operation_id'])} endpoint`",
                "",
            ])

    # New schemas
    if analysis['schemas']['added']:
        lines.extend(["---", "", "## P2: New Schemas", ""])
        for sc in analysis['schemas']['added']:
            change_id += 1
            file_path = schema_to_file_path(sc['name'])
            test_path = file_path.replace('lib/src/', 'test/unit/').replace('.dart', '_test.dart')
            lines.extend([
                f"### CHANGE-{change_id:03d}: Add {sc['name']} schema",
                "",
                f"**ID**: CHANGE-{change_id:03d}",
                "**Priority**: P2 (MEDIUM)",
                "**Type**: NEW_SCHEMA",
                "",
                "**Files to Create**:",
                f"- `{file_path}`",
                f"- `{test_path}`",
                "",
                f"**PR Title**: `feat(googleai_dart): Add {sc['name']} model`",
                "",
            ])

    # Modified endpoints
    if analysis['endpoints']['modified']:
        lines.extend(["---", "", "## P3: Modified Endpoints", ""])
        for mod in analysis['endpoints']['modified']:
            change_id += 1
            ep = mod['endpoint']
            lines.extend([
                f"### CHANGE-{change_id:03d}: Update {ep['method']} {ep['path']}",
                "",
                f"**ID**: CHANGE-{change_id:03d}",
                "**Priority**: P3 (MEDIUM)",
                "**Type**: MODIFIED_ENDPOINT",
                "",
                "**Changes**:",
            ])
            for change in mod['changes']:
                lines.append(f"- {change['type']}")
            lines.append("")

    # Modified schemas
    if analysis['schemas']['modified']:
        lines.extend(["---", "", "## P4: Modified Schemas", ""])
        for mod in analysis['schemas']['modified']:
            change_id += 1
            sc = mod['schema']
            lines.extend([
                f"### CHANGE-{change_id:03d}: Update {sc['name']}",
                "",
                f"**ID**: CHANGE-{change_id:03d}",
                "**Priority**: P4 (LOW)",
                "**Type**: MODIFIED_SCHEMA",
                "",
                "**Changes**:",
            ])
            for change in mod['changes']:
                lines.append(f"- {change['type']}: `{change.get('property', change.get('value', ''))}`")
            lines.append("")

    # Checklist
    lines.extend([
        "---",
        "",
        "## Implementation Checklist",
        "",
        f"- [ ] P0 Breaking Changes: {summary['removed_endpoints'] + summary['removed_schemas']} items",
        f"- [ ] P1 New Endpoints: {summary['new_endpoints']} items",
        f"- [ ] P2 New Schemas: {summary['new_schemas']} items",
        f"- [ ] P3 Modified Endpoints: {summary['modified_endpoints']} items",
        f"- [ ] P4 Modified Schemas: {summary['modified_schemas']} items",
        "",
        "## Final Steps",
        "",
        "- [ ] Copy latest spec to `openapi.json`",
        "- [ ] Run full test suite",
        "- [ ] Update CHANGELOG.md",
    ])

    # Add Review Checklist section
    lines.extend([
        "",
        "---",
        "",
        "## Review Checklist",
        "",
        "After implementation, verify each change. See `references/REVIEW_CHECKLIST.md` for full guide.",
        "",
    ])

    # Generate specific checklist items from analysis
    if analysis['schemas']['removed']:
        lines.append("### Removed Schemas")
        for sc in analysis['schemas']['removed']:
            lines.append(f"- [ ] `{sc['name']}` - code deleted, exports updated, tests removed")
        lines.append("")

    if analysis['schemas']['added']:
        lines.append("### New Schemas")
        for sc in analysis['schemas']['added']:
            file_path = schema_to_file_path(sc['name'])
            props = ', '.join(list(sc['properties'].keys())[:5])
            if len(sc['properties']) > 5:
                props += f" (+{len(sc['properties'])-5} more)"
            lines.append(f"- [ ] `{sc['name']}` → `{file_path}`")
            if props:
                lines.append(f"  - Properties: {props}")
        lines.append("")

    if analysis['schemas']['modified']:
        lines.append("### Modified Schemas")
        for mod in analysis['schemas']['modified']:
            sc = mod['schema']
            changes = [c.get('property', c.get('value', '')) for c in mod['changes']]
            lines.append(f"- [ ] `{sc['name']}` - verify: {', '.join(changes)}")
        lines.append("")

    # Cross-reference reminders
    lines.extend([
        "### Cross-Reference Checks",
        "- [ ] All new models exported in `lib/googleai_dart.dart`",
        "- [ ] Sealed classes (Part, etc.) handle new variants",
        "- [ ] Parent models reference new child types",
        "",
        "### Quality Gates",
        "- [ ] `dart analyze --fatal-infos` - no issues",
        "- [ ] `dart format --set-exit-if-changed .` - no changes",
        "- [ ] `dart test test/unit/` - all pass",
    ])

    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(description="Analyze OpenAPI spec changes")
    parser.add_argument('old_spec', type=Path, help="Path to old spec")
    parser.add_argument('new_spec', type=Path, help="Path to new spec")
    parser.add_argument('--format', '-f', choices=['json', 'changelog', 'plan', 'all'],
                        default='changelog', help="Output format")
    parser.add_argument('--output', '-o', type=Path, help="Output file (for single format)")
    parser.add_argument('--changelog-out', type=Path, help="Changelog output (for --format all)")
    parser.add_argument('--plan-out', type=Path, help="Plan output (for --format all)")
    args = parser.parse_args()

    if not args.old_spec.exists():
        print(f"ERROR: Old spec not found: {args.old_spec}", file=sys.stderr)
        sys.exit(1)
    if not args.new_spec.exists():
        print(f"ERROR: New spec not found: {args.new_spec}", file=sys.stderr)
        sys.exit(1)

    old_spec = load_spec(args.old_spec)
    new_spec = load_spec(args.new_spec)

    analysis = analyze_specs(old_spec, new_spec)

    if args.format == 'json':
        output = json.dumps(analysis, indent=2)
    elif args.format == 'changelog':
        output = generate_changelog(analysis)
    elif args.format == 'plan':
        output = generate_plan(analysis)
    elif args.format == 'all':
        changelog = generate_changelog(analysis)
        plan = generate_plan(analysis)

        if args.changelog_out:
            args.changelog_out.parent.mkdir(parents=True, exist_ok=True)
            with open(args.changelog_out, 'w') as f:
                f.write(changelog)
            print(f"Changelog saved to: {args.changelog_out}")

        if args.plan_out:
            args.plan_out.parent.mkdir(parents=True, exist_ok=True)
            with open(args.plan_out, 'w') as f:
                f.write(plan)
            print(f"Plan saved to: {args.plan_out}")

        # Print summary
        print(f"\n{'='*50}")
        print("Analysis Summary")
        print(f"{'='*50}")
        for key, value in analysis['summary'].items():
            print(f"  {key.replace('_', ' ').title()}: {value}")
        return

    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        with open(args.output, 'w') as f:
            f.write(output)
        print(f"Output saved to: {args.output}")
    else:
        print(output)

    # Print summary for non-json formats
    if args.format != 'json':
        print(f"\n{'='*50}")
        print("Summary")
        print(f"{'='*50}")
        for key, value in analysis['summary'].items():
            print(f"  {key.replace('_', ' ').title()}: {value}")


if __name__ == '__main__':
    main()
