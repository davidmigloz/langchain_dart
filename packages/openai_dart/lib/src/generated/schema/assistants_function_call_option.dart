// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: AssistantsFunctionCallOption
// ==========================================

/// No Description
@freezed
abstract class AssistantsFunctionCallOption
    with _$AssistantsFunctionCallOption {
  const AssistantsFunctionCallOption._();

  /// Factory constructor for AssistantsFunctionCallOption
  const factory AssistantsFunctionCallOption({
    /// The name of the function to call.
    required String name,
  }) = _AssistantsFunctionCallOption;

  /// Object construction from a JSON representation
  factory AssistantsFunctionCallOption.fromJson(Map<String, dynamic> json) =>
      _$AssistantsFunctionCallOptionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['name'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
