# Research Document - GoogleAI Dart Client

**Date**: 2025-09-30
**OpenAPI Version**: v1beta (revision: 20250928)
**Base URL**: https://generativelanguage.googleapis.com

---

## Executive Summary

This document captures all research findings from analyzing the GoogleAI (Gemini) OpenAPI specification. It resolves key architectural decisions and documents unknowns that require testing during implementation.

**Key Metrics**:
- **64 endpoints** across 10 functional categories
- **182 schemas** with complex polymorphic types
- **Special patterns**: Streaming (3 endpoints), LRO (8 endpoints), Pagination (13 endpoints), Batch operations (12 endpoints)

---

## 1. Technology & Dependency Decisions

### Decision: Minimal Runtime Dependencies

**Chosen**:
- `package:http` - HTTP client (Dart SDK recommended)
- `package:logging` - Structured logging

**Rationale**:
- Aligns with spec.md goal of "minimal dependencies"
- Both packages are official Dart ecosystem packages with strong maintenance
- `package:http` provides sufficient control for interceptor implementation
- No codegen dependencies needed (manual serialization)

**Alternatives Considered**:
- `package:dio` - Rejected: heavier, more third-party dependencies
- `package:shelf_client` - Rejected: less commonly used
- `dart:io HttpClient` - Rejected: lower-level, harder to test

### Decision: Manual Serialization (No Codegen)

**Chosen**: Hand-written `fromJson`/`toJson` methods

**Rationale**:
- Spec.md explicitly requires "Manual Serialization"
- Full control over wire format and forward-compatibility
- No build complexity or codegen setup
- Easier to handle polymorphic types (sealed classes)

**Trade-offs**:
- More initial implementation time
- More code to maintain
- But: simpler debugging, explicit control, better for library consumers

---

## 2. Architecture Decisions

### Decision: Interceptor-Driven Architecture

**Pattern**: Request/Response pipeline with ordered interceptors

**Interceptor Order**:
```
Request Flow:
  Auth ’ Retry (wraps transport) ’ Logging (request) ’ Transport ’ Logging (response) ’ Error Mapping

Response Flow (reverse):
  Transport ’ Logging (response) ’ Error Mapping ’ Retry (may re-invoke) ’ Auth
```

**Rationale**:
- Matches spec.md "Interceptor-Driven Architecture" requirement
- Clean separation of cross-cutting concerns
- Testable in isolation
- Extensible for users

**Key Interceptors**:

1. **AuthInterceptor** (precedence: request > endpoint > global)
   - Injects API key as query param `?key=` OR header `X-Goog-Api-Key:`
   - Injects OAuth Bearer token via `Authorization` header
   - Never overwrites explicit request-level auth

2. **RetryInterceptor** (wraps transport)
   - Exponential backoff with jitter for 429, 5xx errors
   - Respects `Retry-After` header
   - Max retries: 3 (configurable)
   - Backoff: 1s ’ 2s ’ 4s (with jitter)
   - Only retries idempotent methods (GET, PUT, DELETE) or safe-to-retry flag

3. **LoggingInterceptor**
   - Adds `X-Request-ID` if absent (never overwrites)
   - Logs redacted request/response (redacts: `authorization`, `api-key`, `token`, `password`)
   - Records timing, attempt count, status codes

4. **ErrorInterceptor**
   - Maps HTTP errors ’ sealed `GoogleAIException` hierarchy
   - Parses `Status` objects from error responses
   - Attaches request context for debugging

### Decision: Configuration Precedence (Last-Write-Wins)

**Rule**: Request-level > Endpoint-level > Global

**Applies to**:
- Headers (including `Authorization`)
- Query parameters
- Base URL
- Timeout
- Retry policy
- Auth strategy

**Exception**: `X-Request-ID` - only added if absent (never overwrites)

**Rationale**: Matches spec.md "Configuration Precedence & Merge Rules"

---

## 3. API Endpoint Organization

### 3.1 Content Generation (13 endpoints) P CORE

**Primary Endpoints**:
- `POST /v1beta/models/{model}:generateContent` - Synchronous generation
- `POST /v1beta/models/{model}:streamGenerateContent` - Streaming generation
- `POST /v1beta/tunedModels/{tunedModel}:generateContent` - Custom model generation
- `POST /v1beta/tunedModels/{tunedModel}:streamGenerateContent` - Custom model streaming

