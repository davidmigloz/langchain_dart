# Implementation Plan - GoogleAI Dart Client

**Date**: 2025-09-30
**Last Updated**: 2025-10-13 (Phase 6 Complete - 100% API Coverage Achieved)
**Target**: Minimal-dependency, interceptor-driven API client following `spec.md`

## 🎯 Current Implementation Status

**Phase 6 Complete** - 100% API Coverage Achieved ✅

| Phase | Status | Features |
|-------|--------|----------|
| **Phase 1** | ✅ Complete | Foundation, interceptors, core models, basic generation |
| **Phase 2** | ✅ Complete | Streaming (SSE), function calling, embeddings, retry logic |
| **Phase 2.5** | ✅ Complete | Documentation (6 examples), Schema fixes, integration tests |
| **Phase 3** | ✅ Complete | Models, files, caching, LRO, pagination |
| **Phase 4** | ✅ Complete | Batch operations, Corpus/RAG (semantic search, metadata filters) |
| **Phase 4.5** | ✅ Complete | Fixed all review issues (exports, URL construction, test timeouts) |
| **Phase 5** | ✅ Complete | Permissions API, batch/corpus examples, production polish, CI/CD |
| **Phase 6** | ✅ Complete | 100% API coverage (listModelOperations, corpus permissions) |

**Implemented**: ~120 models, 96 client methods (91 Future + 5 Stream), 65 test files (595+ tests), 19 examples
**Coverage**: Content generation, streaming, embeddings, function calling, models, files, caching, LRO, pagination, batch operations, corpus/RAG, permissions, prediction, grounded Q&A
**API Coverage**: 78/80 endpoints (100% of non-deprecated operations)
**Compliance Score**: 100/100 (Perfect - All Issues Resolved)
**Public API**: ✅ Complete - All ~120 models exported and accessible

---

## Table of Contents

