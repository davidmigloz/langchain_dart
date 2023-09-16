import 'package:meta/meta.dart';

import '../chat_models/models/models.dart';
import '../chat_models/utils.dart';
import '../language_models/language_models.dart';
import '../prompts/models/models.dart';
import 'models/models.dart';

/// {@template base_llm}
/// Large Language Models base class.
/// It should take in a prompt and return a string.
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
  Future<LanguageModelResult<String>> invoke(
    final PromptValue input, {
    final Options? options,
  }) async {
    return generatePrompt(input, options: options);
  }

  /// Runs the LLM on the given prompt.
  ///
  /// - [prompt] The prompt to pass into the model.
  /// - [options] Generation options to pass into the LLM.
  ///
  /// Example:
  /// ```dart
  /// final result = await openai.generate('Tell me a joke.');
  /// ```
  @override
  Future<LLMResult> generate(
    final String prompt, {
    final Options? options,
  });

  /// Runs the LLM on the given prompt value.
  ///
  /// - [promptValue] The prompt value to pass into the model.
  /// - [options] Generation options to pass into the LLM.
  ///
  /// Example:
  /// ```dart
  /// final result = await openai.generatePrompt(
  ///   PromptValue.string('Tell me a joke.'),
  /// );
  /// ```
  @override
  Future<LLMResult> generatePrompt(
    final PromptValue promptValue, {
    final Options? options,
  }) {
    return generate(promptValue.toString(), options: options);
  }

  /// Runs the LLM on the given prompt.
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
    final result = await generate(prompt, options: options);
    return result.firstOutputAsString;
  }

  /// Runs the LLM on the given prompt value (same as [call] method).
  ///
  /// - [text] The prompt value to pass into the model.
  /// - [options] Generation options to pass into the LLM.
  ///
  /// Example:
  /// ```dart
  /// final result = await openai.predict('Tell me a joke.');
  /// ```
  @override
  Future<String> predict(
    final String text, {
    final Options? options,
  }) {
    return call(text, options: options);
  }

  /// Runs the LLM on the given messages. The messages are converted to a
  /// single string using the format:
  /// ```
  /// <role>: <content>
  /// <role>: <content>
  /// ...
  /// ```
  ///
  /// - [messages] The messages to pass into the model.
  /// - [options] Generation options to pass into the LLM.
  ///
  /// Example:
  /// ```dart
  /// final result = await openai.predictMessages([
  ///   ChatMessage.user('Tell me a joke.'),
  /// ]);
  /// ```
  @override
  Future<ChatMessage> predictMessages(
    final List<ChatMessage> messages, {
    final Options? options,
  }) async {
    final content = await call(messages.toBufferString(), options: options);
    return ChatMessage.ai(content);
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
  Future<LLMResult> generate(
    final String prompt, {
    final Options? options,
  }) async {
    final output = await callInternal(prompt, options: options);
    return LLMResult(generations: [LLMGeneration(output)]);
  }

  /// Method which should be implemented by subclasses to run the model.
  @visibleForOverriding
  Future<String> callInternal(
    final String prompt, {
    final Options? options,
  });
}
