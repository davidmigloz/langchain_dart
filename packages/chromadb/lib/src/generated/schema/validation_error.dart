// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of chroma_api_schema;

// ==========================================
// CLASS: ValidationError
// ==========================================

/// An error occurred during a request.
@freezed
class ValidationError with _$ValidationError {
  const ValidationError._();

  /// Factory constructor for ValidationError
  const factory ValidationError({
    /// No Description
    required List<dynamic> loc,

    /// No Description
    required String msg,

    /// No Description
    required String type,
  }) = _ValidationError;

  /// Object construction from a JSON representation
  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['loc', 'msg', 'type'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'loc': loc,
      'msg': msg,
      'type': type,
    };
  }
}
