// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: GenerateChatCompletionResponse
// ==========================================

/// The response class for the chat endpoint.
@freezed
class GenerateChatCompletionResponse with _$GenerateChatCompletionResponse {
  const GenerateChatCompletionResponse._();

  /// Factory constructor for GenerateChatCompletionResponse
  const factory GenerateChatCompletionResponse({
    /// A message in the chat endpoint
    @JsonKey(includeIfNull: false) Message? message,

    /// The model name.
    ///
    /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
    @JsonKey(includeIfNull: false) String? model,

    /// Date on which a model was created.
    @JsonKey(name: 'created_at', includeIfNull: false) String? createdAt,

    /// Whether the response has completed.
    @JsonKey(includeIfNull: false) bool? done,

    /// Time spent generating the response.
    @JsonKey(name: 'total_duration', includeIfNull: false) int? totalDuration,

    /// Time spent in nanoseconds loading the model.
    @JsonKey(name: 'load_duration', includeIfNull: false) int? loadDuration,

    /// Number of tokens in the prompt.
    @JsonKey(name: 'prompt_eval_count', includeIfNull: false)
    int? promptEvalCount,

    /// Time spent in nanoseconds evaluating the prompt.
    @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)
    int? promptEvalDuration,

    /// Number of tokens the response.
    @JsonKey(name: 'eval_count', includeIfNull: false) int? evalCount,

    /// Time in nanoseconds spent generating the response.
    @JsonKey(name: 'eval_duration', includeIfNull: false) int? evalDuration,
  }) = _GenerateChatCompletionResponse;

  /// Object construction from a JSON representation
  factory GenerateChatCompletionResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateChatCompletionResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'message',
    'model',
    'created_at',
    'done',
    'total_duration',
    'load_duration',
    'prompt_eval_count',
    'prompt_eval_duration',
    'eval_count',
    'eval_duration'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'model': model,
      'created_at': createdAt,
      'done': done,
      'total_duration': totalDuration,
      'load_duration': loadDuration,
      'prompt_eval_count': promptEvalCount,
      'prompt_eval_duration': promptEvalDuration,
      'eval_count': evalCount,
      'eval_duration': evalDuration,
    };
  }
}
