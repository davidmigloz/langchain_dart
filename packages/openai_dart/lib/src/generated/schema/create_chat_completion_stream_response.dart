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
    @JsonKey(includeIfNull: false) String? id,

    /// A list of chat completion choices. Can contain more than one elements if `n` is greater than 1. Can also be empty for the
    /// last chunk if you set `stream_options: {"include_usage": true}`.
    required List<ChatCompletionStreamResponseChoice> choices,

    /// The Unix timestamp (in seconds) of when the chat completion was created. Each chunk has the same timestamp.
    @JsonKey(includeIfNull: false) int? created,

    /// The model to generate the completion.
    @JsonKey(includeIfNull: false) String? model,

    /// The service tier used for processing the request. This field is only included if the `service_tier` parameter
    /// is specified in the request.
    @JsonKey(
      name: 'service_tier',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    ServiceTier? serviceTier,

    /// This fingerprint represents the backend configuration that the model runs with.
    ///
    /// Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact
    @JsonKey(name: 'system_fingerprint', includeIfNull: false)
    String? systemFingerprint,

    /// The object type, which is always `chat.completion.chunk`.
    @JsonKey(includeIfNull: false) String? object,

    /// Usage statistics for the completion request.
    @JsonKey(includeIfNull: false) CompletionUsage? usage,
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
    'service_tier',
    'system_fingerprint',
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
      'service_tier': serviceTier,
      'system_fingerprint': systemFingerprint,
      'object': object,
      'usage': usage,
    };
  }
}
