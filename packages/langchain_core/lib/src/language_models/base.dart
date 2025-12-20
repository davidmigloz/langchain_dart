import '../langchain/base.dart';
import '../prompts/types.dart';
import 'types.dart';

/// {@template base_language_model}
/// Base class for all language models.
///
/// There are two different sub-types of Language Models:
/// - LLMs: these wrap APIs which take text in and return text.
/// - ChatModels: these wrap models which take chat messages in and return a
///   chat message.
/// {@endtemplate}
abstract class BaseLanguageModel<
  Input extends Object,
  Options extends LanguageModelOptions,
  Output extends LanguageModelResult
>
    extends BaseLangChain<PromptValue, Options, Output> {
  /// {@macro base_language_model}
  const BaseLanguageModel({required super.defaultOptions});

  /// Return type of language model.
  String get modelType;

  /// Tokenizes the given prompt using the encoding used by the language
  /// model.
  ///
  /// - [promptValue] The prompt to tokenize.
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final Options? options,
  });

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
  Future<int> countTokens(
    final PromptValue promptValue, {
    final Options? options,
  }) async {
    final tokens = await tokenize(promptValue, options: options);
    return tokens.length;
  }

  @override
  String toString() => modelType;

  /// Returns a list of available models from this provider.
  ///
  /// This method allows you to programmatically discover which models
  /// are available from the provider. The returned list contains
  /// [ModelInfo] objects with metadata about each model.
  ///
  /// By default, this returns an empty list. Providers that support
  /// model listing will override this method to return the actual
  /// available models.
  ///
  /// Example:
  /// ```dart
  /// final chatModel = ChatOpenAI(apiKey: '...');
  /// final models = await chatModel.listModels();
  /// for (final model in models) {
  ///   print('${model.id} - ${model.displayName ?? ""}');
  /// }
  /// ```
  ///
  /// Note: Not all providers support model listing. For providers that
  /// don't support this feature, this method returns an empty list.
  Future<List<ModelInfo>> listModels() async => [];
}
