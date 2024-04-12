// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDelta
// ==========================================

/// The delta containing the fields that have changed on the run step.
@freezed
class RunStepDelta with _$RunStepDelta {
  const RunStepDelta._();

  /// Factory constructor for RunStepDelta
  const factory RunStepDelta({
    /// The details of the run step
    /// Any of: [RunStepDeltaStepDetailsMessageCreationObject], [RunStepDeltaStepDetailsToolCallsObject]
    @JsonKey(name: 'step_details', includeIfNull: false)
    RunStepDeltaDetails? stepDetails,
  }) = _RunStepDelta;

  /// Object construction from a JSON representation
  factory RunStepDelta.fromJson(Map<String, dynamic> json) =>
      _$RunStepDeltaFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['step_details'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'step_details': stepDetails,
    };
  }
}