**Legacy Endpoints** (PaLM era):
- `POST /v1beta/models/{model}:generateMessage`
- `POST /v1beta/models/{model}:generateText`

**Special Endpoints**:
- `POST /v1beta/models/{model}:generateAnswer` - RAG-based Q&A
- `POST /v1beta/models/{model}:predict` - Veo video generation
- `POST /v1beta/models/{model}:predictLongRunning` - Veo with LRO

**  UNCLEAR**:
- `POST /v1beta/dynamic/{dynamicId}:generateContent` - What is `dynamicId`?
- `POST /v1beta/dynamic/{dynamicId}:streamGenerateContent`

**Decision**: Implement primary + tuned model endpoints first; defer legacy and unclear endpoints.

### 3.2 Embeddings (6 endpoints)

- `POST /v1beta/models/{model}:embedContent` - Single embedding
- `POST /v1beta/models/{model}:batchEmbedContents` - Synchronous batch (instant response)
- `POST /v1beta/models/{model}:asyncBatchEmbedContent` - Asynchronous batch (returns `Operation`)

**Legacy**: `embedText`, `batchEmbedText`

**Decision**: Implement modern endpoints first.

### 3.3 Token Counting (3 endpoints)

- `POST /v1beta/models/{model}:countTokens` P RECOMMENDED

**Use Cases**:
- Pre-flight check for quota management
- Cost estimation before expensive operations
- Context window validation

**Decision**: Implement as utility method on client.

### 3.4 Models & Tuned Models (13 endpoints)

**Model Discovery**:
- `GET /v1beta/models` - List available models (paginated)
- `GET /v1beta/models/{model}` - Get model metadata

**Tuned Model Management**:
- `POST /v1beta/tunedModels` - Create fine-tuned model
- `GET /v1beta/tunedModels` - List user's models (paginated)
- `GET /v1beta/tunedModels/{tunedModel}` - Get model details
- `PATCH /v1beta/tunedModels/{tunedModel}` - Update model
- `DELETE /v1beta/tunedModels/{tunedModel}` - Delete model
- `POST /v1beta/tunedModels/{tunedModel}:transferOwnership` - Transfer ownership

**Decision**: Implement as separate service facade (`ModelsService`, `TunedModelsService`)

### 3.5 File Management (5 endpoints)

**Lifecycle**:
1. Upload ’ `POST /v1beta/files` ’ Returns `File` with `state: PROCESSING`
2. Poll ’ `GET /v1beta/files/{file}` until `state: ACTIVE`
3. Use ’ Reference via `Part.fileData.fileUri` in content
4. Download (optional) ’ `GET /v1beta/files/{file}:download`
5. Delete ’ `DELETE /v1beta/files/{file}` (or auto-expires)

**  UNKNOWN**: Upload mechanism
- Is it `multipart/form-data`?
- Or JSON with base64-encoded body?
- Field names for multipart?

**Decision**: Test live API to determine format; implement helper method `uploadFile(File file)`.

### 3.6 Content Caching (5 endpoints)

**Purpose**: Cache long contexts for reuse (e.g., system prompts, document context)

**Lifecycle**:
1. Create ’ `POST /v1beta/cachedContents` with `contents`, `model`, `ttl`
2. Use ’ Reference via `GenerateContentRequest.cachedContent: "cachedContents/xyz"`
3. Update ’ `PATCH /v1beta/cachedContents/{id}` (extend TTL)
4. Delete ’ `DELETE /v1beta/cachedContents/{id}`

**Key Schema Fields**:
- `model: string` (required, immutable)
- `contents: Content[]` (input only, immutable)
- `ttl: string` or `expireTime: timestamp` (mutable)
- `usageMetadata: CachedContentUsageMetadata` (output only)

**Decision**: Implement as `CacheService` with TTL management helpers.

### 3.7 Corpus/RAG Management (20 endpoints)

**Hierarchy**: `Corpus` ’ `Document` ’ `Chunk`

**Corpus Operations** (6 endpoints):
- CRUD: Create, List, Get, Update, Delete
- `POST /v1beta/corpora/{corpus}:query` - Semantic search

**Document Operations** (6 endpoints):
- CRUD under corpus or RAG store
- `POST /v1beta/ragStores/{ragStore}/documents/{document}:query`

**Chunk Operations** (8 endpoints):
- CRUD: Create, List, Get, Update, Delete
- Bulk: `batchCreate`, `batchUpdate`, `batchDelete` (max 100 chunks)

