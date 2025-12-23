# Implementation Review Checklist

Systematic verification after implementing OpenAPI changes.

## Contents

1. [Pre-Review](#pre-review) - Re-run analysis for fresh comparison
2. [Verification by Category](#verification-by-category) - P0-P4 priority checks
3. [Cross-Reference Verification](#cross-reference-verification) - Sealed classes, nested types
4. [Common Gaps](#common-gaps) - Frequently missed items
5. [Barrel File Completeness (PASS 2)](#barrel-file-completeness-pass-2) - Export verification
6. [Documentation Completeness (PASS 3)](#documentation-completeness-pass-3) - Documentation completeness
7. [Property-Level Verification (PASS 4)](#property-level-verification-pass-4) - Parent model properties
8. [Quality Gates](#quality-gates) - Required checks before finalization
9. [Review Output Template](#review-output-template) - Standard format for findings
10. [Fix Loop Process](#fix-loop-process) - Gap resolution workflow
11. [Updating Verify Scripts](#updating-verify-scripts) - Maintaining script accuracy

---

## Pre-Review

Re-run the analysis to get a fresh spec comparison:
```bash
python3 .claude/skills/openapi-updater/scripts/analyze_changes.py \
  openapi.json /tmp/openapi-updater/latest.json --format all \
  --changelog-out /tmp/openapi-updater/review-changelog.md \
  --plan-out /tmp/openapi-updater/review-plan.md
```

Use the generated plan as your verification source.

---

## Verification by Category

### Breaking Changes (P0)
For each removed endpoint/schema:
- [ ] Code deleted (not commented out)
- [ ] No orphaned references in other files
- [ ] Barrel exports updated
- [ ] Related tests removed

### New Endpoints (P1)
For each new endpoint:
- [ ] Resource method exists with correct HTTP verb
- [ ] URL path matches spec exactly
- [ ] Request/response types match spec schemas
- [ ] Added to client (if top-level resource)

### New Schemas (P2)
For each new schema, verify the model file has:
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
- [ ] `Part` - all part types in `fromJson` switch
- [ ] Other sealed classes with `factory fromJson`

### Nested References
- [ ] All nested object types are imported
- [ ] `List<T>` uses correct element type
- [ ] Enum converters exist for all enum types

### Parent Model Updates

**CRITICAL:** Parent models often need updates when new schemas are added.

Run the property verification script to detect missing properties:
```bash
python3 .claude/skills/openapi-updater/scripts/verify_model_properties.py
```

The script checks these critical models automatically:
- `Tool` - new tool types (Search, Context, Maps, Mcp)
- `ToolConfig` - config extensions
- `GenerationConfig` - new config fields
- `Candidate` - new response fields/metadata
- `Content`/`Part` - new content types
- `GroundingMetadata` - new grounding data
- `GroundingChunk` - new chunk types

The `analyze_changes.py` script also flags schemas that may need parent updates.

---

## Common Gaps

These are frequently missed - explicitly check:

| Gap | Check | How to Verify |
|-----|-------|---------------|
| **Missing barrel exports** | Model files not exported in barrel file | Run `verify_exports.py` |
| **Transitive dependencies** | Types used by exported classes not exported | Run `verify_exports.py --verbose` |
| `Part.mediaResolution` | Part sealed class handles mediaResolution | Read `part.dart` |
| `ImageConfig` | Schema exists and GenerationConfig references it | Grep for ImageConfig |
| `GenerationConfig` fields | All new optional fields added | Compare against spec |
| Enum values | New values added to existing enums | Compare against spec |
| Platform code | IO and Web implementations both updated | Check `_io.dart`/`_web.dart` |

---

## Barrel File Completeness (PASS 2)

**This is the most commonly missed check.** Run the verification script:

```bash
python3 .claude/skills/openapi-updater/scripts/verify_exports.py
```

The script will:
1. Scan all `.dart` files in `lib/src/models/` subdirectories
2. Check each is exported in `lib/googleai_dart.dart`
3. Report unexported files and suggest fixes
4. Check transitive dependencies (types used by exported classes)

**If unexported files are found:**
- Add export to `lib/googleai_dart.dart` if it's a public API type
- If intentionally internal, document reason in code comment

**Manual fallback** (if script unavailable):
```bash
for f in lib/src/models/*/*.dart; do
  base=$(basename "$f")
  if ! grep -q "$base" lib/googleai_dart.dart; then
    echo "NOT EXPORTED: $f"
  fi
done
```

---

## Documentation Completeness (PASS 3)

**CRITICAL: This pass verifies documentation is COMPLETE, not just accurate.**

This was the most commonly forgotten step - new features were implemented but never documented.

### 3a. README Coverage

For EACH new resource implemented:
- [ ] Listed in Features section with capabilities
- [ ] Listed in API Coverage section with methods
- [ ] Referenced example file exists in Examples section

For EACH new feature/tool:
- [ ] Documented in appropriate Features subsection
- [ ] Usage example provided or referenced

### 3b. Example Files

For EACH new resource:
- [ ] `example/{resource}_example.dart` exists
- [ ] Example compiles: `dart analyze example/`
- [ ] Example demonstrates key use cases

### 3c. Run Verification Scripts

```bash
# README validation
python3 .claude/skills/openapi-updater/scripts/verify_readme.py

# Example completeness
python3 .claude/skills/openapi-updater/scripts/verify_examples.py
```

**verify_readme.py** validates:
1. **Resources**: All implemented resources are documented
2. **Tool types**: All Tool properties are documented
3. **Stale references**: No references to removed APIs
4. **Examples**: Referenced example files exist

**verify_examples.py** validates:
1. Each resource has a corresponding `{resource}_example.dart`
2. No orphaned example files without resources

### 3d. CHANGELOG

- [ ] CHANGELOG.md updated with version entry
- [ ] All new features listed
- [ ] Breaking changes highlighted with migration notes

### 3e. README Code Validation

Verify README code examples match actual Dart API:

```bash
python3 .claude/skills/openapi-updater/scripts/verify_readme_code.py
```

This catches common documentation drift patterns:
- `response.text` (doesn't exist on GenerateContentResponse)
- `delta.query` vs `delta.queries` (singular vs plural)
- `delta.url` vs `delta.urls` (singular vs plural)
- Typed classes vs Map types (ToolConfig, RetrievalConfig)

**Why this matters:** During implementation, `dart analyze` catches errors in example
files which get fixed. But README code snippets are not analyzed and can drift from
the actual API.

### If Issues Are Found

**For missing resource documentation:**
1. Add Features section entry with capabilities list
2. Add API Coverage section with method categories
3. Reference new example file

**For missing example files:**
1. Create `example/{resource}_example.dart`
2. Use template from `assets/example_template.dart`
3. Follow patterns in `references/implementation-patterns.md` Section 9

**For stale references:**
- Remove references to deleted APIs
- Update feature comparison tables
- Remove non-existent example file references

### Quick Manual Verification
```bash
# Count resources vs documentation
echo "Resources: $(ls lib/src/resources/*_resource.dart | wc -l)"
echo "Examples: $(ls example/*_example.dart 2>/dev/null | wc -l)"

# Check if new resources are in README
for r in lib/src/resources/*_resource.dart; do
  name=$(basename "$r" _resource.dart)
  if ! grep -qi "$name" README.md; then
    echo "MISSING FROM README: $name"
  fi
done
```

### Common Documentation Gaps

| Gap | Section | How to Fix |
|-----|---------|------------|
| New resource not documented | Features + API Coverage | Add both sections |
| No example for resource | example/ | Create `{resource}_example.dart` |
| Stale API references | API Coverage | Remove deleted resources |
| Missing new tools | Features | Add to Tool support list |
| CHANGELOG not updated | CHANGELOG.md | Add version entry |

---

## Property-Level Verification (PASS 4)

**CRITICAL: This pass catches missing properties in parent models.**

This is a common gap: a new schema is added (e.g., `UrlContext`) but the parent model
that should reference it (e.g., `Tool`) is not updated to include the new property.

### 4a. Run Property Verification Script

```bash
python3 .claude/skills/openapi-updater/scripts/verify_model_properties.py
```

The script compares Dart model classes against the OpenAPI spec and reports:
- Missing properties in critical parent models
- Properties that exist in spec but not in Dart class

### 4b. Critical Models Checked

The script automatically verifies these models:

| Model | Common Missing Properties |
|-------|--------------------------|
| `Tool` | New tool types (urlContext, fileSearch, mcpServers) |
| `Candidate` | New metadata fields (urlContextMetadata) |
| `Content` | New content types |
| `Part` | New part types |
| `GroundingMetadata` | New grounding data fields |
| `GroundingChunk` | New chunk types (maps, retrievedContext) |
| `GenerationConfig` | New config options |
| `ToolConfig` | New config fields |

### 4c. Manual Verification (if script unavailable)

For each critical model, compare against OpenAPI spec:

```bash
# Extract properties from spec for a schema
jq '.components.schemas.Tool.properties | keys' openapi.json

# Compare with Dart class fields
grep 'final.*\w\+;' lib/src/models/tools/tool.dart
```

### 4d. Fixing Missing Properties

For each missing property:
1. Add field to class: `final Type? propertyName;`
2. Add to constructor: `this.propertyName,`
3. Add to `fromJson`: `propertyName: json['propertyName'],`
4. Add to `toJson`: `'propertyName': propertyName,`
5. Add to `copyWith`: using sentinel pattern
6. Update tests

### Why This Pass Exists

This pass was added because the `urlContext` property was in the OpenAPI spec but
missing from the Dart `Tool` class. The existing verification passes check:
- ✅ New schemas are created
- ✅ Exports are complete
- ✅ Documentation exists

But they did NOT check:
- ❌ Parent models have all spec properties

This pass closes that gap.

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
python3 .claude/skills/openapi-updater/scripts/verify_exports.py

# Documentation verification (CRITICAL - often missed!)
python3 .claude/skills/openapi-updater/scripts/verify_readme.py
python3 .claude/skills/openapi-updater/scripts/verify_examples.py

# Property-level verification (CRITICAL - catches parent model gaps!)
python3 .claude/skills/openapi-updater/scripts/verify_model_properties.py

# README code validation (catches documentation drift)
python3 .claude/skills/openapi-updater/scripts/verify_readme_code.py
```

---

## Review Output Template

Document findings in this format:

### Verified
- [x] FileSearchStore model complete (`lib/src/models/files/file_search_store.dart`)
- [x] GroundingMetadata has all fields (`lib/src/models/metadata/grounding_metadata.dart:42`)

### Gaps Found
- [ ] Part missing `mediaResolution` field (`lib/src/models/content/part.dart:11`)
- [ ] ImageConfig schema not implemented

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
| Type mismatch | Check Type Mappings in implementation-patterns.md |

---

## Updating Verify Scripts

**IMPORTANT:** When adding new features, the verify scripts themselves may need updates.

### When to Update Scripts

| Feature Type | Script to Update | What to Add |
|--------------|------------------|-------------|
| New Tool property | `verify_readme.py` | Add to `TOOL_PROPERTIES` dict |
| New critical model | `verify_model_properties.py` | Add to `CRITICAL_MODELS` list |
| New drift pattern | `verify_readme_code.py` | Add to `DRIFT_PATTERNS` list |
| New resource | Auto-detected | No change needed (uses glob) |
| File path change | `verify_model_properties.py` | Update paths in `CRITICAL_MODELS` |

### Example: Adding a New Tool Property

When you add a new property to the `Tool` class (e.g., `urlContext`):

1. Implement the property in `lib/src/models/tools/tool.dart`
2. Document in README.md
3. **Update `verify_readme.py`**:
   ```python
   TOOL_PROPERTIES = {
       # ... existing ...
       'urlContext': ('URL Context for fetching web content',
                      ['urlcontext', 'url context']),
   }
   ```

### Why This Matters

The verify scripts maintain hardcoded lists of:
- Tool properties that should be documented
- Critical models to check for property completeness
- File paths for model classes
- Known drift patterns in README code

If you add a feature but don't update the scripts, future runs will:
- Miss documentation gaps for new features
- Report false "file not found" errors for moved files
- Fail to catch new documentation drift patterns

---

## Additional Verification Steps

These checks catch issues that have caused bugs in the past:

### Tool Call Correlation (Shared with Live API)
- [ ] `FunctionCall.id` field is preserved in serialization
- [ ] `FunctionResponse.id` field is preserved in serialization
- [ ] These models are included in `CRITICAL_MODELS` for property verification

### EXPECTED_PROPERTIES Sync
- [ ] When adding new fields to spec, update `EXPECTED_PROPERTIES` in `verify_model_properties.py`
- [ ] Both `websocket-updater` and `openapi-updater` scripts are updated if the model is shared