1. [Package Structure](#1-package-structure)
2. [Implementation Order](#2-implementation-order)
3. [File-by-File Breakdown](#3-file-by-file-breakdown)
4. [Testing Strategy](#4-testing-strategy)
5. [CI/CD Pipeline](#5-cicd-pipeline)
6. [Documentation Requirements](#6-documentation-requirements)

---

## 1. Package Structure

```
googleai_dart/
├── lib/
│   ├── src/
│   │   ├── client/                  # HTTP client & orchestration
│   │   │   ├── googleai_client.dart           # Main client facade
│   │   │   ├── config.dart                    # Configuration object
│   │   │   ├── request_builder.dart           # Request construction
│   │   │   ├── http_adapter.dart              # HTTP transport abstraction
│   │   │   └── interceptor_chain.dart         # Interceptor pipeline
│   │   ├── interceptors/            # Cross-cutting concerns
│   │   │   ├── interceptor.dart               # Base interceptor interface
│   │   │   ├── auth_interceptor.dart          # API key/OAuth injection
│   │   │   ├── retry_interceptor.dart         # Exponential backoff
│   │   │   ├── logging_interceptor.dart       # Request/response logging
│   │   │   └── error_interceptor.dart         # Error mapping
│   │   ├── models/                  # Data models (182 schemas)
│   │   │   ├── content/                       # Core content types
│   │   │   │   ├── content.dart
│   │   │   │   ├── part.dart                  # Sealed class with 11 variants
│   │   │   │   ├── blob.dart
│   │   │   │   ├── file_data.dart
│   │   │   │   ├── candidate.dart
│   │   │   │   ├── citation_metadata.dart
│   │   │   │   └── logprobs_result.dart
│   │   │   ├── generation/                    # Generation & config
│   │   │   │   ├── generate_content_request.dart
│   │   │   │   ├── generate_content_response.dart
│   │   │   │   ├── generation_config.dart
│   │   │   │   ├── prompt_feedback.dart
│   │   │   │   ├── count_tokens_request.dart
│   │   │   │   ├── count_tokens_response.dart
│   │   │   │   ├── schema.dart
│   │   │   │   └── speech_config.dart
│   │   │   ├── safety/                        # Safety & moderation
│   │   │   │   ├── safety_setting.dart
│   │   │   │   ├── harm_category.dart         # Enum (12 values)
│   │   │   │   ├── harm_block_threshold.dart  # Enum
│   │   │   │   └── safety_rating.dart
│   │   │   ├── tools/                         # Tools & function calling
│   │   │   │   ├── tool.dart
│   │   │   │   ├── function_declaration.dart
│   │   │   │   ├── function_call.dart
│   │   │   │   ├── function_response.dart
│   │   │   │   ├── code_execution.dart
│   │   │   │   ├── executable_code.dart
│   │   │   │   ├── code_execution_result.dart
│   │   │   │   ├── google_search.dart
│   │   │   │   └── google_search_retrieval.dart
│   │   │   ├── embeddings/                    # Embeddings
│   │   │   │   ├── embed_content_request.dart
│   │   │   │   ├── embed_content_response.dart
│   │   │   │   ├── content_embedding.dart
│   │   │   │   ├── batch_embed_contents_request.dart
│   │   │   │   ├── batch_embed_contents_response.dart
│   │   │   │   └── async_batch_embed_content_request.dart
│   │   │   ├── models/                        # Models & tuning
│   │   │   │   ├── model.dart
│   │   │   │   ├── list_models_response.dart
│   │   │   │   ├── tuned_model.dart
│   │   │   │   ├── tuning_task.dart
│   │   │   │   ├── tuning_snapshot.dart
│   │   │   │   ├── dataset.dart
│   │   │   │   ├── hyperparameters.dart
│   │   │   │   └── list_tuned_models_response.dart
│   │   │   ├── files/                         # File management
│   │   │   │   ├── file.dart
│   │   │   │   ├── file_state.dart            # Enum
│   │   │   │   ├── create_file_request.dart
│   │   │   │   ├── create_file_response.dart
│   │   │   │   ├── list_files_response.dart
│   │   │   │   └── video_metadata.dart
│   │   │   ├── caching/                       # Content caching
│   │   │   │   ├── cached_content.dart
│   │   │   │   ├── cached_content_usage_metadata.dart
│   │   │   │   ├── create_cached_content_request.dart
│   │   │   │   ├── update_cached_content_request.dart
│   │   │   │   └── list_cached_contents_response.dart
│   │   │   ├── corpus/                        # Corpus & RAG
│   │   │   │   ├── corpus.dart
│   │   │   │   ├── document.dart
│   │   │   │   ├── chunk.dart
│   │   │   │   ├── chunk_data.dart
│   │   │   │   ├── query_corpus_request.dart
│   │   │   │   ├── query_corpus_response.dart
│   │   │   │   ├── relevant_chunk.dart
│   │   │   │   ├── custom_metadata.dart
│   │   │   │   ├── metadata_filter.dart
│   │   │   │   ├── list_corpora_response.dart
│   │   │   │   ├── list_documents_response.dart
│   │   │   │   └── list_chunks_response.dart
│   │   │   ├── batch/                         # Batch operations
│   │   │   │   ├── generate_content_batch.dart
│   │   │   │   ├── batch_state.dart           # Enum
│   │   │   │   ├── batch_stats.dart
│   │   │   │   ├── inlined_requests.dart
│   │   │   │   ├── inlined_responses.dart
│   │   │   │   └── list_batches_response.dart
│   │   │   ├── operations/                    # Long-running operations
│   │   │   │   ├── operation.dart
│   │   │   │   ├── status.dart
│   │   │   │   ├── list_operations_response.dart
│   │   │   │   └── cancel_operation_request.dart
│   │   │   ├── permissions/                   # Permissions
│   │   │   │   ├── permission.dart
│   │   │   │   ├── grantee_type.dart          # Enum
│   │   │   │   ├── role.dart                  # Enum
│   │   │   │   └── list_permissions_response.dart
│   │   │   ├── metadata/                      # Metadata & usage
│   │   │   │   ├── usage_metadata.dart
│   │   │   │   ├── finish_reason.dart         # Enum
│   │   │   │   ├── block_reason.dart          # Enum
│   │   │   │   ├── task_type.dart             # Enum
│   │   │   │   ├── media_resolution.dart      # Enum
│   │   │   │   └── routing_config.dart
│   │   │   └── common/                        # Common types
│   │   │       ├── date_range.dart
│   │   │       ├── duration.dart
│   │   │       └── empty.dart
│   │   ├── errors/                  # Exception hierarchy
│   │   │   ├── googleai_exception.dart        # Base sealed class
│   │   │   ├── api_exception.dart             # HTTP/API errors
│   │   │   ├── rate_limit_exception.dart      # 429 errors
│   │   │   ├── validation_exception.dart      # Client validation
│   │   │   ├── timeout_exception.dart         # Timeouts
│   │   │   ├── canceled_error.dart            # User cancellation
│   │   │   ├── transport_error.dart           # Network errors
│   │   │   └── decoding_error.dart            # JSON parsing errors
│   │   ├── utils/                   # Utilities
│   │   │   ├── lro_poller.dart                # Long-running operation helper
│   │   │   ├── paginator.dart                 # Pagination helper
│   │   │   ├── streaming_parser.dart          # SSE/NDJSON parser
│   │   │   ├── redactor.dart                  # Sensitive data redaction
│   │   │   └── request_context.dart           # Request/response context
│   │   └── services/                # Service facades (optional)
│   │       ├── models_service.dart
│   │       ├── tuned_models_service.dart
│   │       ├── files_service.dart
│   │       ├── cache_service.dart
│   │       └── corpus_service.dart
│   └── googleai_dart.dart           # Public API exports
├── test/
│   ├── unit/                        # Unit tests
│   │   ├── models/                            # Schema serialization tests
│   │   ├── interceptors/                      # Interceptor logic tests
│   │   ├── utils/                             # Utility tests
│   │   └── errors/                            # Error mapping tests
│   ├── integration/                 # Integration tests (require API key)
│   │   ├── generation_test.dart
│   │   ├── streaming_test.dart
│   │   ├── embeddings_test.dart
│   │   ├── function_calling_test.dart
│   │   ├── file_management_test.dart
│   │   └── caching_test.dart
│   ├── mocks/                       # Mock tests
│   │   ├── mock_http_client.dart
│   │   ├── error_scenarios_test.dart
│   │   └── retry_logic_test.dart
│   └── fixtures/                    # Test data
│       └── sample_responses.json
├── example/                         # Examples
│   ├── generate_content.dart
│   ├── streaming.dart
│   ├── function_calling.dart
│   ├── embeddings.dart
│   ├── file_upload.dart
│   └── caching.dart
├── pubspec.yaml
├── README.md
├── CHANGELOG.md
└── LICENSE
```

**Total Files**: ~110 implementation files + ~50 test files = **~160 files**

---

## 2. Implementation Order

### Phase 1: Foundation (Week 1) 🏗️

**Goal**: Core infrastructure working with basic generation

#### Milestone 1.1: Project Setup (Day 1)

1. **Package initialization**
   - `pubspec.yaml` with dependencies (`http`, `logging`)
   - Directory structure
   - Analysis options (`analysis_options.yaml`)
   - `.gitignore`

2. **Core types** (5 files)
   - `lib/src/client/config.dart`
   - `lib/src/utils/request_context.dart`
   - `lib/src/errors/googleai_exception.dart` (sealed class)
   - `lib/src/errors/api_exception.dart`
   - `lib/src/errors/validation_exception.dart`

3. **Initial tests** (2 files)
   - `test/unit/errors/exception_test.dart`
   - `test/unit/config_test.dart`

#### Milestone 1.2: Interceptor Infrastructure (Day 2)

4. **Interceptor foundation** (5 files)
   - `lib/src/interceptors/interceptor.dart` (interface)
   - `lib/src/client/interceptor_chain.dart`
   - `lib/src/interceptors/auth_interceptor.dart`
   - `lib/src/interceptors/logging_interceptor.dart`
   - `lib/src/interceptors/error_interceptor.dart`

5. **Utilities** (2 files)
   - `lib/src/utils/redactor.dart`
   - `test/unit/utils/redactor_test.dart`

6. **Tests** (3 files)
   - `test/unit/interceptors/auth_interceptor_test.dart`
   - `test/unit/interceptors/logging_interceptor_test.dart`
   - `test/unit/interceptors/interceptor_chain_test.dart`

#### Milestone 1.3: Core Content Models (Day 3-4)

7. **Content models** (7 files)
   - `lib/src/models/content/content.dart`
   - `lib/src/models/content/part.dart` ⭐ (sealed class - 11 variants)
   - `lib/src/models/content/blob.dart`
   - `lib/src/models/content/file_data.dart`
   - `lib/src/models/content/candidate.dart`
   - `lib/src/models/content/citation_metadata.dart`
   - `lib/src/models/content/logprobs_result.dart`

8. **Generation models** (8 files)
   - `lib/src/models/generation/generate_content_request.dart`
   - `lib/src/models/generation/generate_content_response.dart`
   - `lib/src/models/generation/generation_config.dart`
   - `lib/src/models/generation/prompt_feedback.dart`
   - `lib/src/models/generation/count_tokens_request.dart`
   - `lib/src/models/generation/count_tokens_response.dart`
   - `lib/src/models/generation/schema.dart`
   - `lib/src/models/generation/speech_config.dart`

9. **Metadata models** (6 files)
   - `lib/src/models/metadata/usage_metadata.dart`
   - `lib/src/models/metadata/finish_reason.dart` (enum)
   - `lib/src/models/metadata/block_reason.dart` (enum)
   - `lib/src/models/metadata/task_type.dart` (enum)
   - `lib/src/models/metadata/media_resolution.dart` (enum)
   - `lib/src/models/metadata/routing_config.dart`

10. **Tests** (10 files)
    - `test/unit/models/content/content_test.dart`
    - `test/unit/models/content/part_test.dart` ⭐
    - `test/unit/models/content/blob_test.dart`
    - `test/unit/models/generation/generate_content_request_test.dart`
    - `test/unit/models/generation/generate_content_response_test.dart`
    - `test/unit/models/generation/generation_config_test.dart`
    - `test/unit/models/generation/schema_test.dart`
    - `test/unit/models/metadata/usage_metadata_test.dart`
    - `test/fixtures/sample_responses.json`
    - `test/unit/models/json_roundtrip_test.dart`

#### Milestone 1.4: HTTP Client & Basic Generation (Day 5-6)

11. **HTTP client** (3 files)
    - `lib/src/client/http_adapter.dart`
    - `lib/src/client/request_builder.dart`
    - `lib/src/client/googleai_client.dart` (main facade)

12. **Implement basic methods** (in `googleai_client.dart`)
    - `generateContent()`
    - `countTokens()`

13. **Tests** (4 files)
    - `test/unit/client/request_builder_test.dart`
    - `test/mocks/mock_http_client.dart`
    - `test/unit/client/googleai_client_test.dart`
    - `test/integration/generation_test.dart` ⭐ (gated by API key)

14. **Example** (1 file)
    - `example/generate_content.dart`

#### Milestone 1.5: Safety Models (Day 7)

15. **Safety models** (4 files)
    - `lib/src/models/safety/safety_setting.dart`
    - `lib/src/models/safety/harm_category.dart` (enum - 12 values)
    - `lib/src/models/safety/harm_block_threshold.dart` (enum)
    - `lib/src/models/safety/safety_rating.dart`

16. **Tests** (3 files)
    - `test/unit/models/safety/safety_setting_test.dart`
    - `test/unit/models/safety/harm_category_test.dart`
    - `test/unit/models/safety/safety_rating_test.dart`

**Phase 1 Deliverables**:

- ✅ Basic generation working (`generateContent()`)
- ✅ Token counting working
- ✅ Safety filters implemented
- ✅ Auth, Logging, Error interceptors working
- ✅ ~25 implementation files
- ✅ ~20 test files
- ✅ 1 example

---

### Phase 2: Streaming, Tools & Embeddings (Week 2) 🔄

#### Milestone 2.1: Streaming (Day 8-9)

17. **Streaming infrastructure** (3 files)
    - `lib/src/utils/streaming_parser.dart` (SSE + NDJSON)
    - `lib/src/client/streaming_client.dart`
    - Update `googleai_client.dart` with `streamGenerateContent()`

18. **Tests** (3 files)
    - `test/unit/utils/streaming_parser_test.dart`
    - `test/unit/client/streaming_client_test.dart`
    - `test/integration/streaming_test.dart` ⭐

19. **Example** (1 file)
    - `example/streaming.dart`

#### Milestone 2.2: Tools & Function Calling (Day 10-11)

20. **Tool models** (9 files)
    - `lib/src/models/tools/tool.dart`
    - `lib/src/models/tools/function_declaration.dart`
    - `lib/src/models/tools/function_call.dart`
    - `lib/src/models/tools/function_response.dart`
    - `lib/src/models/tools/code_execution.dart`
    - `lib/src/models/tools/executable_code.dart`
    - `lib/src/models/tools/code_execution_result.dart`
    - `lib/src/models/tools/google_search.dart`
    - `lib/src/models/tools/google_search_retrieval.dart`

21. **Tests** (5 files)
    - `test/unit/models/tools/function_declaration_test.dart`
    - `test/unit/models/tools/function_call_test.dart`
    - `test/unit/models/tools/function_response_test.dart`
    - `test/unit/models/tools/code_execution_test.dart`
    - `test/integration/function_calling_test.dart` ⭐

22. **Example** (1 file)
    - `example/function_calling.dart`

#### Milestone 2.3: Embeddings (Day 12-13)

23. **Embedding models** (6 files)
    - `lib/src/models/embeddings/embed_content_request.dart`
    - `lib/src/models/embeddings/embed_content_response.dart`
    - `lib/src/models/embeddings/content_embedding.dart`
    - `lib/src/models/embeddings/batch_embed_contents_request.dart`
    - `lib/src/models/embeddings/batch_embed_contents_response.dart`
    - `lib/src/models/embeddings/async_batch_embed_content_request.dart`

24. **Client methods** (in `googleai_client.dart`)
    - `embedContent()`
    - `batchEmbedContents()`

25. **Tests** (4 files)
    - `test/unit/models/embeddings/embed_content_request_test.dart`
    - `test/unit/models/embeddings/embed_content_response_test.dart`
    - `test/unit/models/embeddings/content_embedding_test.dart`
    - `test/integration/embeddings_test.dart` ⭐

26. **Example** (1 file)
    - `example/embeddings.dart`

#### Milestone 2.4: Retry & Error Handling (Day 14)

27. **Retry infrastructure** (3 files)
    - `lib/src/interceptors/retry_interceptor.dart` (exponential backoff + jitter)
    - `lib/src/errors/rate_limit_exception.dart`
    - `lib/src/errors/timeout_exception.dart`

28. **Tests** (3 files)
    - `test/unit/interceptors/retry_interceptor_test.dart`
    - `test/mocks/error_scenarios_test.dart`
    - `test/unit/errors/rate_limit_exception_test.dart`

**Phase 2 Deliverables**:

- ✅ Streaming working (SSE + NDJSON)
- ✅ Function calling working
- ✅ Embeddings working
- ✅ Retry logic with exponential backoff
- ✅ ~30 additional files
- ✅ ~20 additional tests
- ✅ 3 more examples

---

### Phase 3: Models, Files & Caching (Week 3) 📦

#### Milestone 3.1: Models & Tuned Models (Day 15-16)

29. **Model models** (8 files)
    - `lib/src/models/models/model.dart`
    - `lib/src/models/models/list_models_response.dart`
    - `lib/src/models/models/tuned_model.dart`
    - `lib/src/models/models/tuning_task.dart`
    - `lib/src/models/models/tuning_snapshot.dart`
    - `lib/src/models/models/dataset.dart`
    - `lib/src/models/models/hyperparameters.dart`
    - `lib/src/models/models/list_tuned_models_response.dart`

30. **Client methods** (in `googleai_client.dart`)
    - `listModels()`, `getModel()`
    - `createTunedModel()`, `listTunedModels()`, `getTunedModel()`
    - `updateTunedModel()`, `deleteTunedModel()`

31. **Pagination helper** (1 file)
    - `lib/src/utils/paginator.dart`

32. **Tests** (5 files)
    - `test/unit/models/models/model_test.dart`
    - `test/unit/models/models/tuned_model_test.dart`
    - `test/unit/models/models/tuning_task_test.dart`
    - `test/unit/utils/paginator_test.dart`
    - `test/integration/models_test.dart` ⭐

#### Milestone 3.2: File Management (Day 17-18)

33. **File models** (7 files)
    - `lib/src/models/files/file.dart`
    - `lib/src/models/files/file_state.dart` (enum)
    - `lib/src/models/files/create_file_request.dart`
    - `lib/src/models/files/create_file_response.dart`
    - `lib/src/models/files/list_files_response.dart`
    - `lib/src/models/files/video_metadata.dart`
    - `lib/src/models/operations/status.dart`

34. **Client methods** (in `googleai_client.dart`)
    - `uploadFile()`, `listFiles()`, `getFile()`
    - `downloadFile()`, `deleteFile()`

35. **Tests** (4 files)
    - `test/unit/models/files/file_test.dart`
    - `test/unit/models/files/file_state_test.dart`
    - `test/integration/file_management_test.dart` ⭐
    - `test/mocks/file_upload_test.dart`

36. **Example** (1 file)
    - `example/file_upload.dart`

#### Milestone 3.3: Content Caching (Day 19-20)

37. **Caching models** (5 files)
    - `lib/src/models/caching/cached_content.dart`
    - `lib/src/models/caching/cached_content_usage_metadata.dart`
    - `lib/src/models/caching/create_cached_content_request.dart`
    - `lib/src/models/caching/update_cached_content_request.dart`
    - `lib/src/models/caching/list_cached_contents_response.dart`

38. **Client methods** (in `googleai_client.dart`)
    - `createCachedContent()`, `listCachedContents()`, `getCachedContent()`
    - `updateCachedContent()`, `deleteCachedContent()`

39. **Tests** (3 files)
    - `test/unit/models/caching/cached_content_test.dart`
    - `test/integration/caching_test.dart` ⭐
    - `test/mocks/caching_test.dart`

40. **Example** (1 file)
    - `example/caching.dart`

#### Milestone 3.4: Long-Running Operations (Day 21)

41. **Operation models** (4 files)
    - `lib/src/models/operations/operation.dart`
    - `lib/src/models/operations/list_operations_response.dart`
    - `lib/src/models/operations/cancel_operation_request.dart`
    - Update `lib/src/models/operations/status.dart` (if needed)

42. **LRO helper** (1 file)
    - `lib/src/utils/lro_poller.dart` ⭐

43. **Client methods** (in `googleai_client.dart`)
    - `getOperation()`, `listOperations()`
    - `cancelOperation()`

44. **Tests** (3 files)
    - `test/unit/models/operations/operation_test.dart`
    - `test/unit/utils/lro_poller_test.dart`
    - `test/integration/lro_test.dart` ⭐

**Phase 3 Deliverables**:

- ✅ Model listing & discovery working
- ✅ Tuned model creation working (with LRO)
- ✅ File upload/download working
- ✅ Content caching working
- ✅ LRO polling infrastructure
- ✅ ~30 additional files
- ✅ ~15 additional tests
- ✅ 2 more examples

---

### Phase 4: Batch & Corpus (Optional) (Week 4) 🔬

#### Milestone 4.1: Batch Operations (Day 22-23) ✅ COMPLETE

45. **Batch models** (19 files) ✅
    - `lib/src/models/batch/generate_content_batch.dart`
    - `lib/src/models/batch/embed_content_batch.dart`
    - `lib/src/models/batch/batch_state.dart` (enum - 7 states)
    - `lib/src/models/batch/batch_stats.dart`
    - `lib/src/models/batch/embed_content_batch_stats.dart`
    - `lib/src/models/batch/status.dart`
    - `lib/src/models/batch/input_config.dart`
    - `lib/src/models/batch/input_embed_content_config.dart`
    - `lib/src/models/batch/inlined_request.dart`
    - `lib/src/models/batch/inlined_requests.dart`
    - `lib/src/models/batch/inlined_response.dart`
    - `lib/src/models/batch/inlined_responses.dart`
    - `lib/src/models/batch/inlined_embed_content_request.dart`
    - `lib/src/models/batch/inlined_embed_content_requests.dart`
    - `lib/src/models/batch/inlined_embed_content_response.dart`
    - `lib/src/models/batch/inlined_embed_content_responses.dart`
    - `lib/src/models/batch/generate_content_batch_output.dart`
    - `lib/src/models/batch/embed_content_batch_output.dart`
    - `lib/src/models/batch/list_batches_response.dart`

46. **Client methods** (8 methods in `googleai_client.dart`) ✅
    - `batchGenerateContent()` - Create batch for content generation
    - `listBatches()` - List all batches with pagination
    - `getBatch()` - Get single batch by name
    - `deleteBatch()` - Delete batch
    - `cancelBatch()` - Cancel running batch
    - `updateGenerateContentBatch()` - Update generation batch with field mask
    - `batchEmbedContents()` - Create batch for embeddings
    - `updateEmbedContentBatch()` - Update embeddings batch with field mask

47. **Tests** (8 unit test files, 62 tests) ✅
    - `test/unit/models/batch/batch_state_test.dart` (17 tests)
    - `test/unit/models/batch/batch_stats_test.dart` (9 tests)
    - `test/unit/models/batch/status_test.dart` (6 tests)
    - `test/unit/models/batch/list_batches_response_test.dart` (7 tests)
    - `test/unit/models/batch/generate_content_batch_test.dart` (11 tests)
    - `test/unit/models/batch/embed_content_batch_test.dart` (6 tests)
    - `test/unit/models/batch/inlined_request_test.dart` (5 tests)
    - `test/unit/models/batch/inlined_response_test.dart` (6 tests)
    - Integration test pending: `test/integration/batch_test.dart` ⭐
    - Example pending: `example/batch_example.dart`

#### Milestone 4.2: Corpus & RAG (Day 24-26)

48. **Corpus models** (12 files)
    - `lib/src/models/corpus/corpus.dart`
    - `lib/src/models/corpus/document.dart`
    - `lib/src/models/corpus/chunk.dart`
    - `lib/src/models/corpus/chunk_data.dart`
    - `lib/src/models/corpus/query_corpus_request.dart`
    - `lib/src/models/corpus/query_corpus_response.dart`
    - `lib/src/models/corpus/relevant_chunk.dart`
    - `lib/src/models/corpus/custom_metadata.dart`
    - `lib/src/models/corpus/metadata_filter.dart`
    - `lib/src/models/corpus/list_corpora_response.dart`
    - `lib/src/models/corpus/list_documents_response.dart`
    - `lib/src/models/corpus/list_chunks_response.dart`

49. **Client methods** (in `googleai_client.dart`)
    - Corpus: `createCorpus()`, `listCorpora()`, `getCorpus()`, `updateCorpus()`, `deleteCorpus()`, `queryCorpus()`
    - Document: `createDocument()`, `listDocuments()`, `getDocument()`, `updateDocument()`, `deleteDocument()`, `queryDocument()`
    - Chunk: `createChunk()`, `listChunks()`, `getChunk()`, `updateChunk()`, `deleteChunk()`, `batchCreateChunks()`, `batchUpdateChunks()`, `batchDeleteChunks()`

50. **Tests** (5 files)
    - `test/unit/models/corpus/corpus_test.dart`
    - `test/unit/models/corpus/document_test.dart`
    - `test/unit/models/corpus/chunk_test.dart`
    - `test/unit/models/corpus/query_corpus_request_test.dart`
    - `test/integration/corpus_test.dart` ⭐

#### Milestone 4.3: Permissions (Day 27) ✅ COMPLETE

51. **Permission models** (5 files) ✅
    - `lib/src/models/permissions/permission.dart`
    - `lib/src/models/permissions/grantee_type.dart` (enum)
    - `lib/src/models/permissions/permission_role.dart` (enum)
    - `lib/src/models/permissions/list_permissions_response.dart`
    - `lib/src/models/permissions/transfer_ownership_request.dart`

52. **Client methods** (6 methods in `googleai_client.dart`) ✅
    - `createPermission()`, `listPermissions()`, `getPermission()`
    - `updatePermission()`, `deletePermission()`, `transferOwnership()`

53. **Tests** (5 files, 30 tests) ✅
    - `test/unit/models/permissions/grantee_type_test.dart`
    - `test/unit/models/permissions/permission_role_test.dart`
    - `test/unit/models/permissions/permission_test.dart` (18 tests)
    - `test/unit/models/permissions/list_permissions_response_test.dart` (8 tests)
    - `test/integration/permissions_test.dart` ⭐
    - Example: `example/permissions_example.dart` (147 lines)

#### Milestone 4.4: Remaining Errors (Day 28)

54. **Error types** (3 files)
    - `lib/src/errors/canceled_error.dart`
    - `lib/src/errors/transport_error.dart`
    - `lib/src/errors/decoding_error.dart`

55. **Tests** (1 file)
    - `test/unit/errors/error_hierarchy_test.dart`

**Phase 4 Deliverables** - Complete ✅:

- ✅ Batch operations models complete (19 files)
- ✅ Batch operations methods complete (8 methods)
- ✅ Batch unit tests complete (8 files, 62 tests)
- ✅ Batch integration test complete
- ✅ Batch example complete (232 lines)
- ✅ Corpus/RAG management complete
- ✅ Permission management complete (5 models, 6 methods, 30 tests)
- ✅ Complete error hierarchy
- Total: +24 implementation files, +13 test files, +92 tests, +2 examples

---

### Phase 5: Polish & Documentation (Week 5) 📚 - COMPLETE ✅

#### Milestone 5.1: Public API & Exports (Day 29) ✅

56. **Public API** (1 file) ✅
    - `lib/googleai_dart.dart` - All 117 models exported and accessible
    - Missing batch model exports added (InlinedRequests, InlinedEmbedContentRequest, etc.)

#### Milestone 5.2: Documentation (Day 30-31) ✅

58. **README.md** ✅ - Comprehensive production-ready documentation:
    - ✅ Quick start examples
    - ✅ Installation instructions
    - ✅ Feature breakdown (Core Generation, Embeddings, Models & Files, Batch, Corpus/RAG, Permissions)
    - ✅ Usage examples for all major features
    - ✅ Examples section listing all 12 examples
    - ✅ API coverage section (48 endpoints)
    - ✅ Statistics (117 models, 52 methods, 550+ tests, 12 examples)
    - ✅ Contributing guidelines reference
    - ✅ License information

59. **API Reference** ✅ - Dartdoc comments throughout:
    - ✅ All public classes documented
    - ✅ All public methods documented
    - ✅ All public properties documented

60. **Additional docs** (2 files) ✅
    - ✅ `CONTRIBUTING.md` (295 lines) - Comprehensive development guidelines:
      - Development setup instructions
      - Architecture principles (manual serialization, immutability, type safety)
      - Code style guidelines
      - File organization
      - Adding new features (models, client methods, examples)
      - Testing strategy (unit, integration)
      - Pull request process & checklist
    - ✅ `CHANGELOG.md` - Present
    - ✅ `LICENSE` - Present
    - ✅ `analysis_options.yaml` - Present
    - ✅ `pubspec.yaml` - Present

#### Milestone 5.3: Testing & CI/CD (Day 32-33) ✅

61. **Testing** ✅:
    - ✅ 538+ tests across 47 test files
    - ✅ All tests passing
    - ✅ Unit tests for all models (serialization roundtrips)
    - ✅ Integration tests for all API categories (API-key-gated)

62. **CI/CD** (1 file) ✅
    - ✅ `.github/workflows/ci.yml` - Multi-job pipeline:
      - `analyze` job: dart format check + dart analyze
      - `test` job: Multi-OS (Ubuntu, macOS, Windows) + Multi-SDK (stable, beta) testing
      - `test-integration` job: Integration tests (gated by GEMINI_API_KEY)
      - `build-examples` job: Compile all examples
      - `check-pubspec` job: dart pub publish --dry-run
      - Coverage reporting to Codecov

#### Milestone 5.4: Final Review (Day 34-35) ✅

63. **Code quality** ✅:
    - ✅ `dart format .` - All code formatted
    - ✅ `dart analyze` - 0 warnings
    - ✅ `dart test` - All 538+ tests passing
    - ✅ All examples compile successfully

64. **Final checklist** ✅:
    - ✅ 48+ endpoints implemented (75% API coverage)
    - ✅ 117 models implemented
    - ✅ 52 client methods
    - ✅ 538+ tests across 47 test files
    - ✅ 0 analyzer warnings
    - ✅ README complete with comprehensive examples
    - ✅ 12 examples working (batch, corpus, permissions, caching, embeddings, files, etc.)
    - ✅ CHANGELOG present
    - ✅ CONTRIBUTING.md complete
    - ✅ CI/CD pipeline configured

**Phase 5 Deliverables** - Complete ✅:

- ✅ Public API finalized (117 models exported)
- ✅ Documentation complete (README, CONTRIBUTING)
- ✅ CI/CD pipeline working (multi-OS, multi-SDK, coverage)
- ✅ All tests passing (538+ tests)
- ✅ Production-ready, ready for pub.dev
- ✅ 0 analyzer warnings
- ✅ 12 comprehensive examples

---

### Phase 6: 100% API Coverage (Day 36) 🎉 - COMPLETE ✅

**Goal**: Implement remaining endpoints to achieve 100% coverage of non-deprecated API

#### Milestone 6.1: Final API Methods (Day 36) ✅

65. **Model Operations** (1 method) ✅:
    - ✅ `listModelOperations()` - List long-running operations for a model
      - GET /v1beta/{name}/operations
      - Supports pagination (pageSize, pageToken)
      - Supports filtering

66. **Corpus Permissions** (5 methods) ✅:
    - ✅ `createCorpusPermission()` - POST /v1beta/{parent}/permissions
    - ✅ `listCorpusPermissions()` - GET /v1beta/{parent}/permissions
    - ✅ `getCorpusPermission()` - GET /v1beta/{name}
    - ✅ `updateCorpusPermission()` - PATCH /v1beta/{name}
    - ✅ `deleteCorpusPermission()` - DELETE /v1beta/{name}

67. **Testing & Examples** ✅:
    - ✅ Integration test: `test/integration/complete_coverage_test.dart`
    - ✅ Example: `example/complete_api_example.dart` (19th example)
    - ✅ All 595+ tests passing across 65 test files

68. **Quality Verification** ✅:
    - ✅ `dart analyze --fatal-infos` - 0 warnings
    - ✅ `dart test` - All 595+ tests passing
    - ✅ `dart format .` - Code formatted
    - ✅ All 19 examples compile successfully

**Phase 6 Deliverables** - Complete ✅:

- ✅ **100% API Coverage** - 78/80 endpoints (all non-deprecated)
- ✅ 96 client methods (91 Future + 5 Stream)
- ✅ ~120 model files
- ✅ 65 test files with 595+ tests
- ✅ 19 comprehensive examples
- ✅ Complete integration test coverage
- ✅ 0 analyzer warnings
- ✅ Production-ready with full feature parity

---

## 3. File-by-File Breakdown

### Priority Files (Critical Path) ⭐

**Week 1 (Phase 1)**:

1. `lib/src/client/config.dart` - Configuration object
2. `lib/src/client/interceptor_chain.dart` - Interceptor pipeline
3. `lib/src/interceptors/auth_interceptor.dart` - Authentication
4. `lib/src/models/content/part.dart` ⭐⭐⭐ - Sealed class (most complex)
5. `lib/src/models/generation/generate_content_request.dart` - Primary request
6. `lib/src/models/generation/generate_content_response.dart` - Primary response
7. `lib/src/client/googleai_client.dart` - Main client facade

**Week 2 (Phase 2)**:

8. `lib/src/utils/streaming_parser.dart` - SSE/NDJSON parser
9. `lib/src/models/tools/function_declaration.dart` - Function calling
10. `lib/src/interceptors/retry_interceptor.dart` - Retry logic

**Week 3 (Phase 3)**:

11. `lib/src/utils/lro_poller.dart` - LRO infrastructure
12. `lib/src/utils/paginator.dart` - Pagination helper
13. `lib/src/models/files/file.dart` - File management

### Dependencies Between Files

```
config.dart
  ↓
auth_interceptor.dart
  ↓
interceptor_chain.dart
  ↓
googleai_client.dart
  ↓
streaming_parser.dart, lro_poller.dart, paginator.dart
```

```
part.dart (sealed class)
  ↓
content.dart
  ↓
generate_content_request.dart
  ↓
generate_content_response.dart
```

---

## 4. Testing Strategy

### 4.1 Unit Tests (~50 tests)

**Categories**:

1. **Schema Serialization** (20 tests)
   - Every schema: `fromJson()` → `toJson()` roundtrip
   - Polymorphic types (Part variants)
   - Enum parsing with fallbacks
   - Unknown field preservation

2. **Interceptor Logic** (10 tests)
   - Auth injection (query param vs header)
   - Retry with exponential backoff
   - Logging with redaction
   - Error mapping

3. **Configuration** (5 tests)
   - Precedence rules (request > endpoint > global)
   - `copyWith` semantics
   - Validation

4. **Utilities** (10 tests)
   - Streaming parser (SSE, NDJSON)
   - LRO poller
   - Paginator
   - Redactor

5. **Errors** (5 tests)
   - Exception hierarchy
   - Status parsing
   - Error contexts

**Run Command**:

```bash
dart test test/unit/
```

### 4.2 Integration Tests (~20 tests)

**Gated by API key** (skip if `GOOGLE_AI_API_KEY` not set):

1. **Generation** (5 tests)
   - `generateContent()` success
   - `streamGenerateContent()` chunks
   - Safety filters
   - System instruction
   - Response schema (structured output)

2. **Embeddings** (3 tests)
   - `embedContent()` single
   - `batchEmbedContents()` batch
   - Task type hints

3. **Function Calling** (4 tests)
   - Declare function
   - Model calls function
   - Send response
   - Continue generation

4. **Files** (3 tests)
   - Upload file
   - Wait for processing
   - Use in generation request

5. **Caching** (2 tests)
   - Create cache
   - Use cache in request

6. **Models** (2 tests)
   - List models
   - Get model metadata

7. **LRO** (1 test)
   - Batch operation with polling

**Run Command**:

```bash
export GOOGLE_AI_API_KEY=your_key
dart test test/integration/
```

### 4.3 Mock Tests (~15 tests)

**Error Scenarios**:

1. **Rate Limiting** (3 tests)
   - 429 error
   - `Retry-After` header
   - Exponential backoff

2. **Network Errors** (4 tests)
   - Timeout
   - Connection refused
   - DNS failure
   - TLS error

3. **Server Errors** (3 tests)
   - 500 internal error
   - 503 service unavailable
   - Malformed JSON response

4. **Edge Cases** (5 tests)
   - Empty response
   - Partial stream (connection dropped)
   - Cancellation mid-request
   - Concurrent requests
   - Invalid auth

**Run Command**:

```bash
dart test test/mocks/
```

### 4.4 Coverage Target

**Goal**: 80%+ coverage

**Check Coverage**:

```bash
dart run coverage:test_with_coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

**Exclude from coverage**:

- Generated code (none, since manual serialization)
- Example files
- Test fixtures

---

## 5. CI/CD Pipeline

### 5.1 GitHub Actions Workflow

**File**: `.github/workflows/ci.yml`

```yaml
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  analyze:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: dart-lang/setup-dart@v1
        with:
          sdk: stable
      - name: Install dependencies
        run: dart pub get
      - name: Format check
        run: dart format --output=none --set-exit-if-changed .
      - name: Analyze
        run: dart analyze --fatal-infos

  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: dart-lang/setup-dart@v1
        with:
          sdk: stable
      - name: Install dependencies
        run: dart pub get
      - name: Run unit tests
        run: dart test test/unit/
      - name: Run mock tests
        run: dart test test/mocks/
      - name: Run integration tests
        if: ${{ secrets.GOOGLE_AI_API_KEY }}
        env:
          GOOGLE_AI_API_KEY: ${{ secrets.GOOGLE_AI_API_KEY }}
        run: dart test test/integration/

  coverage:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: dart-lang/setup-dart@v1
        with:
          sdk: stable
      - name: Install dependencies
        run: dart pub get
      - name: Run tests with coverage
        run: |
          dart pub global activate coverage
          dart run coverage:test_with_coverage
      - name: Upload coverage
        uses: codecov/codecov-action@v3
        with:
          file: coverage/lcov.info
```

### 5.2 Publishing Workflow

**File**: `.github/workflows/publish.yml`

```yaml
name: Publish

on:
  push:
    tags:
      - 'v*.*.*'

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: dart-lang/setup-dart@v1
        with:
          sdk: stable
      - name: Install dependencies
        run: dart pub get
      - name: Run tests
        run: dart test
      - name: Publish to pub.dev
        env:
          PUB_CREDENTIALS: ${{ secrets.PUB_CREDENTIALS }}
        run: |
          mkdir -p ~/.pub-cache
          echo "$PUB_CREDENTIALS" > ~/.pub-cache/credentials.json
          dart pub publish --force
```

---

## 6. Documentation Requirements

### 6.1 README.md Structure

```markdown
# GoogleAI Dart

Official Dart client for the GoogleAI (Gemini) API.

## Features

- 🚀 All 64 API endpoints
- 🔄 Streaming support (SSE + NDJSON)
- 🛠️ Function calling
- 📊 Embeddings
- 🎯 Type-safe with sealed classes
- 🔐 Multiple auth methods (API key, OAuth)
- 📦 Minimal dependencies (http, logging)
- ✅ 80%+ test coverage

## Installation

```yaml
dependencies:
  googleai_dart: ^1.0.0
```

## Quick Start

### Basic Generation

```dart
import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(apiKey: 'YOUR_API_KEY');

  final response = await client.generateContent(
    model: 'models/gemini-pro',
    request: GenerateContentRequest(
      model: 'models/gemini-pro',
      contents: [
        Content(
          role: 'user',
          parts: [TextPart('What is the meaning of life?')],
        ),
      ],
    ),
  );

  print(response.candidates?.first.content.parts.first);
}
```

### Streaming

```dart
await for (final chunk in client.streamGenerateContent(
  model: 'models/gemini-pro',
  request: request,
)) {
  for (final part in chunk.candidates?.first.content.parts ?? []) {
    if (part is TextPart) {
      print(part.text); // Print as it arrives
    }
  }
}
```

### Function Calling

```dart
final tools = [
  Tool(
    functionDeclarations: [
      FunctionDeclaration(
        name: 'get_weather',
        description: 'Get current weather',
        parameters: Schema(
          type: SchemaType.object,
          properties: {
            'location': Schema(type: SchemaType.string),
          },
          required: ['location'],
        ),
      ),
    ],
  ),
];

final response = await client.generateContent(
  model: 'models/gemini-pro',
  request: GenerateContentRequest(
    model: 'models/gemini-pro',
    contents: [
      Content(
        role: 'user',
        parts: [TextPart('What is the weather in SF?')],
      ),
    ],
    tools: tools,
  ),
);

// Handle function call...
```

## Authentication

### API Key (Query Parameter)

```dart
final client = GoogleAIClient(
  apiKey: 'YOUR_API_KEY',
  authPlacement: AuthPlacement.queryParam, // default
);
```

### API Key (Header)

```dart
final client = GoogleAIClient(
  apiKey: 'YOUR_API_KEY',
  authPlacement: AuthPlacement.header,
);
```

### OAuth Bearer Token

```dart
final client = GoogleAIClient(
  bearerToken: 'YOUR_ACCESS_TOKEN',
);
```

## Configuration

```dart
final client = GoogleAIClient(
  apiKey: 'YOUR_API_KEY',
  config: GoogleAIConfig(
    baseUrl: 'https://generativelanguage.googleapis.com',
    timeout: Duration(minutes: 2),
    retryPolicy: RetryPolicy(
      maxRetries: 3,
      initialDelay: Duration(seconds: 1),
    ),
    logLevel: LogLevel.info,
  ),
);
```

## Documentation

- [API Reference](https://pub.dev/documentation/googleai_dart/latest/)
- [Examples](https://github.com/yourusername/googleai_dart/tree/main/example)
- [Changelog](https://github.com/yourusername/googleai_dart/blob/main/CHANGELOG.md)

## License

Apache 2.0
```

### 6.2 API Reference (Dartdoc)

**All public APIs must have**:

- Class/function description
- Parameter descriptions
- Return value description
- Example code (where helpful)
- Links to related APIs

**Example**:

```dart
/// Generates content using the specified model.
///
/// The [model] parameter specifies which model to use (e.g., "models/gemini-pro").
/// The [request] contains the conversation history, generation config, and tools.
///
/// Returns a [GenerateContentResponse] containing the model's response.
///
/// Throws [ApiException] if the request fails.
/// Throws [ValidationException] if the request is invalid.
///
/// Example:
/// ```dart
/// final response = await client.generateContent(
///   model: 'models/gemini-pro',
///   request: GenerateContentRequest(
///     model: 'models/gemini-pro',
///     contents: [
///       Content(
///         role: 'user',
///         parts: [TextPart('Hello!')],
///       ),
///     ],
///   ),
/// );
/// ```
///
/// See also:
/// - [streamGenerateContent] for streaming responses
/// - [countTokens] for pre-flight token estimation
Future<GenerateContentResponse> generateContent({
  required String model,
  required GenerateContentRequest request,
}) async { ... }
```

### 6.3 Examples

**Required examples** (6 files):

1. `example/generate_content.dart` - Basic generation
2. `example/streaming.dart` - Streaming
3. `example/function_calling.dart` - Function calling
4. `example/embeddings.dart` - Embeddings
5. `example/file_upload.dart` - File management
6. `example/caching.dart` - Content caching

**Each example must**:

- Be runnable (with instructions)
- Include error handling
- Show realistic use case
- Be well-commented

---

## Summary

This implementation plan provides:

- **Phased approach**: 5 weeks, 5 phases, 28 milestones
- **~110 implementation files**: Core (35), Models (60), Utils (10), Services (5)
- **~50 test files**: Unit (30), Integration (10), Mocks (10)
- **6 examples**: Generation, Streaming, Function Calling, Embeddings, Files, Caching
- **CI/CD pipeline**: Format, Analyze, Test, Coverage, Publish
- **80%+ test coverage**
- **0 analyzer warnings**
- **Complete documentation**

**Total estimated effort**: 35 days (~7 weeks calendar time with buffer)

**Critical path**:

1. Week 1: Foundation + Basic generation
2. Week 2: Streaming + Tools + Embeddings
3. Week 3: Models + Files + Caching + LRO
4. Week 4: Batch + Corpus (optional)
5. Week 5: Polish + Documentation

**Next steps**: Begin Phase 1, Milestone 1.1 (Project Setup) when approved.