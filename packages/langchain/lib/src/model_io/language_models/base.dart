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

  /// Tokenizes the given prompt using the encoding used by the language
  /// model.
  ///
  /// - [promptValue] The prompt to tokenize.
  Future<List<int>> tokenize(final PromptValue promptValue);

  /// Returns the number of tokens resulting from [tokenize] the given prompt.
  ///
  /// Knowing how many tokens are in a text string can tell you:
  /// - Whether the string is too long for a text model to process.
  /// - How much the API call can costs (as usage is usually priced by token).
  ///
  /// In message-based models the exact way that tokens are counted from
  /// messages may change from model to model. Consider the result from this
  /// method an estimate, not a timeless guarantee.
  ///
  /// - [promptValue] The prompt to tokenize.
  ///
  /// Note: subclasses can override this method to provide a more accurate
  /// implementation.
  Future<int> countTokens(final PromptValue promptValue) async {
    final tokens = await tokenize(promptValue);
    return tokens.length;
  }

  @override
  String toString() => modelType;
}
