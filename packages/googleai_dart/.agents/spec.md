# API Client Spec

## What and Why

**Goal: Minimal Dependencies**

- **What**: Build a first‑class API client package for Dart/Flutter that relies on **almost zero third‑party dependencies** (runtime), using only the Dart/SDK ecosystem and a small, vetted core (e.g., `package:http` and `package:logging`).
- **Why**: Smaller attack surface, easier audits/compliance, fewer supply‑chain risks, better long‑term maintenance, and predictable performance.

**Goal: Interceptor‑Driven Architecture**

- **What**: Composable, ordered middleware for cross‑cutting concerns (auth, logging, retry, tracing).
- **Why**: Clean separation of concerns, extensibility, predictable ordering, and isolated testing of behaviors.

**Goal: Cancelable, Configurable, Observable Requests**

- **What**: Support abortable requests, global/per‑endpoint/per‑request overrides, and structured logging with redaction.
- **Why**: Improves UX and efficiency, allows flexible integration with multiple environments/services, and ensures reliable debugging/monitoring.

**Goal: Manual Serialization**

- **What**: No codegen frameworks; DTOs are immutable, sealed where polymorphic, with explicit `fromJson`/`toJson`, and forward‑compat via `extra` fields.
- **Why**: Zero codegen overhead, explicit control over wire formats, simpler upgrades, and long‑term stability.

**Goal: Type‑Safe Endpoints**

- **What**: Compile‑time typed request/response shapes and parameters.
- **Why**: Fail early, improve developer experience, and reduce runtime errors.

**Goal: Resource-Based API Organization**

- **What**: API methods are organized into logical resource groups matching the official REST API structure (e.g., `client.models.generateContent()`, `client.files.upload()`, `client.corpora.create()`). Resources encapsulate related operations and can have sub-resources for nested relationships.
- **Why**:
  - **Improved discoverability**: Methods are grouped by domain, making it easier to find relevant operations
  - **Cleaner namespace**: Avoids a flat client with 78+ methods
  - **Mirrors REST structure**: Aligns with the official Google AI REST API organization
  - **Better organization**: Sub-resources naturally express hierarchical relationships (e.g., `corpora.documents().chunks()`)
  - **Encapsulation**: Each resource maintains its own internal state while sharing common infrastructure (interceptors, auth, retry)

**Resource Implementation Pattern:**
- All resources extend `ResourceBase` which provides shared infrastructure: `config`, `httpClient`, `interceptorChain`, `requestBuilder`
- Resources delegate HTTP execution to the interceptor chain to maintain consistent auth, retry, logging, and error handling
- Sub-resources are accessed via methods that return resource instances, optionally taking parent parameters (e.g., `documents(corpus: name)`, `permissions(parent: name)`)
- The client initializes all top-level resources in its constructor and exposes them as public properties

**Resource Hierarchy Example:**
```dart
client.models                    // Top-level resource
  .generateContent()             // Method on models
  .operations(model: ...)        // Sub-resource accessor
    .list()                      // Method on operations

client.corpora                   // Top-level resource
  .create()                      // Method on corpora
  .documents(corpus: name)       // Sub-resource accessor
    .create()                    // Method on documents
    .chunks(document: name)      // Nested sub-resource accessor
      .create()                  // Method on chunks
```

---

## Interceptor Interface – Capabilities & Semantics

- **Short‑circuiting**
  - Interceptors may **return a response early** (e.g., cache hit) without invoking the transport.
  - Short‑circuited responses still pass through **response interceptors** downstream (for logging/metrics), unless explicitly configured to bypass.

- **Chaining & Next Access**
  - Each interceptor receives a **context** and a handle to **call the next interceptor** in the chain (the “next” function). The chain culminates in the transport layer.
  - Interceptors can **wrap** the next call (e.g., measure latency, add headers before, transform response/err after).

- **Retry Semantics (resolve / reject)**
  - Interceptors can decide to **retry** by **re‑invoking** the next handler (with optional mutated context: backoff delay, headers, etc.).
  - They may **resolve()** with a successful response or **reject()** with a transformed error after exhausting policy budgets.
  - Ordering matters: `AuthInterceptor` runs **before** `RetryInterceptor`; `RetryInterceptor` wraps the transport so it can re‑attempt.
  - **Token Refresh During Retries**: Because `RetryInterceptor` wraps the **entire chain** (including `AuthInterceptor`), auth credentials are fetched **fresh on each retry attempt**. This enables OAuth implementations to refresh expired tokens automatically during retries without architectural changes.

- **Error Transformation**
  - Interceptors can **map lower‑level errors** (e.g., socket/timeouts) to domain‑specific `ApiException` types, attach context, or normalize server error payloads.
  - Error transformation must preserve **original cause** and **attempt counters** for observability.

- **Idempotency & Safety**
  - Retry decisions should consider **HTTP method idempotency**, explicit endpoint flags, and server hints (e.g., `Retry‑After`).
  - Provide hooks to tag requests as **safe‑to‑retry** or **do‑not‑retry**.

