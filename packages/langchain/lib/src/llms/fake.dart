import 'base.dart';

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
    final List<String>? stop,
  }) {
    return Future<String>.value(responses[i++ % responses.length]);
  }
}
