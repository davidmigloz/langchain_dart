// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ChatCompletionFunction
// ==========================================

/// A function that the model may call.
@freezed
class ChatCompletionFunction with _$ChatCompletionFunction {
  const ChatCompletionFunction._();

  /// Factory constructor for ChatCompletionFunction
  const factory ChatCompletionFunction({
    /// The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
    required String name,

    /// A description of what the function does, used by the model to choose when and how to call the function.
    @JsonKey(includeIfNull: false) String? description,

    /// The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/gpt/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
    ///
    /// To describe a function that accepts no parameters, provide the value `{"type": "object", "properties": {}}`.
    required ChatCompletionFunctionParameters parameters,
  }) = _ChatCompletionFunction;

  /// Object construction from a JSON representation
  factory ChatCompletionFunction.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionFunctionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'name',
    'description',
    'parameters'
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
    };
  }
}
