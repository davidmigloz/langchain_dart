/// TESTING PHILOSOPHY:
/// 1. DO NOT catch exceptions - let them bubble up for diagnosis
/// 2. DO NOT add provider filtering except by capabilities (e.g. ProviderCaps)
/// 3. DO NOT add performance tests
/// 4. DO NOT add regression tests
/// 5. 80% cases = common usage patterns tested across ALL capable providers
/// 6. Edge cases = rare scenarios tested on Google only to avoid timeouts
/// 7. Each functionality should only be tested in ONE file - no duplication

// ignore_for_file: avoid_dynamic_calls

import 'dart:typed_data';

import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

void main() {
  group('Message Management', () {
    group('message construction (80% cases)', () {
      test('creates simple text messages', () {
        final message = ChatMessage.user('Hello, world!');

        expect(message.role, equals(MessageRole.user));
        expect(message.parts.length, equals(1));
        expect(message.parts.first, isA<TextPart>());
        expect((message.parts.first as TextPart).text, equals('Hello, world!'));
      });

      test('creates system messages', () {
        final message = ChatMessage.system('You are a helpful assistant.');

        expect(message.role, equals(MessageRole.system));
        expect(message.parts.length, equals(1));
        expect(message.text, equals('You are a helpful assistant.'));
      });

      test('creates model messages', () {
        final message = ChatMessage.model('I can help you with that.');

        expect(message.role, equals(MessageRole.model));
        expect(message.parts.length, equals(1));
        expect(message.text, equals('I can help you with that.'));
      });

      test('creates messages with multiple text parts', () {
        final message = ChatMessage.userParts(const [
          TextPart('First part. '),
          TextPart('Second part. '),
          TextPart('Third part.'),
        ]);

        expect(message.parts.length, equals(3));
        expect(message.text, equals('First part. Second part. Third part.'));
      });

      test('creates empty messages', () {
        final message = ChatMessage.userParts(const []);

        expect(message.role, equals(MessageRole.user));
        expect(message.parts, isEmpty);
        expect(message.text, equals(''));
      });
    });

    group('role handling (80% cases)', () {
      test('supports all message roles', () {
        final userMsg = ChatMessage.user('user');
        final systemMsg = ChatMessage.system('system');
        final modelMsg = ChatMessage.model('model');

        expect(userMsg.role, equals(MessageRole.user));
        expect(systemMsg.role, equals(MessageRole.system));
        expect(modelMsg.role, equals(MessageRole.model));
      });

      test('role is immutable', () {
        final message = ChatMessage.user('test');

        // Role should be final/immutable
        expect(message.role, equals(MessageRole.user));

        // Creating new message with different role
        final newMessage = ChatMessage.modelParts(message.parts);
        expect(newMessage.role, equals(MessageRole.model));
        expect(message.role, equals(MessageRole.user)); // Original unchanged
      });

      test('role affects message behavior', () {
        final userMsg = ChatMessage.user('question');
        final modelMsg = ChatMessage.model('answer');

        // In a conversation, user messages typically come before model messages
        final conversation = [userMsg, modelMsg];
        expect(conversation.first.role, equals(MessageRole.user));
        expect(conversation.last.role, equals(MessageRole.model));
      });
    });

    group('part types (80% cases)', () {
      test('text parts', () {
        final message = ChatMessage.userParts(const [TextPart('Hello')]);

        final part = message.parts.first as TextPart;
        expect(part.text, equals('Hello'));
      });

      test('data parts with images', () {
        final imageData = Uint8List.fromList([137, 80, 78, 71]); // PNG header
        final message = ChatMessage.userParts([
          const TextPart('Here is an image:'),
          DataPart(mimeType: 'image/png', bytes: imageData),
        ]);

        expect(message.parts.length, equals(2));
        expect(message.parts[1], isA<DataPart>());

        final dataPart = message.parts[1] as DataPart;
        expect(dataPart.mimeType, equals('image/png'));
        expect(dataPart.bytes, equals(imageData));
      });

      test('tool parts', () {
        const toolPart = ToolPart.call(
          id: 'call_123',
          name: 'calculator',
          arguments: {'operation': 'add', 'a': 5, 'b': 3},
        );

        final message = ChatMessage.modelParts(const [
          TextPart("I'll calculate that for you."),
          toolPart,
        ]);

        expect(message.parts.length, equals(2));
        expect(message.parts[1], isA<ToolPart>());

        final part = message.parts[1] as ToolPart;
        expect(part.id, equals('call_123'));
        expect(part.name, equals('calculator'));
        expect(part.kind, equals(ToolPartKind.call));
      });

      test('tool result parts', () {
        const toolResult = ToolPart.result(
          id: 'call_123',
          name: 'calculator',
          result: {'result': 8},
        );

        final message = ChatMessage.userParts(const [toolResult]);

        expect(message.hasToolResults, isTrue);
        expect(message.toolResults.length, equals(1));

        final result = message.toolResults.first;
        expect(result.id, equals('call_123'));
        expect(result.result, equals({'result': 8}));
      });

      test('mixed part types in single message', () {
        final imageData = Uint8List.fromList([0xFF, 0xD8, 0xFF]); // JPEG header
        final message = ChatMessage.userParts([
          const TextPart('Process this image and calculate: '),
          DataPart(mimeType: 'image/jpeg', bytes: imageData),
          const ToolPart.result(
            id: 'calc_456',
            name: 'calc',
            result: {'sum': 42},
          ),
        ]);

        expect(message.parts.length, equals(3));
        expect(message.text, contains('Process this image'));
        expect(message.hasToolResults, isTrue);
      });
    });

    group('message helpers (80% cases)', () {
      test('text property concatenates text parts', () {
        final message = ChatMessage.userParts(const [
          TextPart('Hello '),
          TextPart('world!'),
        ]);

        expect(message.text, equals('Hello world!'));
      });

      test('text property with non-text parts', () {
        final message = ChatMessage.userParts([
          const TextPart('Hello '),
          DataPart(mimeType: 'image/png', bytes: Uint8List(0)),
          const TextPart('world'),
          const TextPart('!'),
        ]);

        expect(message.text, equals('Hello world!'));
      });

      test('hasToolCalls detects tool calls', () {
        final withTools = ChatMessage.modelParts(const [
          ToolPart.call(
            id: 'call_1',
            name: 'search',
            arguments: {'query': 'test'},
          ),
        ]);
        final withoutTools = ChatMessage.model('response');

        expect(withTools.hasToolCalls, isTrue);
        expect(withoutTools.hasToolCalls, isFalse);
      });

      test('hasToolResults detects tool results', () {
        final withResults = ChatMessage.userParts(const [
          ToolPart.result(
            id: 'call_1',
            name: 'search',
            result: {'data': 'result'},
          ),
        ]);
        final withoutResults = ChatMessage.user('hello');

        expect(withResults.hasToolResults, isTrue);
        expect(withoutResults.hasToolResults, isFalse);
      });

      test('toolCalls returns all tool calls', () {
        final message = ChatMessage.modelParts(const [
          TextPart("I'll help with both tasks"),
          ToolPart.call(
            id: 'call_1',
            name: 'search',
            arguments: {'query': 'weather'},
          ),
          ToolPart.call(
            id: 'call_2',
            name: 'calculator',
            arguments: {'expression': '2+2'},
          ),
        ]);

        expect(message.toolCalls.length, equals(2));
        expect(message.toolCalls[0].name, equals('search'));
        expect(message.toolCalls[1].name, equals('calculator'));
      });

      test('toolResults returns all tool results', () {
        final message = ChatMessage.userParts(const [
          ToolPart.result(
            id: 'call_1',
            name: 'weather',
            result: {'weather': 'sunny'},
          ),
          ToolPart.result(
            id: 'call_2',
            name: 'calculator',
            result: {'result': 4},
          ),
        ]);

        expect(message.toolResults.length, equals(2));
        expect(message.toolResults[0].result, equals({'weather': 'sunny'}));
        expect(message.toolResults[1].result, equals({'result': 4}));
      });
    });

    group('edge cases', () {
      test('handles empty text parts', () {
        final emptyText = ChatMessage.userParts(const [TextPart('')]);
        expect(emptyText.text, equals(''));

        // Data part with empty bytes
        final emptyData = ChatMessage.userParts([
          DataPart(mimeType: 'image/png', bytes: Uint8List(0)),
        ]);
        expect(emptyData.parts.first, isA<DataPart>());
      });

      test('handles very long text content', () {
        final longText = 'A' * 10000; // 10,000 character string
        final message = ChatMessage.user(longText);

        expect(message.text, equals(longText));
        expect(message.text.length, equals(10000));
      });

      test('handles messages with many parts', () {
        final parts = <Part>[];
        for (var i = 0; i < 100; i++) {
          parts.add(TextPart('Part $i. '));
        }

        final message = ChatMessage.userParts(parts);
        expect(message.parts.length, equals(100));
        expect(message.text, contains('Part 0'));
        expect(message.text, contains('Part 99'));
      });

      test('handles mixed empty and non-empty parts', () {
        final message = ChatMessage.userParts(const [
          TextPart(''),
          TextPart('Hello'),
          TextPart(''),
          TextPart('World'),
          TextPart(''),
        ]);

        expect(message.parts.length, equals(5));
        expect(message.text, equals('HelloWorld'));
      });

      test('handles tool calls with empty arguments', () {
        final message = ChatMessage.modelParts(const [
          ToolPart.call(id: 'call_empty', name: 'no_args_tool', arguments: {}),
        ]);

        expect(message.hasToolCalls, isTrue);
        expect(message.toolCalls.first.arguments, isEmpty);
      });

      test('handles tool results with null values', () {
        final message = ChatMessage.userParts(const [
          ToolPart.result(
            id: 'call_null',
            name: 'tool',
            result: {'data': null, 'error': null},
          ),
        ]);

        expect(message.hasToolResults, isTrue);
        expect(message.toolResults.first.result['data'], isNull);
      });

      test('handles messages with only non-text parts', () {
        final message = ChatMessage.userParts([
          DataPart(mimeType: 'image/png', bytes: Uint8List(4)),
          const ToolPart.result(
            id: 'call_1',
            name: 'tool',
            result: {'data': 'test'},
          ),
        ]);

        expect(message.text, equals(''));
        expect(message.parts.length, equals(2));
        expect(message.hasToolResults, isTrue);
      });
    });
  });
}
