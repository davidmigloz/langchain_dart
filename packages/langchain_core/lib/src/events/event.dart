import '../chat_models/types.dart';
import '../runnables/types.dart';

sealed class RunnableEvent<RunInput extends Object?,
    CallOptions extends RunnableOptions, RunOutput extends Object?> {
  const RunnableEvent({
    required this.id,
    required this.input,
    required this.options,
    required this.output,
  });

  final String id;
  final RunInput input;
  final CallOptions options;
  final RunOutput output;
}

class OnChatModelStartEvent
    extends RunnableEvent<List<ChatMessage>, ChatModelOptions, ChatResult?> {
  const OnChatModelStartEvent({
    required super.id,
    required super.input,
    required super.options,
  }) : super(output: null);

  @override
  String toString() => '''
OnChatModelStartEvent(
  id: $id,
  input: $input,
  options: $options,
)''';
}

class OnChatModelEndEvent
    extends RunnableEvent<List<ChatMessage>, ChatModelOptions, ChatResult> {
  const OnChatModelEndEvent({
    required super.id,
    required super.input,
    required super.options,
    required super.output,
  });

  @override
  String toString() => '''
OnChatModelEndEvent(
  id: $id,
  input: $input,
  options: $options,
  output: $output,
)''';
}

class OnChatModelStreamEvent
    extends RunnableEvent<List<ChatMessage>, ChatModelOptions, ChatResult> {
  const OnChatModelStreamEvent({
    required super.id,
    required super.input,
    required super.options,
    required super.output,
  });

  @override
  String toString() => '''
OnChatModelStreamEvent(
  id: $id,
  input: $input,
  options: $options,
  output: $output,
)''';
}
