# AGENTS.md

This document defines the **governing principles** and **development guidelines** for this repository. It is a **general development guide** for Dart packages—independent of any single feature. Task‑specific instructions (specs, technical plans, pipelines) live in their own docs.

---

## Purpose & Scope

- Provide **stable rules** that guide all subsequent development.
- Favor **clarity, safety, and maintainability** over cleverness.
- Keep the runtime **lean** (minimal dependencies) and the codebase **auditable**.

---

## Core Principles

**Minimal Dependencies**

- Prefer pure Dart/SDK; add third‑party runtime dependencies only when there is a clear, documented benefit.
- Any new dependency requires a short **trade‑off note** (security, maintenance, alternatives) and approval.

**Type Safety & Null Safety**

- Avoid `dynamic` and unchecked casts. Prefer explicit types, non‑nullable by default.
- Lean on the type system, pattern matching, and sealed classes for correctness.

**Immutability by Default**

- Prefer `final` fields and immutable data structures; use `const` constructors where feasible.
- Use copy semantics (e.g., `copyWith`) rather than mutation.

**Explicit Over Implicit**

- Prefer explicit configuration, explicit imports, and explicit control flow.
- Avoid hidden magic; make invariants obvious in code and docs.

**Security & Privacy First**

- Never commit secrets or credentials. Redact sensitive data in logs.
- Fail safe: treat external input as untrusted; validate early, sanitize consistently.

**Observability**

- Use structured logging with consistent contexts. Keep logs actionable and privacy‑preserving.

**Performance Pragmatism**

- Optimize hot paths that show up in profiling; otherwise keep code simple and readable.

**Documentation & Tests are Part of “Done”**

- Every change must ship with tests and relevant docs. CI must pass with zero analyzer warnings.

---

## Development Commands

### MCP Tools (Preferred)

Use Dart MCP tools for consistent, reliable automation. First register the repository root:

```dart
mcp__dart__add_roots(roots: [
  {uri: "file:///path/to/repo"}
])
```

Common flows:

```dart
// Format all Dart files
mcp__dart__dart_format()

// Apply automated fixes
mcp__dart__dart_fix()

// Static analysis (must be warning-free)
mcp__dart__analyze_files()

// Run all tests with enhanced reporting
mcp__dart__run_tests()

// Dependency management
mcp__dart__pub(command: "get")
mcp__dart__pub(command: "upgrade")
mcp__dart__pub(command: "outdated")

// Discover packages on pub.dev
mcp__dart__pub_dev_search(query: "logging")
```

### CLI Fallbacks

If MCP tools are unavailable, use standard CLI (keep outputs attached to the PR/commit):

```bash
dart format .
dart analyze
dart test

dart pub get
dart pub upgrade
```

---

## Code Standards

**Language & Tooling**

- Target latest stable Dart. Use sound null safety.
- Run `dart format` and keep analyzer **warning‑free**. CI enforces both.

**Style**

- Line width: **120**
- Strings: **single quotes**
- End each file with a **newline**
- Order imports alphabetically and group by: Dart SDK → third‑party → local

**Imports**

- Prefer **package imports** over relative imports outside `lib/`.
- Use explicit imports with `show` clauses when bringing in a few symbols:

  ```dart
  import 'package:logging/logging.dart' show Logger, Level;
  ```

**Naming**

- Files: `snake_case.dart`
- Types (classes/enums): `PascalCase`
- Members: `camelCase`
- Constants: `camelCase` (or SCREAMING_CAPS for module‑level constants)

**Errors & Exceptions**

- Use a **sealed exception** hierarchy for domain/runtime errors; avoid throwing raw `Exception`.
- Exceptions should carry enough **context** for logging and UX messaging (method, URI, status, correlation id, etc.).

**Logging**

- Use `package:logging`. Keep logs structured and **redact** `authorization`, `api-key`, `token`, `password`, etc.
- Cap large payload logs; prefer excerpts in error contexts.

**Concurrency & Async**

- Prefer `async`/`await` for clarity. Avoid blocking calls.
- When heavy CPU work is needed, consider isolates; document boundaries and message shapes.

**Configuration**

- Centralize configuration in **single objects** (immutable where possible).
- Do not hardcode environment‑specific values. Accept via config, CI variables, or secure storage.

**API & Backwards Compatibility**

- Follow **SemVer**. Avoid breaking changes; if unavoidable, document in the changelog with migration notes.

---

## Architecture & Design Patterns (General)

**Package Structure (Dart Library)**

```txt
lib/
├── core/          # Foundation: configuration, utilities, base abstractions
├── models/        # Data models (immutable DTOs/Value objects)
├── services/      # Public APIs (facades) organized by domain
├── errors/        # Exception types and mappers
├── utils/         # Cross-cutting helpers (logging, redaction, parsing)
└── docs/          # In‑package documentation resources
```

