#!/usr/bin/env python3
"""
Verify example files exist for all resources.

This script validates that each implemented resource has a corresponding
example file in the example/ directory.

Checks:
1. Each resource has a corresponding example file ({resource}_example.dart)
2. Reports resources without examples

The script auto-detects resources from lib/src/resources/*_resource.dart files,
so new resources are automatically checked without needing to update hardcoded lists.

Usage:
    python3 .claude/skills/openapi-updater/scripts/verify_examples.py

Exit codes:
    0 - All resources have examples
    1 - Resources without examples found
    2 - Error (wrong directory, missing files, etc.)
"""

import argparse
import sys
from pathlib import Path


# Resources that don't need dedicated example files
# (nested resources, internal utilities, or covered by other examples)
EXCLUDED_RESOURCES = {
    'documents',        # Nested under corpora, covered in corpora examples
    'permissions',      # Nested under other resources
    'operations',       # Long-running operations, covered inline
    'generatedFiles',   # Covered in files examples
}

# Mapping of resource names to their example file names (for non-standard naming)
# resource_name -> example_name (without _example.dart suffix)
RESOURCE_TO_EXAMPLE = {
    'batches': 'batch',                    # batch_example.dart covers batches resource
    'cachedContents': 'caching',           # caching_example.dart covers cachedContents
    'tunedModels': 'tunedModelGeneration', # tuned_model_generation_example.dart
    'fileSearchStores': 'completeApi',     # complete_api_example.dart covers this
    'corpora': 'completeApi',              # complete_api_example.dart covers this
}


def snake_to_camel(name: str) -> str:
    """Convert snake_case to camelCase."""
    components = name.split('_')
    return components[0] + ''.join(x.title() for x in components[1:])


def find_resources(resources_dir: Path) -> set[str]:
    """Find all resource names from *_resource.dart files.

    Returns camelCase names (e.g., 'interactions', 'fileSearchStores').
    """
    resources = set()

    # Skip these patterns (not standalone resources)
    skip_patterns = {
        'base_resource',
        'resource_base',
        'documents_resource',
        'permissions_resource',
        'operations_resource',
        'generated_files_resource',
    }

    for item in resources_dir.iterdir():
        if item.name.startswith('.'):
            continue

        # Handle directories with resource files inside
        if item.is_dir():
            resource_file = item / f'{item.name}_resource.dart'
            if resource_file.exists():
                name = item.name + '_resource'
            else:
                dart_files = list(item.glob('*_resource.dart'))
                if dart_files:
                    name = dart_files[0].stem
                else:
                    continue
        elif item.is_file() and item.suffix == '.dart':
            name = item.stem
        else:
            continue

        # Skip non-resource files
        if not name.endswith('_resource'):
            continue

        # Skip excluded patterns
        if name in skip_patterns:
            continue

        # Convert to resource name (remove _resource, convert to camelCase)
        base_name = name.replace('_resource', '')
        resource_name = snake_to_camel(base_name)

        resources.add(resource_name)

    return resources


def find_examples(example_dir: Path) -> set[str]:
    """Find all example file names.

    Returns resource names extracted from {resource}_example.dart files.
    """
    examples = set()

    if not example_dir.exists():
        return examples

    for f in example_dir.glob('*_example.dart'):
        # Extract resource name from filename
        # e.g., 'interactions_example.dart' -> 'interactions'
        name = f.stem.replace('_example', '')
        resource_name = snake_to_camel(name)
        examples.add(resource_name)

    return examples


def main():
    parser = argparse.ArgumentParser(
        description='Verify example files exist for all resources'
    )
    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Show detailed output'
    )
    args = parser.parse_args()

    resources_dir = Path('lib/src/resources')
    example_dir = Path('example')

    # Validate directory
    if not resources_dir.exists():
        print("Error: lib/src/resources/ not found. Run from package root directory.")
        sys.exit(2)

    print("Checking example file completeness...")
    print()

    # Find all resources and examples
    resources = find_resources(resources_dir)
    examples = find_examples(example_dir)

    # Remove excluded resources from check
    resources_to_check = resources - EXCLUDED_RESOURCES

    if args.verbose:
        print(f"Resources found: {sorted(resources)}")
        print(f"Examples found: {sorted(examples)}")
        print(f"Checking (after exclusions): {sorted(resources_to_check)}")
        print()

    # Check for resources without examples
    # Consider both direct matches and mapped example names
    missing = set()
    for resource in resources_to_check:
        # Check if there's a mapped example name
        mapped_example = RESOURCE_TO_EXAMPLE.get(resource)
        if mapped_example and mapped_example in examples:
            continue  # Covered by mapped example
        if resource in examples:
            continue  # Direct match
        missing.add(resource)

    if not missing:
        print("✓ All resources have example files.")
        sys.exit(0)

    # Report missing examples
    print("RESOURCES WITHOUT EXAMPLES:")
    for r in sorted(missing):
        # Convert camelCase back to snake_case for filename suggestion
        import re
        snake_name = re.sub(r'([A-Z])', r'_\1', r).lower().lstrip('_')
        print(f"  - {r}")
        print(f"      → Create: example/{snake_name}_example.dart")
    print()

    print(f"Found {len(missing)} resource(s) without examples.")
    print()
    print("To fix:")
    print("  1. Create example files using assets/example_template.dart")
    print("  2. Follow patterns in references/implementation-patterns.md Section 9")
    print()

    sys.exit(1)


if __name__ == '__main__':
    main()
