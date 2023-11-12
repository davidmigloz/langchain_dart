// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: DeleteAssistantFileResponse
// ==========================================

/// Deletes the association between the assistant and the file, but does not delete the [File](https://platform.openai.com/docs/api-reference/files) object itself.
@freezed
class DeleteAssistantFileResponse with _$DeleteAssistantFileResponse {
  const DeleteAssistantFileResponse._();

  /// Factory constructor for DeleteAssistantFileResponse
  const factory DeleteAssistantFileResponse({
    /// The ID of the assistant file.
    required String id,

    /// Whether the assistant file was deleted.
    required bool deleted,

    /// The object type, which is always `assistant.file.deleted`.
    required DeleteAssistantFileResponseObject object,
  }) = _DeleteAssistantFileResponse;

  /// Object construction from a JSON representation
  factory DeleteAssistantFileResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAssistantFileResponseFromJson(json);

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
// ENUM: DeleteAssistantFileResponseObject
// ==========================================

/// The object type, which is always `assistant.file.deleted`.
enum DeleteAssistantFileResponseObject {
  @JsonValue('assistant.file.deleted')
  assistantFileDeleted,
}
