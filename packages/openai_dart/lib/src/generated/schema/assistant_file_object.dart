// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: AssistantFileObject
// ==========================================

/// A list of [Files](https://platform.openai.com/docs/api-reference/files) attached to an `assistant`.
@freezed
class AssistantFileObject with _$AssistantFileObject {
  const AssistantFileObject._();

  /// Factory constructor for AssistantFileObject
  const factory AssistantFileObject({
    /// The identifier, which can be referenced in API endpoints.
    required String id,

    /// The object type, which is always `assistant.file`.
    required AssistantFileObjectObject object,

    /// The Unix timestamp (in seconds) for when the assistant file was created.
    @JsonKey(name: 'created_at') required int createdAt,

    /// The assistant ID that the file is attached to.
    @JsonKey(name: 'assistant_id') required String assistantId,
  }) = _AssistantFileObject;

  /// Object construction from a JSON representation
  factory AssistantFileObject.fromJson(Map<String, dynamic> json) =>
      _$AssistantFileObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'created_at',
    'assistant_id'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'created_at': createdAt,
      'assistant_id': assistantId,
    };
  }
}

// ==========================================
// ENUM: AssistantFileObjectObject
// ==========================================

/// The object type, which is always `assistant.file`.
enum AssistantFileObjectObject {
  @JsonValue('assistant.file')
  assistantFile,
}
