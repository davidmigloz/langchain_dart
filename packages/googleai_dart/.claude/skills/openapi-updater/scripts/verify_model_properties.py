#!/usr/bin/env python3
"""
Verify critical model classes have all properties from OpenAPI spec.

This script compares Dart model classes against the OpenAPI specification
to detect missing properties. This is particularly important for parent
models like Tool, Candidate, Content, etc. that may need updates when
new child types are added.

Usage:
    python3 .claude/skills/openapi-updater/scripts/verify_model_properties.py

Exit codes:
    0 - All properties match
    1 - Missing properties found
    2 - Error (wrong directory, missing files, etc.)
"""

import argparse
import json
import re
import sys
from pathlib import Path
from typing import Optional


# Critical models that often need updates when new features are added
CRITICAL_MODELS = [
    ('Tool', 'lib/src/models/tools/tool.dart'),
    ('Candidate', 'lib/src/models/content/candidate.dart'),
    ('Content', 'lib/src/models/content/content.dart'),
    ('Part', 'lib/src/models/content/part.dart'),
    ('GenerationConfig', 'lib/src/models/generation/generation_config.dart'),
    ('ToolConfig', 'lib/src/models/tools/tool_config.dart'),
    ('GroundingMetadata', 'lib/src/models/metadata/grounding_metadata.dart'),
    ('GroundingChunk', 'lib/src/models/metadata/grounding_chunk.dart'),
]


def load_openapi_spec(spec_path: Path) -> dict:
    """Load OpenAPI specification."""
    with open(spec_path) as f:
        return json.load(f)


def get_spec_properties(spec: dict, schema_name: str) -> set[str]:
    """Extract property names from OpenAPI schema."""
    schemas = spec.get('components', {}).get('schemas', {})
    schema = schemas.get(schema_name, {})

    properties = set()

    # Direct properties (skip internal properties starting with underscore)
    for prop in schema.get('properties', {}).keys():
        if not prop.startswith('_'):
            properties.add(prop)

    # Handle allOf (merged schemas)
    for item in schema.get('allOf', []):
        if 'properties' in item:
            for prop in item['properties'].keys():
                properties.add(prop)
        elif '$ref' in item:
            ref_name = item['$ref'].split('/')[-1]
            # Don't recurse infinitely, just get direct properties
            ref_schema = schemas.get(ref_name, {})
            for prop in ref_schema.get('properties', {}).keys():
                properties.add(prop)

    # Handle oneOf (for sealed classes like Part)
    for item in schema.get('oneOf', []):
        if '$ref' in item:
            ref_name = item['$ref'].split('/')[-1]
            ref_schema = schemas.get(ref_name, {})
            for prop in ref_schema.get('properties', {}).keys():
                properties.add(prop)

    return properties


def get_dart_properties(dart_file: Path) -> set[str]:
    """Extract property names from Dart class file."""
    if not dart_file.exists():
        return set()

    content = dart_file.read_text()
    properties = set()

    # Match final field declarations: final Type? propertyName;
    # Also handles: final Type propertyName;
    field_pattern = r'final\s+[\w<>?,\s]+\s+(\w+)\s*;'
    for match in re.finditer(field_pattern, content):
        properties.add(match.group(1))

    # Match constructor named parameters: this.propertyName
    constructor_pattern = r'this\.(\w+)'
    for match in re.finditer(constructor_pattern, content):
        properties.add(match.group(1))

    # Match factory fromJson parameters (for sealed classes)
    # These may define properties via case statements
    factory_pattern = r"'(\w+)':\s*"
    for match in re.finditer(factory_pattern, content):
        prop = match.group(1)
        # Only add if it looks like a JSON property name (camelCase)
        if prop[0].islower():
            properties.add(prop)

    return properties


def to_camel_case(name: str) -> str:
    """Convert snake_case or PascalCase to camelCase for comparison."""
    # Already camelCase
    if '_' not in name and name[0].islower():
        return name
    # snake_case to camelCase
    if '_' in name:
        parts = name.split('_')
        return parts[0].lower() + ''.join(p.title() for p in parts[1:])
    # PascalCase to camelCase
    return name[0].lower() + name[1:]


