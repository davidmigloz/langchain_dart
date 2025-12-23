#!/usr/bin/env python3
"""
Verify all Live API model files are exported in the barrel file.

This script scans all .dart files in lib/src/models/live/ and lib/src/live/
and checks that each is exported in lib/googleai_dart.dart.

Usage:
    python3 .claude/skills/websocket-updater/scripts/verify_exports.py

Exit codes:
    0 - All files are exported
    1 - Unexported files found
    2 - Error (wrong directory, missing files, etc.)
"""

import argparse
import re
import sys
from pathlib import Path


def is_part_file(file: Path) -> bool:
    """Check if a file uses 'part of' directive (included in another file)."""
    try:
        content = file.read_text()
        for line in content.split('\n'):
            line = line.strip()
            if not line or line.startswith('//'):
                continue
            if line.startswith('part of'):
                return True
            if line.startswith(('import ', 'export ', 'library ')):
                return False
        return False
    except Exception:
        return False


def find_live_files() -> list[Path]:
    """Find all Live API .dart files."""
    files = []

    # Directories to check
    dirs = [
        Path('lib/src/models/live'),
        Path('lib/src/live'),
    ]

    # Internal files to skip (implementation details, not public API)
    skip_files = {
        'copy_with_sentinel.dart',
        # Platform-specific WebSocket connectors (internal to LiveClient)
        'websocket_connector.dart',
        'websocket_connector_io.dart',
        'websocket_connector_web.dart',
        'websocket_connector_stub.dart',
    }

    for dir_path in dirs:
        if not dir_path.exists():
            continue
        for dart_file in dir_path.glob('**/*.dart'):
            if any(part.startswith('.') for part in dart_file.parts):
                continue
            if dart_file.name in skip_files:
                continue
            if is_part_file(dart_file):
                continue
            files.append(dart_file)

    return sorted(files)


def get_barrel_exports(barrel_file: Path) -> set[str]:
    """Extract exported filenames from barrel file."""
    exports = set()
    content = barrel_file.read_text()
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
        if re.search(rf'\b{type_name}\b', content):
            used.add(type_name)
    return used


def check_transitive_dependencies(
    unexported_files: list[Path],
    exported_files: list[Path],
) -> dict[str, list[str]]:
    """Check if unexported types are used by exported types."""
    unexported_types: dict[str, Path] = {}
    for f in unexported_files:
        for type_name in extract_types_from_file(f):
            unexported_types[type_name] = f

    dependencies: dict[str, list[str]] = {}

    for exported_file in exported_files:
        used_types = find_type_usages(exported_file, set(unexported_types.keys()))
        for type_name in used_types:
            unexported_file = unexported_types[type_name]
            file_key = unexported_file.name
            if file_key not in dependencies:
                dependencies[file_key] = []
            dependencies[file_key].append(f"{type_name} (used by {exported_file.name})")

    return dependencies


def main():
    parser = argparse.ArgumentParser(
        description='Verify all Live API files are exported in barrel file.'
    )
    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Show detailed output'
    )
    args = parser.parse_args()

    barrel_file = Path('lib/googleai_dart.dart')

    if not barrel_file.exists():
        print("Error: lib/googleai_dart.dart not found. Run from package root.")
        sys.exit(2)

    print("Checking Live API exports...")
    print()

    live_files = find_live_files()

    if not live_files:
        print("No Live API files found yet. This is expected if not implemented.")
        sys.exit(0)

    exports = get_barrel_exports(barrel_file)

    unexported = []
    exported_paths = []

    for f in live_files:
        if f.name not in exports:
            unexported.append(f)
        else:
            exported_paths.append(f)

    if args.verbose:
        print(f"Found {len(live_files)} Live API files")
        print(f"Found {len(exports)} exports in barrel file")
        print()

    if not unexported:
        print("✓ All Live API files are exported.")
        sys.exit(0)

    print("UNEXPORTED FILES:")
    for f in unexported:
        print(f"  - {f}")
    print()

    dependencies = check_transitive_dependencies(unexported, exported_paths)

    if dependencies:
        print("USED BY EXPORTED CLASSES (should be exported):")
        for file_name, usages in sorted(dependencies.items()):
            print(f"  - {file_name}:")
            for usage in usages:
                print(f"      → {usage}")
        print()

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
