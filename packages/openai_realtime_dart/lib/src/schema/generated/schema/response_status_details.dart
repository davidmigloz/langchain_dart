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
  // UNION: ResponseStatusDetailsIncomplete
  // ------------------------------------------

  /// Details about the incomplete response.

  @FreezedUnionValue('incomplete')
  const factory ResponseStatusDetails.incomplete({
    /// The type of the status.
    @Default(ResponseStatusType.incomplete) ResponseStatusType type,

    /// The reason the response is incomplete.
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
    /// The type of the status.
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
  @JsonValue('incomplete')
  incomplete,
  @JsonValue('failed')
  failed,
}
