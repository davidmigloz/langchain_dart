import 'dart:convert';
import 'dart:typed_data';

import 'package:langchain_compat/src/chat/chat_models/chat_message.dart';
import 'package:langchain_compat/src/chat/chat_models/helpers/message_part_helpers.dart';
import 'package:test/test.dart';

void main() {
  group('MessagePartHelpers', () {
    group('extractText', () {
      test('returns empty string for empty list', () {
        final parts = <Part>[];
        expect(MessagePartHelpers.extractText(parts), equals(''));
      });

      test('returns single text part content', () {
        final parts = <Part>[const TextPart('Hello world')];
        expect(MessagePartHelpers.extractText(parts), equals('Hello world'));
      });

      test('concatenates multiple text parts without separator', () {
        final parts = <Part>[
          const TextPart('Hello'),
          const TextPart(' '),
          const TextPart('world'),
        ];
        expect(MessagePartHelpers.extractText(parts), equals('Hello world'));
      });

      test('includes empty text parts in concatenation', () {
        final parts = <Part>[
          const TextPart('Hello'),
          const TextPart(''),
          const TextPart('world'),
        ];
        expect(MessagePartHelpers.extractText(parts), equals('Helloworld'));
      });

      test('ignores non-text parts', () {
        final parts = <Part>[
          const TextPart('Hello'),
          const ToolPart.call(id: '123', name: 'test', arguments: {}),
          const TextPart(' world'),
          DataPart(mimeType: 'image/png', bytes: Uint8List(0)),
        ];
        expect(MessagePartHelpers.extractText(parts), equals('Hello world'));
      });

      test('handles list with only non-text parts', () {
        final parts = <Part>[
          const ToolPart.call(id: '123', name: 'test', arguments: {}),
          DataPart(mimeType: 'image/png', bytes: Uint8List(0)),
        ];
        expect(MessagePartHelpers.extractText(parts), equals(''));
      });

      test('preserves whitespace and special characters', () {
        final parts = <Part>[
          const TextPart('  Hello\n'),
          const TextPart('\tworld  '),
          const TextPart(r'!@#$%'),
        ];
        expect(
          MessagePartHelpers.extractText(parts),
          equals('  Hello\n\tworld  !@#\$%'),
        );
      });

      test('handles unicode and emojis', () {
        final parts = <Part>[
          const TextPart('Hello 👋 '),
          const TextPart('世界'),
          const TextPart(' 🌍'),
        ];
        expect(MessagePartHelpers.extractText(parts), equals('Hello 👋 世界 🌍'));
      });
    });

    group('extractToolCalls', () {
      test('returns empty list for empty parts', () {
        final parts = <Part>[];
        expect(MessagePartHelpers.extractToolCalls(parts), isEmpty);
      });

      test('returns empty list when no tool calls present', () {
        final parts = <Part>[
          const TextPart('Hello'),
          const ToolPart.result(id: '123', name: 'test', result: 'result'),
        ];
        expect(MessagePartHelpers.extractToolCalls(parts), isEmpty);
      });

      test('extracts single tool call', () {
        const toolCall = ToolPart.call(
          id: '123',
          name: 'get_weather',
          arguments: {'location': 'Boston'},
        );
        final parts = <Part>[
          const TextPart('Let me check the weather'),
          toolCall,
        ];

        final calls = MessagePartHelpers.extractToolCalls(parts);
        expect(calls, hasLength(1));
        expect(calls.first, equals(toolCall));
        expect(calls.first.id, equals('123'));
        expect(calls.first.name, equals('get_weather'));
      });

      test('extracts multiple tool calls', () {
        const call1 = ToolPart.call(
          id: '123',
          name: 'get_weather',
          arguments: {'location': 'Boston'},
        );
        const call2 = ToolPart.call(
          id: '456',
          name: 'get_time',
          arguments: {'timezone': 'EST'},
        );

        final parts = <Part>[
          const TextPart('Checking weather and time'),
          call1,
          const ToolPart.result(id: '123', name: 'get_weather', result: '72°F'),
          call2,
        ];

        final calls = MessagePartHelpers.extractToolCalls(parts);
        expect(calls, hasLength(2));
        expect(calls[0], equals(call1));
        expect(calls[1], equals(call2));
      });

      test('handles tool calls with empty arguments', () {
        const toolCall = ToolPart.call(
          id: '123',
          name: 'get_current_time',
          arguments: null,
        );
        final parts = <Part>[toolCall];

        final calls = MessagePartHelpers.extractToolCalls(parts);
        expect(calls, hasLength(1));
        expect(calls.first.arguments, isNull);
      });

      test('handles tool calls with empty IDs', () {
        const toolCall = ToolPart.call(
          id: '',
          name: 'test_tool',
          arguments: {},
        );
        final parts = <Part>[toolCall];

        final calls = MessagePartHelpers.extractToolCalls(parts);
        expect(calls, hasLength(1));
        expect(calls.first.id, equals(''));
      });
    });

    group('extractToolResults', () {
      test('returns empty list for empty parts', () {
        final parts = <Part>[];
        expect(MessagePartHelpers.extractToolResults(parts), isEmpty);
      });

      test('returns empty list when no tool results present', () {
        final parts = <Part>[
          const TextPart('Hello'),
          const ToolPart.call(id: '123', name: 'test', arguments: {}),
        ];
        expect(MessagePartHelpers.extractToolResults(parts), isEmpty);
      });

      test('extracts single tool result', () {
        const toolResult = ToolPart.result(
          id: '123',
          name: 'get_weather',
          result: '72°F and sunny',
        );
        final parts = <Part>[const TextPart('The weather is:'), toolResult];

        final results = MessagePartHelpers.extractToolResults(parts);
        expect(results, hasLength(1));
        expect(results.first, equals(toolResult));
        expect(results.first.result, equals('72°F and sunny'));
      });

      test('extracts multiple tool results', () {
        const result1 = ToolPart.result(
          id: '123',
          name: 'get_weather',
          result: '72°F',
        );
        const result2 = ToolPart.result(
          id: '456',
          name: 'get_time',
          result: '3:45 PM',
        );

        final parts = <Part>[
          const ToolPart.call(id: '123', name: 'get_weather', arguments: {}),
          result1,
          const ToolPart.call(id: '456', name: 'get_time', arguments: {}),
          result2,
          const TextPart('Results shown above'),
        ];

        final results = MessagePartHelpers.extractToolResults(parts);
        expect(results, hasLength(2));
        expect(results[0], equals(result1));
        expect(results[1], equals(result2));
      });

      test('handles JSON object results', () {
        final jsonResult = {
          'temperature': 72,
          'unit': 'F',
          'conditions': 'sunny',
        };
        final toolResult = ToolPart.result(
          id: '123',
          name: 'get_weather',
          result: jsonResult,
        );
        final parts = <Part>[toolResult];

        final results = MessagePartHelpers.extractToolResults(parts);
        expect(results, hasLength(1));
        expect(results.first.result, equals(jsonResult));
      });
    });
  });

  group('ToolResultHelpers', () {
    group('serialize', () {
      test('returns string as-is', () {
        const result = 'Hello world';
        expect(ToolResultHelpers.serialize(result), equals('Hello world'));
      });

      test('returns empty string as-is', () {
        const result = '';
        expect(ToolResultHelpers.serialize(result), equals(''));
      });

      test('encodes map to JSON', () {
        final result = {'key': 'value', 'number': 42};
        expect(
          ToolResultHelpers.serialize(result),
          equals('{"key":"value","number":42}'),
        );
      });

      test('encodes list to JSON', () {
        final result = ['a', 'b', 'c'];
        expect(ToolResultHelpers.serialize(result), equals('["a","b","c"]'));
      });

      // Note: null cannot call extension methods in Dart
      // In real usage, tool results are never null

      test('encodes number to JSON', () {
        const result = 42;
        expect(ToolResultHelpers.serialize(result), equals('42'));
      });

      test('encodes boolean to JSON', () {
        const result = true;
        expect(ToolResultHelpers.serialize(result), equals('true'));
      });

      test('encodes nested structures to JSON', () {
        final result = {
          'user': {'name': 'John', 'age': 30},
          'items': ['apple', 'banana'],
          'active': true,
        };
        expect(
          ToolResultHelpers.serialize(result),
          equals(
            '{"user":{"name":"John","age":30},"items":["apple","banana"],'
            '"active":true}',
          ),
        );
      });

      test('handles special characters in strings', () {
        final result = {'message': 'Hello\n"World"\t!'};
        expect(
          ToolResultHelpers.serialize(result),
          equals(r'{"message":"Hello\n\"World\"\t!"}'),
        );
      });

      test('handles unicode in JSON encoding', () {
        final result = {'greeting': 'Hello 👋', 'text': '世界'};
        expect(
          ToolResultHelpers.serialize(result),
          equals('{"greeting":"Hello 👋","text":"世界"}'),
        );
      });
    });

    group('ensureMap', () {
      test('returns Map<String, dynamic> as-is', () {
        final result = <String, dynamic>{'key': 'value'};
        expect(ToolResultHelpers.ensureMap(result), equals(result));
        expect(
          ToolResultHelpers.ensureMap(result),
          same(result),
        ); // Same instance
      });

      test('wraps string in map', () {
        const result = 'Hello world';
        expect(
          ToolResultHelpers.ensureMap(result),
          equals({'result': 'Hello world'}),
        );
      });

      test('wraps number in map', () {
        const result = 42;
        expect(ToolResultHelpers.ensureMap(result), equals({'result': 42}));
      });

      test('wraps boolean in map', () {
        const result = true;
        expect(ToolResultHelpers.ensureMap(result), equals({'result': true}));
      });

      // Note: null cannot call extension methods in Dart
      // In real usage, tool results are never null

      test('wraps list in map', () {
        final result = [1, 2, 3];
        expect(
          ToolResultHelpers.ensureMap(result),
          equals({
            'result': [1, 2, 3],
          }),
        );
      });

      test('handles typed maps correctly', () {
        final result = <String, int>{'a': 1, 'b': 2};
        // Map<String, int> is considered Map<String, dynamic> at runtime
        // so it's returned as-is (not wrapped)
        expect(ToolResultHelpers.ensureMap(result), equals({'a': 1, 'b': 2}));
        expect(ToolResultHelpers.ensureMap(result), same(result));
      });

      test('handles empty map correctly', () {
        final result = <String, dynamic>{};
        expect(ToolResultHelpers.ensureMap(result), equals(result));
        expect(ToolResultHelpers.ensureMap(result), same(result));
      });

      test('handles nested structures when wrapping', () {
        final result = {
          'data': [1, 2, 3],
          'nested': {'key': 'value'},
        };
        expect(ToolResultHelpers.ensureMap(result), equals(result));
      });

      test('wraps complex objects', () {
        final result = DateTime(2023, 7, 1);
        final wrapped = ToolResultHelpers.ensureMap(result);
        expect(wrapped, equals({'result': result}));
        expect(wrapped['result'], isA<DateTime>());
      });
    });
  });

  group('Real-world inspired scenarios', () {
    test('OpenAI-style streaming accumulation', () {
      // Simulating how OpenAI sends tool calls in chunks
      final chunk1Parts = <Part>[
        const TextPart("I'll check the weather for you."),
        const ToolPart.call(
          id: 'call_abc123',
          name: 'get_weather',
          arguments: null,
        ),
      ];

      final chunk2Parts = <Part>[
        const ToolPart.call(
          id: 'call_abc123',
          name: '',
          arguments: {'location': 'Boston'},
        ),
      ];

      // In real usage, these would be merged at a higher level
      // Here we just verify extraction works correctly
      expect(
        MessagePartHelpers.extractText(chunk1Parts),
        equals("I'll check the weather for you."),
      );
      expect(MessagePartHelpers.extractToolCalls(chunk1Parts), hasLength(1));
      expect(MessagePartHelpers.extractToolCalls(chunk2Parts), hasLength(1));
    });

    test('Google-style complete tool calls', () {
      final parts = <Part>[
        const TextPart('Let me get that information for you.'),
        const ToolPart.call(id: '', name: 'current_date_time', arguments: {}),
        const ToolPart.call(
          id: '',
          name: 'get_temperature',
          arguments: {'location': 'NYC'},
        ),
      ];

      expect(
        MessagePartHelpers.extractText(parts),
        equals('Let me get that information for you.'),
      );
      final calls = MessagePartHelpers.extractToolCalls(parts);
      expect(calls, hasLength(2));
      expect(calls.every((c) => c.id.isEmpty), isTrue);
    });

    test('Tool result handling with various types', () {
      const stringResult = 'The weather is sunny';
      final mapResult = {'temperature': 72, 'conditions': 'sunny'};
      final listResult = ['sunny', 'warm', 'humid'];

      expect(
        ToolResultHelpers.serialize(stringResult),
        equals('The weather is sunny'),
      );
      expect(
        ToolResultHelpers.serialize(mapResult),
        equals(json.encode(mapResult)),
      );
      expect(
        ToolResultHelpers.serialize(listResult),
        equals(json.encode(listResult)),
      );

      expect(
        ToolResultHelpers.ensureMap(stringResult),
        equals({'result': stringResult}),
      );
      expect(ToolResultHelpers.ensureMap(mapResult), same(mapResult));
      expect(
        ToolResultHelpers.ensureMap(listResult),
        equals({'result': listResult}),
      );

      // Note: In real usage, tool results are never null because they come from
      // ToolPart.result which is typed as dynamic (non-nullable)
    });

    test('Mixed content message processing', () {
      final parts = <Part>[
        const TextPart('Based on your request, '),
        const TextPart("I've executed the following tools:\n\n"),
        const ToolPart.call(
          id: '1',
          name: 'search',
          arguments: {'query': 'Dart'},
        ),
        const ToolPart.result(
          id: '1',
          name: 'search',
          result: 'Found 10 results',
        ),
        const TextPart('\nThe search returned 10 results.'),
      ];

      expect(
        MessagePartHelpers.extractText(parts),
        equals(
          "Based on your request, I've executed the following tools:\n\n\n"
          'The search returned 10 results.',
        ),
      );
      expect(MessagePartHelpers.extractToolCalls(parts), hasLength(1));
      expect(MessagePartHelpers.extractToolResults(parts), hasLength(1));
    });

    test('Error result handling', () {
      final errorResult = {'error': 'API rate limit exceeded'};

      expect(
        ToolResultHelpers.serialize(errorResult),
        equals('{"error":"API rate limit exceeded"}'),
      );
      expect(ToolResultHelpers.ensureMap(errorResult), same(errorResult));
    });
  });
}
