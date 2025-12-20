// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: CitationsConfig
// ==========================================

/// Configuration for document citations.
@freezed
abstract class CitationsConfig with _$CitationsConfig {
  const CitationsConfig._();

  /// Factory constructor for CitationsConfig
  const factory CitationsConfig({
    /// Whether citations are enabled.
    @JsonKey(includeIfNull: false) bool? enabled,
  }) = _CitationsConfig;

  /// Object construction from a JSON representation
  factory CitationsConfig.fromJson(Map<String, dynamic> json) =>
      _$CitationsConfigFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['enabled'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'enabled': enabled};
  }
}
