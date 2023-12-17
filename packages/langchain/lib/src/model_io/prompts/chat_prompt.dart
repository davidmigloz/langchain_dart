import 'package:collection/collection.dart';
import 'package:cross_file/cross_file.dart';
import 'package:meta/meta.dart';

import '../chat_models/chat_models.dart';
import 'base_chat_message_prompt.dart';
import 'base_chat_prompt.dart';
import 'base_prompt.dart';
import 'models/models.dart';
import 'prompt.dart';
import 'template.dart';

/// {@template chat_prompt_template}
/// A prompt template for chat models.
///
/// Whereas LLMs take a string as prompt, Chat models take a list of messages.
/// [ChatPromptTemplate] uses a list of template messages to generate the final prompt.
///
/// Each template message can be:
/// - [SystemChatMessagePromptTemplate] (for system messages)
/// - [HumanChatMessagePromptTemplate] (for human messages)
/// - [AIChatMessagePromptTemplate] (for AI messages)
/// - [CustomChatMessagePromptTemplate] (for custom role messages)
/// - [MessagePlaceholder] (for a single message placeholder)
/// - [MessagesPlaceholder] (for a list of messages placeholder)
///
/// Example:
/// ```dart
/// final promptTemplate = ChatPromptTemplate.fromPromptMessages([
///   ChatMessagePromptTemplate.system("Here's some context: {context}"),
///   ChatMessagePromptTemplate.human("Hello {foo}, I'm {bar}. Thanks for the {context}"),
///   ChatMessagePromptTemplate.ai("I'm an AI. I'm {foo}. I'm {bar}."),
/// ]);
/// final prompt = promptTemplate.formatPrompt({
///     'foo': 'GPT-4',
///     'bar': 'Gemini',
///     'context': 'competition',
/// });
/// final res = await chatModel.invoke(prompt);
/// ```
///
/// If you prompt template only contains one message, you can use the convenient factory constructor
/// [ChatPromptTemplate.fromTemplate].
///
/// ```dart
/// final promptTemplate = ChatPromptTemplate.fromTemplate("Hello {foo}, I'm {bar}. Thanks for the {context}");
/// ```
///
/// If your prompt template contains multiple messages, you can use the convenient factory constructor
/// [ChatPromptTemplate.fromTemplates].
///
/// ```dart
/// final promptTemplate = ChatPromptTemplate.fromTemplates([
///   (ChatMessageType.system, 'You are a helpful assistant that translates {input_language} to {output_language}.'),
///   (ChatMessageType.human, '{text}'),
/// ]);
/// ```
///
/// If you need a placeholder for a single message or a list of messages,
/// you can use [MessagePlaceholder] or [MessagesPlaceholder].
///
/// ```dart
/// final promptTemplate = ChatPromptTemplate.fromTemplates([
///   (ChatMessageType.system, "You are a helpful AI assistant."),
///   (ChatMessageType.messagesPlaceholder, 'history'),
///   (ChatMessageType.messagePlaceholder, 'input'),
/// ]);
/// ```
///
/// In general, prefer using [ChatPromptTemplate.fromTemplate] and [ChatPromptTemplate.fromTemplates] to create
/// a [ChatPromptTemplate] as the resulting code is more readable. Use the main [ChatPromptTemplate] constructor or
/// [ChatPromptTemplate.fromPromptMessages] for advanced use cases.
/// {@endtemplate}
@immutable
final class ChatPromptTemplate extends BaseChatPromptTemplate {
  /// {@macro chat_prompt_template}
  const ChatPromptTemplate({
    required super.inputVariables,
    super.partialVariables,
    required this.promptMessages,
  });

