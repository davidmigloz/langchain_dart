import 'package:collection/collection.dart';
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
  /// - If you are using a `ChatModel`, this will be the content of the output
  ///   `ChatMessage`.
  String get outputAsString;

  @override
  bool operator ==(covariant LanguageModelResult<O> other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          id == other.id &&
          output == other.output &&
          finishReason == other.finishReason &&
          const MapEquality<String, dynamic>().equals(
            metadata,
            other.metadata,
          ) &&
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
  LanguageModelResult<O> concat(LanguageModelResult<O> other);
}
