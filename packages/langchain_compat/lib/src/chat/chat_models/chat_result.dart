import '../../language_models/language_models.dart';
import 'chat_message.dart';

/// Result returned by the Chat Model.
class ChatResult<T extends Object> extends LanguageModelResult<T> {
  /// Creates a new chat result instance.
  const ChatResult({
    required super.id,
    required super.output,
    required super.finishReason,
    required super.metadata,
    required super.usage,
    this.messages = const [],
  });

  /// The new messages generated during this chat interaction.
  final List<ChatMessage> messages;

  @override
  String get outputAsString =>
      output is String ? output as String : output.toString();

  @override
  String toString() =>
      '''
ChatResult{
  id: $id, 
  output: $output,
  messages: $messages,
  finishReason: $finishReason,
  metadata: $metadata,
  usage: $usage,
}''';
}
