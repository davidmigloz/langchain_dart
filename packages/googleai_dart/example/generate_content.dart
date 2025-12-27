// ignore_for_file: avoid_print

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  // Initialize client from environment variable (GOOGLE_GENAI_API_KEY)
  final client = GoogleAIClient.fromEnvironment();

  try {
    // Create a simple text request using Content.text()
    final request = GenerateContentRequest(
      contents: [Content.text('Explain quantum computing in simple terms')],
    );

    // Generate content
    final response = await client.models.generateContent(
      model: 'gemini-3-flash-preview',
      request: request,
    );

    // Print the response using the .text extension
    print(response.text);

    // Print usage metadata
    if (response.usageMetadata != null) {
      print('\nTokens used: ${response.usageMetadata!.totalTokenCount}');
    }
  } finally {
    // Clean up
    client.close();
  }
}
