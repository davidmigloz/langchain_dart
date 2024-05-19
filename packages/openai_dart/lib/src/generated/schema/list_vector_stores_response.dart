// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ListVectorStoresResponse
// ==========================================

/// Represents a list of files returned by the List vector store files endpoint.
@freezed
class ListVectorStoresResponse with _$ListVectorStoresResponse {
  const ListVectorStoresResponse._();

  /// Factory constructor for ListVectorStoresResponse
  const factory ListVectorStoresResponse({
    /// The object type, which is always `list`.
    required String object,

    /// A list of assistant files.
    required List<VectorStoreObject> data,

    /// The ID of the first assistant file in the list.
    @JsonKey(name: 'first_id') required String? firstId,

    /// The ID of the last assistant file in the list.
    @JsonKey(name: 'last_id') required String? lastId,

    /// Whether there are more assistant files available.
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _ListVectorStoresResponse;

  /// Object construction from a JSON representation
  factory ListVectorStoresResponse.fromJson(Map<String, dynamic> json) =>
      _$ListVectorStoresResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'object',
    'data',
    'first_id',
    'last_id',
    'has_more'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'object': object,
      'data': data,
      'first_id': firstId,
      'last_id': lastId,
      'has_more': hasMore,
    };
  }
}
