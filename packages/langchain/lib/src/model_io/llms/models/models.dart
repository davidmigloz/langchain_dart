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
    super.usage,
    super.modelOutput,
  });

  @override
  String toString() {
    return '''
LLMResult{
  generations: $generations, 
  usage: $usage, 
  modelOutput: $modelOutput},
''';
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
  String get outputAsString => output;

  @override
  String toString() {
    return '''
LLMGeneration{
  output: $output, 
  generationInfo: $generationInfo, 
''';
  }
}
