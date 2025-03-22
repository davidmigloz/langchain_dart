import 'dart:convert';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:test/test.dart';

void main() {
  group('ChatModel Types Serialization', () {
    test('ChatPromptValue', () {
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
            ),
          ],
        ),
        ChatMessage.tool(toolCallId: 'some-id2', content: 'Tool Call content'),
        ChatMessage.custom('huh?', role: 'internal-monologue'),
      ];
      final promptValue = PromptValue.chat(testMessages);

      // Basic encode/decode re-encode check
      expect(
        jsonEncode(PromptValue.fromMap(promptValue.toMap()).toMap()),
        jsonEncode(promptValue.toMap()),
      );
    });

    test('StringPromptValue', () {
      final promptValue = PromptValue.string('This is a test prompt');

      // Basic encode/decode re-encode check
      expect(
        jsonEncode(PromptValue.fromMap(promptValue.toMap()).toMap()),
        jsonEncode(promptValue.toMap()),
      );
    });

    test('ChatToolChoice', () {
      // Test ChatToolChoiceNone
      const noneChoice = ChatToolChoiceNone();
      final noneMap = noneChoice.toMap();
      final decodedNone = ChatToolChoice.fromMap(noneMap);
      expect(decodedNone, isA<ChatToolChoiceNone>());

      // Test ChatToolChoiceAuto
      const autoChoice = ChatToolChoiceAuto();
      final autoMap = autoChoice.toMap();
      final decodedAuto = ChatToolChoice.fromMap(autoMap);
      expect(decodedAuto, isA<ChatToolChoiceAuto>());

      // Test ChatToolChoiceRequired
      const requiredChoice = ChatToolChoiceRequired();
      final requiredMap = requiredChoice.toMap();
      final decodedRequired = ChatToolChoice.fromMap(requiredMap);
      expect(decodedRequired, isA<ChatToolChoiceRequired>());

      // Test ChatToolChoiceForced
      const forcedChoice = ChatToolChoiceForced(name: 'testTool');
      final forcedMap = forcedChoice.toMap();
      final decodedForced = ChatToolChoice.fromMap(forcedMap);
      expect(decodedForced, isA<ChatToolChoiceForced>());
      expect((decodedForced as ChatToolChoiceForced).name, 'testTool');
    });

    test('ChatMessageContent', () {
      // Test text content
      final textContent = ChatMessageContent.text('Test text');
      final textMap = textContent.toMap();
      final decodedText = ChatMessageContent.fromMap(textMap);
      expect(decodedText, isA<ChatMessageContentText>());
      expect((decodedText as ChatMessageContentText).text, 'Test text');

      // Test image content
      final imageContent = ChatMessageContent.image(
        data: 'image-data',
        mimeType: 'image/png',
        imageDetail: ChatMessageContentImageDetail.high,
      );
      final imageMap = imageContent.toMap();
      final decodedImage = ChatMessageContent.fromMap(imageMap);
      expect(decodedImage, isA<ChatMessageContentImage>());
      expect((decodedImage as ChatMessageContentImage).data, 'image-data');
      expect(decodedImage.mimeType, 'image/png');
      expect(decodedImage.detail, ChatMessageContentImageDetail.high);

      // Test multi-modal content
      final multiModalContent = ChatMessageContent.multiModal([
        ChatMessageContent.text('Text part'),
        ChatMessageContent.image(data: 'image-part'),
      ]);
      final multiModalMap = multiModalContent.toMap();
      final decodedMultiModal = ChatMessageContent.fromMap(multiModalMap);
      expect(decodedMultiModal, isA<ChatMessageContentMultiModal>());
      expect(
        (decodedMultiModal as ChatMessageContentMultiModal).parts.length,
        2,
      );
      expect(decodedMultiModal.parts[0], isA<ChatMessageContentText>());
      expect(decodedMultiModal.parts[1], isA<ChatMessageContentImage>());
    });

    test('Error handling', () {
      // Test missing type
      expect(
        () => PromptValue.fromMap(const <String, dynamic>{}),
        throwsArgumentError,
      );
      expect(
        () => ChatMessage.fromMap(const <String, dynamic>{}),
        throwsArgumentError,
      );
      expect(
        () => ChatMessageContent.fromMap(const <String, dynamic>{}),
        throwsArgumentError,
      );
      expect(
        () => ChatToolChoice.fromMap(const <String, dynamic>{}),
        throwsArgumentError,
      );

      // Test unknown type
      expect(
        () => PromptValue.fromMap(const <String, dynamic>{'type': 'unknown'}),
        throwsArgumentError,
      );
      expect(
        () => ChatMessage.fromMap(const <String, dynamic>{'type': 'unknown'}),
        throwsUnimplementedError,
      );
      expect(
        () => ChatMessageContent.fromMap(
          const <String, dynamic>{'type': 'unknown'},
        ),
        throwsUnimplementedError,
      );
      expect(
        () =>
            ChatToolChoice.fromMap(const <String, dynamic>{'type': 'unknown'}),
        throwsUnimplementedError,
      );
    });

    test('Complete serialization flow', () {
      // Use different tool choices
      final toolChoices = [
        ChatToolChoice.none,
        ChatToolChoice.auto,
        ChatToolChoice.required,
        ChatToolChoice.forced(name: 'calculator'),
      ];

      // Serialize and deserialize each
      for (final choice in toolChoices) {
        final choiceMap = choice.toMap();
        final deserializedChoice = ChatToolChoice.fromMap(choiceMap);

        // Check type is preserved
        expect(deserializedChoice.runtimeType, choice.runtimeType);

        // For forced choice, check name is preserved
        if (choice is ChatToolChoiceForced) {
          expect(
            (deserializedChoice as ChatToolChoiceForced).name,
            'calculator',
          );
        }
      }
    });
  });
}
