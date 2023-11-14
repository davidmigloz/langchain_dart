// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ListPaginatedFineTuningJobsResponse
// ==========================================

/// Represents a list of fine-tuning jobs.
@freezed
class ListPaginatedFineTuningJobsResponse
    with _$ListPaginatedFineTuningJobsResponse {
  const ListPaginatedFineTuningJobsResponse._();

  /// Factory constructor for ListPaginatedFineTuningJobsResponse
  const factory ListPaginatedFineTuningJobsResponse({
    /// The list of fine-tuning jobs.
    required List<FineTuningJob> data,

    /// Whether there are more fine-tuning jobs to retrieve.
    @JsonKey(name: 'has_more') required bool hasMore,

    /// The object type, which is always "list".
    required ListPaginatedFineTuningJobsResponseObject object,
  }) = _ListPaginatedFineTuningJobsResponse;

  /// Object construction from a JSON representation
  factory ListPaginatedFineTuningJobsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListPaginatedFineTuningJobsResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['data', 'has_more', 'object'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'has_more': hasMore,
      'object': object,
    };
  }
}

// ==========================================
// ENUM: ListPaginatedFineTuningJobsResponseObject
// ==========================================

/// The object type, which is always "list".
enum ListPaginatedFineTuningJobsResponseObject {
  @JsonValue('list')
  list,
}
