import 'package:meta/meta.dart';

import '../schema/schema.dart';

/// Base class for prompt templates. Exposes a format method that returns a
/// string prompt given a set of input values.
@immutable
abstract base class BasePromptTemplate<T> {
  BasePromptTemplate({
    required this.inputVariables,
    this.outputParser,
    this.partialVariables,
  })  : assert(
          !inputVariables.contains('stop'),
          'Cannot have an input variable named `stop`, as it is used internally.',
        ),
        assert(
          partialVariables == null || !partialVariables.keys.contains('stop'),
          'Cannot have an partial variable named `stop`, as it is used internally.',
        ),
        assert(
          partialVariables == null ||
              inputVariables
                  .toSet()
                  .intersection(partialVariables.keys.toSet())
                  .isEmpty,
          'Cannot have overlapping between input and partial variables',
        );

  /// A list of the names of the variables the prompt template expects.
  final List<String> inputVariables;

  /// How to parse the output of calling an LLM on this formatted prompt.
  final BaseOutputParser<T>? outputParser;

  /// Partial variables.
  final PartialValues? partialVariables;

  /// The type of the prompt template.
  String get type;

  /// Return a partial of the prompt template.
  BasePromptTemplate<T> partial(final PartialValues values);

  /// Format the prompt with the inputs.
  ///
  /// - [values] - Any arguments to be passed to the prompt template.
  String format([final InputValues values = const {}]);

  /// Create Chat Messages.
  ///
  /// - [values] - Any arguments to be passed to the prompt template.
  BasePromptValue formatPromptValue([final InputValues values = const {}]);

  @protected
  Map<String, Object> mergePartialAndUserVariables(
    final Map<String, Object> userVariables,
  ) {
    return {...?partialVariables, ...userVariables};
  }
}

/// String prompt should expose the format method, returning a prompt.
abstract base class BaseStringPromptTemplate<T> extends BasePromptTemplate<T> {
  BaseStringPromptTemplate({
    required super.inputVariables,
    super.outputParser,
    super.partialVariables,
  });

  @override
  BasePromptValue formatPromptValue([final InputValues values = const {}]) {
    final formattedPrompt = format(values);
    return StringPromptValue(formattedPrompt);
  }
}

/// Return type for [BasePromptTemplate.formatPromptValue].
class StringPromptValue implements BasePromptValue {
  const StringPromptValue(this.value);

  final String value;

  @override
  String toString() {
    return value;
  }

  @override
  List<BaseChatMessage> toMessages() {
    return [HumanChatMessage(content: value)];
  }
}
