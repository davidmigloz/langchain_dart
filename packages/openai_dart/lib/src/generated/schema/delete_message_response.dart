// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: DeleteMessageResponse
// ==========================================

/// No Description
@freezed
class DeleteMessageResponse with _$DeleteMessageResponse {
  const DeleteMessageResponse._();

  /// Factory constructor for DeleteMessageResponse
  const factory DeleteMessageResponse({
    /// The message identifier.
    required String id,

    /// Whether the message was deleted.
    required bool deleted,

    /// The object type, which is always `thread.message.deleted`.
    required DeleteMessageResponseObject object,
  }) = _DeleteMessageResponse;

  /// Object construction from a JSON representation
  factory DeleteMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMessageResponseFromJson(json);

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
// ENUM: DeleteMessageResponseObject
// ==========================================

/// The object type, which is always `thread.message.deleted`.
enum DeleteMessageResponseObject {
  @JsonValue('thread.message.deleted')
  threadMessageDeleted,
}