**Decision**: Implement as `CorpusService` with nested resources. Defer unless RAG features are prioritized.

### 3.8 Batch Operations (12 endpoints)

**Batch Types**:
- `GenerateContentBatch` - Bulk generation
- `EmbedContentBatch` - Bulk embeddings

**States**: `PENDING` ’ `RUNNING` ’ `SUCCEEDED` / `FAILED` / `CANCELLED` / `EXPIRED`

**Key Operations**:
- Create: Returns `Operation` or batch ID
- Poll: `GET /v1beta/batches/{id}`
- Cancel: `POST /v1beta/batches/{id}:cancel`
- Update: `PATCH /v1beta/batches/{id}:update*`

**  UNKNOWN**: Max batch sizes (spec mentions 100 for chunks, unclear for generation/embeddings)

**Decision**: Implement with LRO poller; start with batch size 100.

### 3.9 Long-Running Operations (8 endpoints)

**Standard Google LRO Pattern**:
1. Initiate ’ Returns `Operation` with `done: false`, `name: "operations/xyz"`
2. Poll ’ `GET /{resource}/operations/{operation}` until `done: true`
3. Check result ’ `error: Status` or `response: object`
4. Optional: Cancel via parent resource `:cancel` endpoint

**Applies to**:
- Tuned model creation
- Batch operations
- File generation (Veo)
- Corpus operations

**Decision**: Implement generic `LROPoller<T>` utility class.

### 3.10 Permissions (10 endpoints)

**Access Control** for:
- Corpora (`/v1beta/corpora/{corpus}/permissions`)
- Tuned Models (`/v1beta/tunedModels/{tunedModel}/permissions`)

**Operations**: Create, List, Get, Update, Delete

**Permission Types**:
- `granteeType`: `USER`, `GROUP`, `EVERYONE`
- `role`: `OWNER`, `WRITER`, `READER`

**Decision**: Implement as methods on parent resources (e.g., `Corpus.grantPermission()`).

---

## 4. Critical Data Models

### 4.1 Content & Part (Polymorphic Core) PPP

**Content Schema**:
```dart
class Content {
  final String role;        // "user" | "model"
  final List<Part> parts;   // Multi-part message
}
```

**Part Schema** - **MOST COMPLEX TYPE**:
- 11 mutually exclusive fields representing different content types

**Decision: Sealed Class Approach**:

```dart
sealed class Part {
  const Part();
}

class TextPart extends Part {
  final String text;
  const TextPart(this.text);
}

class InlineDataPart extends Part {
  final Blob inlineData;
  const InlineDataPart(this.inlineData);
}

class FileDataPart extends Part {
  final FileData fileData;
  const FileDataPart(this.fileData);
}

class FunctionCallPart extends Part {
  final FunctionCall functionCall;
  const FunctionCallPart(this.functionCall);
}

class FunctionResponsePart extends Part {
  final FunctionResponse functionResponse;
  const FunctionResponsePart(this.functionResponse);
}

class ExecutableCodePart extends Part {
  final ExecutableCode executableCode;
  const ExecutableCodePart(this.executableCode);
}

class CodeExecutionResultPart extends Part {
  final CodeExecutionResult codeExecutionResult;
  const CodeExecutionResultPart(this.codeExecutionResult);
}

class VideoMetadataPart extends Part {
  final VideoMetadata videoMetadata;
  const VideoMetadataPart(this.videoMetadata);
}

class ThoughtPart extends Part {
  final bool thought;
  const ThoughtPart(this.thought);
}

class ThoughtSignaturePart extends Part {
  final List<int> thoughtSignature;
  const ThoughtSignaturePart(this.thoughtSignature);
}

class PartMetadataPart extends Part {
  final Map<String, dynamic> partMetadata;
  const PartMetadataPart(this.partMetadata);
}
```

**Rationale**:
- Dart 3.0 sealed classes enable exhaustive pattern matching
- Type-safe at compile time
- Prevents invalid states (multiple fields set)
- Better than single class with nullable fields

**JSON Serialization**:
```dart
Part partFromJson(Map<String, dynamic> json) {
  if (json.containsKey('text')) return TextPart(json['text']);
  if (json.containsKey('inlineData')) return InlineDataPart(Blob.fromJson(json['inlineData']));
  // ... check all 11 variants
  throw FormatException('Unknown Part type: ${json.keys}');
}

Map<String, dynamic> partToJson(Part part) {
  return switch (part) {
    TextPart(:final text) => {'text': text},
    InlineDataPart(:final inlineData) => {'inlineData': inlineData.toJson()},
    // ... all 11 variants
  };
}
```

