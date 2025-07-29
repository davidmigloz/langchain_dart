// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: DeleteVectorStoreFileResponse
// ==========================================

/// Response object for the Delete vector store file endpoint.
@freezed
abstract class DeleteVectorStoreFileResponse with _$DeleteVectorStoreFileResponse {
  const DeleteVectorStoreFileResponse._();

  /// Factory constructor for DeleteVectorStoreFileResponse
  const factory DeleteVectorStoreFileResponse({
    /// The ID of the deleted vector store file.
    required String id,

    /// Whether the vector store file was deleted.
    required bool deleted,

    /// The object type, which is always `vector_store.file.deleted`.
    required String object,
  }) = _DeleteVectorStoreFileResponse;

  /// Object construction from a JSON representation
  factory DeleteVectorStoreFileResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteVectorStoreFileResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'deleted', 'object'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'deleted': deleted,
      'object': object,
    };
  }
}
