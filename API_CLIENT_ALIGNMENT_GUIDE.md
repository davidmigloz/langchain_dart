# API Client Alignment Guide

## Overview

This guide documents the complete workflow for aligning Dart API clients (openai_dart, anthropic_sdk_dart) with their respective official APIs. Based on lessons learned from PRs #826-#837 for openai_dart.

---

## 1. Package Structure

Both packages follow identical structure:

```
packages/<package_name>/
├── oas/
│   ├── openapi_curated.yaml    # Hand-maintained spec (SOURCE OF TRUTH)
│   ├── openapi_official.yaml   # Official spec for reference (openai_dart only)
│   └── main.dart               # Code generation script
├── lib/
│   ├── <package_name>.dart     # Public API exports
│   └── src/
│       ├── client.dart         # Custom client wrapper
│       ├── extensions.dart     # Helper extensions
│       └── generated/
│           ├── client.dart     # Generated base client
│           └── schema/
│               ├── schema.dart           # Main schema (parts all others)
│               ├── schema.freezed.dart   # Freezed generated
│               ├── schema.g.dart         # JSON serialization
│               └── *.dart                # Individual schema files
├── test/
│   ├── *_test.dart             # Unit and integration tests
│   └── assets/                 # Test fixtures
├── example/
├── build.yaml                  # Build runner config
├── pubspec.yaml
├── README.md
└── CHANGELOG.md
```

---

## 2. Finding API Differences

### Step 1: Get the Latest Official Spec

**OpenAI:**
```bash
# Check Stainless SDK for latest spec
curl -o packages/openai_dart/oas/openapi_official.yaml \
  "https://storage.googleapis.com/stainless-sdk-openapi-specs/openai%2Fopenai-<hash>.yml"
```

**Anthropic:**
```bash
# Download latest spec from Stainless SDK
curl -o packages/anthropic_sdk_dart/oas/anthropic_openapi_official.yaml \
  "https://storage.googleapis.com/stainless-sdk-openapi-specs/anthropic%2Fanthropic-a49e89deec4e00d1da490808099d66e2001531b12d8666a7f5d0b496f760440d.yml"
```

### Step 2: Compare Specs

Use grep and diff to find differences:
```bash
# Compare curated vs official
diff packages/<package>/oas/openapi_curated.yaml \
     packages/<package>/oas/openapi_official.yaml

# Search for specific schema in official spec
grep -A 50 "ComponentName:" openapi_official.yaml

# Find all schema definitions
grep "^  [A-Z]" openapi_official.yaml | head -50

# Compare specific schema between files
grep -A 30 "Usage:" openapi_curated.yaml
grep -A 30 "Usage:" openapi_official.yaml
```

### Step 3: Identify Missing Schemas/Fields

Look for:
1. **New schemas** - Entirely new object definitions
2. **New fields** - Properties added to existing schemas
3. **New enum values** - Values added to existing enums
4. **Modified types** - Field type changes (rare)
5. **Deprecated fields** - Fields marked for removal

### Step 4: Prioritize Changes

Create one PR per logical change:
- Group related fields together (e.g., all new ImagesResponse fields)
- Separate unrelated additions (e.g., CompletionUsage vs ImagesResponse)
- Keep PRs focused and reviewable

---

## 3. OpenAPI YAML Schema Patterns

### Basic Object Schema

```yaml
ComponentName:
  type: object
  description: Human-readable description of the component.
  properties:
    required_field:
      type: string
      description: This field is always present.
    optional_field:
      type: integer
      nullable: true
      default: null
      description: This field may be absent or null.
    nested_object:
      $ref: "#/components/schemas/NestedSchema"
  required:
    - required_field
```

### Enum Schema

```yaml
MyEnumField:
  title: MyEnumName          # Generates enum with this name
  type: string
  enum:
    - value_one
    - value_two
    - value_three
  nullable: true
  description: Description of the enum.
```

### Nested Detail Object

```yaml
# Parent schema
ParentSchema:
  type: object
  properties:
    detail_field:
      $ref: "#/components/schemas/DetailSchema"

# Child schema (define separately, not inline)
DetailSchema:
  type: object
  nullable: true
  description: Detailed breakdown information.
  properties:
    sub_field_one:
      type: integer
      description: First sub-field.
    sub_field_two:
      type: string
      description: Second sub-field.
```

