// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDetailsMessageCreation
// ==========================================

/// Details of the message creation by the run step.
@freezed
class RunStepDetailsMessageCreation with _$RunStepDetailsMessageCreation {
  const RunStepDetailsMessageCreation._();

  /// Factory constructor for RunStepDetailsMessageCreation
  const factory RunStepDetailsMessageCreation({
    /// The ID of the message that was created by this run step.
    @JsonKey(name: 'message_id') required String messageId,
  }) = _RunStepDetailsMessageCreation;

  /// Object construction from a JSON representation
  factory RunStepDetailsMessageCreation.fromJson(Map<String, dynamic> json) =>
      _$RunStepDetailsMessageCreationFromJson(json);

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
