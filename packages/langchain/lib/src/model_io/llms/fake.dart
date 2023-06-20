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

  final List<String> responses;
  int i = 0;

  @override
  String get modelType => 'fake-list';

  @override
  Future<String> callInternal(
    final String prompt, {
    final LLMOptions? options,
  }) {
    return Future<String>.value(responses[i++ % responses.length]);
  }
}

/// {@template fake_echo_llm}
/// Fake LLM for testing.
/// It just returns the prompt.
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
}
