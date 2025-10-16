// ignore_for_file: avoid_print

/// A simple example demonstrating basic usage of the googleai_dart package.
///
/// This example shows how to:
/// - Initialize the Google AI client with an API key
/// - Generate content using the Gemini API
/// - Handle the response and print results
///
/// To run this example:
/// 1. Get an API key from https://ai.google.dev/gemini-api/docs/api-key
/// 2. Replace 'YOUR_API_KEY' with your actual key
/// 3. Run: dart run example/example.dart
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  // Initialize the Google AI client
  final client = GoogleAIClient(
    config: const GoogleAIConfig(
      authProvider: ApiKeyProvider('YOUR_API_KEY'),
    ),
  );

  try {
    // Generate content using Gemini
    final response = await client.models.generateContent(
      model: 'gemini-2.5-flash',
      request: const GenerateContentRequest(
        contents: [
          Content(
            parts: [TextPart('Explain quantum computing in simple terms')],
            role: 'user',
          ),
        ],
      ),
    );

    // Print the generated text
    for (final part in response.candidates?.firstOrNull?.content?.parts ?? []) {
      if (part is TextPart) {
        print('Response: ${part.text}');
      }
    }

    // Print token usage
    if (response.usageMetadata != null) {
      print('\nTokens used: ${response.usageMetadata!.totalTokenCount}');
    }
  } catch (e) {
    print('Error: $e');
  } finally {
    // Clean up resources
    client.close();
  }
}