### 4.2 Generation Configuration (19 Properties)

**GenerationConfig** - All fields optional:

```dart
class GenerationConfig {
  final double? temperature;           // 0.0 - 2.0
  final double? topP;                  // Nucleus sampling
  final int? topK;                     // Top-K sampling
  final int? maxOutputTokens;          // Response length limit
  final int? candidateCount;           // Number of responses
  final List<String>? stopSequences;   // Stop generation triggers
  final String? responseMimeType;      // "text/plain" | "application/json"
  final Schema? responseSchema;        // JSON Schema for structured output
  final double? presencePenalty;       // -2.0 to 2.0
  final double? frequencyPenalty;      // -2.0 to 2.0
  final int? seed;                     // For reproducible generation
  final int? logprobs;                 // Number of logprobs per token
  final bool? responseLogprobs;        // Enable logprobs in response
  final List<String>? responseModalities; // ["TEXT", "IMAGE"]
  final String? mediaResolution;       // "LOW" | "MEDIUM" | "HIGH"
  // ... 4 more advanced properties
}
```

**Decision**: Implement with builder pattern or copyWith for ergonomic configuration.

### 4.3 Safety Settings (12 Categories)

**HarmCategory Enum**:
- **Gemini models**: `HARASSMENT`, `HATE_SPEECH`, `SEXUALLY_EXPLICIT`, `DANGEROUS_CONTENT`, `CIVIC_INTEGRITY`
- **PaLM models (legacy)**: `DEROGATORY`, `TOXICITY`, `VIOLENCE`, `SEXUAL`, `MEDICAL`, `DANGEROUS`

**HarmBlockThreshold Enum**:
- `BLOCK_NONE` - No blocking
- `BLOCK_LOW_AND_ABOVE` - Block low, medium, high
- `BLOCK_MEDIUM_AND_ABOVE` - Block medium, high
- `BLOCK_ONLY_HIGH` - Block only high

**SafetySetting Schema**:
```dart
class SafetySetting {
  final HarmCategory category;
  final HarmBlockThreshold threshold;
}
```

**SafetyRating Schema** (in response):
```dart
class SafetyRating {
  final HarmCategory category;
  final HarmProbability probability;  // NEGLIGIBLE | LOW | MEDIUM | HIGH
  final bool blocked;
  final double probabilityScore;      // 0.0 - 1.0
}
```

**Decision**: Use enums for type safety; provide const presets for common configurations.

### 4.4 Tools & Function Calling

**Tool Schema** (multiple optional fields):
```dart
class Tool {
  final List<FunctionDeclaration>? functionDeclarations;
  final GoogleSearch? googleSearch;
  final GoogleSearchRetrieval? googleSearchRetrieval;
  final CodeExecution? codeExecution;
  final ComputerUse? computerUse;
  final UrlContext? urlContext;
}
```

**FunctionDeclaration Schema**:
```dart
class FunctionDeclaration {
  final String name;
  final String description;
  final Schema? parameters;              // OpenAPI 3.0 Schema
  final Map<String, dynamic>? parametersJsonSchema; // Alternative JSON Schema
  final Schema? response;
  final Map<String, dynamic>? responseJsonSchema;
  final String? behavior;                // "BLOCKING" | "NON_BLOCKING"
}
```

**Function Calling Flow**:
1. Send request with `tools` containing function declarations
2. Model returns `FunctionCallPart` in response
3. Execute function locally
4. Send next request with `FunctionResponsePart`
5. Model continues generation with result

**Decision**: Implement helper methods for function registration and automatic response handling.

### 4.5 File Management

**File Schema**:
```dart
class File {
  final String name;                  // "files/abc123"
  final String? displayName;
  final String mimeType;              // Output only
  final String sizeBytes;             // int64 as string, output only
  final DateTime createTime;          // Output only
  final DateTime updateTime;          // Output only
  final DateTime expirationTime;
  final String sha256Hash;            // Base64-encoded
  final String uri;                   // Output only
  final String? downloadUri;          // Temporary URL, output only
  final FileState state;              // PROCESSING | ACTIVE | FAILED
  final Status? error;                // If state is FAILED
  final Map<String, dynamic>? metadata;
}
```

**FileState Enum**: `PROCESSING`, `ACTIVE`, `FAILED`

