// ignore_for_file: public_member_api_docs
import 'package:collection/collection.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:ollama_dart/ollama_dart.dart';

extension OllamaToolChatMessagesMapper on List<ChatMessage> {
  List<Message> toMessages() {
    return map(_mapMessage).expand((final msg) => msg).toList(growable: false);
  }

  List<Message> _mapMessage(final ChatMessage msg) {
    return switch (msg) {
      final SystemChatMessage msg => [
          Message(
            role: MessageRole.system,
            content: msg.content,
          ),
        ],
      final HumanChatMessage msg => _mapHumanMessage(msg),
      final AIChatMessage msg => [
          Message(
            role: MessageRole.assistant,
            content: msg.content,
          ),
        ],
      final ToolChatMessage msg => [
          Message(
            role: MessageRole.user,
            content: '{tool_answer: ${msg.content}}',
          ),
        ],
      CustomChatMessage() =>
        throw UnsupportedError('Ollama does not support custom messages'),
    };
  }

  List<Message> _mapHumanMessage(final HumanChatMessage message) {
    return switch (message.content) {
      final ChatMessageContentText c => [
          Message(
            role: MessageRole.user,
            content: c.text,
          ),
        ],
      final ChatMessageContentImage c => [
          Message(
            role: MessageRole.user,
            content: c.data,
          ),
        ],
      final ChatMessageContentMultiModal c => _mapContentMultiModal(c),
    };
  }

  List<Message> _mapContentMultiModal(
    final ChatMessageContentMultiModal content,
  ) {
    final parts = content.parts.groupListsBy((final p) => p.runtimeType);

    if ((parts[ChatMessageContentMultiModal]?.length ?? 0) > 0) {
      throw UnsupportedError(
        'Cannot have multimodal content in multimodal content',
      );
    }

    // If there's only one text part and the rest are images, then we combine them in one message
    if ((parts[ChatMessageContentText]?.length ?? 0) == 1) {
      return [
        Message(
          role: MessageRole.user,
          content:
              (parts[ChatMessageContentText]!.first as ChatMessageContentText)
                  .text,
          images: parts[ChatMessageContentImage]
              ?.map((final p) => (p as ChatMessageContentImage).data)
              .toList(growable: false),
        ),
      ];
    }

    // Otherwise, we return the parts as separate messages
    return content.parts
        .map(
          (final p) => switch (p) {
            final ChatMessageContentText c => Message(
                role: MessageRole.user,
                content: c.text,
              ),
            final ChatMessageContentImage c => Message(
                role: MessageRole.user,
                content: c.data,
              ),
            ChatMessageContentMultiModal() => throw UnsupportedError(
                'Cannot have multimodal content in multimodal content',
              ),
          },
        )
        .toList(growable: false);
  }
}
