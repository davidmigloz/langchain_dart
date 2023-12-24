// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ListRunStepsResponse
// ==========================================

/// Represents a list of run steps returned by the List run steps endpoint.
@freezed
class ListRunStepsResponse with _$ListRunStepsResponse {
  const ListRunStepsResponse._();

  /// Factory constructor for ListRunStepsResponse
  const factory ListRunStepsResponse({
    /// The object type, which is always `list`.
    required String object,

    /// The list of run steps.
    required List<RunStepObject> data,

    /// The ID of the first run step in the list.
    @JsonKey(name: 'first_id') required String firstId,

    /// The ID of the last run step in the list.
    @JsonKey(name: 'last_id') required String lastId,

    /// Whether there are more run steps to retrieve.
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _ListRunStepsResponse;

  /// Object construction from a JSON representation
  factory ListRunStepsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRunStepsResponseFromJson(json);

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
