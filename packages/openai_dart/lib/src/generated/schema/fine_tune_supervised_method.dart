// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: FineTuneSupervisedMethod
// ==========================================

/// Configuration for the supervised fine-tuning method.
@freezed
abstract class FineTuneSupervisedMethod with _$FineTuneSupervisedMethod {
  const FineTuneSupervisedMethod._();

  /// Factory constructor for FineTuneSupervisedMethod
  const factory FineTuneSupervisedMethod({
    /// The hyperparameters used for the supervised fine-tuning job.
    @JsonKey(includeIfNull: false)
    FineTuneSupervisedHyperparameters? hyperparameters,
  }) = _FineTuneSupervisedMethod;

  /// Object construction from a JSON representation
  factory FineTuneSupervisedMethod.fromJson(Map<String, dynamic> json) =>
      _$FineTuneSupervisedMethodFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['hyperparameters'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'hyperparameters': hyperparameters};
  }
}
