#!/usr/bin/env python3
"""
Verify all model files are exported in the barrel file.

This script scans all .dart files in lib/src/models/ subdirectories and checks
that each is exported in lib/googleai_dart.dart. It also checks for transitive
dependencies (types used by exported classes that should also be exported).

Usage:
    python3 .claude/skills/openapi-updater/scripts/verify_exports.py

Exit codes:
    0 - All files are exported
    1 - Unexported files found
    2 - Error (wrong directory, missing files, etc.)
"""

import argparse
import re
import sys
from pathlib import Path


def find_model_files(models_dir: Path) -> list[Path]:
    """Find all .dart files in models subdirectories."""
    files = []
    for subdir in models_dir.iterdir():
        if subdir.is_dir() and not subdir.name.startswith('.'):
            for dart_file in subdir.glob('*.dart'):
                # Skip internal utility files
                if dart_file.name == 'copy_with_sentinel.dart':
                    continue
                files.append(dart_file)
    return sorted(files)


def get_barrel_exports(barrel_file: Path) -> set[str]:
    """Extract exported filenames from barrel file."""
    exports = set()
    content = barrel_file.read_text()
    # Match: export 'src/models/xxx/filename.dart';
    pattern = r"export\s+'[^']*?([^/]+\.dart)'"
    for match in re.finditer(pattern, content):
        exports.add(match.group(1))
    return exports


def extract_types_from_file(file: Path) -> set[str]:
    """Extract class, enum, and sealed class names from a Dart file."""
    content = file.read_text()
    pattern = r'(?:class|enum|sealed class)\s+(\w+)'
    return set(re.findall(pattern, content))


def find_type_usages(file: Path, type_names: set[str]) -> set[str]:
    """Find which types from type_names are used in the file."""
    content = file.read_text()
    used = set()
    for type_name in type_names:
        # Look for type usage: as type annotation, in generics, etc.
        # Pattern matches: TypeName, List<TypeName>, TypeName?, etc.
        if re.search(rf'\b{type_name}\b', content):
            used.add(type_name)
    return used


def check_transitive_dependencies(
    unexported_files: list[Path],
    exported_files: list[Path],
    models_dir: Path,
) -> dict[str, list[str]]:
    """
    Check if unexported types are used by exported types.

    Returns a dict mapping unexported file names to list of exported files using them.
    """
    # Build map of type -> file for unexported files
    unexported_types: dict[str, Path] = {}
    for f in unexported_files:
        for type_name in extract_types_from_file(f):
            unexported_types[type_name] = f

    # Check each exported file for usage of unexported types
    dependencies: dict[str, list[str]] = {}

    for exported_file in exported_files:
        used_types = find_type_usages(exported_file, set(unexported_types.keys()))
        for type_name in used_types:
            unexported_file = unexported_types[type_name]
            file_key = unexported_file.name
            if file_key not in dependencies:
                dependencies[file_key] = []
            # Record which exported file uses this unexported type
            dependencies[file_key].append(f"{type_name} (used by {exported_file.name})")

    return dependencies


def main():
    parser = argparse.ArgumentParser(
        description='Verify all model files are exported in barrel file.'
    )
    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Show detailed output including transitive dependency analysis'
    )
    parser.add_argument(
        '--check-transitive',
        action='store_true',
        default=True,
        help='Check for transitive dependencies (default: True)'
    )
    args = parser.parse_args()

    models_dir = Path('lib/src/models')
    barrel_file = Path('lib/googleai_dart.dart')

    # Verify we're in the right directory
    if not models_dir.exists():
        print("Error: lib/src/models/ not found. Run from package root directory.")
        sys.exit(2)

    if not barrel_file.exists():
        print("Error: lib/googleai_dart.dart not found. Run from package root directory.")
        sys.exit(2)

    print("Checking barrel file completeness...")
    print()

    # Find all model files and check exports
    model_files = find_model_files(models_dir)
    exports = get_barrel_exports(barrel_file)

    unexported = []
    exported_paths = []

    for f in model_files:
        if f.name not in exports:
            unexported.append(f)
        else:
            exported_paths.append(f)

    if args.verbose:
        print(f"Found {len(model_files)} model files")
        print(f"Found {len(exports)} exports in barrel file")
        print()

    if not unexported:
        print("✓ All model files are exported.")
        sys.exit(0)

    # Report unexported files
    print("UNEXPORTED FILES:")
    for f in unexported:
        relative_path = f.relative_to(Path.cwd())
        print(f"  - {relative_path}")
    print()

    # Check transitive dependencies
    if args.check_transitive and unexported:
        dependencies = check_transitive_dependencies(
            unexported, exported_paths, models_dir
        )

        if dependencies:
            print("USED BY EXPORTED CLASSES (should be exported):")
            for file_name, usages in sorted(dependencies.items()):
                print(f"  - {file_name}:")
                for usage in usages:
                    print(f"      → {usage}")
            print()

    # Summary
    print(f"Found {len(unexported)} unexported file(s).")
    print()
    print("To fix, add exports to lib/googleai_dart.dart:")
    print()
    for f in unexported:
        relative_import = str(f.relative_to(Path('lib')))
        print(f"export '{relative_import}';")

    sys.exit(1)


if __name__ == '__main__':
    main()
