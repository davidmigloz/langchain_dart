// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: DeleteAssistantResponse
// ==========================================

/// Represents a deleted response returned by the Delete assistant endpoint.
@freezed
class DeleteAssistantResponse with _$DeleteAssistantResponse {
  const DeleteAssistantResponse._();

  /// Factory constructor for DeleteAssistantResponse
  const factory DeleteAssistantResponse({
    /// The assistant identifier.
    required String id,

    /// Whether the assistant was deleted.
    required bool deleted,

    /// The object type, which is always `assistant.deleted`.
    required DeleteAssistantResponseObject object,
  }) = _DeleteAssistantResponse;

  /// Object construction from a JSON representation
  factory DeleteAssistantResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAssistantResponseFromJson(json);

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
// ENUM: DeleteAssistantResponseObject
// ==========================================

/// The object type, which is always `assistant.deleted`.
enum DeleteAssistantResponseObject {
  @JsonValue('assistant.deleted')
  assistantDeleted,
}
