import '../prompts/models/models.dart';
import 'base.dart';
import 'models/models.dart';

/// {@template fake_chat_model}
/// Fake Chat Model for testing.
/// You can pass in a list of responses to return in order when called.
/// {@endtemplate}
class FakeChatModel extends SimpleChatModel {
  /// {@macro fake_list_llm}
  FakeChatModel({
    required this.responses,
  });

  /// Responses to return in order when called.
  final List<String> responses;

  int _i = 0;

  @override
  String get modelType => 'fake-chat-model';

  @override
  Future<String> callInternal(
    final List<ChatMessage> messages, {
    final ChatModelOptions? options,
  }) {
    return Future<String>.value(responses[_i++ % responses.length]);
  }

  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final ChatModelOptions? options,
  }) async {
    return promptValue
        .toString()
        .split(' ')
        .map((final word) => word.hashCode)
        .toList(growable: false);
  }
}

/// {@template fake_echo_llm}
/// Fake Chat Model for testing.
/// It just returns the content of the last message of the prompt
/// or streams it char by char.
/// {@endtemplate}
class FakeEchoChatModel extends SimpleChatModel {
  /// {@macro fake_echo_llm}
  const FakeEchoChatModel();

  @override
  String get modelType => 'fake-echo-chat-model';

  @override
  Future<String> callInternal(
    final List<ChatMessage> messages, {
    final ChatModelOptions? options,
  }) {
    return Future<String>.value(messages.last.contentAsString);
  }

  @override
  Stream<ChatResult> streamFromInputStream(
    final Stream<PromptValue> inputStream, {
    final ChatModelOptions? options,
  }) {
    return inputStream.asyncExpand(
      (final input) {
        final prompt = input.toChatMessages().first.contentAsString.split('');
        return Stream.fromIterable(prompt).map(
          (final char) => ChatResult(
            generations: [ChatGeneration(AIChatMessage(content: char))],
            streaming: true,
          ),
        );
      },
    );
  }

  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final ChatModelOptions? options,
  }) async {
    return promptValue
        .toString()
        .split(' ')
        .map((final word) => word.hashCode)
        .toList(growable: false);
  }
}
