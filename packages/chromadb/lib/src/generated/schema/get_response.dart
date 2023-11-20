// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of chroma_api_schema;

// ==========================================
// CLASS: GetResponse
// ==========================================

/// Response model for get items from collection.
@freezed
class GetResponse with _$GetResponse {
  const GetResponse._();

  /// Factory constructor for GetResponse
  const factory GetResponse({
    /// List of ids of the items.
    required List<String> ids,

    /// List of embeddings of the items.
    @JsonKey(includeIfNull: false) List<List<double>>? embeddings,

    /// List of metadatas of the items.
    @JsonKey(includeIfNull: false) List<Map<String, dynamic>?>? metadatas,

    /// List of documents of the items.
    @JsonKey(includeIfNull: false) List<String?>? documents,
  }) = _GetResponse;

  /// Object construction from a JSON representation
  factory GetResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'ids',
    'embeddings',
    'metadatas',
    'documents'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'ids': ids,
      'embeddings': embeddings,
      'metadatas': metadatas,
      'documents': documents,
    };
  }
}
