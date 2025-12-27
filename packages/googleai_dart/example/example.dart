// ignore_for_file: avoid_print

/// A simple example demonstrating basic usage of the googleai_dart package.
///
/// This example shows how to:
/// - Initialize the Google AI client from environment variable
/// - Generate content using the Gemini API with convenience methods
/// - Handle the response using extension methods
///
/// To run this example:
/// 1. Get an API key from https://ai.google.dev/gemini-api/docs/api-key
/// 2. Set the environment variable: export GOOGLE_GENAI_API_KEY=your_key
/// 3. Run: dart run example/example.dart
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  // Initialize the Google AI client from environment variable
  // Uses GOOGLE_GENAI_API_KEY by default
  final client = GoogleAIClient.fromEnvironment();

  try {
    // Generate content using Gemini with convenience Content.text()
    final response = await client.models.generateContent(
      model: 'gemini-3-flash-preview',
      request: GenerateContentRequest(
        contents: [Content.text('Explain quantum computing in simple terms')],
      ),
    );

    // Print the generated text using the .text extension
    print('Response: ${response.text}');

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
