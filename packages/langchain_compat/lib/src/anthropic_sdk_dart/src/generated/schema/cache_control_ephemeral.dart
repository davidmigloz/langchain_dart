// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: CacheControlEphemeral
// ==========================================

/// The cache control settings.
@freezed
class CacheControlEphemeral with _$CacheControlEphemeral {
  const CacheControlEphemeral._();

  /// Factory constructor for CacheControlEphemeral
  const factory CacheControlEphemeral({
    ///
    @Default(CacheControlEphemeralType.ephemeral)
    CacheControlEphemeralType type,
  }) = _CacheControlEphemeral;

  /// Object construction from a JSON representation
  factory CacheControlEphemeral.fromJson(Map<String, dynamic> json) =>
      _$CacheControlEphemeralFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
    };
  }
}

// ==========================================
// ENUM: CacheControlEphemeralType
// ==========================================

/// No Description
enum CacheControlEphemeralType {
  @JsonValue('ephemeral')
  ephemeral,
}
