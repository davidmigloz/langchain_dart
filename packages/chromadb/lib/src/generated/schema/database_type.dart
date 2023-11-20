// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of chroma_api_schema;

// ==========================================
// CLASS: DatabaseType
// ==========================================

/// A database.
@freezed
class DatabaseType with _$DatabaseType {
  const DatabaseType._();

  /// Factory constructor for DatabaseType
  const factory DatabaseType({
    /// Id of the database.
    required String id,

    /// Name of the database.
    required String name,

    /// Tenant of the database.
    @JsonKey(includeIfNull: false) String? tenant,
  }) = _DatabaseType;

  /// Object construction from a JSON representation
  factory DatabaseType.fromJson(Map<String, dynamic> json) =>
      _$DatabaseTypeFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'name', 'tenant'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tenant': tenant,
    };
  }
}
