import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../../core/core.dart';
import 'models/models.dart';
import 'template.dart';

/// {@template base_prompt_template}
/// Base class for prompt templates.
///
/// It exposes two methods:
/// - [format] returns a [String] prompt given a set of input values.
/// - [formatPrompt] returns a [PromptValue] given a set of input values.
/// {@endtemplate}
@immutable
abstract base class BasePromptTemplate
    extends Runnable<InputValues, BaseLangChainOptions, PromptValue> {
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

  /// Format the prompt given the input values and return a formatted prompt
  /// value.
  ///
  /// - [input] - Any arguments to be passed to the prompt template.
  @override
  Future<PromptValue> invoke(
    final InputValues input, {
    final BaseLangChainOptions? options,
  }) {
    return Future.value(formatPrompt(input));
  }

  @override
  Stream<PromptValue> streamFromInputStream(
    final Stream<InputValues> inputStream, {
    final BaseLangChainOptions? options,
  }) {
    final userKeys = inputVariables.difference(
      partialVariables?.keys.toSet() ?? {},
    );
    final userInput = <String, dynamic>{};
    return inputStream
        .asyncMap((final InputValues inputValues) {
          for (final input in inputValues.entries) {
            final key = input.key;
            final value = input.value;
            if (value is String) {
              userInput[key] = (userInput[key] as String? ?? '') + value;
            } else {
              userInput[key] = value;
            }
          }
          final hasAllUserValues = userKeys.every(userInput.containsKey);
          if (hasAllUserValues) {
            return formatPrompt(userInput);
          } else {
            return null;
          }
        })
        .where((final res) => res != null)
        .cast();
  }

  /// Format the prompt given the input values and return a formatted string.
  ///
  /// - [values] - Any arguments to be passed to the prompt template.
  String format(final InputValues values);

  /// Format the prompt given the input values and return a formatted prompt
  /// value.
  ///
  /// - [values] - Any arguments to be passed to the prompt template.
  PromptValue formatPrompt(final InputValues values);

  /// Merge the partial variables with the user variables.
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
