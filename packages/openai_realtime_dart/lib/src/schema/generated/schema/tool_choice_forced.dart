// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: ToolChoiceForced
// ==========================================

/// Specifies a tool the model should use. Use to force the model to call a specific function.
@freezed
abstract class ToolChoiceForced with _$ToolChoiceForced {
  const ToolChoiceForced._();

  /// Factory constructor for ToolChoiceForced
  const factory ToolChoiceForced({
    /// The type of the tool. Currently, only `function` is supported.
    @Default(ToolType.function) ToolType type,

    /// The name of the function to call.
    required String name,
  }) = _ToolChoiceForced;

  /// Object construction from a JSON representation
  factory ToolChoiceForced.fromJson(Map<String, dynamic> json) =>
      _$ToolChoiceForcedFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'name'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'name': name,
    };
  }
}
