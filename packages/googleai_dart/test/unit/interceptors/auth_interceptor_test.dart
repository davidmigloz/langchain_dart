import 'package:googleai_dart/src/auth/auth_provider.dart';
import 'package:googleai_dart/src/client/config.dart';
import 'package:googleai_dart/src/interceptors/auth_interceptor.dart';
import 'package:googleai_dart/src/interceptors/interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

void main() {
  group('AuthInterceptor', () {
    group('API Key - Query Parameter (default)', () {
      test('adds API key as query parameter', () async {
        const config = GoogleAIConfig(
          authProvider: ApiKeyProvider('test-api-key'),
        );

        const interceptor = AuthInterceptor(config: config);

        http.BaseRequest? capturedRequest;
        Future<http.Response> mockNext(RequestContext context) async {
          capturedRequest = context.request;
          return http.Response('{}', 200);
        }

        final request =
            http.Request('POST', Uri.parse('https://example.com/api'));
        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        expect(capturedRequest, isNotNull);
        expect(
          capturedRequest!.url.queryParameters['key'],
          equals('test-api-key'),
        );
      });

      test('does not overwrite existing key query parameter', () async {
        const config = GoogleAIConfig(
          authProvider: ApiKeyProvider('new-api-key'),
        );

        const interceptor = AuthInterceptor(config: config);

        http.BaseRequest? capturedRequest;
        Future<http.Response> mockNext(RequestContext context) async {
          capturedRequest = context.request;
          return http.Response('{}', 200);
        }

        final request = http.Request(
          'POST',
          Uri.parse('https://example.com/api?key=existing-key'),
        );
        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        expect(capturedRequest, isNotNull);
        expect(
          capturedRequest!.url.queryParameters['key'],
          equals('existing-key'), // Should not be overwritten
        );
      });

      test('preserves existing query parameters', () async {
        const config = GoogleAIConfig(
          authProvider: ApiKeyProvider('test-api-key'),
        );

        const interceptor = AuthInterceptor(config: config);

        http.BaseRequest? capturedRequest;
        Future<http.Response> mockNext(RequestContext context) async {
          capturedRequest = context.request;
          return http.Response('{}', 200);
        }

        final request = http.Request(
          'POST',
          Uri.parse('https://example.com/api?foo=bar&baz=qux'),
        );
        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        expect(capturedRequest, isNotNull);
        expect(capturedRequest!.url.queryParameters['foo'], equals('bar'));
        expect(capturedRequest!.url.queryParameters['baz'], equals('qux'));
        expect(
          capturedRequest!.url.queryParameters['key'],
          equals('test-api-key'),
        );
      });
    });

    group('API Key - Header', () {
      test('adds API key as X-Goog-Api-Key header', () async {
        const config = GoogleAIConfig(
          authProvider:
              ApiKeyProvider('test-api-key', placement: AuthPlacement.header),
        );

        const interceptor = AuthInterceptor(config: config);

        http.BaseRequest? capturedRequest;
        Future<http.Response> mockNext(RequestContext context) async {
          capturedRequest = context.request;
          return http.Response('{}', 200);
        }

        final request =
            http.Request('POST', Uri.parse('https://example.com/api'));
        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        expect(capturedRequest, isNotNull);
        expect(
          capturedRequest!.headers['X-Goog-Api-Key'],
          equals('test-api-key'),
        );
      });

      test('does not overwrite existing X-Goog-Api-Key header', () async {
        const config = GoogleAIConfig(
          authProvider:
              ApiKeyProvider('new-api-key', placement: AuthPlacement.header),
        );

        const interceptor = AuthInterceptor(config: config);

        http.BaseRequest? capturedRequest;
        Future<http.Response> mockNext(RequestContext context) async {
          capturedRequest = context.request;
          return http.Response('{}', 200);
        }

        final request =
            http.Request('POST', Uri.parse('https://example.com/api'))
              ..headers['X-Goog-Api-Key'] = 'existing-key';

        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        expect(capturedRequest, isNotNull);
        expect(
          capturedRequest!.headers['X-Goog-Api-Key'],
          equals('existing-key'), // Should not be overwritten
        );
      });

      test('preserves existing headers', () async {
        const config = GoogleAIConfig(
          authProvider:
              ApiKeyProvider('test-api-key', placement: AuthPlacement.header),
        );

        const interceptor = AuthInterceptor(config: config);

        http.BaseRequest? capturedRequest;
        Future<http.Response> mockNext(RequestContext context) async {
          capturedRequest = context.request;
          return http.Response('{}', 200);
        }

        final request =
            http.Request('POST', Uri.parse('https://example.com/api'))
              ..headers['Content-Type'] = 'application/json'
              ..headers['X-Custom'] = 'value';

        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        expect(capturedRequest, isNotNull);
        // Content-Type may have charset added by http package
        expect(
          capturedRequest!.headers['Content-Type'],
          contains('application/json'),
        );
        expect(capturedRequest!.headers['X-Custom'], equals('value'));
        expect(
          capturedRequest!.headers['X-Goog-Api-Key'],
          equals('test-api-key'),
        );
      });
    });

    group('Bearer Token', () {
      test('adds Bearer token as Authorization header', () async {
        const config = GoogleAIConfig(
          authProvider: BearerTokenProvider('test-bearer-token'),
        );

        const interceptor = AuthInterceptor(config: config);

        http.BaseRequest? capturedRequest;
        Future<http.Response> mockNext(RequestContext context) async {
          capturedRequest = context.request;
          return http.Response('{}', 200);
        }

        final request =
            http.Request('POST', Uri.parse('https://example.com/api'));
        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        expect(capturedRequest, isNotNull);
        expect(
          capturedRequest!.headers['Authorization'],
          equals('Bearer test-bearer-token'),
        );
      });

      test('does not overwrite existing Authorization header', () async {
        const config = GoogleAIConfig(
          authProvider: BearerTokenProvider('new-bearer-token'),
        );

        const interceptor = AuthInterceptor(config: config);

        http.BaseRequest? capturedRequest;
        Future<http.Response> mockNext(RequestContext context) async {
          capturedRequest = context.request;
          return http.Response('{}', 200);
        }

        final request =
            http.Request('POST', Uri.parse('https://example.com/api'))
              ..headers['Authorization'] = 'Bearer existing-token';

        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        expect(capturedRequest, isNotNull);
        expect(
          capturedRequest!.headers['Authorization'],
          equals('Bearer existing-token'), // Should not be overwritten
        );
      });

      test('bearer token provider returns bearer token', () async {
        const config = GoogleAIConfig(
          authProvider: BearerTokenProvider('test-bearer-token'),
        );

        const interceptor = AuthInterceptor(config: config);

        http.BaseRequest? capturedRequest;
        Future<http.Response> mockNext(RequestContext context) async {
          capturedRequest = context.request;
          return http.Response('{}', 200);
        }

        final request =
            http.Request('POST', Uri.parse('https://example.com/api'));
        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        expect(capturedRequest, isNotNull);
        expect(
          capturedRequest!.headers['Authorization'],
          equals('Bearer test-bearer-token'),
        );
      });
    });

    group('No Auth', () {
      test('passes through request unchanged when no auth configured',
          () async {
        const config = GoogleAIConfig(); // No apiKey or bearerToken

        const interceptor = AuthInterceptor(config: config);

        http.BaseRequest? capturedRequest;
        Future<http.Response> mockNext(RequestContext context) async {
          capturedRequest = context.request;
          return http.Response('{}', 200);
        }

        final request =
            http.Request('POST', Uri.parse('https://example.com/api'));
        final context = RequestContext(request: request, metadata: {});

        await interceptor.intercept(context, mockNext);

        expect(capturedRequest, isNotNull);
        expect(capturedRequest!.headers.containsKey('Authorization'), isFalse);
        expect(capturedRequest!.headers.containsKey('X-Goog-Api-Key'), isFalse);
        expect(
          capturedRequest!.url.queryParameters.containsKey('key'),
          isFalse,
        );
      });
    });
  });
}
