// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: ShowRequest
// ==========================================

/// Show details about a model including modelfile, template, parameters, license, and system prompt.
@freezed
class ShowRequest with _$ShowRequest {
  const ShowRequest._();

  /// Factory constructor for ShowRequest
  const factory ShowRequest({
    /// (required) name of the model to show
    required String name,
  }) = _ShowRequest;

  /// Object construction from a JSON representation
  factory ShowRequest.fromJson(Map<String, dynamic> json) =>
      _$ShowRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['name'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