### Provider-Specific Extensions (OpenRouter, etc.)

```yaml
# Mark non-standard fields with x-openai-compatible: false
provider_specific_field:
  type: number
  minimum: 0
  maximum: 1
  nullable: true
  default: null
  description: Provider-specific parameter.
  x-openai-compatible: false   # NOT in official OpenAI API
```

### Key Rules

| Rule | Example |
|------|---------|
| Optional response fields | `nullable: true` + `default: null` |
| Snake_case in YAML | `cached_tokens`, `audio_tokens` |
| Use $ref for objects | `$ref: "#/components/schemas/Name"` |
| Enum title for naming | `title: ImagesResponseQuality` |
| Numeric constraints | `minimum: 0`, `maximum: 2.0` |

---

## 4. Code Generation Workflow

### Step 1: Update openapi_curated.yaml

Add your new schema or fields to the YAML spec.

### Step 2: Run Code Generator

```bash
cd packages/<package_name>
dart run oas/main.dart
```

This will:
1. Parse the OpenAPI spec
2. Generate Dart classes with freezed
3. Run build_runner to create .freezed.dart and .g.dart files

### Step 3: Verify Generated Code

Check the generated files in `lib/src/generated/schema/`:
- New schema file created: `<component_name>.dart`
- Part statement added to `schema.dart`
- Freezed and JSON serialization generated

### Generated Code Pattern

```dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

/// Description from YAML
@freezed
abstract class ComponentName with _$ComponentName {
  const ComponentName._();

  /// Factory constructor for ComponentName
  const factory ComponentName({
    /// Field description
    @JsonKey(name: 'snake_case_field', includeIfNull: false)
    Type? fieldName,
  }) = _ComponentName;

  /// Object construction from a JSON representation
  factory ComponentName.fromJson(Map<String, dynamic> json) =>
      _$ComponentNameFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['snake_case_field'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'snake_case_field': fieldName};
  }
}
```

### Schema Name Mappings (main.dart)

When generated names are awkward, add mappings:

```dart
// In oas/main.dart
final schemaNameMappings = <String, String>{
  'ModelEnumeration': 'ModelCatalog',
  'ModelString': 'ModelId',
};

final unionFactoryNameMappings = <String, Map<String, String>>{
  'ChatCompletionModel': {
    'ModelEnumeration': 'model',
    'ModelString': 'modelId',
  },
};
```

---

## 5. Writing Tests

### Test File Location

```
packages/<package_name>/test/<schema_name>_test.dart
```

### Test Structure Template

```dart
import 'package:<package_name>/<package_name>.dart';
import 'package:test/test.dart';

void main() {
  group('ComponentName tests', () {
    // Deserialization tests
    test('deserializes with all fields', () {
      final json = {
        'field_one': 100,
        'field_two': 'value',
      };
      final obj = ComponentName.fromJson(json);
      expect(obj.fieldOne, 100);
      expect(obj.fieldTwo, 'value');
    });

    test('deserializes with optional fields missing', () {
      final json = {'field_one': 100};
      final obj = ComponentName.fromJson(json);
      expect(obj.fieldOne, 100);
      expect(obj.fieldTwo, isNull);
    });

    test('deserializes with null values', () {
      final json = {'field_one': 100, 'field_two': null};
      final obj = ComponentName.fromJson(json);
      expect(obj.fieldTwo, isNull);
    });

    test('deserializes with empty JSON', () {
      final json = <String, dynamic>{};
      final obj = ComponentName.fromJson(json);
      expect(obj.fieldOne, isNull);
      expect(obj.fieldTwo, isNull);
    });

    // Serialization tests
    test('serializes correctly', () {
      const obj = ComponentName(fieldOne: 100, fieldTwo: 'value');
      final json = obj.toJson();
      expect(json['field_one'], 100);
      expect(json['field_two'], 'value');
    });

    test('serializes with null fields excluded', () {
      const obj = ComponentName(fieldOne: 100);
      final json = obj.toJson();
      expect(json['field_one'], 100);
      expect(json.containsKey('field_two'), isFalse);
    });

    // Enum tests (if applicable)
    test('MyEnum values', () {
      expect(MyEnum.values, hasLength(3));
      expect(MyEnum.values, containsAll([
        MyEnum.valueOne,
        MyEnum.valueTwo,
        MyEnum.valueThree,
      ]));
    });
  });

  // Parent-child relationship tests
  group('ParentSchema with DetailSchema tests', () {
    test('deserializes with nested detail object', () {
      final json = {
        'main_field': 50,
        'detail_field': {
          'sub_field_one': 10,
          'sub_field_two': 'nested',
        },
      };
      final obj = ParentSchema.fromJson(json);
      expect(obj.mainField, 50);
      expect(obj.detailField, isNotNull);
      expect(obj.detailField!.subFieldOne, 10);
      expect(obj.detailField!.subFieldTwo, 'nested');
    });
  });
}
```

