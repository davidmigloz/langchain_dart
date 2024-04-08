import '../language_models/types.dart';

/// {@template llm_options}
/// Generation options to pass into the LLM.
/// {@endtemplate}
class LLMOptions extends LanguageModelOptions {
  /// {@macro llm_options}
  const LLMOptions();
}

/// {@template llm_result}
/// Result returned by the LLM.
/// {@endtemplate}
class LLMResult extends LanguageModelResult<String> {
  /// {@macro llm_result}
  const LLMResult({
    required super.id,
    required super.output,
    required super.finishReason,
    required super.metadata,
    required super.usage,
    super.streaming = false,
  });

  @override
  String get outputAsString => output;

  @override
  LanguageModelResult<String> concat(
    final LanguageModelResult<String> other,
  ) {
    return LLMResult(
      id: other.id,
      output: output + other.output,
      finishReason: other.finishReason,
      metadata: {
        ...metadata,
        ...other.metadata,
      },
      usage: usage.concat(other.usage),
      streaming: other.streaming,
    );
  }
}
