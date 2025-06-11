// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: GenerateCompletionResponse
// ==========================================

/// The response class for the generate endpoint.
@freezed
class GenerateCompletionResponse with _$GenerateCompletionResponse {
  const GenerateCompletionResponse._();

  /// Factory constructor for GenerateCompletionResponse
  const factory GenerateCompletionResponse({
    /// The model name.
    ///
    /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
    @JsonKey(includeIfNull: false) String? model,

    /// Date on which a model was created.
    @JsonKey(name: 'created_at', includeIfNull: false) String? createdAt,

    /// The response for a given prompt with a provided model.
    @JsonKey(includeIfNull: false) String? response,

    /// Contains the text that was inside thinking tags in the original model output when `think` is enabled.
    @JsonKey(includeIfNull: false) String? thinking,

    /// Whether the response has completed.
    @JsonKey(includeIfNull: false) bool? done,

    /// An encoding of the conversation used in this response, this can be sent in the next request to keep a conversational memory.
    @JsonKey(includeIfNull: false) List<int>? context,

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
  }) = _GenerateCompletionResponse;

  /// Object construction from a JSON representation
  factory GenerateCompletionResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateCompletionResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'created_at',
    'response',
    'thinking',
    'done',
    'context',
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
      'model': model,
      'created_at': createdAt,
      'response': response,
      'thinking': thinking,
      'done': done,
      'context': context,
      'total_duration': totalDuration,
      'load_duration': loadDuration,
      'prompt_eval_count': promptEvalCount,
      'prompt_eval_duration': promptEvalDuration,
      'eval_count': evalCount,
      'eval_duration': evalDuration,
    };
  }
}
