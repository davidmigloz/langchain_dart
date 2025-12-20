#!/usr/bin/env python3
"""
Verify README.md accuracy against actual API implementation.

This script validates that the README documentation matches the actual
implementation by checking:
1. Resources documented match lib/src/resources/
2. Tool types documented match Tool class properties
3. No stale references to removed APIs
4. Example files exist

Usage:
    python3 .claude/skills/openapi-updater/scripts/verify_readme.py

Exit codes:
    0 - All checks passed
    1 - Validation issues found
    2 - Error (wrong directory, missing files, etc.)
"""

import argparse
import re
import sys
from pathlib import Path


# Known removed APIs to check for stale references
REMOVED_APIS = [
    ('ragStores', 'RAG Stores API removed - use fileSearchStores instead'),
    ('chunks.batchCreate', 'Chunk batch operations removed from API'),
    ('chunks.batchUpdate', 'Chunk batch operations removed from API'),
    ('chunks.batchDelete', 'Chunk batch operations removed from API'),
    ('chunks(document).create', 'Chunk management removed from API'),
    ('chunks(document).list', 'Chunk management removed from API'),
    ('chunks(document).get', 'Chunk management removed from API'),
    ('chunks(document).update', 'Chunk management removed from API'),
    ('chunks(document).delete', 'Chunk management removed from API'),
]

# Tool properties that should be documented
# Maps property name to (description, [search_terms])
TOOL_PROPERTIES = {
    'functionDeclarations': ('Function calling with custom functions',
                             ['functiondeclarations', 'function calling', 'function declarations']),
    'codeExecution': ('Code execution capability',
                      ['codeexecution', 'code execution']),
    'googleSearch': ('Google Search grounding',
                     ['googlesearch', 'google search']),
    'fileSearch': ('File search using Semantic Retrieval (FileSearchStores)',
                   ['filesearch', 'file search']),
    'mcpServers': ('MCP (Model Context Protocol) server integration',
                   ['mcpservers', 'mcp server', 'model context protocol']),
    'googleMaps': ('Google Maps geospatial context',
                   ['googlemaps', 'google maps']),
}

# Resource name mappings (directory/file name -> expected client accessor)
RESOURCE_MAPPINGS = {
    'models_resource': 'models',
    'tuned_models_resource': 'tunedModels',
    'files': 'files',
    'file_search_stores': 'fileSearchStores',
    'cached_contents_resource': 'cachedContents',
    'batches_resource': 'batches',
    'corpora_resource': 'corpora',
    'documents_resource': None,  # Nested under corpora, not standalone
    'permissions_resource': None,  # Nested under other resources
    'operations_resource': None,  # Universal, mentioned separately
    'generated_files_resource': None,  # Nested under files
    'base_resource': None,  # Base class, not a resource
}


def find_implemented_resources() -> set[str]:
    """Find all resource directories/files and return expected client names."""
    resources_dir = Path('lib/src/resources')
    resources = set()

    for item in resources_dir.iterdir():
        if item.name.startswith('.'):
            continue

        if item.is_dir():
            # Directory-based resources (e.g., file_search_stores, files)
            name = item.name
        elif item.is_file() and item.suffix == '.dart':
            # File-based resources (e.g., models_resource.dart)
            name = item.stem
        else:
            continue

        # Skip backup files
        if name.endswith('.bak'):
            continue

        # Map to expected client accessor
        client_name = RESOURCE_MAPPINGS.get(name)
        if client_name:  # Only include top-level resources
            resources.add(client_name)

    return resources


def extract_documented_resources(readme: str) -> set[str]:
    """Extract resource names from README API Coverage section."""
    # Match: ### ResourceName Resource (`client.resourceName`)
    pattern = r"### \w+(?:\s+\w+)* Resource \(`client\.(\w+)`\)"
    return set(re.findall(pattern, readme))


def find_tool_properties() -> dict[str, int]:
    """Extract tool properties from Tool class with line numbers."""
    tool_file = Path('lib/src/models/tools/tool.dart')
    content = tool_file.read_text()
    properties = {}

    for i, line in enumerate(content.split('\n'), 1):
        # Match: final Type? propertyName;
        match = re.search(r'final\s+[\w<>?]+\s+(\w+);', line)
        if match:
            properties[match.group(1)] = i

    return properties


def check_tool_documentation(readme: str) -> list[tuple[str, str]]:
    """Check if all tool properties are documented in README."""
    missing = []
    readme_lower = readme.lower()

    for prop, (description, search_terms) in TOOL_PROPERTIES.items():
        # Check if any of the search terms are found in README
        found = any(term in readme_lower for term in search_terms)
        if not found:
            missing.append((prop, description))

    return missing


