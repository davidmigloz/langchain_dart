import 'base.dart';

class FakeListLLM extends LLM {
  FakeListLLM({
    required this.responses,
  });

  final List<String> responses;
  int i = 0;

  @override
  String get llmType => 'fake-list';

  @override
  Future<String> callInternal({
    required final String prompt,
    final List<String>? stop,
  }) {
    return Future<String>.value(responses[i++ % responses.length]);
  }
}
