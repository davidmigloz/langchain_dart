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
  });

  /// Runs the chat model on the given messages and returns a chat message.
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
    final result = await invoke(PromptValue.chat(messages), options: options);
    return result.generations[0].output;
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
  Future<ChatResult> invoke(
    final PromptValue input, {
    final Options? options,
  }) async {
    final text = await callInternal(input.toChatMessages(), options: options);
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
