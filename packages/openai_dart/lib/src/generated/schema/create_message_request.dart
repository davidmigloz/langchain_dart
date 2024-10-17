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
    @_CreateMessageRequestContentConverter()
    required CreateMessageRequestContent content,

    /// A list of files attached to the message, and the tools they were added to.
    @JsonKey(includeIfNull: false) List<MessageAttachment>? attachments,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional
    /// information about the object in a structured format. Keys can be a maximum of 64 characters long and values
    /// can be a maximum of 512 characters long.
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

  /// Perform validations on the schema property values
  String? validateSchema() {
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

// ==========================================
// CLASS: CreateMessageRequestContent
// ==========================================

/// The content of the message.
@freezed
sealed class CreateMessageRequestContent with _$CreateMessageRequestContent {
  const CreateMessageRequestContent._();

  /// An array of content parts with a defined type, each can be of type `text` or images can be passed with `image_url` or `image_file`. Image types are only supported on [Vision-compatible models](https://platform.openai.com/docs/models/overview).
  const factory CreateMessageRequestContent.parts(
    List<MessageContent> value,
  ) = CreateMessageRequestContentListMessageContent;

  /// The text contents of the message.
  const factory CreateMessageRequestContent.text(
    String value,
  ) = CreateMessageRequestContentString;

  /// Object construction from a JSON representation
  factory CreateMessageRequestContent.fromJson(Map<String, dynamic> json) =>
      _$CreateMessageRequestContentFromJson(json);
}

/// Custom JSON converter for [CreateMessageRequestContent]
class _CreateMessageRequestContentConverter
    implements JsonConverter<CreateMessageRequestContent, Object?> {
  const _CreateMessageRequestContentConverter();

  @override
  CreateMessageRequestContent fromJson(Object? data) {
    if (data is List && data.every((item) => item is Map)) {
      return CreateMessageRequestContentListMessageContent(data
          .map((i) => MessageContent.fromJson(i as Map<String, dynamic>))
          .toList(growable: false));
    }
    if (data is String) {
      return CreateMessageRequestContentString(data);
    }
    throw Exception(
      'Unexpected value for CreateMessageRequestContent: $data',
    );
  }

  @override
  Object? toJson(CreateMessageRequestContent data) {
    return switch (data) {
      CreateMessageRequestContentListMessageContent(value: final v) => v,
      CreateMessageRequestContentString(value: final v) => v,
    };
  }
}
