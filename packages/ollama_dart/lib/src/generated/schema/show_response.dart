// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: ShowResponse
// ==========================================

/// details about a model including modelfile, template, parameters, license, and system prompt.
@freezed
class ShowResponse with _$ShowResponse {
  const ShowResponse._();

  /// Factory constructor for ShowResponse
  const factory ShowResponse({
    /// the model's license
    @JsonKey(includeIfNull: false) String? license,

    /// the modelfile associated with the model
    @JsonKey(includeIfNull: false) String? modelfile,

    /// model parameters
    @JsonKey(includeIfNull: false) String? parameters,

    /// the prompt template for the model
    @JsonKey(includeIfNull: false) String? template,
  }) = _ShowResponse;

  /// Object construction from a JSON representation
  factory ShowResponse.fromJson(Map<String, dynamic> json) =>
      _$ShowResponseFromJson(json);

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