**Decision**: Implement async upload with polling until `ACTIVE` state.

---

## 5. Special Patterns

### 5.1 Streaming P

**Endpoints**:
- `POST /v1beta/models/{model}:streamGenerateContent`
- `POST /v1beta/tunedModels/{tunedModel}:streamGenerateContent`

**  UNKNOWN**: Wire format not specified in OpenAPI

**Hypotheses**:

1. **Server-Sent Events (SSE)**:
```
data: {"candidates":[...]}

data: {"candidates":[...]}

data: [DONE]
```

2. **Newline-Delimited JSON (NDJSON)**:
```json
{"candidates":[...]}
{"candidates":[...]}
```

**Testing Plan**: Test live API with both parsers.

**Implementation Decision**: Support both formats, auto-detect based on:
- SSE: Lines start with `data: `
- NDJSON: Lines are raw JSON objects

**Dart Implementation**:
```dart
Stream<GenerateContentResponse> streamGenerateContent(
  GenerateContentRequest request,
) async* {
  final response = await _httpClient.send(httpRequest);

  await for (final line in response.stream
      .transform(utf8.decoder)
      .transform(const LineSplitter())) {

    if (line.isEmpty) continue;

    // Handle SSE format
    if (line.startsWith('data: ')) {
      final jsonStr = line.substring(6);
      if (jsonStr == '[DONE]') break;
      yield GenerateContentResponse.fromJson(jsonDecode(jsonStr));
    } else {
      // Handle NDJSON
      yield GenerateContentResponse.fromJson(jsonDecode(line));
    }
  }
}
```

**Cancellation**: Use `Stream.listen()` subscription cancel or `StreamController` close.

### 5.2 Long-Running Operations (LRO)

**Pattern**: Standard Google Cloud LRO

**Operation Schema**:
```dart
class Operation {
  final String name;              // "operations/xyz"
  final Map<String, dynamic>? metadata;
  final bool done;
  final Status? error;            // If done && failed
  final Map<String, dynamic>? response; // If done && succeeded
}
```

**Polling Implementation**:
```dart
class LROPoller<T> {
  final GoogleAIClient client;
  final Duration pollInterval;
  final Duration timeout;

  Future<T> wait(Operation operation) async {
    final deadline = DateTime.now().add(timeout);
    var currentOperation = operation;

    while (!currentOperation.done) {
      if (DateTime.now().isAfter(deadline)) {
        throw TimeoutException('Operation timeout');
      }

      await Future.delayed(pollInterval);
      currentOperation = await client.getOperation(currentOperation.name);
    }

    if (currentOperation.error != null) {
      throw ApiException.fromStatus(currentOperation.error!);
    }

    return currentOperation.response as T;
  }

  // Stream version for progress updates
  Stream<Operation> watchOperation(Operation operation) async* {
    var currentOperation = operation;
    yield currentOperation;

    while (!currentOperation.done) {
      await Future.delayed(pollInterval);
      currentOperation = await client.getOperation(currentOperation.name);
      yield currentOperation;
    }
  }
}
```

**Configuration**:
- Default poll interval: 5 seconds
- Default timeout: 30 minutes
- Both configurable per operation

### 5.3 Pagination

**Pattern**: Cursor-based with `pageSize` and `pageToken`

**Request**:
```
GET /v1beta/models?pageSize=50&pageToken=xyz
```

**Response**:
```json
{
  "models": [...],
  "nextPageToken": "abc"  // Empty or null if no more pages
}
```

**Paginated Endpoints** (13 total):
- Models, TunedModels, Files, GeneratedFiles
- CachedContents, Corpora, Documents, Chunks
- Operations, Permissions

**Helper Implementation**:
```dart
class PaginatedList<T> {
  final List<T> items;
  final String? nextPageToken;

  bool get hasMore => nextPageToken != null && nextPageToken!.isNotEmpty;
}

// Stream-based pagination
Stream<T> listAll<T>({
  required Future<PaginatedList<T>> Function(String? pageToken) fetcher,
}) async* {
  String? pageToken;

  do {
    final page = await fetcher(pageToken);
    for (final item in page.items) {
      yield item;
    }
    pageToken = page.nextPageToken;
  } while (pageToken != null && pageToken.isNotEmpty);
}
```

**Decision**: Provide both page-based and stream-based APIs for flexibility.

### 5.4 Batch Operations

