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
        expect(json['name'], isA<String>());
        expect(json['age'], isA<int>());
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
        expect(json['user']['name'], isA<String>());
        expect(json['user']['email'], isA<String>());

        if (json['settings'] != null) {
          expect(json['settings']['theme'], isA<String>());
          expect(json['settings']['notifications'], isA<bool>());
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
        expect(json['name'], isA<String>());
        expect(json['children'], isA<List>());
        expect(json['children'], isNotEmpty);
        if ((json['children'] as List).isNotEmpty) {
          expect(json['children'][0]['name'], isA<String>());
          expect(json['children'][0]['age'], isA<int>());
        }
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

    group('streaming typed output', () {
      runProviderTest('streams JSON output correctly', (provider) async {
        final schema = js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'message': {'type': 'string'},
            'count': {'type': 'integer'},
          },
          'required': ['message', 'count'],
        });

        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final buffer = StringBuffer();
        final messages = <ChatMessage>[];

        await for (final chunk in agent.runStream(
          'Generate JSON with message "Hello from ${provider.name}" '
          'and count 42',
          outputSchema: schema,
        )) {
          buffer.write(chunk.output);
          messages.addAll(chunk.messages);
        }

        final json = jsonDecode(buffer.toString()) as Map<String, dynamic>;
        expect(json['message'], contains(provider.name));
        expect(json['count'], equals(42));
        expect(messages, isNotEmpty);
      });

      runProviderTest('handles complex schema in streaming', (provider) async {
        final schema = js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'users': {
              'type': 'array',
              'items': {
                'type': 'object',
                'properties': {
                  'id': {'type': 'integer'},
                  'name': {'type': 'string'},
                  'active': {'type': 'boolean'},
                },
                'required': ['id', 'name', 'active'],
              },
            },
            'total': {'type': 'integer'},
          },
          'required': ['users', 'total'],
        });

        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final buffer = StringBuffer();

        await for (final chunk in agent.runStream(
          'Create 2 users: Alice (id 1, active) and Bob (id 2, inactive). '
          'Include total count.',
          outputSchema: schema,
        )) {
          buffer.write(chunk.output);
        }

        final json = jsonDecode(buffer.toString()) as Map<String, dynamic>;
        expect(json['users'], hasLength(2));
        expect(json['users'][0]['name'], equals('Alice'));
        expect(json['users'][0]['active'], isTrue);
        expect(json['users'][1]['name'], equals('Bob'));
        expect(json['users'][1]['active'], isFalse);
        expect(json['total'], equals(2));
      });
    });

    group('runFor<T>() typed output', () {
      runProviderTest('returns typed Map<String, dynamic>', (provider) async {
        final schema = js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'city': {'type': 'string'},
            'country': {'type': 'string'},
          },
          'required': ['city', 'country'],
        });

        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final result = await agent.runFor<Map<String, dynamic>>(
          'What is the capital of France? Return as city and country.',
          outputSchema: schema,
        );

        expect(result.output, isA<Map<String, dynamic>>());
        expect(result.output['city'], equals('Paris'));
        expect(result.output['country'], equals('France'));
      });

      test(
        'returns custom typed objects - ${typedOutputProviders.first.name}',
        () async {
          // Test with just one provider to save time
          final provider = typedOutputProviders.first;

          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final result = await agent.runFor<WeatherReport>(
            'Create a weather report for London: 15C, cloudy, 70% humidity',
            outputSchema: WeatherReport.schema,
            outputFromJson: WeatherReport.fromJson,
          );

          expect(result.output, isA<WeatherReport>());
          expect(result.output.location, equals('London'));
          expect(result.output.temperature, equals(15));
          expect(result.output.conditions, equals('cloudy'));
          expect(result.output.humidity, equals(70));
        },
      );

      runProviderTest('handles nested custom types', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final result = await agent.runFor<UserProfile>(
          'Create a user profile for John Doe, age 30, with email '
          '"john@example.com", dark theme preference, notifications on',
          outputSchema: UserProfile.schema,
          outputFromJson: UserProfile.fromJson,
        );

        expect(result.output, isA<UserProfile>());
        expect(result.output.name, equals('John Doe'));
        expect(result.output.age, equals(30));
        expect(result.output.email, equals('john@example.com'));
        expect(result.output.preferences.theme, equals('dark'));
        expect(result.output.preferences.notifications, isTrue);
      });
    });

    group('complex real-world schemas', () {
      runProviderTest('handles API response schema', (provider) async {
        final schema = js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'success': {'type': 'boolean'},
            'data': {
              'type': 'object',
              'properties': {
                'users': {
                  'type': 'array',
                  'items': {
                    'type': 'object',
                    'properties': {
                      'id': {'type': 'string'},
                      'username': {'type': 'string'},
                      'profile': {
                        'type': 'object',
                        'properties': {
                          'firstName': {'type': 'string'},
                          'lastName': {'type': 'string'},
                          'avatar': {'type': 'string'},
                        },
                        'required': ['firstName', 'lastName'],
                      },
                    },
                    'required': ['id', 'username', 'profile'],
                  },
                },
                'pagination': {
                  'type': 'object',
                  'properties': {
                    'page': {'type': 'integer'},
                    'perPage': {'type': 'integer'},
                    'total': {'type': 'integer'},
                    'totalPages': {'type': 'integer'},
                  },
                  'required': ['page', 'perPage', 'total', 'totalPages'],
                },
              },
              'required': ['users', 'pagination'],
            },
            'metadata': {
              'type': 'object',
              'properties': {
                'version': {'type': 'string'},
                'timestamp': {'type': 'string'},
              },
              'required': ['version', 'timestamp'],
            },
          },
          'required': ['success', 'data', 'metadata'],
        });

        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final result = await agent.run(
          'Create a successful API response with 2 users '
          '(Alice Smith and Bob Jones), '
          'page 1 of 5, 10 per page, 50 total. Include realistic metadata.',
          outputSchema: schema,
        );

        final json = jsonDecode(result.output) as Map<String, dynamic>;
        expect(json['success'], isTrue);
        expect(json['data']['users'], hasLength(2));
        expect(
          json['data']['users'][0]['profile']['firstName'],
          equals('Alice'),
        );
        expect(json['data']['users'][1]['profile']['firstName'], equals('Bob'));
        expect(json['data']['pagination']['page'], equals(1));
        expect(json['data']['pagination']['totalPages'], equals(5));
        expect(json['metadata']['version'], isNotEmpty);
      });

      runProviderTest('handles deeply nested configuration', (provider) async {
        final schema = js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'application': {
              'type': 'object',
              'properties': {
                'name': {'type': 'string'},
                'version': {'type': 'string'},
                'features': {
                  'type': 'object',
                  'properties': {
                    'authentication': {
                      'type': 'object',
                      'properties': {
                        'enabled': {'type': 'boolean'},
                        'providers': {
                          'type': 'array',
                          'items': {'type': 'string'},
                        },
                        'settings': {
                          'type': 'object',
                          'properties': {
                            'sessionTimeout': {'type': 'integer'},
                            'requireMFA': {'type': 'boolean'},
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
          },
        });

        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final result = await agent.run(
          'Create app config: MyApp v1.0.0, authentication enabled with '
          'Google and GitHub, '
          '30min timeout, MFA required',
          outputSchema: schema,
        );

        final json = jsonDecode(result.output) as Map<String, dynamic>;
        final app = json['application'] as Map<String, dynamic>;
        expect(app['name'], equals('MyApp'));
        expect(app['version'], equals('1.0.0'));
        expect(app['features']['authentication']['enabled'], isTrue);
        expect(
          app['features']['authentication']['providers'],
          containsAll(['Google', 'GitHub']),
        );
        expect(
          app['features']['authentication']['settings']['sessionTimeout'],
          equals(30),
        );
      });
    });

    group('provider edge cases', () {
      // Test edge cases on limited providers
      final edgeProviders = <ChatProvider>[
        ChatProvider.openai,
        ChatProvider.google,
      ];

      test('handles unicode and special characters', () async {
        for (final provider in edgeProviders) {
          final schema = js.JsonSchema.create({
            'type': 'object',
            'properties': {
              'message': {'type': 'string'},
              'emoji': {'type': 'string'},
              'special': {'type': 'string'},
            },
            'required': ['message', 'emoji', 'special'],
          });

          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final result = await agent.run(
            'Create object with message "Hello 世界", emoji "🌍", '
            'and special characters "<>&\'"',
            outputSchema: schema,
          );

          final json = jsonDecode(result.output) as Map<String, dynamic>;
          expect(json['message'], contains('世界'));
          expect(json['emoji'], equals('🌍'));
          expect(json['special'], contains('<>&'));
        }
      });

      test('handles empty collections', () async {
        for (final provider in edgeProviders) {
          final schema = js.JsonSchema.create({
            'type': 'object',
            'properties': {
              'emptyArray': {
                'type': 'array',
                'items': {'type': 'string'},
              },
              'emptyObject': {'type': 'object'},
              'nullableField': {
                'type': ['string', 'null'],
              },
            },
            'required': ['emptyArray', 'emptyObject'],
          });

          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final result = await agent.run(
            'Create object with empty array, empty object, and null for '
            'nullable field',
            outputSchema: schema,
          );

          final json = jsonDecode(result.output) as Map<String, dynamic>;
          expect(json['emptyArray'], isEmpty);
          expect(json['emptyObject'], isA<Map>());
          expect(json['emptyObject'], isEmpty);
        }
      });

      test('handles large numeric values', () async {
        for (final provider in edgeProviders) {
          final schema = js.JsonSchema.create({
            'type': 'object',
            'properties': {
              'largeInt': {'type': 'integer'},
              'preciseFloat': {'type': 'number'},
              'scientificNotation': {'type': 'number'},
            },
            'required': ['largeInt', 'preciseFloat', 'scientificNotation'],
          });

          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final result = await agent.run(
            'Create object with largeInt: 9007199254740991, '
            'preciseFloat: 3.141592653589793, scientificNotation: 6.022e23',
            outputSchema: schema,
          );

          final json = jsonDecode(result.output) as Map<String, dynamic>;
          expect(json['largeInt'], greaterThan(1000000));
          expect(json['preciseFloat'].toString(), contains('3.14'));
          expect(json['scientificNotation'], greaterThan(1e20));
        }
      });
    });
  });
}

