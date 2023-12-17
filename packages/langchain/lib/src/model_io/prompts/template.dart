import 'package:meta/meta.dart';

import '../../utils/exception.dart';
import 'base_chat_message_prompt.dart';
import 'chat_prompt.dart';
import 'models/models.dart';
import 'prompt.dart';

/// Checks if the template is a valid [PromptTemplate].
///
/// Throws a [TemplateValidationException] if it is not.
void checkValidPromptTemplate({
  required final String template,
  required final Set<String> inputVariables,
  required final Iterable<String>? partialVariables,
}) {
  try {
    // Check reversed keywords
    if (inputVariables.contains('stop') ||
        (partialVariables?.contains('stop') ?? false)) {
      throw const TemplateValidationException(
        message:
            'Cannot have a variable named `stop`, as it is used internally.',
      );
    }
    // Check overlapping
    if (partialVariables != null &&
        inputVariables
            .toSet()
            .intersection(partialVariables.toSet())
            .isNotEmpty) {
      throw const TemplateValidationException(
        message: 'Cannot have overlapping between input and partial variables',
      );
    }
    // Check variables in text
    final allVariables = [...inputVariables, ...?partialVariables];
    final variablesNodes = parseFStringTemplate(template)
        .whereType<ParsedFStringVariableNode>()
        .toSet();
    if (variablesNodes.length != allVariables.length) {
      throw TemplateValidationException(
        message: '${variablesNodes.length} variables found, '
            'but ${inputVariables.length} expected.',
      );
    }
    // Try to render
    final dummyInputs = allVariables.fold(
      <String, Object>{},
      (final acc, final v) {
        acc[v] = 'foo';
        return acc;
      },
    );
    renderTemplate(
      template: template,
      inputValues: dummyInputs,
    );
  } on TemplateValidationException {
    rethrow;
  } catch (e) {
    throw TemplateValidationException(message: '$e');
  }
}

/// Checks if the template is a valid [ChatPromptTemplate].
///
/// Throws a [TemplateValidationException] if it is not.
void checkValidChatPromptTemplate({
  required final List<ChatMessagePromptTemplate> promptMessages,
  required final Set<String> inputVariables,
  required final Iterable<String>? partialVariables,
}) {
  try {
    final inputVariablesMessages = promptMessages
        .map((final promptMessage) => promptMessage.inputVariables)
        .expand((final element) => element)
        .toSet();
    final inputVariablesInstance = inputVariables.toSet();
    final inputVariablesDiff = inputVariablesMessages
        .difference(inputVariablesInstance)
        .union(inputVariablesInstance.difference(inputVariablesMessages));
    if (inputVariablesDiff.isNotEmpty) {
      throw TemplateValidationException(
        message: 'Mismatch between input variables and prompt messages input '
            'variables. Diff: $inputVariablesDiff',
      );
    }
    final partialVariablesSet = {...?partialVariables};
    final partialVariablesInstance = partialVariablesSet.toSet();
    final partialVariablesDiff = partialVariablesSet
        .difference(partialVariablesInstance)
        .union(partialVariablesInstance.difference(partialVariablesSet));
    if (partialVariablesDiff.isNotEmpty) {
      throw TemplateValidationException(
        message: 'Mismatch between partial variables and prompt messages input '
            'variables. Diff: $partialVariablesDiff',
      );
    }
    for (final promptMessage in promptMessages) {
      promptMessage.prompt.validateTemplate();
    }
  } on TemplateValidationException {
    rethrow;
  } catch (e) {
    throw TemplateValidationException(message: '$e');
  }
}

/// {@template template_validation_exception}
/// Exception thrown when a template validation fails.
/// {@endtemplate}
final class TemplateValidationException extends LangChainException {
  /// {@macro template_validation_exception}
  const TemplateValidationException({
    super.message = '',
  }) : super(code: 'template_validation');
}

/// Renders a template with the given values.
String renderTemplate({
  required final String template,
  required final InputValues inputValues,
}) {
  return renderFStringTemplate(template, inputValues);
}

/// Render a template in fString format.
String renderFStringTemplate(
  final String template,
  final InputValues inputValues,
) {
  return parseFStringTemplate(template)
      .map(
        (final node) => switch (node) {
          ParsedFStringLiteralNode(text: final t) => t,
          ParsedFStringVariableNode(name: final n) =>
            ArgumentError.checkNotNull(
              inputValues[n],
              'Missing value for variable ${node.name}',
            ),
        },
      )
      .join();
}

/// Parses a template in fString format.
List<ParsedFStringNode> parseFStringTemplate(final String template) {
  final chars = template.split('');
  final List<ParsedFStringNode> nodes = [];

  int nextBracket(final String bracket, final int start) {
    for (int i = start; i < chars.length; i += 1) {
      if (bracket.contains(chars[i])) {
        return i;
      }
    }
    return -1;
  }

  int i = 0;
  while (i < chars.length) {
    if (chars[i] == '{' && i + 1 < chars.length && chars[i + 1] == '{') {
      nodes.add(const ParsedFStringLiteralNode(text: '{'));
      i += 2;
    } else if (chars[i] == '}' && i + 1 < chars.length && chars[i + 1] == '}') {
      nodes.add(const ParsedFStringLiteralNode(text: '}'));
      i += 2;
    } else if (chars[i] == '{') {
      final j = nextBracket('}', i);
      if (j < 0) {
        throw const TemplateValidationException(
          message: "Unclosed '{' in template.",
        );
      }
      nodes
          .add(ParsedFStringVariableNode(name: chars.sublist(i + 1, j).join()));
      i = j + 1;
    } else if (chars[i] == '}') {
      throw const TemplateValidationException(
        message: "Single '}' in template.",
      );
    } else {
      final next = nextBracket('{}', i);
      final text =
          (next < 0 ? chars.sublist(i) : chars.sublist(i, next)).join();
      nodes.add(ParsedFStringLiteralNode(text: text));
      i = next < 0 ? chars.length : next;
    }
  }
  return nodes;
}

/// {@template parsed_f_string_node}
/// A node in a parsed f-string template.
/// {@endtemplate}
@immutable
sealed class ParsedFStringNode {
  /// {@macro parsed_f_string_node}
  const ParsedFStringNode();
}

/// {@template parsed_f_string_literal_node}
/// A literal node in a parsed f-string template.
/// {@endtemplate}
@immutable
class ParsedFStringLiteralNode extends ParsedFStringNode {
  /// {@macro parsed_f_string_literal_node}
  const ParsedFStringLiteralNode({
    required this.text,
  });

  /// The text of the literal.
  final String text;

  @override
  bool operator ==(covariant final ParsedFStringLiteralNode other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && text == other.text;

  @override
  int get hashCode => text.hashCode;
}

/// {@template parsed_f_string_variable_node}
/// A variable node in a parsed f-string template.
/// {@endtemplate}
@immutable
class ParsedFStringVariableNode extends ParsedFStringNode {
  /// {@macro parsed_f_string_variable_node}
  const ParsedFStringVariableNode({
    required this.name,
  });

  /// The name of the variable.
  final String name;

  @override
  bool operator ==(covariant final ParsedFStringVariableNode other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
