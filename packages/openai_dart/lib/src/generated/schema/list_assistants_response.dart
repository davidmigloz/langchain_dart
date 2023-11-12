// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ListAssistantsResponse
// ==========================================

/// Represents a list of assistants returned by the List assistants endpoint.
@freezed
class ListAssistantsResponse with _$ListAssistantsResponse {
  const ListAssistantsResponse._();

  /// Factory constructor for ListAssistantsResponse
  const factory ListAssistantsResponse({
    /// The object type, which is always `list`.
    required String object,

    /// The list of assistants.
    required List<AssistantObject> data,

    /// The ID of the first assistant in the list.
    @JsonKey(name: 'first_id') required String firstId,

    /// The ID of the last assistant in the list.
    @JsonKey(name: 'last_id') required String lastId,

    /// Whether there are more assistants to retrieve.
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _ListAssistantsResponse;

  /// Object construction from a JSON representation
  factory ListAssistantsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAssistantsResponseFromJson(json);

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
