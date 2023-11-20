// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of chroma_api_schema;

// ==========================================
// CLASS: CreateDatabase
// ==========================================

/// Request model for create database.
@freezed
class CreateDatabase with _$CreateDatabase {
  const CreateDatabase._();

  /// Factory constructor for CreateDatabase
  const factory CreateDatabase({
    /// Name of the database.
    required String name,
  }) = _CreateDatabase;

  /// Object construction from a JSON representation
  factory CreateDatabase.fromJson(Map<String, dynamic> json) =>
      _$CreateDatabaseFromJson(json);

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
