// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ChatCompletionTool
// ==========================================

/// A tool the model may use.
@freezed
class ChatCompletionTool with _$ChatCompletionTool {
  const ChatCompletionTool._();

  /// Factory constructor for ChatCompletionTool
  const factory ChatCompletionTool({
    /// The type of the tool. Currently, only `function` is supported.
    required ChatCompletionToolType type,

    /// A function that the model may call.
    required FunctionObject function,
  }) = _ChatCompletionTool;

  /// Object construction from a JSON representation
  factory ChatCompletionTool.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionToolFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'function'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'function': function,
    };
  }
}

// ==========================================
// ENUM: ChatCompletionToolType
// ==========================================

/// The type of the tool. Currently, only `function` is supported.
enum ChatCompletionToolType {
  @JsonValue('function')
  function,
}
