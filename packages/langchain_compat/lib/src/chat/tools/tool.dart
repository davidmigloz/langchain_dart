import 'dart:async';

import 'package:json_schema/json_schema.dart';

/// A tool that can be called by the LLM.
class Tool<TInput extends Object> {
  /// Creates a [Tool].
  Tool({
    required this.name,
    required this.description,
    required this.onCall,
    JsonSchema? inputSchema,
    TInput Function(Map<String, dynamic>)? inputFromJson,
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
  }

  /// The unique name of the tool that clearly communicates its purpose.
  final String name;

  /// Used to tell the model how/when/why to use the tool.
  /// You can provide few-shot examples as a part of the description.
  final String description;

  /// Schema to parse and validate tool's input arguments.
  /// Following the [JSON Schema specification](https://json-schema.org).
  final JsonSchema inputSchema;

  /// The function that will be called when the tool is run.
  final FutureOr<dynamic> Function(TInput input) onCall;

  /// The function to parse the input JSON to the tool's input type.
  final TInput Function(Map<String, dynamic> json)? _getInputFromJson;

  /// Runs the tool.
  Future<dynamic> invoke(Map<String, dynamic> arguments) async {
    if (_getInputFromJson != null) {
      final input = _getInputFromJson(arguments);
      return onCall(input);
    } else {
      // No parameters expected - for tools like Tool<String> with no params,
      // we pass an empty string or the Map itself, depending on TInput type
      if (TInput == String) {
        return onCall('' as TInput);
      } else {
        return onCall(arguments as TInput);
      }
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
  };
}
