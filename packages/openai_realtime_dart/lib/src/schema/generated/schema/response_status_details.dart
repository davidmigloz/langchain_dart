// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: ResponseStatusDetails
// ==========================================

/// Additional details about the status.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class ResponseStatusDetails with _$ResponseStatusDetails {
  const ResponseStatusDetails._();

  // ------------------------------------------
  // UNION: ResponseStatusDetailsCancelled
  // ------------------------------------------

  /// Details about the cancelled response.

  @FreezedUnionValue('cancelled')
  const factory ResponseStatusDetails.cancelled({
    /// The type of error that caused the response to fail.
    @Default(ResponseStatusType.cancelled) ResponseStatusType type,

    /// The reason the Response did not complete. For a `cancelled` Response, one of `turn_detected`
    /// (the server VAD detected a new start of speech) or `client_cancelled` (the client sent a
    /// cancel event). For an `incomplete` Response, one of `max_output_tokens` or `content_filter`
    /// (the server-side safety filter activated and cut off the response).
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    ResponseStatusIncompleteReason? reason,
  }) = ResponseStatusDetailsCancelled;

  // ------------------------------------------
  // UNION: ResponseStatusDetailsIncomplete
  // ------------------------------------------

  /// Details about the incomplete response.

  @FreezedUnionValue('incomplete')
  const factory ResponseStatusDetails.incomplete({
    /// The type of error that caused the response to fail.
    @Default(ResponseStatusType.incomplete) ResponseStatusType type,

    /// The reason the Response did not complete. For a `cancelled` Response, one of `turn_detected`
    /// (the server VAD detected a new start of speech) or `client_cancelled` (the client sent a
    /// cancel event). For an `incomplete` Response, one of `max_output_tokens` or `content_filter`
    /// (the server-side safety filter activated and cut off the response).
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    ResponseStatusIncompleteReason? reason,
  }) = ResponseStatusDetailsIncomplete;

  // ------------------------------------------
  // UNION: ResponseStatusDetailsFailed
  // ------------------------------------------

  /// Details about the failed response.

  @FreezedUnionValue('failed')
  const factory ResponseStatusDetails.failed({
    /// The type of error that caused the response to fail.
    @Default(ResponseStatusType.failed) ResponseStatusType type,

    /// Details of the API error.
    @JsonKey(includeIfNull: false) APIError? error,
  }) = ResponseStatusDetailsFailed;

  /// Object construction from a JSON representation
  factory ResponseStatusDetails.fromJson(Map<String, dynamic> json) =>
      _$ResponseStatusDetailsFromJson(json);
}

// ==========================================
// ENUM: ResponseStatusDetailsEnumType
// ==========================================

enum ResponseStatusDetailsEnumType {
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('incomplete')
  incomplete,
  @JsonValue('failed')
  failed,
}
