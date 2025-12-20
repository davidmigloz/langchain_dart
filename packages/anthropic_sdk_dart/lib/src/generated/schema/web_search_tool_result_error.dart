// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: WebSearchToolResultError
// ==========================================

/// An error from the web search tool.
@freezed
abstract class WebSearchToolResultError with _$WebSearchToolResultError {
  const WebSearchToolResultError._();

  /// Factory constructor for WebSearchToolResultError
  const factory WebSearchToolResultError({
    /// The type of error block.
    required String type,

    /// The error code for a web search tool result error.
    @JsonKey(name: 'error_code')
    required WebSearchToolResultErrorCode errorCode,
  }) = _WebSearchToolResultError;

  /// Object construction from a JSON representation
  factory WebSearchToolResultError.fromJson(Map<String, dynamic> json) =>
      _$WebSearchToolResultErrorFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'error_code'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'type': type, 'error_code': errorCode};
  }
}
