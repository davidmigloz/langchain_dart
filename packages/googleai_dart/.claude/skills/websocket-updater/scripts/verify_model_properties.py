#!/usr/bin/env python3
"""
Verify critical Live API model classes have all expected properties.

This script checks that key Live API models (LiveConfig, message types, etc.)
have all properties defined in the schema.

Usage:
    python3 .claude/skills/websocket-updater/scripts/verify_model_properties.py

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


# Critical models that should be checked
# Note: Message types are consolidated into single files (client_message.dart, server_message.dart)
CRITICAL_MODELS = [
    ('LiveConfig', 'lib/src/models/live/config/live_config.dart'),
    ('LiveGenerationConfig', 'lib/src/models/live/config/live_generation_config.dart'),
    ('SpeechConfig', 'lib/src/models/live/config/speech_config.dart'),
    ('RealtimeInputConfig', 'lib/src/models/live/config/realtime_input_config.dart'),
    ('SessionResumptionConfig', 'lib/src/models/live/config/session_resumption_config.dart'),
    ('BidiGenerateContentSetup', 'lib/src/models/live/messages/client/client_message.dart'),
    ('BidiGenerateContentServerContent', 'lib/src/models/live/messages/server/server_message.dart'),
    # Tool-related models that are used in Live API for tool call correlation
    ('FunctionCall', 'lib/src/models/tools/function_call.dart'),
    ('FunctionResponse', 'lib/src/models/tools/function_response.dart'),
]

# Expected properties for each model (from Live API schema)
# Note: speechConfig is in LiveGenerationConfig, NOT in LiveConfig
EXPECTED_PROPERTIES = {
    'LiveConfig': {
        'generationConfig', 'realtimeInputConfig',
        'tools', 'systemInstruction', 'sessionResumption',
        'contextWindowCompression', 'inputAudioTranscription',
        'outputAudioTranscription', 'proactivity'
    },
    'LiveGenerationConfig': {
        'responseModalities', 'speechConfig', 'temperature',
        'maxOutputTokens', 'topP', 'topK'
    },
    'SpeechConfig': {
        'voiceConfig', 'languageCode'
    },
    'RealtimeInputConfig': {
        'automaticActivityDetection', 'activityHandling', 'turnCoverage'
    },
    'SessionResumptionConfig': {
        'handle', 'transparent'
    },
    'BidiGenerateContentSetup': {
        'model', 'generationConfig', 'systemInstruction', 'tools',
        'realtimeInputConfig', 'sessionResumption', 'contextWindowCompression',
        'inputAudioTranscription', 'outputAudioTranscription', 'proactivity'
    },
    'BidiGenerateContentServerContent': {
        'modelTurn', 'turnComplete', 'generationComplete', 'interrupted',
        'inputTranscription', 'outputTranscription',
        'groundingMetadata', 'usageMetadata'
    },
    # Tool models - id field is critical for Live API tool call correlation
    'FunctionCall': {
        'id', 'name', 'args'
    },
    'FunctionResponse': {
        'id', 'name', 'response'
    },
}


def get_dart_properties(dart_file: Path) -> set[str]:
    """Extract property names from Dart class file."""
    if not dart_file.exists():
        return set()

    content = dart_file.read_text()
    properties = set()

    # Match final field declarations
    field_pattern = r'final\s+[\w<>?,\s]+\s+(\w+)\s*;'
    for match in re.finditer(field_pattern, content):
        properties.add(match.group(1))

    # Match constructor named parameters
    constructor_pattern = r'this\.(\w+)'
    for match in re.finditer(constructor_pattern, content):
        properties.add(match.group(1))

    return properties


def to_camel_case(name: str) -> str:
    """Convert to camelCase for comparison."""
    if '_' not in name and name[0].islower():
        return name
    if '_' in name:
        parts = name.split('_')
        return parts[0].lower() + ''.join(p.title() for p in parts[1:])
    return name[0].lower() + name[1:]


def verify_model(
    model_name: str,
    dart_file: Path,
    expected: set[str],
) -> tuple[bool, set[str], set[str]]:
    """Verify a model has all expected properties."""
    dart_props = get_dart_properties(dart_file)
    normalized_dart = {to_camel_case(p) for p in dart_props}
    normalized_expected = {to_camel_case(p) for p in expected}

    # Skip internal Dart properties
    internal = {'hashCode', 'runtimeType', 'copyWith', 'toJson', 'fromJson'}
    normalized_dart -= internal

    missing = normalized_expected - normalized_dart
    extra = normalized_dart - normalized_expected

    return len(missing) == 0, missing, extra


def main():
    parser = argparse.ArgumentParser(
        description='Verify Live API model properties.'
    )
    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Show detailed output'
    )
    parser.add_argument(
        '--model', '-m',
        type=str,
        help='Check only a specific model'
    )
    args = parser.parse_args()

    print("Checking Live API model properties...")
    print()

    models_to_check = CRITICAL_MODELS
    if args.model:
        models_to_check = [m for m in CRITICAL_MODELS if m[0] == args.model]
        if not models_to_check:
            print(f"Error: Unknown model '{args.model}'")
            print(f"Available: {', '.join(m[0] for m in CRITICAL_MODELS)}")
            sys.exit(2)

    has_issues = False
    files_not_found = 0

    for model_name, dart_path in models_to_check:
        dart_file = Path(dart_path)

        if not dart_file.exists():
            files_not_found += 1
            if args.verbose:
                print(f"⚠️  {model_name}: File not found - {dart_path}")
            continue

        expected = EXPECTED_PROPERTIES.get(model_name, set())
        if not expected:
            if args.verbose:
                print(f"⚠️  {model_name}: No expected properties defined")
            continue

        is_complete, missing, extra = verify_model(model_name, dart_file, expected)

        if is_complete:
            print(f"✓  {model_name}: All properties present")
        else:
            has_issues = True
            print(f"⚠️  {model_name}: Missing - {', '.join(sorted(missing))}")
            if args.verbose and extra:
                print(f"   Extra (may be computed): {', '.join(sorted(extra))}")

    print()

    if files_not_found == len(models_to_check):
        print("No Live API model files found yet.")
        print("This is expected if Live API is not yet implemented.")
        sys.exit(0)

    if has_issues:
        print("ACTION REQUIRED: Add missing properties to Dart models.")
        print()
        print("For each missing property:")
        print("  1. Add the field to the Dart class")
        print("  2. Update constructor, fromJson, toJson, and copyWith")
        sys.exit(1)
    else:
        print("✓ All critical models have expected properties.")
        sys.exit(0)


if __name__ == '__main__':
    main()
