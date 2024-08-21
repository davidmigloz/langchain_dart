import 'dart:math';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../chat_models/types.dart';
import '../chat_models/utils.dart';
import '../exceptions/base.dart';

/// {@template prompt_value}
/// Represents the input to an LLM or Chat model.
///
/// When working with an LLM, the [toString] method will be used.
/// When working with a Chat model, the [toChatMessages] method will be used.
/// {@endtemplate}
@immutable
sealed class PromptValue {
  /// {@macro prompt_value}
  const PromptValue();

  /// Returns a string representing the prompt.
  @override
  String toString();

  /// Returns a list of messages representing the prompt.
  List<ChatMessage> toChatMessages();

  /// {@macro string_prompt_template}
  factory PromptValue.string(final String value) {
    return StringPromptValue(value);
  }

  /// {@macro chat_prompt_template}
  factory PromptValue.chat(final List<ChatMessage> messages) {
    return ChatPromptValue(messages);
  }

  /// Merges this prompt value with another by concatenating the content.
  PromptValue concat(final PromptValue other);
}

/// {@template string_prompt_template}
/// Prompt value whose value is a string.
///
/// When [toString] is called, it returns the string value.
/// When [toChatMessages] is called, it returns a [HumanChatMessage] with the
/// value as content.
/// {@endtemplate}
@immutable
class StringPromptValue implements PromptValue {
  /// {@macro string_prompt_template}
  const StringPromptValue(this.value);

  /// String value to use as the prompt.
  final String value;

  @override
  String toString() {
    return value;
  }

  @override
  List<ChatMessage> toChatMessages() {
    return [ChatMessage.humanText(value)];
  }

  @override
  PromptValue concat(
    final PromptValue other,
  ) =>
      switch (other) {
        final StringPromptValue other => StringPromptValue(value + other.value),
        final ChatPromptValue other => ChatPromptValue([
            ChatMessage.humanText(value),
            ...other.messages,
          ]),
      };

  @override
  bool operator ==(covariant final StringPromptValue other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;
}

/// {@template chat_prompt_value}
/// Prompt value whose value is a list of messages.
///
/// When [toString] is called, it returns the string representation of the
/// messages using the following format:
/// ```
/// System: <system message>
/// Human: <human message>
/// AI: <AI message>
/// Human: <human message>
/// AI: <AI message>
/// ...
/// ```
/// When [toChatMessages] is called, it returns the list of messages.
/// {@endtemplate}
@immutable
class ChatPromptValue implements PromptValue {
  /// {@macro chat_prompt_value}
  const ChatPromptValue(this.messages);

  /// List of messages to use as the prompt.
  final List<ChatMessage> messages;

  @override
  String toString() {
    return messages.toBufferString();
  }

  @override
  List<ChatMessage> toChatMessages() {
    return messages;
  }

  @override
  PromptValue concat(
    final PromptValue other,
  ) =>
      switch (other) {
        final StringPromptValue other => ChatPromptValue([
            ...messages,
            ChatMessage.humanText(other.value),
          ]),
        final ChatPromptValue other => ChatPromptValue(
            List.generate(
              max(messages.length, other.messages.length),
              (index) => (
                index < messages.length ? messages[index] : null,
                index < other.messages.length ? other.messages[index] : null,
              ),
            )
                .map((final pair) {
                  final (message, otherMessage) = pair;
                  if (message == null) {
                    return otherMessage;
                  } else if (otherMessage == null) {
                    return message;
                  } else {
                    return message.concat(otherMessage);
                  }
                })
                .nonNulls
                .toList(growable: false),
          ),
      };

  @override
  bool operator ==(covariant final ChatPromptValue other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            const ListEquality<ChatMessage>().equals(messages, other.messages);
  }

  @override
  int get hashCode => const ListEquality<ChatMessage>().hash(messages);
}

/// Input values used to format a prompt.
/// The keys are the names of the variables in the prompt template
/// and the values the actual values to use.
typedef InputValues = Map<String, dynamic>;

/// Partial input values used to format a prompt.
/// The keys are the names of the variables in the prompt template
/// and the values the actual values to use.
typedef PartialValues = Map<String, dynamic>;

/// {@template prompt_exception}
/// Exception thrown when some error occurs while working with a prompt.
/// {@endtemplate}
final class PromptException extends LangChainException {
  /// {@macro prompt_exception}
  const PromptException({
    super.message = '',
  }) : super(code: 'prompt');
}