### Test Coverage Checklist

- [ ] Deserialize with all fields
- [ ] Deserialize with optional fields missing
- [ ] Deserialize with null values
- [ ] Deserialize with empty JSON
- [ ] Serialize with all fields
- [ ] Serialize excludes null fields
- [ ] Enum has expected values
- [ ] Nested objects deserialize correctly
- [ ] Parent-child relationships work

---

## 6. Running Formatter and Analyzer

### Formatter

```bash
# Check if formatting needed
dart format packages/<package_name> --set-exit-if-changed

# Apply formatting
dart format packages/<package_name>
```

### Analyzer

```bash
dart analyze packages/<package_name>
```

**Acceptable warnings in test files:**
- `inference_failure_on_collection_literal` - Empty list type inference
- `avoid_dynamic_calls` - Dynamic JSON access in tests

**Must fix:**
- Any errors
- Warnings in lib/ code

---

## 7. PR Workflow

### Branch Naming Convention

```
feat/<package>-<brief-description>
fix/<package>-<brief-description>
chore/<package>-<brief-description>
test/<package>-<brief-description>
```

Examples:
- `feat/openai-prompt-tokens-details`
- `feat/anthropic-extended-thinking`
- `chore/format-openai-dart`

### Commit Message Format

```
<type>(<package>): <description>

[optional body with details]
```

Types:
- `feat` - New feature or schema
- `fix` - Bug fix
- `chore` - Maintenance (formatting, deps)
- `test` - Test changes only
- `docs` - Documentation only

Examples:
```
feat(openai_dart): Add prompt_tokens_details to CompletionUsage

Add PromptTokensDetails schema with cached_tokens and audio_tokens
fields to support the official OpenAI API response format.
```

### PR Creation Command

```bash
gh pr create --title "<type>(<package>): <description>" --body "$(cat <<'EOF'
## Summary
- Brief description of changes

## Changes
- List of specific changes made

## Test plan
- [x] Unit tests added/updated
- [x] Formatter passes
- [x] Analyzer passes
- [ ] CI passes
EOF
)"
```

### PR Checklist

Before creating PR:
1. [ ] Branch created from main
2. [ ] Changes made to openapi_curated.yaml
3. [ ] Code generator run
4. [ ] Unit tests written
5. [ ] All tests pass: `dart test packages/<package>/test/`
6. [ ] Formatter run: `dart format packages/<package>`
7. [ ] Analyzer passes: `dart analyze packages/<package>`
8. [ ] Commit with proper message
9. [ ] Push to remote

---

## 8. Complete Example: Adding a New Schema

### Example: Adding `TokenUsageDetails` to anthropic_sdk_dart

**Step 1: Update YAML**

```yaml
# In oas/anthropic_openapi_curated.yaml
components:
  schemas:
    TokenUsageDetails:
      type: object
      nullable: true
      description: Detailed breakdown of token usage.
      properties:
        cache_creation_input_tokens:
          type: integer
          description: Tokens used to create cache.
        cache_read_input_tokens:
          type: integer
          description: Tokens read from cache.
```

**Step 2: Add to parent schema**

```yaml
Usage:
  properties:
    # ... existing fields ...
    details:
      $ref: "#/components/schemas/TokenUsageDetails"
```

**Step 3: Run generator**

```bash
cd packages/anthropic_sdk_dart
dart run oas/main.dart
```

**Step 4: Write tests**

```dart
// test/token_usage_details_test.dart
import 'package:anthropic_sdk_dart/anthropic_sdk_dart.dart';
import 'package:test/test.dart';

void main() {
  group('TokenUsageDetails tests', () {
    test('deserializes with all fields', () {
      final json = {
        'cache_creation_input_tokens': 100,
        'cache_read_input_tokens': 50,
      };
      final details = TokenUsageDetails.fromJson(json);
      expect(details.cacheCreationInputTokens, 100);
      expect(details.cacheReadInputTokens, 50);
    });
    // ... more tests
  });
}
```

