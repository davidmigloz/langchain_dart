// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateCompletionResponse
// ==========================================

/// Represents a completion response from the API. Note: both the streamed and non-streamed response objects share the same shape (unlike the chat endpoint).
@freezed
class CreateCompletionResponse with _$CreateCompletionResponse {
  const CreateCompletionResponse._();

  /// Factory constructor for CreateCompletionResponse
  const factory CreateCompletionResponse({
    /// A unique identifier for the completion.
    required String id,

    /// The list of completion choices the model generated for the input prompt.
    required List<CompletionChoice> choices,

    /// The Unix timestamp (in seconds) of when the completion was created.
    required int created,

    /// The model used for completion.
    required String model,

    /// This fingerprint represents the backend configuration that the model runs with.
    ///
    /// Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
    @JsonKey(name: 'system_fingerprint', includeIfNull: false)
    String? systemFingerprint,

    /// The object type, which is always "text_completion"
    required CreateCompletionResponseObject object,

    /// Usage statistics for the completion request.
    @JsonKey(includeIfNull: false) CompletionUsage? usage,
  }) = _CreateCompletionResponse;

  /// Object construction from a JSON representation
  factory CreateCompletionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCompletionResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'choices',
    'created',
    'model',
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
      'system_fingerprint': systemFingerprint,
      'object': object,
      'usage': usage,
    };
  }
}

// ==========================================
// ENUM: CreateCompletionResponseObject
// ==========================================

/// The object type, which is always "text_completion"
enum CreateCompletionResponseObject {
  @JsonValue('text_completion')
  textCompletion,
}
