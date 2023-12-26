import 'package:collection/collection.dart';
import 'package:langchain/langchain.dart';
import 'package:ollama_dart/ollama_dart.dart';

/// Mapper for [GenerateCompletionResponse].
extension OllamaChatMessagesMapper on List<ChatMessage> {
  /// Converts a list of [ChatMessage] to a list of [Message].
  List<Message> toMessages() {
    return map((final message) {
      return switch (message) {
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
        FunctionChatMessage() =>
          throw UnsupportedError('Ollama does not support function calls'),
        CustomChatMessage() =>
          throw UnsupportedError('Ollama does not support custom messages'),
      };
    }).expand((final messages) => messages).toList(growable: false);
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

/// Mapper for [GenerateChatCompletionResponse].
extension ChatResultMapper on GenerateChatCompletionResponse {
  /// Converts a [GenerateChatCompletionResponse] to a [ChatResult].
  ChatResult toChatResult(final String id, {final bool streaming = false}) {
    return ChatResult(
      id: id,
      generations: [_toChatGeneration()],
      usage: _toLanguageModelUsage(),
      modelOutput: {
        'created_at': createdAt,
        'model': model,
      },
      streaming: streaming,
    );
  }

  ChatGeneration _toChatGeneration() {
    return ChatGeneration(
      AIChatMessage(
        content: message?.content ?? '',
      ),
      generationInfo: {
        'done': done,
        'total_duration': totalDuration,
        'load_duration': loadDuration,
        'prompt_eval_count': promptEvalCount,
        'prompt_eval_duration': promptEvalDuration,
        'eval_count': evalCount,
        'eval_duration': evalDuration,
      },
    );
  }

  LanguageModelUsage _toLanguageModelUsage() {
    return LanguageModelUsage(
      promptTokens: promptEvalCount,
      responseTokens: evalCount,
      totalTokens: (promptEvalCount != null && evalCount != null)
          ? promptEvalCount! + evalCount!
          : null,
    );
  }
}
