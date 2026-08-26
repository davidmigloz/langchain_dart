import 'package:anthropic_sdk_dart/anthropic_sdk_dart.dart' as a;
import 'package:langchain_anthropic/src/chat_models/mappers.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:test/test.dart';

void main() {
  group('Anthropic ordered content blocks', () {
    test('preserves thinking, tool-use order, signature, and replay', () {
      const responseBlocks = <a.ContentBlock>[
        a.ThinkingBlock(thinking: 'reasoning', signature: 'opaque-signature'),
        a.ToolUseBlock(
          id: 'call-1',
          name: 'weather',
          input: {'city': 'Madrid'},
        ),
        a.TextBlock(text: 'It is sunny.'),
        a.ServerToolUseBlock(
          id: 'server-1',
          name: 'web_search',
          input: {'query': 'weather'},
        ),
      ];
      const message = a.Message(
        id: 'message-1',
        content: responseBlocks,
        model: 'claude-sonnet-4-5',
        usage: a.Usage(inputTokens: 10, outputTokens: 20),
      );

      final output = message.toChatResult().output;
      final replayed = <ChatMessage>[output].toInputMessages().single;

      expect(output.content.map((block) => block.runtimeType), [
        AIChatMessageReasoningBlock,
        AIChatMessageToolCall,
        AIChatMessageTextBlock,
        AIChatMessageServerToolCall,
      ]);
      expect(output.contentAsString, 'It is sunny.');
      expect(
        (output.content.first.providerData['anthropic']
            as Map<String, dynamic>)['signature'],
        'opaque-signature',
      );
      expect(
        replayed.toJson()['content'],
        responseBlocks.map((block) => block.toJson()).toList(),
      );
    });

    test('preserves redacted and future content blocks', () {
      final responseBlocks = <a.ContentBlock>[
        const a.RedactedThinkingBlock(data: 'encrypted'),
        a.ContentBlock.fromJson({
          'type': 'future_block',
          'payload': {'value': 1},
        }),
      ];
      final message = a.Message(
        id: 'message-1',
        content: responseBlocks,
        model: 'claude-sonnet-4-5',
        usage: const a.Usage(inputTokens: 1, outputTokens: 1),
      );

      final output = message.toChatResult().output;
      final replayed = <ChatMessage>[output].toInputMessages().single;

      expect(output.content.first, isA<AIChatMessageReasoningBlock>());
      expect(output.content.last, isA<AIChatMessageNonStandardBlock>());
      expect(
        replayed.toJson()['content'],
        responseBlocks.map((block) => block.toJson()).toList(),
      );
    });
  });

  group('Anthropic streaming content blocks', () {
    test(
      'applies signature delta to its reasoning block and replays it',
      () async {
        final events = <a.MessageStreamEvent>[
          const a.MessageStartEvent(
            message: a.Message(
              id: 'message-1',
              content: [],
              model: 'claude-sonnet-4-5',
              usage: a.Usage(inputTokens: 10, outputTokens: 0),
            ),
          ),
          const a.ContentBlockStartEvent(
            index: 0,
            contentBlock: a.ThinkingBlock(thinking: '', signature: ''),
          ),
          const a.ContentBlockDeltaEvent(
            index: 0,
            delta: a.ThinkingDelta('reasoning'),
          ),
          const a.ContentBlockDeltaEvent(
            index: 0,
            delta: a.SignatureDelta('opaque-signature'),
          ),
          const a.ContentBlockStartEvent(
            index: 1,
            contentBlock: a.ToolUseBlock(
              id: 'call-1',
              name: 'weather',
              input: {},
            ),
          ),
          const a.ContentBlockDeltaEvent(
            index: 1,
            delta: a.InputJsonDelta('{"city":'),
          ),
          const a.ContentBlockDeltaEvent(
            index: 1,
            delta: a.InputJsonDelta('"Madrid"}'),
          ),
          const a.ContentBlockStartEvent(
            index: 2,
            contentBlock: a.TextBlock(text: ''),
          ),
          const a.ContentBlockDeltaEvent(
            index: 2,
            delta: a.TextDelta('It is sunny.'),
          ),
        ];

        final results = await MessageStreamEventTransformer()
            .bind(Stream.fromIterable(events))
            .toList();
        final output = results
            .map((result) => result.output)
            .reduce((first, next) => first.concat(next));
        final reasoning = output.content[0] as AIChatMessageReasoningBlock;
        final toolCall = output.content[1] as AIChatMessageToolCall;
        final replayed = <ChatMessage>[output].toInputMessages().single;

        expect(reasoning.reasoning, 'reasoning');
        expect(
          (reasoning.providerData['anthropic']
              as Map<String, dynamic>)['signature'],
          'opaque-signature',
        );
        expect(toolCall.arguments, {'city': 'Madrid'});
        expect(output.contentAsString, 'It is sunny.');
        expect(replayed.toJson()['content'], [
          {
            'type': 'thinking',
            'thinking': 'reasoning',
            'signature': 'opaque-signature',
          },
          {
            'type': 'tool_use',
            'id': 'call-1',
            'name': 'weather',
            'input': {'city': 'Madrid'},
          },
          {'type': 'text', 'text': 'It is sunny.'},
        ]);
      },
    );

    test('keeps parallel same-name calls correlated by index', () async {
      final transformer = MessageStreamEventTransformer();
      final events = <a.MessageStreamEvent>[
        const a.MessageStartEvent(
          message: a.Message(
            id: 'message-1',
            content: [],
            model: 'claude-sonnet-4-5',
            usage: a.Usage(inputTokens: 1, outputTokens: 0),
          ),
        ),
        const a.ContentBlockStartEvent(
          index: 0,
          contentBlock: a.ToolUseBlock(
            id: 'call-madrid',
            name: 'weather',
            input: {},
          ),
        ),
        const a.ContentBlockStartEvent(
          index: 1,
          contentBlock: a.ToolUseBlock(
            id: 'call-paris',
            name: 'weather',
            input: {},
          ),
        ),
        const a.ContentBlockDeltaEvent(
          index: 0,
          delta: a.InputJsonDelta('{"city":"Madrid"}'),
        ),
        const a.ContentBlockDeltaEvent(
          index: 1,
          delta: a.InputJsonDelta('{"city":"Paris"}'),
        ),
      ];

      final results = await transformer
          .bind(Stream.fromIterable(events))
          .toList();
      final calls = results
          .map((result) => result.output)
          .reduce((first, next) => first.concat(next))
          .toolCalls;

      expect(calls.map((call) => call.id), ['call-madrid', 'call-paris']);
      expect(calls.map((call) => call.arguments['city']), ['Madrid', 'Paris']);
    });
  });
}
