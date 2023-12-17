import 'package:collection/collection.dart';
import 'package:cross_file/cross_file.dart';
import 'package:meta/meta.dart';

import 'base_prompt.dart';
import 'models/models.dart';
import 'template.dart';

/// {@template prompt_template}
/// A prompt template for a language model.
///
/// A prompt template consists of a string template. It accepts a set of parameters
/// from the user that can be used to generate a prompt for a language model.
///
/// Example:
/// ```dart
/// final promptTemplate = PromptTemplate(
///   inputVariables: ['product'],
///   template: 'What is a good name for a company that makes {product}?',
/// );
/// final prompt = promptTemplate.formatPrompt({'product': 'colorful socks'});
/// final res = await llm.invoke(prompt);
/// ```
///
/// Note: the default constructor does not validate the template. You can use
/// [PromptTemplate.validateTemplate] to validate the template.
///
/// You can also use the following convenience factory constructors to create a prompt template:
///
/// - [PromptTemplate.fromTemplate] creates a prompt template from a string template automatically
///   extracting the input variables.
///
/// ```dart
/// final promptTemplate = PromptTemplate.fromTemplate(
///   'What is a good name for a company that makes {product}?',
/// );
/// ```
///
/// - [PromptTemplate.fromExamples] to create prompt templates from a list of examples.
/// - [PromptTemplate.fromFile] to create a prompt template from a file.
/// {@endtemplate}
@immutable
final class PromptTemplate extends BasePromptTemplate {
  /// {@macro prompt_template}
  const PromptTemplate({
    required super.inputVariables,
    super.partialVariables,
    required this.template,
  });

  /// Creates a prompt template from a string template automatically extracting the input variables.
  ///
  /// Example:
  /// ```dart
  /// final promptTemplate = PromptTemplate.fromTemplate(
  ///   'What is a good name for a company that makes {product}?',
  /// );
  /// final prompt = promptTemplate.formatPrompt({'product': 'colorful socks'});
  /// final res = await llm.invoke(prompt);
  /// ```
  ///
  /// - [template] the template string.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  factory PromptTemplate.fromTemplate(
    final String template, {
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) {
    final t = PromptTemplate(
      inputVariables: parseFStringTemplate(template)
          .whereType<ParsedFStringVariableNode>()
          .map((final node) => node.name)
          .toSet()
          .difference(partialVariables?.keys.toSet() ?? {}),
      partialVariables: partialVariables,
      template: template,
    );
    if (validateTemplate) {
      t.validateTemplate();
    }
    return t;
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
  /// - [validateTemplate] whether to validate the template.
  factory PromptTemplate.fromExamples({
    required final List<String> examples,
    required final String suffix,
    required final Set<String> inputVariables,
    final String exampleSeparator = '\n\n',
    final String prefix = '',
    final bool validateTemplate = true,
  }) {
    final template = [prefix, ...examples, suffix].join(exampleSeparator);
    final t = PromptTemplate(
      inputVariables: inputVariables,
      template: template,
    );
    if (validateTemplate) {
      t.validateTemplate();
    }
    return t;
  }

  /// Loads a prompt from a file.
  ///
  /// - [templateFile] the path to the file containing the prompt template.
  /// - [partialVariables] the partial variables to use for the template.
  /// - [validateTemplate] whether to validate the template.
  static Future<PromptTemplate> fromFile(
    final String templateFile, {
    final PartialValues? partialVariables,
    final bool validateTemplate = true,
  }) async {
    final file = XFile(templateFile);
    final template = await file.readAsString();
    return PromptTemplate.fromTemplate(
      template,
      partialVariables: partialVariables,
      validateTemplate: validateTemplate,
    );
  }

  /// The prompt template.
  final String template;

  @override
  String get type => 'prompt';

  @override
  PromptTemplate partial(final PartialValues values) {
    return super.partial(values) as PromptTemplate;
  }

  @override
  void validateTemplate() {
    checkValidPromptTemplate(
      template: template,
      inputVariables: inputVariables,
      partialVariables: partialVariables?.keys,
    );
  }

  @override
  String format([final InputValues values = const {}]) {
    final allValues = mergePartialAndUserVariables(values);
    return renderTemplate(
      template: template,
      inputValues: allValues,
    );
  }

  @override
  PromptValue formatPrompt(final InputValues values) {
    return PromptValue.string(format(values));
  }

  @override
  bool operator ==(covariant final PromptTemplate other) {
    const setEqualsInputVariables = SetEquality<String>();
    const mapEqualsPartialVariables = MapEquality<String, dynamic>();
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
            template == other.template;
  }

  @override
  int get hashCode =>
      inputVariables.hashCode ^ partialVariables.hashCode ^ template.hashCode;

  @override
  String toString() {
    return '''
PromptTemplate{
  template: $template, 
  inputVariables: $inputVariables,
  partialVariables: $partialVariables,
}''';
  }

  @override
  PromptTemplate copyWith({
    final Set<String>? inputVariables,
    final Map<String, dynamic>? partialVariables,
    final String? template,
  }) {
    return PromptTemplate(
      inputVariables: inputVariables ?? this.inputVariables,
      partialVariables: partialVariables ?? this.partialVariables,
      template: template ?? this.template,
    );
  }
}
