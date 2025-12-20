---
name: openapi-updater
description: Automates updating googleai_dart when Google AI OpenAPI spec changes. Fetches latest spec, compares against current, generates changelogs and prioritized implementation plans. Use for: (1) Checking for API updates, (2) Generating implementation plans for spec changes, (3) Creating new models/endpoints from spec, (4) Syncing local spec with upstream. Triggers: "update api", "sync openapi", "new endpoints", "api changes", "check for updates", "update spec", "api version", "fetch spec", "compare spec", "what changed in the api", "implementation plan".
---

# OpenAPI Updater Skill

Automates `googleai_dart` updates when the Google AI OpenAPI specification changes.

## Prerequisites

- `GEMINI_API_KEY` or `GOOGLE_AI_API_KEY` environment variable set (for main spec)
- Working directory: `packages/googleai_dart`
- Python 3

## Spec Registry

The skill supports multiple OpenAPI specs via `specs.json`:

| Spec | Description | Auth Required |
|------|-------------|---------------|
| `main` | Core Gemini API (generation, embeddings, files, models, etc.) | Yes |
| `interactions` | Experimental Interactions API (server-side state, agents) | No |

## Workflow

### 1. Fetch Latest Specs

```bash
# Fetch all specs + auto-discover new ones
python3 .claude/skills/openapi-updater/scripts/fetch_spec.py

# Fetch specific spec only
python3 .claude/skills/openapi-updater/scripts/fetch_spec.py --spec main
python3 .claude/skills/openapi-updater/scripts/fetch_spec.py --spec interactions

# Skip discovery probing
python3 .claude/skills/openapi-updater/scripts/fetch_spec.py --no-discover
```

Output:
- `/tmp/openapi-updater/latest-main.json`
- `/tmp/openapi-updater/latest-interactions.json`

### 2. Analyze Changes

For main spec:
```bash
python3 .claude/skills/openapi-updater/scripts/analyze_changes.py \
  openapi.json /tmp/openapi-updater/latest-main.json \
  --format all \
  --changelog-out /tmp/openapi-updater/changelog-main.md \
  --plan-out /tmp/openapi-updater/plan-main.md
```

For interactions spec:
```bash
python3 .claude/skills/openapi-updater/scripts/analyze_changes.py \
  openapi-interactions.json /tmp/openapi-updater/latest-interactions.json \
  --format all \
  --changelog-out /tmp/openapi-updater/changelog-interactions.md \
  --plan-out /tmp/openapi-updater/plan-interactions.md
```

Generates:
- `changelog-{spec}.md` - Human-readable change summary
- `plan-{spec}.md` - Prioritized implementation plan (P0-P4)

### 3. Implement Changes

Before implementing, read `references/implementation-patterns.md` for:
- Model class structure and conventions
- Enum naming patterns
- JSON serialization patterns
- Test patterns and PR templates

Use templates from `assets/`:
- `model_template.dart` - Model class structure
- `enum_template.dart` - Enum type structure
- `test_template.dart` - Unit test structure

Implement each change as a separate PR following the plan's priority order.

### 3.5 Update Documentation (MANDATORY)

Before running the review checklist, update all documentation:

1. **README.md** - Add/update:
   - New resources to Features section
   - New resources to API Coverage section
   - New example references in Examples section

2. **example/** - Create/update:
   - `{feature}_example.dart` for each new resource
   - Demonstrate key use cases (basic, advanced, streaming, etc.)

3. **CHANGELOG.md** - Add entry for:
   - New features
   - Breaking changes
   - Bug fixes

This is NOT optional. The review will fail if documentation is incomplete.

Use templates from `assets/`:
- `example_template.dart` - Example file structure

Use patterns from `references/implementation-patterns.md`:
- Section 9: Documentation Patterns

### 4. Review & Validate (MANDATORY)

Perform the three-pass review documented in `references/REVIEW_CHECKLIST.md`:

1. **Pass 1**: Implementation review against generated plan
2. **Pass 2**: Barrel file verification (`verify_exports.py`)
3. **Pass 3**: Documentation completeness (`verify_readme.py`, `verify_examples.py`)

All passes must complete with zero issues before finalizing.

```bash
python3 .claude/skills/openapi-updater/scripts/verify_exports.py
python3 .claude/skills/openapi-updater/scripts/verify_readme.py
python3 .claude/skills/openapi-updater/scripts/verify_examples.py
dart analyze --fatal-infos && dart format --set-exit-if-changed . && dart test test/unit/
```

If gaps are found, fix them using patterns in `references/implementation-patterns.md` and re-run verification.

### 5. Finalize

Copy fetched specs to their persisted locations:

```bash
# For main spec
cp /tmp/openapi-updater/latest-main.json openapi.json

# For interactions spec
cp /tmp/openapi-updater/latest-interactions.json openapi-interactions.json

# Run quality checks
dart test && dart analyze && dart format --set-exit-if-changed .
```

## Auto-Discovery

The skill automatically probes for new API specs on each fetch. Known discovery patterns:

- `https://ai.google.dev/static/api/{name}.openapi.json`

If new specs are found, you'll see a warning with instructions to add them to `specs.json`.

## Adding New Specs

Edit `specs.json` to add a new spec:

```json
{
  "specs": {
    "new-api": {
      "name": "New API",
      "url": "https://example.com/new-api.openapi.json",
      "local_file": "openapi-new-api.json",
      "requires_auth": false,
      "experimental": true,
      "description": "Description of the new API"
    }
  }
}
```

## Troubleshooting

- **API key error**: Export `GEMINI_API_KEY` or `GOOGLE_AI_API_KEY`
- **Network errors**: Check connectivity; retry after a few seconds
- **No changes detected**: Summary shows all zeros; no action needed
- **New specs discovered**: Add them to `specs.json` and re-run

