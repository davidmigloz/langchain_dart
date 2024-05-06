// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateVectorStoreFileRequest
// ==========================================

/// Request object for the Create vector store file endpoint.
@freezed
class CreateVectorStoreFileRequest with _$CreateVectorStoreFileRequest {
  const CreateVectorStoreFileRequest._();

  /// Factory constructor for CreateVectorStoreFileRequest
  const factory CreateVectorStoreFileRequest({
    /// A [File](https://platform.openai.com/docs/api-reference/files) ID that the vector store should use. Useful for tools like `file_search` that can access files.
    @JsonKey(name: 'file_id') required String fileId,
  }) = _CreateVectorStoreFileRequest;

  /// Object construction from a JSON representation
  factory CreateVectorStoreFileRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateVectorStoreFileRequestFromJson(json);

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
