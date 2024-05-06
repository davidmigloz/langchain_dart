// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ListBatchesResponse
// ==========================================

/// Represents a list of batches returned by the List batches endpoint.
@freezed
class ListBatchesResponse with _$ListBatchesResponse {
  const ListBatchesResponse._();

  /// Factory constructor for ListBatchesResponse
  const factory ListBatchesResponse({
    /// No Description
    required List<Batch> data,

    /// The ID of the first batch in the list.
    @JsonKey(name: 'first_id', includeIfNull: false) String? firstId,

    /// The ID of the last batch in the list.
    @JsonKey(name: 'last_id', includeIfNull: false) String? lastId,

    /// Whether there are more batches available.
    @JsonKey(name: 'has_more') required bool hasMore,

    /// The object type, which is always `list`.
    required ListBatchesResponseObject object,
  }) = _ListBatchesResponse;

  /// Object construction from a JSON representation
  factory ListBatchesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListBatchesResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'data',
    'first_id',
    'last_id',
    'has_more',
    'object'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'first_id': firstId,
      'last_id': lastId,
      'has_more': hasMore,
      'object': object,
    };
  }
}

// ==========================================
// ENUM: ListBatchesResponseObject
// ==========================================

/// The object type, which is always `list`.
enum ListBatchesResponseObject {
  @JsonValue('list')
  list,
}
