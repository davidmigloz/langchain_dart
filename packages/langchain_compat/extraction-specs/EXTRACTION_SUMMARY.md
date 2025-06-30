# Extraction Summary: langchain_compat

## Project Goals

- **Single Import Compatibility:** Allow users to access all model, chat, embedding, and provider-specific code (OpenAI, GoogleAI, VertexAI, etc.) from a single package, without needing to import provider-specific packages directly.
- **Verbatim Copy:** All code must be copied verbatim from the original packages (except for import path and formatting changes). No refactoring is allowed.
- **Public API Only:** Only public APIs from model_dart packages should be used. No imports from `src/` directories of other packages.
- **Self-Contained:** The compat package should be self-contained, with all required types, constants, and utilities present.
- **Dart Compliance:** The package must be error-free according to `dart analyze`, except for expected warnings.

## Current Status (In Progress)

- **Migration Ongoing:** The migration of all chat model providers and dependencies into compat is still in progress. Not all providers are fully migrated or functional yet.
- **Ollama Providers:** Both a native Ollama provider (using ChatOllama and the /api endpoint) and an OpenAI-compatible Ollama provider (using OpenAIProvider and the /v1 endpoint) are present. Both default to the llama3.1 model. Both are available in Provider.all.
- **Analyzer Errors Remain:** The package currently has unresolved analyzer errors, mostly due to missing imports, incomplete type migration, or symbol visibility issues. Work is ongoing to resolve these.
- **Verbatim Copying:** All relevant Dart files are being copied directly from their original sources in the upstream LangChain Dart packages. Only import paths and formatting are changed as needed to point to compat barrels or local compat files.
- **Barrel Files:** Compat barrels are being created and updated to re-export necessary types and APIs, enabling a single-import experience for users.
- **No Refactoring:** No code is being refactored or altered beyond import path and formatting changes and compat-layer scaffolding. All logic, constants, and default options remain as in the originals.
- **Public API Enforcement:** All imports are being updated to use only public API and barrel files. No code imports from `src/` directories of other packages.
- **File Mapping:** A comprehensive mapping of all compat files to their original sources is maintained in `FILE_SOURCE_MAP.md` for traceability and is kept up to date as files are migrated.
- **Compat Stream Options:** ChatOpenAIOptions now uses a `streamOptions` field (type: ChatCompletionStreamOptions?), defaulting to null. This replaces the previous includeUsage field. Some providers (e.g., Cohere) forcibly set streamOptions to null for compatibility, as their endpoints do not support the stream_options field at all. This is a compat-layer extension to ensure correct behavior across OpenAI-compatible providers.

## Work Left To Do

- **Fix Analyzer Errors:** Continue resolving all errors reported by `dart analyze` by copying missing types, constants, and updating imports until the package is error-free.
- **Complete Provider Migrations:** Ensure all chat model providers (OpenAI, Anthropic, Mistral, Gemini, etc.) and their dependencies are fully migrated and functional in compat.
- **Test and Clean Up:** Run all tests, ensure all files are documented in `FILE_SOURCE_MAP.md`, and remove any lingering references to langchain_core or other upstream packages.
- **Final Review:** Once error-free, do a final pass to ensure all code follows user style rules and is ready for production use.

## Status After Extraction (Planned)

- **Self-Contained:** The `langchain_compat` package will be self-contained and will not require users to import provider-specific packages directly.
- **Verbatim/Compat-Only:** All files will be either verbatim copies of their originals (except for import path and formatting changes) or necessary compat-layer scaffolding/barrel files.
- **Dart Analyze:** The package will be error-free according to `dart analyze`, except for expected warnings.
- **Clean Codebase:** All scaffolding and non-original TODOs will be removed. The codebase will be clean and ready for use.
- **Traceability:** Every file in the compat package can be traced back to its original source or is documented as compat-only.

---

**This file documents the extraction process and the current state of the langchain_compat package for future maintainers and users.** 