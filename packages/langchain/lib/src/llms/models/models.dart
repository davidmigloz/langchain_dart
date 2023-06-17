import 'package:meta/meta.dart';

import '../../language_models/models/models.dart';

/// {@template llm_options}
/// Generation options to pass into the LLM.
/// {@endtemplate}
class LLMOptions extends LanguageModelOptions {
  /// {@macro llm_options}
  const LLMOptions({
    super.stop,
  });
}

/// {@template llm_result}
/// Class that contains all relevant information for an LLM Result.
/// {@endtemplate}
@immutable
class LLMResult extends LanguageModelResult<String> {
  /// {@macro llm_result}
  const LLMResult({
    required super.generations,
    super.tokensUsage,
    super.modelOutput,
  });

  @override
  String toString() {
    return '''
LLMResult{
  generations: $generations, 
  tokensUsage: $tokensUsage, 
  modelOutput: $modelOutput},
''';
  }

  @override
  String get firstOutputAsString {
    return generations.firstOrNull?.output ?? '';
  }
}

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
  String toString() {
    return '''
LLMGeneration{
  output: $output, 
  generationInfo: $generationInfo, 
''';
  }
}
