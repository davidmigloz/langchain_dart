// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: Response
// ==========================================

/// Model response.
@freezed
class Response with _$Response {
  const Response._();

  /// Factory constructor for Response
  const factory Response({
    /// No Description
    required String id,

    /// No Description
    required String object,

    /// The status of the response.
    required ResponseStatus status,

    /// No Description
    @JsonKey(name: 'created_at') required int createdAt,

    /// No Description
    required List<OutputItem> output,

    /// Usage statistics for the response.
    @JsonKey(includeIfNull: false) ResponseUsage? usage,
  }) = _Response;

  /// Object construction from a JSON representation
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'status',
    'created_at',
    'output',
    'usage'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'status': status,
      'created_at': createdAt,
      'output': output,
      'usage': usage,
    };
  }
}

// ==========================================
// ENUM: ResponseStatus
// ==========================================

/// The status of the response.
enum ResponseStatus {
  @JsonValue('initial')
  initial,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
  @JsonValue('incomplete')
  incomplete,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('expired')
  expired,
}