def check_stale_references(readme: str) -> list[tuple[int, str, str]]:
    """Find references to removed APIs with line numbers."""
    issues = []
    lines = readme.split('\n')

    for i, line in enumerate(lines, 1):
        for api, reason in REMOVED_APIS:
            if api in line:
                issues.append((i, api, reason))

    return issues


def check_example_files(readme: str) -> list[str]:
    """Check that referenced example files exist."""
    example_dir = Path('example')

    # Find all .dart file references in README
    # Match patterns like: example/filename.dart, `filename.dart`, filename.dart
    pattern = r'[`/]?(\w+(?:_\w+)*\.dart)[`]?'
    referenced = set(re.findall(pattern, readme))

    # Filter to likely example files (contain 'example' or common patterns)
    example_patterns = ['_example.dart', 'example.dart']

    missing = []
    for filename in referenced:
        # Only check files that look like examples
        is_example = any(p in filename for p in example_patterns)
        if is_example and not (example_dir / filename).exists():
            missing.append(filename)

    return missing


def main():
    parser = argparse.ArgumentParser(
        description='Verify README accuracy against implementation'
    )
    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Show detailed output'
    )
    args = parser.parse_args()

    # Validate directory
    readme_path = Path('README.md')
    if not readme_path.exists():
        print("Error: README.md not found. Run from package root directory.")
        sys.exit(2)

    resources_dir = Path('lib/src/resources')
    if not resources_dir.exists():
        print("Error: lib/src/resources/ not found. Run from package root directory.")
        sys.exit(2)

    print("Checking README accuracy...")
    print()

    readme = readme_path.read_text()
    total_issues = 0

    # Check 1: Resource validation
    impl_resources = find_implemented_resources()
    doc_resources = extract_documented_resources(readme)

    stale_resources = doc_resources - impl_resources
    missing_resources = impl_resources - doc_resources

    if args.verbose:
        print(f"Implemented resources: {sorted(impl_resources)}")
        print(f"Documented resources: {sorted(doc_resources)}")
        print()

    # Check 2: Tool properties
    missing_tools = check_tool_documentation(readme)

    # Check 3: Stale references
    stale_refs = check_stale_references(readme)

    # Check 4: Example files
    missing_examples = check_example_files(readme)

    # Report stale references
    if stale_refs:
        print("STALE REFERENCES (removed from API):")
        for line_num, api, reason in stale_refs:
            print(f"  - README.md:{line_num} - '{api}'")
            print(f"      → {reason}")
        print()
        total_issues += len(stale_refs)

    # Report stale resources
    if stale_resources:
        print("STALE RESOURCES (documented but not implemented):")
        for res in sorted(stale_resources):
            print(f"  - client.{res}")
        print()
        total_issues += len(stale_resources)

    # Report missing resources
    if missing_resources:
        print("MISSING RESOURCES (implemented but not documented):")
        for res in sorted(missing_resources):
            print(f"  - client.{res} (lib/src/resources/)")
        print()
        total_issues += len(missing_resources)

    # Report missing tool documentation
    if missing_tools:
        print("MISSING TOOL DOCUMENTATION:")
        tool_props = find_tool_properties()
        for prop, description in missing_tools:
            line = tool_props.get(prop, '?')
            print(f"  - Tool.{prop} (lib/src/models/tools/tool.dart:{line})")
            print(f"      → {description}")
        print()
        total_issues += len(missing_tools)

    # Report missing examples
    if missing_examples:
        print("MISSING EXAMPLE FILES:")
        for example in sorted(missing_examples):
            print(f"  - {example}")
        print()
        total_issues += len(missing_examples)

    # Summary
    if total_issues == 0:
        print("✓ README is accurate and complete.")
        sys.exit(0)
    else:
        print(f"Found {total_issues} issue(s).")
        print()

        # Provide actionable suggestions
        if stale_refs or stale_resources:
            print("SUGGESTED REMOVALS:")
            if stale_resources:
                for res in sorted(stale_resources):
                    print(f"  - Remove '{res} Resource' section from API Coverage")
            # Group stale refs by section
            chunk_refs = [r for r in stale_refs if 'chunk' in r[1].lower()]
            rag_refs = [r for r in stale_refs if 'rag' in r[1].lower()]
            if chunk_refs:
                lines = sorted(set(r[0] for r in chunk_refs))
                print(f"  - Remove Chunk Management references (lines: {lines})")
            if rag_refs:
                lines = sorted(set(r[0] for r in rag_refs))
                print(f"  - Remove RAG Stores references (lines: {lines})")
            print()

        if missing_resources or missing_tools:
            print("SUGGESTED ADDITIONS:")
            if missing_resources:
                for res in sorted(missing_resources):
                    print(f"  - Add '{res}' Resource section to API Coverage")
            if missing_tools:
                for prop, desc in missing_tools:
                    print(f"  - Document Tool.{prop} in Function Calling section")
            print()

        sys.exit(1)


if __name__ == '__main__':
    main()
