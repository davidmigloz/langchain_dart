// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: AssistantsNamedToolChoice
// ==========================================

/// Specifies a tool the model should use. Use to force the model to call a specific tool.
@freezed
abstract class AssistantsNamedToolChoice with _$AssistantsNamedToolChoice {
  const AssistantsNamedToolChoice._();

  /// Factory constructor for AssistantsNamedToolChoice
  const factory AssistantsNamedToolChoice({
    /// The type of the tool. If type is `function`, the function name must be set
    required AssistantsToolType type,

    /// No Description
    @JsonKey(includeIfNull: false) AssistantsFunctionCallOption? function,
  }) = _AssistantsNamedToolChoice;

  /// Object construction from a JSON representation
  factory AssistantsNamedToolChoice.fromJson(Map<String, dynamic> json) =>
      _$AssistantsNamedToolChoiceFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'function'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'type': type, 'function': function};
  }
}

// ==========================================
// ENUM: AssistantsToolType
// ==========================================

/// The type of the tool. If type is `function`, the function name must be set
enum AssistantsToolType {
  @JsonValue('function')
  function,
  @JsonValue('code_interpreter')
  codeInterpreter,
  @JsonValue('file_search')
  fileSearch,
}
