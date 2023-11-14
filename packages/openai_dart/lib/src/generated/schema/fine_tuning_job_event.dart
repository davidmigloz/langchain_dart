// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: FineTuningJobEvent
// ==========================================

/// Fine-tuning job event object.
@freezed
class FineTuningJobEvent with _$FineTuningJobEvent {
  const FineTuningJobEvent._();

  /// Factory constructor for FineTuningJobEvent
  const factory FineTuningJobEvent({
    /// The event identifier, which can be referenced in the API endpoints.
    required String id,

    /// The Unix timestamp (in seconds) for when the event was created.
    @JsonKey(name: 'created_at') required int createdAt,

    /// The log level of the event.
    required FineTuningJobEventLevel level,

    /// The message of the event.
    required String message,

    /// The object type, which is always "fine_tuning.job.event".
    required FineTuningJobEventObject object,
  }) = _FineTuningJobEvent;

  /// Object construction from a JSON representation
  factory FineTuningJobEvent.fromJson(Map<String, dynamic> json) =>
      _$FineTuningJobEventFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'created_at',
    'level',
    'message',
    'object'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': createdAt,
      'level': level,
      'message': message,
      'object': object,
    };
  }
}

// ==========================================
// ENUM: FineTuningJobEventLevel
// ==========================================

/// The log level of the event.
enum FineTuningJobEventLevel {
  @JsonValue('info')
  info,
  @JsonValue('warn')
  warn,
  @JsonValue('error')
  error,
}

// ==========================================
// ENUM: FineTuningJobEventObject
// ==========================================

/// The object type, which is always "fine_tuning.job.event".
enum FineTuningJobEventObject {
  @JsonValue('fine_tuning.job.event')
  fineTuningJobEvent,
}
