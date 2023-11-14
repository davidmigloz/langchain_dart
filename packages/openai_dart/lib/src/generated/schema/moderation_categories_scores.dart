// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ModerationCategoriesScores
// ==========================================

/// A list of the categories along with their scores as predicted by model.
@freezed
class ModerationCategoriesScores with _$ModerationCategoriesScores {
  const ModerationCategoriesScores._();

  /// Factory constructor for ModerationCategoriesScores
  const factory ModerationCategoriesScores({
    /// The score for the category 'hate'.
    required double hate,

    /// The score for the category 'hate/threatening'.
    @JsonKey(name: 'hate/threatening') required double hateThreatening,

    /// The score for the category 'harassment'.
    required double harassment,

    /// The score for the category 'harassment/threatening'.
    @JsonKey(name: 'harassment/threatening')
    required double harassmentThreatening,

    /// The score for the category 'self-harm'.
    @JsonKey(name: 'self-harm') required double selfHarm,

    /// The score for the category 'self-harm/intent'.
    @JsonKey(name: 'self-harm/intent') required double selfHarmIntent,

    /// The score for the category 'self-harm/instructions'.
    @JsonKey(name: 'self-harm/instructions')
    required double selfHarmInstructions,

    /// The score for the category 'sexual'.
    required double sexual,

    /// The score for the category 'sexual/minors'.
    @JsonKey(name: 'sexual/minors') required double sexualMinors,

    /// The score for the category 'violence'.
    required double violence,

    /// The score for the category 'violence/graphic'.
    @JsonKey(name: 'violence/graphic') required double violenceGraphic,
  }) = _ModerationCategoriesScores;

  /// Object construction from a JSON representation
  factory ModerationCategoriesScores.fromJson(Map<String, dynamic> json) =>
      _$ModerationCategoriesScoresFromJson(json);

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
