// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: ModelInfo
// ==========================================

/// Describes a model with basic information.
@freezed
abstract class ModelInfo with _$ModelInfo {
  const ModelInfo._();

  /// Factory constructor for ModelInfo
  const factory ModelInfo({
    /// Unique model identifier.
    required String id,

    /// Object type. Always `"model"` for models.
    required ModelInfoType type,

    /// A human-readable name for the model.
    @JsonKey(name: 'display_name') required String displayName,

    /// RFC 3339 datetime string representing the time at which the model was released. May be set to an epoch value if the release date is unknown.
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _ModelInfo;

  /// Object construction from a JSON representation
  factory ModelInfo.fromJson(Map<String, dynamic> json) =>
      _$ModelInfoFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'type',
    'display_name',
    'created_at',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'display_name': displayName,
      'created_at': createdAt,
    };
  }
}

// ==========================================
// ENUM: ModelInfoType
// ==========================================

/// Object type. Always `"model"` for models.
enum ModelInfoType {
  @JsonValue('model')
  model,
}
