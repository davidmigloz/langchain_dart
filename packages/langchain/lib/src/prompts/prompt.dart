import 'package:collection/collection.dart';
import 'package:cross_file/cross_file.dart';
import 'package:meta/meta.dart';

import 'base_prompt.dart';
import 'models/models.dart';
import 'template.dart';

/// {@template prompt_template}
/// Schema to represent a prompt for an LLM.
///
/// Example:
/// ```dart
/// final prompt = PromptTemplate(
///   inputVariables: ['foo'],
///   template: 'Say {foo}',
/// );
/// ```
/// {@endtemplate}
@immutable
final class PromptTemplate extends BaseStringPromptTemplate {
  PromptTemplate({
    required super.inputVariables,
    super.partialVariables,
    required this.template,
    this.templateFormat = TemplateFormat.fString,
    this.validateTemplate = true,
  }) {
    if (validateTemplate) {
      checkValidTemplate(
        template: template,
        templateFormat: templateFormat,
        inputVariables: [
          ...inputVariables,
          ...?partialVariables?.keys,
        ],
      );
    }
  }

  /// Creates a prompt template from a string template.
  /// (e.g. "This is a {foo} test.").
  ///
  /// Note: only fString format is supported for now.
  factory PromptTemplate.fromTemplate(
    final String template, {
    final PartialValues? partialVariables,
    final TemplateFormat templateFormat = TemplateFormat.fString,
    final bool validateTemplate = true,
  }) {
    return PromptTemplate(
      inputVariables: parseFStringTemplate(template)
          .whereType<ParsedFStringVariableNode>()
          .map((final node) => node.name)
          .toSet()
          .difference(partialVariables?.keys.toSet() ?? {})
          .toList(growable: false),
      partialVariables: partialVariables,
      template: template,
      templateFormat: templateFormat,
      validateTemplate: validateTemplate,
    );
  }

  /// Take examples in list format with prefix and suffix to create a prompt.
  ///
  /// Intended to be used a a way to dynamically create a prompt from examples.
  ///
  /// - [examples] list of examples to use in the prompt.
  /// - [suffix] string to go after the list of examples. Should generally
  ///   set up the user's input.
  /// - [inputVariables] list list of variable names the final prompt
  ///   template will expect.
  /// - [exampleSeparator] the separator to use in between examples.
  /// - [prefix] string that should go before any examples. Generally includes
  ///   examples.
  factory PromptTemplate.fromExamples({
    required final List<String> examples,
    required final String suffix,
    required final List<String> inputVariables,
    final String exampleSeparator = '\n\n',
    final String prefix = '',
  }) {
    final template = [prefix, ...examples, suffix].join(exampleSeparator);
    return PromptTemplate(
      inputVariables: inputVariables,
      template: template,
    );
  }

  /// Loads a prompt from a file.
  ///
  /// - [templateFile] the path to the file containing the prompt template.
  static Future<PromptTemplate> fromFile(
    final String templateFile, {
    final PartialValues? partialVariables,
    final TemplateFormat templateFormat = TemplateFormat.fString,
    final bool validateTemplate = true,
  }) async {
    final file = XFile(templateFile);
    final template = await file.readAsString();
    return PromptTemplate.fromTemplate(
      template,
      partialVariables: partialVariables,
      templateFormat: templateFormat,
      validateTemplate: validateTemplate,
    );
  }

  /// The prompt template.
  final String template;

  /// The format of the prompt template.
  final TemplateFormat templateFormat;

  /// Whether or not to try validating the template.
  final bool validateTemplate;

  @override
  String get type => 'prompt';

  @override
  BasePromptTemplate partial(final PartialValues values) {
    final newInputVariables = inputVariables
        .where((final variable) => !values.keys.contains(variable))
        .toList(growable: false);
    final newPartialVariables = {
      ...?partialVariables,
      ...values,
    };
    return copyWith(
      inputVariables: newInputVariables,
      partialVariables: newPartialVariables,
    );
  }

  @override
  String format([final InputValues values = const {}]) {
    final allValues = mergePartialAndUserVariables(values);
    return renderTemplate(
      template: template,
      templateFormat: templateFormat,
      inputValues: allValues,
    );
  }

  @override
  bool operator ==(covariant final PromptTemplate other) {
    const listEqualsInputVariables = ListEquality<String>();
    const mapEqualsPartialVariables = MapEquality<String, dynamic>();
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
            template == other.template &&
            templateFormat == other.templateFormat &&
            validateTemplate == other.validateTemplate;
  }

  @override
  int get hashCode =>
      inputVariables.hashCode ^
      partialVariables.hashCode ^
      template.hashCode ^
      templateFormat.hashCode ^
      validateTemplate.hashCode;

  @override
  String toString() {
    return '''
PromptTemplate{
  template: $template, 
  inputVariables: $inputVariables,
  partialVariables: $partialVariables,
  templateFormat: $templateFormat, 
  validateTemplate: $validateTemplate,
}''';
  }

  PromptTemplate copyWith({
    final List<String>? inputVariables,
    final Map<String, dynamic>? partialVariables,
    final String? template,
    final TemplateFormat? templateFormat,
    final bool? validateTemplate,
  }) {
    return PromptTemplate(
      inputVariables: inputVariables ?? this.inputVariables,
      partialVariables: partialVariables ?? this.partialVariables,
      template: template ?? this.template,
      templateFormat: templateFormat ?? this.templateFormat,
      validateTemplate: validateTemplate ?? this.validateTemplate,
    );
  }
}