**Batch States**:
```
BATCH_STATE_PENDING
BATCH_STATE_RUNNING
BATCH_STATE_SUCCEEDED
BATCH_STATE_FAILED
BATCH_STATE_CANCELLED
BATCH_STATE_EXPIRED
```

**Two Batch Modes**:

1. **Synchronous** (instant response):
   - `batchEmbedContents` - Returns embeddings immediately

2. **Asynchronous** (LRO):
   - `batchGenerateContent` - Returns `Operation`, poll for completion

**BatchStats Schema**:
```dart
class BatchStats {
  final String requestCount;           // int64 as string
  final String pendingRequestCount;
  final String successfulRequestCount;
  final String failedRequestCount;
}
```

**  UNKNOWN**: Max batch sizes

**Testing Plan**: Test with increasing batch sizes (10, 50, 100, 500) to find limits.

**Decision**: Start with batch size 100, expose as configurable parameter.

---

## 6. Authentication & Authorization

### 6.1 Authentication Methods

**  CRITICAL**: OpenAPI spec does NOT define security schemes

**Based on URL pattern and Google API conventions**:

#### Option 1: API Key (Query Parameter)
```
GET https://generativelanguage.googleapis.com/v1beta/models?key=YOUR_API_KEY
```

#### Option 2: API Key (Header)
```
GET https://generativelanguage.googleapis.com/v1beta/models
X-Goog-Api-Key: YOUR_API_KEY
```

#### Option 3: OAuth 2.0 (Bearer Token)
```
GET https://generativelanguage.googleapis.com/v1beta/models
Authorization: Bearer YOUR_ACCESS_TOKEN
```

**Decision**: Support all three methods

**Default**: Query parameter (most common for Google APIs)

**Implementation**:
```dart
class GoogleAIClient {
  final String? apiKey;
  final String? bearerToken;
  final AuthPlacement authPlacement; // QUERY_PARAM | HEADER

  GoogleAIClient({
    this.apiKey,
    this.bearerToken,
    this.authPlacement = AuthPlacement.queryParam,
  });
}
```

**AuthInterceptor** adds auth based on placement preference.

### 6.2 Permission Model

**Resource-level access control** for:
- Corpora
- Tuned Models

**Permission Schema**:
```dart
class Permission {
  final String name;                 // "corpora/abc/permissions/xyz"
  final GranteeType granteeType;     // USER | GROUP | EVERYONE
  final String? emailAddress;        // For USER/GROUP
  final Role role;                   // OWNER | WRITER | READER
}
```

**Role Hierarchy**:
- `OWNER` - Full control (read, write, delete, manage permissions)
- `WRITER` - Read and write
- `READER` - Read only

**Decision**: Implement as methods on parent resources.

---

## 7. Error Handling

### 7.1 Sealed Exception Hierarchy

```dart
sealed class GoogleAIException implements Exception {
  String get message;
  StackTrace? get stackTrace;
}

class ApiException extends GoogleAIException {
  final int code;
  final String message;
  final List<dynamic> details;
  final StackTrace? stackTrace;

  factory ApiException.fromStatus(Status status);
}

class RateLimitException extends ApiException {
  final DateTime? retryAfter;
}

class ValidationException extends GoogleAIException {
  final String message;
  final Map<String, List<String>> fieldErrors;
}

class TimeoutException extends GoogleAIException {
  final Duration timeout;
  final Duration elapsed;
}

class CanceledError extends GoogleAIException {
  final String correlationId;
}

class TransportError extends GoogleAIException {
  // DNS, socket, TLS errors
}

class DecodingError extends GoogleAIException {
  final String targetType;
  final String excerpt;
}
```

**Rationale**: Matches spec.md "Error Handling Architecture"

### 7.2 Status Schema (Google RPC)

```dart
class Status {
  final int code;                    // google.rpc.Code (int32)
  final String message;
  final List<Map<String, dynamic>>? details;
}
```

**Common Codes**:
- `400` - Invalid request
- `401` - Unauthenticated
- `403` - Permission denied
- `404` - Not found
- `429` - Rate limit exceeded
- `500` - Internal error
- `503` - Service unavailable

**  UNKNOWN**: Full list of error codes and their semantics

**Testing Plan**: Trigger various error scenarios and catalog responses.

---

## 8. Configuration & Context

### 8.1 Configuration Object

