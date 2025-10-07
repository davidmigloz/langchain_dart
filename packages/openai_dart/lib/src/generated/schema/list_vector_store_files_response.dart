// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ListVectorStoreFilesResponse
// ==========================================

/// Represents a list of message files returned by the List vector store files endpoint.
@freezed
abstract class ListVectorStoreFilesResponse
    with _$ListVectorStoreFilesResponse {
  const ListVectorStoreFilesResponse._();

  /// Factory constructor for ListVectorStoreFilesResponse
  const factory ListVectorStoreFilesResponse({
    /// The object type, which is always `list`.
    required String object,

    /// A list of message files.
    required List<VectorStoreFileObject> data,

    /// The ID of the first message file in the list.
    @JsonKey(name: 'first_id', includeIfNull: false) String? firstId,

    /// The ID of the last message file in the list.
    @JsonKey(name: 'last_id', includeIfNull: false) String? lastId,

    /// Whether there are more message files available.
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _ListVectorStoreFilesResponse;

  /// Object construction from a JSON representation
  factory ListVectorStoreFilesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListVectorStoreFilesResponseFromJson(json);

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
