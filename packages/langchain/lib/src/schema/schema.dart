export 'output_parser.dart';

typedef InputValues = Map<String, Object>;

typedef PartialValues = Map<String, Object>;

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

enum MessageType {
  human,
  ai,
  generic,
  system,
}

/// Message object.
abstract class BaseChatMessage {
  const BaseChatMessage({
    required this.content,
    this.params = const {},
  });

  final String content;
  final Map<String, dynamic> params;

  /// Type of the message, used for serialization.
  MessageType get type;
}

/// Type of message that is spoken by the human.
class HumanChatMessage extends BaseChatMessage {
  const HumanChatMessage({
    required super.content,
    super.params,
    this.example = false,
  });

  final bool example;

  @override
  MessageType get type => MessageType.human;
}

/// Type of message that is spoken by the AI.
class AIChatMessage extends BaseChatMessage {
  const AIChatMessage({
    required super.content,
    super.params,
    this.example = false,
  });

  final bool example;

  @override
  MessageType get type => MessageType.ai;
}

/// Type of message that is a system message.
class SystemChatMessage extends BaseChatMessage {
  const SystemChatMessage({
    required super.content,
    super.params,
  });

  @override
  MessageType get type => MessageType.system;
}

/// Type of message with arbitrary speaker.
class ChatMessage extends BaseChatMessage {
  const ChatMessage({
    required super.content,
    super.params,
    required this.role,
  });

  final String role;

  @override
  MessageType get type => MessageType.generic;
}

/// Output of a single generation.
class ChatGeneration extends Generation {
  const ChatGeneration({
    super.text = '',
    super.generationInfo,
    required this.message,
  });

  final BaseChatMessage message;
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

/// Base PromptValue class. All prompt values should extend this class.
abstract interface class BasePromptValue {
  @override
  String toString();

  /// Return prompt as messages
  List<BaseChatMessage> toMessages();
}

/// Get buffer string of messages
String getBufferString({
  required final List<BaseChatMessage> messages,
  final String humanPrefix = 'Human',
  final String aiPrefix = 'AI',
}) {
  return messages.map(
    (final m) {
      final role = switch (m) {
        HumanChatMessage _ => humanPrefix,
        AIChatMessage _ => aiPrefix,
        SystemChatMessage _ => 'System',
        final ChatMessage m => m.role,
        _ => throw ArgumentError('Got unsupported message type: $m'),
      };
      return '$role: ${m.content}';
    },
  ).join('\n');
}
