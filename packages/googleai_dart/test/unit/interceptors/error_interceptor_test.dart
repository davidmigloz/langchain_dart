import 'package:googleai_dart/src/errors/exceptions.dart';
import 'package:googleai_dart/src/interceptors/error_interceptor.dart';
import 'package:googleai_dart/src/interceptors/interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

import '../../mocks/mock_http_client.dart';

void main() {
  group('ErrorInterceptor', () {
    const interceptor = ErrorInterceptor();

    group('Success Cases', () {
      test('passes through 2xx responses unchanged', () async {
        Future<http.Response> mockNext(RequestContext context) async {
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        final response = await interceptor.intercept(context, mockNext);

        expect(response.statusCode, equals(200));
        expect(response.body, contains('result'));
      });
    });

    group('HTTP Error Mapping', () {
      test('maps 400 Bad Request to ApiException', () {
        Future<http.Response> mockNext(RequestContext context) async {
          return createErrorResponse(
            statusCode: 400,
            message: 'Invalid request parameters',
          );
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        expect(
          () => interceptor.intercept(context, mockNext),
          throwsA(
            isA<ApiException>()
                .having((e) => e.code, 'code', equals(400))
                .having(
                  (e) => e.message,
                  'message',
                  contains('Invalid request parameters'),
                ),
          ),
        );
      });

      test('maps 401 Unauthorized to ApiException', () {
        Future<http.Response> mockNext(RequestContext context) async {
          return createErrorResponse(
            statusCode: 401,
            message: 'Invalid authentication credentials',
          );
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        expect(
          () => interceptor.intercept(context, mockNext),
          throwsA(
            isA<ApiException>()
                .having((e) => e.code, 'code', equals(401))
                .having(
                  (e) => e.message,
                  'message',
                  contains('Invalid authentication'),
                ),
          ),
        );
      });

      test('maps 403 Forbidden to ApiException', () {
        Future<http.Response> mockNext(RequestContext context) async {
          return createErrorResponse(
            statusCode: 403,
            message: 'Permission denied',
          );
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        expect(
          () => interceptor.intercept(context, mockNext),
          throwsA(
            isA<ApiException>()
                .having((e) => e.code, 'code', equals(403))
                .having(
                  (e) => e.message,
                  'message',
                  contains('Permission denied'),
                ),
          ),
        );
      });

      test('maps 404 Not Found to ApiException', () {
        Future<http.Response> mockNext(RequestContext context) async {
          return createErrorResponse(
            statusCode: 404,
            message: 'Resource not found',
          );
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        expect(
          () => interceptor.intercept(context, mockNext),
          throwsA(
            isA<ApiException>()
                .having((e) => e.code, 'code', equals(404))
                .having(
                  (e) => e.message,
                  'message',
                  contains('Resource not found'),
                ),
          ),
        );
      });

      test('maps 500 Internal Server Error to ApiException', () {
        Future<http.Response> mockNext(RequestContext context) async {
          return createErrorResponse(
            statusCode: 500,
            message: 'Internal server error',
          );
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        expect(
          () => interceptor.intercept(context, mockNext),
          throwsA(
            isA<ApiException>()
                .having((e) => e.code, 'code', equals(500))
                .having(
                  (e) => e.message,
                  'message',
                  contains('Internal server error'),
                ),
          ),
        );
      });

      test('maps 503 Service Unavailable to ApiException', () {
        Future<http.Response> mockNext(RequestContext context) async {
          return createErrorResponse(
            statusCode: 503,
            message: 'Service temporarily unavailable',
          );
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        expect(
          () => interceptor.intercept(context, mockNext),
          throwsA(
            isA<ApiException>()
                .having((e) => e.code, 'code', equals(503))
                .having(
                  (e) => e.message,
                  'message',
                  contains('Service temporarily unavailable'),
                ),
          ),
        );
      });
    });

    group('Rate Limit (429) Handling', () {
      test('maps 429 to RateLimitException', () {
        Future<http.Response> mockNext(RequestContext context) async {
          return createRateLimitResponse(message: 'Too many requests');
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        expect(
          () => interceptor.intercept(context, mockNext),
          throwsA(
            isA<RateLimitException>()
                .having((e) => e.code, 'code', equals(429))
                .having(
                  (e) => e.message,
                  'message',
                  contains('Too many requests'),
                ),
          ),
        );
      });

      test('parses retry-after header (seconds)', () async {
        Future<http.Response> mockNext(RequestContext context) async {
          return createRateLimitResponse(
            message: 'Rate limit exceeded',
            retryAfterSeconds: 60,
          );
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        try {
          await interceptor.intercept(context, mockNext);
          fail('Should have thrown RateLimitException');
        } on RateLimitException catch (e) {
          expect(e.code, equals(429));
          expect(e.retryAfter, isNotNull);
          // retryAfter should be approximately 60 seconds from now
          final difference = e.retryAfter!.difference(DateTime.now());
          expect(difference.inSeconds, greaterThanOrEqualTo(59));
          expect(difference.inSeconds, lessThanOrEqualTo(61));
        }
      });

      test('handles missing retry-after header', () async {
        Future<http.Response> mockNext(RequestContext context) async {
          return createRateLimitResponse(message: 'Rate limit exceeded');
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        try {
          await interceptor.intercept(context, mockNext);
          fail('Should have thrown RateLimitException');
        } on RateLimitException catch (e) {
          expect(e.code, equals(429));
          expect(e.retryAfter, isNull);
        }
      });
    });

    group('Error Details Extraction', () {
      test('extracts error details from JSON response', () async {
        Future<http.Response> mockNext(RequestContext context) async {
          return http.Response(
            '''
{
              "error": {
                "message": "Validation failed",
                "code": 400,
                "details": [
                  {"field": "name", "issue": "required"},
                  {"field": "email", "issue": "invalid format"}
                ]
              }
            }''',
            400,
            headers: {'content-type': 'application/json'},
          );
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        try {
          await interceptor.intercept(context, mockNext);
          fail('Should have thrown ApiException');
        } on ApiException catch (e) {
          expect(e.code, equals(400));
          expect(e.message, equals('Validation failed'));
          expect(e.details, hasLength(2));
        }
      });

      test('handles non-JSON error response body', () async {
        Future<http.Response> mockNext(RequestContext context) async {
          return http.Response(
            'Plain text error message',
            500,
            headers: {'content-type': 'text/plain'},
          );
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        try {
          await interceptor.intercept(context, mockNext);
          fail('Should have thrown ApiException');
        } on ApiException catch (e) {
          expect(e.code, equals(500));
          expect(e.message, contains('Plain text error message'));
        }
      });

      test('handles malformed JSON error response', () {
        Future<http.Response> mockNext(RequestContext context) async {
          return http.Response(
            '{invalid json',
            500,
            headers: {'content-type': 'application/json'},
          );
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        expect(
          () => interceptor.intercept(context, mockNext),
          throwsA(
            isA<ApiException>().having((e) => e.code, 'code', equals(500)),
          ),
        );
      });

      test('truncates long error messages', () {
        final longMessage = 'x' * 500;
        Future<http.Response> mockNext(RequestContext context) async {
          return http.Response(
            longMessage,
            500,
            headers: {'content-type': 'text/plain'},
          );
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        expect(
          () => interceptor.intercept(context, mockNext),
          throwsA(
            isA<ApiException>()
                .having((e) => e.code, 'code', equals(500))
                .having(
                  (e) => e.message,
                  'message',
                  equals('HTTP 500 error'), // Should use generic message
                ),
          ),
        );
      });
    });

    group('Exception Preservation', () {
      test('re-throws GoogleAIException without wrapping', () async {
        const originalException = ApiException(
          code: 999,
          message: 'Custom error',
        );

        Future<http.Response> mockNext(RequestContext context) {
          throw originalException;
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        try {
          await interceptor.intercept(context, mockNext);
          fail('Should have thrown exception');
        } on ApiException catch (e) {
          expect(identical(e, originalException), isTrue);
        }
      });

      test('wraps unknown errors in ApiException', () {
        Future<http.Response> mockNext(RequestContext context) {
          throw Exception('Something went wrong');
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        expect(
          () => interceptor.intercept(context, mockNext),
          throwsA(
            isA<ApiException>().having((e) => e.code, 'code', equals(0)).having(
                  (e) => e.message,
                  'message',
                  contains('Unexpected error'),
                ),
          ),
        );
      });
    });
  });
}
