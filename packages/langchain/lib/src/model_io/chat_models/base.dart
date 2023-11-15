import 'package:meta/meta.dart';

import '../language_models/base.dart';
import '../prompts/models/models.dart';
import 'models/models.dart';

/// {@template base_chat_model}
/// Chat models base class.
/// It should take in chat messages and return a chat message.
/// {@endtemplate}
abstract class BaseChatModel<Options extends ChatModelOptions>
    extends BaseLanguageModel<List<ChatMessage>, Options, AIChatMessage> {
  /// {@macro base_chat_model}
  const BaseChatModel();

  /// Runs the chat model on the given prompt value.
  ///
  /// - [input] The prompt value to pass into the model.
  /// - [options] Generation options to pass into the Chat Model.
  ///
  /// Example:
  /// ```dart
  /// final result = await chat.invoke(
  ///   PromptValue.chat([ChatMessage.humanText('say hi!')]),
  /// );
  /// ```
  @override
  Future<ChatResult> invoke(
    final PromptValue input, {
    final Options? options,
  }) async {
    return generatePrompt(input, options: options);
  }

  /// Runs the chat model on the given messages.
  ///
  /// - [messages] The messages to pass into the model.
  /// - [options] Generation options to pass into the Chat Model.
  ///
  /// Example:
  /// ```dart
  /// final result = await chat.generate([ChatMessage.humanText('say hi!')]);
  /// ```
  @override
  Future<ChatResult> generate(
    final List<ChatMessage> messages, {
    final Options? options,
  });

  /// Runs the chat model on the given prompt value.
  ///
  /// - [promptValue] The prompt value to pass into the model.
  /// - [options] Generation options to pass into the Chat Model.
  ///
  /// Example:
  /// ```dart
  /// final result = await chat.generatePrompt(
  ///   PromptValue.chat([ChatMessage.humanText('say hi!')]),
  /// );
  /// ```
  @override
  Future<ChatResult> generatePrompt(
    final PromptValue promptValue, {
    final Options? options,
  }) {
    return generate(promptValue.toChatMessages(), options: options);
  }

  /// Runs the chat model on the given messages.
  ///
  /// - [messages] The messages to pass into the model.
  /// - [options] Generation options to pass into the Chat Model.
  ///
  /// Example:
  /// ```dart
  /// final result = await chat([ChatMessage.humanText('say hi!')]);
  /// ```
  @override
  Future<AIChatMessage> call(
    final List<ChatMessage> messages, {
    final Options? options,
  }) async {
    final result = await generate(messages, options: options);
    return result.generations[0].output;
  }

  /// Runs the chat model on the given text as a human message and returns the
  /// content of the AI message.
  ///
  /// - [text] The text to pass into the model.
  /// - [options] Generation options to pass into the Chat Model.
  ///
  /// Example:
  /// ```dart
  /// final result = await predict('say hi!');
  /// ```
  @override
  Future<String> predict(
    final String text, {
    final Options? options,
  }) async {
    final res = await call(
      [ChatMessage.humanText(text)],
      options: options,
    );
    return res.content;
  }

  /// Runs the chat model on the given messages (same as [call] method).
  ///
  /// - [messages] The messages to pass into the model.
  /// - [options] Generation options to pass into the Chat Model.
  ///
  /// Example:
  /// ```dart
  /// final result = await chat.predictMessages([ChatMessage.humanText('say hi!')]);
  /// );
  @override
  Future<ChatMessage> predictMessages(
    final List<ChatMessage> messages, {
    final Options? options,
  }) async {
    return call(messages, options: options);
  }
}

/// {@template simple_chat_model}
/// [SimpleChatModel] provides a simplified interface for working with chat
/// models, rather than expecting the user to implement the full
/// [SimpleChatModel.generate] method.
/// {@endtemplate}
abstract class SimpleChatModel<Options extends ChatModelOptions>
    extends BaseChatModel<Options> {
  /// {@macro simple_chat_model}
  const SimpleChatModel();

  @override
  Future<ChatResult> generate(
    final List<ChatMessage> messages, {
    final Options? options,
  }) async {
    final text = await callInternal(messages, options: options);
    final message = AIChatMessage(content: text);
    return ChatResult(
      generations: [ChatGeneration(message)],
    );
  }

  /// Method which should be implemented by subclasses to run the model.
  @visibleForOverriding
  Future<String> callInternal(
    final List<ChatMessage> messages, {
    final Options? options,
  });
}
