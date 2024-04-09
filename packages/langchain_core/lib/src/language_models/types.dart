import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../langchain/types.dart';

/// {@template language_model_options}
/// Generation options to pass into the language model.
/// {@endtemplate}
@immutable
abstract class LanguageModelOptions extends BaseLangChainOptions {
  /// {@macro language_model_options}
  const LanguageModelOptions({
    super.concurrencyLimit,
  });
}

/// {@template language_model}
/// Result returned by the model.
/// {@endtemplate}
@immutable
abstract class LanguageModelResult<O extends Object> {
  /// {@macro language_model}
  const LanguageModelResult({
    required this.id,
    required this.output,
    required this.finishReason,
    required this.metadata,
    required this.usage,
    this.streaming = false,
  });

  /// Result id.
  final String id;

  /// Generated output.
  final O output;

  /// The reason the model stopped generating tokens.
  final FinishReason finishReason;

  /// Other metadata about the generation.
  final Map<String, dynamic> metadata;

  ///  Usage stats for the generation.
  final LanguageModelUsage usage;

  /// Whether the result of the language model is being streamed.
  final bool streaming;

  /// Returns the output as a string.
  ///
  /// This is a convenience method for getting the first output as a string:
  /// - If you are using an `LLM`, this will be the output String.
  /// - If you are using a `ChatModel`, this will be the content of the output `ChatMessage`.
  String get outputAsString;

  @override
  bool operator ==(covariant final LanguageModelResult<O> other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          id == other.id &&
          output == other.output &&
          finishReason == other.finishReason &&
          const MapEquality<String, dynamic>()
              .equals(metadata, other.metadata) &&
          usage == other.usage &&
          streaming == other.streaming;

  @override
  int get hashCode =>
      id.hashCode ^
      output.hashCode ^
      finishReason.hashCode ^
      const MapEquality<String, dynamic>().hash(metadata) ^
      usage.hashCode ^
      streaming.hashCode;

  /// Merges this result with another by concatenating the outputs.
  LanguageModelResult<O> concat(final LanguageModelResult<O> other);
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

  /// Merges this usage with another by summing the values.
  LanguageModelUsage concat(final LanguageModelUsage other) {
    return LanguageModelUsage(
      promptTokens: promptTokens != null && other.promptTokens != null
          ? promptTokens! + other.promptTokens!
          : null,
      promptBillableCharacters: promptBillableCharacters != null &&
              other.promptBillableCharacters != null
          ? promptBillableCharacters! + other.promptBillableCharacters!
          : null,
      responseTokens: responseTokens != null && other.responseTokens != null
          ? responseTokens! + other.responseTokens!
          : null,
      responseBillableCharacters: responseBillableCharacters != null &&
              other.responseBillableCharacters != null
          ? responseBillableCharacters! + other.responseBillableCharacters!
          : null,
      totalTokens: totalTokens != null && other.totalTokens != null
          ? totalTokens! + other.totalTokens!
          : null,
    );
  }

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

/// The reason the model stopped generating tokens.
enum FinishReason {
  /// The model hit a natural stop point or a provided stop sequence.
  stop,

  /// The maximum number of tokens specified in the request was reached.
  length,

  /// The content was flagged for content filter reasons.
  contentFilter,

  /// The content content was flagged for recitation reasons.
  recitation,

  /// The model called a tool.
  toolCalls,

  /// The finish reason is unspecified.
  unspecified,
}
