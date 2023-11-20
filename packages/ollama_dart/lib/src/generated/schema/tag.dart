// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: Tag
// ==========================================

/// No Description
@freezed
class Tag with _$Tag {
  const Tag._();

  /// Factory constructor for Tag
  const factory Tag({
    /// Model name
    @JsonKey(includeIfNull: false) String? name,

    /// Model modification date
    @JsonKey(name: 'modified_at', includeIfNull: false) String? modifiedAt,

    /// Size of the model on disk
    @JsonKey(includeIfNull: false) int? size,
  }) = _Tag;

  /// Object construction from a JSON representation
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['name', 'modified_at', 'size'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'modified_at': modifiedAt,
      'size': size,
    };
  }
}
