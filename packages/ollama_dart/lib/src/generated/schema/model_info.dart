// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: ModelInfo
// ==========================================

/// Details about a model including modelfile, template, parameters, license, and system prompt.
@freezed
class ModelInfo with _$ModelInfo {
  const ModelInfo._();

  /// Factory constructor for ModelInfo
  const factory ModelInfo({
    /// The model's license.
    @JsonKey(includeIfNull: false) String? license,

    /// The modelfile associated with the model.
    @JsonKey(includeIfNull: false) String? modelfile,

    /// The model parameters.
    @JsonKey(includeIfNull: false) String? parameters,

    /// The prompt template for the model.
    @JsonKey(includeIfNull: false) String? template,
  }) = _ModelInfo;

  /// Object construction from a JSON representation
  factory ModelInfo.fromJson(Map<String, dynamic> json) =>
      _$ModelInfoFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'license',
    'modelfile',
    'parameters',
    'template'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'license': license,
      'modelfile': modelfile,
      'parameters': parameters,
      'template': template,
    };
  }
}
