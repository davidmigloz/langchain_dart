// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ListFineTuningJobCheckpointsResponse
// ==========================================

/// Represents a list of fine-tuning job checkpoints.
@freezed
abstract class ListFineTuningJobCheckpointsResponse
    with _$ListFineTuningJobCheckpointsResponse {
  const ListFineTuningJobCheckpointsResponse._();

  /// Factory constructor for ListFineTuningJobCheckpointsResponse
  const factory ListFineTuningJobCheckpointsResponse({
    /// The list of fine-tuning job checkpoints.
    required List<FineTuningJobCheckpoint> data,

    /// The object type, which is always "list".
    required ListFineTuningJobCheckpointsResponseObject object,

    /// The ID of the first checkpoint in the list.
    @JsonKey(name: 'first_id', includeIfNull: false) String? firstId,

    /// The ID of the last checkpoint in the list.
    @JsonKey(name: 'last_id', includeIfNull: false) String? lastId,

    /// Whether there are more checkpoints to retrieve.
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _ListFineTuningJobCheckpointsResponse;

  /// Object construction from a JSON representation
  factory ListFineTuningJobCheckpointsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListFineTuningJobCheckpointsResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'data',
    'object',
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
      'data': data,
      'object': object,
      'first_id': firstId,
      'last_id': lastId,
      'has_more': hasMore,
    };
  }
}

// ==========================================
// ENUM: ListFineTuningJobCheckpointsResponseObject
// ==========================================

/// The object type, which is always "list".
enum ListFineTuningJobCheckpointsResponseObject {
  @JsonValue('list')
  list,
}
