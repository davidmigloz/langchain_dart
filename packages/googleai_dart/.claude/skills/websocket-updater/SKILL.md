---
name: websocket-updater
description: Automates updating googleai_dart when Gemini Live API WebSocket schema changes. Fetches latest schema, compares against current, generates changelogs and prioritized implementation plans. Use for: (1) Checking for Live API updates, (2) Generating implementation plans for WebSocket changes, (3) Creating new message types from schema, (4) Syncing local schema with upstream. Triggers: "update live api", "sync websocket", "new messages", "live api changes", "check for live updates", "update live schema", "websocket version", "fetch live schema", "compare live schema", "what changed in live api", "live implementation plan".
---

# WebSocket Updater Skill

Automates `googleai_dart` Live API updates when the Gemini WebSocket specification changes.

## Prerequisites

- `GEMINI_API_KEY` or `GOOGLE_AI_API_KEY` environment variable set
- Working directory: `packages/googleai_dart`
- Python 3

## Spec Registry

The skill supports WebSocket API specs via `specs.json`:

| Spec | Description | Auth Required |
|------|-------------|---------------|
| `live` | Gemini Live API (real-time audio/video/text streaming) | Yes |

## Workflow

### 1. Fetch Latest Schema

```bash
# Fetch all specs
python3 .claude/skills/websocket-updater/scripts/fetch_schema.py

# Fetch specific spec only
python3 .claude/skills/websocket-updater/scripts/fetch_schema.py --spec live
```

Output:
- `/tmp/websocket-updater/latest-live.json`

### 2. Analyze Changes

```bash
python3 .claude/skills/websocket-updater/scripts/analyze_changes.py \
  live-api-schema.json /tmp/websocket-updater/latest-live.json \
  --format all \
  --changelog-out /tmp/websocket-updater/changelog-live.md \
  --plan-out /tmp/websocket-updater/plan-live.md
```

Generates:
- `changelog-live.md` - Human-readable change summary
- `plan-live.md` - Prioritized implementation plan (P0-P4)

### 3. Implement Changes

Before implementing, read `references/implementation-patterns.md` for:
- Sealed class structure for messages
- WebSocket connection patterns
- JSON serialization for WebSocket messages
- Test patterns

Use templates from `assets/`:
- `sealed_message_template.dart` - Sealed class for WebSocket messages
- `config_template.dart` - Configuration class structure
- `test_template.dart` - Unit test structure

Implement changes following the plan's priority order.

### 3.5 Update Documentation (MANDATORY)

Before running the review checklist, update all documentation:

1. **README.md** - Add/update:
   - Live API to Features section
   - Live API to API Coverage section
   - Example references in Examples section

2. **example/** - Create/update:
   - `live_example.dart` demonstrating key use cases

3. **CHANGELOG.md** - Add entry for:
   - New features
   - Breaking changes
   - Bug fixes

This is NOT optional. The review will fail if documentation is incomplete.

### 4. Review & Validate (MANDATORY)

Perform the five-pass review documented in `references/REVIEW_CHECKLIST.md`:

1. **Pass 1**: Implementation review against generated plan
2. **Pass 2**: Barrel file verification (`verify_exports.py`)
3. **Pass 3**: Documentation completeness (`verify_readme.py`, `verify_examples.py`)
4. **Pass 4**: Property-level verification (`verify_model_properties.py`)
5. **Pass 5**: Unit test verification (all models have corresponding tests)

**Pass 4 is critical** - it catches missing properties in parent models (e.g., `LiveConfig`).

All passes must complete with zero issues before finalizing.

```bash
python3 .claude/skills/websocket-updater/scripts/verify_exports.py
python3 .claude/skills/websocket-updater/scripts/verify_readme.py
python3 .claude/skills/websocket-updater/scripts/verify_examples.py
python3 .claude/skills/websocket-updater/scripts/verify_model_properties.py
python3 .claude/skills/websocket-updater/scripts/verify_readme_code.py
dart analyze --fatal-infos && dart format --set-exit-if-changed . && dart test test/unit/
```

If gaps are found, fix them using patterns in `references/implementation-patterns.md` and re-run verification.

### 5. Testing (MANDATORY)

After implementing any Live API changes, **create/update unit tests** for all new/modified models:

**Test locations:**
- Config classes: `test/unit/models/live/config/`
- Message types: `test/unit/models/live/messages/`
- Enums: `test/unit/models/live/enums/`

**Required test patterns:**
- `fromJson` - all fields, minimal fields, null handling
- `toJson` - non-null fields included, null fields omitted
- `copyWith` - no params returns same values, partial updates work
- Round-trip preservation (serialize then deserialize)
- Sealed class dispatch (for message types)

**Verification:**
```bash
dart test test/unit/models/live/
```

All tests must pass before completion.

### 6. Finalize

Copy fetched schema to its persisted location:

```bash
cp /tmp/websocket-updater/latest-live.json live-api-schema.json

# Run quality checks
dart test && dart analyze && dart format --set-exit-if-changed .
```

## WebSocket Endpoints

**Google AI:**
```
wss://generativelanguage.googleapis.com/v1beta/models/{model}:BidiGenerateContent?key={API_KEY}&alt=ws
```

**Vertex AI:**
```
wss://{location}-aiplatform.googleapis.com/ws/google.cloud.aiplatform.v1beta1.PredictionService.BidiGenerateContent
Authorization: Bearer {ACCESS_TOKEN}
```

## Message Types

### Client Messages
- `BidiGenerateContentSetup` - Initial session configuration
- `BidiGenerateContentClientContent` - User content/context
- `BidiGenerateContentRealtimeInput` - Real-time audio/video/text input
- `BidiGenerateContentToolResponse` - Tool execution responses

### Server Messages
- `BidiGenerateContentSetupComplete` - Session ready confirmation
- `BidiGenerateContentServerContent` - Model responses
- `BidiGenerateContentToolCall` - Tool execution requests
- `BidiGenerateContentToolCallCancellation` - Tool call cancellations
- `GoAway` - Session ending notification
- `SessionResumptionUpdate` - Resumption token updates

## Troubleshooting

- **API key error**: Export `GEMINI_API_KEY` or `GOOGLE_AI_API_KEY`
- **Network errors**: Check connectivity; retry after a few seconds
- **No changes detected**: Summary shows all zeros; no action needed
