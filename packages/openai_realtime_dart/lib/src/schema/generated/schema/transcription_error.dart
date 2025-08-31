// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: TranscriptionError
// ==========================================

/// Details of the transcription error.
@freezed
abstract class TranscriptionError with _$TranscriptionError {
  const TranscriptionError._();

  /// Factory constructor for TranscriptionError
  const factory TranscriptionError({
    /// The type of the error.
    @JsonKey(includeIfNull: false) String? type,

    /// Error code, if any.
    @JsonKey(includeIfNull: false) String? code,

    /// A human-readable error message.
    @JsonKey(includeIfNull: false) String? message,

    /// Parameter related to the error, if any.
    @JsonKey(includeIfNull: false) String? param,
  }) = _TranscriptionError;

  /// Object construction from a JSON representation
  factory TranscriptionError.fromJson(Map<String, dynamic> json) =>
      _$TranscriptionErrorFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'type',
    'code',
    'message',
    'param'
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
    };
  }
}