**Step 5: Run checks**

```bash
dart test packages/anthropic_sdk_dart/test/token_usage_details_test.dart
dart format packages/anthropic_sdk_dart
dart analyze packages/anthropic_sdk_dart
```

**Step 6: Create PR**

```bash
git checkout -b feat/anthropic-token-usage-details
git add .
git commit -m "feat(anthropic_sdk_dart): Add TokenUsageDetails schema"
git push -u origin feat/anthropic-token-usage-details
gh pr create --title "feat(anthropic_sdk_dart): Add TokenUsageDetails schema" --body "..."
```

---

## 9. Common Pitfalls

| Pitfall | Solution |
|---------|----------|
| Forgetting `nullable: true` | Always add for optional response fields |
| Forgetting `includeIfNull: false` | Generator handles this, but verify |
| Inline complex objects | Use $ref to separate schemas |
| Modifying generated code | Never! Update YAML and regenerate |
| Large multi-feature PRs | One logical change per PR |
| Missing tests for enums | Always test enum values count |
| Skipping empty JSON test | Always test deserialization of `{}` |
| Relative test file paths | Use directory-aware paths (see Section 14) |
| Breaking dependent packages | Always check langchain_* packages after schema changes |
| Non-exhaustive switches | Add all new enum values/union types to switches |

---

## 10. Fixing OpenAPI Generator Bugs

If you encounter bugs in the code generation (openapi_spec package), you can fix them directly:

### Step 1: Locate the Generator

The generator source is at:
```
/Users/davidmigloz/repos/openapi_spec
```

GitHub: https://github.com/davidmigloz/openapi_spec

### Step 2: Make the Fix

Edit the relevant files in the openapi_spec repo and test locally.

### Step 3: Push the Fix

```bash
cd /Users/davidmigloz/repos/openapi_spec
git add .
git commit -m "fix: Description of the fix"
git push origin main
```

### Step 4: Update Dependency Reference

Update the commit ref in the **root** `pubspec.yaml` of the monorepo:

```yaml
# In /Users/davidmigloz/repos/langchain_dart/pubspec.yaml
dependency_overrides:
  openapi_spec:
    git:
      url: https://github.com/davidmigloz/openapi_spec.git
      ref: <new-commit-sha>  # Update this
```

### Step 5: Bootstrap the Monorepo

```bash
cd /Users/davidmigloz/repos/langchain_dart
melos bootstrap
```

This applies the updated dependency to all packages.

### Step 6: Validate Other Packages

**Critical:** Verify the fix doesn't break generation for other packages:

```bash
# Regenerate openai_dart
cd packages/openai_dart
dart run oas/main.dart
dart analyze .
dart test

# Regenerate anthropic_sdk_dart
cd ../anthropic_sdk_dart
dart run oas/main.dart
dart analyze .
dart test

# Check any other packages using openapi_spec
```

### Step 7: Create PRs

1. PR for openapi_spec fix (if public contribution needed)
2. PR for langchain_dart updating the dependency ref

---

## 11. Package-Specific Notes

### openai_dart
- Maintains two spec files (curated + official for reference)
- 189+ schema files, covers 8+ API categories
- Has OpenRouter-specific extensions marked with `x-openai-compatible: false`
- Integration tests require `OPENAI_API_KEY`

### anthropic_sdk_dart
- Single curated spec file (more focused)
- 50+ schema files, covers Messages, Batches, Models, Token Counting
- Custom client wrapper for streaming
- Integration tests require `ANTHROPIC_API_KEY`
- Extensions in `extensions.dart` for convenience methods
- Beta features use `anthropic-beta` header (e.g., token-counting, extended-thinking)
- Versioned tool types for computer use, text editor, bash (see Section 16)
- Sealed classes for union types (Block, ImageBlockSource, MessageStreamEvent, etc.)

---

## 12. Quick Reference Commands

```bash
# Generate code
dart run oas/main.dart

# Run specific tests
dart test packages/<pkg>/test/<test_file>.dart

# Run all package tests
dart test packages/<pkg>

# Format
dart format packages/<pkg>

# Analyze
dart analyze packages/<pkg>

# Create PR
gh pr create --title "..." --body "..."

# Check git status
git status

# View recent commits
git log --oneline -10
```

