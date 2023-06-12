import '../prompts/models/models.dart';
import 'models/models.dart';

/// Base class for all language models.
///
/// There are two different sub-types of Language Models:
/// - LLMs: these wrap APIs which take text in and return text.
/// - ChatModels: these wrap models which take chat messages in and return a
///   chat message.
abstract class BaseLanguageModel<I, O extends Object> {
  const BaseLanguageModel();

  /// Return type of language model.
  String get modelType;

  /// Runs the language model on the given input.
  Future<LanguageModelResult<O>> generate(
    final List<I> inputs, {
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