def normalize_property_name(name: str) -> str:
    """Normalize property name for comparison."""
    # Remove common prefixes/suffixes used in OpenAPI vs Dart
    normalized = to_camel_case(name)
    return normalized


def verify_model(
    spec: dict,
    schema_name: str,
    dart_file: Path,
    verbose: bool = False
) -> tuple[bool, set[str], set[str]]:
    """
    Verify a model has all properties from spec.

    Returns (is_complete, missing_in_dart, extra_in_dart)
    """
    spec_props = get_spec_properties(spec, schema_name)
    dart_props = get_dart_properties(dart_file)

    # Normalize both sets for comparison
    normalized_spec = {normalize_property_name(p) for p in spec_props}
    normalized_dart = {normalize_property_name(p) for p in dart_props}

    # Skip internal Dart properties
    internal_props = {'hashCode', 'runtimeType', 'copyWith', 'toJson', 'fromJson'}
    normalized_dart -= internal_props

    missing_in_dart = normalized_spec - normalized_dart
    extra_in_dart = normalized_dart - normalized_spec

    # Filter out false positives (common internal fields)
    common_internal = {'value', 'values', 'map', 'type', 'key', 'index'}
    extra_in_dart -= common_internal

    return len(missing_in_dart) == 0, missing_in_dart, extra_in_dart


def main():
    parser = argparse.ArgumentParser(
        description='Verify model properties match OpenAPI spec.'
    )
    parser.add_argument(
        '--spec', '-s',
        type=Path,
        default=Path('openapi.json'),
        help='Path to OpenAPI spec (default: openapi.json)'
    )
    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Show detailed output including extra properties'
    )
    parser.add_argument(
        '--model', '-m',
        type=str,
        help='Check only a specific model (e.g., "Tool")'
    )
    args = parser.parse_args()

    # Verify we're in the right directory
    if not Path('lib/src/models').exists():
        print("Error: lib/src/models/ not found. Run from package root directory.")
        sys.exit(2)

    if not args.spec.exists():
        print(f"Error: OpenAPI spec not found at {args.spec}")
        print("Run: python3 .claude/skills/openapi-updater/scripts/fetch_spec.py")
        sys.exit(2)

    print("Checking model properties against OpenAPI spec...")
    print()

    spec = load_openapi_spec(args.spec)

    # Filter models if specific one requested
    models_to_check = CRITICAL_MODELS
    if args.model:
        models_to_check = [m for m in CRITICAL_MODELS if m[0] == args.model]
        if not models_to_check:
            print(f"Error: Unknown model '{args.model}'")
            print(f"Available: {', '.join(m[0] for m in CRITICAL_MODELS)}")
            sys.exit(2)

    has_issues = False

    for schema_name, dart_path in models_to_check:
        dart_file = Path(dart_path)

        if not dart_file.exists():
            print(f"⚠️  {schema_name}: File not found - {dart_path}")
            continue

        is_complete, missing, extra = verify_model(
            spec, schema_name, dart_file, args.verbose
        )

        if is_complete:
            print(f"✓  {schema_name}: All properties present")
        else:
            has_issues = True
            print(f"⚠️  {schema_name}: Missing properties - {', '.join(sorted(missing))}")
            if args.verbose and extra:
                print(f"   Extra in Dart (may be computed): {', '.join(sorted(extra))}")

    print()

    if has_issues:
        print("ACTION REQUIRED: Add missing properties to Dart models.")
        print()
        print("For each missing property:")
        print("  1. Check the OpenAPI spec for the property definition")
        print("  2. Add the field to the Dart class")
        print("  3. Update constructor, fromJson, toJson, and copyWith")
        sys.exit(1)
    else:
        print("✓ All critical models have complete properties.")
        sys.exit(0)


if __name__ == '__main__':
    main()
