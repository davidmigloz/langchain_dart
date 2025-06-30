# File Source Map for langchain_compat

This file maps each Dart file in the langchain_compat package to its original source file from the upstream LangChain Dart projects, or notes if it is a compat-only/barrel file.

---

## Top-level (`lib/`)

| Compat File           | Original Source / Purpose           |
| --------------------- | ----------------------------------- |
| langchain_compat.dart | Compat-only: public API barrel file |
| utils.dart            | Compat-only: public API barrel file |
| documents.dart        | Compat-only: public API barrel file |
| chat_models.dart      | Compat-only: public API barrel file |
| llms.dart             | Compat-only: public API barrel file |
| language_models.dart  | Compat-only: public API barrel file |
| embeddings.dart       | Compat-only: public API barrel file |
| tools.dart            | Compat-only: public API barrel file |

---

## src/utils/

| Compat File                   | Original Source File                                         |
| ----------------------------- | ------------------------------------------------------------ |
| types.dart                    | langchain_core/lib/src/utils/chunk.dart (and others)         |
| reduce.dart                   | langchain_core/lib/src/utils/reduce.dart                     |
| chunk.dart                    | langchain_core/lib/src/utils/chunk.dart                      |
| utils.dart                    | langchain_core/lib/src/utils/utils.dart                      |
| retry_client.dart             | langchain_core/lib/src/utils/retry_client.dart               |
| similarity.dart               | langchain_core/lib/src/utils/similarity.dart                 |
| https_client/http_client.dart | langchain_google/lib/src/utils/https_client/http_client.dart |

---

## src/documents/

| Compat File      | Original Source File                              |
| ---------------- | ------------------------------------------------- |
| types.dart       | langchain_core/lib/src/documents/document.dart    |
| transformer.dart | langchain_core/lib/src/documents/transformer.dart |
| document.dart    | langchain_core/lib/src/documents/document.dart    |
| documents.dart   | Compat-only: barrel file                          |

---

## src/embeddings/

| Compat File     | Original Source File                            |
| --------------- | ----------------------------------------------- |
| openai.dart     | langchain_openai/lib/src/embeddings/openai.dart |
| embeddings.dart | Compat-only: barrel file                        |
| vertex_ai/      | langchain_google/lib/src/embeddings/vertex_ai/  |
| google_ai/      | langchain_google/lib/src/embeddings/google_ai/  |
| fake.dart       | langchain_core/lib/src/embeddings/fake.dart     |
| base.dart       | langchain_core/lib/src/embeddings/base.dart     |

### src/chat_models/

| Compat File      | Original Source File                                                      |
| ---------------- | ------------------------------------------------------------------------- |
| mappers.dart     | langchain_openai/lib/src/chat_models/mappers.dart                         |
| types.dart       | langchain_core/lib/src/chat_models/types.dart (verbatim, formatting only) |
| chat_openai.dart | langchain_openai/lib/src/chat_models/chat_openai.dart                     |
| fake.dart        | langchain_core/lib/src/chat_models/fake.dart                              |
| vertex_ai/       | langchain_google/lib/src/chat_models/vertex_ai/                           |
| google_ai/       | langchain_google/lib/src/chat_models/google_ai/                           |
| chat_models.dart | Compat-only: barrel file                                                  |
| utils.dart       | langchain_core/lib/src/chat_models/utils.dart                             |
| base.dart        | langchain_core/lib/src/chat_models/base.dart                              |
| anthropic/       | See below                                                                 |

### src/chat_models/anthropic/

| Compat File         | Original Source File                                        |
| ------------------- | ----------------------------------------------------------- |
| chat_anthropic.dart | langchain_anthropic/lib/src/chat_models/chat_anthropic.dart |
| mappers.dart        | langchain_anthropic/lib/src/chat_models/mappers.dart        |
| types.dart          | langchain_anthropic/lib/src/chat_models/types.dart          |
| chat_models.dart    | langchain_anthropic/lib/src/chat_models/chat_models.dart    |

