// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: ChatCompletionStreamResponse
// ==========================================

/// Represents a streamed chunk of a chat completion response returned by model, based on the provided input.
@freezed
class ChatCompletionStreamResponse with _$ChatCompletionStreamResponse {
  const ChatCompletionStreamResponse._();

  /// Factory constructor for ChatCompletionStreamResponse
  const factory ChatCompletionStreamResponse({
    /// The unique identifier for this completion.
    required String id,

    /// The object type, which is always `chat.completion.chunk`.
    @JsonKey(includeIfNull: false) String? object,

    /// The timestamp of when this completion was created.
    @JsonKey(includeIfNull: false) int? created,

    /// The model used for this completion.
    required String model,

    /// The list of choices for this completion.
    required List<ChatCompletionStreamResponseChoicesInner> choices,
  }) = _ChatCompletionStreamResponse;

  /// Object construction from a JSON representation
  factory ChatCompletionStreamResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionStreamResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'created',
    'model',
    'choices'
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
    };
  }
}

// ==========================================
// CLASS: ChatCompletionStreamResponseChoicesInner
// ==========================================

/// A choice in a chat completion stream.
@freezed
class ChatCompletionStreamResponseChoicesInner
    with _$ChatCompletionStreamResponseChoicesInner {
  const ChatCompletionStreamResponseChoicesInner._();

  /// Factory constructor for ChatCompletionStreamResponseChoicesInner
  const factory ChatCompletionStreamResponseChoicesInner({
    /// The index of this choice.
    required int index,

    /// A chat completion delta generated by streamed model responses.
    required ChatCompletionStreamDelta delta,

    /// The reason the model stopped generating tokens.
    @JsonKey(
      name: 'finish_reason',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    ChatCompletionFinishReason? finishReason,
  }) = _ChatCompletionStreamResponseChoicesInner;

  /// Object construction from a JSON representation
  factory ChatCompletionStreamResponseChoicesInner.fromJson(
          Map<String, dynamic> json) =>
      _$ChatCompletionStreamResponseChoicesInnerFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['index', 'delta', 'finish_reason'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'delta': delta,
      'finish_reason': finishReason,
    };
  }
}
