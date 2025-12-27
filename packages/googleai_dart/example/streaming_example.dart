// ignore_for_file: avoid_print
/// Demonstrates streaming content generation with real-time output.
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  // Initialize client from environment variable (GOOGLE_GENAI_API_KEY)
  final client = GoogleAIClient.fromEnvironment();

  try {
    print('Starting streaming generation...\n');

    // Stream content generation - receives chunks as they're generated
    await for (final chunk in client.models.streamGenerateContent(
      model: 'gemini-3-flash-preview',
      request: GenerateContentRequest(
        contents: [
          Content.text('Write a short poem about artificial intelligence'),
        ],
      ),
    )) {
      // Process each chunk using the .text extension
      final text = chunk.text;
      if (text != null) {
        // Print text as it arrives
        print(text);
      }
    }

    print('\n\nStreaming complete!');
  } catch (e) {
    print('Error during streaming: $e');
  } finally {
    client.close();
  }
}
