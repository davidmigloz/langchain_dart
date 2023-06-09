import 'package:meta/meta.dart';

import 'models/models.dart';

enum TemplateFormat {
  /// Python f-strings format (aka. formatted string literals).
  /// E.g.: "Hello, my name is {name} and I'm {age} years old."
  fString,

  /// Jinja2 templating engine format.
  /// E.g.: "Hello, my name is {{ name }} and I'm {{ age }} years old."
  jinja2,
}

/// Checks if a template is valid.
/// Throws an exception if it is not.
void checkValidTemplate({
  required final String template,
  required final TemplateFormat templateFormat,
  required final List<String> inputVariables,
}) {
  try {
    // Check format
    if (templateFormat == TemplateFormat.jinja2) {
      throw UnimplementedError('Jinja2 not implemented yet');
    }

    // Check variables
    final variablesNodes = parseFStringTemplate(template)
        .whereType<ParsedFStringVariableNode>()
        .toSet();
    if (variablesNodes.length != inputVariables.length) {
      throw Exception(
          'Invalid template: ${variablesNodes.length} variables found, '
          'but ${inputVariables.length} expected.');
    }

    // Try to render
    final dummyInputs = inputVariables.fold(
      <String, Object>{},
      (final acc, final v) {
        acc[v] = 'foo';
        return acc;
      },
    );
    renderTemplate(
      template: template,
      templateFormat: templateFormat,
      inputValues: dummyInputs,
    );
  } catch (e) {
    throw Exception('Invalid template: $e}');
  }
}

/// Renders a template with the given values.
String renderTemplate({
  required final String template,
  required final TemplateFormat templateFormat,
  required final InputValues inputValues,
}) {
  return switch (templateFormat) {
    TemplateFormat.fString => renderFStringTemplate(template, inputValues),
    TemplateFormat.jinja2 =>
      throw UnimplementedError('Jinja2 not implemented yet'),
  };
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
        throw ArgumentError("Unclosed '{' in template.");
      }
      nodes
          .add(ParsedFStringVariableNode(name: chars.sublist(i + 1, j).join()));
      i = j + 1;
    } else if (chars[i] == '}') {
      throw ArgumentError("Single '}' in template.");
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

@immutable
sealed class ParsedFStringNode {
  const ParsedFStringNode();
}

@immutable
class ParsedFStringLiteralNode extends ParsedFStringNode {
  const ParsedFStringLiteralNode({
    required this.text,
  });

  final String text;

  @override
  bool operator ==(covariant final ParsedFStringLiteralNode other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && text == other.text;

  @override
  int get hashCode => text.hashCode;
}

@immutable
class ParsedFStringVariableNode extends ParsedFStringNode {
  const ParsedFStringVariableNode({
    required this.name,
  });

  final String name;

  @override
  bool operator ==(covariant final ParsedFStringVariableNode other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
