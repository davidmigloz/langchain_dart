import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import 'models/models.dart';
import 'template.dart';

/// {@template base_prompt_template}
/// Base class for prompt templates.
///
/// It exposes two methods:
/// - [format]: returns a [String] prompt given a set of input values.
/// - [formatPrompt]: returns a [PromptValue] given a set of input values.
/// {@endtemplate}
@immutable
abstract base class BasePromptTemplate {
  /// {@macro base_prompt_template}
  const BasePromptTemplate({
    required this.inputVariables,
    this.partialVariables,
  });

  /// A set of the names of the variables the prompt template expects.
  final Set<String> inputVariables;

  /// Partial variables.
  final PartialValues? partialVariables;

  /// The type of the prompt template.
  String get type;

  /// Return a partial of the prompt template.
  BasePromptTemplate partial(final PartialValues values) {
    final newInputVariables = inputVariables
        .where((final variable) => !values.keys.contains(variable))
        .toSet();
    final newPartialVariables = {
      ...?partialVariables,
      ...values,
    };
    return copyWith(
      inputVariables: newInputVariables,
      partialVariables: newPartialVariables,
    );
  }

  /// Validate the integrity of the prompt template, checking that all the
  /// variables are present and that the right format is used.
  ///
  /// Throws a [TemplateValidationException] if the template is not valid.
  void validateTemplate() {
    throw UnimplementedError(
      'This method should be implemented by subclasses.',
    );
  }

  /// Format the prompt with the inputs.
  ///
  /// - [values] - Any arguments to be passed to the prompt template.
  String format(final InputValues values);

  /// Create Chat Messages.
  ///
  /// - [values] - Any arguments to be passed to the prompt template.
  PromptValue formatPrompt(final InputValues values);

  @protected
  Map<String, Object> mergePartialAndUserVariables(
    final Map<String, dynamic> userVariables,
  ) {
    return {...?partialVariables, ...userVariables};
  }

  @override
  bool operator ==(covariant final BasePromptTemplate other) {
    const setEqualityInputVariables = SetEquality<String>();
    const mapEqualityPartialVariables = MapEquality<String, dynamic>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            setEqualityInputVariables.equals(
              inputVariables,
              other.inputVariables,
            ) &&
            mapEqualityPartialVariables.equals(
              partialVariables,
              other.partialVariables,
            );
  }

  @override
  int get hashCode => inputVariables.hashCode ^ partialVariables.hashCode;

  @override
  String toString() {
    return '''
BasePromptTemplate{
  inputVariables: $inputVariables, 
  partialVariables: $partialVariables,
}
  ''';
  }

  /// Copy the prompt template with the given parameters.
  BasePromptTemplate copyWith({
    final Set<String>? inputVariables,
    final Map<String, dynamic>? partialVariables,
  });
}

/// {@template base_string_prompt_template}
/// Base class to generate a prompt from a string.
/// {@endtemplate}
@immutable
abstract base class BaseStringPromptTemplate extends BasePromptTemplate {
  /// {@macro base_string_prompt_template}
  const BaseStringPromptTemplate({
    required super.inputVariables,
    super.partialVariables,
  });

  @override
  PromptValue formatPrompt(final InputValues values) {
    final formattedPrompt = format(values);
    return StringPromptValue(formattedPrompt);
  }
}
