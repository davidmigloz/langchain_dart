import '../../language_models/models/models.dart';

/// Result returned by the chat model.
class ChatResult extends LanguageModelResult<ChatGeneration> {
  const ChatResult({
    required super.generations,
    super.tokensUsage,
    super.modelOutput,
  });
}

/// Output of a single generation.
class ChatGeneration extends LanguageModelGeneration<ChatMessage> {
  const ChatGeneration(
    super.output, {
    super.generationInfo,
  });
}

/// A message that is part of a chat conversation.
class ChatMessage {
  const ChatMessage({
    required this.role,
    required this.content,
    this.example = false,
  });

  /// Type of message that is spoken by the human.
  factory ChatMessage.human(
    final String content, {
    final bool example = false,
  }) =>
      ChatMessage(
        role: ChatMessageRole.human,
        content: content,
        example: example,
      );

  /// Type of message that is spoken by the AI.
  factory ChatMessage.ai(
    final String content, {
    final bool example = false,
  }) =>
      ChatMessage(
        role: ChatMessageRole.ai,
        content: content,
        example: example,
      );

  /// Type of message that is a system message.
  factory ChatMessage.system(final String content) => ChatMessage(
        role: ChatMessageRole.system,
        content: content,
      );

  /// The [role] of the message.
  final ChatMessageRole role;

  /// The [content] of the message.
  final String content;

  /// Whether this message is an example.
  final bool example;

  @override
  String toString() => content;
}

/// The role of the author of this message.
enum ChatMessageRole { human, ai, system }
