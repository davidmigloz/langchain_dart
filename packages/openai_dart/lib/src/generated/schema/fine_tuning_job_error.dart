// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: FineTuningJobError
// ==========================================

/// For fine-tuning jobs that have `failed`, this will contain more information on the cause of the failure.
@freezed
class FineTuningJobError with _$FineTuningJobError {
  const FineTuningJobError._();

  /// Factory constructor for FineTuningJobError
  const factory FineTuningJobError({
    /// A machine-readable error code.
    required String code,

    /// A human-readable error message.
    required String message,

    /// The parameter that was invalid, usually `training_file` or `validation_file`. This field will be null if the failure was not parameter-specific.
    required String? param,
  }) = _FineTuningJobError;

  /// Object construction from a JSON representation
  factory FineTuningJobError.fromJson(Map<String, dynamic> json) =>
      _$FineTuningJobErrorFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['code', 'message', 'param'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
      'param': param,
    };
  }
}