- **Logging Interceptor**
  - Adds/propagates a **correlation ID** (request ID) *if absent*; never overwrites an explicit ID.
  - Records redacted request/response data, timing, attempt number, and retry outcomes.

- **Streaming Requests**
  - Streaming responses (e.g., Server-Sent Events) cannot pass through the full interceptor chain since `http.StreamedResponse` is consumed incrementally.
  - **Implementation pattern**: Auth, logging, and error mapping logic must be applied **manually before and during streaming** using helper methods.
  - This is an acceptable architectural tradeoff to support real-time streaming while maintaining security and observability.
  - Retry logic typically does not apply to streaming requests (cannot replay a consumed stream).

---

## Request/Response Pipeline (explicit order)

1) **Build Request**
   - Merge configuration (see precedence below); finalize URL, headers, query, body, timeout.
2) **Run Request Interceptors**
   - Typical order: `Auth` → `Headers/Query mutators` → `Logging (request)` → others.
3) **Transport Execution wrapped by Retry**
   - `RetryInterceptor` wraps the transport call; it may schedule re‑attempts based on policy.
4) **Run Response Interceptors**
   - Typical order: `Logging (response)` → `Metrics` → `Error mapping` → `Cache write‑through`.
5) **Deserialize**
   - Parse JSON to typed DTOs; enrich with computed/custom fields; attach response context.
6) **Return**
   - Surface typed result or throw a structured `ApiException`.

---

## Configuration Precedence & Merge Rules (Last‑Write‑Wins)

**General Principle**: When multiple levels set the same value, **last write wins** according to the explicit precedence below.

- **Headers Precedence**
  1. **Global default headers** (client configuration)
  2. **Auth interceptor** adds/updates `Authorization` (or API‑key header)
  3. **Endpoint‑level headers** (declared with the endpoint descriptor)
  4. **Request‑level headers** (per call) – **highest precedence**
  5. **Logging interceptor** may add `X‑Request‑ID` **only if absent** (never overwrites)
  - **Conflict rule**: If the same header is set at multiple levels, the value from the **highest precedence** source persists.

- **Query Parameters Precedence**
  1. Global defaults
  2. Endpoint‑level defaults
  3. Request‑level params (highest)
  - **Conflict rule**: Last write wins; duplicate keys are overwritten by higher‑precedence layer.

- **Base URL Precedence**
  1. Global base URL
  2. Endpoint‑level base URL override
  3. Request‑level base URL override (highest)

- **Timeout & Retry Policy Precedence**
  1. Global defaults
  2. Endpoint‑level overrides
  3. Request‑level overrides (highest)

- **Auth Strategy Precedence**
  1. Global `AuthProvider` (client configuration)
  2. Endpoint‑level override (future capability)
  3. Request‑level override via headers (highest - manual `Authorization` header)

  **AuthProvider Pattern**: Authentication uses a provider interface (`AuthProvider`) that supplies credentials dynamically via `getCredentials()`. This method is called on **each request attempt** (including retries), enabling:
  - **OAuth token refresh**: Providers can detect expired tokens and refresh them automatically
  - **Just-in-time credential resolution**: Credentials are never stale or cached at the wrong layer
  - **Flexible implementations**: API keys, bearer tokens, or custom OAuth flows

  Built-in providers:
  - `ApiKeyProvider(apiKey, placement: queryParam|header)` - Static API keys
  - `BearerTokenProvider(token)` - Static bearer tokens
  - `NoAuthProvider()` - No authentication
  - Custom implementations: Extend `AuthProvider` for OAuth 2.0, JWT rotation, etc.

- **Body Composition**
  - Endpoint defines the **shape** and serialization strategy.
  - Request‑level body data fills/overrides fields defined by the endpoint schema.

- **Special Note on `Authorization`**
  - By default, the **request‑level header may override** `Authorization` (consistent with last‑write‑wins). Teams may optionally enable a **guard** that warns when overriding `Authorization` (useful to spot misconfigurations).

---

## Error Handling Architecture – Sealed Hierarchy & Rich Context

- **Core Principles**
  - Errors surface as a **sealed hierarchy** rooted at `ApiException` with **rich context** for logging, retry, user messaging, and analytics.
  - All thrown errors include a **RequestContext**; errors from the server or transport include a **ResponseContext** when available.

- **Context Model (fields)**
  - **RequestContext**: method, URL, **redacted headers**, correlation ID, timestamp, **attempt number**, derived timeout/retry policy indicators.
  - **ResponseContext**: status code, headers, **body excerpt** (e.g., first 200 chars, redacted), **latency** for the final attempt.

