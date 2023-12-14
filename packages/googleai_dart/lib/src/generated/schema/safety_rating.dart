// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: SafetyRating
// ==========================================

/// Safety rating for a piece of content. The safety rating contains the category of harm and the harm probability level in that category for a piece of content. Content is classified for safety across a number of harm categories and the probability of the harm classification is included here.
@freezed
class SafetyRating with _$SafetyRating {
  const SafetyRating._();

  /// Factory constructor for SafetyRating
  const factory SafetyRating({
    /// Required. The category for this rating.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    SafetyRatingCategory? category,

    /// Required. The probability of harm for this content.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    SafetyRatingProbability? probability,

    /// Was this content blocked because of this rating?
    @JsonKey(includeIfNull: false) bool? blocked,
  }) = _SafetyRating;

  /// Object construction from a JSON representation
  factory SafetyRating.fromJson(Map<String, dynamic> json) =>
      _$SafetyRatingFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'category',
    'probability',
    'blocked'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'probability': probability,
      'blocked': blocked,
    };
  }
}

// ==========================================
// ENUM: SafetyRatingCategory
// ==========================================

/// Required. The category for this rating.
enum SafetyRatingCategory {
  @JsonValue('HARM_CATEGORY_UNSPECIFIED')
  harmCategoryUnspecified,
  @JsonValue('HARM_CATEGORY_DEROGATORY')
  harmCategoryDerogatory,
  @JsonValue('HARM_CATEGORY_TOXICITY')
  harmCategoryToxicity,
  @JsonValue('HARM_CATEGORY_VIOLENCE')
  harmCategoryViolence,
  @JsonValue('HARM_CATEGORY_SEXUAL')
  harmCategorySexual,
  @JsonValue('HARM_CATEGORY_MEDICAL')
  harmCategoryMedical,
  @JsonValue('HARM_CATEGORY_DANGEROUS')
  harmCategoryDangerous,
  @JsonValue('HARM_CATEGORY_HARASSMENT')
  harmCategoryHarassment,
  @JsonValue('HARM_CATEGORY_HATE_SPEECH')
  harmCategoryHateSpeech,
  @JsonValue('HARM_CATEGORY_SEXUALLY_EXPLICIT')
  harmCategorySexuallyExplicit,
  @JsonValue('HARM_CATEGORY_DANGEROUS_CONTENT')
  harmCategoryDangerousContent,
}

// ==========================================
// ENUM: SafetyRatingProbability
// ==========================================

/// Required. The probability of harm for this content.
enum SafetyRatingProbability {
  @JsonValue('HARM_PROBABILITY_UNSPECIFIED')
  harmProbabilityUnspecified,
  @JsonValue('NEGLIGIBLE')
  negligible,
  @JsonValue('LOW')
  low,
  @JsonValue('MEDIUM')
  medium,
  @JsonValue('HIGH')
  high,
}
