#!/usr/bin/env python3
"""
Fetch the latest GoogleAI OpenAPI specifications.

Supports multiple specs via registry (specs.json) and auto-discovery of new specs.

Usage:
    python3 fetch_spec.py [--spec NAME] [--no-discover] [--output DIR]

Examples:
    python3 fetch_spec.py                    # Fetch all specs + discover new
    python3 fetch_spec.py --spec main        # Fetch only main spec
    python3 fetch_spec.py --spec interactions # Fetch only interactions spec
    python3 fetch_spec.py --no-discover      # Skip discovery probing

Environment:
    GEMINI_API_KEY or GOOGLE_AI_API_KEY: API key for authenticated specs
"""

import argparse
import json
import os
import sys
from datetime import datetime
from pathlib import Path
from urllib.request import urlopen, Request
from urllib.error import URLError, HTTPError

# Configuration
SCRIPT_DIR = Path(__file__).parent
REGISTRY_PATH = SCRIPT_DIR.parent / "specs.json"
DEFAULT_OUTPUT_DIR = Path("/tmp/openapi-updater")


def load_registry() -> dict:
    """Load spec registry from specs.json."""
    if not REGISTRY_PATH.exists():
        print(f"ERROR: Registry not found: {REGISTRY_PATH}", file=sys.stderr)
        sys.exit(1)

    with open(REGISTRY_PATH) as f:
        return json.load(f)


def get_api_key() -> str | None:
    """Get API key from environment (optional for some specs)."""
    return os.environ.get('GEMINI_API_KEY') or os.environ.get('GOOGLE_AI_API_KEY')


def fetch_url(url: str, api_key: str | None = None, requires_auth: bool = False) -> dict | None:
    """Fetch JSON from URL with optional auth."""
    if requires_auth:
        if not api_key:
            print(f"  ERROR: API key required but not set", file=sys.stderr)
            return None
        url = f"{url}&key={api_key}" if '?' in url else f"{url}?key={api_key}"

    try:
        req = Request(url, headers={'User-Agent': 'OpenAPI-Updater/1.0'})
        with urlopen(req, timeout=30) as response:
            data = response.read().decode('utf-8')
            return json.loads(data)
    except HTTPError as e:
        if e.code == 404:
            return None  # Not found is expected for discovery
        print(f"  ERROR: HTTP {e.code}: {e.reason}", file=sys.stderr)
        return None
    except URLError as e:
        print(f"  ERROR: Network error: {e.reason}", file=sys.stderr)
        return None
    except json.JSONDecodeError as e:
        print(f"  ERROR: Invalid JSON: {e}", file=sys.stderr)
        return None


def count_endpoints(spec: dict) -> int:
    """Count total endpoints in spec."""
    count = 0
    for path_data in spec.get('paths', {}).values():
        for method in ['get', 'post', 'put', 'patch', 'delete']:
            if method in path_data:
                count += 1
    return count


def count_schemas(spec: dict) -> int:
    """Count schemas in spec."""
    return len(spec.get('components', {}).get('schemas', {}))


def save_spec(spec: dict, output_dir: Path, spec_name: str) -> Path:
    """Save spec to output directory."""
    output_dir.mkdir(parents=True, exist_ok=True)
    filepath = output_dir / f"latest-{spec_name}.json"
    with open(filepath, 'w') as f:
        json.dump(spec, f, indent=2)
    return filepath


def print_spec_info(spec: dict, filepath: Path):
    """Print spec metadata."""
    info = spec.get('info', {})
    print(f"  Saved to: {filepath}")
    print(f"  OpenAPI: {spec.get('openapi', 'unknown')}")
    print(f"  Version: {info.get('version', 'unknown')}")
    print(f"  Title: {info.get('title', 'unknown')}")
    print(f"  Endpoints: {count_endpoints(spec)}")
    print(f"  Schemas: {count_schemas(spec)}")


