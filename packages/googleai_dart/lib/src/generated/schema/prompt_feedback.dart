// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: PromptFeedback
// ==========================================

/// A set of the feedback metadata the prompt specified in `GenerateContentRequest.content`.
@freezed
class PromptFeedback with _$PromptFeedback {
  const PromptFeedback._();

  /// Factory constructor for PromptFeedback
  const factory PromptFeedback({
    /// Ratings for safety of the prompt. There is at most one rating per category.
    @JsonKey(includeIfNull: false) List<SafetyRating>? safetyRatings,

    /// Optional. If set, the prompt was blocked and no candidates are returned. Rephrase your prompt.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    PromptFeedbackBlockReason? blockReason,
  }) = _PromptFeedback;

  /// Object construction from a JSON representation
  factory PromptFeedback.fromJson(Map<String, dynamic> json) =>
      _$PromptFeedbackFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['safetyRatings', 'blockReason'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'safetyRatings': safetyRatings,
      'blockReason': blockReason,
    };
  }
}

// ==========================================
// ENUM: PromptFeedbackBlockReason
// ==========================================

/// Optional. If set, the prompt was blocked and no candidates are returned. Rephrase your prompt.
enum PromptFeedbackBlockReason {
  @JsonValue('BLOCK_REASON_UNSPECIFIED')
  blockReasonUnspecified,
  @JsonValue('SAFETY')
  safety,
  @JsonValue('OTHER')
  other,
}
