// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ListFineTuningJobEventsResponse
// ==========================================

/// Represents a list of fine-tuning job events.
@freezed
class ListFineTuningJobEventsResponse with _$ListFineTuningJobEventsResponse {
  const ListFineTuningJobEventsResponse._();

  /// Factory constructor for ListFineTuningJobEventsResponse
  const factory ListFineTuningJobEventsResponse({
    /// The list of fine-tuning job events.
    required List<FineTuningJobEvent> data,

    /// The object type, which is always "list".
    required ListFineTuningJobEventsResponseObject object,
  }) = _ListFineTuningJobEventsResponse;

  /// Object construction from a JSON representation
  factory ListFineTuningJobEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFineTuningJobEventsResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['data', 'object'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'object': object,
    };
  }
}

// ==========================================
// ENUM: ListFineTuningJobEventsResponseObject
// ==========================================

/// The object type, which is always "list".
enum ListFineTuningJobEventsResponseObject {
  @JsonValue('list')
  list,
}
