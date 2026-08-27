import 'package:langchain_core/chat_models.dart';
import 'package:test/test.dart';

void main() {
  group('AIChatMessage ordered content blocks', () {
    test('preserves order and derives tool calls', () {
      const firstCall = AIChatMessageToolCall(
        id: 'call-1',
        name: 'weather',
        argumentsRaw: '{}',
        arguments: {},
      );
      const message = AIChatMessage.withBlocks(
        contentBlocks: [
          AIChatMessageReasoningBlock(reasoning: 'check', index: 0),
          firstCall,
          AIChatMessageTextBlock(text: 'sunny', index: 2),
        ],
      );

      expect(message.contentBlocks, [
        isA<AIChatMessageReasoningBlock>(),
        same(firstCall),
        isA<AIChatMessageTextBlock>(),
      ]);
      expect(message.toolCalls, [firstCall]);
      expect(message.content, 'checksunny');
    });

    test('round-trips canonical and legacy serialization', () {
      const message = AIChatMessage.withBlocks(
        legacyContent: 'legacy projection',
        contentBlocks: [
          AIChatMessageReasoningBlock(
            reasoning: 'hidden',
            id: 'reasoning-1',
            isMergeable: false,
            providerData: {
              'anthropic': {'signature': 'opaque'},
            },
          ),
          AIChatMessageTextBlock(text: 'visible', id: 'text-1'),
          AIChatMessageToolCall(
            id: 'call-1',
            index: 2,
            name: 'weather',
            argumentsRaw: '{"city":"Madrid"}',
            arguments: {'city': 'Madrid'},
          ),
        ],
      );

      final map = message.toMap();
      final restored = AIChatMessage.fromMap(map);

      expect(map['content'], 'legacy projection');
      expect(map['toolCalls'], hasLength(1));
      expect(map['contentBlocks'], hasLength(3));
      expect(
        (map['contentBlocks'] as List).first,
        containsPair('isMergeable', false),
      );
      expect(restored, message);
      expect(restored.content, 'legacy projection');
    });

    test('reads legacy maps without tool calls', () {
      final message = AIChatMessage.fromMap(const {
        'type': 'ai',
        'content': 'hello',
      });

      expect(message.content, 'hello');
      expect(message.contentBlocks.single, isA<AIChatMessageTextBlock>());
      expect(message.toolCalls, isEmpty);
    });
  });

  group('AIChatMessage block streaming', () {
    test('merges only matching stable stream identities', () {
      const first = AIChatMessage.withBlocks(
        contentBlocks: [
          AIChatMessageTextBlock(text: 'hel', index: 0),
          AIChatMessageReasoningBlock(reasoning: 'rea', index: 1),
        ],
      );
      const second = AIChatMessage.withBlocks(
        contentBlocks: [
          AIChatMessageTextBlock(text: 'lo', index: 0),
          AIChatMessageReasoningBlock(reasoning: 'son', index: 1),
        ],
      );

      final result = first.concat(second);

      expect((result.contentBlocks[0] as AIChatMessageTextBlock).text, 'hello');
      expect(
        (result.contentBlocks[1] as AIChatMessageReasoningBlock).reasoning,
        'reason',
      );
    });

    test('keeps parallel same-name calls separate by stream index', () {
      const starts = AIChatMessage.withBlocks(
        contentBlocks: [
          AIChatMessageToolCall(
            id: '',
            index: 0,
            name: 'weather',
            argumentsRaw: '{"city":',
            arguments: {},
          ),
          AIChatMessageToolCall(
            id: '',
            index: 1,
            name: 'weather',
            argumentsRaw: '{"city":',
            arguments: {},
          ),
        ],
      );
      const finishes = AIChatMessage.withBlocks(
        contentBlocks: [
          AIChatMessageToolCall(
            id: '',
            index: 0,
            name: '',
            argumentsRaw: '"Madrid"}',
            arguments: {'city': 'Madrid'},
          ),
          AIChatMessageToolCall(
            id: '',
            index: 1,
            name: '',
            argumentsRaw: '"Paris"}',
            arguments: {'city': 'Paris'},
          ),
        ],
      );

      final calls = starts.concat(finishes).toolCalls;

      expect(calls, hasLength(2));
      expect(calls[0].arguments, {'city': 'Madrid'});
      expect(calls[1].arguments, {'city': 'Paris'});
      expect(calls[0].argumentsRaw, '{"city":"Madrid"}');
      expect(calls[1].argumentsRaw, '{"city":"Paris"}');
    });

    test('does not merge blocks without an id or index', () {
      const first = AIChatMessage.withBlocks(
        contentBlocks: [AIChatMessageTextBlock(text: 'one')],
      );
      const second = AIChatMessage.withBlocks(
        contentBlocks: [AIChatMessageTextBlock(text: 'two')],
      );

      expect(first.concat(second).contentBlocks, hasLength(2));
    });

    test('does not let a matching index override different stable ids', () {
      const first = AIChatMessage.withBlocks(
        contentBlocks: [
          AIChatMessageTextBlock(text: 'one', id: 'block-1', index: 0),
        ],
      );
      const second = AIChatMessage.withBlocks(
        contentBlocks: [
          AIChatMessageTextBlock(text: 'two', id: 'block-2', index: 0),
        ],
      );

      expect(first.concat(second).contentBlocks, hasLength(2));
    });

    test('retains completed provider part boundaries', () {
      const first = AIChatMessage.withBlocks(
        contentBlocks: [
          AIChatMessageTextBlock(text: 'answer', id: 'part-0', index: 0),
        ],
      );
      const signedBoundary = AIChatMessage.withBlocks(
        contentBlocks: [
          AIChatMessageTextBlock(
            text: '',
            id: 'part-0',
            index: 0,
            isMergeable: false,
          ),
        ],
      );

      final result = first.concat(signedBoundary);

      expect(result.contentBlocks, hasLength(2));
      expect(
        result.contentBlocks.last,
        isA<AIChatMessageTextBlock>().having(
          (block) => block.isMergeable,
          'isMergeable',
          isFalse,
        ),
      );
    });
  });
}
