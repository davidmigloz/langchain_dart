import '../../language_models/language_models.dart';
import 'chat_message.dart';

/// Result returned by the Chat Model.
class ChatResult extends LanguageModelResult<AIChatMessage> {
  /// Creates a new chat result instance.
  const ChatResult({
    required super.id,
    required super.output,
    required super.finishReason,
    required super.metadata,
    required super.usage,
  });

  @override
  String get outputAsString => output.content;

  @override
  String toString() =>
      '''
ChatResult{
  id: $id, 
  output: $output,
  finishReason: $finishReason,
  metadata: $metadata,
  usage: $usage,
}''';
}
