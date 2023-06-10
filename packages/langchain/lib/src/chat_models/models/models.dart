import 'package:meta/meta.dart';

import '../../language_models/models/models.dart';

/// Result returned by the chat model.
class ChatResult extends LanguageModelResult<ChatGeneration> {
  const ChatResult({
    required super.generations,
    super.tokensUsage,
    super.modelOutput,
  });

  @override
  String toString() {
    return '''
ChatResult{
  generations: $generations, 
  tokensUsage: $tokensUsage, 
  modelOutput: $modelOutput},
''';
  }
}

/// Output of a single generation.
class ChatGeneration extends LanguageModelGeneration<ChatMessage> {
  const ChatGeneration(
    super.output, {
    super.generationInfo,
  });

  @override
  String toString() {
    return '''
ChatGeneration{
  output: $output, 
  generationInfo: $generationInfo, 
''';
  }
}

/// A message that is part of a chat conversation.
@immutable
sealed class ChatMessage {
  const ChatMessage({
    required this.content,
  });

  /// Type of message that is a system message.
  factory ChatMessage.system(final String content) =>
      SystemChatMessage(content: content);

  /// Type of message that is spoken by the human.
  factory ChatMessage.human(
    final String content, {
    final bool example = false,
  }) =>
      HumanChatMessage(
        content: content,
        example: example,
      );

  /// Type of message that is spoken by the AI.
  factory ChatMessage.ai(
    final String content, {
    final bool example = false,
  }) =>
      AIChatMessage(
        content: content,
        example: example,
      );

  /// Chat message with custom role.
  factory ChatMessage.custom(
    final String content, {
    required final String role,
  }) =>
      CustomChatMessage(
        content: content,
        role: role,
      );

  /// The content of the message.
  final String content;
}

/// Type of message that is a system message.
class SystemChatMessage extends ChatMessage {
  const SystemChatMessage({
    required super.content,
  });

  @override
  bool operator ==(covariant final SystemChatMessage other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && content == other.content;

  @override
  int get hashCode => content.hashCode;

  @override
  String toString() {
    return '''
SystemChatMessage{
  content: $content,
}
''';
  }
}

/// Type of message that is spoken by the human.
class HumanChatMessage extends ChatMessage {
  const HumanChatMessage({
    required super.content,
    this.example = false,
  });

  /// Whether this message is an example.
  final bool example;

  @override
  bool operator ==(covariant final HumanChatMessage other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          content == other.content &&
          example == other.example;

  @override
  int get hashCode => content.hashCode ^ example.hashCode;

  @override
  String toString() {
    return '''
HumanChatMessage{
  content: $content,
  example: $example,
}
''';
  }
}

/// Type of message that is spoken by the AI.
class AIChatMessage extends ChatMessage {
  const AIChatMessage({
    required super.content,
    this.example = false,
  });

  /// Whether this message is an example.
  final bool example;

  @override
  bool operator ==(covariant final AIChatMessage other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          content == other.content &&
          example == other.example;

  @override
  int get hashCode => content.hashCode ^ example.hashCode;

  @override
  String toString() {
    return '''
AIChatMessage{
  content: $content,
  example: $example,
}
''';
  }
}

/// Chat message with custom role.
class CustomChatMessage extends ChatMessage {
  const CustomChatMessage({
    required super.content,
    required this.role,
  });

  /// The role of the author of this message.
  final String role;

  @override
  bool operator ==(covariant final CustomChatMessage other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          content == other.content &&
          role == other.role;

  @override
  int get hashCode => content.hashCode ^ role.hashCode;

  @override
  String toString() {
    return '''
CustomChatMessage{
  content: $content,
  role: $role,
}
''';
  }
}

/// Role of a chat message
enum ChatMessageRole { system, human, ai, custom }
