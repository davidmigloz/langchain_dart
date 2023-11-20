// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of chroma_api_schema;

// ==========================================
// CLASS: HTTPValidationError
// ==========================================

/// No Description
@freezed
class HTTPValidationError with _$HTTPValidationError {
  const HTTPValidationError._();

  /// Factory constructor for HTTPValidationError
  const factory HTTPValidationError({
    /// No Description
    @JsonKey(includeIfNull: false) List<ValidationError>? detail,
  }) = _HTTPValidationError;

  /// Object construction from a JSON representation
  factory HTTPValidationError.fromJson(Map<String, dynamic> json) =>
      _$HTTPValidationErrorFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['detail'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'detail': detail,
    };
  }
}
