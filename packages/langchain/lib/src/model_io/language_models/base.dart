import '../chat_models/models/models.dart';
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
abstract class BaseLanguageModel<Input extends Object,
    Options extends LanguageModelOptions, Output extends Object> {
  /// {@macro base_language_model}
  const BaseLanguageModel();

  /// Return type of language model.
  String get modelType;

  /// Runs the language model on the given input.
  Future<LanguageModelResult<Output>> generate(
    final Input input, {
    final Options? options,
  });

  /// Runs the language model on the given prompt value.
  Future<LanguageModelResult<Output>> generatePrompt(
    final PromptValue promptValue, {
    final Options? options,
  });

  /// Runs the language model on the given input.
  Future<Output> call(
    final Input input, {
    final Options? options,
  });

  /// Predicts text from text.
  Future<String> predict(
    final String text, {
    final Options? options,
  });

  /// Predicts a chat message from chat messages.
  Future<ChatMessage> predictMessages(
    final List<ChatMessage> messages, {
    final Options? options,
  });

  @override
  String toString() => modelType;
}
