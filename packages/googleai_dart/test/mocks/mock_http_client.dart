import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

/// Mock HTTP client for testing.
class MockHttpClient extends Mock implements http.Client {}

/// Mock HTTP request for testing.
class MockHttpRequest extends Mock implements http.Request {}

/// Mock HTTP response for testing.
class MockHttpResponse extends Mock implements http.Response {}

/// Mock HTTP streamed response for testing.
class MockStreamedResponse extends Mock implements http.StreamedResponse {}

/// Helper to create a successful response.
http.Response createSuccessResponse({
  required Map<String, dynamic> body,
  int statusCode = 200,
  Map<String, String>? headers,
}) {
  return http.Response(
    jsonEncode(body),
    statusCode,
    headers: headers ?? {'content-type': 'application/json'},
  );
}

/// Helper to create an error response.
http.Response createErrorResponse({
  required int statusCode,
  required String message,
  Map<String, String>? headers,
}) {
  return http.Response(
    jsonEncode({
      'error': {'message': message, 'code': statusCode},
    }),
    statusCode,
    headers: headers ?? {'content-type': 'application/json'},
  );
}

/// Helper to create a rate limit response.
http.Response createRateLimitResponse({
  String message = 'Rate limit exceeded',
  int? retryAfterSeconds,
}) {
  final headers = <String, String>{'content-type': 'application/json'};
  if (retryAfterSeconds != null) {
    headers['retry-after'] = retryAfterSeconds.toString();
  }

  return http.Response(
    jsonEncode({
      'error': {'message': message, 'code': 429},
    }),
    429,
    headers: headers,
  );
}

/// Helper to create a streamed response for testing.
http.StreamedResponse createStreamedResponse({
  required String body,
  int statusCode = 200,
  Map<String, String>? headers,
}) {
  final stream = Stream.value(utf8.encode(body));
  return http.StreamedResponse(
    stream,
    statusCode,
    headers: headers ?? {'content-type': 'text/event-stream'},
  );
}

/// Helper to create an SSE streamed response.
http.StreamedResponse createSSEStreamedResponse({
  required List<Map<String, dynamic>> events,
  int statusCode = 200,
}) {
  final sseData = events.map((event) {
    return 'data: ${jsonEncode(event)}\n\n';
  }).join();

  return createStreamedResponse(
    body: sseData,
    statusCode: statusCode,
    headers: {'content-type': 'text/event-stream'},
  );
}
