# Tools & Scripts for OpenAPI Spec Analysis

**Purpose**: Document the tools, scripts, and methodologies used to analyze the GoogleAI OpenAPI specification. This enables repeatable analysis when the spec is updated in the future.

**Date Created**: 2025-09-30
**Last Updated**: 2025-09-30

---

## Table of Contents

1. [OpenAPI Spec Source](#1-openapi-spec-source)
2. [Analysis Tools](#2-analysis-tools)
3. [Manual Analysis Process](#3-manual-analysis-process)
4. [Automated Scripts](#4-automated-scripts)
5. [Validation Tools](#5-validation-tools)
6. [Future Updates](#6-future-updates)

---

## 1. OpenAPI Spec Source

### Current Spec Location

**URL**: `https://generativelanguage.googleapis.com/$discovery/OPENAPI3_0?version=v1beta&key={GEMINI_API_KEY}`

**Version**: v1beta
**Revision**: 20250928
**Format**: OpenAPI 3.0 (JSON)

### How to Fetch the Spec

#### Method 1: Using curl

```bash
curl -s "https://generativelanguage.googleapis.com/\$discovery/OPENAPI3_0?version=v1beta&key=YOUR_API_KEY" \
  -o googleai-openapi-spec.json
```

#### Method 2: Using WebFetch Tool (Claude Code)

```dart
// In Claude Code environment
WebFetch(
  url: "https://generativelanguage.googleapis.com/\$discovery/OPENAPI3_0?version=v1beta&key=YOUR_API_KEY",
  prompt: "Extract the complete OpenAPI specification structure..."
)
```

#### Method 3: Using wget

```bash
wget -O googleai-openapi-spec.json \
  "https://generativelanguage.googleapis.com/\$discovery/OPENAPI3_0?version=v1beta&key=YOUR_API_KEY"
```

### Save Local Copy

Always save a timestamped copy for reference:

```bash
curl -s "https://generativelanguage.googleapis.com/\$discovery/OPENAPI3_0?version=v1beta&key=YOUR_API_KEY" \
  -o "googleai-openapi-spec-$(date +%Y%m%d).json"
```

---

## 2. Analysis Tools

### 2.1 WebFetch Tool (Primary Method)

The WebFetch tool in Claude Code environment was used for initial analysis:

```dart
WebFetch(
  url: "https://generativelanguage.googleapis.com/\$discovery/OPENAPI3_0?version=v1beta&key=YOUR_API_KEY",
  prompt: """Extract the complete OpenAPI specification structure, including:
    1) All API endpoints with methods, paths, parameters, and request/response schemas
    2) All model/schema definitions
    3) Authentication methods
    4) Base URL and servers
    5) Key operations and their descriptions.
    Provide a comprehensive summary of the API's capabilities."""
)
```

**Output**: High-level summary of API structure, endpoints, and schemas.

### 2.2 Task Tool with General-Purpose Agent (Deep Analysis)

For comprehensive extraction, a general-purpose agent was used:

```dart
Task(
  subagent_type: "general-purpose",
  description: "Deep analysis of GoogleAI OpenAPI",
  prompt: """I need you to thoroughly analyze the GoogleAI OpenAPI specification from this URL:
    https://generativelanguage.googleapis.com/\$discovery/OPENAPI3_0?version=v1beta&key=YOUR_API_KEY

    This is for research purposes only - DO NOT make any changes to files.

    Please extract and document the following in detail:

    1. **All API Endpoints** - Complete list with:
       - HTTP method and path
       - Operation ID
       - Description
       - All parameters (path, query, header, body)
       - Request schema details
       - Response schemas (success and error cases)
       - Any authentication requirements

    2. **All Data Models/Schemas** - For each schema:
       - Schema name
       - All properties with types, descriptions, constraints
       - Required vs optional fields
       - Polymorphic types (discriminators, oneOf, anyOf)
       - Nested object structures
       - Enum values where applicable

    3. **Authentication & Authorization**:
       - Auth methods (API key, OAuth, etc.)
       - Security schemes
       - Permission models if any

    4. **Base Configuration**:
       - Base URLs/servers
       - Common headers
       - Rate limiting info if present

    5. **Special Patterns**:
       - Streaming endpoints
       - Long-running operations
       - Batch operations
       - Pagination patterns
       - File upload mechanisms

    6. **Unknowns/Clarifications Needed**:
       - Ambiguous endpoint behaviors
       - Missing schema details
       - Unclear authentication flows
       - Edge cases not documented

    Return a comprehensive report with all findings organized by these categories."""
)
```

**Output**: Detailed analysis documents with complete endpoint and schema breakdowns.

### 2.3 jq (Command-Line JSON Processor)

For local analysis of downloaded specs:

#### Count Total Endpoints

```bash
jq '.paths | to_entries | length' googleai-openapi-spec.json
```

#### List All HTTP Methods

```bash
jq '.paths | to_entries | map(.value | keys[]) | unique' googleai-openapi-spec.json
```

#### Extract All Endpoint Paths

```bash
jq -r '.paths | keys[]' googleai-openapi-spec.json
```

#### Count Total Schemas

```bash
jq '.components.schemas | length' googleai-openapi-spec.json
```

#### List All Schema Names

```bash
jq -r '.components.schemas | keys[]' googleai-openapi-spec.json | sort
```

#### Extract Specific Endpoint Details

```bash
# Example: Get generateContent endpoint
jq '.paths."/v1beta/models/{model}:generateContent".post' googleai-openapi-spec.json
```

#### Extract Specific Schema

```bash
# Example: Get GenerateContentRequest schema
jq '.components.schemas.GenerateContentRequest' googleai-openapi-spec.json
```

#### Find All Enums

```bash
jq -r '.components.schemas | to_entries[] | select(.value.enum != null) | "\(.key): \(.value.enum | join(", "))"' googleai-openapi-spec.json
```

#### Extract All Required Fields by Schema

```bash
jq -r '.components.schemas | to_entries[] | "\(.key): \(.value.required // [] | join(", "))"' googleai-openapi-spec.json
```

### 2.4 OpenAPI Tools

#### Swagger Editor (Web-based)

Upload spec to visualize and validate:

1. Go to https://editor.swagger.io/
2. File → Import File → Select `googleai-openapi-spec.json`
3. View in UI, test endpoints (if server available)

#### openapi-generator-cli (Code Generation - Reference Only)

Generate client code for comparison (NOT used for actual implementation):

```bash
# Install
npm install -g @openapitools/openapi-generator-cli

# Generate Dart client (for reference/comparison)
openapi-generator-cli generate \
  -i googleai-openapi-spec.json \
  -g dart \
  -o ./reference-client \
  --additional-properties=pubName=googleai_dart_reference
```

**Note**: We use manual serialization, but generated code can help validate schema interpretations.

### 2.5 VS Code Extensions

Useful extensions for working with OpenAPI specs:

- **OpenAPI (Swagger) Editor** - `42Crunch.vscode-openapi`
- **REST Client** - `humao.rest-client` (test endpoints)
- **JSON Tools** - `eriklynd.json-tools` (format, minify)

### 2.6 Python Scripts

#### Extract Endpoints to CSV

```python
#!/usr/bin/env python3
import json
import csv
import sys

def extract_endpoints(spec_file, output_csv):
    with open(spec_file, 'r') as f:
        spec = json.load(f)

    endpoints = []
    for path, methods in spec['paths'].items():
        for method, details in methods.items():
            if method in ['get', 'post', 'put', 'patch', 'delete']:
                endpoints.append({
                    'method': method.upper(),
                    'path': path,
                    'operationId': details.get('operationId', ''),
                    'description': details.get('description', ''),
                    'tags': ', '.join(details.get('tags', [])),
                })

    with open(output_csv, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=['method', 'path', 'operationId', 'description', 'tags'])
        writer.writeheader()
        writer.writerows(endpoints)

    print(f"Extracted {len(endpoints)} endpoints to {output_csv}")

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Usage: python extract_endpoints.py <spec.json> <output.csv>")
        sys.exit(1)

    extract_endpoints(sys.argv[1], sys.argv[2])
```

**Usage**:

```bash
python extract_endpoints.py googleai-openapi-spec.json endpoints.csv
```

#### Extract Schemas to JSON

```python
#!/usr/bin/env python3
import json
import sys

def extract_schemas(spec_file, output_file):
    with open(spec_file, 'r') as f:
        spec = json.load(f)

    schemas = spec.get('components', {}).get('schemas', {})

    # Add metadata
    output = {
        'count': len(schemas),
        'schemas': {}
    }

    for name, schema in schemas.items():
        output['schemas'][name] = {
            'type': schema.get('type', 'object'),
            'description': schema.get('description', ''),
            'properties': list(schema.get('properties', {}).keys()),
            'required': schema.get('required', []),
            'enum': schema.get('enum', None),
        }

    with open(output_file, 'w') as f:
        json.dump(output, f, indent=2)

    print(f"Extracted {len(schemas)} schemas to {output_file}")

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Usage: python extract_schemas.py <spec.json> <output.json>")
        sys.exit(1)

    extract_schemas(sys.argv[1], sys.argv[2])
```

**Usage**:

```bash
python extract_schemas.py googleai-openapi-spec.json schemas-summary.json
```

#### Find Polymorphic Types

```python
#!/usr/bin/env python3
import json
import sys

def find_polymorphic_types(spec_file):
    with open(spec_file, 'r') as f:
        spec = json.load(f)

    schemas = spec.get('components', {}).get('schemas', {})
    polymorphic = []

    for name, schema in schemas.items():
        # Check for oneOf, anyOf, allOf, discriminator
        if any(key in schema for key in ['oneOf', 'anyOf', 'allOf', 'discriminator']):
            polymorphic.append({
                'name': name,
                'oneOf': len(schema.get('oneOf', [])),
                'anyOf': len(schema.get('anyOf', [])),
                'allOf': len(schema.get('allOf', [])),
                'discriminator': schema.get('discriminator', {}).get('propertyName', None),
            })

        # Check for properties with multiple mutually exclusive fields
        properties = schema.get('properties', {})
        if len(properties) > 5:  # Heuristic: many optional fields might indicate polymorphism
            required = set(schema.get('required', []))
            optional_count = len(properties) - len(required)
            if optional_count > 5 and len(required) == 0:
                polymorphic.append({
                    'name': name,
                    'type': 'mutually_exclusive_fields',
                    'optional_fields': optional_count,
                })

    print(f"Found {len(polymorphic)} polymorphic types:")
    for p in polymorphic:
        print(f"  - {p['name']}: {p}")

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python find_polymorphic_types.py <spec.json>")
        sys.exit(1)

    find_polymorphic_types(sys.argv[1])
```

**Usage**:

```bash
python find_polymorphic_types.py googleai-openapi-spec.json
```

---

## 3. Manual Analysis Process

### Step-by-Step Workflow

#### Step 1: Fetch Latest Spec

```bash
# Set your API key
export GOOGLE_AI_API_KEY="your_api_key_here"

# Fetch spec with timestamp
curl -s "https://generativelanguage.googleapis.com/\$discovery/OPENAPI3_0?version=v1beta&key=$GOOGLE_AI_API_KEY" \
  -o "specs/googleai-openapi-$(date +%Y%m%d).json"

# Create symlink to latest
ln -sf "googleai-openapi-$(date +%Y%m%d).json" specs/latest.json
```

#### Step 2: Validate Spec

```bash
# Check if valid JSON
jq empty specs/latest.json && echo "Valid JSON" || echo "Invalid JSON"

# Check OpenAPI version
jq -r '.openapi' specs/latest.json

# Check API info
jq '.info' specs/latest.json
```

#### Step 3: Extract High-Level Stats

```bash
# Count endpoints
echo "Total endpoints: $(jq '.paths | to_entries | length' specs/latest.json)"

# Count schemas
echo "Total schemas: $(jq '.components.schemas | length' specs/latest.json)"

# List unique tags
echo "Tags: $(jq -r '.paths | to_entries | map(.value | to_entries[] | .value.tags[]?) | unique | join(", ")' specs/latest.json)"
```

#### Step 4: Categorize Endpoints

```bash
# Extract by HTTP method
echo "GET endpoints:"
jq -r '.paths | to_entries[] | select(.value.get != null) | .key' specs/latest.json

echo "POST endpoints:"
jq -r '.paths | to_entries[] | select(.value.post != null) | .key' specs/latest.json

echo "PATCH endpoints:"
jq -r '.paths | to_entries[] | select(.value.patch != null) | .key' specs/latest.json

echo "DELETE endpoints:"
jq -r '.paths | to_entries[] | select(.value.delete != null) | .key' specs/latest.json
```

#### Step 5: Analyze Critical Schemas

Focus on these key schemas:

1. **Request/Response pairs**:
   - `GenerateContentRequest` / `GenerateContentResponse`
   - `EmbedContentRequest` / `EmbedContentResponse`

2. **Core content types**:
   - `Content`
   - `Part` ⭐ (check for polymorphism)
   - `Blob`, `FileData`

3. **Configuration**:
   - `GenerationConfig`
   - `SafetySetting`

4. **Tools**:
   - `Tool`
   - `FunctionDeclaration`

```bash
# Extract specific schema
jq '.components.schemas.Part' specs/latest.json > analysis/part-schema.json

# Check Part properties
jq '.components.schemas.Part.properties | keys' specs/latest.json
```

#### Step 6: Identify Unknowns

Check for:

- Endpoints with unclear operation IDs
- Schemas with missing descriptions
- Enums without value descriptions
- Missing authentication schemes

```bash
# Find endpoints without descriptions
jq -r '.paths | to_entries[] | .key as $path | .value | to_entries[] | select(.value.description == null or .value.description == "") | "\($path) \(.key)"' specs/latest.json

# Find schemas without descriptions
jq -r '.components.schemas | to_entries[] | select(.value.description == null or .value.description == "") | .key' specs/latest.json
```

#### Step 7: Compare with Previous Version

```bash
# Diff two specs
jq -S . specs/googleai-openapi-20250928.json > /tmp/old-sorted.json
jq -S . specs/latest.json > /tmp/new-sorted.json
diff /tmp/old-sorted.json /tmp/new-sorted.json > analysis/spec-diff.txt

# Count changed endpoints
echo "Changed endpoints: $(grep -c 'paths' analysis/spec-diff.txt)"

# Count changed schemas
echo "Changed schemas: $(grep -c 'components.schemas' analysis/spec-diff.txt)"
```

#### Step 8: Document Findings

Create structured analysis documents:

- `research.md` - Architectural decisions and unknowns
- `data-model.md` - Complete schema definitions
- `implementation_plan.md` - File-by-file breakdown
- `changelog-vXXXX.md` - Changes from previous version

---

## 4. Automated Scripts

### 4.1 Full Analysis Script

Save as `scripts/analyze_openapi.sh`:

```bash
#!/bin/bash
set -e

# Configuration
SPEC_URL="https://generativelanguage.googleapis.com/\$discovery/OPENAPI3_0?version=v1beta&key=$GOOGLE_AI_API_KEY"
SPEC_DIR="specs"
ANALYSIS_DIR="analysis"
DATE=$(date +%Y%m%d)

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== GoogleAI OpenAPI Analysis ===${NC}"

# Step 1: Fetch spec
echo -e "${GREEN}[1/7] Fetching OpenAPI spec...${NC}"
mkdir -p "$SPEC_DIR"
curl -s "$SPEC_URL" -o "$SPEC_DIR/googleai-openapi-$DATE.json"
ln -sf "googleai-openapi-$DATE.json" "$SPEC_DIR/latest.json"

# Step 2: Validate
echo -e "${GREEN}[2/7] Validating spec...${NC}"
if jq empty "$SPEC_DIR/latest.json"; then
    echo "✓ Valid JSON"
else
    echo "✗ Invalid JSON"
    exit 1
fi

# Step 3: Extract metadata
echo -e "${GREEN}[3/7] Extracting metadata...${NC}"
mkdir -p "$ANALYSIS_DIR"
jq '.info' "$SPEC_DIR/latest.json" > "$ANALYSIS_DIR/info.json"
echo "API Version: $(jq -r '.info.version' "$SPEC_DIR/latest.json")"
echo "API Title: $(jq -r '.info.title' "$SPEC_DIR/latest.json")"

# Step 4: Count resources
echo -e "${GREEN}[4/7] Counting resources...${NC}"
ENDPOINT_COUNT=$(jq '.paths | to_entries | length' "$SPEC_DIR/latest.json")
SCHEMA_COUNT=$(jq '.components.schemas | length' "$SPEC_DIR/latest.json")
echo "Total endpoints: $ENDPOINT_COUNT"
echo "Total schemas: $SCHEMA_COUNT"

# Step 5: Extract endpoints
echo -e "${GREEN}[5/7] Extracting endpoints...${NC}"
jq -r '.paths | to_entries[] | "\(.value | to_entries[] | select(.key != "parameters") | .key | ascii_upcase) \(.key)"' "$SPEC_DIR/latest.json" | sort > "$ANALYSIS_DIR/endpoints.txt"
echo "Endpoint list saved to $ANALYSIS_DIR/endpoints.txt"

# Step 6: Extract schemas
echo -e "${GREEN}[6/7] Extracting schemas...${NC}"
jq -r '.components.schemas | keys[]' "$SPEC_DIR/latest.json" | sort > "$ANALYSIS_DIR/schemas.txt"
echo "Schema list saved to $ANALYSIS_DIR/schemas.txt"

# Step 7: Generate summary
echo -e "${GREEN}[7/7] Generating summary...${NC}"
cat > "$ANALYSIS_DIR/summary-$DATE.md" << EOF
# OpenAPI Analysis Summary

**Date**: $DATE
**API Version**: $(jq -r '.info.version' "$SPEC_DIR/latest.json")
**OpenAPI Version**: $(jq -r '.openapi' "$SPEC_DIR/latest.json")

## Statistics

- **Total Endpoints**: $ENDPOINT_COUNT
- **Total Schemas**: $SCHEMA_COUNT
- **Base URL**: $(jq -r '.servers[0].url' "$SPEC_DIR/latest.json")

## Endpoints by Method

- **GET**: $(grep -c '^GET' "$ANALYSIS_DIR/endpoints.txt")
- **POST**: $(grep -c '^POST' "$ANALYSIS_DIR/endpoints.txt")
- **PATCH**: $(grep -c '^PATCH' "$ANALYSIS_DIR/endpoints.txt")
- **DELETE**: $(grep -c '^DELETE' "$ANALYSIS_DIR/endpoints.txt")

## Next Steps

1. Review \`$ANALYSIS_DIR/endpoints.txt\` for full endpoint list
2. Review \`$ANALYSIS_DIR/schemas.txt\` for full schema list
3. Run detailed analysis scripts for specific schemas
4. Document unknowns in \`research.md\`

EOF

echo -e "${BLUE}=== Analysis Complete ===${NC}"
echo "Summary: $ANALYSIS_DIR/summary-$DATE.md"
```

**Usage**:

```bash
chmod +x scripts/analyze_openapi.sh
export GOOGLE_AI_API_KEY="your_key"
./scripts/analyze_openapi.sh
```

### 4.2 Diff Script (Compare Versions)

Save as `scripts/diff_specs.sh`:

```bash
#!/bin/bash
set -e

if [ $# -ne 2 ]; then
    echo "Usage: $0 <old-spec.json> <new-spec.json>"
    exit 1
fi

OLD_SPEC="$1"
NEW_SPEC="$2"
DIFF_DIR="analysis/diffs"

mkdir -p "$DIFF_DIR"

echo "=== OpenAPI Spec Diff ==="

# Normalize and sort
jq -S . "$OLD_SPEC" > /tmp/old-sorted.json
jq -S . "$NEW_SPEC" > /tmp/new-sorted.json

# Full diff
diff -u /tmp/old-sorted.json /tmp/new-sorted.json > "$DIFF_DIR/full-diff.txt" || true

# Endpoint diff
jq -r '.paths | keys[]' "$OLD_SPEC" | sort > /tmp/old-endpoints.txt
jq -r '.paths | keys[]' "$NEW_SPEC" | sort > /tmp/new-endpoints.txt
diff -u /tmp/old-endpoints.txt /tmp/new-endpoints.txt > "$DIFF_DIR/endpoint-diff.txt" || true

# Schema diff
jq -r '.components.schemas | keys[]' "$OLD_SPEC" | sort > /tmp/old-schemas.txt
jq -r '.components.schemas | keys[]' "$NEW_SPEC" | sort > /tmp/new-schemas.txt
diff -u /tmp/old-schemas.txt /tmp/new-schemas.txt > "$DIFF_DIR/schema-diff.txt" || true

# Summary
echo "Differences saved to $DIFF_DIR/"
echo "Added endpoints: $(grep -c '^+' "$DIFF_DIR/endpoint-diff.txt" || echo 0)"
echo "Removed endpoints: $(grep -c '^-' "$DIFF_DIR/endpoint-diff.txt" || echo 0)"
echo "Added schemas: $(grep -c '^+' "$DIFF_DIR/schema-diff.txt" || echo 0)"
echo "Removed schemas: $(grep -c '^-' "$DIFF_DIR/schema-diff.txt" || echo 0)"
```

**Usage**:

```bash
chmod +x scripts/diff_specs.sh
./scripts/diff_specs.sh specs/googleai-openapi-20250901.json specs/googleai-openapi-20250928.json
```

### 4.3 Schema Complexity Analyzer

Save as `scripts/analyze_schema_complexity.py`:

```python
#!/usr/bin/env python3
"""Analyze schema complexity to identify challenging types."""
import json
import sys
from typing import Dict, Any

def analyze_complexity(schema: Dict[str, Any]) -> Dict[str, Any]:
    """Calculate complexity metrics for a schema."""
    properties = schema.get('properties', {})
    required = schema.get('required', [])

    # Count nested levels
    max_depth = 0
    for prop_schema in properties.values():
        if 'properties' in prop_schema:
            max_depth = max(max_depth, 1 + analyze_complexity(prop_schema)['max_depth'])
        elif 'items' in prop_schema:
            max_depth = max(max_depth, 1)

    return {
        'property_count': len(properties),
        'required_count': len(required),
        'optional_count': len(properties) - len(required),
        'max_depth': max_depth,
        'has_discriminator': 'discriminator' in schema,
        'has_one_of': 'oneOf' in schema,
        'has_any_of': 'anyOf' in schema,
        'has_all_of': 'allOf' in schema,
    }

def main(spec_file: str, output_file: str):
    with open(spec_file, 'r') as f:
        spec = json.load(f)

    schemas = spec.get('components', {}).get('schemas', {})
    results = []

    for name, schema in schemas.items():
        complexity = analyze_complexity(schema)
        complexity['name'] = name

        # Calculate overall complexity score
        score = (
            complexity['property_count'] * 1 +
            complexity['optional_count'] * 2 +  # Optional fields increase complexity
            complexity['max_depth'] * 5 +
            (complexity['has_one_of'] or complexity['has_any_of']) * 10 +
            complexity['has_discriminator'] * 5
        )
        complexity['complexity_score'] = score

        results.append(complexity)

    # Sort by complexity
    results.sort(key=lambda x: x['complexity_score'], reverse=True)

    # Save results
    with open(output_file, 'w') as f:
        json.dump(results, f, indent=2)

    # Print top 10 most complex
    print("Top 10 Most Complex Schemas:")
    for i, result in enumerate(results[:10], 1):
        print(f"{i}. {result['name']} (score: {result['complexity_score']})")
        print(f"   Properties: {result['property_count']}, Depth: {result['max_depth']}")

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Usage: python analyze_schema_complexity.py <spec.json> <output.json>")
        sys.exit(1)

    main(sys.argv[1], sys.argv[2])
```

**Usage**:

```bash
python scripts/analyze_schema_complexity.py specs/latest.json analysis/complexity.json
```

---

## 5. Validation Tools

### 5.1 Validate Against Live API

Create a simple test script to validate interpretations:

**File**: `scripts/validate_api.dart`

```dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> main() async {
  final apiKey = Platform.environment['GOOGLE_AI_API_KEY'];
  if (apiKey == null) {
    print('Error: GOOGLE_AI_API_KEY not set');
    exit(1);
  }

  // Test 1: List models
  print('Testing: List models...');
  final modelsUrl = Uri.parse(
    'https://generativelanguage.googleapis.com/v1beta/models?key=$apiKey',
  );
  final modelsResponse = await http.get(modelsUrl);
  if (modelsResponse.statusCode == 200) {
    final models = jsonDecode(modelsResponse.body);
    print('✓ Found ${models['models'].length} models');
  } else {
    print('✗ Failed: ${modelsResponse.statusCode}');
  }

  // Test 2: Generate content
  print('Testing: Generate content...');
  final generateUrl = Uri.parse(
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey',
  );
  final generateResponse = await http.post(
    generateUrl,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'contents': [
        {
          'parts': [
            {'text': 'Say hello'}
          ]
        }
      ]
    }),
  );
  if (generateResponse.statusCode == 200) {
    final response = jsonDecode(generateResponse.body);
    print('✓ Generated response: ${response['candidates'][0]['content']['parts'][0]['text']}');
  } else {
    print('✗ Failed: ${generateResponse.statusCode}');
    print('  ${generateResponse.body}');
  }

  // Test 3: Check streaming format (just inspect headers)
  print('Testing: Streaming format detection...');
  final streamUrl = Uri.parse(
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:streamGenerateContent?key=$apiKey',
  );
  final streamRequest = http.Request('POST', streamUrl)
    ..headers['Content-Type'] = 'application/json'
    ..body = jsonEncode({
      'contents': [
        {
          'parts': [
            {'text': 'Count to 3'}
          ]
        }
      ]
    });

  final streamResponse = await streamRequest.send();
  print('  Content-Type: ${streamResponse.headers['content-type']}');
  print('  Transfer-Encoding: ${streamResponse.headers['transfer-encoding']}');

  // Read first few lines to determine format
  final lines = <String>[];
  await for (final chunk in streamResponse.stream.transform(utf8.decoder).transform(const LineSplitter())) {
    lines.add(chunk);
    if (lines.length >= 3) break;
  }

  if (lines.any((line) => line.startsWith('data: '))) {
    print('✓ Streaming format: SSE (Server-Sent Events)');
  } else if (lines.any((line) => line.trim().startsWith('{'))) {
    print('✓ Streaming format: NDJSON (Newline-Delimited JSON)');
  } else {
    print('⚠ Unknown streaming format');
  }

  print('\nValidation complete!');
}
```

**Usage**:

```bash
export GOOGLE_AI_API_KEY="your_key"
dart run scripts/validate_api.dart
```

### 5.2 Schema Validation

Use JSON Schema validator to validate spec:

```bash
# Install AJV (JSON Schema validator)
npm install -g ajv-cli

# Validate spec against OpenAPI 3.0 schema
ajv validate \
  -s openapi-3.0-schema.json \
  -d specs/latest.json \
  --strict=false
```

---

## 6. Future Updates

### When to Re-analyze

Re-run analysis when:

1. **API version changes** (e.g., v1beta → v1)
2. **Major feature releases** (e.g., new tool types, new modalities)
3. **Breaking changes announced** in release notes
4. **Monthly routine check** (first week of month)

### Update Checklist

- [ ] Fetch latest spec with timestamp
- [ ] Run `scripts/analyze_openapi.sh`
- [ ] Run `scripts/diff_specs.sh` to compare with previous version
- [ ] Review diff output for breaking changes
- [ ] Update `research.md` with new findings
- [ ] Update `data-model.md` with new/changed schemas
- [ ] Update `implementation_plan.md` if architecture affected
- [ ] Run `scripts/validate_api.dart` to test live API behavior
- [ ] Document changes in `CHANGELOG.md`
- [ ] Update examples if endpoints changed

### Automated Monitoring

Set up a cron job or GitHub Action to check for spec updates:

**File**: `.github/workflows/check-spec-updates.yml`

```yaml
name: Check OpenAPI Spec Updates

on:
  schedule:
    - cron: '0 0 * * 1'  # Weekly on Monday
  workflow_dispatch:

jobs:
  check-updates:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Fetch latest spec
        env:
          GOOGLE_AI_API_KEY: ${{ secrets.GOOGLE_AI_API_KEY }}
        run: |
          curl -s "https://generativelanguage.googleapis.com/\$discovery/OPENAPI3_0?version=v1beta&key=$GOOGLE_AI_API_KEY" \
            -o specs/latest-check.json

      - name: Compare with current
        id: diff
        run: |
          if ! diff -q specs/latest.json specs/latest-check.json > /dev/null; then
            echo "changed=true" >> $GITHUB_OUTPUT
            echo "Spec has changed!"
          else
            echo "changed=false" >> $GITHUB_OUTPUT
            echo "No changes"
          fi

      - name: Create issue if changed
        if: steps.diff.outputs.changed == 'true'
        uses: actions/github-script@v7
        with:
          script: |
            github.rest.issues.create({
              owner: context.repo.owner,
              repo: context.repo.repo,
              title: 'OpenAPI Spec Updated',
              body: 'The GoogleAI OpenAPI spec has been updated. Please review changes and update implementation.',
              labels: ['api-update', 'needs-review']
            })
```

---

## Appendix: Quick Reference Commands

### Essential Commands

```bash
# Fetch latest spec
curl -s "https://generativelanguage.googleapis.com/\$discovery/OPENAPI3_0?version=v1beta&key=$GOOGLE_AI_API_KEY" \
  -o specs/latest.json

# Count endpoints
jq '.paths | length' specs/latest.json

# Count schemas
jq '.components.schemas | length' specs/latest.json

# List endpoint paths
jq -r '.paths | keys[]' specs/latest.json

# List schema names
jq -r '.components.schemas | keys[]' specs/latest.json

# Extract specific schema
jq '.components.schemas.Part' specs/latest.json

# Find enums
jq -r '.components.schemas | to_entries[] | select(.value.enum) | .key' specs/latest.json

# Compare two specs
diff <(jq -S . old.json) <(jq -S . new.json)
```

### Useful jq Filters

```bash
# Get all POST endpoints
jq -r '.paths | to_entries[] | select(.value.post) | .key' specs/latest.json

# Get all schemas with "Request" in name
jq -r '.components.schemas | keys[] | select(contains("Request"))' specs/latest.json

# Count properties in a schema
jq '.components.schemas.GenerateContentRequest.properties | length' specs/latest.json

# Find all required fields
jq -r '.components.schemas | to_entries[] | "\(.key): \(.value.required // [])"' specs/latest.json

# Extract all enum values
jq '.components.schemas.HarmCategory.enum' specs/latest.json
```

---

## Summary

This document provides a comprehensive toolkit for analyzing the GoogleAI OpenAPI specification. The tools and scripts documented here enable:

1. **Automated extraction** of endpoints, schemas, and metadata
2. **Version comparison** to detect breaking changes
3. **Complexity analysis** to identify challenging implementations
4. **Live API validation** to confirm interpretations
5. **Continuous monitoring** for spec updates

When the API is updated, follow the [Update Checklist](#update-checklist) to ensure all documentation and implementation stay in sync with the latest spec.

**Key Files**:
- `specs/latest.json` - Current spec
- `analysis/summary-YYYYMMDD.md` - Analysis summary
- `analysis/endpoints.txt` - All endpoints
- `analysis/schemas.txt` - All schemas
- `analysis/diffs/` - Version comparison diffs