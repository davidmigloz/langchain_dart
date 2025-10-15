// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ModerationCategoriesAppliedInputTypes
// ==========================================

/// A list of the categories along with the input type(s) that the score applies to.
@freezed
abstract class ModerationCategoriesAppliedInputTypes
    with _$ModerationCategoriesAppliedInputTypes {
  const ModerationCategoriesAppliedInputTypes._();

  /// Factory constructor for ModerationCategoriesAppliedInputTypes
  const factory ModerationCategoriesAppliedInputTypes({
    /// The applied input type(s) for the category 'hate'.
    required List<String> hate,

    /// The applied input type(s) for the category 'hate/threatening'.
    @JsonKey(name: 'hate/threatening') required List<String> hateThreatening,

    /// The applied input type(s) for the category 'harassment'.
    required List<String> harassment,

    /// The applied input type(s) for the category 'harassment/threatening'.
    @JsonKey(name: 'harassment/threatening')
    required List<String> harassmentThreatening,

    /// The applied input type(s) for the category 'illicit'.
    required List<String> illicit,

    /// The applied input type(s) for the category 'illicit/violent'.
    @JsonKey(name: 'illicit/violent') required List<String> illicitViolent,

    /// The applied input type(s) for the category 'self-harm'.
    @JsonKey(name: 'self-harm') required List<String> selfHarm,

    /// The applied input type(s) for the category 'self-harm/intent'.
    @JsonKey(name: 'self-harm/intent') required List<String> selfHarmIntent,

    /// The applied input type(s) for the category 'self-harm/instructions'.
    @JsonKey(name: 'self-harm/instructions')
    required List<String> selfHarmInstructions,

    /// The applied input type(s) for the category 'sexual'.
    required List<String> sexual,

    /// The applied input type(s) for the category 'sexual/minors'.
    @JsonKey(name: 'sexual/minors') required List<String> sexualMinors,

    /// The applied input type(s) for the category 'violence'.
    required List<String> violence,

    /// The applied input type(s) for the category 'violence/graphic'.
    @JsonKey(name: 'violence/graphic') required List<String> violenceGraphic,
  }) = _ModerationCategoriesAppliedInputTypes;

  /// Object construction from a JSON representation
  factory ModerationCategoriesAppliedInputTypes.fromJson(
    Map<String, dynamic> json,
  ) => _$ModerationCategoriesAppliedInputTypesFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'hate',
    'hate/threatening',
    'harassment',
    'harassment/threatening',
    'illicit',
    'illicit/violent',
    'self-harm',
    'self-harm/intent',
    'self-harm/instructions',
    'sexual',
    'sexual/minors',
    'violence',
    'violence/graphic',
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
      'illicit': illicit,
      'illicit/violent': illicitViolent,
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
