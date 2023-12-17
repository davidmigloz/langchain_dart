import 'package:meta/meta.dart';

import '../../core/core.dart';
import '../chat_models/models/models.dart';
import 'base_prompt.dart';
import 'chat_prompt.dart';
import 'models/models.dart';
import 'prompt.dart';

/// {@template chat_message_prompt_template}
/// Base class for all message templates in a [ChatPromptTemplate].
/// {@endtemplate}
@immutable
abstract base class ChatMessagePromptTemplate
    extends Runnable<InputValues, BaseLangChainOptions, List<ChatMessage>> {
  /// {@macro chat_message_prompt_template}
  const ChatMessagePromptTemplate({required this.prompt});

  /// The prompt template for the message.
  final BasePromptTemplate prompt;

  /// Input variables of all the messages in the prompt template.
  Set<String> get inputVariables;

  /// Partial variables.
  PartialValues? get partialVariables;

  /// Creates a [SystemChatMessagePromptTemplate] from a string template.
  ///
  /// This is a convenience factory equivalent to [SystemChatMessagePromptTemplate.fromTemplate].
  ///
  /// Example:
  /// ```dart
  /// final msgTemplate = ChatMessagePromptTemplate.system("Here's some context: {context}");
  /// ```
  ///
  /// - [template] the template string.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  factory ChatMessagePromptTemplate.system(
    final String template, {
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) {
    return SystemChatMessagePromptTemplate.fromTemplate(
      template,
      partialVariables: partialVariables,
      validateTemplate: validateTemplate,
    );
  }

  /// Creates a [HumanChatMessagePromptTemplate] from a string template.
  ///
  /// This is a convenience factory equivalent to [HumanChatMessagePromptTemplate.fromTemplate].
  ///
  /// Example:
  /// ```dart
  /// final msgTemplate = ChatMessagePromptTemplate.human(
  ///   "Hello {foo}, I'm {bar}. Thanks for the {context}",
  /// );
  /// ```
  ///
  /// - [template] the template string.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  factory ChatMessagePromptTemplate.human(
    final String template, {
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) {
    return HumanChatMessagePromptTemplate.fromTemplate(
      template,
      partialVariables: partialVariables,
      validateTemplate: validateTemplate,
    );
  }

  /// Creates a [AIChatMessagePromptTemplate] from a string template.
  ///
  /// This is a convenience factory equivalent to [AIChatMessagePromptTemplate.fromTemplate].
  ///
  /// Example:
  /// ```dart
  /// final msgTemplate = ChatMessagePromptTemplate.ai("I'm an AI. I'm {foo}. I'm {bar}.");
  /// ```
  ///
  /// - [template] the template string.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  factory ChatMessagePromptTemplate.ai(
    final String template, {
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) {
    return AIChatMessagePromptTemplate.fromTemplate(
      template,
      partialVariables: partialVariables,
      validateTemplate: validateTemplate,
    );
  }

  /// Creates a [CustomChatMessagePromptTemplate] from a string template.
  ///
  /// This is a convenience factory equivalent to [CustomChatMessagePromptTemplate.fromTemplate].
  ///
  /// Example:
  /// ```dart
  /// final msgTemplate = ChatMessagePromptTemplate.custom(
  ///   "I'm an assistant. I'm {foo}. I'm {bar}.",
  ///   role: 'assistant',
  /// );
  /// ```
  ///
  /// - [template] the template string.
  /// - [role] the role of the message.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  factory ChatMessagePromptTemplate.custom(
    final String template, {
    required final String role,
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) {
    return CustomChatMessagePromptTemplate.fromTemplate(
      template,
      role: role,
      partialVariables: partialVariables,
      validateTemplate: validateTemplate,
    );
  }

  /// Creates a [MessagePlaceholder], a prompt template that assumes the variable is a [ChatMessage].
  ///
  /// This is useful when you want to use a single [ChatMessage] in the prompt.
  /// For example, when you decide the type of message at runtime (e.g.
  /// [HumanChatMessage] or [FunctionChatMessage]).
  ///
  /// This is a convenience factory equivalent to [MessagePlaceholder] constructor.
  ///
  /// If you need to add multiple messages, use [ChatMessagePromptTemplate.messagesPlaceholder].
  ///
  /// Example:
  /// ```dart
  /// final promptTemplate = ChatPromptTemplate.fromPromptMessages([
  ///   ChatMessagePromptTemplate.system('You are a helpful AI assistant'),
  ///   ChatMessagePromptTemplate.messagesPlaceholder('history'),
  ///   ChatMessagePromptTemplate.messagePlaceholder('input'),
  /// ]);
  /// ```
  ///
  /// - [variableName] the name of the placeholder variable.
  factory ChatMessagePromptTemplate.messagePlaceholder(
    final String variableName,
  ) {
    return MessagePlaceholder(variableName: variableName);
  }

  /// Creates a [MessagesPlaceholder], a prompt template that assumes the variable is a list of [ChatMessage].
  ///
  /// This is useful for when you want to use a list of messages in the prompt.
  /// For example, after retrieving them from memory.
  ///
  /// This is a convenience factory equivalent to [MessagesPlaceholder] constructor.
  ///
  /// If you need to add a single message, use [ChatMessagePromptTemplate.messagePlaceholder].
  ///
  /// Example:
  /// ```dart
  /// final promptTemplate = ChatPromptTemplate.fromPromptMessages([
  ///   ChatMessagePromptTemplate.system('You are a helpful AI assistant'),
  ///   ChatMessagePromptTemplate.messagesPlaceholder('history'),
  ///   ChatMessagePromptTemplate.messagePlaceholder('input'),
  /// ]);
  /// ```
  ///
  /// - [variableName] the name of the placeholder variable.
  factory ChatMessagePromptTemplate.messagesPlaceholder(
    final String variableName,
  ) {
    return MessagesPlaceholder(variableName: variableName);
  }

  /// Format the prompt with the inputs returning a list of messages.
  ///
  /// - [input] - Any arguments to be passed to the prompt template.
  @override
  Future<List<ChatMessage>> invoke(
    final InputValues input, {
    final BaseLangChainOptions? options,
  }) {
    return Future.value(formatMessages(input));
  }

  /// Format the prompt with the inputs returning a list of messages.
  ///
  /// - [values] - Any arguments to be passed to the prompt template.
  List<ChatMessage> formatMessages(final InputValues values);

  @override
  bool operator ==(covariant final ChatMessagePromptTemplate other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && prompt == other.prompt;

  @override
  int get hashCode => prompt.hashCode;

  @override
  String toString() {
    return '''
BaseChatMessagePromptTemplate{
  prompt: $prompt, 
  inputVariables: $inputVariables, 
  partialVariables: $partialVariables,
}''';
  }

  /// Return a new [ChatMessagePromptTemplate] instance with the given
  /// values.
  ChatMessagePromptTemplate copyWith({
    final BasePromptTemplate? prompt,
  });
}

/// {@template string_message_prompt_template}
/// Base class for all string message templates in a [ChatPromptTemplate].
/// {@endtemplate}
@immutable
abstract base class StringMessagePromptTemplate
    extends ChatMessagePromptTemplate {
  /// {@macro string_message_prompt_template}
  const StringMessagePromptTemplate({
    required final PromptTemplate prompt,
  }) : super(prompt: prompt);

  @override
  PromptTemplate get prompt => super.prompt as PromptTemplate;

  @override
  Set<String> get inputVariables => prompt.inputVariables;

  @override
  PartialValues? get partialVariables => prompt.partialVariables;

  @override
  List<ChatMessage> formatMessages(final InputValues values) {
    return [format(values)];
  }

  /// Format the prompt with the inputs.
  ///
  /// - [values] - Any arguments to be passed to the prompt template.
  ChatMessage format([final InputValues values = const {}]);

  /// Return a new [StringMessagePromptTemplate] instance with the given
  /// values.
  @override
  StringMessagePromptTemplate copyWith({
    final BasePromptTemplate? prompt,
  });
}
