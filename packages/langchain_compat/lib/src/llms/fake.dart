import '../../language_models.dart';
import '../prompts/types.dart';
import 'base.dart';
import 'types.dart';

/// {@template fake_list_llm}
/// Fake LLM for testing.
/// You can pass in a list of responses to return in order when called.
/// {@endtemplate}
class FakeLLM extends SimpleLLM<FakeLLMOptions> {
  /// {@macro fake_list_llm}
  FakeLLM({required this.responses})
    : super(defaultOptions: const FakeLLMOptions());

  /// Responses to return in order when called.
  final List<String> responses;

  var _i = 0;

  @override
  String get modelType => 'fake-list';

  @override
  Future<String> callInternal(String prompt, {LLMOptions? options}) =>
      Future<String>.value(responses[_i++ % responses.length]);

  @override
  Stream<LLMResult> stream(PromptValue input, {LLMOptions? options}) {
    final res = responses[_i++ % responses.length].split('');
    return Stream.fromIterable(res).map(
      (item) => LLMResult(
        id: 'fake-echo',
        output: item,
        finishReason: FinishReason.unspecified,
        metadata: const {},
        usage: const LanguageModelUsage(),
        streaming: true,
      ),
    );
  }

  @override
  Future<List<int>> tokenize(
    PromptValue promptValue, {
    LLMOptions? options,
  }) async => promptValue
      .toString()
      .split(' ')
      .map((word) => word.hashCode)
      .toList(growable: false);
}

/// {@template fake_llm_options}
/// Fake LLM options for testing.
/// {@endtemplate}
class FakeLLMOptions extends LLMOptions {
  /// {@macro fake_llm_options}
  const FakeLLMOptions({super.model, super.concurrencyLimit});

  @override
  FakeLLMOptions copyWith({String? model, int? concurrencyLimit}) =>
      FakeLLMOptions(
        model: model ?? this.model,
        concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
      );
}

/// {@template fake_echo_llm}
/// Fake LLM for testing.
/// It just returns the prompt or streams it char by char.
/// {@endtemplate}
class FakeEchoLLM extends BaseLLM<FakeLLMOptions> {
  /// {@macro fake_echo_llm}
  const FakeEchoLLM() : super(defaultOptions: const FakeLLMOptions());

  @override
  String get modelType => 'fake-echo';

  @override
  Future<LLMResult> invoke(PromptValue input, {LLMOptions? options}) =>
      Future<LLMResult>.value(
        LLMResult(
          id: 'fake-echo',
          output: input.toString(),
          finishReason: FinishReason.stop,
          metadata: const {},
          usage: const LanguageModelUsage(),
        ),
      );

  @override
  Stream<LLMResult> stream(PromptValue input, {LLMOptions? options}) {
    final promptChars = input.toString().split('');
    return Stream.fromIterable(promptChars).map(
      (item) => LLMResult(
        id: 'fake-echo',
        output: item,
        finishReason: FinishReason.unspecified,
        metadata: const {},
        usage: const LanguageModelUsage(),
        streaming: true,
      ),
    );
  }

  @override
  Future<List<int>> tokenize(
    PromptValue promptValue, {
    LLMOptions? options,
  }) async => promptValue
      .toString()
      .split(' ')
      .map((word) => word.hashCode)
      .toList(growable: false);
}

/// {@template fake_handler_llm}
/// Fake LLM for testing.
/// It returns the string returned by the [handler] function.
/// {@endtemplate}
class FakeHandlerLLM extends SimpleLLM<FakeLLMOptions> {
  /// {@macro fake_handler_llm}
  FakeHandlerLLM({required this.handler})
    : super(defaultOptions: const FakeLLMOptions());

  /// Function called to generate the response.
  final String Function(String prompt, LLMOptions? options, int callCount)
  handler;

  var _callCount = 0;

  @override
  String get modelType => 'fake-handler';

  @override
  Future<String> callInternal(String prompt, {LLMOptions? options}) =>
      Future.value(handler(prompt, options, ++_callCount));

  @override
  Future<List<int>> tokenize(
    PromptValue promptValue, {
    LLMOptions? options,
  }) async => promptValue
      .toString()
      .split(' ')
      .map((word) => word.hashCode)
      .toList(growable: false);
}
