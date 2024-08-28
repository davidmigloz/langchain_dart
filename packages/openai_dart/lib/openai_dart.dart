/// Dart client for the OpenAI API. Supports chat (GPT-4o, etc.), completions, embeddings, images (DALL·E 3), assistants (threads, runs, vector stores, etc.), batch, fine-tuning, etc.
library;

export 'src/client.dart';
export 'src/extensions.dart';
export 'src/generated/client.dart' show OpenAIClientException;
export 'src/generated/schema/schema.dart';
