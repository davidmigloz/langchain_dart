import 'package:meta/meta.dart';

import '../../language_models/models/models.dart';

/// {@template chat_result}
/// Result returned by the chat model.
/// {@endtemplate}
@immutable
class ChatResult extends LanguageModelResult<ChatMessage> {
  /// {@macro chat_result}
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

  @override
  String get firstOutputAsString {
    return generations.firstOrNull?.output.content ?? '';
  }
}

/// {@template chat_generation}
/// Output of a single generation.
/// {@endtemplate}
@immutable
class ChatGeneration extends LanguageModelGeneration<ChatMessage> {
  /// {@macro chat_generation}
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

/// {@template chat_message}
/// A message that is part of a chat conversation.
/// {@endtemplate}
@immutable
sealed class ChatMessage {
  /// {@macro chat_message}
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

/// {@template system_chat_message}
/// Type of message that is a system message.
/// {@endtemplate}
@immutable
class SystemChatMessage extends ChatMessage {
  /// {@macro system_chat_message}
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

/// {@template human_chat_message}
/// Type of message that is spoken by the human.
/// {@endtemplate}
@immutable
class HumanChatMessage extends ChatMessage {
  /// {@macro human_chat_message}
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

/// {@template ai_chat_message}
/// Type of message that is spoken by the AI.
/// {@endtemplate}
@immutable
class AIChatMessage extends ChatMessage {
  /// {@macro ai_chat_message}
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

/// {@template custom_chat_message}
/// Chat message with custom role.
/// {@endtemplate}
@immutable
class CustomChatMessage extends ChatMessage {
  /// {@macro custom_chat_message}
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
