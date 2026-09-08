import 'dart:async';

import 'package:meta/meta.dart';

import '../callbacks/manager.dart';
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
  const BaseLLM({required super.defaultOptions});

  @override
  Future<LLMResult> invoke(
    final PromptValue input, {
    final Options? options,
  }) async {
    final opts = options ?? defaultOptions;
    final mgr = CallbackManager.configure(
      callbacks: opts.callbacks,
      tags: opts.tags,
      metadata: opts.metadata,
    );
    if (mgr == null) return invokeModel(input, options: options);

    final runMgr = mgr.handleLlmStart(input: input);
    try {
      final result = await invokeModel(input, options: options);
      runMgr.handleEnd(result);
      return result;
    } catch (e) {
      runMgr.handleError(e);
      rethrow;
    }
  }

  @override
  Stream<LLMResult> stream(
    final PromptValue input, {
    final Options? options,
  }) {
    final opts = options ?? defaultOptions;
    final mgr = CallbackManager.configure(
      callbacks: opts.callbacks,
      tags: opts.tags,
      metadata: opts.metadata,
    );
    if (mgr == null) return streamModel(input, options: options);

    final runMgr = mgr.handleLlmStart(input: input);
    LLMResult? accumulated;
    return streamModel(input, options: options).transform(
      StreamTransformer<LLMResult, LLMResult>.fromHandlers(
        handleData: (data, sink) {
          runMgr.handleNewToken(data.outputAsString);
          accumulated = accumulated?.concat(data) ?? data;
          sink.add(data);
        },
        handleError: (error, stackTrace, sink) {
          runMgr.handleError(error);
          sink.addError(error, stackTrace);
        },
        handleDone: (sink) {
          if (accumulated != null) runMgr.handleEnd(accumulated!);
          sink.close();
        },
      ),
    );
  }

  /// Internal method that subclasses must implement to run the model.
  ///
  /// This is called by [invoke] after callback dispatch.
  @protected
  Future<LLMResult> invokeModel(
    final PromptValue input, {
    final Options? options,
  });

  /// Internal method that subclasses can override to stream from the model.
  ///
  /// This is called by [stream] after callback dispatch. The default
  /// implementation calls [invokeModel] and yields the result.
  @protected
  Stream<LLMResult> streamModel(
    final PromptValue input, {
    final Options? options,
  }) async* {
    yield await invokeModel(input, options: options);
  }

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
  Future<String> call(final String prompt, {final Options? options}) async {
    final result = await invoke(PromptValue.string(prompt), options: options);
    return result.output;
  }
}

/// {@template simple_llm}
/// [SimpleLLM] provides a simplified interface for working with LLMs.
/// Rather than expecting the user to implement the full [SimpleLLM.invokeModel]
/// method, the user only needs to implement [SimpleLLM.callInternal].
/// {@endtemplate}
abstract class SimpleLLM<Options extends LLMOptions> extends BaseLLM<Options> {
  /// {@macro simple_llm}
  const SimpleLLM({required super.defaultOptions});

  @override
  Future<LLMResult> invokeModel(
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
  Future<String> callInternal(final String prompt, {final Options? options});
}
