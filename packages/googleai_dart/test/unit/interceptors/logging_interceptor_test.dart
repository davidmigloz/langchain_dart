import 'package:googleai_dart/src/client/config.dart';
import 'package:googleai_dart/src/errors/exceptions.dart';
import 'package:googleai_dart/src/interceptors/interceptor.dart';
import 'package:googleai_dart/src/interceptors/logging_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:test/test.dart';

import '../../mocks/mock_http_client.dart';

void main() {
  group('LoggingInterceptor', () {
    late List<LogRecord> logRecords;

    setUp(() {
      logRecords = [];
      hierarchicalLoggingEnabled = true; // Enable hierarchical logging
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen(logRecords.add);
    });

    tearDown(Logger.root.clearListeners);

    group('Request ID Generation', () {
      test('generates request ID if not present', () async {
        const config = GoogleAIConfig();
        final interceptor = LoggingInterceptor(config: config);

        http.BaseRequest? capturedRequest;
        Future<http.Response> mockNext(RequestContext context) async {
          capturedRequest = context.request;
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        expect(capturedRequest, isNotNull);
        expect(capturedRequest!.headers.containsKey('X-Request-ID'), isTrue);
        expect(capturedRequest!.headers['X-Request-ID'], startsWith('req_'));
      });

      test('NEVER overwrites existing X-Request-ID header', () async {
        const config = GoogleAIConfig();
        final interceptor = LoggingInterceptor(config: config);

        http.BaseRequest? capturedRequest;
        Future<http.Response> mockNext(RequestContext context) async {
          capturedRequest = context.request;
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'))
          ..headers['X-Request-ID'] = 'user-provided-id';

        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        expect(capturedRequest, isNotNull);
        expect(
          capturedRequest!.headers['X-Request-ID'],
          equals('user-provided-id'), // MUST NOT be overwritten
        );
      });
    });

    group('Request Logging', () {
      test('logs request at INFO level', () async {
        const config = GoogleAIConfig(logLevel: Level.INFO);
        final interceptor = LoggingInterceptor(config: config);

        Future<http.Response> mockNext(RequestContext context) async {
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request(
          'POST',
          Uri.parse('https://example.com/api'),
        );
        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        final requestLogs = logRecords.where(
          (r) => r.message.contains('REQUEST') && r.level == Level.INFO,
        );
        expect(requestLogs, isNotEmpty);
        expect(requestLogs.first.message, contains('POST'));
        expect(requestLogs.first.message, contains('https://example.com/api'));
      });
    });

    group('Response Logging', () {
      test('logs response at INFO level with timing', () async {
        const config = GoogleAIConfig(logLevel: Level.INFO);
        final interceptor = LoggingInterceptor(config: config);

        Future<http.Response> mockNext(RequestContext context) async {
          // Add small delay to ensure timing is captured
          await Future<void>.delayed(const Duration(milliseconds: 10));
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        final responseLogs = logRecords.where(
          (r) => r.message.contains('RESPONSE') && r.level == Level.INFO,
        );
        expect(responseLogs, isNotEmpty);
        expect(responseLogs.first.message, contains('200'));
        expect(
          responseLogs.first.message,
          contains('ms'),
        ); // Should include timing
      });
    });

    group('Error Logging', () {
      test('logs errors at SEVERE level', () async {
        const config = GoogleAIConfig(logLevel: Level.INFO);
        final interceptor = LoggingInterceptor(config: config);

        Future<http.Response> mockNext(RequestContext context) {
          throw const ApiException(code: 500, message: 'Server error');
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        try {
          await interceptor.intercept(context, mockNext);
          fail('Should have thrown exception');
        } catch (e) {
          // Expected
        }

        final errorLogs = logRecords.where((r) => r.level == Level.SEVERE);
        expect(errorLogs, isNotEmpty);
        expect(errorLogs.first.message, contains('ERROR'));
        expect(
          errorLogs.first.message,
          contains('ms'),
        ); // Should include timing
      });

      test('logs AbortedException at WARNING level', () async {
        const config = GoogleAIConfig(logLevel: Level.INFO);
        final interceptor = LoggingInterceptor(config: config);

        Future<http.Response> mockNext(RequestContext context) {
          throw AbortedException(
            message: 'Request aborted',
            correlationId: 'test-id',
            timestamp: DateTime.now(),
            stage: AbortionStage.duringRequest,
          );
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        try {
          await interceptor.intercept(context, mockNext);
          fail('Should have thrown exception');
        } catch (e) {
          // Expected
        }

        final warningLogs = logRecords.where((r) => r.level == Level.WARNING);
        expect(warningLogs, isNotEmpty);
        expect(warningLogs.first.message, contains('ABORTED'));
        expect(warningLogs.first.message, contains('duringRequest'));
      });
    });

    group('Sensitive Data Redaction', () {
      test('redacts Authorization header', () async {
        const config = GoogleAIConfig(
          logLevel: Level.FINE, // Need FINE to see headers
        );
        final interceptor = LoggingInterceptor(config: config);

        Future<http.Response> mockNext(RequestContext context) async {
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'))
          ..headers['Authorization'] = 'Bearer secret-token';

        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        // Check that headers are logged but Authorization is redacted
        final fineLogs = logRecords.where((r) => r.level == Level.FINE);
        final headerLogs = fineLogs
            .where((r) => r.message.contains('Headers:'))
            .toList();
        expect(headerLogs, isNotEmpty);

        // Should not contain actual token
        expect(
          headerLogs.any((r) => r.message.contains('secret-token')),
          isFalse,
        );
        // Should contain redacted marker
        expect(headerLogs.any((r) => r.message.contains('REDACTED')), isTrue);
      });

      test('redacts api-key in headers', () async {
        const config = GoogleAIConfig(logLevel: Level.FINE);
        final interceptor = LoggingInterceptor(config: config);

        Future<http.Response> mockNext(RequestContext context) async {
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'))
          ..headers['X-Goog-Api-Key'] = 'secret-api-key';

        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        final fineLogs = logRecords.where((r) => r.level == Level.FINE);
        final headerLogs = fineLogs
            .where((r) => r.message.contains('Headers:'))
            .toList();

        // Should not contain actual API key
        expect(
          headerLogs.any((r) => r.message.contains('secret-api-key')),
          isFalse,
        );
        // Should contain redacted marker
        expect(headerLogs.any((r) => r.message.contains('REDACTED')), isTrue);
      });

      test('redacts response body with sensitive data', () async {
        const config = GoogleAIConfig(
          logLevel: Level.FINE, // Need FINE to see body
        );
        final interceptor = LoggingInterceptor(config: config);

        Future<http.Response> mockNext(RequestContext context) async {
          return http.Response(
            '{"token": "secret-value", "data": "normal"}',
            200,
          );
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        final fineLogs = logRecords.where((r) => r.level == Level.FINE);
        final bodyLogs = fineLogs
            .where((r) => r.message.contains('Body:'))
            .toList();

        expect(bodyLogs, isNotEmpty);
        // Should not contain actual token value
        expect(
          bodyLogs.any((r) => r.message.contains('secret-value')),
          isFalse,
        );
      });
    });

    group('Log Level Filtering', () {
      test('respects configured log level', () async {
        const config = GoogleAIConfig(
          logLevel: Level.WARNING, // Only WARNING and above
        );
        final interceptor = LoggingInterceptor(config: config);

        Future<http.Response> mockNext(RequestContext context) async {
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        // Should not log INFO level messages
        final infoLogs = logRecords.where((r) => r.level == Level.INFO);
        expect(infoLogs, isEmpty);
      });
    });

    group('Timing Measurement', () {
      test('measures and logs request duration', () async {
        const config = GoogleAIConfig(logLevel: Level.INFO);
        final interceptor = LoggingInterceptor(config: config);

        Future<http.Response> mockNext(RequestContext context) async {
          await Future<void>.delayed(const Duration(milliseconds: 50));
          return createSuccessResponse(body: {'result': 'ok'});
        }

        final request = http.Request('POST', Uri.parse('https://example.com'));
        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        final responseLogs = logRecords.where(
          (r) => r.message.contains('RESPONSE'),
        );
        expect(responseLogs, isNotEmpty);

        // Duration should be at least 50ms
        final durationMatch = RegExp(
          r'\((\d+)ms\)',
        ).firstMatch(responseLogs.first.message);
        expect(durationMatch, isNotNull);
        final duration = int.parse(durationMatch!.group(1)!);
        expect(duration, greaterThanOrEqualTo(50));
      });
    });
  });
}
