import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../../../core/core.dart';

/// {@template language_model_options}
/// Generation options to pass into the language model.
/// {@endtemplate}
@immutable
abstract class LanguageModelOptions extends BaseLangChainOptions {
  /// {@macro language_model_options}
  const LanguageModelOptions();
}

/// {@template language_model}
/// Result returned by the model.
/// {@endtemplate}
@immutable
class LanguageModelResult<O extends Object> {
  /// {@macro language_model}
  const LanguageModelResult({
    this.id,
    required this.generations,
    this.usage,
    this.modelOutput,
    this.streaming = false,
  });

  /// Result id.
  final String? id;

  /// Generated outputs.
  final List<LanguageModelGeneration<O>> generations;

  ///  Usage stats for the generation.
  final LanguageModelUsage? usage;

  /// For arbitrary model provider specific output.
  final Map<String, dynamic>? modelOutput;

  /// Whether the result of the language model is being streamed.
  final bool streaming;

  /// Returns the first output.
  ///
  /// This is a convenience method for getting the first output.
  /// - If you are using an `LLM`, this will be a String.
  /// - If you are using a `ChatModel`, this will be a `ChatMessage`.
  O get firstOutput {
    return generations.first.output;
  }

  /// Returns the first output as a string.
  ///
  /// This is a convenience method for getting the first output as a string.
  /// - If you are using an `LLM`, this will be the output String.
  /// - If you are using a `ChatModel`, this will be the content of the output `ChatMessage`.
  String get firstOutputAsString {
    return generations.firstOrNull?.outputAsString ?? '';
  }

  @override
  bool operator ==(covariant final LanguageModelResult<O> other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          id == other.id &&
          ListEquality<LanguageModelGeneration<O>>().equals(
            generations,
            other.generations,
          ) &&
          usage == other.usage &&
          const MapEquality<String, dynamic>().equals(
            modelOutput,
            other.modelOutput,
          ) &&
          streaming == other.streaming;

  @override
  int get hashCode =>
      id.hashCode ^
      ListEquality<LanguageModelGeneration<O>>().hash(generations) ^
      usage.hashCode ^
      const MapEquality<String, dynamic>().hash(modelOutput) ^
      streaming.hashCode;

  /// Merges this result with another by concatenating the outputs.
  LanguageModelResult<O> concat(final LanguageModelResult<O> other) {
    return LanguageModelResult<O>(
      id: id,
      generations: generations.mapIndexed(
        (final index, final generation) {
          return generation.concat(other.generations[index]);
        },
      ).toList(growable: false),
      usage: usage,
      modelOutput: {
        ...?modelOutput,
        ...?other.modelOutput,
      },
      streaming: streaming,
    );
  }

  @override
  String toString() {
    return '''
LanguageModelResult{
  id: $id, 
  generations: $generations, 
  usage: $usage, 
  modelOutput: $modelOutput, 
  streaming: $streaming
}''';
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
  bool operator ==(covariant final LanguageModelUsage other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          promptTokens == other.promptTokens &&
          promptBillableCharacters == other.promptBillableCharacters &&
          responseTokens == other.responseTokens &&
          responseBillableCharacters == other.responseBillableCharacters &&
          totalTokens == other.totalTokens;

  @override
  int get hashCode =>
      promptTokens.hashCode ^
      promptBillableCharacters.hashCode ^
      responseTokens.hashCode ^
      responseBillableCharacters.hashCode ^
      totalTokens.hashCode;

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

  @override
  bool operator ==(covariant final LanguageModelGeneration<O> other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          output == other.output &&
          const MapEquality<String, dynamic>().equals(
            generationInfo,
            other.generationInfo,
          );

  @override
  int get hashCode =>
      output.hashCode ^
      const MapEquality<String, dynamic>().hash(generationInfo);

  /// Merges this generation with another by concatenating the outputs.
  LanguageModelGeneration<O> concat(final LanguageModelGeneration<O> other);

  @override
  String toString() {
    return '''
LanguageModelGeneration{
  output: $output, 
  generationInfo: $generationInfo
}''';
  }
}
