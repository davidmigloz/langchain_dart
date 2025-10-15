// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: APIError
// ==========================================

/// Details of the API error.
@freezed
abstract class APIError with _$APIError {
  const APIError._();

  /// Factory constructor for APIError
  const factory APIError({
    /// The type of error (e.g., "invalid_request_error", "server_error").
    @JsonKey(includeIfNull: false) String? type,

    /// Error code, if any.
    @JsonKey(includeIfNull: false) String? code,

    /// A human-readable error message.
    @JsonKey(includeIfNull: false) String? message,

    /// Parameter related to the error, if any.
    @JsonKey(includeIfNull: false) String? param,

    /// The event_id of the client event that caused the error, if applicable.
    @JsonKey(name: 'event_id', includeIfNull: false) String? eventId,
  }) = _APIError;

  /// Object construction from a JSON representation
  factory APIError.fromJson(Map<String, dynamic> json) =>
      _$APIErrorFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'type',
    'code',
    'message',
    'param',
    'event_id',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'code': code,
      'message': message,
      'param': param,
      'event_id': eventId,
    };
  }
}
