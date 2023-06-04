/// Output of a single generation.
class Generation {
  const Generation({
    required this.text,
    this.generationInfo,
  });

  /// Generated text output.
  final String text;

  /// Raw generation info response from the provider.
  /// May include things like reason for finishing (e.g. in OpenAI)
  final Map<String, dynamic>? generationInfo;
}

/// Message object.
abstract class BaseMessage {
  const BaseMessage({
    required this.content,
    this.params = const {},
  });

  final String content;
  final Map<String, dynamic> params;

  /// Type of the message, used for serialization.
  String get type;
}

/// Type of message that is spoken by the human.
class HumanMessage extends BaseMessage {
  const HumanMessage({
    required super.content,
    super.params,
    this.example = false,
  });

  final bool example;

  @override
  String get type => 'human';
}

/// Type of message that is spoken by the AI.
class AIMessage extends BaseMessage {
  const AIMessage({
    required super.content,
    super.params,
    this.example = false,
  });

  final bool example;

  @override
  String get type => 'ai';
}

/// Type of message that is a system message.
class SystemMessage extends BaseMessage {
  const SystemMessage({
    required super.content,
    super.params,
  });

  @override
  String get type => 'system';
}

/// Type of message with arbitrary speaker.
class ChatMessage extends BaseMessage {
  const ChatMessage({
    required super.content,
    super.params,
    required this.role,
  });

  final String role;

  @override
  String get type => 'chat';
}

/// Output of a single generation.
class ChatGeneration extends Generation {
  const ChatGeneration({
    super.text = '',
    super.generationInfo,
    required this.message,
  });

  final BaseMessage message;
}

/// Class that contains all relevant information for a Chat Result.
class ChatResult {
  const ChatResult({
    required this.generations,
    this.llmOutput,
  });

  /// List of the things generated.
  final List<ChatGeneration> generations;

  /// For arbitrary LLM provider specific output.
  final Map<String, dynamic>? llmOutput;
}

/// Class that contains all relevant information for an LLM Result.
class LLMResult {
  const LLMResult({
    required this.generations,
    this.llmOutput,
  });

  /// List of the things generated.
  /// This is List[List[]] because each input could have multiple generations.
  final List<List<Generation>> generations;

  /// For arbitrary LLM provider specific output.
  final Map<String, dynamic>? llmOutput;
}

abstract class PromptValue {
  @override
  String toString();

  /// Return prompt as messages
  List<BaseMessage> toMessages();
}

/// Get buffer string of messages
String getBufferString({
  required final List<BaseMessage> messages,
  final String humanPrefix = 'Human',
  final String aiPrefix = 'AI',
}) {
  return messages
      .map(
        (final m) => switch (m) {
          HumanMessage _ => humanPrefix,
          AIMessage _ => aiPrefix,
          SystemMessage _ => 'System',
          final ChatMessage m => m.role,
          _ => throw ArgumentError('Got unsupported message type: $m'),
        },
      )
      .join('\n');
}
