/// Dart client for the OpenAI API. Supports completions (GPT-3.5 Turbo), chat (GPT-4o, etc.), embeddings (Embedding v3), images (DALL·E 3), assistants v2 (threads, runs, vector stores, etc.) batch, fine-tuning, etc.
library;

export 'src/client.dart';
export 'src/extensions.dart';
export 'src/generated/client.dart' show OpenAIClientException;
export 'src/generated/schema/schema.dart';