- **Classification (non‑exhaustive)**
  - **TransportError**: DNS/socket/connect/reset, TLS issues; usually no status code.
  - **TimeoutError**: client‑side timeouts (connect/read); includes budget and elapsed times.
  - **CanceledError**: user‑initiated abort; carries correlation ID.
  - **AuthError**: invalid/missing credentials, expired token refresh failure.
  - **ValidationError**: client/input validation failure before transport.
  - **ServerError**: HTTP 5xx or structured server errors; includes parsed error payload excerpt.
  - **DecodingError**: malformed/unexpected payloads; includes offending excerpts and DTO target type.
  - **PolicyError (RetryExhausted)**: retries consumed; includes attempt count and last underlying cause.

- **Mapping Rules**
  - Deterministic mapping from HTTP outcomes and I/O failures → exception subtype.
  - Preserve **original cause** and **stack trace** where available; attach attempt counter and correlation ID.
  - Ensure redaction of secrets in all stored/logged contexts.

- **Operational Expectations**
  - Interceptors may **transform errors** (e.g., wrap raw socket exception → `TransportError`); outer layers rely on structured fields for decisions and UI.

---

## Serialization Strategy (Manual, No Codegen)

- **DTO Conventions**: Immutable objects with explicit constructors; equality/hash defined; `copyWith` with sentinel for nullability; `extra` map for unknown fields.
- **Polymorphism**: Sealed class unions using a discriminator field; exhaustive matching in higher layers.
- **Data Hygiene**: UTC ISO‑8601 timestamps; careful number handling; robust enum parsing with safe fallbacks.
- **Forward‑Compat**: Preserve and round‑trip unknown fields; avoid lossy transforms by default.

---

## Type‑Safe Endpoint Definitions

- **Endpoint Descriptor**: Typed method, path template, path/query schema, body type, response type, idempotency hint, and auth requirements.
- **Validation**: Build‑time/schema‑driven validation of required params before hitting transport.
- **Discoverability**: Group per domain (Users, Payments, etc.); explicit, minimal façades per service.

---

## Unified Configuration Object

- **Contents**: Base URL, default headers/query, `AuthProvider` instance, timeouts, retry policy (attempts, backoff, jitter), logging level/redaction list, and platform hints.
- **Immutability & Derivation**: Prefer immutable config with `copyWith` to scope changes; document precedence rules (above) as the single source of truth.
- **Auth Configuration**: Instead of static `apiKey`/`bearerToken` fields, configuration accepts an `AuthProvider` instance. This provider is invoked on each request attempt, enabling dynamic credential resolution and automatic token refresh.

---

## Package Structure

- **core/**: client, configuration, pipeline/orchestrator, interceptor interfaces, request/response context, cancellation.
- **auth/**: `AuthProvider` interface, `AuthCredentials` sealed class, built-in providers (`ApiKeyProvider`, `BearerTokenProvider`, `NoAuthProvider`).
- **interceptors/**: logging, retry, auth interceptor (applies `AuthProvider` credentials), and extension points.
- **errors/**: sealed exception hierarchy and mappers.
- **dto/**: manual serializers, value semantics helpers, polymorphic models, pagination envelope.
- **endpoints/**: typed endpoint descriptors and service façades by domain.
- **observability/**: redaction utilities, correlation/tracing helpers.
- **docs/** & **examples/**: configuration layering, cancellation, retries, type‑safe endpoints.
- **test/**: unit, integration/mock‑server, property/fuzz, and performance micro‑benchmarks.

---

## Testing Strategy

- **Interceptors**: Unit tests for short‑circuit, chaining, error transform, retry budgets/backoff/jitter, and ordering guarantees.
- **Precedence**: Tests proving last‑write‑wins across headers/query/base URL/auth/timeouts; explicit cases where `Authorization` is overridden (with warning expectations).
- **Cancellation & Timeouts**: Ensure abort path wins over retry attempts; verify time budget enforcement.
- **DTOs**: Golden JSON round‑trips; polymorphic decode; equality/hash invariants; `copyWith` nullability semantics; `extra` preservation.
- **Integration**: Mock server scenarios for 2xx/4xx/5xx, flaky sockets, `Retry‑After`, token refresh, and cache short‑circuit.
- **Performance**: Baseline CPU/allocs for hot paths (serialization, interceptor chain) with regression thresholds.

---

## Documentation Strategy

- **Precedence Cheat Sheet**: One‑pager detailing merge rules and examples (headers/query/base URL/auth/timeouts). Emphasize **last‑write‑wins** policy.
- **Interceptor Recipes**: How to author a custom interceptor; guidelines for order and side‑effects; do’s & don’ts (no mutation after signing, don’t overwrite IDs, etc.).
- **Error Catalogue**: Each `ApiException` subtype with fields, example messages, and UX guidance.
- **Operational Playbook**: Logging setup, redaction list, correlation IDs, production retry defaults, and troubleshooting.
- **DTO Handbook**: Manual serialization patterns, sealed unions, forward‑compat via `extra`.
- **Quickstarts**: Minimal setup, type‑safe endpoint usage, cancellation, and per‑endpoint overrides.
