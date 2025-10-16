// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: Error
// ==========================================

/// Represents an error that occurred during an API request.
@freezed
abstract class Error with _$Error {
  const Error._();

  /// Factory constructor for Error
  const factory Error({
    /// The error code.
    required String? code,

    /// A human-readable description of the error.
    required String message,

    /// The parameter in the request that caused the error.
    required String? param,

    /// The type of error.
    required String type,
  }) = _Error;

  /// Object construction from a JSON representation
  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'code',
    'message',
    'param',
    'type',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'code': code, 'message': message, 'param': param, 'type': type};
  }
}
