// ignore_for_file: avoid_print, avoid_dynamic_calls
/// Demonstrates URL Context tool for fetching and analyzing web content.
///
/// The URL Context tool enables the model to retrieve and process content
/// from specific URLs provided in the prompt.
///
/// Key features:
/// - Fetch and analyze content from up to 20 URLs per request
/// - Supports HTML, JSON, text, XML, CSS, JavaScript, CSV, RTF, images, PDFs
/// - Maximum 34MB content per URL
///
/// Limitations:
/// - Does NOT support: paywalled content, YouTube videos, Google Workspace
///   files, video/audio files
///
/// See: https://ai.google.dev/gemini-api/docs/url-context
library;

import 'dart:io' show stdout;

import 'package:googleai_dart/googleai_dart.dart';

Future<void> main() async {
  // Initialize client from environment variable (GOOGLE_GENAI_API_KEY)
  final client = GoogleAIClient.fromEnvironment();

  try {
    print('=== Example 1: URL Context with generateContent ===\n');
    await urlContextWithGenerateContent(client);

    print('\n=== Example 2: URL Context with Interactions API ===\n');
    await urlContextWithInteractions(client);

    print('\n=== Example 3: Comparing Multiple URLs ===\n');
    await compareMultipleUrls(client);
  } finally {
    client.close();
  }
}

/// URL Context using the generateContent API.
Future<void> urlContextWithGenerateContent(GoogleAIClient client) async {
  final response = await client.models.generateContent(
    model: 'gemini-3-flash-preview',
    request: GenerateContentRequest(
      contents: [
        Content.text(
          'Summarize the main points from this page: '
          'https://dart.dev/overview',
        ),
      ],
      // Enable URL Context with an empty map
      tools: const [Tool(urlContext: {})],
    ),
  );

  // Print response using the .text extension
  print('Response:');
  print(response.text);

  // Note: The API may return URL context metadata in the response
  // for tracking which URLs were successfully fetched
}

/// URL Context using the Interactions API (streaming).
Future<void> urlContextWithInteractions(GoogleAIClient client) async {
  print('Analyzing URL content (streaming):\n');

  await for (final event in client.interactions.createStream(
    model: 'gemini-3-flash-preview',
    input:
        'What are the key features mentioned on https://pub.dev/packages/googleai_dart ?',
    tools: const [UrlContextTool()],
  )) {
    switch (event) {
      case InteractionStartEvent():
        print('[Stream started]');
      case ContentStartEvent():
        final content = event.content;
        if (content != null) {
          print('[Content type: ${content.type}]');
        }
      case ContentDeltaEvent():
        final delta = event.delta;
        if (delta is TextDelta) {
          stdout.write(delta.text);
        } else if (delta is UrlContextCallDelta) {
          // Model is fetching a URL
          if (delta.urls != null && delta.urls!.isNotEmpty) {
            print('\n[Fetching URLs: ${delta.urls!.join(", ")}]');
          }
        } else if (delta is UrlContextResultDelta) {
          // URL content retrieved
          print('\n[URL content retrieved]');
        }
      case ContentStopEvent():
        print('\n[Content completed]');
      case InteractionCompleteEvent():
        print('[Stream completed]');
      default:
        break;
    }
  }
}

/// Compare content from multiple URLs.
Future<void> compareMultipleUrls(GoogleAIClient client) async {
  // You can reference up to 20 URLs in a single request
  final response = await client.models.generateContent(
    model: 'gemini-3-flash-preview',
    request: GenerateContentRequest(
      contents: [
        Content.text(
          'Compare the documentation styles of these two pages:\n'
          '1. https://dart.dev/language\n'
          '2. https://flutter.dev/development\n\n'
          'Which one is more beginner-friendly and why?',
        ),
      ],
      tools: const [Tool(urlContext: {})],
    ),
  );

  // Print comparison using the .text extension
  print('Comparison:');
  print(response.text);
}
