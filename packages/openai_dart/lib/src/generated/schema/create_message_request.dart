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
    /// The entity that produced the message. One of `user` or `assistant`.
    required MessageRole role,

    /// The content of the message.
    required String content,

    /// A list of files attached to the message, and the tools they were added to.
    @JsonKey(includeIfNull: false) List<MessageAttachment>? attachments,

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
    'attachments',
    'metadata'
  ];

  /// Validation constants
  static const contentMinLengthValue = 1;
  static const contentMaxLengthValue = 256000;

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
      'attachments': attachments,
      'metadata': metadata,
    };
  }
}
