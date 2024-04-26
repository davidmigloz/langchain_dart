import 'package:meta/meta.dart';

import '../language_models/language_models.dart';
import '../prompts/types.dart';
import 'types.dart';

/// {@template base_llm}
/// Large Language Models base class.
///
/// LLMs take in a String and returns a String.
/// {@endtemplate}
abstract class BaseLLM<Options extends LLMOptions>
    extends BaseLanguageModel<String, Options, LLMResult> {
  /// {@macro base_llm}
  const BaseLLM({
    required super.defaultOptions,
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
  Future<String> call(
    final String prompt, {
    final Options? options,
  }) async {
    final result = await invoke(PromptValue.string(prompt), options: options);
    return result.output;
  }
}

/// {@template simple_llm}
/// [SimpleLLM] provides a simplified interface for working with LLMs.
/// Rather than expecting the user to implement the full [SimpleLLM.invoke]
/// method, the user only needs to implement [SimpleLLM.callInternal].
/// {@endtemplate}
abstract class SimpleLLM<Options extends LLMOptions> extends BaseLLM<Options> {
  /// {@macro simple_llm}
  const SimpleLLM({
    required super.defaultOptions,
  });

  @override
  Future<LLMResult> invoke(
    final PromptValue input, {
    final Options? options,
  }) async {
    final output = await callInternal(input.toString(), options: options);
    return LLMResult(
      id: '1',
      output: output,
      finishReason: FinishReason.unspecified,
      metadata: const {},
      usage: const LanguageModelUsage(),
    );
  }

  /// Method which should be implemented by subclasses to run the model.
  @visibleForOverriding
  Future<String> callInternal(
    final String prompt, {
    final Options? options,
  });
}
