// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: ModelDetails
// ==========================================

/// Details about a model.
@freezed
abstract class ModelDetails with _$ModelDetails {
  const ModelDetails._();

  /// Factory constructor for ModelDetails
  const factory ModelDetails({
    /// The parent model of the model.
    @JsonKey(name: 'parent_model', includeIfNull: false) String? parentModel,

    /// The format of the model.
    @JsonKey(includeIfNull: false) String? format,

    /// The family of the model.
    @JsonKey(includeIfNull: false) String? family,

    /// The families of the model.
    @JsonKey(includeIfNull: false) List<String>? families,

    /// The size of the model's parameters.
    @JsonKey(name: 'parameter_size', includeIfNull: false)
    String? parameterSize,

    /// The quantization level of the model.
    @JsonKey(name: 'quantization_level', includeIfNull: false)
    String? quantizationLevel,
  }) = _ModelDetails;

  /// Object construction from a JSON representation
  factory ModelDetails.fromJson(Map<String, dynamic> json) =>
      _$ModelDetailsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'parent_model',
    'format',
    'family',
    'families',
    'parameter_size',
    'quantization_level'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'parent_model': parentModel,
      'format': format,
      'family': family,
      'families': families,
      'parameter_size': parameterSize,
      'quantization_level': quantizationLevel,
    };
  }
}
