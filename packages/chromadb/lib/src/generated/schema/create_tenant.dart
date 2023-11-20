// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of chroma_api_schema;

// ==========================================
// CLASS: CreateTenant
// ==========================================

/// Request model for create tenant.
@freezed
class CreateTenant with _$CreateTenant {
  const CreateTenant._();

  /// Factory constructor for CreateTenant
  const factory CreateTenant({
    /// Name of the tenant.
    required String name,
  }) = _CreateTenant;

  /// Object construction from a JSON representation
  factory CreateTenant.fromJson(Map<String, dynamic> json) =>
      _$CreateTenantFromJson(json);

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
