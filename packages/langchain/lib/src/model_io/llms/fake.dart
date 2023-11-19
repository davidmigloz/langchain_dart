import '../prompts/models/models.dart';
import 'base.dart';
import 'models/models.dart';

/// {@template fake_list_llm}
/// Fake LLM for testing.
/// You can pass in a list of responses to return in order when called.
/// {@endtemplate}
class FakeListLLM extends SimpleLLM {
  /// {@macro fake_list_llm}
  FakeListLLM({
    required this.responses,
  });

  /// Responses to return in order when called.
  final List<String> responses;

  int _i = 0;

  @override
  String get modelType => 'fake-list';

  @override
  Future<String> callInternal(
    final String prompt, {
    final LLMOptions? options,
  }) {
    return Future<String>.value(responses[_i++ % responses.length]);
  }

  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final LLMOptions? options,
  }) async {
    return promptValue
        .toString()
        .split(' ')
        .map((final word) => word.hashCode)
        .toList(growable: false);
  }
}

/// {@template fake_echo_llm}
/// Fake LLM for testing.
/// It just returns the prompt or streams it char by char.
/// {@endtemplate}
class FakeEchoLLM extends SimpleLLM {
  /// {@macro fake_echo_llm}
  const FakeEchoLLM();

  @override
  String get modelType => 'fake-echo';

  @override
  Future<String> callInternal(
    final String prompt, {
    final LLMOptions? options,
  }) {
    return Future<String>.value(prompt);
  }

  @override
  Stream<LLMResult> streamFromInputStream(
    final Stream<PromptValue> inputStream, {
    final LLMOptions? options,
  }) {
    return inputStream.asyncExpand(
      (final prompt) {
        final promptChars = prompt.toString().split('');
        return Stream.fromIterable(promptChars).map(
          (final item) => LLMResult(
            generations: [LLMGeneration(item)],
            streaming: true,
          ),
        );
      },
    );
  }

  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final LLMOptions? options,
  }) async {
    return promptValue
        .toString()
        .split(' ')
        .map((final word) => word.hashCode)
        .toList(growable: false);
  }
}

/// {@template fake_handler_llm}
/// Fake LLM for testing.
/// It returns the string returned by the [handler] function.
/// {@endtemplate}
class FakeHandlerLLM extends SimpleLLM {
  /// {@macro fake_handler_llm}
  FakeHandlerLLM({
    required this.handler,
  });

  /// Function called to generate the response.
  final String Function(
    String prompt,
    LLMOptions? options,
    int callCount,
  ) handler;

  int _callCount = 0;

  @override
  String get modelType => 'fake-handler';

  @override
  Future<String> callInternal(
    final String prompt, {
    final LLMOptions? options,
  }) {
    return Future.value(handler(prompt, options, ++_callCount));
  }

  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final LLMOptions? options,
  }) async {
    return promptValue
        .toString()
        .split(' ')
        .map((final word) => word.hashCode)
        .toList(growable: false);
  }
}