### src/chat_models/mistralai/
| Compat File         | Original Source File                                        |
| ------------------- | ----------------------------------------------------------- |
| chat_mistralai.dart | langchain_mistralai/lib/src/chat_models/chat_mistralai.dart |
| mappers.dart        | langchain_mistralai/lib/src/chat_models/mappers.dart        |
| types.dart          | langchain_mistralai/lib/src/chat_models/types.dart          |
| chat_models.dart    | langchain_mistralai/lib/src/chat_models/chat_models.dart    |

### src/chat_models/openai/
| Compat File      | Original Source File                                                                                                                    |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| mappers.dart     | langchain_openai/lib/src/chat_models/mappers.dart                                                                                       |
| chat_openai.dart | langchain_openai/lib/src/chat_models/chat_openai.dart                                                                                   |
| types.dart       | langchain_openai/lib/src/chat_models/types.dart (verbatim, formatting only, compat extension: includeUsage replaced with streamOptions) |

### src/chat_models/chat_ollama/
| Compat File      | Original Source File                                                                                 |
| ---------------- | ---------------------------------------------------------------------------------------------------- |
| chat_ollama.dart | langchain_ollama/lib/src/chat_models/chat_ollama/chat_ollama.dart (import paths and formatting only) |
| types.dart       | langchain_ollama/lib/src/chat_models/chat_ollama/types.dart (import paths and formatting only)       |
| mappers.dart     | langchain_ollama/lib/src/chat_models/chat_ollama/mappers.dart (import paths and formatting only)     |

---

## src/anthropic_sdk_dart/

| Compat File             | Original Source File / Purpose                                                  |
| ----------------------- | ------------------------------------------------------------------------------- |
| anthropic_sdk_dart.dart | Now sourced from anthropic_sdk_dart package dependency; not copied into compat. |

---

## src/llms/

| Compat File  | Original Source File                       |
| ------------ | ------------------------------------------ |
| mappers.dart | langchain_openai/lib/src/llms/mappers.dart |
| types.dart   | langchain_core/lib/src/llms/types.dart     |
| openai.dart  | langchain_openai/lib/src/llms/openai.dart  |
| llms.dart    | Compat-only: barrel file                   |
| vertex_ai/   | langchain_google/lib/src/llms/vertex_ai/   |
| fake.dart    | langchain_core/lib/src/llms/fake.dart      |
| base.dart    | langchain_core/lib/src/llms/base.dart      |

---

## src/tools/

| Compat File | Original Source File                     |
| ----------- | ---------------------------------------- |
| types.dart  | langchain_core/lib/src/tools/types.dart  |
| string.dart | langchain_core/lib/src/tools/string.dart |
| fake.dart   | langchain_core/lib/src/tools/fake.dart   |
| base.dart   | langchain_core/lib/src/tools/base.dart   |
| tools.dart  | Compat-only: barrel file                 |

---

## src/runnables/, src/prompts/, src/langchain/, src/exceptions/, etc.

- These follow the same pattern: each file is either a verbatim copy from the corresponding file in langchain_core or a compat-only barrel/scaffolding file.

---

### src/embeddings/mistralai/
| Compat File               | Original Source File                                             |
| ------------------------- | ---------------------------------------------------------------- |
| mistralai_embeddings.dart | langchain_mistralai/lib/src/embeddings/mistralai_embeddings.dart |
| embeddings.dart           | langchain_mistralai/lib/src/embeddings/embeddings.dart           |

**How to interpret this file:**
- If a file is marked "Compat-only: barrel file," it is a new file for the compat layer and not a verbatim copy.
- All other files are direct, verbatim (except for import path changes and formatting) copies from the original source listed. 

| types.dart   | langchain_core/lib/src/language_models/types.dart (verbatim, formatting only)     |
| base.dart   | langchain_core/lib/src/tools/base.dart (verbatim, formatting only)   |
| types.dart  | langchain_core/lib/src/tools/types.dart (verbatim, formatting only)  |
| providers.dart          | Compat-only: public API barrel file (compat logic: Cohere forcibly sets streamOptions: null in ChatOpenAIOptions). Includes both a native Ollama provider (OllamaProvider, using ChatOllama and /api endpoint, defaultModel: gemma3n) and an OpenAI-compatible Ollama provider (OpenAIProvider, using /v1 endpoint, defaultModel: gemma3n). | 