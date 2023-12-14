// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: SafetySetting
// ==========================================

/// Safety setting, affecting the safety-blocking behavior. Passing a safety setting for a category changes the allowed proability that content is blocked.
@freezed
class SafetySetting with _$SafetySetting {
  const SafetySetting._();

  /// Factory constructor for SafetySetting
  const factory SafetySetting({
    /// Required. The category for this setting.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    SafetySettingCategory? category,

    /// Required. Controls the probability threshold at which harm is blocked.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    SafetySettingThreshold? threshold,
  }) = _SafetySetting;

  /// Object construction from a JSON representation
  factory SafetySetting.fromJson(Map<String, dynamic> json) =>
      _$SafetySettingFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['category', 'threshold'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'threshold': threshold,
    };
  }
}

// ==========================================
// ENUM: SafetySettingCategory
// ==========================================

/// Required. The category for this setting.
enum SafetySettingCategory {
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
// ENUM: SafetySettingThreshold
// ==========================================

/// Required. Controls the probability threshold at which harm is blocked.
enum SafetySettingThreshold {
  @JsonValue('HARM_BLOCK_THRESHOLD_UNSPECIFIED')
  harmBlockThresholdUnspecified,
  @JsonValue('BLOCK_LOW_AND_ABOVE')
  blockLowAndAbove,
  @JsonValue('BLOCK_MEDIUM_AND_ABOVE')
  blockMediumAndAbove,
  @JsonValue('BLOCK_ONLY_HIGH')
  blockOnlyHigh,
  @JsonValue('BLOCK_NONE')
  blockNone,
}
