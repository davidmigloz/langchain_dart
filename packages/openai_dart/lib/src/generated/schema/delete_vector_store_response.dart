// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: DeleteVectorStoreResponse
// ==========================================

/// Response object for the Delete vector store endpoint.
@freezed
abstract class DeleteVectorStoreResponse with _$DeleteVectorStoreResponse {
  const DeleteVectorStoreResponse._();

  /// Factory constructor for DeleteVectorStoreResponse
  const factory DeleteVectorStoreResponse({
    /// The ID of the deleted vector store.
    required String id,

    /// Whether the vector store was deleted.
    required bool deleted,

    /// The object type, which is always `vector_store.deleted`.
    required String object,
  }) = _DeleteVectorStoreResponse;

  /// Object construction from a JSON representation
  factory DeleteVectorStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteVectorStoreResponseFromJson(json);

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
