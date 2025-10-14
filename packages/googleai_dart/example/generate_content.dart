// ignore_for_file: avoid_print

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  // Initialize the client with your API key
  final client = GoogleAIClient(
    config: const GoogleAIConfig(
      authProvider:
          ApiKeyProvider('YOUR_API_KEY'), // Replace with your actual API key
    ),
  );

  try {
    // Create a simple text request
    const request = GenerateContentRequest(
      contents: [
        Content(
          parts: [
            TextPart('Explain quantum computing in simple terms'),
          ],
          role: 'user',
        ),
      ],
    );

    // Generate content
    final response = await client.models.generateContent(
      model: 'gemini-2.5-flash',
      request: request,
    );

    // Print the response
    if (response.candidates != null && response.candidates!.isNotEmpty) {
      final candidate = response.candidates!.first;
      if (candidate.content != null) {
        for (final part in candidate.content!.parts) {
          if (part is TextPart) {
            print(part.text);
          }
        }
      }
    }

    // Print usage metadata
    if (response.usageMetadata != null) {
      print('\nTokens used: ${response.usageMetadata!.totalTokenCount}');
    }
  } finally {
    // Clean up
    client.close();
  }
}