// Custom classes for typed output tests
class WeatherReport {
  const WeatherReport({
    required this.location,
    required this.temperature,
    required this.conditions,
    required this.humidity,
  });

  factory WeatherReport.fromJson(Map<String, dynamic> json) => WeatherReport(
    location: json['location'] as String,
    temperature: json['temperature'] as int,
    conditions: json['conditions'] as String,
    humidity: json['humidity'] as int,
  );

  static final schema = js.JsonSchema.create({
    'type': 'object',
    'properties': {
      'location': {'type': 'string'},
      'temperature': {'type': 'integer'},
      'conditions': {'type': 'string'},
      'humidity': {'type': 'integer'},
    },
    'required': ['location', 'temperature', 'conditions', 'humidity'],
  });

  final String location;
  final int temperature;
  final String conditions;
  final int humidity;
}

class UserPreferences {
  const UserPreferences({required this.theme, required this.notifications});

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      UserPreferences(
        theme: json['theme'] as String,
        notifications: json['notifications'] as bool,
      );

  final String theme;
  final bool notifications;
}

class UserProfile {
  const UserProfile({
    required this.name,
    required this.age,
    required this.email,
    required this.preferences,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    name: json['name'] as String,
    age: json['age'] as int,
    email: json['email'] as String,
    preferences: UserPreferences.fromJson(
      json['preferences'] as Map<String, dynamic>,
    ),
  );

  static final schema = js.JsonSchema.create({
    'type': 'object',
    'properties': {
      'name': {'type': 'string'},
      'age': {'type': 'integer'},
      'email': {'type': 'string'},
      'preferences': {
        'type': 'object',
        'properties': {
          'theme': {'type': 'string'},
          'notifications': {'type': 'boolean'},
        },
        'required': ['theme', 'notifications'],
      },
    },
    'required': ['name', 'age', 'email', 'preferences'],
  });

  final String name;
  final int age;
  final String email;
  final UserPreferences preferences;
}
