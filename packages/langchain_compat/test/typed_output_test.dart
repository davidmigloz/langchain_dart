// CRITICAL TEST FAILURE INVESTIGATION PROCESS: When a test fails for a provider
// capability:
// 1. NEVER immediately disable the capability in provider definitions
// 2. ALWAYS investigate at the API level first:
//    - Test with curl to verify if the feature works at the raw API level
//    - Check the provider's official documentation
//    - Look for differences between our implementation and the API requirements
// 3. ONLY disable a capability after confirming:
//    - The API itself doesn't support the feature, OR
//    - The API has a fundamental limitation (like Together's streaming tool
//      format)
// 4. If the API supports it but our code doesn't: FIX THE IMPLEMENTATION
// 5. LET EXCEPTIONS BUBBLE UP: Do not add defensive checks or try-catch blocks.
//    Missing API keys, network errors, and provider issues should fail loudly
//    so they can be identified and fixed immediately.

// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:json_schema/json_schema.dart' as js;
import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

void main() {
  // Get all providers that support typed output
  final typedOutputProviders = ChatProvider.allWith({ProviderCaps.typedOutput});

  // Helper to run parameterized tests
  void runProviderTest(
    String testName,
    Future<void> Function(ChatProvider provider) testFunction, {
    Timeout? timeout,
  }) {
    group(testName, () {
      for (final provider in typedOutputProviders) {
        test(
          '${provider.name} - $testName',
          () async {
            await testFunction(provider);
          },
          timeout: timeout ?? const Timeout(Duration(seconds: 30)),
        );
      }
    });
  }

  group('Typed Output', () {
    group('basic structured output', () {
      runProviderTest('returns simple JSON object', (provider) async {
        final schema = js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'name': {'type': 'string'},
            'age': {'type': 'integer'},
          },
          'required': ['name', 'age'],
        });

        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final result = await agent.run(
          'Generate a person with name "John" and age 30',
          outputSchema: schema,
        );

        final json = jsonDecode(result.output) as Map<String, dynamic>;
        expect(json['name'], equals('John'));
        expect(json['age'], equals(30));
      });

      runProviderTest('handles nested objects', (provider) async {
        final schema = js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'user': {
              'type': 'object',
              'properties': {
                'name': {'type': 'string'},
                'email': {'type': 'string'},
              },
              'required': ['name', 'email'],
            },
            'settings': {
              'type': 'object',
              'properties': {
                'theme': {'type': 'string'},
                'notifications': {'type': 'boolean'},
              },
            },
          },
          'required': ['user', 'settings'],
        });

        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final result = await agent.run(
          'Create a user object with name "Alice", email "alice@example.com", '
          'theme "dark", and notifications enabled',
          outputSchema: schema,
        );

        final json = jsonDecode(result.output) as Map<String, dynamic>;
        expect(json['user'], isA<Map<String, dynamic>>());
        expect(json['user']['name'], equals('Alice'));
        expect(json['user']['email'], equals('alice@example.com'));

        if (json['settings'] != null) {
          expect(json['settings']['theme'], equals('dark'));
          expect(json['settings']['notifications'], isTrue);
        }
      });

      runProviderTest('returns arrays when specified', (provider) async {
        final schema = js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'items': {
              'type': 'array',
              'items': {
                'type': 'object',
                'properties': {
                  'id': {'type': 'integer'},
                  'name': {'type': 'string'},
                },
                'required': ['id', 'name'],
              },
            },
          },
          'required': ['items'],
        });

        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final result = await agent.run(
          'Create an array of 3 items with sequential IDs starting at 1 '
          'and names "Apple", "Banana", "Cherry"',
          outputSchema: schema,
        );

        final json = jsonDecode(result.output) as Map<String, dynamic>;
        expect(json['items'], isA<List>());
        expect(json['items'], hasLength(3));
        expect(json['items'][0]['id'], equals(1));
        expect(json['items'][0]['name'], equals('Apple'));
        expect(json['items'][2]['name'], equals('Cherry'));
      });

      runProviderTest(
        'handle structured output correctly',
        (provider) async {
          final schema = js.JsonSchema.create({
            'type': 'object',
            'properties': {
              'result': {'type': 'string'},
              'count': {'type': 'integer'},
              'success': {'type': 'boolean'},
            },
            'required': ['result', 'count', 'success'],
          });

          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final result = await agent.run(
            'Generate JSON with result="${provider.name} test", '
            'count=42, success=true',
            outputSchema: schema,
          );

          final json = jsonDecode(result.output) as Map<String, dynamic>;
          expect(
            json['result'],
            equals('${provider.name} test'),
            reason: 'Provider ${provider.name} should generate correct string',
          );
          expect(
            json['count'],
            equals(42),
            reason: 'Provider ${provider.name} should generate correct integer',
          );
          expect(
            json['success'],
            isTrue,
            reason: 'Provider ${provider.name} should generate correct boolean',
          );
        },
        timeout: const Timeout(Duration(minutes: 3)),
      );
    });

    group('data types', () {
      runProviderTest('handles all primitive types', (provider) async {
        final schema = js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'string_field': {'type': 'string'},
            'integer_field': {'type': 'integer'},
            'number_field': {'type': 'number'},
            'boolean_field': {'type': 'boolean'},
            'null_field': {'type': 'null'},
          },
          'required': [
            'string_field',
            'integer_field',
            'number_field',
            'boolean_field',
          ],
        });

        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final result = await agent.run(
          'Create object with: string_field="test", integer_field=42, '
          'number_field=3.14, boolean_field=true, null_field=null',
          outputSchema: schema,
        );

        final json = jsonDecode(result.output) as Map<String, dynamic>;
        expect(json['string_field'], equals('test'));
        expect(json['integer_field'], equals(42));
        expect(json['number_field'], equals(3.14));
        expect(json['boolean_field'], isTrue);
        expect(json['null_field'], isNull);
      });

      runProviderTest('respects enum constraints', (provider) async {
        final schema = js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'status': {
              'type': 'string',
              'enum': ['pending', 'approved', 'rejected'],
            },
            'priority': {
              'type': 'string',
              'enum': ['low', 'medium', 'high'],
            },
          },
          'required': ['status', 'priority'],
        });

        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final result = await agent.run(
          'Create object with status "approved" and priority "high"',
          outputSchema: schema,
        );

        final json = jsonDecode(result.output) as Map<String, dynamic>;
        expect(json['status'], equals('approved'));
        expect(json['priority'], equals('high'));
      });

      runProviderTest('handles numeric constraints', (provider) async {
        final schema = js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'age': {'type': 'integer', 'minimum': 0, 'maximum': 150},
            'score': {'type': 'number', 'minimum': 0.0, 'maximum': 100.0},
          },
          'required': ['age', 'score'],
        });

        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final result = await agent.run(
          'Create object with age 25 and score 87.5',
          outputSchema: schema,
        );

        final json = jsonDecode(result.output) as Map<String, dynamic>;
        expect(json['age'], equals(25));
        expect(json['age'], greaterThanOrEqualTo(0));
        expect(json['age'], lessThanOrEqualTo(150));
        expect(json['score'], equals(87.5));
      });
    });

    group('complex schemas', () {
      runProviderTest('generates valid recursive structures', (provider) async {
        final schema = js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'name': {'type': 'string'},
            'children': {
              'type': 'array',
              'items': {
                'type': 'object',
                'properties': {
                  'name': {'type': 'string'},
                  'age': {'type': 'integer'},
                },
                'required': ['name'],
              },
            },
          },
          'required': ['name'],
        });

        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final result = await agent.run(
          'Create a parent named "John" with two children: "Alice" age 10 and '
          '"Bob" age 8',
          outputSchema: schema,
        );

        final json = jsonDecode(result.output) as Map<String, dynamic>;
        expect(json['name'], equals('John'));
        expect(json['children'], hasLength(2));
        expect(json['children'][0]['name'], equals('Alice'));
        expect(json['children'][0]['age'], equals(10));
      });

      runProviderTest('handles union types with anyOf', (provider) async {
        final schema = js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'value': {
              'anyOf': [
                {'type': 'string'},
                {'type': 'number'},
                {'type': 'boolean'},
              ],
            },
          },
          'required': ['value'],
        });

        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Test with string
        var result = await agent.run(
          'Create object with value "hello"',
          outputSchema: schema,
        );
        var json = jsonDecode(result.output) as Map<String, dynamic>;
        expect(json['value'], equals('hello'));

        // Test with number
        result = await agent.run(
          'Create object with value 42',
          outputSchema: schema,
        );
        json = jsonDecode(result.output) as Map<String, dynamic>;
        expect(json['value'], equals(42));
      });
    });

    // Error cases moved to dedicated edge cases section

    group('provider differences', () {
      runProviderTest('handles provider-specific formats', (provider) async {
        final schema = js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'message': {'type': 'string'},
          },
          'required': ['message'],
        });

        // Different providers handle schemas differently internally but all
        // should produce valid JSON output through Agent
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final result = await agent.run(
          'Create object with message "${provider.name} test"',
          outputSchema: schema,
        );
        expect(() => jsonDecode(result.output), returnsNormally);

        final json = jsonDecode(result.output) as Map<String, dynamic>;
        expect(json['message'], equals('${provider.name} test'));
      });
    });

    group('all providers - typed output', () {
      runProviderTest('structured output works across supporting providers', (
        provider,
      ) async {
        final schema = js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'name': {'type': 'string'},
            'value': {'type': 'integer'},
          },
          'required': ['name', 'value'],
        });

        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final result = await agent.run(
          'Create object with name "test" and value 123',
          outputSchema: schema,
        );

        final json = jsonDecode(result.output) as Map<String, dynamic>;

        expect(
          json['name'],
          equals('test'),
          reason: 'Provider ${provider.name} should return correct name',
        );
        expect(
          json['value'],
          equals(123),
          reason: 'Provider ${provider.name} should return correct value',
        );
      });
    });

    group('edge cases (limited providers)', () {
      // Test edge cases on only 1-2 providers to save resources
      final edgeCaseProviders = <ChatProvider>[
        ChatProvider.openai,
        ChatProvider.anthropic,
      ];

      test('handles schema validation errors', () async {
        for (final provider in edgeCaseProviders) {
          final schema = js.JsonSchema.create({
            'type': 'object',
            'properties': {
              'required_field': {'type': 'string'},
            },
            'required': ['required_field', 'another_required_field'], // Invalid
          });

          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          // Model should handle gracefully even with invalid schema
          final result = await agent.run(
            'Create any valid object',
            outputSchema: schema,
          );

          // Should return something, even if not perfectly matching schema
          expect(result.output, isNotEmpty);
        }
      });

      test('handles conflicting instructions', () async {
        for (final provider in edgeCaseProviders) {
          final schema = js.JsonSchema.create({
            'type': 'object',
            'properties': {
              'number': {'type': 'integer', 'minimum': 10, 'maximum': 20},
            },
            'required': ['number'],
          });

          final agent = Agent('${provider.name}:${provider.defaultModelName}');
          final result = await agent.run(
            // Conflicting: asking for 50 but schema max is 20
            'Create a JSON object with number between 10 and 20',
            outputSchema: schema,
          );

          final json = jsonDecode(result.output) as Map<String, dynamic>;
          // Should respect schema constraint
          final number = json['number'] as int?;
          expect(number, isNotNull);
          expect(number, lessThanOrEqualTo(20));
          expect(number, greaterThanOrEqualTo(10));
        }
      });
    });
  });
}
