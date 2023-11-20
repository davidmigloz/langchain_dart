// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: TagResponse
// ==========================================

/// A single JSON object will be returned.
@freezed
class TagResponse with _$TagResponse {
  const TagResponse._();

  /// Factory constructor for TagResponse
  const factory TagResponse({
    /// No Description
    @JsonKey(includeIfNull: false) List<Tag>? models,
  }) = _TagResponse;

  /// Object construction from a JSON representation
  factory TagResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['models'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'models': models,
    };
  }
}