```dart
class GoogleAIConfig {
  final String baseUrl;
  final String? apiKey;
  final String? bearerToken;
  final AuthPlacement authPlacement;
  final Map<String, String> defaultHeaders;
  final Map<String, String> defaultQueryParams;
  final Duration timeout;
  final RetryPolicy retryPolicy;
  final LogLevel logLevel;
  final List<String> redactionList;

  // Immutable with copyWith
  GoogleAIConfig copyWith({...});
}
```

**Precedence**: Request-level > Endpoint-level > Global (last-write-wins)

### 8.2 Request Context

```dart
class RequestContext {
  final String method;
  final Uri url;
  final Map<String, String> redactedHeaders;
  final String correlationId;
  final DateTime timestamp;
  final int attemptNumber;
  final Duration timeout;
}
```

### 8.3 Response Context

```dart
class ResponseContext {
  final int statusCode;
  final Map<String, String> headers;
  final String bodyExcerpt;         // First 200 chars, redacted
  final Duration latency;
}
```

**Rationale**: Rich context for debugging, logging, and error reporting (spec.md requirement)

---

## 9. Testing Strategy

### 9.1 Unit Tests (~50 tests)

**Schema Serialization**:
- All 182 schemas round-trip JSON
- Polymorphic types (Part variants)
- Enum parsing with safe fallbacks
- Forward-compat (unknown fields preserved in `extra`)

**Interceptor Logic**:
- Auth injection (query param vs header)
- Retry with exponential backoff
- Logging with redaction
- Error mapping to exceptions

**Configuration Precedence**:
- Request overrides endpoint
- Endpoint overrides global
- Special handling for `X-Request-ID` (never overwrite)

### 9.2 Integration Tests (~20 tests)

**Gated by API key** (skip if not provided):

- `generateContent` returns valid response
- `streamGenerateContent` emits multiple chunks
- `embedContent` returns vector
- `countTokens` returns counts
- `listModels` returns paginated results
- File upload ’ processing ’ active ’ use in request
- Function calling flow (declare ’ call ’ respond)
- Cache creation ’ use ’ delete
- LRO: batch operation ’ poll ’ completion
- Rate limit handling (trigger 429, respect `Retry-After`)

### 9.3 Mock Tests (~15 tests)

**Error Scenarios**:
- 429 rate limit with `Retry-After` header
- 500 internal error with retry
- 503 service unavailable with backoff
- Network timeout
- Malformed JSON response

**Edge Cases**:
- Empty response
- Partial stream (connection dropped)
- Cancellation mid-stream
- Concurrent requests with shared interceptors

---

## 10. Unknowns & Testing Plan

### High Priority  

1. **Streaming Wire Format**
   - **Test**: Make live streaming request, inspect raw bytes
   - **Detect**: SSE (lines start with `data: `) vs NDJSON (raw JSON per line)
   - **Implement**: Support both, auto-detect

2. **File Upload Mechanism**
   - **Test**: Upload file, inspect request with network inspector
   - **Detect**: `multipart/form-data` vs JSON with base64
   - **Implement**: Helper method based on findings

3. **Rate Limiting**
   - **Test**: Send burst of requests to trigger 429
   - **Inspect**: Response headers for `X-RateLimit-*`, `Retry-After`
   - **Implement**: Retry logic respecting limits

4. **Authentication Preference**
   - **Test**: Try both query param and header methods
   - **Validate**: Both work, choose default
   - **Implement**: Support both, default to query param

### Medium Priority ¡

5. **Batch Size Limits**
   - **Test**: Send batches of 10, 50, 100, 500, 1000 requests
   - **Find**: Maximum accepted batch size
   - **Document**: In API reference

6. **Cache TTL Defaults**
   - **Test**: Create cache without explicit TTL
   - **Inspect**: Response `expirationTime` and `ttl`
   - **Document**: Default TTL value

7. **Model Capabilities**
   - **Test**: Query all models from `/v1beta/models`
   - **Catalog**: Which models support function calling, code execution, multimodal, etc.
   - **Document**: Capability matrix

### Low Priority =Ì

8. **Dynamic Endpoints**
   - **Research**: External docs or support forums
   - **Clarify**: Purpose of `/v1beta/dynamic/{dynamicId}:*`
   - **Defer**: Until clarified

9. **Error Code Catalog**
   - **Test**: Trigger various error scenarios
   - **Document**: Full list of status codes and meanings

10. **Generated Files**
    - **Test**: Use Veo endpoint to generate video
    - **Clarify**: Difference from uploaded files
    - **Document**: Usage patterns

