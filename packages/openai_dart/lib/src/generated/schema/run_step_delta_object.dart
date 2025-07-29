// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDeltaObject
// ==========================================

/// Represents a run step delta i.e. any changed fields on a run step during streaming.
@freezed
abstract class RunStepDeltaObject with _$RunStepDeltaObject {
  const RunStepDeltaObject._();

  /// Factory constructor for RunStepDeltaObject
  const factory RunStepDeltaObject({
    /// The identifier of the run step, which can be referenced in API endpoints.
    required String id,

    /// The object type, which is always `thread.run.step.delta`.
    required RunStepDeltaObjectObject object,

    /// The delta containing the fields that have changed on the run step.
    required RunStepDelta delta,
  }) = _RunStepDeltaObject;

  /// Object construction from a JSON representation
  factory RunStepDeltaObject.fromJson(Map<String, dynamic> json) =>
      _$RunStepDeltaObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'object', 'delta'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'delta': delta,
    };
  }
}

// ==========================================
// ENUM: RunStepDeltaObjectObject
// ==========================================

/// The object type, which is always `thread.run.step.delta`.
enum RunStepDeltaObjectObject {
  @JsonValue('thread.run.step.delta')
  threadRunStepDelta,
}
