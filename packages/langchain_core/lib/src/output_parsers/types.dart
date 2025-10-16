import 'package:collection/collection.dart' show DeepCollectionEquality;
import 'package:meta/meta.dart' show immutable;

import '../langchain/types.dart';

/// {@template output_parser_options}
/// Options to pass to an output parser.
/// {@endtemplate}
@immutable
class OutputParserOptions extends BaseLangChainOptions {
  /// {@macro output_parser_options}
  const OutputParserOptions({super.concurrencyLimit});
}

/// {@template parsed_tool_call}
/// A parsed tool call from the model.
/// {@endtemplate}
@immutable
class ParsedToolCall {
  /// {@macro parsed_tool_call}
  const ParsedToolCall({
    required this.id,
    required this.name,
    required this.arguments,
  });

  /// The id of the tool to call.
  final String id;

  /// The name of the tool to call.
  final String name;

  /// The arguments to pass to the tool in JSON Map format.
  ///
  /// Note that the model does not always generate a valid JSON, in that case,
  /// [arguments] will be empty.
  ///
  /// The model may also hallucinate parameters not defined by your tool schema.
  /// Validate the arguments in your code before calling your tool.
  final Map<String, dynamic> arguments;

  /// Converts the [ParsedToolCall] to a [Map].
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'arguments': arguments};
  }

  @override
  bool operator ==(covariant final ParsedToolCall other) {
    final mapEquals = const DeepCollectionEquality().equals;
    return identical(this, other) ||
        id == other.id &&
            name == other.name &&
            mapEquals(arguments, other.arguments);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ arguments.hashCode;
  }

  @override
  String toString() {
    return '''
ParsedToolCall{
  id: $id,
  name: $name,
  arguments: $arguments,
}''';
  }
}
