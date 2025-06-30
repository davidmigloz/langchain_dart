// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: Error
// ==========================================

/// An error object.
@freezed
class Error with _$Error {
  const Error._();

  /// Factory constructor for Error
  const factory Error({
    /// The type of error.
    required String type,

    /// A human-readable error message.
    required String message,
  }) = _Error;

  /// Object construction from a JSON representation
  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'message'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'message': message,
    };
  }
}
