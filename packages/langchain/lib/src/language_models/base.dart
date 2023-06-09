/// Base class for all language models.
///
/// There are two different sub-types of Language Models:
/// - LLMs: these wrap APIs which take text in and return text.
/// - ChatModels: these wrap models which take chat messages in and return a
///   chat message.
abstract class BaseLanguageModel<I, O> {
  const BaseLanguageModel();

  /// Return type of language model.
  String get modelType;

  /// Runs the language model on the given input.
  Future<O> generate(
    final List<I> inputs, {
    final List<String>? stop,
  });

  @override
  String toString() => modelType;
}
