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
    super.streaming = false,
  });

  @override
  String get outputAsString => output.content;

  @override
  ChatResult concat(LanguageModelResult<AIChatMessage> other) => ChatResult(
    id: other.id.isNotEmpty ? other.id : id,
    output: output.concat(other.output),
    finishReason:
        finishReason != FinishReason.unspecified &&
            other.finishReason == FinishReason.unspecified
        ? finishReason
        : other.finishReason,
    metadata: {...metadata, ...other.metadata},
    usage: usage.concat(other.usage),
    streaming: other.streaming,
  );

  @override
  String toString() =>
      '''
ChatResult{
  id: $id, 
  output: $output,
  finishReason: $finishReason,
  metadata: $metadata,
  usage: $usage,
  streaming: $streaming
}''';
}
