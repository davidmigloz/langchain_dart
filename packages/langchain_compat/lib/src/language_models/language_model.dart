import '../langchain/base.dart';
import '../prompts/types.dart';
import 'language_model_options.dart';
import 'language_model_result.dart';

/// {@template base_language_model}
/// Base class for all language models.
///
/// There are two different sub-types of Language Models:
/// - LLMs: these wrap APIs which take text in and return text.
/// - ChatModels: these wrap models which take chat messages in and return a
///   chat message.
/// {@endtemplate}
abstract class LanguageModel<
  Input extends Object,
  Options extends LanguageModelOptions,
  Output extends LanguageModelResult
>
    extends BaseLangChain<PromptValue, Options, Output> {
  /// {@macro base_language_model}
  const LanguageModel({required super.defaultOptions});

  /// Return type of language model.
  String get modelType;

  @override
  String toString() => modelType;
}
