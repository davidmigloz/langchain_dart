# Implementation Review Checklist

Systematic verification after implementing OpenAPI changes.

## Contents

1. [Pre-Review](#pre-review) - Re-run analysis for fresh comparison
2. [Verification by Category](#verification-by-category) - P0-P4 priority checks
3. [Cross-Reference Verification](#cross-reference-verification) - Sealed classes, nested types
4. [Common Gaps](#common-gaps) - Frequently missed items
5. [Barrel File Completeness (PASS 2)](#barrel-file-completeness-pass-2) - Export verification
6. [README Documentation (PASS 3)](#readme-documentation-pass-3) - Documentation accuracy
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

## README Documentation (PASS 3)

**Check that README.md accurately reflects the current API state.**

### Run the README Validator

```bash
python3 .claude/skills/openapi-updater/scripts/verify_readme.py
```

The script validates:
1. **Resources**: Documented resources match `lib/src/resources/`
2. **Tool types**: All Tool properties are documented (function calling, code execution, etc.)
3. **Stale references**: No references to removed APIs (ragStores, chunks, etc.)
4. **Examples**: Referenced example files actually exist

### If Issues Are Found

**For stale references:**
- Remove references to deleted APIs from API Coverage section
- Update feature comparison tables
- Remove non-existent example file references

**For missing documentation:**
- Add new resource sections to API Coverage
- Document new tool types in Features section
- Update example list if new examples added

### Quick Manual Verification
```bash
# Check if new feature types are documented (backup check)
grep -c "fileSearch\|googleMaps\|mcpServers\|FileSearchStore" README.md

# Compare resource count in README vs actual API
ls lib/src/resources/ | wc -l
```

### Common README Gaps

| Gap | Section | How to Fix |
|-----|---------|------------|
| Stale API Coverage | "API Coverage" section | Update endpoint counts, remove deleted resources |
| Missing new tools | "Features" | Add to Tool support list |
| Missing resources | "API Coverage" | Add new resource subsections |
| Outdated feature tables | "Quick Comparison" | Update capability matrix |
| Non-existent examples | "Examples" | Remove or create missing examples |

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

# Barrel file verification (CRITICAL - often missed!)
python3 .claude/skills/openapi-updater/scripts/verify_exports.py
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
