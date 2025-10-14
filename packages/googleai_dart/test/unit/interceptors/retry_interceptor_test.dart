import 'package:googleai_dart/src/client/config.dart';
import 'package:googleai_dart/src/errors/exceptions.dart';
import 'package:googleai_dart/src/interceptors/interceptor.dart';
import 'package:googleai_dart/src/interceptors/retry_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

import '../../mocks/mock_http_client.dart';

void main() {
  group('RetryInterceptor', () {
    group('Success Cases', () {
      test('passes through successful responses without retry', () async {
        const config = GoogleAIConfig(
          retryPolicy: RetryPolicy.defaultPolicy,
        );
        final interceptor = RetryInterceptor(config: config);

        var callCount = 0;
        Future<http.Response> mockNext(RequestContext context) async {
          callCount++;
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        final response = await interceptor.intercept(context, mockNext);

        expect(response.statusCode, equals(200));
        expect(callCount, equals(1)); // Should only be called once
      });
    });

    group('Retry on 5xx Errors', () {
      test('retries on 500 Internal Server Error', () async {
        const config = GoogleAIConfig(
          retryPolicy: RetryPolicy(
            maxRetries: 2,
            initialDelay: Duration(milliseconds: 10),
          ),
        );
        final interceptor = RetryInterceptor(config: config);

        var callCount = 0;
        Future<http.Response> mockNext(RequestContext context) async {
          callCount++;
          if (callCount < 2) {
            throw const ApiException(code: 500, message: 'Internal error');
          }
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        final response = await interceptor.intercept(context, mockNext);

        expect(response.statusCode, equals(200));
        expect(callCount, equals(2)); // Should retry once
      });

      test('retries on 503 Service Unavailable', () async {
        const config = GoogleAIConfig(
          retryPolicy: RetryPolicy(
            maxRetries: 3,
            initialDelay: Duration(milliseconds: 10),
          ),
        );
        final interceptor = RetryInterceptor(config: config);

        var callCount = 0;
        Future<http.Response> mockNext(RequestContext context) async {
          callCount++;
          if (callCount < 3) {
            throw const ApiException(code: 503, message: 'Service unavailable');
          }
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        final response = await interceptor.intercept(context, mockNext);

        expect(response.statusCode, equals(200));
        expect(callCount, equals(3)); // Should retry twice
      });

      test('throws after max retries exceeded', () async {
        const config = GoogleAIConfig(
          retryPolicy: RetryPolicy(
            maxRetries: 2,
            initialDelay: Duration(milliseconds: 10),
          ),
        );
        final interceptor = RetryInterceptor(config: config);

        var callCount = 0;
        Future<http.Response> mockNext(RequestContext context) {
          callCount++;
          throw const ApiException(code: 500, message: 'Persistent error');
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        try {
          await interceptor.intercept(context, mockNext);
          fail('Should have thrown ApiException');
        } catch (e) {
          expect(e, isA<ApiException>());
          expect(callCount, equals(3)); // Initial + 2 retries
        }
      });
    });

    group('No Retry on 4xx Errors', () {
      test('does not retry on 400 Bad Request', () {
        const config = GoogleAIConfig(
          retryPolicy: RetryPolicy.defaultPolicy,
        );
        final interceptor = RetryInterceptor(config: config);

        var callCount = 0;
        Future<http.Response> mockNext(RequestContext context) {
          callCount++;
          throw const ApiException(code: 400, message: 'Bad request');
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        expect(
          () => interceptor.intercept(context, mockNext),
          throwsA(isA<ApiException>()),
        );

        expect(callCount, equals(1)); // Should not retry
      });

      test('does not retry on 401 Unauthorized', () {
        const config = GoogleAIConfig(
          retryPolicy: RetryPolicy.defaultPolicy,
        );
        final interceptor = RetryInterceptor(config: config);

        var callCount = 0;
        Future<http.Response> mockNext(RequestContext context) {
          callCount++;
          throw const ApiException(code: 401, message: 'Unauthorized');
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        expect(
          () => interceptor.intercept(context, mockNext),
          throwsA(isA<ApiException>()),
        );

        expect(callCount, equals(1)); // Should not retry
      });

      test('does not retry on 404 Not Found', () {
        const config = GoogleAIConfig(
          retryPolicy: RetryPolicy.defaultPolicy,
        );
        final interceptor = RetryInterceptor(config: config);

        var callCount = 0;
        Future<http.Response> mockNext(RequestContext context) {
          callCount++;
          throw const ApiException(code: 404, message: 'Not found');
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        expect(
          () => interceptor.intercept(context, mockNext),
          throwsA(isA<ApiException>()),
        );

        expect(callCount, equals(1)); // Should not retry
      });
    });

    group('Rate Limit Handling', () {
      test('retries on 429 Rate Limit', () async {
        const config = GoogleAIConfig(
          retryPolicy: RetryPolicy(
            maxRetries: 2,
            initialDelay: Duration(milliseconds: 10),
          ),
        );
        final interceptor = RetryInterceptor(config: config);

        var callCount = 0;
        Future<http.Response> mockNext(RequestContext context) async {
          callCount++;
          if (callCount < 2) {
            throw const RateLimitException(
              code: 429,
              message: 'Rate limit exceeded',
            );
          }
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        final response = await interceptor.intercept(context, mockNext);

        expect(response.statusCode, equals(200));
        expect(callCount, equals(2)); // Should retry once
      });

      test('honors retryAfter from RateLimitException', () async {
        const config = GoogleAIConfig(
          retryPolicy: RetryPolicy(
            maxRetries: 2,
            initialDelay: Duration(milliseconds: 10),
          ),
        );
        final interceptor = RetryInterceptor(config: config);

        final retryAfter = DateTime.now().add(const Duration(milliseconds: 50));

        var callCount = 0;
        final stopwatch = Stopwatch()..start();

        Future<http.Response> mockNext(RequestContext context) async {
          callCount++;
          if (callCount < 2) {
            throw RateLimitException(
              code: 429,
              message: 'Rate limit exceeded',
              retryAfter: retryAfter,
            );
          }
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        final response = await interceptor.intercept(context, mockNext);

        stopwatch.stop();

        expect(response.statusCode, equals(200));
        expect(callCount, equals(2));
        // Should have waited at least the retryAfter delay
        expect(stopwatch.elapsedMilliseconds, greaterThanOrEqualTo(40));
      });

      test('throws after max retries on rate limit', () async {
        const config = GoogleAIConfig(
          retryPolicy: RetryPolicy(
            maxRetries: 2,
            initialDelay: Duration(milliseconds: 10),
          ),
        );
        final interceptor = RetryInterceptor(config: config);

        var callCount = 0;
        Future<http.Response> mockNext(RequestContext context) {
          callCount++;
          throw const RateLimitException(
            code: 429,
            message: 'Rate limit exceeded',
          );
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        try {
          await interceptor.intercept(context, mockNext);
          fail('Should have thrown RateLimitException');
        } catch (e) {
          expect(e, isA<RateLimitException>());
          expect(callCount, equals(3)); // Initial + 2 retries
        }
      });
    });

    group('Timeout Handling', () {
      test('retries on timeout', () async {
        const config = GoogleAIConfig(
          retryPolicy: RetryPolicy(
            maxRetries: 2,
            initialDelay: Duration(milliseconds: 10),
          ),
        );
        final interceptor = RetryInterceptor(config: config);

        var callCount = 0;
        Future<http.Response> mockNext(RequestContext context) async {
          callCount++;
          if (callCount < 2) {
            throw const TimeoutException(
              message: 'Request timeout',
              timeout: Duration(seconds: 30),
              elapsed: Duration(seconds: 30),
            );
          }
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        final response = await interceptor.intercept(context, mockNext);

        expect(response.statusCode, equals(200));
        expect(callCount, equals(2)); // Should retry once
      });
    });

    group('Exponential Backoff', () {
      test('applies exponential backoff between retries', () async {
        const config = GoogleAIConfig(
          retryPolicy: RetryPolicy(
            maxRetries: 3,
            initialDelay: Duration(milliseconds: 50),
            maxDelay: Duration(seconds: 10),
            jitter: 0.0, // Disable jitter for predictable testing
          ),
        );
        final interceptor = RetryInterceptor(config: config);

        final delays = <int>[];
        var callCount = 0;
        var lastCallTime = DateTime.now();

        Future<http.Response> mockNext(RequestContext context) async {
          callCount++;
          if (callCount > 1) {
            final now = DateTime.now();
            final delay = now.difference(lastCallTime).inMilliseconds;
            delays.add(delay);
            lastCallTime = now;
          } else {
            lastCallTime = DateTime.now();
          }

          if (callCount < 4) {
            throw const ApiException(code: 500, message: 'Error');
          }
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        expect(callCount, equals(4));
        expect(delays.length, equals(3));

        // Verify exponential backoff (50ms, 100ms, 200ms) with some tolerance
        expect(delays[0], greaterThanOrEqualTo(40)); // ~50ms
        expect(delays[1], greaterThanOrEqualTo(90)); // ~100ms
        expect(delays[2], greaterThanOrEqualTo(180)); // ~200ms
      });
    });

    group('Metadata Tracking', () {
      test('adds attempt counter to metadata', () async {
        const config = GoogleAIConfig(
          retryPolicy: RetryPolicy(
            maxRetries: 2,
            initialDelay: Duration(milliseconds: 10),
          ),
        );
        final interceptor = RetryInterceptor(config: config);

        final attempts = <int>[];
        var callCount = 0;

        Future<http.Response> mockNext(RequestContext context) async {
          callCount++;
          attempts.add(context.metadata['attemptNumber'] as int);

          if (callCount < 2) {
            throw const ApiException(code: 500, message: 'Error');
          }
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        expect(attempts, equals([0, 1])); // First attempt is 0, retry is 1
      });
    });
  });
}
