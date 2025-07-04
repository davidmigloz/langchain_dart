import 'dart:async';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

/// Stores information needed to recreate an HTTP request
class _RequestInfo {
  const _RequestInfo({
    required this.method,
    required this.url,
    required this.headers,
    this.body,
    this.fields,
    this.files,
  });

  final String method;
  final Uri url;
  final Map<String, String> headers;
  final String? body;
  final Map<String, String>? fields;
  final List<http.MultipartFile>? files;

  http.BaseRequest createRequest() {
    if (fields != null || files != null) {
      // Create multipart request
      final request = http.MultipartRequest(method, url);
      request.headers.addAll(headers);
      if (fields != null) {
        request.fields.addAll(fields!);
      }
      if (files != null) {
        request.files.addAll(files!);
      }
      return request;
    } else {
      // Create simple request
      final request = http.Request(method, url);
      request.headers.addAll(headers);
      if (body != null) {
        request.body = body!;
      }
      return request;
    }
  }

  static Future<_RequestInfo> fromRequest(http.BaseRequest request) async {
    if (request is http.Request) {
      return _RequestInfo(
        method: request.method,
        url: request.url,
        headers: Map.from(request.headers),
        body: request.body,
      );
    } else if (request is http.MultipartRequest) {
      return _RequestInfo(
        method: request.method,
        url: request.url,
        headers: Map.from(request.headers),
        fields: Map.from(request.fields),
        files: List.from(request.files),
      );
    } else if (request is http.StreamedRequest) {
      // For streamed requests, we need to read the body
      final bodyBytes = await request.finalize()
          .expand((bytes) => bytes)
          .toList();
      final bodyString = String.fromCharCodes(bodyBytes);
      return _RequestInfo(
        method: request.method,
        url: request.url,
        headers: Map.from(request.headers),
        body: bodyString,
      );
    } else {
      // For other request types, convert to simple request
      return _RequestInfo(
        method: request.method,
        url: request.url,
        headers: Map.from(request.headers),
      );
    }
  }
}

/// HTTP client wrapper that implements retry logic for rate limiting (429)
/// errors with exponential backoff and respect for Retry-After headers.
class RetryHttpClient extends http.BaseClient {
  /// Creates a new RetryHttpClient that wraps the provided HTTP client.
  RetryHttpClient({
    required this.inner,
    this.maxRetries = 3,
    this.baseDelay = const Duration(seconds: 1),
    this.maxDelay = const Duration(seconds: 60),
    this.jitter = true,
  });

  /// The underlying HTTP client to wrap.
  final http.Client inner;
  
  /// Maximum number of retry attempts for 429 errors.
  final int maxRetries;
  
  /// Base delay for exponential backoff.
  final Duration baseDelay;
  
  /// Maximum delay cap for retries.
  final Duration maxDelay;
  
  /// Whether to add jitter to prevent thundering herd.
  final bool jitter;
  final Random _random = Random();
  
  /// Logger for retry operations.
  static final Logger _logger = Logger('RetryHttpClient');

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // Store request info for retries
    final requestInfo = await _RequestInfo.fromRequest(request);
    
    var attempt = 0;
    
    while (attempt <= maxRetries) {
      // Create a fresh request for each attempt
      final currentRequest = requestInfo.createRequest();
      
      try {
        final response = await inner.send(currentRequest);
        
        // If not a rate limit error, return immediately
        if (response.statusCode != 429) {
          return response;
        }
        
        // If we've exhausted retries, return the 429 response
        if (attempt == maxRetries) {
          _logger.warning(
            'Rate limit retry exhausted after $maxRetries attempts for '
            '${requestInfo.method} ${requestInfo.url}',
          );
          return response;
        }
        
        // Calculate delay for retry
        final delay = _calculateDelay(attempt, response.headers);
        
        _logger.info(
          'Rate limited (429), retrying attempt ${attempt + 1}/$maxRetries after ${delay.inMilliseconds}ms for ${requestInfo.method} ${requestInfo.url}',
        );
        
        // Consume the response body before retrying
        await response.stream.drain();
        
        // Wait before retrying
        await Future.delayed(delay);
        
        attempt++;
        
      } catch (e) {
        // If we've exhausted retries, rethrow
        if (attempt == maxRetries) {
          _logger.warning(
            'HTTP error retry exhausted after $maxRetries attempts for '
            '${requestInfo.method} ${requestInfo.url}: $e',
          );
          rethrow;
        }
        
        // Wait before retrying on other errors
        final delay = _calculateDelay(attempt, {});
        
        _logger.info(
          'HTTP error, retrying attempt ${attempt + 1}/$maxRetries after ${delay.inMilliseconds}ms for ${requestInfo.method} ${requestInfo.url}: $e',
        );
        
        await Future.delayed(delay);
        attempt++;
      }
    }
    
    // This should never be reached, but just in case
    final finalRequest = requestInfo.createRequest();
    return inner.send(finalRequest);
  }

  Duration _calculateDelay(int attempt, Map<String, String> headers) {
    // Check for Retry-After header
    final retryAfter = headers['retry-after'] ?? headers['Retry-After'];
    if (retryAfter != null) {
      final seconds = int.tryParse(retryAfter);
      if (seconds != null && seconds > 0) {
        // Respect the server's retry-after directive, but cap it at maxDelay
        final serverDelay = Duration(seconds: seconds);
        final effectiveDelay = serverDelay > maxDelay ? maxDelay : serverDelay;
        
        _logger.fine(
          'Using server Retry-After header: ${seconds}s '
          '(capped at ${effectiveDelay.inSeconds}s)',
        );
        
        return effectiveDelay;
      }
    }
    
    // Exponential backoff: baseDelay * (2^attempt)
    var delay = Duration(
      milliseconds: baseDelay.inMilliseconds * (1 << attempt),
    );
    
    // Cap at maxDelay
    if (delay > maxDelay) {
      delay = maxDelay;
    }
    
    // Add jitter to prevent thundering herd
    if (jitter) {
      final jitterMs = _random.nextInt(delay.inMilliseconds ~/ 2);
      delay = Duration(milliseconds: delay.inMilliseconds + jitterMs);
    }
    
    return delay;
  }

  @override
  void close() {
    inner.close();
  }
}
