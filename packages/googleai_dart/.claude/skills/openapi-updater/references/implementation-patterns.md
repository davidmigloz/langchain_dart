# Implementation Patterns

## Contents

- [Directory Structure](#directory-structure)
- [Model Conventions](#model-conventions)
- [Enum Conventions](#enum-conventions)
- [Resource Methods](#resource-methods)
- [JSON Serialization](#json-serialization)
- [Test Patterns](#test-patterns)
- [Export Organization](#export-organization)
- [PR Templates](#pr-templates)

---

This document provides detailed patterns for implementing OpenAPI changes in the `googleai_dart` package.

---

## Directory Structure

Models are organized by feature area:

```
lib/src/models/
├── batch/           # Batch processing models
├── caching/         # Cached content models
├── content/         # Content and parts
├── corpus/          # Corpus and document models
├── embeddings/      # Embedding models
├── files/           # File handling models
├── generation/      # Generation config and output
├── metadata/        # Grounding and citations
├── models/          # Model info models
├── permissions/     # Permission models
├── prediction/      # Prediction models
├── safety/          # Safety settings
├── tools/           # Tool definitions
└── copy_with_sentinel.dart  # Shared sentinel value
```

Tests mirror this structure under `test/unit/models/`.

---

## Model Conventions

### Basic Structure

```dart
import '../copy_with_sentinel.dart';

/// Description from OpenAPI spec.
class ModelName {
  /// Field documentation.
  final String? fieldName;

  /// Creates a [ModelName].
  const ModelName({
    this.fieldName,
  });

  /// Creates a [ModelName] from JSON.
  factory ModelName.fromJson(Map<String, dynamic> json) => ModelName(
        fieldName: json['fieldName'] as String?,
      );

  /// Converts to JSON.
  Map<String, dynamic> toJson() => {
        if (fieldName != null) 'fieldName': fieldName,
      };

  /// Creates a copy with replaced values.
  ModelName copyWith({
    Object? fieldName = unsetCopyWithValue,
  }) {
    return ModelName(
      fieldName:
          fieldName == unsetCopyWithValue
              ? this.fieldName
              : fieldName as String?,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelName &&
          runtimeType == other.runtimeType &&
          fieldName == other.fieldName;

  @override
  int get hashCode => fieldName.hashCode;

  @override
  String toString() => 'ModelName(fieldName: $fieldName)';
}
```

### Type Mappings

| OpenAPI Type | Dart Type |
|--------------|-----------|
| `string` | `String` |
| `integer` | `int` |
| `number` | `double` |
| `boolean` | `bool` |
| `array` | `List<T>` |
| `object` | `Map<String, dynamic>` or custom class |
| `$ref` | Referenced class name |

### Nested Object Handling

```dart
// In fromJson
nestedObject: json['nestedObject'] != null
    ? NestedClass.fromJson(json['nestedObject'] as Map<String, dynamic>)
    : null,

// In toJson
if (nestedObject != null) 'nestedObject': nestedObject!.toJson(),
```

### List Handling

```dart
// Simple list
items: (json['items'] as List?)?.cast<String>(),

// List of objects
items: (json['items'] as List?)
    ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
    .toList(),

// In toJson
if (items != null) 'items': items!.map((e) => e.toJson()).toList(),
```

### Number Handling

```dart
// Always convert num to double for decimal fields
value: (json['value'] as num?)?.toDouble(),
```

---

## Enum Conventions

### Basic Structure

```dart
/// Description from OpenAPI spec.
enum EnumName {
  /// Unspecified value.
  unspecified,

  /// Value description.
  valueName,
}

/// Converts string to [EnumName] enum.
EnumName enumNameFromString(String? value) {
  return switch (value?.toUpperCase()) {
    'ENUM_NAME_VALUE_NAME' => EnumName.valueName,
    _ => EnumName.unspecified,
  };
}

/// Converts [EnumName] enum to string.
String enumNameToString(EnumName value) {
  return switch (value) {
    EnumName.valueName => 'ENUM_NAME_VALUE_NAME',
    EnumName.unspecified => 'ENUM_NAME_UNSPECIFIED',
  };
}
```

### Naming Conventions

- Enum name: `PascalCase` (e.g., `HarmCategory`)
- Enum values: `camelCase` (e.g., `hateSpeech`)
- Wire format: `SCREAMING_SNAKE_CASE` (e.g., `HARM_CATEGORY_HATE_SPEECH`)
- Converter functions: `enumNameFromString`, `enumNameToString`

### Always Include Default

Always include an `unspecified` or `unknown` value for forward compatibility:

```dart
_ => EnumName.unspecified,  // Catch-all for unknown values
```

---

## Resource Methods

Resources are in `lib/src/resources/` and follow this pattern:

```dart
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../client/config.dart';
import '../client/interceptor_chain.dart';
import '../client/request_builder.dart';
import '../models/files/file_search_store.dart';
import 'base_resource.dart';

/// Resource for managing file search stores.
class FileSearchStoresResource extends ResourceBase {
  /// Creates a [FileSearchStoresResource].
  FileSearchStoresResource({
    required super.config,
    required super.httpClient,
    required super.interceptorChain,
    required super.requestBuilder,
  });

  /// Creates a new file search store.
  Future<FileSearchStore> create(FileSearchStore store) async {
    final url = requestBuilder.buildUrl('/{version}/fileSearchStores');
    final headers = requestBuilder.buildHeaders(
      additionalHeaders: {'Content-Type': 'application/json'},
    );
    final request = http.Request('POST', url)
      ..headers.addAll(headers)
      ..body = jsonEncode(store.toJson());

    final response = await interceptorChain.execute(request);
    return FileSearchStore.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Gets a file search store by name.
  Future<FileSearchStore> get(String name) async {
    final url = requestBuilder.buildUrl('/{version}/$name');
    final headers = requestBuilder.buildHeaders();
    final request = http.Request('GET', url)..headers.addAll(headers);

    final response = await interceptorChain.execute(request);
    return FileSearchStore.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Lists file search stores.
  Future<ListFileSearchStoresResponse> list({
    int? pageSize,
    String? pageToken,
  }) async {
    final queryParams = <String, String>{
      if (pageSize != null) 'pageSize': pageSize.toString(),
      if (pageToken != null) 'pageToken': pageToken,
    };
    final url = requestBuilder.buildUrl(
      '/{version}/fileSearchStores',
      queryParameters: queryParams,
    );
    final headers = requestBuilder.buildHeaders();
    final request = http.Request('GET', url)..headers.addAll(headers);

    final response = await interceptorChain.execute(request);
    return ListFileSearchStoresResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Deletes a file search store.
  Future<void> delete(String name) async {
    final url = requestBuilder.buildUrl('/{version}/$name');
    final headers = requestBuilder.buildHeaders();
    final request = http.Request('DELETE', url)..headers.addAll(headers);

    await interceptorChain.execute(request);
  }
}
```

---

## JSON Serialization

### Required Fields

```dart
// In fromJson - throw or use default if truly required
requiredField: json['requiredField'] as String,

// In toJson - always include
'requiredField': requiredField,
```

### Optional Fields

```dart
// In fromJson - allow null
optionalField: json['optionalField'] as String?,

// In toJson - conditionally include
if (optionalField != null) 'optionalField': optionalField,
```

### Preserve Unknown Fields

When the API might return fields not yet in the schema:

```dart
final Map<String, dynamic>? additionalProperties;

// In fromJson
final knownKeys = {'name', 'displayName'};
additionalProperties: Map.fromEntries(
  json.entries.where((e) => !knownKeys.contains(e.key)),
),

// In toJson
...?additionalProperties,
```

---

## Test Patterns

### Standard Test Groups

```dart
void main() {
  group('ClassName', () {
    group('fromJson', () {
      test('creates instance with all fields', () { ... });
      test('handles null values', () { ... });
      test('handles partial data', () { ... });
    });

    group('toJson', () {
      test('converts all fields to JSON', () { ... });
      test('omits null values', () { ... });
    });

    test('round-trip preserves data', () { ... });

    group('copyWith', () {
      test('creates copy with changed field', () { ... });
      test('can set field to null', () { ... });
    });

    group('equality', () {
      test('equal instances are equal', () { ... });
      test('different instances are not equal', () { ... });
    });

    test('toString includes all fields', () { ... });
  });
}
```

### Enum Test Pattern

```dart
group('EnumName', () {
  group('enumNameFromString', () {
    test('converts known values', () { ... });
    test('converts null to unspecified', () { ... });
    test('converts invalid to unspecified', () { ... });
    test('is case insensitive', () { ... });
  });

  group('enumNameToString', () {
    test('converts all values', () { ... });
  });

  test('round-trip preserves value', () {
    for (final value in EnumName.values) {
      final str = enumNameToString(value);
      final converted = enumNameFromString(str);
      expect(converted, value);
    }
  });
});
```

---

## Export Organization

### Model Barrel Files

Each model subdirectory has a barrel file:

```dart
// lib/src/models/files/files.dart
export 'file.dart';
export 'file_search_store.dart';
export 'list_files_response.dart';
export 'list_file_search_stores_response.dart';
```

### Main Models Export

```dart
// lib/src/models/models.dart
export 'batch/batch.dart';
export 'caching/caching.dart';
export 'content/content.dart';
// ... etc
```

### Package Export

```dart
// lib/googleai_dart.dart
export 'src/models/models.dart';
export 'src/resources/resources.dart';
// ... etc
```

---

## PR Templates

### New Model PR

**Title**: `feat(googleai_dart): Add {ModelName} model`

**Body**:
```markdown
## Summary
- Add {ModelName} model for {purpose}
- Implement fromJson/toJson serialization
- Add comprehensive unit tests

## Test plan
- [ ] Unit tests pass
- [ ] Dart analyzer passes
- [ ] Format check passes
```

### New Endpoint PR

**Title**: `feat(googleai_dart): Add {operation_id} endpoint`

**Body**:
```markdown
## Summary
- Add {METHOD} {path} endpoint
- Add required request/response models
- Implement resource method

## Test plan
- [ ] Unit tests pass
- [ ] Integration test (if applicable)
- [ ] Dart analyzer passes
```

### Schema Update PR

**Title**: `feat(googleai_dart): Add {propertyName} to {ModelName}`

**Body**:
```markdown
## Summary
- Add {propertyName} field to {ModelName}
- Update fromJson/toJson handling
- Update tests

## Test plan
- [ ] Existing tests still pass
- [ ] New field tests added
- [ ] Dart analyzer passes
```

### Breaking Change PR

**Title**: `feat(googleai_dart)!: Remove deprecated {feature}`

**Body**:
```markdown
## Summary
- Remove {endpoint/model} (removed from API)
- Update exports
- Update dependent code

## Breaking Changes
- {Specific breaking changes}

## Migration
{Migration guidance if applicable}

## Test plan
- [ ] Remove related tests
- [ ] Verify no compile errors
- [ ] Dart analyzer passes
```

---

## Additional Resources

For core implementation principles, see `docs/spec.md`.
