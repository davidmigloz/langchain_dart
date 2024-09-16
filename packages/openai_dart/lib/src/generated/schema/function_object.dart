// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: FunctionObject
// ==========================================

/// A function that the model may call.
@freezed
class FunctionObject with _$FunctionObject {
  const FunctionObject._();

  /// Factory constructor for FunctionObject
  const factory FunctionObject({
    /// The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a
    /// maximum length of 64.
    required String name,

    /// A description of what the function does, used by the model to choose when and how to call the function.
    @JsonKey(includeIfNull: false) String? description,

    /// The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
    ///
    /// Omitting `parameters` defines a function with an empty parameter list.
    @JsonKey(includeIfNull: false) FunctionParameters? parameters,

    /// Whether to enable strict schema adherence when generating the function call. If set to true, the model will
    /// follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when
    /// `strict` is `true`. Learn more about Structured Outputs in the
    /// [function calling guide](](https://platform.openai.com/docs/guides/function-calling).
    @JsonKey(includeIfNull: false) @Default(false) bool? strict,
  }) = _FunctionObject;

  /// Object construction from a JSON representation
  factory FunctionObject.fromJson(Map<String, dynamic> json) =>
      _$FunctionObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'name',
    'description',
    'parameters',
    'strict'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'parameters': parameters,
      'strict': strict,
    };
  }
}
