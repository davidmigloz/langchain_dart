// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of chroma_api_schema;

// ==========================================
// CLASS: TenantType
// ==========================================

/// A tenant.
@freezed
class TenantType with _$TenantType {
  const TenantType._();

  /// Factory constructor for TenantType
  const factory TenantType({
    /// Name of the tenant.
    required String name,
  }) = _TenantType;

  /// Object construction from a JSON representation
  factory TenantType.fromJson(Map<String, dynamic> json) =>
      _$TenantTypeFromJson(json);

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
