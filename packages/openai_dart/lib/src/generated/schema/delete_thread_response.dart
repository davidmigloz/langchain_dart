// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: DeleteThreadResponse
// ==========================================

/// No Description
@freezed
class DeleteThreadResponse with _$DeleteThreadResponse {
  const DeleteThreadResponse._();

  /// Factory constructor for DeleteThreadResponse
  const factory DeleteThreadResponse({
    /// The thread identifier.
    required String id,

    /// Whether the thread was deleted.
    required bool deleted,

    /// The object type, which is always `thread.deleted`.
    required DeleteThreadResponseObject object,
  }) = _DeleteThreadResponse;

  /// Object construction from a JSON representation
  factory DeleteThreadResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteThreadResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'deleted', 'object'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'deleted': deleted,
      'object': object,
    };
  }
}

// ==========================================
// ENUM: DeleteThreadResponseObject
// ==========================================

/// The object type, which is always `thread.deleted`.
enum DeleteThreadResponseObject {
  @JsonValue('thread.deleted')
  threadDeleted,
}
