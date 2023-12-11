// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ChatCompletionNamedToolChoice
// ==========================================

/// Specifies a tool the model should use. Use to force the model to call a specific function.
@freezed
class ChatCompletionNamedToolChoice with _$ChatCompletionNamedToolChoice {
  const ChatCompletionNamedToolChoice._();

  /// Factory constructor for ChatCompletionNamedToolChoice
  const factory ChatCompletionNamedToolChoice({
    /// The type of the tool. Currently, only `function` is supported.
    required ChatCompletionNamedToolChoiceType type,

    /// Forces the model to call the specified function.
    required ChatCompletionFunctionCallOption function,
  }) = _ChatCompletionNamedToolChoice;

  /// Object construction from a JSON representation
  factory ChatCompletionNamedToolChoice.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionNamedToolChoiceFromJson(json);

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
// ENUM: ChatCompletionNamedToolChoiceType
// ==========================================

/// The type of the tool. Currently, only `function` is supported.
enum ChatCompletionNamedToolChoiceType {
  @JsonValue('function')
  function,
}
