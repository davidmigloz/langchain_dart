// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: GenerationConfig
// ==========================================

/// Configuration options for model generation and outputs. Not all parameters may be configurable for every model.
@freezed
abstract class GenerationConfig with _$GenerationConfig {
  const GenerationConfig._();

  /// Factory constructor for GenerationConfig
  const factory GenerationConfig({
    /// Optional. Controls the randomness of the output. Note: The default value varies by model, see the `Model.temperature` attribute of the `Model` returned from the `getModel` function. Values can range from [0.0, infinity).
    @JsonKey(includeIfNull: false) double? temperature,

    /// Optional. The set of character sequences (up to 5) that will stop output generation. If specified, the API will stop at the first appearance of a stop sequence. The stop sequence will not be included as part of the response.
    @JsonKey(includeIfNull: false) List<String>? stopSequences,

    /// Optional. The maximum number of tokens to consider when sampling. The model uses combined Top-k and nucleus sampling. Top-k sampling considers the set of `top_k` most probable tokens. Note: The default value varies by model, see the `Model.top_k` attribute of the `Model` returned from the `getModel` function.
    @JsonKey(includeIfNull: false) int? topK,

    /// Optional. The maximum cumulative probability of tokens to consider when sampling. The model uses combined Top-k and nucleus sampling. Tokens are sorted based on their assigned probabilities so that only the most likely tokens are considered. Top-k sampling directly limits the maximum number of tokens to consider, while Nucleus sampling limits number of tokens based on the cumulative probability. Note: The default value varies by model, see the `Model.top_p` attribute of the `Model` returned from the `getModel` function.
    @JsonKey(includeIfNull: false) double? topP,

    /// Optional. Number of generated responses to return. Currently, this value can only be set to 1. If unset, this will default to 1.
    @JsonKey(includeIfNull: false) int? candidateCount,

    /// Optional. The maximum number of tokens to include in a candidate. Note: The default value varies by model, see the `Model.output_token_limit` attribute of the `Model` returned from the `getModel` function.
    @JsonKey(includeIfNull: false) int? maxOutputTokens,
  }) = _GenerationConfig;

  /// Object construction from a JSON representation
  factory GenerationConfig.fromJson(Map<String, dynamic> json) =>
      _$GenerationConfigFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'temperature',
    'stopSequences',
    'topK',
    'topP',
    'candidateCount',
    'maxOutputTokens'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'temperature': temperature,
      'stopSequences': stopSequences,
      'topK': topK,
      'topP': topP,
      'candidateCount': candidateCount,
      'maxOutputTokens': maxOutputTokens,
    };
  }
}