---

## 13. Files Modified Per Schema Addition

Typical files changed when adding a new schema:

```
packages/<package>/
├── oas/openapi_curated.yaml           # YAML changes
├── lib/src/generated/schema/
│   ├── schema.dart                    # New part statement
│   ├── schema.freezed.dart            # Regenerated
│   ├── schema.g.dart                  # Regenerated
│   └── <new_schema>.dart              # New file
└── test/<new_schema>_test.dart        # New test file
```

---

## 14. Handling Breaking Changes in Dependent Packages

When SDK schema changes break dependent packages (e.g., `langchain_anthropic` depends on `anthropic_sdk_dart`), you must fix them in the same session.

### Common Breaking Changes

#### 1. Sealed Class/Union Type Changes

When a simple class becomes a sealed class with union variants:

```dart
// BEFORE: Simple class
source: a.ImageBlockSource(
  type: a.ImageBlockSourceType.base64,
  mediaType: a.ImageBlockSourceMediaType.imageJpeg,
  data: imageData,
)

// AFTER: Sealed class with named constructor
source: a.ImageBlockSource.base64ImageSource(
  type: 'base64',
  mediaType: a.Base64ImageSourceMediaType.imageJpeg,
  data: imageData,
)
```

#### 2. Exhaustive Switch Statements

When new enum values or union variants are added, all switch statements must handle them:

```dart
// Adding new StopReason values
FinishReason _mapFinishReason(final a.StopReason? reason) => switch (reason) {
  a.StopReason.endTurn => FinishReason.stop,
  a.StopReason.maxTokens => FinishReason.length,
  a.StopReason.stopSequence => FinishReason.stop,
  a.StopReason.toolUse => FinishReason.toolCalls,
  // NEW: Must add these or Dart analyzer errors
  a.StopReason.pauseTurn => FinishReason.unspecified,
  a.StopReason.refusal => FinishReason.contentFilter,
  null => FinishReason.unspecified,
};
```

#### 3. New Block Types in Content Blocks

When new content block types are added to a union:

```dart
// Must handle all new block types
(String, AIChatMessageToolCall?) _mapContentBlock(final a.Block block) =>
  switch (block) {
    final a.TextBlock t => (t.text, null),
    final a.ImageBlock i => (/* handle */, null),
    final a.ToolUseBlock tu => (/* handle */, toolCall),
    // NEW: Add placeholders for new block types
    final a.DocumentBlock _ => ('', null),
    final a.RedactedThinkingBlock _ => ('', null),
    final a.ServerToolUseBlock _ => ('', null),
    final a.WebSearchToolResultBlock _ => ('', null),
    final a.MCPToolUseBlock _ => ('', null),
    final a.MCPToolResultBlock _ => ('', null),
    // ... etc
  };
```

### Workflow for Breaking Changes

1. **Run analyzer on dependent packages** after regenerating SDK:
   ```bash
   dart analyze packages/langchain_anthropic
   dart analyze packages/langchain_openai
   ```

2. **Fix all errors** - usually exhaustive switch or constructor changes

3. **Run tests** to verify functionality:
   ```bash
   dart test packages/langchain_anthropic/test/
   ```

4. **Commit SDK and dependent package fixes together** or in sequence

---

## 15. Test File Path Handling

Tests that reference asset files must work when run from both the package directory and the repo root.

### Problem

```dart
// This fails when run from repo root
final file = await File('./test/assets/data.txt').readAsString();
```

### Solution

```dart
// Directory-aware path that works from any location
final testDir = Directory.current.path.endsWith('anthropic_sdk_dart')
    ? Directory.current.path
    : '${Directory.current.path}/packages/anthropic_sdk_dart';
final file = await File('$testDir/test/assets/data.txt').readAsString();
```

### Skipping Flaky Tests

Some tests depend on API behavior that varies by model or time. Use `skip` with explanation:

```dart
test(
  'Test computer tool use',
  skip: 'claude-sonnet-4-5-20250929 does not support computer_20241022 tools',
  () async {
    // test code
  },
);

test(
  'Test Prompt caching',
  skip: 'Prompt caching behavior varies by model and may not return expected cache metrics',
  () async {
    // test code
  },
);
```

---

## 16. Anthropic-Specific Patterns

