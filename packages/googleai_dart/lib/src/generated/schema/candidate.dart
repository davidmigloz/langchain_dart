// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: Candidate
// ==========================================

/// A response candidate generated from the model.
@freezed
class Candidate with _$Candidate {
  const Candidate._();

  /// Factory constructor for Candidate
  const factory Candidate({
    /// Output only. Generated content returned from the model.
    @JsonKey(includeIfNull: false) Content? content,

    /// Optional. Output only. The reason why the model stopped generating tokens. If empty, the model has not stopped generating the tokens.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    CandidateFinishReason? finishReason,

    /// Output only. Citation information for model-generated candidate. This field may be populated with recitation information for any text included in the `content`. These are passages that are "recited" from copyrighted material in the foundational LLM's training data.
    @JsonKey(includeIfNull: false) CitationMetadata? citationMetadata,

    /// Output only. Index of the candidate in the list of candidates.
    @JsonKey(includeIfNull: false) int? index,

    /// Output only. Token count for this candidate.
    @JsonKey(includeIfNull: false) int? tokenCount,

    /// List of ratings for the safety of a response candidate. There is at most one rating per category.
    @JsonKey(includeIfNull: false) List<SafetyRating>? safetyRatings,
  }) = _Candidate;

  /// Object construction from a JSON representation
  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'content',
    'finishReason',
    'citationMetadata',
    'index',
    'tokenCount',
    'safetyRatings'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'finishReason': finishReason,
      'citationMetadata': citationMetadata,
      'index': index,
      'tokenCount': tokenCount,
      'safetyRatings': safetyRatings,
    };
  }
}

// ==========================================
// ENUM: CandidateFinishReason
// ==========================================

/// Optional. Output only. The reason why the model stopped generating tokens. If empty, the model has not stopped generating the tokens.
enum CandidateFinishReason {
  @JsonValue('FINISH_REASON_UNSPECIFIED')
  finishReasonUnspecified,
  @JsonValue('STOP')
  stop,
  @JsonValue('MAX_TOKENS')
  maxTokens,
  @JsonValue('SAFETY')
  safety,
  @JsonValue('RECITATION')
  recitation,
  @JsonValue('OTHER')
  other,
}
