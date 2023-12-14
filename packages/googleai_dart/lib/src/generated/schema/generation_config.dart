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
class GenerationConfig with _$GenerationConfig {
  const GenerationConfig._();

  /// Factory constructor for GenerationConfig
  const factory GenerationConfig({
    /// Optional. The maximum cumulative probability of tokens to consider when sampling. The model uses combined Top-k and nucleus sampling. Tokens are sorted based on their assigned probabilities so that only the most likely tokens are considered. Top-k sampling directly limits the maximum number of tokens to consider, while Nucleus sampling limits number of tokens based on the cumulative probability. Note: The default value varies by model, see the `Model.top_p` attribute of the `Model` returned the `getModel` function.
    @JsonKey(includeIfNull: false) double? topP,

    /// Optional. The maximum number of tokens to consider when sampling. The model uses combined Top-k and nucleus sampling. Top-k sampling considers the set of `top_k` most probable tokens. Defaults to 40. Note: The default value varies by model, see the `Model.top_k` attribute of the `Model` returned the `getModel` function.
    @JsonKey(includeIfNull: false) int? topK,

    /// Optional. Number of generated responses to return. This value must be between [1, 8], inclusive. If unset, this will default to 1.
    @JsonKey(includeIfNull: false) int? candidateCount,

    /// Optional. The maximum number of tokens to include in a candidate. If unset, this will default to output_token_limit specified in the `Model` specification.
    @JsonKey(includeIfNull: false) int? maxOutputTokens,

    /// Optional. Controls the randomness of the output. Note: The default value varies by model, see the `Model.temperature` attribute of the `Model` returned the `getModel` function. Values can range from [0.0,1.0], inclusive. A value closer to 1.0 will produce responses that are more varied and creative, while a value closer to 0.0 will typically result in more straightforward responses from the model.
    @JsonKey(includeIfNull: false) double? temperature,

    /// Optional. The set of character sequences (up to 5) that will stop output generation. If specified, the API will stop at the first appearance of a stop sequence. The stop sequence will not be included as part of the response.
    @JsonKey(includeIfNull: false) List<String>? stopSequences,
  }) = _GenerationConfig;

  /// Object construction from a JSON representation
  factory GenerationConfig.fromJson(Map<String, dynamic> json) =>
      _$GenerationConfigFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'topP',
    'topK',
    'candidateCount',
    'maxOutputTokens',
    'temperature',
    'stopSequences'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'topP': topP,
      'topK': topK,
      'candidateCount': candidateCount,
      'maxOutputTokens': maxOutputTokens,
      'temperature': temperature,
      'stopSequences': stopSequences,
    };
  }
}
