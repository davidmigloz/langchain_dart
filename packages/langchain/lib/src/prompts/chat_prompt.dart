import 'package:collection/collection.dart';
import 'package:cross_file/cross_file.dart';
import 'package:meta/meta.dart';

import '../chat_models/chat_models.dart';
import 'base_chat_prompt.dart';
import 'base_prompt.dart';
import 'models/models.dart';
import 'prompt.dart';
import 'template.dart';

/// {@template chat_prompt_template}
/// Schema to represent a prompt for a Chat model.
///
/// Whereas LLMs take a string as prompt, Chat models take a list of messages.
/// [ChatPromptTemplate] uses a list of template messages to generate the final
/// prompt.
///
/// Each template message can be:
/// - [SystemChatMessagePromptTemplate] (for system messages)
/// - [HumanChatMessagePromptTemplate] (for human messages)
/// - [AIChatMessagePromptTemplate] (for AI messages)
/// - [CustomChatMessagePromptTemplate] (for custom role messages)
///
/// Example:
/// ```dart
/// final chatPrompt = ChatPromptTemplate.fromMessages([
///   SystemChatMessagePromptTemplate.fromTemplate(
///     "Here's some context: {context}",
///   ),
///   HumanChatMessagePromptTemplate.fromTemplate(
///     "Hello {foo}, I'm {bar}. Thanks for the {context}",
///   ),
///   AIChatMessagePromptTemplate.fromTemplate(
///     "I'm an AI. I'm {foo}. I'm {bar}.",
///   ),
/// ]);
/// final promptValue = chatPrompt.formatPrompt(
///   {
///     'foo': 'foo',
///     'bar': 'bar',
///     'context': 'It is 1st January 2023.',
///   },
/// );
/// ```
///
/// If you only want to use a single message, you can use
/// [ChatPromptTemplate.fromTemplate].
///
/// ```dart
/// final chatPrompt = ChatPromptTemplate.fromTemplate(
///   "Hello {foo}, I'm {bar}. Thanks for the {context}",
///   partialVariables: {'foo': 'foo', 'bar': 'bar'},
/// );
/// ```
///
/// The default constructor does not validate the template. You can use
/// [ChatPromptTemplate.validateTemplate] to validate the template.
/// {@endtemplate}
@immutable
final class ChatPromptTemplate extends BaseChatPromptTemplate {
  /// {@macro chat_prompt_template}
  const ChatPromptTemplate({
    required super.inputVariables,
    super.partialVariables,
    required this.promptMessages,
  });

  /// Creates a [ChatPromptTemplate] with a single message from a string
  /// template.
  ///
  /// Example:
  /// ```dart
  /// final chatPrompt = ChatPromptTemplate.fromTemplate(
  ///   "Hello {foo}, I'm {bar}. Thanks for the {context}",
  ///   partialVariables: {'foo': 'foo', 'bar': 'bar'},
  /// );
  /// ```
  ///
  /// - [template] the template string.
  /// - [role] the role of the message ([HumanChatMessage] by default).
  /// - [customRole] the role of the message if [role] is
  ///   [ChatMessageRole.custom].
  /// - [partialVariables] the partial variables to use for the template.
  /// - [templateFormat] the format of the template (only fString format is
  ///   supported for now).
  /// - [validateTemplate] whether to validate the template.
  factory ChatPromptTemplate.fromTemplate(
    final String template, {
    final ChatMessageRole role = ChatMessageRole.human,
    final String? customRole,
    final PartialValues? partialVariables,
    final TemplateFormat templateFormat = TemplateFormat.fString,
    final bool validateTemplate = true,
  }) {
    final messagesPromptTemplate = switch (role) {
      ChatMessageRole.human => HumanChatMessagePromptTemplate.fromTemplate(
          template,
          partialVariables: partialVariables,
          templateFormat: templateFormat,
          validateTemplate: false,
        ),
      ChatMessageRole.ai => AIChatMessagePromptTemplate.fromTemplate(
          template,
          partialVariables: partialVariables,
          templateFormat: templateFormat,
          validateTemplate: false,
        ),
      ChatMessageRole.system => SystemChatMessagePromptTemplate.fromTemplate(
          template,
          partialVariables: partialVariables,
          templateFormat: templateFormat,
          validateTemplate: false,
        ),
      ChatMessageRole.custom => CustomChatMessagePromptTemplate.fromTemplate(
          template,
          role: ArgumentError.checkNotNull(customRole, 'customRole'),
          partialVariables: partialVariables,
          templateFormat: templateFormat,
          validateTemplate: false,
        ),
    };
    final t = ChatPromptTemplate.fromPromptMessages([messagesPromptTemplate]);
    if (validateTemplate) {
      t.validateTemplate();
    }
    return t;
  }

