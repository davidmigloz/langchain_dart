// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateAssistantFileRequest
// ==========================================

/// Request object for the Create assistant file endpoint.
@freezed
class CreateAssistantFileRequest with _$CreateAssistantFileRequest {
  const CreateAssistantFileRequest._();

  /// Factory constructor for CreateAssistantFileRequest
  const factory CreateAssistantFileRequest({
    /// A [File](https://platform.openai.com/docs/api-reference/files) ID (with `purpose="assistants"`) that the assistant should use. Useful for tools like `retrieval` and `code_interpreter` that can access files.
    @JsonKey(name: 'file_id') required String fileId,
  }) = _CreateAssistantFileRequest;

  /// Object construction from a JSON representation
  factory CreateAssistantFileRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAssistantFileRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['file_id'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'file_id': fileId,
    };
  }
}