**Design Guidance**

- **Layering**: Separate concerns—models, services (facades), utilities, errors.
- **Resource-Based Organization (API Clients)**: For API clients with many endpoints (50+), organize methods into logical resource classes matching the service's REST structure. Use a resource-based hierarchy (`client.models.generateContent()`, `client.files.upload()`) rather than a flat client with all methods. This improves:
  - **Discoverability**: Related operations grouped by domain
  - **Namespace clarity**: Avoids overwhelming flat API surface
  - **Alignment**: Mirrors official API documentation structure
  - **Hierarchy**: Sub-resources express nested relationships naturally (e.g., `corpora.documents().chunks()`)
- **Resource Implementation**: All resources extend a base class providing shared infrastructure (config, HTTP client, interceptor chain, request builder). Resources delegate execution to interceptors to maintain consistent auth, retry, logging, and error handling across all operations.
- **Resource Naming**: Resource classes use the pattern `{Resource}Resource` (e.g., `ModelsResource`, `FilesResource`).
- **Dependency Inversion**: Depend on abstractions; inject concrete implementations.
- **Composition over Inheritance**: Favor small, composable types.
- **Immutability**: Data models are immutable with explicit constructors and `copyWith`.
- **Manual Serialization (Default Policy)**: Prefer explicit `fromJson`/`toJson`. Introduce codegen only with prior approval.
- **Extensibility Points**: Design small interfaces for cross‑cutting concerns (e.g., logging sinks, clock interfaces) to ease testing.
- **Observability Hooks**: Provide simple ways to attach loggers/metrics without coupling.

**Performance & Memory**

- Avoid premature optimization. Measure first.
- Be mindful of allocations in hot paths; reuse buffers/encoders when justified and documented.

---

## Testing Guidelines

**Test Types**

- **Unit tests**: Pure logic, models, helpers—fast and deterministic.
- **Integration tests**: Interactions across modules; use local mock servers or fakes.
- **Property/Fuzz tests** (optional): For parsers/serializers.
- **Performance checks** (targeted): Guard hot paths from regressions.

**Conventions**

- Naming: `*_test.dart` mirroring source structure.
- Determinism: No sleeps/flaky timing; seed randoms.
- Prefer **fakes** over mocks; use mocks only when necessary.
- Each PR must keep **tests green** and **analyzer clean**.

**Running Tests (MCP)**

```dart
mcp__dart__run_tests()
```

---

## Documentation Requirements

**Project Docs**

- **README.md** at package root with: purpose, quick start, supported platforms, configuration, examples.
- **CHANGELOG.md** following SemVer with human‑readable entries.
- **CONTRIBUTING.md** describing branching, reviews, CI, and coding standards.
- **AGENTS.md** (this file) for agent rules; keep in sync when standards change.

**API Docs**

- Use `dart doc` comments (`///`) on all public APIs.
- Keep examples minimal and runnable.

**Design Notes**

- Record significant architectural decisions in short **ADRs** (Architecture Decision Records) inside `docs/`.

---

## Agent Responsibilities

- **Use MCP tools** for format/analyze/fix/tests; attach outputs to your change notes when useful.
- **Keep it small**: submit focused, reviewable changes with clear commit messages (Conventional Commits recommended).
- **Honor minimal‑deps policy**: propose new dependencies only with trade‑off notes.
- **Maintain type & null safety**: avoid `dynamic` and implicit casts.
- **Write tests and docs** with every change; update examples when behavior changes.
- **Protect secrets**: never commit keys; redact logs; scrub artifacts.
- **Make code readable**: consistent naming, comments where intent isn’t obvious, no dead code.
- **Ensure reproducibility**: lock constraints, avoid relying on machine‑local state.

---

## Non‑Goals

- Introducing heavy frameworks or codegen by default.
- Accepting analyzer warnings or skipping tests in CI.
- Embedding credentials, secrets, or PII in code, tests, or logs.
- Relying on platform‑specific behavior without explicit, documented need.
- Over‑engineering: avoid unnecessary abstractions and premature optimization.
- Copy‑pasting large third‑party snippets without review and attribution.

---

## Quick MCP Reference

```dart
mcp__dart__add_roots(roots: [{uri: "file:///path/to/repo"}])
mcp__dart__dart_format()
mcp__dart__dart_fix()
mcp__dart__analyze_files()
mcp__dart__run_tests()
mcp__dart__pub(command: "get")
mcp__dart__pub(command: "upgrade")
mcp__dart__pub(command: "outdated")
mcp__dart__pub_dev_search(query: "logging")
```

> These guidelines are intentionally general. For implementation details, see the project’s **specs**, **technical plans**, and **task** documents.
