import '../prompts/models/models.dart';
import 'models/models.dart';

/// {@template base_language_model}
/// Base class for all language models.
///
/// There are two different sub-types of Language Models:
/// - LLMs: these wrap APIs which take text in and return text.
/// - ChatModels: these wrap models which take chat messages in and return a
///   chat message.
/// {@endtemplate}
abstract class BaseLanguageModel<I extends Object, O extends Object> {
  /// {@macro base_language_model}
  const BaseLanguageModel();

  /// Return type of language model.
  String get modelType;

  /// Runs the language model on the given input.
  Future<LanguageModelResult<O>> generate(
    final I input, {
    final List<String>? stop,
  });

  /// Runs the language model on the given prompt value.
  Future<LanguageModelResult<O>> generatePrompt(
    final PromptValue promptValue, {
    final List<String>? stop,
  });

  @override
  String toString() => modelType;
}
