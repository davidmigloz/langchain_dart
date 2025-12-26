// ignore_for_file: avoid_print
/// Demonstrates comprehensive error handling.
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(
    config: const GoogleAIConfig(authProvider: ApiKeyProvider('YOUR_API_KEY')),
  );

  try {
    // Make a request that might fail
    final response = await client.models.generateContent(
      model: 'gemini-3-flash-preview',
      request: const GenerateContentRequest(
        contents: [
          Content(parts: [TextPart('Hello!')], role: 'user'),
        ],
      ),
    );

    // Process successful response
    final candidate = response.candidates?.firstOrNull;
    if (candidate != null) {
      final content = candidate.content;
      if (content != null) {
        for (final part in content.parts) {
          if (part is TextPart) {
            print('Response: ${part.text}');
          }
        }
      }
    }
  } on RateLimitException catch (e) {
    // Handle rate limiting errors
    print('Rate limited!');
    print('Error: ${e.message}');
    if (e.retryAfter != null) {
      print('Retry after: ${e.retryAfter} seconds');
    }
    if (e.requestMetadata != null) {
      print('Request ID: ${e.requestMetadata!.correlationId}');
    }
  } on ApiException catch (e) {
    // Handle API errors (400, 401, 403, 404, etc.)
    print('API error ${e.code}: ${e.message}');

    // Access error details
    if (e.requestMetadata != null) {
      print('Request ID: ${e.requestMetadata!.correlationId}');
      print('Timestamp: ${e.requestMetadata!.timestamp}');
    }

    print('Error details: ${e.details}');

    // Handle specific error codes
    switch (e.code) {
      case 401:
        print('Authentication failed - check your API key');
      case 403:
        print('Permission denied - check your API access');
      case 404:
        print('Model not found - check the model name');
      case 400:
        print('Bad request - check your request parameters');
    }
  } on TimeoutException catch (e) {
    // Handle timeout errors
    print('Request timed out!');
    print('Timeout duration: ${e.timeout}');
    print('Elapsed time: ${e.elapsed}');
    // TimeoutException doesn't have correlation tracking
  } on AbortedException catch (e) {
    // Handle aborted requests
    print('Request was aborted!');
    print('Abort stage: ${e.stage}');
    print('Message: ${e.message}');
    print('Correlation ID: ${e.correlationId}');
  } on GoogleAIException catch (e) {
    // Catch-all for any other GoogleAI exceptions
    print('GoogleAI error: ${e.message}');
    // Only ApiException subclasses have requestMetadata
    if (e is ApiException && e.requestMetadata != null) {
      print('Request ID: ${e.requestMetadata!.correlationId}');
    }
  } catch (e) {
    // Catch any unexpected errors
    print('Unexpected error: $e');
  } finally {
    // Always close the client
    client.close();
  }
}
