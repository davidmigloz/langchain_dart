// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ListThreadsResponse
// ==========================================

/// Represents a list of threads returned by the List threads endpoint.
@freezed
class ListThreadsResponse with _$ListThreadsResponse {
  const ListThreadsResponse._();

  /// Factory constructor for ListThreadsResponse
  const factory ListThreadsResponse({
    /// The object type, which is always `list`.
    required String object,

    /// The list of threads.
    required List<ThreadObject> data,

    /// The ID of the first thread in the list.
    @JsonKey(name: 'first_id') required String firstId,

    /// The ID of the last thread in the list.
    @JsonKey(name: 'last_id') required String lastId,

    /// Whether there are more threads to retrieve.
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _ListThreadsResponse;

  /// Object construction from a JSON representation
  factory ListThreadsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListThreadsResponseFromJson(json);

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
