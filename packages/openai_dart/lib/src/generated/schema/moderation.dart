// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: Moderation
// ==========================================

/// Represents policy compliance report by OpenAI's content moderation model against a given input.
@freezed
abstract class Moderation with _$Moderation {
  const Moderation._();

  /// Factory constructor for Moderation
  const factory Moderation({
    /// Whether any of the below categories are flagged.
    required bool flagged,

    /// A list of the categories, and whether they are flagged or not.
    required ModerationCategories categories,

    /// A list of the categories along with their scores as predicted by model.
    @JsonKey(name: 'category_scores')
    required ModerationCategoriesScores categoryScores,

    /// A list of the categories along with the input type(s) that the score applies to.
    @JsonKey(name: 'category_applied_input_types')
    required ModerationCategoriesAppliedInputTypes categoryAppliedInputTypes,
  }) = _Moderation;

  /// Object construction from a JSON representation
  factory Moderation.fromJson(Map<String, dynamic> json) =>
      _$ModerationFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'flagged',
    'categories',
    'category_scores',
    'category_applied_input_types'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'flagged': flagged,
      'categories': categories,
      'category_scores': categoryScores,
      'category_applied_input_types': categoryAppliedInputTypes,
    };
  }
}
