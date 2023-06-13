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
/// - [formatMessages]: returns a list of [ChatMessage] given a set of input
///   values.
/// {@endtemplate}
@immutable
abstract base class BaseChatPromptTemplate extends BasePromptTemplate {
  /// {@macro base_chat_prompt_template}
  BaseChatPromptTemplate({
    required super.inputVariables,
    super.partialVariables,
  });

  @override
  String format([final InputValues values = const {}]) {
    return formatPrompt(values).toString();
  }

  @override
  PromptValue formatPrompt([final InputValues values = const {}]) {
    return ChatPromptValue(formatMessages(values));
  }

  /// Format input values into a list of messages.
  List<ChatMessage> formatMessages([
    final InputValues values = const {},
  ]);
}

/// {@template base_message_prompt_template}
/// Base class for all message templates in a [ChatPromptTemplate].
/// {@endtemplate}
@immutable
abstract base class BaseMessagePromptTemplate {
  /// {@macro base_message_prompt_template}
  const BaseMessagePromptTemplate({required this.prompt});

  /// The prompt template for the message.
  final BasePromptTemplate prompt;

  /// Input variables of all the messages in the prompt template.
  List<String> get inputVariables;

  /// Partial variables.
  PartialValues? get partialVariables;

  /// Format the prompt with the inputs returning a list of messages.
  ///
  /// - [values] - Any arguments to be passed to the prompt template.
  List<ChatMessage> formatMessages([
    final InputValues values = const {},
  ]);

  @override
  bool operator ==(covariant final BaseMessagePromptTemplate other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && prompt == other.prompt;

  @override
  int get hashCode => prompt.hashCode;

  @override
  String toString() {
    return '''
BaseMessagePromptTemplate{
  prompt: $prompt, 
  inputVariables: $inputVariables, 
  partialVariables: $partialVariables,
}''';
  }

  /// Return a new [BaseMessagePromptTemplate] instance with the given
  /// values.
  BaseMessagePromptTemplate copyWith({
    final BasePromptTemplate? prompt,
  });
}

/// {@template base_string_message_prompt_template}
/// Base class for all string message templates in a [ChatPromptTemplate].
/// {@endtemplate}
@immutable
abstract base class BaseStringMessagePromptTemplate
    extends BaseMessagePromptTemplate {
  /// {@macro base_string_message_prompt_template}
  const BaseStringMessagePromptTemplate({
    required final BaseStringPromptTemplate prompt,
  }) : super(prompt: prompt);

  @override
  BaseStringPromptTemplate get prompt =>
      super.prompt as BaseStringPromptTemplate;

  @override
  List<String> get inputVariables => prompt.inputVariables;

  @override
  PartialValues? get partialVariables => prompt.partialVariables;

  @override
  List<ChatMessage> formatMessages([
    final InputValues values = const {},
  ]) {
    return [format(values)];
  }

  /// Format the prompt with the inputs.
  ///
  /// - [values] - Any arguments to be passed to the prompt template.
  ChatMessage format([final InputValues values = const {}]);

  /// Return a new [BaseStringMessagePromptTemplate] instance with the given
  /// values.
  @override
  BaseStringMessagePromptTemplate copyWith({
    final BasePromptTemplate? prompt,
  });
}
