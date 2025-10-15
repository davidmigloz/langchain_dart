import 'package:googleai_dart/src/client/config.dart';
import 'package:googleai_dart/src/client/request_builder.dart';
import 'package:test/test.dart';

void main() {
  group('RequestBuilder - Configuration Precedence', () {
    group('Header Precedence (Global < Additional < Request)', () {
      test('global headers are included by default', () {
        const config = GoogleAIConfig(
          defaultHeaders: {
            'X-Global': 'global-value',
            'X-Default': 'default-value',
          },
        );
        const builder = RequestBuilder(config: config);

        final headers = builder.buildHeaders();

        expect(headers['X-Global'], equals('global-value'));
        expect(headers['X-Default'], equals('default-value'));
      });

      test('additional headers override global headers (last-write-wins)', () {
        const config = GoogleAIConfig(
          defaultHeaders: {
            'X-Global': 'global-value',
            'Content-Type': 'text/plain',
          },
        );
        const builder = RequestBuilder(config: config);

        final headers = builder.buildHeaders(
          additionalHeaders: {
            'X-Global': 'overridden-value', // Should override
            'Content-Type': 'application/json', // Should override
            'X-Additional': 'additional-value',
          },
        );

        expect(headers['X-Global'], equals('overridden-value')); // Overridden
        expect(
          headers['Content-Type'],
          equals('application/json'),
        ); // Overridden
        expect(headers['X-Additional'], equals('additional-value')); // New
      });

      test('preserves headers not in conflict', () {
        const config = GoogleAIConfig(
          defaultHeaders: {
            'X-Global-1': 'value1',
            'X-Global-2': 'value2',
          },
        );
        const builder = RequestBuilder(config: config);

        final headers = builder.buildHeaders(
          additionalHeaders: {
            'X-Additional-1': 'value3',
            'X-Additional-2': 'value4',
          },
        );

        expect(headers['X-Global-1'], equals('value1'));
        expect(headers['X-Global-2'], equals('value2'));
        expect(headers['X-Additional-1'], equals('value3'));
        expect(headers['X-Additional-2'], equals('value4'));
      });

      test('empty additional headers does not affect global', () {
        const config = GoogleAIConfig(
          defaultHeaders: {
            'X-Global': 'global-value',
          },
        );
        const builder = RequestBuilder(config: config);

        final headers = builder.buildHeaders(additionalHeaders: {});

        expect(headers['X-Global'], equals('global-value'));
      });

      test('null additional headers uses only global', () {
        const config = GoogleAIConfig(
          defaultHeaders: {
            'X-Global': 'global-value',
          },
        );
        const builder = RequestBuilder(config: config);

        final headers = builder.buildHeaders();

        expect(headers['X-Global'], equals('global-value'));
      });
    });

    group('Query Parameter Precedence (Global < Endpoint < Request)', () {
      test('global query parameters are included by default', () {
        const config = GoogleAIConfig(
          baseUrl: 'https://api.example.com',
          defaultQueryParams: {
            'global_param': 'global_value',
            'version': 'v1',
          },
        );
        const builder = RequestBuilder(config: config);

        final url = builder.buildUrl('/endpoint');

        expect(url.queryParameters['global_param'], equals('global_value'));
        expect(url.queryParameters['version'], equals('v1'));
      });

      test('endpoint query parameters override global (last-write-wins)', () {
        const config = GoogleAIConfig(
          baseUrl: 'https://api.example.com',
          defaultQueryParams: {
            'version': 'v1',
            'mode': 'default',
          },
        );
        const builder = RequestBuilder(config: config);

        final url = builder.buildUrl(
          '/endpoint',
          queryParams: {
            'version': 'v2', // Override global
            'mode': 'custom', // Override global
            'extra': 'param', // New parameter
          },
        );

        expect(url.queryParameters['version'], equals('v2')); // Overridden
        expect(url.queryParameters['mode'], equals('custom')); // Overridden
        expect(url.queryParameters['extra'], equals('param')); // New
      });

      test('preserves query parameters not in conflict', () {
        const config = GoogleAIConfig(
          baseUrl: 'https://api.example.com',
          defaultQueryParams: {
            'global1': 'value1',
            'global2': 'value2',
          },
        );
        const builder = RequestBuilder(config: config);

        final url = builder.buildUrl(
          '/endpoint',
          queryParams: {
            'endpoint1': 'value3',
            'endpoint2': 'value4',
          },
        );

        expect(url.queryParameters['global1'], equals('value1'));
        expect(url.queryParameters['global2'], equals('value2'));
        expect(url.queryParameters['endpoint1'], equals('value3'));
        expect(url.queryParameters['endpoint2'], equals('value4'));
      });

      test('empty endpoint parameters does not affect global', () {
        const config = GoogleAIConfig(
          baseUrl: 'https://api.example.com',
          defaultQueryParams: {
            'global': 'value',
          },
        );
        const builder = RequestBuilder(config: config);

        final url = builder.buildUrl('/endpoint', queryParams: {});

        expect(url.queryParameters['global'], equals('value'));
      });

      test('null endpoint parameters uses only global', () {
        const config = GoogleAIConfig(
          baseUrl: 'https://api.example.com',
          defaultQueryParams: {
            'global': 'value',
          },
        );
        const builder = RequestBuilder(config: config);

        final url = builder.buildUrl('/endpoint');

        expect(url.queryParameters['global'], equals('value'));
      });

      test('constructs correct URL with baseUrl and path', () {
        const config = GoogleAIConfig(
          baseUrl: 'https://api.example.com',
          apiVersion: ApiVersion.v1,
        );
        const builder = RequestBuilder(config: config);

        final url =
            builder.buildUrl('/{version}/models/gemini-pro:generateContent');

        // URL toString may append '?' even with no query params - check parts separately
        expect(url.scheme, equals('https'));
        expect(url.host, equals('api.example.com'));
        expect(url.path, equals('/v1/models/gemini-pro:generateContent'));
      });

      test('handles baseUrl with trailing slash', () {
        const config = GoogleAIConfig(
          baseUrl: 'https://api.example.com/',
        );
        const builder = RequestBuilder(config: config);

        final url = builder.buildUrl('/endpoint');

        expect(url.toString(), startsWith('https://api.example.com'));
        expect(url.path, contains('endpoint'));
      });
    });

    group('Precedence Chain Integration', () {
      test('complex precedence scenario: headers and query params', () {
        const config = GoogleAIConfig(
          baseUrl: 'https://api.example.com',
          defaultHeaders: {
            'X-Global-Header': 'global',
            'Content-Type': 'text/plain',
          },
          defaultQueryParams: {
            'global_query': 'global',
            'version': 'v1',
          },
        );
        const builder = RequestBuilder(config: config);

        // Build with overrides
        final headers = builder.buildHeaders(
          additionalHeaders: {
            'Content-Type': 'application/json', // Override
            'X-Additional': 'additional', // New
          },
        );

        final url = builder.buildUrl(
          '/endpoint',
          queryParams: {
            'version': 'v2', // Override
            'endpoint_query': 'endpoint', // New
          },
        );

        // Verify header precedence
        expect(headers['X-Global-Header'], equals('global')); // Preserved
        expect(
          headers['Content-Type'],
          equals('application/json'),
        ); // Overridden
        expect(headers['X-Additional'], equals('additional')); // Added

        // Verify query param precedence
        expect(
          url.queryParameters['global_query'],
          equals('global'),
        ); // Preserved
        expect(url.queryParameters['version'], equals('v2')); // Overridden
        expect(
          url.queryParameters['endpoint_query'],
          equals('endpoint'),
        ); // Added
      });

      test('verifies last-write-wins semantic', () {
        const config = GoogleAIConfig(
          baseUrl: 'https://api.example.com',
          defaultHeaders: {
            'X-Test': 'first',
          },
        );
        const builder = RequestBuilder(config: config);

        final headers = builder.buildHeaders(
          additionalHeaders: {
            'X-Test': 'second', // This should win
          },
        );

        expect(headers['X-Test'], equals('second'));
      });
    });
  });
}