---

## 11. Implementation Priorities

### Phase 1: Core Functionality (Week 1)

1. **HTTP Client & Interceptors**
   - Base client with interceptor chain
   - Auth, Retry, Logging, Error interceptors

2. **Core Schemas** (15 critical types)
   - `Content`, `Part` (sealed class)
   - `GenerateContentRequest`, `GenerateContentResponse`
   - `GenerationConfig`, `SafetySetting`
   - `Tool`, `FunctionDeclaration`

3. **Content Generation**
   - `generateContent()`
   - `streamGenerateContent()`

4. **Basic Error Handling**
   - Sealed exception hierarchy
   - Status parsing
   - Error mapping interceptor

### Phase 2: Extended Features (Week 2)

5. **Embeddings**
   - `embedContent()`
   - `batchEmbedContents()`

6. **Models & Token Counting**
   - `listModels()`, `getModel()`
   - `countTokens()`

7. **Streaming & LRO**
   - SSE/NDJSON parser
   - `LROPoller<T>` utility

8. **Pagination**
   - `PaginatedList<T>` wrapper
   - Stream-based `listAll<T>()` helper

### Phase 3: Advanced Features (Week 3)

9. **File Management**
   - `uploadFile()`, `deleteFile()`
   - File state polling

10. **Content Caching**
    - `createCache()`, `useCache()`, `deleteCache()`

11. **Tuned Models**
    - `createTunedModel()`, `listTunedModels()`
    - Generation with custom models

12. **Batch Operations**
    - `batchGenerateContent()`
    - `batchEmbedContents()`

### Phase 4: Optional (Future)

13. **Corpus/RAG Management** (defer unless prioritized)
14. **Permissions** (defer unless multi-user scenarios)
15. **Dynamic Endpoints** (defer until clarified)

---

## 12. Dependencies Summary

### Runtime Dependencies (Minimal)

```yaml
dependencies:
  http: ^1.2.0
  logging: ^1.2.0
```

**Total: 2 dependencies** 

### Dev Dependencies

```yaml
dev_dependencies:
  test: ^1.25.0
  mocktail: ^1.0.0  # For mock tests
  lints: ^3.0.0
```

### No Codegen Dependencies 

Manual serialization avoids:
- `build_runner`
- `json_serializable`
- `freezed`
- etc.

---

## 13. Open Questions for User

1. **Streaming format**: Once tested, should we support both SSE and NDJSON, or pick one?
2. **Default auth placement**: Query param or header?
3. **Retry defaults**: Max retries (3?), initial backoff (1s?), max backoff (60s?)?
4. **Timeout defaults**: Request timeout (120s?), LRO timeout (30min?)?
5. **Corpus/RAG priority**: Implement in Phase 1 or defer?
6. **Permission management priority**: Implement in Phase 1 or defer?

---

## 14. Success Criteria

**Phase 1 Complete** when:
-  Core generation works (sync + streaming)
-  Function calling works
-  Embeddings work
-  Error handling covers common cases
-  Tests: 30+ unit tests, 10+ integration tests

**Phase 2 Complete** when:
-  All 64 endpoints implemented
-  LRO polling works
-  Pagination works
-  File upload works
-  Tests: 50+ unit tests, 20+ integration tests

**Production Ready** when:
-  All unknowns resolved (streaming format, rate limits, etc.)
-  80%+ test coverage
-  Documentation complete (README, API docs, examples)
-  Analyzer clean (0 warnings)
-  Performance baseline established

---

## Appendix A: Quick Reference

### Base URL
```
https://generativelanguage.googleapis.com
```

### API Version
```
v1beta
```

### Authentication
```
Query param: ?key=YOUR_API_KEY
Header: X-Goog-Api-Key: YOUR_API_KEY
Bearer: Authorization: Bearer YOUR_ACCESS_TOKEN
```

### Critical Endpoints
```
POST /v1beta/models/{model}:generateContent
POST /v1beta/models/{model}:streamGenerateContent
POST /v1beta/models/{model}:embedContent
POST /v1beta/models/{model}:countTokens
GET  /v1beta/models
```

### Critical Schemas
- `Content`, `Part` (11 variants)
- `GenerateContentRequest`, `GenerateContentResponse`
- `GenerationConfig` (19 properties)
- `Tool`, `FunctionDeclaration`
- `SafetySetting`, `HarmCategory` (12 values)

---

**End of Research Document**