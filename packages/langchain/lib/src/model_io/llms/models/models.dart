import 'package:meta/meta.dart';

import '../../language_models/models/models.dart';

/// {@template llm_options}
/// Generation options to pass into the LLM.
/// {@endtemplate}
class LLMOptions extends LanguageModelOptions {
  /// {@macro llm_options}
  const LLMOptions();
}

/// Class that contains all relevant information for an LLM Result.
typedef LLMResult = LanguageModelResult<String>;

/// {@template llm_generation}
/// Output of a single generation.
/// {@endtemplate}
@immutable
class LLMGeneration extends LanguageModelGeneration<String> {
  /// {@macro llm_generation}
  const LLMGeneration(
    super.output, {
    super.generationInfo,
  });

  @override
  String get outputAsString => output;

  @override
  LanguageModelGeneration<String> concat(
    final LanguageModelGeneration<String> other,
  ) {
    return LLMGeneration(
      output + other.output,
      generationInfo: {
        ...?generationInfo,
        ...?other.generationInfo,
      },
    );
  }

  @override
  String toString() {
    return '''
LLMGeneration{
  output: $output, 
  generationInfo: $generationInfo, 
''';
  }
}