  /// Creates a [ChatPromptTemplate] with a single message from a file.
  ///
  /// - [templateFile] the path to the file containing the prompt template.
  /// - [role] the role of the message ([HumanChatMessage] by default).
  /// - [customRole] the role of the message if [role] is
  ///   [ChatMessageRole.custom].
  /// - [partialVariables] the partial variables to use for the template.
  /// - [templateFormat] the format of the template.
  /// - [validateTemplate] whether to validate the template.
  static Future<ChatPromptTemplate> fromTemplateFile(
    final String templateFile, {
    final ChatMessageRole role = ChatMessageRole.human,
    final String? customRole,
    final PartialValues? partialVariables,
    final TemplateFormat templateFormat = TemplateFormat.fString,
    final bool validateTemplate = true,
  }) async {
    final file = XFile(templateFile);
    final template = await file.readAsString();
    return ChatPromptTemplate.fromTemplate(
      template,
      role: role,
      customRole: customRole,
      partialVariables: partialVariables,
      templateFormat: templateFormat,
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
    final List<BaseMessagePromptTemplate> promptMessages, {
    final bool validateTemplate = true,
  }) {
    final inputVariables = promptMessages
        .map((final m) => m.inputVariables)
        .expand((final i) => i)
        .toSet()
        .toList(growable: false);
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

  /// The list of messages that make up the prompt template.
  final List<BaseMessagePromptTemplate> promptMessages;

  @override
  String get type => 'chat';

  @override
  BasePromptTemplate partial(final PartialValues values) {
    final newPromptMessages = promptMessages
        .map(
          (final BaseMessagePromptTemplate m) =>
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
    const listEqualsInputVariables = ListEquality<String>();
    const mapEqualsPartialVariables = MapEquality<String, dynamic>();
    const listEqualsPromptMessages = ListEquality<BaseMessagePromptTemplate>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            listEqualsInputVariables.equals(
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
  ChatPromptTemplate copyWith({
    final List<String>? inputVariables,
    final PartialValues? partialVariables,
    final List<BaseMessagePromptTemplate>? promptMessages,
  }) {
    return ChatPromptTemplate(
      inputVariables: inputVariables ?? this.inputVariables,
      partialVariables: partialVariables ?? this.partialVariables,
      promptMessages: promptMessages ?? this.promptMessages,
    );
  }
}

/// {@template system_chat_message_prompt_template}
/// A template for a [SystemChatMessage].
/// {@endtemplate}
@immutable
final class SystemChatMessagePromptTemplate
    extends BaseStringMessagePromptTemplate {
  /// {@macro system_chat_message_prompt_template}
  const SystemChatMessagePromptTemplate({
    required super.prompt,
  });

  /// Creates a prompt template from a string template.
  /// (e.g. "This is a {foo} test.").
  /// It considers the prompt a [SystemChatMessage].
  ///
  /// - [template] the template string.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [templateFormat] the format of the template.
  /// - [validateTemplate] whether to validate the template.
  factory SystemChatMessagePromptTemplate.fromTemplate(
    final String template, {
    final PartialValues? partialVariables,
    final TemplateFormat templateFormat = TemplateFormat.fString,
    final bool validateTemplate = true,
  }) {
    return SystemChatMessagePromptTemplate(
      prompt: PromptTemplate.fromTemplate(
        template,
        partialVariables: partialVariables,
        templateFormat: templateFormat,
        validateTemplate: validateTemplate,
      ),
    );
  }

  /// Load a prompt from a file.
  /// It considers the prompt a [SystemChatMessage].
  ///
  /// - [templateFile] the path to the file containing the prompt template.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [templateFormat] the format of the template.
  /// - [validateTemplate] whether to validate the template.
  static Future<SystemChatMessagePromptTemplate> fromTemplateFile(
    final String templateFile, {
    final PartialValues? partialVariables,
    final TemplateFormat templateFormat = TemplateFormat.fString,
    final bool validateTemplate = true,
  }) async {
    final file = XFile(templateFile);
    final template = await file.readAsString();
    return SystemChatMessagePromptTemplate.fromTemplate(
      template,
      partialVariables: partialVariables,
      templateFormat: templateFormat,
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
  BaseStringMessagePromptTemplate copyWith({
    final BasePromptTemplate? prompt,
  }) {
    return SystemChatMessagePromptTemplate(
      prompt: prompt as BaseStringPromptTemplate? ?? this.prompt,
    );
  }
}

/// {@template human_chat_message_prompt_template}
/// A template for a [HumanChatMessage].
/// {@endtemplate}
@immutable
final class HumanChatMessagePromptTemplate
    extends BaseStringMessagePromptTemplate {
  /// {@macro human_chat_message_prompt_template}
  const HumanChatMessagePromptTemplate({
    required super.prompt,
  });

  /// Creates a prompt template from a string template.
  /// (e.g. "This is a {foo} test.").
  /// It considers the prompt a [HumanChatMessage].
  ///
  /// - [template] the template string.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [templateFormat] the format of the template.
  /// - [validateTemplate] whether to validate the template.
  factory HumanChatMessagePromptTemplate.fromTemplate(
    final String template, {
    final PartialValues? partialVariables,
    final TemplateFormat templateFormat = TemplateFormat.fString,
    final bool validateTemplate = true,
  }) {
    return HumanChatMessagePromptTemplate(
      prompt: PromptTemplate.fromTemplate(
        template,
        partialVariables: partialVariables,
        templateFormat: templateFormat,
        validateTemplate: validateTemplate,
      ),
    );
  }

  /// Load a prompt from a file.
  /// It considers the prompt a [HumanChatMessage].
  ///
  /// - [templateFile] the path to the file containing the prompt template.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [templateFormat] the format of the template.
  /// - [validateTemplate] whether to validate the template.
  static Future<HumanChatMessagePromptTemplate> fromTemplateFile(
    final String templateFile, {
    final PartialValues? partialVariables,
    final TemplateFormat templateFormat = TemplateFormat.fString,
    final bool validateTemplate = true,
  }) async {
    final file = XFile(templateFile);
    final template = await file.readAsString();
    return HumanChatMessagePromptTemplate.fromTemplate(
      template,
      partialVariables: partialVariables,
      templateFormat: templateFormat,
      validateTemplate: validateTemplate,
    );
  }

  @override
  ChatMessage format([final InputValues values = const {}]) {
    return ChatMessage.human(prompt.format(values));
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
  BaseStringMessagePromptTemplate copyWith({
    final BasePromptTemplate? prompt,
  }) {
    return HumanChatMessagePromptTemplate(
      prompt: prompt as BaseStringPromptTemplate? ?? this.prompt,
    );
  }
}

/// {@template ai_chat_message_prompt_template}
/// A template for a [AIChatMessage].
/// {@endtemplate}
@immutable
final class AIChatMessagePromptTemplate
    extends BaseStringMessagePromptTemplate {
  /// {@macro ai_chat_message_prompt_template}
  const AIChatMessagePromptTemplate({
    required super.prompt,
  });

  /// Creates a prompt template from a string template.
  /// (e.g. "This is a {foo} test.").
  /// It considers the prompt a [AIChatMessage].
  ///
  /// - [template] the template string.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [templateFormat] the format of the template.
  /// - [validateTemplate] whether to validate the template.
  factory AIChatMessagePromptTemplate.fromTemplate(
    final String template, {
    final PartialValues? partialVariables,
    final TemplateFormat templateFormat = TemplateFormat.fString,
    final bool validateTemplate = true,
  }) {
    return AIChatMessagePromptTemplate(
      prompt: PromptTemplate.fromTemplate(
        template,
        partialVariables: partialVariables,
        templateFormat: templateFormat,
        validateTemplate: validateTemplate,
      ),
    );
  }

  /// Load a prompt from a file.
  /// It considers the prompt a [AIChatMessage].
  ///
  /// - [templateFile] the path to the file containing the prompt template.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [templateFormat] the format of the template.
  /// - [validateTemplate] whether to validate the template.
  static Future<AIChatMessagePromptTemplate> fromTemplateFile(
    final String templateFile, {
    final PartialValues? partialVariables,
    final TemplateFormat templateFormat = TemplateFormat.fString,
    final bool validateTemplate = true,
  }) async {
    final file = XFile(templateFile);
    final template = await file.readAsString();
    return AIChatMessagePromptTemplate.fromTemplate(
      template,
      partialVariables: partialVariables,
      templateFormat: templateFormat,
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
  BaseStringMessagePromptTemplate copyWith({
    final BasePromptTemplate? prompt,
  }) {
    return AIChatMessagePromptTemplate(
      prompt: prompt as BaseStringPromptTemplate? ?? this.prompt,
    );
  }
}

/// {@template custom_chat_message_prompt_template}
/// A template for a [CustomChatMessage].
/// {@endtemplate}
@immutable
final class CustomChatMessagePromptTemplate
    extends BaseStringMessagePromptTemplate {
  /// {@macro custom_chat_message_prompt_template}
  const CustomChatMessagePromptTemplate({
    required super.prompt,
    required this.role,
  });

  /// Creates a prompt template from a string template.
  /// (e.g. "This is a {foo} test.").
  /// It considers the prompt a [CustomChatMessage].
  ///
  /// - [template] the template string.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [templateFormat] the format of the template.
  /// - [validateTemplate] whether to validate the template.
  factory CustomChatMessagePromptTemplate.fromTemplate(
    final String template, {
    required final String role,
    final PartialValues? partialVariables,
    final TemplateFormat templateFormat = TemplateFormat.fString,
    final bool validateTemplate = true,
  }) {
    return CustomChatMessagePromptTemplate(
      prompt: PromptTemplate.fromTemplate(
        template,
        partialVariables: partialVariables,
        templateFormat: templateFormat,
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
  /// - [templateFormat] the format of the template.
  /// - [validateTemplate] whether to validate the template.
  static Future<CustomChatMessagePromptTemplate> fromTemplateFile(
    final String templateFile, {
    required final String role,
    final PartialValues? partialVariables,
    final TemplateFormat templateFormat = TemplateFormat.fString,
    final bool validateTemplate = true,
  }) async {
    final file = XFile(templateFile);
    final template = await file.readAsString();
    return CustomChatMessagePromptTemplate.fromTemplate(
      template,
      role: role,
      partialVariables: partialVariables,
      templateFormat: templateFormat,
      validateTemplate: validateTemplate,
    );
  }

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
  BaseStringMessagePromptTemplate copyWith({
    final BasePromptTemplate? prompt,
  }) {
    return CustomChatMessagePromptTemplate(
      prompt: prompt as BaseStringPromptTemplate? ?? this.prompt,
      role: role,
    );
  }
}

/// {@template messages_placeholder}
/// Prompt template that assumes variable is already list of messages.
/// {@endtemplate}
@immutable
final class MessagesPlaceholder extends BaseMessagePromptTemplate {
  /// {@macro messages_placeholder}
  const MessagesPlaceholder({required this.variableName})
      : super(prompt: const PromptTemplate(inputVariables: [], template: ''));

  final String variableName;

  @override
  List<String> get inputVariables => [variableName];

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
  BaseMessagePromptTemplate copyWith({
    final BasePromptTemplate? prompt,
    final String? variableName,
  }) {
    return MessagesPlaceholder(
      variableName: variableName ?? this.variableName,
    );
  }
}
