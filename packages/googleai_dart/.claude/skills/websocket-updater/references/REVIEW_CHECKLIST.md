# Implementation Review Checklist

Systematic verification after implementing WebSocket/Live API changes.

## Contents

1. [Pre-Review](#pre-review) - Re-run analysis for fresh comparison
2. [Verification by Category](#verification-by-category) - P0-P4 priority checks
3. [Cross-Reference Verification](#cross-reference-verification) - Sealed classes, nested types
4. [Common Gaps](#common-gaps) - Frequently missed items
5. [Barrel File Completeness (PASS 2)](#barrel-file-completeness-pass-2) - Export verification
6. [Documentation Completeness (PASS 3)](#documentation-completeness-pass-3) - Documentation completeness
7. [Property-Level Verification (PASS 4)](#property-level-verification-pass-4) - Parent model properties
8. [Unit Test Verification (PASS 5)](#unit-test-verification-pass-5) - Test coverage for models
9. [Quality Gates](#quality-gates) - Required checks before finalization
10. [Review Output Template](#review-output-template) - Standard format for findings
11. [Fix Loop Process](#fix-loop-process) - Gap resolution workflow
12. [Updating Verify Scripts](#updating-verify-scripts) - Maintaining script accuracy

---

## Pre-Review

Re-run the analysis to get a fresh spec comparison:
```bash
python3 .claude/skills/websocket-updater/scripts/analyze_changes.py \
  live-api-schema.json /tmp/websocket-updater/latest-live.json --format all \
  --changelog-out /tmp/websocket-updater/review-changelog.md \
  --plan-out /tmp/websocket-updater/review-plan.md
```

Use the generated plan as your verification source.

---

## Verification by Category

### Breaking Changes (P0)
For each removed message type/field:
- [ ] Code deleted (not commented out)
- [ ] No orphaned references in other files
- [ ] Barrel exports updated
- [ ] Related tests removed

### New Message Types (P1)
For each new message type:
- [ ] Sealed class handles new type in fromJson
- [ ] Concrete class exists with all fields
- [ ] fromJson/toJson correctly serialize
- [ ] Added to appropriate client/server hierarchy

### New Schemas (P2)
For each new config/model, verify:
- [ ] All properties from spec
- [ ] Correct types (see Type Mappings in implementation-patterns.md)
- [ ] Required vs optional matches spec
- [ ] `fromJson` handles all fields with correct casting
- [ ] `toJson` includes all fields with null checks
- [ ] `copyWith` uses sentinel pattern for all fields
- [ ] `toString` includes all fields
- [ ] Exported in barrel file (`lib/googleai_dart.dart`)
- [ ] Unit test with round-trip serialization test

### Modified Schemas (P4)
For each schema with new/changed properties:
- [ ] New properties added to class
- [ ] `fromJson` updated
- [ ] `toJson` updated
- [ ] `copyWith` updated
- [ ] `toString` updated
- [ ] Tests updated for new fields

---

## Cross-Reference Verification

### Sealed Classes
Check these sealed classes handle all their variants:
- [ ] `BidiGenerateContentClientMessage` - all client message types
- [ ] `BidiGenerateContentServerMessage` - all server message types

### Nested References
- [ ] All nested object types are imported
- [ ] `List<T>` uses correct element type
- [ ] Enum converters exist for all enum types

### Parent Model Updates

**CRITICAL:** Parent models often need updates when new schemas are added.

Run the property verification script to detect missing properties:
```bash
python3 .claude/skills/websocket-updater/scripts/verify_model_properties.py
```

The script checks these critical models automatically:
- `LiveConfig` - new config options
- `LiveGenerationConfig` - new generation settings
- `RealtimeInputConfig` - new input options
- `BidiGenerateContentSetup` - new setup fields

---

## Common Gaps

These are frequently missed - explicitly check:

| Gap | Check | How to Verify |
|-----|-------|---------------|
| **Missing barrel exports** | Model files not exported | Run `verify_exports.py` |
| **Transitive dependencies** | Types used by exported classes | Run `verify_exports.py --verbose` |
| **Missing enum values** | New values added to existing enums | Compare against spec |
| **Sealed class variant** | New message type not in fromJson | Read sealed class file |

---

## Barrel File Completeness (PASS 2)

**This is the most commonly missed check.** Run the verification script:

```bash
python3 .claude/skills/websocket-updater/scripts/verify_exports.py
```

The script will:
1. Scan all `.dart` files in `lib/src/models/live/` and `lib/src/live/`
2. Check each is exported in `lib/googleai_dart.dart`
3. Report unexported files and suggest fixes

**If unexported files are found:**
- Add export to `lib/googleai_dart.dart` if it's a public API type
- If intentionally internal, document reason in code comment

---

## Documentation Completeness (PASS 3)

### 3a. README Coverage

For Live API implementation:
- [ ] Listed in Features section with capabilities
- [ ] Listed in API Coverage section with methods
- [ ] Referenced example file exists

### 3b. Example Files

- [ ] `example/live_example.dart` exists
- [ ] Example compiles: `dart analyze example/`
- [ ] Example demonstrates key use cases

### 3c. Run Verification Scripts

```bash
python3 .claude/skills/websocket-updater/scripts/verify_readme.py
python3 .claude/skills/websocket-updater/scripts/verify_examples.py
```

### 3d. CHANGELOG

- [ ] CHANGELOG.md updated with version entry
- [ ] All new features listed
- [ ] Breaking changes highlighted with migration notes

---

## Property-Level Verification (PASS 4)

**CRITICAL: This pass catches missing properties in parent models.**

### 4a. Run Property Verification Script

```bash
python3 .claude/skills/websocket-updater/scripts/verify_model_properties.py
```

The script compares Dart model classes against the schema and reports:
- Missing properties in critical parent models
- Properties that exist in spec but not in Dart class

### 4b. README Code Validation

```bash
python3 .claude/skills/websocket-updater/scripts/verify_readme_code.py
```

This catches documentation drift patterns:
- Method names that don't exist
- Property access patterns that are incorrect
- Constructor patterns that don't match API

---

## Unit Test Verification (PASS 5)

**All Live API models must have corresponding unit tests.**

### 5a. Test Directory Structure

Tests should exist in `test/unit/models/live/` mirroring the source structure:

```
test/unit/models/live/
├── config/                              # Config class tests
│   ├── live_config_test.dart
│   ├── live_generation_config_test.dart
│   └── ... (one per config class)
├── enums/
│   └── live_enums_test.dart             # All enums in one file
└── messages/
    ├── client_message_test.dart         # Client message types
    └── server_message_test.dart         # Server message types
```

### 5b. Required Test Patterns

Each model class must have tests for:

- [ ] **fromJson** - All fields, minimal fields, null handling
- [ ] **toJson** - Non-null fields included, null fields omitted
- [ ] **copyWith** - No params returns same values, partial updates work
- [ ] **Round-trip** - Serialize then deserialize preserves data
- [ ] **Sealed class dispatch** - For message types, correct subtype selection

### 5c. Verification Commands

```bash
# Run Live API tests
dart test test/unit/models/live/

# Check test count (should be ~200+ for full Live API)
dart test test/unit/models/live/ --reporter=expanded | grep -c "^  ✓"
```

### 5d. Missing Test Detection

Check that each source file has a corresponding test:

| Source Path | Expected Test Path |
|-------------|-------------------|
| `lib/src/models/live/config/live_config.dart` | `test/unit/models/live/config/live_config_test.dart` |
| `lib/src/models/live/messages/client/client_message.dart` | `test/unit/models/live/messages/client_message_test.dart` |
| `lib/src/models/live/enums/*.dart` | `test/unit/models/live/enums/live_enums_test.dart` |

---

## Quality Gates

Run all commands - all must pass:

```bash
# Static analysis (zero issues - info, warning, or error)
dart analyze --fatal-infos

# Formatting check
dart format --set-exit-if-changed .

# Unit tests
dart test test/unit/

# Barrel file verification (CRITICAL)
python3 .claude/skills/websocket-updater/scripts/verify_exports.py

# Documentation verification (CRITICAL)
python3 .claude/skills/websocket-updater/scripts/verify_readme.py
python3 .claude/skills/websocket-updater/scripts/verify_examples.py

# Property-level verification (CRITICAL)
python3 .claude/skills/websocket-updater/scripts/verify_model_properties.py

# README code validation
python3 .claude/skills/websocket-updater/scripts/verify_readme_code.py
```

---

## Review Output Template

Document findings in this format:

### Verified
- [x] BidiGenerateContentSetup has all fields
- [x] LiveConfig serialization works

### Gaps Found
- [ ] Missing `proactivity` field in LiveConfig
- [ ] No export for AudioTranscriptionConfig

### Recommendation
[ ] Proceed to finalize
[x] Fix gaps first

---

## Fix Loop Process

If gaps were found:

1. **Fix each gap** using patterns from `implementation-patterns.md`
2. **Re-run quality gates**:
   ```bash
   dart analyze --fatal-infos
   dart format --set-exit-if-changed .
   dart test test/unit/
   ```
3. **Re-run this review** from Pre-Review step
4. **Repeat** until all items verified

### Common Fix Patterns

| Gap Type | Fix |
|----------|-----|
| Missing property | Add field, update fromJson/toJson/copyWith/toString |
| Missing export | Add to `lib/googleai_dart.dart` |
| Sealed class variant | Add case to `fromJson` factory switch |
| Missing test | Create using `assets/test_template.dart` |

---

## Updating Verify Scripts

**IMPORTANT:** When adding new features, the verify scripts may need updates.

### When to Update Scripts

| Feature Type | Script to Update | What to Add |
|--------------|------------------|-------------|
| New message type | `verify_model_properties.py` | Add to `CRITICAL_MODELS` |
| New config class | `verify_model_properties.py` | Add to `CRITICAL_MODELS` |
| New drift pattern | `verify_readme_code.py` | Add to `DRIFT_PATTERNS` |
| File path change | `verify_model_properties.py` | Update paths |

### Why This Matters

The verify scripts maintain hardcoded lists of:
- Critical models to check for property completeness
- File paths for model classes
- Known drift patterns in README code

If you add a feature but don't update the scripts, future runs will miss gaps.

---

## Additional Verification Steps

These checks catch issues that have caused bugs in the past:

### Tool Call Correlation
- [ ] `FunctionCall.id` field is preserved in serialization
- [ ] `FunctionResponse.id` field is preserved in serialization
- [ ] Tool call cancellation can match calls by ID

### Session Resumption
- [ ] `SessionResumptionConfig.transparent` field is included if specified in schema
- [ ] Resumption tokens are properly captured from server messages

### Error Handling
- [ ] `LiveSessionSetupException` surfaces directly (not wrapped in `LiveConnectionException`)
- [ ] Failed sessions are cleaned up and removed from `_sessions` list
- [ ] Connection vs setup errors are distinguishable by exception type

### Vertex AI vs Google AI
- [ ] Model names use correct format for each API mode
  - Google AI: `models/{model}`
  - Vertex AI: `projects/{project}/locations/{location}/publishers/google/models/{model}`
- [ ] OAuth header limitations are documented for Vertex AI Live API

### EXPECTED_PROPERTIES Sync
- [ ] When adding new fields to spec, update `EXPECTED_PROPERTIES` in `verify_model_properties.py`
- [ ] Both `websocket-updater` and `openapi-updater` scripts are updated if the model is shared