### Versioned Tool Types

Anthropic uses versioned tool type identifiers. These change over time:

| Tool | Current Version | Notes |
|------|-----------------|-------|
| Computer Use | `computer_20241022` | Beta, model-specific support |
| Text Editor | `text_editor_20250728` | Updated in 2025 |
| Bash | `bash_20250124` | Updated in 2025 |

**Important:** Not all models support all tool versions. Verify before using.

### OpenAPI Discriminator Mapping

Tool types use discriminator mappings in the OpenAPI spec:

```yaml
Tool:
  discriminator:
    propertyName: type
    mapping:
      custom: "#/components/schemas/ToolCustom"
      computer_20241022: "#/components/schemas/ToolComputerUse"
      text_editor_20250728: "#/components/schemas/ToolTextEditor"
      bash_20250124: "#/components/schemas/ToolBash"
```

### Beta Features Header

Some endpoints require beta headers:

```dart
// In client, headers are added automatically for beta features
final response = await client.countMessageTokens(
  request: request,
  // Beta header added: 'anthropic-beta': 'token-counting-2024-11-01'
);
```

---

## 17. Freezed Sealed Class Patterns

### Union Types with Discriminator

When the OpenAPI spec defines a `oneOf` with discriminator:

```yaml
ImageBlockSource:
  oneOf:
    - $ref: "#/components/schemas/Base64ImageSource"
    - $ref: "#/components/schemas/UrlImageSource"
  discriminator:
    propertyName: type
    mapping:
      base64: "#/components/schemas/Base64ImageSource"
      url: "#/components/schemas/UrlImageSource"
```

Generates a sealed class:

```dart
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class ImageBlockSource with _$ImageBlockSource {
  @FreezedUnionValue('base64')
  const factory ImageBlockSource.base64ImageSource({
    required String type,
    required Base64ImageSourceMediaType mediaType,
    required String data,
  }) = Base64ImageSource;

  @FreezedUnionValue('url')
  const factory ImageBlockSource.urlImageSource({
    required String type,
    required String url,
  }) = UrlImageSource;
}
```

### Pattern Matching on Sealed Classes

```dart
// Use switch expression for exhaustive matching
final result = switch (imageSource) {
  final Base64ImageSource s => s.data,
  final UrlImageSource s => s.url,
};
```

---

## 18. Merging Stacked PRs

When creating multiple dependent PRs (stacked PRs), each PR's base branch should point to the previous PR's branch so GitHub shows only the incremental diff.

### Merging Process

1. **Merge from bottom to top** - Always merge the PR closest to `main` first

2. **After each merge, update the next PR:**
   ```bash
   # Change the next PR's base to main
   gh pr edit <PR_NUMBER> --base main

   # Interactive rebase to drop already-merged commits
   git checkout <next-branch>
   git fetch origin
   git rebase -i origin/main
   ```

   In the interactive editor, change `pick` to `drop` for commits that belonged to the already-merged PR(s). This cleanly removes them without replay conflicts.

   ```bash
   git push --force-with-lease
   ```

3. **Verify before merging** - Check that the PR shows only its own commits

### Why Interactive Rebase is Better

- **Avoids conflicts**: Regular `git rebase origin/main` replays all commits, which can conflict with the merge commit's version of those changes
- **Cleaner history**: You explicitly drop the commits that are now in main, rather than relying on git to figure it out
- **More control**: You see exactly which commits remain

### Quick Reference

```bash
# After merging PR N, for PR N+1:
gh pr edit <N+1> --base main
git checkout <branch-N+1>
git fetch origin
git rebase -i origin/main   # drop commits from PR N
git push --force-with-lease
```

### Common Issues

| Issue | Solution |
|-------|----------|
| `gh pr edit --base` silently fails | Check GitHub UI to verify base actually changed; may have conflicts |
| PR shows too many commits after rebase | Force push needed after rebasing |
| Merge conflicts during rebase | Resolve locally, continue rebase, then force push |

---

## 19. anyOf Patterns for Union Types

When defining union types (e.g., `ChatCompletionToolChoice` that can be either an enum string or an object), the `anyOf` pattern must be **inlined** in the parent schema rather than defined as a top-level schema.

### Problem

Top-level `anyOf` schemas can cause freezed code generation to fail:

```
Null check operator used on a null value in DefaultValue.defaultValue
```

