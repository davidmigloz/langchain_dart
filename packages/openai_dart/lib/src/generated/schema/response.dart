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

    /// No Description
    required String status,

    /// No Description
    @JsonKey(name: 'created_at') required int createdAt,

    /// No Description
    required List<Map<String, dynamic>> output,
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
    'output'
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
    };
  }
}
