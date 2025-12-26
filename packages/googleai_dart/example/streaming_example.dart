// ignore_for_file: avoid_print
/// Demonstrates streaming content generation with real-time output.
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(
    config: const GoogleAIConfig(authProvider: ApiKeyProvider('YOUR_API_KEY')),
  );

  try {
    print('Starting streaming generation...\n');

    // Stream content generation - receives chunks as they're generated
    await for (final chunk in client.models.streamGenerateContent(
      model: 'gemini-3-flash-preview',
      request: const GenerateContentRequest(
        contents: [
          Content(
            parts: [
              TextPart('Write a short poem about artificial intelligence'),
            ],
            role: 'user',
          ),
        ],
      ),
    )) {
      // Process each chunk in real-time
      final candidate = chunk.candidates?.firstOrNull;
      if (candidate != null) {
        final content = candidate.content;
        if (content != null) {
          for (final part in content.parts) {
            if (part is TextPart) {
              // Print text as it arrives (without newline for streaming effect)
              print(part.text);
            }
          }
        }
      }
    }

    print('\n\nStreaming complete!');
  } catch (e) {
    print('Error during streaming: $e');
  } finally {
    client.close();
  }
}
