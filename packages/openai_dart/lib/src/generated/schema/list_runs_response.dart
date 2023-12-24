// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ListRunsResponse
// ==========================================

/// Represents a list of runs returned by the List runs endpoint.
@freezed
class ListRunsResponse with _$ListRunsResponse {
  const ListRunsResponse._();

  /// Factory constructor for ListRunsResponse
  const factory ListRunsResponse({
    /// The object type, which is always `list`.
    required String object,

    /// The list of runs.
    required List<RunObject> data,

    /// The ID of the first run in the list.
    @JsonKey(name: 'first_id') required String firstId,

    /// The ID of the last run in the list.
    @JsonKey(name: 'last_id') required String lastId,

    /// Whether there are more runs to retrieve.
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _ListRunsResponse;

  /// Object construction from a JSON representation
  factory ListRunsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRunsResponseFromJson(json);

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
