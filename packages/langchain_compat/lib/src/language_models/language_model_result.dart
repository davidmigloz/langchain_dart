import 'package:meta/meta.dart';

import 'finish_reason.dart';
import 'language_model_usage.dart';

/// Result returned by the model.
@immutable
abstract class LanguageModelResult<O extends Object> {
  /// Creates a new language model result instance.
  const LanguageModelResult({
    required this.id,
    required this.output,
    required this.finishReason,
    required this.metadata,
    required this.usage,
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

  /// Returns the output as a string.
  ///
  /// This is a convenience method for getting the first output as a string:
  /// - If you are using an `LLM`, this will be the output String.
  /// - If you are using a `ChatModel`, this will be the content of the output
  ///   `ChatMessage`.
  String get outputAsString;
}
