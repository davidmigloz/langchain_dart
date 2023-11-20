// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: GenerateResponse
// ==========================================

/// No Description
@freezed
class GenerateResponse with _$GenerateResponse {
  const GenerateResponse._();

  /// Factory constructor for GenerateResponse
  const factory GenerateResponse({
    /// Model names follow a model:tag format. Some examples are orca-mini:3b-q4_1 and llama2:70b. The tag is optional and, if not provided, will default to latest. The tag is used to identify a specific version.
    @JsonKey(includeIfNull: false) String? model,

    /// Date on which a model was created
    @JsonKey(name: 'created_at', includeIfNull: false) String? createdAt,

    /// a response for a given prompt with a provided model. when finished, empty if the response was streamed, if not streamed, this will contain the full response.
    @JsonKey(includeIfNull: false) String? response,

    /// whether the response has completed.
    @JsonKey(includeIfNull: false) bool? done,

    /// the context parameter returned from a previous request to /generate, this can be used to keep a short conversational memory
    @JsonKey(includeIfNull: false) List<int>? context,

    /// number of samples generated
    @JsonKey(name: 'sample_count', includeIfNull: false) int? sampleCount,

    /// time spent generating samples
    @JsonKey(name: 'sample_duration', includeIfNull: false) int? sampleDuration,

    /// time spent generating the response
    @JsonKey(name: 'total_duration', includeIfNull: false) int? totalDuration,

    /// time spent in nanoseconds loading the model
    @JsonKey(name: 'load_duration', includeIfNull: false) int? loadDuration,

    /// number of tokens in the prompt
    @JsonKey(name: 'prompt_eval_count', includeIfNull: false)
    int? promptEvalCount,

    /// time spent in nanoseconds evaluating the prompt
    @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)
    int? promptEvalDuration,

    /// number of tokens the response
    @JsonKey(name: 'eval_count', includeIfNull: false) int? evalCount,

    /// time in nanoseconds spent generating the response
    @JsonKey(name: 'eval_duration', includeIfNull: false) int? evalDuration,
  }) = _GenerateResponse;

  /// Object construction from a JSON representation
  factory GenerateResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'created_at',
    'response',
    'done',
    'context',
    'sample_count',
    'sample_duration',
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
      'done': done,
      'context': context,
      'sample_count': sampleCount,
      'sample_duration': sampleDuration,
      'total_duration': totalDuration,
      'load_duration': loadDuration,
      'prompt_eval_count': promptEvalCount,
      'prompt_eval_duration': promptEvalDuration,
      'eval_count': evalCount,
      'eval_duration': evalDuration,
    };
  }
}
