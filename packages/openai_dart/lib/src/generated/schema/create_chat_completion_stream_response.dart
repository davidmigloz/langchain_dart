// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateChatCompletionStreamResponse
// ==========================================

/// Represents a streamed chunk of a chat completion response returned by model, based on the provided input.
@freezed
class CreateChatCompletionStreamResponse
    with _$CreateChatCompletionStreamResponse {
  const CreateChatCompletionStreamResponse._();

  /// Factory constructor for CreateChatCompletionStreamResponse
  const factory CreateChatCompletionStreamResponse({
    /// A unique identifier for the chat completion. Each chunk has the same ID.
    required String id,

    /// A list of chat completion choices. Can be more than one if `n` is greater than 1.
    required List<ChatCompletionStreamResponseChoice> choices,

    /// The Unix timestamp (in seconds) of when the chat completion was created. Each chunk has the same timestamp.
    required int created,

    /// The model to generate the completion.
    required String model,

    /// The object type, which is always `chat.completion.chunk`.
    required String object,
  }) = _CreateChatCompletionStreamResponse;

  /// Object construction from a JSON representation
  factory CreateChatCompletionStreamResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateChatCompletionStreamResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'choices',
    'created',
    'model',
    'object'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'choices': choices,
      'created': created,
      'model': model,
      'object': object,
    };
  }
}
