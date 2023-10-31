// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateChatCompletionResponse
// ==========================================

/// Represents a chat completion response returned by model, based on the provided input.
@freezed
class CreateChatCompletionResponse with _$CreateChatCompletionResponse {
  const CreateChatCompletionResponse._();

  /// Factory constructor for CreateChatCompletionResponse
  const factory CreateChatCompletionResponse({
    /// A unique identifier for the chat completion.
    required String id,

    /// A list of chat completion choices. Can be more than one if `n` is greater than 1.
    required List<ChatCompletionResponseChoice> choices,

    /// The Unix timestamp (in seconds) of when the chat completion was created.
    required int created,

    /// The model used for the chat completion.
    required String model,

    /// The object type, which is always `chat.completion`.
    required String object,

    /// Usage statistics for the completion request.
    @JsonKey(includeIfNull: false) CompletionUsage? usage,
  }) = _CreateChatCompletionResponse;

  /// Object construction from a JSON representation
  factory CreateChatCompletionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateChatCompletionResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'choices',
    'created',
    'model',
    'object',
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
      'choices': choices,
      'created': created,
      'model': model,
      'object': object,
      'usage': usage,
    };
  }
}
