// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: GenerateContentRequest
// ==========================================

/// Request to generate a completion from the model.
@freezed
class GenerateContentRequest with _$GenerateContentRequest {
  const GenerateContentRequest._();

  /// Factory constructor for GenerateContentRequest
  const factory GenerateContentRequest({
    /// Optional. Configuration options for model generation and outputs.
    @JsonKey(includeIfNull: false) GenerationConfig? generationConfig,

    /// Required. The content of the current conversation with the model. For single-turn queries, this is a single instance. For multi-turn queries, this is a repeated field that contains conversation history + latest request.
    @JsonKey(includeIfNull: false) List<Content>? contents,

    /// Optional. A list of unique `SafetySetting` instances for blocking unsafe content. This will be enforced on the `GenerateContentRequest.contents` and `GenerateContentResponse.candidates`. There should not be more than one setting for each `SafetyCategory` type. The API will block any contents and responses that fail to meet the thresholds set by these settings. This list overrides the default settings for each `SafetyCategory` specified in the safety_settings. If there is no `SafetySetting` for a given `SafetyCategory` provided in the list, the API will use the default safety setting for that category. Harm categories HARM_CATEGORY_HATE_SPEECH, HARM_CATEGORY_SEXUALLY_EXPLICIT, HARM_CATEGORY_DANGEROUS_CONTENT, HARM_CATEGORY_HARASSMENT are supported.
    @JsonKey(includeIfNull: false) List<SafetySetting>? safetySettings,
  }) = _GenerateContentRequest;

  /// Object construction from a JSON representation
  factory GenerateContentRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateContentRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'generationConfig',
    'contents',
    'safetySettings'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'generationConfig': generationConfig,
      'contents': contents,
      'safetySettings': safetySettings,
    };
  }
}
