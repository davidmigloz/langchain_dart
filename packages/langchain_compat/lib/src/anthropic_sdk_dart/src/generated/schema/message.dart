// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: Message
// ==========================================

/// A message in a chat conversation.
@freezed
class Message with _$Message {
  const Message._();

  /// Factory constructor for Message
  const factory Message({
    /// Unique object identifier.
    ///
    /// The format and length of IDs may change over time.
    @JsonKey(includeIfNull: false) String? id,

    /// The content of the message.
    @_MessageContentConverter() required MessageContent content,

    /// The role of the messages author.
    required MessageRole role,

    /// The model that handled the request.
    @JsonKey(includeIfNull: false) String? model,

    /// The reason that we stopped.
    ///
    /// This may be one the following values:
    ///
    /// - `"end_turn"`: the model reached a natural stopping point
    /// - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
    /// - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
    /// - `"tool_use"`: the model invoked one or more tools
    ///
    /// In non-streaming mode this value is always non-null. In streaming mode, it is
    /// null in the `message_start` event and non-null otherwise.
    @JsonKey(
      name: 'stop_reason',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    StopReason? stopReason,

    /// Which custom stop sequence was generated, if any.
    ///
    /// This value will be a non-null string if one of your custom stop sequences was
    /// generated.
    @JsonKey(name: 'stop_sequence', includeIfNull: false) String? stopSequence,

    /// Object type.
    ///
    /// For Messages, this is always `"message"`.
    @JsonKey(includeIfNull: false) String? type,

    /// Billing and rate-limit usage.
    ///
    /// Anthropic's API bills and rate-limits by token counts, as tokens represent the
    /// underlying cost to our systems.
    ///
    /// Under the hood, the API transforms requests into a format suitable for the
    /// model. The model's output then goes through a parsing stage before becoming an
    /// API response. As a result, the token counts in `usage` will not match one-to-one
    /// with the exact visible content of an API request or response.
    ///
    /// For example, `output_tokens` will be non-zero, even for an empty string response
    /// from Claude.
    @JsonKey(includeIfNull: false) Usage? usage,
  }) = _Message;

  /// Object construction from a JSON representation
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'content',
    'role',
    'model',
    'stop_reason',
    'stop_sequence',
    'type',
    'usage'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'role': role,
      'model': model,
      'stop_reason': stopReason,
      'stop_sequence': stopSequence,
      'type': type,
      'usage': usage,
    };
  }
}

// ==========================================
// CLASS: MessageContent
// ==========================================

/// The content of the message.
@freezed
sealed class MessageContent with _$MessageContent {
  const MessageContent._();

  /// An array of content blocks.
  const factory MessageContent.blocks(
    List<Block> value,
  ) = MessageContentBlocks;

  /// A single text block.
  const factory MessageContent.text(
    String value,
  ) = MessageContentText;

  /// Object construction from a JSON representation
  factory MessageContent.fromJson(Map<String, dynamic> json) =>
      _$MessageContentFromJson(json);
}

/// Custom JSON converter for [MessageContent]
class _MessageContentConverter
    implements JsonConverter<MessageContent, Object?> {
  const _MessageContentConverter();

  @override
  MessageContent fromJson(Object? data) {
    if (data is List && data.every((item) => item is Map)) {
      return MessageContentBlocks(data
          .map((i) => Block.fromJson(i as Map<String, dynamic>))
          .toList(growable: false));
    }
    if (data is String) {
      return MessageContentText(data);
    }
    throw Exception(
      'Unexpected value for MessageContent: $data',
    );
  }

  @override
  Object? toJson(MessageContent data) {
    return switch (data) {
      MessageContentBlocks(value: final v) => v,
      MessageContentText(value: final v) => v,
    };
  }
}
