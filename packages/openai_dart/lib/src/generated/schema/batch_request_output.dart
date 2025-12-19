// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: BatchRequestOutput
// ==========================================

/// The per-line object of the batch output and error files
@freezed
abstract class BatchRequestOutput with _$BatchRequestOutput {
  const BatchRequestOutput._();

  /// Factory constructor for BatchRequestOutput
  const factory BatchRequestOutput({
    /// The ID of the request.
    @JsonKey(includeIfNull: false) String? id,

    /// A developer-provided per-request id that will be used to match outputs to inputs.
    @JsonKey(name: 'custom_id', includeIfNull: false) String? customId,

    /// The response object for the request.
    @JsonKey(includeIfNull: false) BatchRequestOutputResponse? response,

    /// For requests that failed with a non-HTTP error, this will contain more information on the cause of the failure.
    @JsonKey(includeIfNull: false) BatchRequestOutputError? error,
  }) = _BatchRequestOutput;

  /// Object construction from a JSON representation
  factory BatchRequestOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchRequestOutputFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'custom_id',
    'response',
    'error',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'custom_id': customId,
      'response': response,
      'error': error,
    };
  }
}

// ==========================================
// CLASS: BatchRequestOutputResponse
// ==========================================

/// The response object for the request.
@freezed
abstract class BatchRequestOutputResponse with _$BatchRequestOutputResponse {
  const BatchRequestOutputResponse._();

  /// Factory constructor for BatchRequestOutputResponse
  const factory BatchRequestOutputResponse({
    /// The HTTP status code of the response
    @JsonKey(name: 'status_code', includeIfNull: false) int? statusCode,

    /// An unique identifier for the OpenAI API request. Please include this request ID when contacting support.
    @JsonKey(name: 'request_id', includeIfNull: false) String? requestId,

    /// The JSON body of the response
    @JsonKey(includeIfNull: false) dynamic body,
  }) = _BatchRequestOutputResponse;

  /// Object construction from a JSON representation
  factory BatchRequestOutputResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchRequestOutputResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'status_code',
    'request_id',
    'body',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'status_code': statusCode, 'request_id': requestId, 'body': body};
  }
}

// ==========================================
// CLASS: BatchRequestOutputError
// ==========================================

/// For requests that failed with a non-HTTP error, this will contain more information on the cause of the failure.
@freezed
abstract class BatchRequestOutputError with _$BatchRequestOutputError {
  const BatchRequestOutputError._();

  /// Factory constructor for BatchRequestOutputError
  const factory BatchRequestOutputError({
    /// A machine-readable error code.
    @JsonKey(includeIfNull: false) String? code,

    /// A human-readable error message.
    @JsonKey(includeIfNull: false) String? message,
  }) = _BatchRequestOutputError;

  /// Object construction from a JSON representation
  factory BatchRequestOutputError.fromJson(Map<String, dynamic> json) =>
      _$BatchRequestOutputErrorFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['code', 'message'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'code': code, 'message': message};
  }
}
