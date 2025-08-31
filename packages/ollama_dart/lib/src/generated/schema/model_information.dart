// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: ModelInformation
// ==========================================

/// Details about a model.
@freezed
abstract class ModelInformation with _$ModelInformation {
  const ModelInformation._();

  /// Factory constructor for ModelInformation
  const factory ModelInformation({
    /// The architecture of the model.
    @JsonKey(name: 'general.architecture', includeIfNull: false)
    String? generalArchitecture,

    /// The file type of the model.
    @JsonKey(name: 'general.file_type', includeIfNull: false)
    int? generalFileType,

    /// The number of parameters in the model.
    @JsonKey(name: 'general.parameter_count', includeIfNull: false)
    int? generalParameterCount,

    /// The number of parameters in the model.
    @JsonKey(name: 'general.quantization_version', includeIfNull: false)
    int? generalQuantizationVersion,
  }) = _ModelInformation;

  /// Object construction from a JSON representation
  factory ModelInformation.fromJson(Map<String, dynamic> json) =>
      _$ModelInformationFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'general.architecture',
    'general.file_type',
    'general.parameter_count',
    'general.quantization_version'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'general.architecture': generalArchitecture,
      'general.file_type': generalFileType,
      'general.parameter_count': generalParameterCount,
      'general.quantization_version': generalQuantizationVersion,
    };
  }
}
