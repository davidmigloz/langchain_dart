import 'package:meta/meta.dart';

import '../chat_models/models/models.dart';
import 'base_prompt.dart';
import 'models/models.dart';

/// {@template base_chat_prompt_template}
/// Base class for chat prompt templates.
///
/// It exposes two methods:
/// - [format]: returns a [String] prompt given a set of input values.
/// - [formatPrompt]: returns a [PromptValue] given a set of input values.
/// - [formatMessages]: returns a list of [ChatMessage] given a set of input values.
/// {@endtemplate}
@immutable
abstract base class BaseChatPromptTemplate extends BasePromptTemplate {
  /// {@macro base_chat_prompt_template}
  const BaseChatPromptTemplate({
    required super.inputVariables,
    super.partialVariables,
  });

  @override
  String format(final InputValues values) {
    return formatPrompt(values).toString();
  }

  @override
  PromptValue formatPrompt(final InputValues values) {
    return PromptValue.chat(formatMessages(values));
  }

  /// Format input values into a list of messages.
  List<ChatMessage> formatMessages(final InputValues values);
}
