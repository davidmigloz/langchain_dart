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

    /// The system prompt for the model.
    @JsonKey(includeIfNull: false) String? system,

    /// Details about a model.
    @JsonKey(includeIfNull: false) ModelDetails? details,

    /// Details about a model.
    @JsonKey(name: 'model_info', includeIfNull: false)
    ModelInformation? modelInfo,

    /// The default messages for the model.
    @JsonKey(includeIfNull: false) List<Message>? messages,
  }) = _ModelInfo;

  /// Object construction from a JSON representation
  factory ModelInfo.fromJson(Map<String, dynamic> json) =>
      _$ModelInfoFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'license',
    'modelfile',
    'parameters',
    'template',
    'system',
    'details',
    'model_info',
    'messages'
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
      'system': system,
      'details': details,
      'model_info': modelInfo,
      'messages': messages,
    };
  }
}
