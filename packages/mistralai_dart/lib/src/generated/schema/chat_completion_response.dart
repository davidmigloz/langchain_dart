// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: ChatCompletionResponse
// ==========================================

/// Response class for the chat completion endpoint.
@freezed
class ChatCompletionResponse with _$ChatCompletionResponse {
  const ChatCompletionResponse._();

  /// Factory constructor for ChatCompletionResponse
  const factory ChatCompletionResponse({
    /// The unique identifier for this completion.
    required String id,

    /// The object type, which is always `chat.completion`.
    required String object,

    /// The timestamp of when this completion was created.
    required int created,

    /// The model used for this completion.
    required String model,

    /// The list of choices for this completion.
    required List<ChatCompletionResponseChoicesInner> choices,

    /// The usage statistics for this completion.
    required ChatCompletionUsage usage,
  }) = _ChatCompletionResponse;

  /// Object construction from a JSON representation
  factory ChatCompletionResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'created',
    'model',
    'choices',
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
      'object': object,
      'created': created,
      'model': model,
      'choices': choices,
      'usage': usage,
    };
  }
}

// ==========================================
// CLASS: ChatCompletionResponseChoicesInner
// ==========================================

/// A choice in a chat completion.
@freezed
class ChatCompletionResponseChoicesInner
    with _$ChatCompletionResponseChoicesInner {
  const ChatCompletionResponseChoicesInner._();

  /// Factory constructor for ChatCompletionResponseChoicesInner
  const factory ChatCompletionResponseChoicesInner({
    /// The index of this choice.
    required int index,

    /// A message in a chat conversation.
    @JsonKey(includeIfNull: false) ChatCompletionMessage? message,

    /// The reason the model stopped generating tokens.
    @JsonKey(name: 'finish_reason')
    required ChatCompletionFinishReason finishReason,
  }) = _ChatCompletionResponseChoicesInner;

  /// Object construction from a JSON representation
  factory ChatCompletionResponseChoicesInner.fromJson(
          Map<String, dynamic> json) =>
      _$ChatCompletionResponseChoicesInnerFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'index',
    'message',
    'finish_reason'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'message': message,
      'finish_reason': finishReason,
    };
  }
}
