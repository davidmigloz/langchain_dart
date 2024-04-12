// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDeltaStepDetailsMessageCreation
// ==========================================

/// Details of the message creation by the run step.
@freezed
class RunStepDeltaStepDetailsMessageCreation
    with _$RunStepDeltaStepDetailsMessageCreation {
  const RunStepDeltaStepDetailsMessageCreation._();

  /// Factory constructor for RunStepDeltaStepDetailsMessageCreation
  const factory RunStepDeltaStepDetailsMessageCreation({
    /// The ID of the message that was created by this run step.
    @JsonKey(name: 'message_id', includeIfNull: false) String? messageId,
  }) = _RunStepDeltaStepDetailsMessageCreation;

  /// Object construction from a JSON representation
  factory RunStepDeltaStepDetailsMessageCreation.fromJson(
          Map<String, dynamic> json) =>
      _$RunStepDeltaStepDetailsMessageCreationFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['message_id'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'message_id': messageId,
    };
  }
}
