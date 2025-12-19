// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: FineTuneReinforcementMethod
// ==========================================

/// Configuration for the reinforcement fine-tuning method.
@freezed
abstract class FineTuneReinforcementMethod with _$FineTuneReinforcementMethod {
  const FineTuneReinforcementMethod._();

  /// Factory constructor for FineTuneReinforcementMethod
  const factory FineTuneReinforcementMethod({
    /// The grader used for the reinforcement fine-tuning method. This is a flexible object
    /// that can be one of: StringCheckGrader, TextSimilarityGrader, PythonGrader,
    /// ScoreModelGrader, or MultiGrader.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? grader,

    /// The hyperparameters used for the reinforcement fine-tuning job.
    @JsonKey(includeIfNull: false)
    FineTuneReinforcementHyperparameters? hyperparameters,
  }) = _FineTuneReinforcementMethod;

  /// Object construction from a JSON representation
  factory FineTuneReinforcementMethod.fromJson(Map<String, dynamic> json) =>
      _$FineTuneReinforcementMethodFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['grader', 'hyperparameters'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'grader': grader, 'hyperparameters': hyperparameters};
  }
}
