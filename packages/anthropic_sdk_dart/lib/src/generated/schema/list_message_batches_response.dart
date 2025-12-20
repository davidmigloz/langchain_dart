// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: ListMessageBatchesResponse
// ==========================================

/// Response containing a list of message batches.
@freezed
abstract class ListMessageBatchesResponse with _$ListMessageBatchesResponse {
  const ListMessageBatchesResponse._();

  /// Factory constructor for ListMessageBatchesResponse
  const factory ListMessageBatchesResponse({
    /// List of MessageBatch objects.
    required List<MessageBatch> data,

    /// Indicates if there are more results in the requested page direction.
    @JsonKey(name: 'has_more') required bool hasMore,

    /// First ID in the `data` list. Can be used as the `before_id` for the previous page.
    @JsonKey(name: 'first_id', includeIfNull: false) String? firstId,

    /// Last ID in the `data` list. Can be used as the `after_id` for the next page.
    @JsonKey(name: 'last_id', includeIfNull: false) String? lastId,
  }) = _ListMessageBatchesResponse;

  /// Object construction from a JSON representation
  factory ListMessageBatchesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMessageBatchesResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'data',
    'has_more',
    'first_id',
    'last_id',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'has_more': hasMore,
      'first_id': firstId,
      'last_id': lastId,
    };
  }
}
