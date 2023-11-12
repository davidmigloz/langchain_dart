// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ModerationCategories
// ==========================================

/// A list of the categories, and whether they are flagged or not.
@freezed
class ModerationCategories with _$ModerationCategories {
  const ModerationCategories._();

  /// Factory constructor for ModerationCategories
  const factory ModerationCategories({
    /// Content that expresses, incites, or promotes hate based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste. Hateful content aimed at non-protected groups (e.g., chess players) is harassment.
    required bool hate,

    /// Hateful content that also includes violence or serious harm towards the targeted group based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste.
    @JsonKey(name: 'hate/threatening') required bool hateThreatening,

    /// Content that expresses, incites, or promotes harassing language towards any target.
    required bool harassment,

    /// Harassment content that also includes violence or serious harm towards any target.
    @JsonKey(name: 'harassment/threatening')
    required bool harassmentThreatening,

    /// Content that promotes, encourages, or depicts acts of self-harm, such as suicide, cutting, and eating disorders.
    @JsonKey(name: 'self-harm') required bool selfHarm,

    /// Content where the speaker expresses that they are engaging or intend to engage in acts of self-harm, such as suicide, cutting, and eating disorders.
    @JsonKey(name: 'self-harm/intent') required bool selfHarmIntent,

    /// Content that encourages performing acts of self-harm, such as suicide, cutting, and eating disorders, or that gives instructions or advice on how to commit such acts.
    @JsonKey(name: 'self-harm/instructions') required bool selfHarmInstructions,

    /// Content meant to arouse sexual excitement, such as the description of sexual activity, or that promotes sexual services (excluding sex education and wellness).
    required bool sexual,

    /// Sexual content that includes an individual who is under 18 years old.
    @JsonKey(name: 'sexual/minors') required bool sexualMinors,

    /// Content that depicts death, violence, or physical injury.
    required bool violence,

    /// Content that depicts death, violence, or physical injury in graphic detail.
    @JsonKey(name: 'violence/graphic') required bool violenceGraphic,
  }) = _ModerationCategories;

  /// Object construction from a JSON representation
  factory ModerationCategories.fromJson(Map<String, dynamic> json) =>
      _$ModerationCategoriesFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'hate',
    'hate/threatening',
    'harassment',
    'harassment/threatening',
    'self-harm',
    'self-harm/intent',
    'self-harm/instructions',
    'sexual',
    'sexual/minors',
    'violence',
    'violence/graphic'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'hate': hate,
      'hate/threatening': hateThreatening,
      'harassment': harassment,
      'harassment/threatening': harassmentThreatening,
      'self-harm': selfHarm,
      'self-harm/intent': selfHarmIntent,
      'self-harm/instructions': selfHarmInstructions,
      'sexual': sexual,
      'sexual/minors': sexualMinors,
      'violence': violence,
      'violence/graphic': violenceGraphic,
    };
  }
}
