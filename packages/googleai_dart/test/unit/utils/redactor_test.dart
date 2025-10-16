import 'package:googleai_dart/src/utils/redactor.dart';
import 'package:test/test.dart';

void main() {
  group('Redactor', () {
    group('redactMap', () {
      test('redacts matching keys (case-insensitive)', () {
        const redactor = Redactor(redactionList: ['api-key', 'password']);

        final input = {
          'api-key': 'secret123',
          'API-KEY': 'secret456',
          'Api-Key': 'secret789',
          'password': 'pass123',
          'PASSWORD': 'pass456',
          'safe-field': 'visible',
        };

        final result = redactor.redactMap(input);

        expect(result['api-key'], equals('***REDACTED***'));
        expect(result['API-KEY'], equals('***REDACTED***'));
        expect(result['Api-Key'], equals('***REDACTED***'));
        expect(result['password'], equals('***REDACTED***'));
        expect(result['PASSWORD'], equals('***REDACTED***'));
        expect(result['safe-field'], equals('visible'));
      });

      test('preserves non-matching keys', () {
        const redactor = Redactor(redactionList: ['secret']);

        final input = {
          'public': 'value1',
          'visible': 'value2',
          'data': 'value3',
        };

        final result = redactor.redactMap(input);

        expect(result['public'], equals('value1'));
        expect(result['visible'], equals('value2'));
        expect(result['data'], equals('value3'));
      });

      test('uses custom replacement text', () {
        const redactor = Redactor(
          redactionList: ['token'],
          replacement: '[HIDDEN]',
        );

        final input = {'token': 'abc123', 'other': 'visible'};

        final result = redactor.redactMap(input);

        expect(result['token'], equals('[HIDDEN]'));
        expect(result['other'], equals('visible'));
      });

      test('handles empty map', () {
        const redactor = Redactor(redactionList: ['key']);

        final result = redactor.redactMap({});

        expect(result, isEmpty);
      });

      test('handles empty redaction list', () {
        const redactor = Redactor(redactionList: []);

        final input = {'field1': 'value1', 'field2': 'value2'};

        final result = redactor.redactMap(input);

        expect(result['field1'], equals('value1'));
        expect(result['field2'], equals('value2'));
      });

      test('handles partial key matches (should not redact)', () {
        const redactor = Redactor(redactionList: ['key']);

        final input = {
          'api-key': 'secret',
          'public-key': 'visible',
          'keychain': 'data',
        };

        final result = redactor.redactMap(input);

        // Should not redact partial matches
        expect(result['api-key'], equals('secret'));
        expect(result['public-key'], equals('visible'));
        expect(result['keychain'], equals('data'));
      });

      test('handles X-Goog-Api-Key header', () {
        const redactor = Redactor(redactionList: ['x-goog-api-key']);

        final input = {
          'X-Goog-Api-Key': 'secret123',
          'Content-Type': 'application/json',
        };

        final result = redactor.redactMap(input);

        expect(result['X-Goog-Api-Key'], equals('***REDACTED***'));
        expect(result['Content-Type'], equals('application/json'));
      });
    });

    group('redactString', () {
      test('redacts JSON-style field', () {
        const redactor = Redactor(redactionList: ['apiKey']);

        const input = '{"apiKey": "secret123", "data": "visible"}';
        final result = redactor.redactString(input);

        expect(result, contains('"apiKey": "***REDACTED***"'));
        expect(result, contains('"data": "visible"'));
      });

      test('redacts query param style', () {
        const redactor = Redactor(redactionList: ['key']);

        const input = 'https://api.example.com?key=secret123&data=visible';
        final result = redactor.redactString(input);

        expect(result, contains('key=***REDACTED***'));
        expect(result, contains('data=visible'));
      });

      test('redacts header style', () {
        const redactor = Redactor(redactionList: ['authorization']);

        const input =
            'Authorization: Bearer token123\nContent-Type: application/json';
        final result = redactor.redactString(input);

        // Redactor replaces with field name from redaction list (lowercase)
        expect(result, contains('authorization: ***REDACTED***'));
        expect(result, contains('Content-Type: application/json'));
      });

      test('handles case-insensitive matching', () {
        const redactor = Redactor(redactionList: ['password']);

        const input =
            '"PASSWORD": "secret", "Password": "hidden", "password": "concealed"';
        final result = redactor.redactString(input);

        // All instances are redacted (case-insensitive), but field name becomes lowercase
        expect(result, contains('"password": "***REDACTED***"'));
        expect(
          '"password": "***REDACTED***"'.allMatches(result).length,
          equals(3),
        );
      });

      test('handles multiple occurrences', () {
        const redactor = Redactor(redactionList: ['token']);

        const input = '"token": "abc", "token": "def", "token": "ghi"';
        final result = redactor.redactString(input);

        expect(
          '"token": "***REDACTED***"'.allMatches(result).length,
          equals(3),
        );
      });

      test('uses custom replacement text', () {
        const redactor = Redactor(
          redactionList: ['secret'],
          replacement: '[HIDDEN]',
        );

        const input = '"secret": "value"';
        final result = redactor.redactString(input);

        expect(result, contains('"secret": "[HIDDEN]"'));
      });

      test('handles empty string', () {
        const redactor = Redactor(redactionList: ['key']);

        final result = redactor.redactString('');

        expect(result, isEmpty);
      });

      test('handles string with no matches', () {
        const redactor = Redactor(redactionList: ['secret']);

        const input = 'This is public data';
        final result = redactor.redactString(input);

        expect(result, equals(input));
      });

      test('handles complex JSON with nested fields', () {
        const redactor = Redactor(redactionList: ['apiKey', 'password']);

        const input = '''
{
  "user": "john",
  "apiKey": "secret123",
  "settings": {
    "password": "hidden456"
  }
}
''';

        final result = redactor.redactString(input);

        expect(result, contains('"apiKey": "***REDACTED***"'));
        expect(result, contains('"password": "***REDACTED***"'));
        expect(result, contains('"user": "john"'));
      });

      test('handles URL with multiple query params', () {
        const redactor = Redactor(redactionList: ['api_key', 'token']);

        const input =
            'https://api.example.com?api_key=secret&data=visible&token=hidden';
        final result = redactor.redactString(input);

        expect(result, contains('api_key=***REDACTED***'));
        expect(result, contains('token=***REDACTED***'));
        expect(result, contains('data=visible'));
      });

      test('handles headers with various formats', () {
        const redactor = Redactor(
          redactionList: ['authorization', 'x-api-key'],
        );

        const input = '''
Authorization: Bearer token123
X-Api-Key: secret456
Content-Type: application/json
''';

        final result = redactor.redactString(input);

        // Field names become lowercase from redaction list
        expect(result, contains('authorization: ***REDACTED***'));
        expect(result, contains('x-api-key: ***REDACTED***'));
        expect(result, contains('Content-Type: application/json'));
      });
    });

    group('truncate', () {
      test('truncates long strings', () {
        const redactor = Redactor(redactionList: []);

        final input = 'a' * 100;
        final result = redactor.truncate(input, 50);

        expect(result.length, lessThan(input.length));
        expect(result, startsWith('a' * 50));
        expect(result, endsWith('... [truncated]'));
      });

      test('preserves short strings', () {
        const redactor = Redactor(redactionList: []);

        const input = 'short';
        final result = redactor.truncate(input, 10);

        expect(result, equals(input));
      });

      test('handles exact length match', () {
        const redactor = Redactor(redactionList: []);

        const input = 'exactly10!';
        final result = redactor.truncate(input, 10);

        expect(result, equals(input));
      });

      test('handles empty string', () {
        const redactor = Redactor(redactionList: []);

        final result = redactor.truncate('', 10);

        expect(result, isEmpty);
      });

      test('handles maxLength of 0', () {
        const redactor = Redactor(redactionList: []);

        final result = redactor.truncate('test', 0);

        expect(result, equals('... [truncated]'));
      });

      test('truncates Unicode characters correctly', () {
        const redactor = Redactor(redactionList: []);

        final input = '🚀' * 50;
        final result = redactor.truncate(input, 10);

        expect(result.length, lessThan(input.length));
        expect(result, endsWith('... [truncated]'));
      });
    });

    group('Integration Tests', () {
      test('redacts and truncates together', () {
        const redactor = Redactor(redactionList: ['apiKey']);

        final input = '{"apiKey": "secret123", "data": "${'x' * 1000}"}';
        final redacted = redactor.redactString(input);
        final truncated = redactor.truncate(redacted, 100);

        expect(truncated, contains('***REDACTED***'));
        expect(
          truncated.length,
          lessThanOrEqualTo(100 + '... [truncated]'.length),
        );
      });

      test('handles realistic log message', () {
        const redactor = Redactor(
          redactionList: ['authorization', 'x-api-key'],
        );

        const input = '''
REQUEST [req_123] POST https://api.example.com/v1/chat
Headers: {Authorization: Bearer token123, X-Api-Key: secret456, Content-Type: application/json}
Body: {"message": "Hello"}
''';

        final result = redactor.redactString(input);

        expect(result, contains('***REDACTED***'));
        expect(result, isNot(contains('token123')));
        expect(result, isNot(contains('secret456')));
        expect(result, contains('"message": "Hello"'));
      });

      test('default redaction list covers common sensitive fields', () {
        const redactor = Redactor(
          redactionList: [
            'authorization',
            'api-key',
            'api_key',
            'x-goog-api-key',
            'token',
            'password',
            'secret',
            'bearer',
          ],
        );

        const input = '''
{
  "Authorization": "Bearer abc",
  "api-key": "key1",
  "api_key": "key2",
  "X-Goog-Api-Key": "key3",
  "token": "tok1",
  "password": "pass1",
  "secret": "sec1",
  "bearer": "bear1"
}
''';

        final result = redactor.redactString(input);

        expect(result, isNot(contains('abc')));
        expect(result, isNot(contains('key1')));
        expect(result, isNot(contains('key2')));
        expect(result, isNot(contains('key3')));
        expect(result, isNot(contains('tok1')));
        expect(result, isNot(contains('pass1')));
        expect(result, isNot(contains('sec1')));
        expect(result, isNot(contains('bear1')));
      });
    });
  });
}
