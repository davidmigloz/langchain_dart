import 'dart:convert';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:test/test.dart';

void main() {
  group('Map Serialization', () {
    /// Test messages for testing serialization. Designed to cover every possible novel property in the models.
    final testMessages = <ChatMessage>[
      ChatMessage.system('This is a system prompt'),
      ChatMessage.human(
        ChatMessageContent.multiModal([
          // Tests all message content parts
          ChatMessageContent.text('Basic Text'),
          ChatMessageContent.image(
            data: 'not-real-image-data',
            imageDetail: ChatMessageContentImageDetail.low,
            mimeType: 'any/fake',
          ),
        ]),
      ),
      ChatMessage.ai(
        'Assistant Response',
        toolCalls: const [
          AIChatMessageToolCall(
            id: 'some-id',
            name: 'some name',
            argumentsRaw: '{"a": 1, "b": 2}',
            arguments: {'a': 1, 'b': 2},
          ),
          AIChatMessageToolCall(
            id: 'some-id2',
            name: 'some name',
            argumentsRaw: '{"c": 3, "d": 4}',
            arguments: {'c': 3, 'd': 4},
          )
        ],
      ),
      ChatMessage.tool(toolCallId: 'some-id2', content: 'Tool Call content'),
      ChatMessage.custom('huh?', role: 'internal-monologue'),
    ];

    test('Prompt Values', () async {
      final promptValue = PromptValue.chat(testMessages);

      // Basic encode/decode re-encode check
      expect(jsonEncode(PromptValue.fromMap(promptValue.toMap()).toMap()),
          jsonEncode(promptValue.toMap()));
    });
  });
}
