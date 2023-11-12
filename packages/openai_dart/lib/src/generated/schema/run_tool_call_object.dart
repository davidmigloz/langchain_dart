// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunToolCallObject
// ==========================================

/// Tool call objects
@freezed
class RunToolCallObject with _$RunToolCallObject {
  const RunToolCallObject._();

  /// Factory constructor for RunToolCallObject
  const factory RunToolCallObject({
    /// The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
    required String id,

    /// The type of tool call the output is required for. For now, this is always `function`.
    required RunToolCallObjectType type,

    /// The function definition.
    required RunToolCallFunction function,
  }) = _RunToolCallObject;

  /// Object construction from a JSON representation
  factory RunToolCallObject.fromJson(Map<String, dynamic> json) =>
      _$RunToolCallObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'type', 'function'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'function': function,
    };
  }
}

// ==========================================
// ENUM: RunToolCallObjectType
// ==========================================

/// The type of tool call the output is required for. For now, this is always `function`.
enum RunToolCallObjectType {
  @JsonValue('function')
  function,
}

// ==========================================
// CLASS: RunToolCallFunction
// ==========================================

/// The function definition.
@freezed
class RunToolCallFunction with _$RunToolCallFunction {
  const RunToolCallFunction._();

  /// Factory constructor for RunToolCallFunction
  const factory RunToolCallFunction({
    /// The name of the function.
    required String name,

    /// The arguments that the model expects you to pass to the function.
    required String arguments,
  }) = _RunToolCallFunction;

  /// Object construction from a JSON representation
  factory RunToolCallFunction.fromJson(Map<String, dynamic> json) =>
      _$RunToolCallFunctionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['name', 'arguments'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'arguments': arguments,
    };
  }
}
