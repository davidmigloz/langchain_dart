// ignore_for_file: avoid_print
/// Demonstrates request cancellation with abort triggers.
library;

import 'dart:async';

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(
    config: const GoogleAIConfig(authProvider: ApiKeyProvider('YOUR_API_KEY')),
  );

  try {
    // Create an abort controller
    final abortController = Completer<void>();

    print('Starting long-running request...');
    print('Will abort after 5 seconds\n');

    // Start a long-running request
    final requestFuture = client.models.generateContent(
      model: 'gemini-3-flash-preview',
      request: GenerateContentRequest(
        contents: [
          Content.text(
            'Write a very long and detailed essay about the '
            'history of computing, including early mechanical '
            'computers, the development of electronic computers, '
            'and modern computer architecture.',
          ),
        ],
      ),
      abortTrigger: abortController.future,
    );

    // Schedule cancellation after 5 seconds
    Timer(const Duration(seconds: 5), () {
      print('Triggering abort...\n');
      abortController.complete();
    });

    // Wait for the request (will throw AbortedException)
    final response = await requestFuture;

    // This code will not execute if aborted
    final text = response.text;
    if (text != null) {
      print('Response: $text');
    }
  } on AbortedException catch (e) {
    print('Request was successfully aborted!');
    print('Stage: ${e.stage}');
    print('Message: ${e.message}');
    print('Correlation ID: ${e.correlationId}');
  } catch (e) {
    print('Error: $e');
  } finally {
    client.close();
  }

  // Example 2: Abort a streaming request
  print('\n--- Streaming Abort Example ---\n');

  final streamingClient = GoogleAIClient(
    config: const GoogleAIConfig(authProvider: ApiKeyProvider('YOUR_API_KEY')),
  );

  try {
    final abortController = Completer<void>();

    print('Starting streaming request...');
    print('Will abort after 3 seconds\n');

    // Schedule abort
    Timer(const Duration(seconds: 3), () {
      print('\nTriggering abort...\n');
      abortController.complete();
    });

    // Start streaming
    await for (final chunk in streamingClient.models.streamGenerateContent(
      model: 'gemini-3-flash-preview',
      request: GenerateContentRequest(
        contents: [Content.text('Write a long story about space exploration')],
      ),
      abortTrigger: abortController.future,
    )) {
      final text = chunk.text;
      if (text != null) {
        print(text);
      }
    }
  } on AbortedException catch (e) {
    print('Streaming was successfully aborted!');
    print('Message: ${e.message}');
  } finally {
    streamingClient.close();
  }
}
