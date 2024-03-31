import 'package:meta/meta.dart';

import '../language_models/base.dart';
import '../prompts/types.dart';
import 'types.dart';

/// {@template base_llm}
/// Large Language Models base class.
///
/// LLMs take in a String and returns a String.
/// {@endtemplate}
abstract class BaseLLM<Options extends LLMOptions>
    extends BaseLanguageModel<String, Options, String> {
  /// {@macro base_llm}
  const BaseLLM();

  /// Runs the LLM on the given prompt value.
  ///
  /// - [input] The prompt value to pass into the model.
  /// - [options] Generation options to pass into the LLM.
  ///
  /// Example:
  /// ```dart
  /// final result = await openai.invoke(
  ///   PromptValue.string('Tell me a joke.'),
  /// );
  /// ```
  @override
  Future<LLMResult> invoke(
    final PromptValue input, {
    final Options? options,
  });

  /// Runs the LLM on the given String prompt and returns a String with the
  /// generated text.
  ///
  /// - [prompt] The prompt to pass into the model.
  /// - [options] Generation options to pass into the LLM.
  ///
  /// Example:
  /// ```dart
  /// final result = await openai('Tell me a joke.');
  /// ```
  @override
  Future<String> call(
    final String prompt, {
    final Options? options,
  }) async {
    final result = await invoke(PromptValue.string(prompt), options: options);
    return result.firstOutputAsString;
  }
}

/// {@template simple_llm}
/// [SimpleLLM] provides a simplified interface for working with LLMs,
/// rather than expecting the user to implement the full [SimpleLLM.generate]
/// method.
/// {@endtemplate}
abstract class SimpleLLM<Options extends LLMOptions> extends BaseLLM<Options> {
  /// {@macro simple_llm}
  const SimpleLLM();

  @override
  Future<LLMResult> invoke(
    final PromptValue input, {
    final Options? options,
  }) async {
    final output = await callInternal(input.toString(), options: options);
    return LLMResult(generations: [LLMGeneration(output)]);
  }

  /// Method which should be implemented by subclasses to run the model.
  @visibleForOverriding
  Future<String> callInternal(
    final String prompt, {
    final Options? options,
  });
}
