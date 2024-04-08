import '../../language_models.dart';
import '../prompts/types.dart';
import 'base.dart';
import 'types.dart';

/// {@template fake_chat_model}
/// Fake Chat Model for testing.
/// You can pass in a list of responses to return in order when called.
/// {@endtemplate}
class FakeChatModel extends SimpleChatModel {
  /// {@macro fake_list_llm}
  FakeChatModel({
    required this.responses,
  }) : super(defaultOptions: const ChatModelOptions());

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
  const FakeEchoChatModel() : super(defaultOptions: const ChatModelOptions());

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
  Stream<ChatResult> stream(
    final PromptValue input, {
    final ChatModelOptions? options,
  }) {
    final prompt = input.toChatMessages().first.contentAsString.split('');
    return Stream.fromIterable(prompt).map(
      (final char) => ChatResult(
        id: 'fake-echo-chat-model',
        output: AIChatMessage(content: char),
        finishReason: FinishReason.stop,
        metadata: const {},
        usage: const LanguageModelUsage(),
        streaming: true,
      ),
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
