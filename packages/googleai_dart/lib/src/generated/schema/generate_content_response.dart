// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: GenerateContentResponse
// ==========================================

/// Response from the model supporting multiple candidates. Note on safety ratings and content filtering. They are reported for both prompt in `GenerateContentResponse.prompt_feedback` and for each candidate in `finish_reason` and in `safety_ratings`. The API contract is that: - either all requested candidates are returned or no candidates at all - no candidates are returned only if there was something wrong with the prompt (see `prompt_feedback`) - feedback on each candidate is reported on `finish_reason` and `safety_ratings`.
@freezed
class GenerateContentResponse with _$GenerateContentResponse {
  const GenerateContentResponse._();

  /// Factory constructor for GenerateContentResponse
  const factory GenerateContentResponse({
    /// Returns the prompt's feedback related to the content filters.
    @JsonKey(includeIfNull: false) PromptFeedback? promptFeedback,

    /// Candidate responses from the model.
    @JsonKey(includeIfNull: false) List<Candidate>? candidates,
  }) = _GenerateContentResponse;

  /// Object construction from a JSON representation
  factory GenerateContentResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateContentResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['promptFeedback', 'candidates'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'promptFeedback': promptFeedback,
      'candidates': candidates,
    };
  }
}
