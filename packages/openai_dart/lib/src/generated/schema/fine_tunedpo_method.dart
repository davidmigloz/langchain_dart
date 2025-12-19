// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: FineTuneDPOMethod
// ==========================================

/// Configuration for the DPO (Direct Preference Optimization) fine-tuning method.
@freezed
abstract class FineTuneDPOMethod with _$FineTuneDPOMethod {
  const FineTuneDPOMethod._();

  /// Factory constructor for FineTuneDPOMethod
  const factory FineTuneDPOMethod({
    /// The hyperparameters used for the DPO fine-tuning job.
    @JsonKey(includeIfNull: false) FineTuneDPOHyperparameters? hyperparameters,
  }) = _FineTuneDPOMethod;

  /// Object construction from a JSON representation
  factory FineTuneDPOMethod.fromJson(Map<String, dynamic> json) =>
      _$FineTuneDPOMethodFromJson(json);

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
