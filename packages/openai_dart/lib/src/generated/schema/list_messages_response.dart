// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ListMessagesResponse
// ==========================================

/// Represents a list of messages returned by the List messages endpoint.
@freezed
class ListMessagesResponse with _$ListMessagesResponse {
  const ListMessagesResponse._();

  /// Factory constructor for ListMessagesResponse
  const factory ListMessagesResponse({
    /// The object type, which is always `list`.
    required String object,

    /// The list of messages.
    required List<MessageObject> data,

    /// The ID of the first message in the list.
    @JsonKey(name: 'first_id') required String firstId,

    /// The ID of the last message in the list.
    @JsonKey(name: 'last_id') required String lastId,

    /// Whether there are more messages to retrieve.
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _ListMessagesResponse;

  /// Object construction from a JSON representation
  factory ListMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMessagesResponseFromJson(json);

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
