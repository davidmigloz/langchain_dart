import 'package:meta/meta.dart';

import '../language_models/language_models.dart';
import '../prompts/models/models.dart';
import 'models/models.dart';

/// {@template base_llm}
/// Large Language Models base class.
/// It should take in a prompt and return a string.
/// {@endtemplate}
abstract class BaseLLM extends BaseLanguageModel<String, String> {
  /// {@macro base_llm}
  const BaseLLM();

  /// Runs the LLM on the given prompt.
  ///
  /// - [prompt] The prompt to pass into the model.
  /// - [stop] Optional list of stop words to use when generating.
  ///
  /// Example:
  /// ```dart
  /// final result = openai.generate('Tell me a joke.');
  /// ```
  @override
  Future<LLMResult> generate(
    final String prompt, {
    final List<String>? stop,
  });

  /// Runs the LLM on the given prompt value.
  ///
  /// - [promptValue] The prompt value to pass into the model.
  /// - [stop] Optional list of stop words to use when generating.
  ///
  /// Example:
  /// ```dart
  /// final result = openai.generatePrompt(
  ///   StringPromptValue('Tell me a joke.'),
  /// );
  /// ```
  @override
  Future<LLMResult> generatePrompt(
    final PromptValue promptValue, {
    final List<String>? stop,
  }) {
    return generate(promptValue.toString(), stop: stop);
  }

  /// Runs the LLM on the given prompt.
  ///
  /// - [prompt] The prompt to pass into the model.
  /// - [stop] Optional list of stop words to use when generating.
  ///
  /// Example:
  /// ```dart
  /// final result = openai('Tell me a joke.');
  /// ```
  Future<String> call(
    final String prompt, {
    final List<String>? stop,
  }) async {
    final result = await generate(prompt, stop: stop);
    return result.firstOutputAsString;
  }
}

/// {@template simple_llm}
/// [SimpleLLM] provides a simplified interface for working with LLMs,
/// rather than expecting the user to implement the full [SimpleLLM.generate]
/// method.
/// {@endtemplate}
abstract class SimpleLLM extends BaseLLM {
  /// {@macro simple_llm}
  const SimpleLLM();

  @override
  Future<LLMResult> generate(
    final String prompt, {
    final List<String>? stop,
  }) async {
    final output = await callInternal(prompt, stop: stop);
    return LLMResult(generations: [LLMGeneration(output)]);
  }

  /// Method which should be implemented by subclasses to run the model.
  @visibleForOverriding
  Future<String> callInternal(
    final String prompt, {
    final List<String>? stop,
  });
}
