# Implementation Review Checklist

Systematic verification after implementing OpenAPI changes.

## Contents

1. [Pre-Review](#pre-review) - Re-run analysis for fresh comparison
2. [Verification by Category](#verification-by-category) - P0-P4 priority checks
3. [Cross-Reference Verification](#cross-reference-verification) - Sealed classes, nested types
4. [Common Gaps](#common-gaps) - Frequently missed items
5. [Barrel File Completeness (PASS 2)](#barrel-file-completeness-pass-2) - Export verification
6. [Documentation Completeness (PASS 3)](#documentation-completeness-pass-3) - Documentation completeness
7. [Quality Gates](#quality-gates) - Required checks before finalization
8. [Review Output Template](#review-output-template) - Standard format for findings
9. [Fix Loop Process](#fix-loop-process) - Gap resolution workflow

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
When a new type is added, check if it should be referenced by:
- [ ] `Tool` (new tool types: fileSearch, mcpServers, googleMaps)
- [ ] `ToolConfig` (config extensions)
- [ ] `GenerationConfig` (new config fields)
- [ ] `Candidate` (new response fields)
- [ ] `Content`/`Part` (new content types)

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