def fetch_registered_specs(registry: dict, spec_filter: str | None, output_dir: Path, api_key: str | None) -> int:
    """Fetch all registered specs (or a specific one)."""
    specs = registry.get('specs', {})
    fetched = 0

    for name, config in specs.items():
        if spec_filter and name != spec_filter:
            continue

        print(f"\n[{name}] {config.get('name', 'Unknown')}")
        url = config['url']
        requires_auth = config.get('requires_auth', False)
        experimental = config.get('experimental', False)

        if experimental:
            print(f"  (experimental)")

        print(f"  Fetching from {url.split('?')[0]}...")

        spec = fetch_url(url, api_key, requires_auth)
        if spec is None:
            print(f"  FAILED to fetch spec")
            continue

        if 'openapi' not in spec:
            print(f"  ERROR: Not a valid OpenAPI spec")
            continue

        filepath = save_spec(spec, output_dir, name)
        print_spec_info(spec, filepath)
        fetched += 1

    return fetched


def discover_new_specs(registry: dict) -> list[str]:
    """Probe for new specs at discovery patterns."""
    patterns = registry.get('discovery_patterns', [])
    names = registry.get('discovery_names', [])
    registered = set(registry.get('specs', {}).keys())

    discovered = []

    for pattern in patterns:
        for name in names:
            if name in registered:
                continue  # Already registered

            url = pattern.replace('{name}', name)
            # Quick HEAD-like check using a GET with timeout
            try:
                req = Request(url, headers={'User-Agent': 'OpenAPI-Updater/1.0'})
                with urlopen(req, timeout=5) as response:
                    if response.status == 200:
                        discovered.append((name, url))
            except:
                pass  # Not found or error, skip

    return discovered


def main():
    parser = argparse.ArgumentParser(description="Fetch GoogleAI OpenAPI specs")
    parser.add_argument('--spec', '-s', type=str, default=None,
                        help="Fetch only this spec (default: all)")
    parser.add_argument('--no-discover', action='store_true',
                        help="Skip discovery probing for new specs")
    parser.add_argument('--output', '-o', type=Path, default=DEFAULT_OUTPUT_DIR,
                        help=f"Output directory (default: {DEFAULT_OUTPUT_DIR})")
    args = parser.parse_args()

    registry = load_registry()
    api_key = get_api_key()

    print(f"OpenAPI Spec Fetcher")
    print(f"Registry: {REGISTRY_PATH}")
    print(f"Output: {args.output}")

    # Check for API key if needed
    if args.spec:
        spec_config = registry.get('specs', {}).get(args.spec)
        if not spec_config:
            print(f"\nERROR: Unknown spec '{args.spec}'", file=sys.stderr)
            print(f"Available specs: {', '.join(registry.get('specs', {}).keys())}")
            sys.exit(1)
        if spec_config.get('requires_auth') and not api_key:
            print(f"\nERROR: GEMINI_API_KEY or GOOGLE_AI_API_KEY required for '{args.spec}'",
                  file=sys.stderr)
            sys.exit(1)
    else:
        # Check if any spec requires auth
        for name, config in registry.get('specs', {}).items():
            if config.get('requires_auth') and not api_key:
                print(f"\nWARNING: API key not set - will skip '{name}' spec")

    # Fetch specs
    fetched = fetch_registered_specs(registry, args.spec, args.output, api_key)

    # Auto-discover new specs
    if not args.no_discover and not args.spec:
        print(f"\n--- Discovery ---")
        print(f"Probing for new specs...")
        discovered = discover_new_specs(registry)

        if discovered:
            print(f"\n⚠️  NEW SPECS DISCOVERED:")
            for name, url in discovered:
                print(f"  - {name}: {url}")
            print(f"\nTo add to registry, update: {REGISTRY_PATH}")
        else:
            print(f"No new specs found.")

    print(f"\n--- Summary ---")
    print(f"Fetched: {fetched} spec(s)")
    print(f"Time: {datetime.now().isoformat()}")


if __name__ == '__main__':
    main()
