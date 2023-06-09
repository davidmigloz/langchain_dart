import 'package:collection/collection.dart';
import 'package:cross_file/cross_file.dart';
import 'package:meta/meta.dart';

import 'base.dart';
import 'models/models.dart';
import 'template.dart';

/// Schema to represent a prompt for an LLM.
///
/// Example:
/// ```dart
/// final prompt = PromptTemplate(
///   inputVariables: ['foo'],
///   template: 'Say {foo}',
/// );
/// ```
@immutable
final class PromptTemplate extends BaseStringPromptTemplate<void> {
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

  /// The prompt template.
  final String template;

  /// The format of the prompt template.
  final TemplateFormat templateFormat;

  /// Whether or not to try validating the template.
  final bool validateTemplate;

  @override
  String get type => 'prompt';

  @override
  BasePromptTemplate<void> partial(final PartialValues values) {
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

  /// Load a prompt template from a template
  /// (e.g. "This is a {foo} test.").
  ///
  /// Note: only fString format is supported for now.
  factory PromptTemplate.fromTemplate(
    final String template, {
    final TemplateFormat templateFormat = TemplateFormat.fString,
    final bool validateTemplate = true,
  }) {
    return PromptTemplate(
      inputVariables: parseFStringTemplate(template)
          .whereType<ParsedFStringVariableNode>()
          .toSet()
          .map((final node) => node.name)
          .toList(growable: false),
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

  /// Load a prompt from a file.
  ///
  /// - [templateFile] the path to the file containing the prompt template.
  /// - [inputVariables] a list of variable names the final prompt template
  ///   will expect.
  static Future<PromptTemplate> fromFile(
    final String templateFile,
    final List<String> inputVariables,
  ) async {
    final file = XFile(templateFile);
    final template = await file.readAsString();
    return PromptTemplate(
      template: template,
      inputVariables: inputVariables,
    );
  }

  @override
  bool operator ==(covariant final PromptTemplate other) {
    const listEquals = ListEquality<String>();
    const mapEquals = MapEquality<String, Object>();

    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            listEquals.equals(inputVariables, other.inputVariables) &&
            outputParser == other.outputParser &&
            mapEquals.equals(partialVariables, other.partialVariables) &&
            template == other.template &&
            templateFormat == other.templateFormat &&
            validateTemplate == other.validateTemplate;
  }

  @override
  int get hashCode =>
      template.hashCode ^ templateFormat.hashCode ^ validateTemplate.hashCode;

  PromptTemplate copyWith({
    final List<String>? inputVariables,
    final Map<String, Object>? partialVariables,
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