The generated class may be empty instead of a proper sealed class.

### Incorrect (Top-Level Schema)

```yaml
# This can fail during code generation
ChatCompletionToolChoice:
  title: ChatCompletionToolChoice
  anyOf:
    - $ref: '#/components/schemas/ToolChoiceOption'
    - $ref: '#/components/schemas/ToolChoiceTool'
  nullable: true
```

### Correct (Inlined in Parent)

```yaml
ChatCompletionRequest:
  properties:
    tool_choice:
      title: ChatCompletionToolChoice
      description: Controls which tool is called.
      nullable: true
      anyOf:
        - type: string
          title: ChatCompletionToolChoiceOption
          enum: [none, auto, any, required]
        - $ref: '#/components/schemas/ToolChoiceTool'
```

This generates a proper sealed class with custom JSON converter:

```dart
@freezed
sealed class ChatCompletionToolChoice with _$ChatCompletionToolChoice {
  const factory ChatCompletionToolChoice.enumeration(
    ChatCompletionToolChoiceOption value,
  ) = ChatCompletionToolChoiceEnumeration;

  const factory ChatCompletionToolChoice.toolChoiceTool(
    ToolChoiceTool value,
  ) = ChatCompletionToolChoiceToolChoiceTool;
}
```

### When to Use This Pattern

- Union types combining enums and objects (tool_choice, stop sequences)
- Any `anyOf` that mixes primitive types with `$ref` objects
- Fields where the API accepts multiple distinct formats

---

## 20. Import Conflicts Between Packages

When a LangChain integration package (e.g., `langchain_mistralai`) imports both `langchain_core` and an SDK package (e.g., `mistralai_dart`), naming conflicts can occur.

### Problem

```dart
// Both packages define a 'Tool' class
import 'package:langchain_core/tools.dart';  // Has Tool
import 'package:mistralai_dart/mistralai_dart.dart';  // Also has Tool

// Error: The name 'Tool' is defined in multiple libraries
```

### Solution: Use Import Prefix

```dart
import 'package:langchain_core/tools.dart';
import 'package:mistralai_dart/mistralai_dart.dart' as mistral;

// Now use prefix for SDK types
mistral.Tool _mapTool(ToolSpec tool) {
  return mistral.Tool(
    type: mistral.ToolType.function,
    function: mistral.FunctionDefinition(
      name: tool.name,
      description: tool.description,
      parameters: tool.inputJsonSchema,
    ),
  );
}
```

### Common Conflicting Names

| Class Name | langchain_core | SDK Packages |
|------------|----------------|--------------|
| `Tool` | ToolSpec wrapper | API schema |
| `Message` | ChatMessage | API schema |
| `Usage` | LanguageModelUsage | API schema |

### Best Practice

Always use an `as` prefix for SDK imports in integration packages to prevent current and future conflicts as APIs evolve.

---

## 21. Practical Stacked PRs with Generated Code

When making multiple related changes to an API client, the generated files (`schema.freezed.dart`, `schema.g.dart`) regenerate completely each time. This makes truly independent stacked PRs impractical.

### The Challenge

Each code generation run overwrites:
- `schema.freezed.dart` (~thousands of lines)
- `schema.g.dart` (~thousands of lines)
- `schema.dart` (part statements)

Creating separate commits for "only tool calling" vs "only response format" is nearly impossible since each regeneration includes all changes.

### Practical Approach

Instead of N separate PRs per feature, organize by package:

| PR | Scope | Contents |
|----|-------|----------|
| PR 1 | SDK package | All schema changes (regenerated together) |
| PR 2 | Integration package | Mapper/options changes (depends on PR 1) |

### Example: Mistral Tool Calling

**PR 1: mistralai_dart** (all schema changes)
- Tool/function calling schemas
- Response format schemas
- Missing parameters
- Updated models enum
- Prediction/reasoning mode

**PR 2: langchain_mistralai** (integration)
- Tool mappers
- Options updates
- Finish reason handling

### When to Split Further

Only split SDK changes into multiple PRs when:
1. Changes are truly independent (different API endpoints)
2. One change is experimental/risky and needs separate review
3. Changes affect different major versions

---

*Document created: 2025-12-19*
*Updated: 2025-12-20*
*Based on: openai_dart PRs #826-#837, anthropic_sdk_dart API alignment work, mistralai_dart PRs #887-#888*
