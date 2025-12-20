---
name: openapi-updater
description: Automates updating googleai_dart when Google AI OpenAPI spec changes. Fetches latest spec, compares against current, generates changelogs and prioritized implementation plans. Use for: (1) Checking for API updates, (2) Generating implementation plans for spec changes, (3) Creating new models/endpoints from spec, (4) Syncing local spec with upstream. Triggers: "update api", "sync openapi", "new endpoints", "api changes", "check for updates", "update spec", "api version", "fetch spec", "compare spec", "what changed in the api", "implementation plan".
---

# OpenAPI Updater Skill

Automates `googleai_dart` updates when the Google AI OpenAPI specification changes.

## Prerequisites

- `GEMINI_API_KEY` or `GOOGLE_AI_API_KEY` environment variable set
- Working directory: `packages/googleai_dart`
- Python 3

## Workflow

### 1. Fetch Latest Spec

```bash
python3 .claude/skills/openapi-updater/scripts/fetch_spec.py
```

Output: `/tmp/openapi-updater/latest.json`

### 2. Analyze Changes

```bash
python3 .claude/skills/openapi-updater/scripts/analyze_changes.py \
  openapi.json /tmp/openapi-updater/latest.json \
  --format all \
  --changelog-out /tmp/openapi-updater/changelog.md \
  --plan-out /tmp/openapi-updater/plan.md
```

Generates:
- `changelog.md` - Human-readable change summary
- `plan.md` - Prioritized implementation plan (P0-P4)

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

### 4. Finalize

```bash
cp /tmp/openapi-updater/latest.json openapi.json
dart test && dart analyze && dart format --set-exit-if-changed .
```

## Troubleshooting

- **API key error**: Export `GEMINI_API_KEY` or `GOOGLE_AI_API_KEY`
- **Network errors**: Check connectivity; retry after a few seconds
- **No changes detected**: Summary shows all zeros; no action needed
