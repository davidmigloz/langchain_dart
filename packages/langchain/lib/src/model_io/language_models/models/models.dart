import 'package:meta/meta.dart';

/// {@template language_model_options}
/// Generation options to pass into the language model.
/// {@endtemplate}
@immutable
abstract class LanguageModelOptions {
  /// {@macro language_model_options}
  const LanguageModelOptions();
}

/// {@template language_model}
/// Result returned by the model.
/// {@endtemplate}
@immutable
abstract class LanguageModelResult<O extends Object> {
  /// {@macro language_model}
  const LanguageModelResult({
    required this.generations,
    this.usage,
    this.modelOutput,
  });

  /// Generated outputs.
  final List<LanguageModelGeneration<O>> generations;

  ///  Usage stats for the generation.
  final LanguageModelUsage? usage;

  /// For arbitrary model provider specific output.
  final Map<String, dynamic>? modelOutput;

  /// Returns the first output as a string.
  String get firstOutputAsString {
    return generations.firstOrNull?.outputAsString ?? '';
  }
}

/// {@template language_model_usage}
/// Usage stats for the generation.
///
/// You can use this information to determine how much the model call costed
/// (as usage is usually priced by token).
///
/// This is only available for some models.
/// {@endtemplate}
@immutable
class LanguageModelUsage {
  /// {@macro language_model_usage}
  const LanguageModelUsage({
    this.promptTokens,
    this.promptBillableCharacters,
    this.responseTokens,
    this.responseBillableCharacters,
    this.totalTokens,
  });

  /// The number of tokens in the prompt.
  final int? promptTokens;

  /// The total number of billable characters in the prompt if applicable.
  final int? promptBillableCharacters;

  /// The number of tokens in the completion.
  final int? responseTokens;

  /// The total number of billable characters in the completion if applicable.
  final int? responseBillableCharacters;

  /// The total number of tokens in the prompt and completion.
  final int? totalTokens;

  @override
  String toString() {
    return '''
LanguageModelUsage{
  promptTokens: $promptTokens, 
  promptBillableCharacters: $promptBillableCharacters, 
  responseTokens: $responseTokens, 
  responseBillableCharacters: $responseBillableCharacters, 
  totalTokens: $totalTokens}
''';
  }
}

/// {@template language_model_generation}
/// Output of a single generation.
/// {@endtemplate}
@immutable
abstract class LanguageModelGeneration<O> {
  /// {@macro language_model_generation}
  const LanguageModelGeneration(
    this.output, {
    this.generationInfo,
  });

  /// Generated output.
  final O output;

  /// Raw generation info response from the provider.
  /// May include things like reason for finishing.
  final Map<String, dynamic>? generationInfo;

  /// Returns the output as string.
  String get outputAsString;
}
