import 'dart:async';

import 'package:meta/meta.dart';

import '../callbacks/manager.dart';
import '../language_models/language_models.dart';
import '../prompts/types.dart';
import '../utils/reduce.dart';
import 'types.dart';

/// {@template base_chat_model}
/// Chat models base class.
/// It should take in chat messages and return a chat message.
/// {@endtemplate}
abstract class BaseChatModel<Options extends ChatModelOptions>
    extends BaseLanguageModel<List<ChatMessage>, Options, ChatResult> {
  /// {@macro base_chat_model}
  const BaseChatModel({required super.defaultOptions});

  @override
  Future<ChatResult> invoke(
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

    final runMgr = mgr.handleChatModelStart(
      messages: input.toChatMessages(),
    );
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
  Stream<ChatResult> stream(
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

    final runMgr = mgr.handleChatModelStart(
      messages: input.toChatMessages(),
    );
    ChatResult? accumulated;
    return streamModel(input, options: options).transform(
      StreamTransformer<ChatResult, ChatResult>.fromHandlers(
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

  @override
  Stream<ChatResult> streamFromInputStream(
    final Stream<PromptValue> inputStream, {
    final Options? options,
  }) async* {
    final input = await inputStream.toList();
    final reduced = reduce<PromptValue>(input);
    yield* stream(reduced, options: options);
  }

  /// Internal method that subclasses must implement to run the model.
  ///
  /// This is called by [invoke] after callback dispatch.
  @protected
  Future<ChatResult> invokeModel(
    final PromptValue input, {
    final Options? options,
  });

  /// Internal method that subclasses must implement to stream from the model.
  ///
  /// This is called by [stream] after callback dispatch. The default
  /// implementation calls [invokeModel] and yields the result.
  @protected
  Stream<ChatResult> streamModel(
    final PromptValue input, {
    final Options? options,
  }) async* {
    yield await invokeModel(input, options: options);
  }

  /// Runs the chat model on the given messages and returns a chat message.
  ///
  /// - [messages] The messages to pass into the model.
  /// - [options] Generation options to pass into the Chat Model.
  ///
  /// Example:
  /// ```dart
  /// final result = await chat([ChatMessage.humanText('say hi!')]);
  /// ```
  Future<AIChatMessage> call(
    final List<ChatMessage> messages, {
    final Options? options,
  }) async {
    final result = await invoke(PromptValue.chat(messages), options: options);
    return result.output;
  }
}

/// {@template simple_chat_model}
/// [SimpleChatModel] provides a simplified interface for working with chat
/// models, rather than expecting the user to implement the full
/// [SimpleChatModel.invokeModel] method.
/// {@endtemplate}
abstract class SimpleChatModel<Options extends ChatModelOptions>
    extends BaseChatModel<Options> {
  /// {@macro simple_chat_model}
  const SimpleChatModel({required super.defaultOptions});

  @override
  Future<ChatResult> invokeModel(
    final PromptValue input, {
    final Options? options,
  }) async {
    final text = await callInternal(input.toChatMessages(), options: options);
    final message = AIChatMessage.text(text);
    return ChatResult(
      id: '1',
      output: message,
      finishReason: FinishReason.unspecified,
      metadata: const {},
      usage: const LanguageModelUsage(),
    );
  }

  /// Method which should be implemented by subclasses to run the model.
  @visibleForOverriding
  Future<String> callInternal(
    final List<ChatMessage> messages, {
    final Options? options,
  });
}
