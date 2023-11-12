// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateMessageRequest
// ==========================================

/// Request object for the Create message endpoint.
@freezed
class CreateMessageRequest with _$CreateMessageRequest {
  const CreateMessageRequest._();

  /// Factory constructor for CreateMessageRequest
  const factory CreateMessageRequest({
    /// The role of the entity that is creating the message. Currently only `user` is supported.
    required CreateMessageRequestRole role,

    /// The content of the message.
    required String content,

    /// A list of [File](https://platform.openai.com/docs/api-reference/files) IDs that the message should use. There can be a maximum of 10 files attached to a message. Useful for tools like `retrieval` and `code_interpreter` that can access and use files.
    @JsonKey(name: 'file_ids') @Default([]) List<String> fileIds,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
  }) = _CreateMessageRequest;

  /// Object construction from a JSON representation
  factory CreateMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateMessageRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'role',
    'content',
    'file_ids',
    'metadata'
  ];

  /// Validation constants
  static const contentMinLengthValue = 1;
  static const contentMaxLengthValue = 32768;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (content.length < contentMinLengthValue) {
      return "The value of 'content' cannot be < $contentMinLengthValue characters";
    }
    if (content.length > contentMaxLengthValue) {
      return "The length of 'content' cannot be > $contentMaxLengthValue characters";
    }
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'content': content,
      'file_ids': fileIds,
      'metadata': metadata,
    };
  }
}

// ==========================================
// ENUM: CreateMessageRequestRole
// ==========================================

/// The role of the entity that is creating the message. Currently only `user` is supported.
enum CreateMessageRequestRole {
  @JsonValue('user')
  user,
}
