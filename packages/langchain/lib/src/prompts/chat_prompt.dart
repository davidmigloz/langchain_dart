import 'package:collection/collection.dart';
import 'package:cross_file/cross_file.dart';

import '../chat_models/chat_models.dart';
import 'base_chat_prompt.dart';
import 'base_prompt.dart';
import 'models/models.dart';
import 'prompt.dart';
import 'template.dart';

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
final class ChatPromptTemplate extends BaseChatPromptTemplate {
  ChatPromptTemplate({
    required super.inputVariables,
    super.partialVariables,
    required this.promptMessages,
    this.validateTemplate = true,
  }) {
    if (validateTemplate) {
      final inputVariablesMessages = promptMessages
          .map((final promptMessage) => promptMessage.inputVariables)
          .expand((final element) => element)
          .toSet();
      final inputVariablesInstance = inputVariables.toSet();
      final inputVariablesDiff = inputVariablesMessages
          .difference(inputVariablesInstance)
          .union(inputVariablesInstance.difference(inputVariablesMessages));
      if (inputVariablesDiff.isNotEmpty) {
        throw ArgumentError(
          'Mismatch between input variables and prompt messages input '
          'variables. Diff: $inputVariablesDiff',
        );
      }
      final partialVariablesSet = {
        if (partialVariables != null) ...partialVariables!.keys,
      };
      final partialVariablesInstance = partialVariablesSet.toSet();
      final partialVariablesDiff = partialVariablesSet
          .difference(partialVariablesInstance)
          .union(partialVariablesInstance.difference(partialVariablesSet));
      if (partialVariablesDiff.isNotEmpty) {
        throw ArgumentError(
          'Mismatch between partial variables and prompt messages input '
          'variables. Diff: $partialVariablesDiff',
        );
      }
    }
  }

  /// Creates a [ChatPromptTemplate] with a single message from a string
  /// template.
  ///
  /// - [template] the template string.
  /// - [role] the role of the message ([HumanChatMessage] by default).
  /// - [customRole] the role of the message if [role] is
  ///   [ChatMessageRole.custom].
  /// - [partialVariables] the partial variables to use for the template.
  /// - [templateFormat] the format of the template.
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
          validateTemplate: validateTemplate,
        ),
      ChatMessageRole.ai => AIChatMessagePromptTemplate.fromTemplate(
          template,
          partialVariables: partialVariables,
          templateFormat: templateFormat,
          validateTemplate: validateTemplate,
        ),
      ChatMessageRole.system => SystemChatMessagePromptTemplate.fromTemplate(
          template,
          partialVariables: partialVariables,
          templateFormat: templateFormat,
          validateTemplate: validateTemplate,
        ),
      ChatMessageRole.custom => CustomChatMessagePromptTemplate.fromTemplate(
          template,
          role: ArgumentError.checkNotNull(customRole, 'customRole'),
          partialVariables: partialVariables,
          templateFormat: templateFormat,
          validateTemplate: validateTemplate,
        ),
    };
    return ChatPromptTemplate.fromPromptMessages([messagesPromptTemplate]);
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
  /// Each template message can be:
  /// - [SystemChatMessagePromptTemplate] (for system messages)
  /// - [HumanChatMessagePromptTemplate] (for human messages)
  /// - [AIChatMessagePromptTemplate] (for AI messages)
  /// - [CustomChatMessagePromptTemplate] (for custom role messages)
  factory ChatPromptTemplate.fromPromptMessages(
    final List<BaseMessagePromptTemplate> promptMessages,
  ) {
    final inputVariables = promptMessages
        .map((final m) => m.inputVariables)
        .expand((final i) => i)
        .toSet()
        .toList(growable: false);
    final partialVariables = {
      for (final m in promptMessages) ...?m.partialVariables,
    };
    return ChatPromptTemplate(
      inputVariables: inputVariables,
      partialVariables: partialVariables.isEmpty ? null : partialVariables,
      promptMessages: promptMessages,
    );
  }

  /// The list of messages that make up the prompt template.
  final List<BaseMessagePromptTemplate> promptMessages;

  /// Whether or not to try validating the template.
  final bool validateTemplate;

  @override
  String get type => 'chat';

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

/// A template for a [SystemChatMessage].
final class SystemChatMessagePromptTemplate
    extends BaseStringMessagePromptTemplate {
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

/// A template for a [HumanChatMessage].
final class HumanChatMessagePromptTemplate
    extends BaseStringMessagePromptTemplate {
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

/// A template for a [AIChatMessage].
final class AIChatMessagePromptTemplate
    extends BaseStringMessagePromptTemplate {
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

final class CustomChatMessagePromptTemplate
    extends BaseStringMessagePromptTemplate {
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

/// Prompt template that assumes variable is already list of messages.
final class MessagesPlaceholder extends BaseMessagePromptTemplate {
  MessagesPlaceholder({required this.variableName})
      : super(prompt: PromptTemplate(inputVariables: const [], template: ''));

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
