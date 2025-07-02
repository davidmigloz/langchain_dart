import 'package:meta/meta.dart';

/// Usage stats for the generation.
///
/// You can use this information to determine how much the model call costed
/// (as usage is usually priced by token).
///
/// This is only available for some models.
@immutable
class LanguageModelUsage {
  /// Creates a new language model usage instance.
  const LanguageModelUsage({
    this.promptTokens,
    this.promptBillableCharacters,
    this.responseTokens,
    this.responseBillableCharacters,
    this.totalTokens,
  });

  /// The number of tokens in the prompt.
  ///
  /// Some providers call this "input_tokens".
  final int? promptTokens;

  /// The total number of billable characters in the prompt if applicable.
  final int? promptBillableCharacters;

  /// The number of tokens in the completion.
  ///
  /// Some providers call this "output_tokens".
  final int? responseTokens;

  /// The total number of billable characters in the completion if applicable.
  final int? responseBillableCharacters;

  /// The total number of tokens in the prompt and completion.
  final int? totalTokens;

  @override
  bool operator ==(covariant LanguageModelUsage other) =>
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
  LanguageModelUsage concat(LanguageModelUsage other) => LanguageModelUsage(
    promptTokens: promptTokens == null && other.promptTokens == null
        ? null
        : (promptTokens ?? 0) + (other.promptTokens ?? 0),
    promptBillableCharacters:
        promptBillableCharacters == null &&
            other.promptBillableCharacters == null
        ? null
        : (promptBillableCharacters ?? 0) +
              (other.promptBillableCharacters ?? 0),
    responseTokens: responseTokens == null && other.responseTokens == null
        ? null
        : (responseTokens ?? 0) + (other.responseTokens ?? 0),
    responseBillableCharacters:
        responseBillableCharacters == null &&
            other.responseBillableCharacters == null
        ? null
        : (responseBillableCharacters ?? 0) +
              (other.responseBillableCharacters ?? 0),
    totalTokens: totalTokens == null && other.totalTokens == null
        ? null
        : (totalTokens ?? 0) + (other.totalTokens ?? 0),
  );

  @override
  String toString() =>
      '''
LanguageModelUsage{
  promptTokens: $promptTokens, 
  promptBillableCharacters: $promptBillableCharacters, 
  responseTokens: $responseTokens, 
  responseBillableCharacters: $responseBillableCharacters, 
  totalTokens: $totalTokens}
''';
}
