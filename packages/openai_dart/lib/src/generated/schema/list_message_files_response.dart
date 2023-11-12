// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ListMessageFilesResponse
// ==========================================

/// Represents a list of message files returned by the List message files endpoint.
@freezed
class ListMessageFilesResponse with _$ListMessageFilesResponse {
  const ListMessageFilesResponse._();

  /// Factory constructor for ListMessageFilesResponse
  const factory ListMessageFilesResponse({
    /// The object type, which is always `list`.
    required String object,

    /// A list of message files.
    required List<MessageFileObject> data,

    /// The ID of the first message file in the list.
    @JsonKey(name: 'first_id') required String firstId,

    /// The ID of the last message file in the list.
    @JsonKey(name: 'last_id') required String lastId,

    /// Whether there are more message files available.
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _ListMessageFilesResponse;

  /// Object construction from a JSON representation
  factory ListMessageFilesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMessageFilesResponseFromJson(json);

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
