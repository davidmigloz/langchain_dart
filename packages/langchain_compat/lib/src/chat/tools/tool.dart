import 'dart:async';

import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';

/// A tool that can be called by the LLM.
class Tool<TInput extends Object> {
  /// Creates a [Tool].
  Tool({
    required this.name,
    required this.description,
    required this.onCall,
    JsonSchema? inputSchema,
    TInput Function(Map<String, dynamic>)? inputFromJson,
    this.strict,
  }) : inputSchema =
           inputSchema ??
           JsonSchema.create({'type': 'object', 'properties': {}}),
       _getInputFromJson = inputFromJson {
    // Validate at construction time
    if (_hasParameters(inputSchema) && inputFromJson == null) {
      throw ArgumentError(
        'inputFromJson cannot be null when tool has parameters',
      );
    }

    _logger.info(
      'Registered tool: $name with '
      '${_hasParameters(inputSchema) ? inputSchema?.properties.length ?? 0 : 0}'
      ' parameters, strict: ${strict ?? false}',
    );
  }

  /// Logger for tool operations.
  static final Logger _logger = Logger('dartantic.tools');

  /// The unique name of the tool that clearly communicates its purpose.
  final String name;

  /// Used to tell the model how/when/why to use the tool. You can provide
  /// few-shot examples as a part of the description.
  final String description;

  /// Schema to parse and validate tool's input arguments. Following the [JSON
  /// Schema specification](https://json-schema.org).
  final JsonSchema inputSchema;

  /// Whether to enable strict schema adherence when generating the function
  /// call. If set to true, the model will follow the exact schema defined in
  /// the inputSchema field. Only a subset of JSON Schema is supported when
  /// strict is true. If null, the provider will use its default behavior. Learn
  /// more about Structured Outputs in the OpenAI function calling guide.
  final bool? strict;

  /// The function that will be called when the tool is run.
  final FutureOr<dynamic> Function(TInput input) onCall;

  /// The function to parse the input JSON to the tool's input type.
  final TInput Function(Map<String, dynamic> json)? _getInputFromJson;

  /// Runs the tool.
  Future<dynamic> invoke(Map<String, dynamic> arguments) async {
    _logger.fine('Invoking tool: $name with arguments: $arguments');
    try {
      dynamic result;
      if (_getInputFromJson != null) {
        final input = _getInputFromJson(arguments);
        result = await onCall(input);
      } else {
        // No parameters expected - for tools like Tool<String> with no params,
        // we pass an empty string or the Map itself, depending on TInput type
        if (TInput == String) {
          result = await onCall('' as TInput);
        } else {
          result = await onCall(arguments as TInput);
        }
      }
      _logger.fine(
        'Tool $name executed successfully, result type: ${result.runtimeType}',
      );
      return result;
    } catch (error, stackTrace) {
      _logger.warning('Tool $name execution failed: $error', error, stackTrace);
      rethrow;
    }
  }

  /// Checks if the schema has parameters that require custom parsing.
  static bool _hasParameters(JsonSchema? schema) {
    if (schema == null) return false;
    final properties = schema.properties;
    return properties.isNotEmpty;
  }

  /// Converts the tool to a JSON-serializable map.
  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'inputSchema': inputSchema.schemaMap ?? {},
    if (strict != null) 'strict': strict,
  };
}