  /// Creates a chat prompt template with a single message from a string
  /// template.
  ///
  /// Example:
  /// ```dart
  /// final promptTemplate = ChatPromptTemplate.fromTemplate(
  ///   "Hello {foo}, I'm {bar}. Thanks for the {context}",
  ///   partialVariables: {'foo': 'GPT-4', 'bar': 'Gemini'},
  /// );
  /// final prompt = promptTemplate.formatPrompt({'context': 'competition'});
  /// final res = await chatModel.invoke(prompt);
  /// ```
  ///
  /// - [template] the template string.
  /// - [type] the type of chat message prompt template ([HumanChatMessagePromptTemplate] by default).
  /// - [customRole] the role of the message if [type] is [ChatMessageType.custom].
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  factory ChatPromptTemplate.fromTemplate(
    final String template, {
    final ChatMessageType type = ChatMessageType.human,
    final String? customRole,
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) {
    return ChatPromptTemplate.fromTemplates(
      [(type, template)],
      customRole: customRole,
      partialVariables: partialVariables,
      validateTemplate: validateTemplate,
    );
  }

  /// Creates a [ChatPromptTemplate] from a list of pairs of chat message prompt template type and template.
  ///
  /// Example:
  /// ```dart
  /// final promptTemplate = ChatPromptTemplate.fromTemplates([
  ///   (ChatMessageType.system, 'You are an assistant that translates {input_language} to {output_language}.'),
  ///   (ChatMessageType.human, '{text}'),
  /// ]);
  /// final prompt = promptTemplate.formatPrompt({
  ///     'input_language': 'English',
  ///     'output_language': 'French',
  ///     'text': 'I love programming.',
  /// });
  /// final res = await chatModel.invoke(prompt);
  /// ```
  ///
  /// - [messages] the list of pairs of type and templates.
  /// - [customRole] the role of the message if [type] is [ChatMessageType.custom].
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  factory ChatPromptTemplate.fromTemplates(
    final List<(ChatMessageType, String)> messages, {
    final String? customRole,
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) {
    final chatMessagePromptTemplates = messages.map((final message) {
      final (role, template) = message;
      return switch (role) {
        ChatMessageType.human => HumanChatMessagePromptTemplate.fromTemplate(
            template,
            partialVariables: partialVariables,
            validateTemplate: false,
          ),
        ChatMessageType.ai => AIChatMessagePromptTemplate.fromTemplate(
            template,
            partialVariables: partialVariables,
            validateTemplate: false,
          ),
        ChatMessageType.system => SystemChatMessagePromptTemplate.fromTemplate(
            template,
            partialVariables: partialVariables,
            validateTemplate: false,
          ),
        ChatMessageType.custom => CustomChatMessagePromptTemplate.fromTemplate(
            template,
            role: ArgumentError.checkNotNull(customRole, 'customRole'),
            partialVariables: partialVariables,
            validateTemplate: false,
          ),
        ChatMessageType.messagePlaceholder => MessagePlaceholder(
            variableName: template,
          ),
        ChatMessageType.messagesPlaceholder => MessagesPlaceholder(
            variableName: template,
          ),
      };
    }).toList(growable: false);
    return ChatPromptTemplate.fromPromptMessages(
      chatMessagePromptTemplates,
      validateTemplate: validateTemplate,
    );
  }

  /// Creates a [ChatPromptTemplate] with a list of template messages.
  ///
  /// - [promptMessages] the list of template messages. The list can contain:
  ///   * [SystemChatMessagePromptTemplate] (for system messages)
  ///   * [HumanChatMessagePromptTemplate] (for human messages)
  ///   * [AIChatMessagePromptTemplate] (for AI messages)
  ///   * [CustomChatMessagePromptTemplate] (for custom role messages)
  /// - [validateTemplate] whether to validate the template.
  factory ChatPromptTemplate.fromPromptMessages(
    final List<ChatMessagePromptTemplate> promptMessages, {
    final bool validateTemplate = true,
  }) {
    final inputVariables = promptMessages
        .map((final m) => m.inputVariables)
        .expand((final i) => i)
        .toSet();
    final partialVariables = {
      for (final m in promptMessages) ...?m.partialVariables,
    };
    final t = ChatPromptTemplate(
      inputVariables: inputVariables,
      partialVariables: partialVariables.isEmpty ? null : partialVariables,
      promptMessages: promptMessages,
    );
    if (validateTemplate) {
      t.validateTemplate();
    }
    return t;
  }

  /// Creates a [ChatPromptTemplate] with a single message from a file.
  ///
  /// - [templateFile] the path to the file containing the prompt template.
  /// - [type] the type of chat message prompt template ([HumanChatMessagePromptTemplate] by default).
  /// - [customRole] the role of the message if [type] is [ChatMessageType.custom].
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  static Future<ChatPromptTemplate> fromTemplateFile(
    final String templateFile, {
    final ChatMessageType type = ChatMessageType.human,
    final String? customRole,
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) async {
    final file = XFile(templateFile);
    final template = await file.readAsString();
    return ChatPromptTemplate.fromTemplate(
      template,
      type: type,
      customRole: customRole,
      partialVariables: partialVariables,
      validateTemplate: validateTemplate,
    );
  }

  /// The list of messages that make up the prompt template.
  final List<ChatMessagePromptTemplate> promptMessages;

  @override
  String get type => 'chat';

  @override
  BasePromptTemplate partial(final PartialValues values) {
    final newPromptMessages = promptMessages
        .map(
          (final ChatMessagePromptTemplate m) =>
              m.copyWith(prompt: m.prompt.partial(values)),
        )
        .toList(growable: false);
    return ChatPromptTemplate.fromPromptMessages(newPromptMessages);
  }

  @override
  void validateTemplate() {
    checkValidChatPromptTemplate(
      promptMessages: promptMessages,
      inputVariables: inputVariables,
      partialVariables: partialVariables?.keys,
    );
  }

  @override
  List<ChatMessage> formatMessages([final InputValues values = const {}]) {
    final allValues = mergePartialAndUserVariables(values);
    return promptMessages
        .map(
          (final m) => m.formatMessages({
            for (final inputVariable in m.inputVariables)
              inputVariable: ArgumentError.checkNotNull(
                allValues[inputVariable],
                inputVariable,
              ),
          }),
        )
        .expand((final i) => i)
        .toList(growable: false);
  }

  @override
  bool operator ==(covariant final ChatPromptTemplate other) {
    const setEqualsInputVariables = SetEquality<String>();
    const mapEqualsPartialVariables = MapEquality<String, dynamic>();
    const listEqualsPromptMessages = ListEquality<ChatMessagePromptTemplate>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            setEqualsInputVariables.equals(
              inputVariables,
              other.inputVariables,
            ) &&
            mapEqualsPartialVariables.equals(
              partialVariables,
              other.partialVariables,
            ) &&
            listEqualsPromptMessages.equals(
              promptMessages,
              other.promptMessages,
            );
  }

  @override
  int get hashCode =>
      inputVariables.hashCode ^
      partialVariables.hashCode ^
      promptMessages.hashCode;

  @override
  String toString() {
    return '''
ChatPromptTemplate{
  promptMessages: $promptMessages,
}''';
  }

  /// Creates a copy of this [ChatPromptTemplate] with the given fields.
  @override
  ChatPromptTemplate copyWith({
    final Set<String>? inputVariables,
    final PartialValues? partialVariables,
    final List<ChatMessagePromptTemplate>? promptMessages,
  }) {
    return ChatPromptTemplate(
      inputVariables: inputVariables ?? this.inputVariables,
      partialVariables: partialVariables ?? this.partialVariables,
      promptMessages: promptMessages ?? this.promptMessages,
    );
  }
}

/// The type of a chat message prompt template.
enum ChatMessageType {
  /// A [SystemChatMessagePromptTemplate].
  system,

  /// A [HumanChatMessagePromptTemplate].
  human,

  /// A [AIChatMessagePromptTemplate].
  ai,

  /// A [CustomChatMessagePromptTemplate].
  custom,

  /// A [MessagePlaceholder].
  messagePlaceholder,

  /// A [MessagesPlaceholder].
  messagesPlaceholder,
}

/// {@template system_chat_message_prompt_template}
/// A chat message prompt template for a [SystemChatMessagePromptTemplate] ([ChatMessageType.human]).
/// {@endtemplate}
@immutable
final class SystemChatMessagePromptTemplate
    extends StringMessagePromptTemplate {
  /// {@macro system_chat_message_prompt_template}
  const SystemChatMessagePromptTemplate({
    required super.prompt,
  });

  /// Creates a [SystemChatMessagePromptTemplate] from a string template.
  /// It considers the prompt a [SystemChatMessage].
  ///
  /// Example:
  /// ```dart
  /// final msgTemplate = SystemChatMessagePromptTemplate.fromTemplate("Here's some context: {context}");
  /// ```
  ///
  /// Alternatively, you can use [ChatMessagePromptTemplate.system] to achieve the same result.
  ///
  /// ```dart
  /// final msgTemplate = ChatMessagePromptTemplate.system("Here's some context: {context}");
  /// ```
  ///
  /// - [template] the template string.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  factory SystemChatMessagePromptTemplate.fromTemplate(
    final String template, {
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) {
    return SystemChatMessagePromptTemplate(
      prompt: PromptTemplate.fromTemplate(
        template,
        partialVariables: partialVariables,
        validateTemplate: validateTemplate,
      ),
    );
  }

  /// Load a prompt from a file.
  /// It considers the prompt a [SystemChatMessage].
  ///
  /// - [templateFile] the path to the file containing the prompt template.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  static Future<SystemChatMessagePromptTemplate> fromTemplateFile(
    final String templateFile, {
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) async {
    final file = XFile(templateFile);
    final template = await file.readAsString();
    return SystemChatMessagePromptTemplate.fromTemplate(
      template,
      partialVariables: partialVariables,
      validateTemplate: validateTemplate,
    );
  }

  @override
  ChatMessage format([final InputValues values = const {}]) {
    return ChatMessage.system(prompt.format(values));
  }

  @override
  String toString() {
    return '''
SystemChatMessagePromptTemplate{
  prompt: $prompt,
  inputVariables: $inputVariables,
  partialVariables: $partialVariables,
}''';
  }

  @override
  StringMessagePromptTemplate copyWith({
    final BasePromptTemplate? prompt,
  }) {
    return SystemChatMessagePromptTemplate(
      prompt: prompt as PromptTemplate? ?? this.prompt,
    );
  }
}

/// {@template human_chat_message_prompt_template}
/// A chat message prompt template for a [HumanChatMessage] ([ChatMessageType.human]).
/// {@endtemplate}
@immutable
final class HumanChatMessagePromptTemplate extends StringMessagePromptTemplate {
  /// {@macro human_chat_message_prompt_template}
  const HumanChatMessagePromptTemplate({
    required super.prompt,
  });

  /// Creates a [HumanChatMessagePromptTemplate] from a string template.
  /// It considers the prompt a [HumanChatMessage].
  ///
  /// Example:
  /// ```dart
  /// final msgTemplate = HumanChatMessagePromptTemplate.fromTemplate(
  ///   "Hello {foo}, I'm {bar}. Thanks for the {context}",
  /// );
  /// ```
  ///
  /// Alternatively, you can use [ChatMessagePromptTemplate.human] to achieve the same result.
  ///
  /// ```dart
  /// final msgTemplate = ChatMessagePromptTemplate.human(
  ///   "Hello {foo}, I'm {bar}. Thanks for the {context}",
  /// );
  /// ```
  ///
  /// - [template] the template string.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  factory HumanChatMessagePromptTemplate.fromTemplate(
    final String template, {
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) {
    return HumanChatMessagePromptTemplate(
      prompt: PromptTemplate.fromTemplate(
        template,
        partialVariables: partialVariables,
        validateTemplate: validateTemplate,
      ),
    );
  }

  /// Load a prompt from a file.
  /// It considers the prompt a [HumanChatMessage].
  ///
  /// - [templateFile] the path to the file containing the prompt template.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  static Future<HumanChatMessagePromptTemplate> fromTemplateFile(
    final String templateFile, {
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) async {
    final file = XFile(templateFile);
    final template = await file.readAsString();
    return HumanChatMessagePromptTemplate.fromTemplate(
      template,
      partialVariables: partialVariables,
      validateTemplate: validateTemplate,
    );
  }

  @override
  ChatMessage format([final InputValues values = const {}]) {
    return ChatMessage.humanText(prompt.format(values));
  }

  @override
  String toString() {
    return '''
HumanChatMessagePromptTemplate{
  prompt: $prompt,
  inputVariables: $inputVariables,
  partialVariables: $partialVariables,
}''';
  }

  @override
  StringMessagePromptTemplate copyWith({
    final BasePromptTemplate? prompt,
  }) {
    return HumanChatMessagePromptTemplate(
      prompt: prompt as PromptTemplate? ?? this.prompt,
    );
  }
}

/// {@template ai_chat_message_prompt_template}
/// A chat message prompt template for a [AIChatMessage] ([ChatMessageType.ai]).
/// {@endtemplate}
@immutable
final class AIChatMessagePromptTemplate extends StringMessagePromptTemplate {
  /// {@macro ai_chat_message_prompt_template}
  const AIChatMessagePromptTemplate({
    required super.prompt,
  });

  /// Creates a [AIChatMessagePromptTemplate] from a string template.
  /// It considers the prompt a [AIChatMessage].
  ///
  /// Example:
  /// ```dart
  /// final msgTemplate = AIChatMessagePromptTemplate.fromTemplate("I'm an AI. I'm {foo}. I'm {bar}.");
  /// ```
  ///
  /// Alternatively, you can use [ChatMessagePromptTemplate.ai] to achieve the same result.
  ///
  /// ```dart
  /// final msgTemplate = ChatMessagePromptTemplate.ai("I'm an AI. I'm {foo}. I'm {bar}.");
  /// ```
  ///
  /// - [template] the template string.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  factory AIChatMessagePromptTemplate.fromTemplate(
    final String template, {
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) {
    return AIChatMessagePromptTemplate(
      prompt: PromptTemplate.fromTemplate(
        template,
        partialVariables: partialVariables,
        validateTemplate: validateTemplate,
      ),
    );
  }

  /// Load a prompt from a file.
  /// It considers the prompt a [AIChatMessage].
  ///
  /// - [templateFile] the path to the file containing the prompt template.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  static Future<AIChatMessagePromptTemplate> fromTemplateFile(
    final String templateFile, {
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) async {
    final file = XFile(templateFile);
    final template = await file.readAsString();
    return AIChatMessagePromptTemplate.fromTemplate(
      template,
      partialVariables: partialVariables,
      validateTemplate: validateTemplate,
    );
  }

  @override
  ChatMessage format([final InputValues values = const {}]) {
    return ChatMessage.ai(prompt.format(values));
  }

  @override
  String toString() {
    return '''
AIChatMessagePromptTemplate{
  prompt: $prompt,
  inputVariables: $inputVariables,
  partialVariables: $partialVariables,
}''';
  }

  @override
  StringMessagePromptTemplate copyWith({
    final BasePromptTemplate? prompt,
  }) {
    return AIChatMessagePromptTemplate(
      prompt: prompt as PromptTemplate? ?? this.prompt,
    );
  }
}

/// {@template custom_chat_message_prompt_template}
/// A template for a [CustomChatMessage] ([ChatMessageType.custom]).
/// {@endtemplate}
@immutable
final class CustomChatMessagePromptTemplate
    extends StringMessagePromptTemplate {
  /// {@macro custom_chat_message_prompt_template}
  const CustomChatMessagePromptTemplate({
    required super.prompt,
    required this.role,
  });

  /// Creates a [CustomChatMessagePromptTemplate] from a string template.
  /// It considers the prompt a [CustomChatMessage].
  ///
  /// Example:
  /// ```dart
  /// final msgTemplate = CustomChatMessagePromptTemplate.fromTemplate(
  ///   "I'm an assistant. I'm {foo}. I'm {bar}.",
  ///   role: 'assistant',
  /// );
  /// ```
  ///
  /// Alternatively, you can use [ChatMessagePromptTemplate.custom] to achieve the same result.
  ///
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
  factory CustomChatMessagePromptTemplate.fromTemplate(
    final String template, {
    required final String role,
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) {
    return CustomChatMessagePromptTemplate(
      prompt: PromptTemplate.fromTemplate(
        template,
        partialVariables: partialVariables,
        validateTemplate: validateTemplate,
      ),
      role: role,
    );
  }

  /// Load a prompt from a file.
  /// It considers the prompt a [CustomChatMessage].
  ///
  /// - [templateFile] the path to the file containing the prompt template.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  static Future<CustomChatMessagePromptTemplate> fromTemplateFile(
    final String templateFile, {
    required final String role,
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) async {
    final file = XFile(templateFile);
    final template = await file.readAsString();
    return CustomChatMessagePromptTemplate.fromTemplate(
      template,
      role: role,
      partialVariables: partialVariables,
      validateTemplate: validateTemplate,
    );
  }

  /// The role of the message.
  final String role;

  @override
  ChatMessage format([final InputValues values = const {}]) {
    return ChatMessage.custom(prompt.format(values), role: role);
  }

  @override
  String toString() {
    return '''
CustomChatMessagePromptTemplate{
  prompt: $prompt,
  role: $role,
  inputVariables: $inputVariables,
  partialVariables: $partialVariables,
}''';
  }

  @override
  StringMessagePromptTemplate copyWith({
    final BasePromptTemplate? prompt,
  }) {
    return CustomChatMessagePromptTemplate(
      prompt: prompt as PromptTemplate? ?? this.prompt,
      role: role,
    );
  }
}

/// {@template message_placeholder}
/// Prompt template that assumes the variable is a [ChatMessage] ([ChatMessageType.messagePlaceholder]).
///
/// This is useful when you want to use a single [ChatMessage] in the prompt.
/// For example, when you decide the type of message at runtime (e.g.
/// [HumanChatMessage] or [FunctionChatMessage]).
///
/// If you need to add multiple messages, use [MessagesPlaceholder].
///
/// Example:
/// ```dart
/// ChatPromptTemplate.fromPromptMessages([
///   ChatMessagePromptTemplate.system('You are a helpful AI assistant'),
///   ChatMessagePromptTemplate.messagesPlaceholder('history'),
///   ChatMessagePromptTemplate.messagePlaceholder('input'),
/// ]);
/// ```
///
/// Alternatively, you can use [ChatPromptTemplate.fromTemplates] to achieve the same result.
///
/// ```dart
/// final promptTemplate = ChatPromptTemplate.fromTemplates([
///   (ChatMessageType.system, 'You are a helpful AI assistant'),
///   (ChatMessageType.messagesPlaceholder, 'history'),
///   (ChatMessageType.messagePlaceholder, 'input'),
/// ]);
/// ```
/// {@endtemplate}
@immutable
final class MessagePlaceholder extends ChatMessagePromptTemplate {
  /// {@macro message_placeholder}
  const MessagePlaceholder({required this.variableName})
      : super(prompt: const PromptTemplate(inputVariables: {}, template: ''));

  /// The name of the placeholder variable.
  final String variableName;

  @override
  Set<String> get inputVariables => {variableName};

  @override
  PartialValues? get partialVariables => null;

  @override
  List<ChatMessage> formatMessages([
    final Map<String, dynamic> values = const {},
  ]) {
    final message = values[variableName] as ChatMessage?;
    return [if (message != null) message];
  }

  @override
  String toString() {
    return '''
MessagePlaceholder{
  variableName: $variableName,
  inputVariables: $inputVariables,
  partialVariables: $partialVariables,
}''';
  }

  @override
  ChatMessagePromptTemplate copyWith({
    final BasePromptTemplate? prompt,
    final String? variableName,
  }) {
    return MessagePlaceholder(
      variableName: variableName ?? this.variableName,
    );
  }
}

/// {@template messages_placeholder}
/// Prompt template that assumes the variable is a list of [ChatMessage] ([ChatMessageType.messagesPlaceholder]).
///
/// This is useful for when you want to use a list of messages in the prompt.
/// For example, after retrieving them from memory.
///
/// If you need to add a single message, use [MessagePlaceholder].
///
/// Example:
/// ```dart
/// ChatPromptTemplate.fromPromptMessages([
///   ChatMessagePromptTemplate.system('You are a helpful AI assistant'),
///   ChatMessagePromptTemplate.messagesPlaceholder('history'),
///   ChatMessagePromptTemplate.messagePlaceholder('input'),
/// ]);
/// ```
///
/// Alternatively, you can use [ChatPromptTemplate.fromTemplates] to achieve the same result.
///
/// ```dart
/// final promptTemplate = ChatPromptTemplate.fromTemplates([
///   (ChatMessageType.system, 'You are a helpful AI assistant'),
///   (ChatMessageType.messagesPlaceholder, 'history'),
///   (ChatMessageType.messagePlaceholder, 'input'),
/// ]);
/// ```
/// {@endtemplate}
@immutable
final class MessagesPlaceholder extends ChatMessagePromptTemplate {
  /// {@macro messages_placeholder}
  const MessagesPlaceholder({required this.variableName})
      : super(prompt: const PromptTemplate(inputVariables: {}, template: ''));

  /// The name of the placeholder variable.
  final String variableName;

  @override
  Set<String> get inputVariables => {variableName};

  @override
  PartialValues? get partialVariables => null;

  @override
  List<ChatMessage> formatMessages([
    final Map<String, dynamic> values = const {},
  ]) {
    return values[variableName] as List<ChatMessage>? ?? const [];
  }

  @override
  String toString() {
    return '''
MessagesPlaceholder{
  variableName: $variableName,
  inputVariables: $inputVariables,
  partialVariables: $partialVariables,
}''';
  }

  @override
  ChatMessagePromptTemplate copyWith({
    final BasePromptTemplate? prompt,
    final String? variableName,
  }) {
    return MessagesPlaceholder(
      variableName: variableName ?? this.variableName,
    );
  }
}
