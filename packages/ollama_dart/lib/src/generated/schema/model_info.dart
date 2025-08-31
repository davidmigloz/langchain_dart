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
abstract class ModelInfo with _$ModelInfo {
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

    /// The default messages for the model.
    @JsonKey(includeIfNull: false) List<Message>? messages,

    /// Details about a model.
    @JsonKey(name: 'model_info', includeIfNull: false)
    ModelInformation? modelInfo,

    /// Projector info.
    @JsonKey(name: 'projector_info', includeIfNull: false)
    Map<String, dynamic>? projectorInfo,

    /// The tensors of the model.
    @JsonKey(includeIfNull: false) List<Tensor>? tensors,

    /// The capabilities of the model.
    @JsonKey(includeIfNull: false) List<Capability>? capabilities,

    /// Date on which a model was created.
    @JsonKey(name: 'modified_at', includeIfNull: false) String? modifiedAt,
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
    'messages',
    'model_info',
    'projector_info',
    'tensors',
    'capabilities',
    'modified_at'
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
      'messages': messages,
      'model_info': modelInfo,
      'projector_info': projectorInfo,
      'tensors': tensors,
      'capabilities': capabilities,
      'modified_at': modifiedAt,
    };
  }
}
