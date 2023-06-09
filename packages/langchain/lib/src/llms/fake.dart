import 'base.dart';

class FakeListLLM extends SimpleLLM {
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
