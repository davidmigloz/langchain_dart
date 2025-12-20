#!/usr/bin/env python3
"""
Fetch the latest GoogleAI OpenAPI specification.

Usage:
    python3 fetch_spec.py [--output DIR]

Environment:
    GEMINI_API_KEY or GOOGLE_AI_API_KEY: API key for authentication (required)
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
SPEC_URL = "https://generativelanguage.googleapis.com/$discovery/OPENAPI3_0?version=v1beta"
DEFAULT_OUTPUT_DIR = "/tmp/openapi-updater"


def get_api_key() -> str:
    """Get API key from environment."""
    key = os.environ.get('GEMINI_API_KEY') or os.environ.get('GOOGLE_AI_API_KEY')
    if not key:
        print("ERROR: GEMINI_API_KEY or GOOGLE_AI_API_KEY environment variable not set",
              file=sys.stderr)
        sys.exit(1)
    return key


def fetch_spec(api_key: str) -> dict:
    """Fetch OpenAPI spec from Google AI."""
    url = f"{SPEC_URL}&key={api_key}"
    print(f"Fetching spec from {SPEC_URL.split('?')[0]}...")

    try:
        req = Request(url, headers={'User-Agent': 'OpenAPI-Updater/1.0'})
        with urlopen(req, timeout=30) as response:
            data = response.read().decode('utf-8')
            spec = json.loads(data)
            return spec
    except HTTPError as e:
        print(f"ERROR: HTTP {e.code}: {e.reason}", file=sys.stderr)
        sys.exit(2)
    except URLError as e:
        print(f"ERROR: Network error: {e.reason}", file=sys.stderr)
        sys.exit(2)
    except json.JSONDecodeError as e:
        print(f"ERROR: Invalid JSON response: {e}", file=sys.stderr)
        sys.exit(3)


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


def save_spec(spec: dict, output_dir: Path) -> Path:
    """Save spec to output directory."""
    output_dir.mkdir(parents=True, exist_ok=True)

    filepath = output_dir / "latest.json"
    with open(filepath, 'w') as f:
        json.dump(spec, f, indent=2)

    return filepath


def main():
    parser = argparse.ArgumentParser(description="Fetch GoogleAI OpenAPI spec")
    parser.add_argument('--output', '-o', type=Path, default=Path(DEFAULT_OUTPUT_DIR),
                        help=f"Output directory (default: {DEFAULT_OUTPUT_DIR})")
    args = parser.parse_args()

    api_key = get_api_key()
    spec = fetch_spec(api_key)

    # Validate spec structure
    if 'openapi' not in spec:
        print("ERROR: Response is not a valid OpenAPI spec", file=sys.stderr)
        sys.exit(3)

    filepath = save_spec(spec, args.output)

    # Extract metadata
    info = spec.get('info', {})
    endpoint_count = count_endpoints(spec)
    schema_count = count_schemas(spec)

    print(f"\nSpec saved to: {filepath}")
    print(f"OpenAPI version: {spec.get('openapi', 'unknown')}")
    print(f"API version: {info.get('version', 'unknown')}")
    print(f"Title: {info.get('title', 'unknown')}")
    print(f"Endpoints: {endpoint_count}")
    print(f"Schemas: {schema_count}")
    print(f"Fetched at: {datetime.now().isoformat()}")


if __name__ == '__main__':
    main()
