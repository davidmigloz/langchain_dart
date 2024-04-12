// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateCompletionRequest
// ==========================================

/// Request object for the Create completion endpoint.
@freezed
class CreateCompletionRequest with _$CreateCompletionRequest {
  const CreateCompletionRequest._();

  /// Factory constructor for CreateCompletionRequest
  const factory CreateCompletionRequest({
    /// ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models/overview) for descriptions of them.
    @_CompletionModelConverter() required CompletionModel model,

    /// The prompt(s) to generate completions for, encoded as a string, array of strings, array of tokens, or array of token arrays.
    ///
    /// Note that <|endoftext|> is the document separator that the model sees during training, so if a prompt is not specified the model will generate as if from the beginning of a new document.
    @_CompletionPromptConverter() required CompletionPrompt? prompt,

    /// Generates `best_of` completions server-side and returns the "best" (the one with the highest log probability per token). Results cannot be streamed.
    ///
    /// When used with `n`, `best_of` controls the number of candidate completions and `n` specifies how many to return – `best_of` must be greater than `n`.
    ///
    /// **Note:** Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for `max_tokens` and `stop`.
    @JsonKey(name: 'best_of', includeIfNull: false) int? bestOf,

    /// Echo back the prompt in addition to the completion
    @JsonKey(includeIfNull: false) @Default(false) bool? echo,

    /// Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
    ///
    /// [See more information about frequency and presence penalties.](https://platform.openai.com/docs/guides/text-generation/parameter-details)
    @JsonKey(name: 'frequency_penalty', includeIfNull: false)
    @Default(0.0)
    double? frequencyPenalty,

    /// Modify the likelihood of specified tokens appearing in the completion.
    ///
    /// Accepts a JSON object that maps tokens (specified by their token ID in the GPT tokenizer) to an associated bias value from -100 to 100. You can use this [tokenizer tool](https://platform.openai.com/tokenizer?view=bpe) to convert text to token IDs. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
    ///
    /// As an example, you can pass `{"50256": -100}` to prevent the <|endoftext|> token from being generated.
    @JsonKey(name: 'logit_bias', includeIfNull: false)
    Map<String, int>? logitBias,

    /// Include the log probabilities on the `logprobs` most likely output tokens, as well the chosen tokens. For example, if `logprobs` is 5, the API will return a list of the 5 most likely tokens. The API will always return the `logprob` of the sampled token, so there may be up to `logprobs+1` elements in the response.
    ///
    /// The maximum value for `logprobs` is 5.
    @JsonKey(includeIfNull: false) int? logprobs,

    /// The maximum number of [tokens](https://platform.openai.com/tokenizer) that can be generated in the completion.
    ///
    /// The token count of your prompt plus `max_tokens` cannot exceed the model's context length. [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken) for counting tokens.
    @JsonKey(name: 'max_tokens', includeIfNull: false)
    @Default(16)
    int? maxTokens,

    /// How many completions to generate for each prompt.
    ///
    /// **Note:** Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for `max_tokens` and `stop`.
    @JsonKey(includeIfNull: false) @Default(1) int? n,

    /// Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
    ///
    /// [See more information about frequency and presence penalties.](https://platform.openai.com/docs/guides/text-generation/parameter-details)
    @JsonKey(name: 'presence_penalty', includeIfNull: false)
    @Default(0.0)
    double? presencePenalty,

    /// If specified, our system will make a best effort to sample deterministically, such that repeated requests with the same `seed` and parameters should return the same result.
    ///
    /// Determinism is not guaranteed, and you should refer to the `system_fingerprint` response parameter to monitor changes in the backend.
    @JsonKey(includeIfNull: false) int? seed,

    /// Up to 4 sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence.
    @_CompletionStopConverter()
    @JsonKey(includeIfNull: false)
    CompletionStop? stop,

    /// Whether to stream back partial progress. If set, tokens will be sent as data-only [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format) as they become available, with the stream terminated by a `data: [DONE]` message. [Example Python code](https://cookbook.openai.com/examples/how_to_stream_completions).
    @JsonKey(includeIfNull: false) @Default(false) bool? stream,

    /// The suffix that comes after a completion of inserted text.
    ///
    /// This parameter is only supported for `gpt-3.5-turbo-instruct`.
    @JsonKey(includeIfNull: false) String? suffix,

    /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    ///
    /// We generally recommend altering this or `top_p` but not both.
    @JsonKey(includeIfNull: false) @Default(1.0) double? temperature,

    /// An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    ///
    /// We generally recommend altering this or `temperature` but not both.
    @JsonKey(name: 'top_p', includeIfNull: false) @Default(1.0) double? topP,

    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids).
    @JsonKey(includeIfNull: false) String? user,
  }) = _CreateCompletionRequest;

  /// Object construction from a JSON representation
  factory CreateCompletionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCompletionRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'prompt',
    'best_of',
    'echo',
    'frequency_penalty',
    'logit_bias',
    'logprobs',
    'max_tokens',
    'n',
    'presence_penalty',
    'seed',
    'stop',
    'stream',
    'suffix',
    'temperature',
    'top_p',
    'user'
  ];

  /// Validation constants
  static const bestOfMinValue = 0;
  static const bestOfMaxValue = 20;
  static const frequencyPenaltyDefaultValue = 0.0;
  static const frequencyPenaltyMinValue = -2.0;
  static const frequencyPenaltyMaxValue = 2.0;
  static const logprobsMinValue = 0;
  static const logprobsMaxValue = 5;
  static const maxTokensDefaultValue = 16;
  static const maxTokensMinValue = 0;
  static const nDefaultValue = 1;
  static const nMinValue = 1;
  static const nMaxValue = 128;
  static const presencePenaltyDefaultValue = 0.0;
  static const presencePenaltyMinValue = -2.0;
  static const presencePenaltyMaxValue = 2.0;
  static const temperatureDefaultValue = 1.0;
  static const temperatureMinValue = 0.0;
  static const temperatureMaxValue = 2.0;
  static const topPDefaultValue = 1.0;
  static const topPMinValue = 0.0;
  static const topPMaxValue = 1.0;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (bestOf != null && bestOf! < bestOfMinValue) {
      return "The value of 'bestOf' cannot be < $bestOfMinValue";
    }
    if (bestOf != null && bestOf! > bestOfMaxValue) {
      return "The value of 'bestOf' cannot be > $bestOfMaxValue";
    }
    if (frequencyPenalty != null &&
        frequencyPenalty! < frequencyPenaltyMinValue) {
      return "The value of 'frequencyPenalty' cannot be < $frequencyPenaltyMinValue";
    }
    if (frequencyPenalty != null &&
        frequencyPenalty! > frequencyPenaltyMaxValue) {
      return "The value of 'frequencyPenalty' cannot be > $frequencyPenaltyMaxValue";
    }
    if (logprobs != null && logprobs! < logprobsMinValue) {
      return "The value of 'logprobs' cannot be < $logprobsMinValue";
    }
    if (logprobs != null && logprobs! > logprobsMaxValue) {
      return "The value of 'logprobs' cannot be > $logprobsMaxValue";
    }
    if (maxTokens != null && maxTokens! < maxTokensMinValue) {
      return "The value of 'maxTokens' cannot be < $maxTokensMinValue";
    }
    if (n != null && n! < nMinValue) {
      return "The value of 'n' cannot be < $nMinValue";
    }
    if (n != null && n! > nMaxValue) {
      return "The value of 'n' cannot be > $nMaxValue";
    }
    if (presencePenalty != null && presencePenalty! < presencePenaltyMinValue) {
      return "The value of 'presencePenalty' cannot be < $presencePenaltyMinValue";
    }
    if (presencePenalty != null && presencePenalty! > presencePenaltyMaxValue) {
      return "The value of 'presencePenalty' cannot be > $presencePenaltyMaxValue";
    }
    if (temperature != null && temperature! < temperatureMinValue) {
      return "The value of 'temperature' cannot be < $temperatureMinValue";
    }
    if (temperature != null && temperature! > temperatureMaxValue) {
      return "The value of 'temperature' cannot be > $temperatureMaxValue";
    }
    if (topP != null && topP! < topPMinValue) {
      return "The value of 'topP' cannot be < $topPMinValue";
    }
    if (topP != null && topP! > topPMaxValue) {
      return "The value of 'topP' cannot be > $topPMaxValue";
    }
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'prompt': prompt,
      'best_of': bestOf,
      'echo': echo,
      'frequency_penalty': frequencyPenalty,
      'logit_bias': logitBias,
      'logprobs': logprobs,
      'max_tokens': maxTokens,
      'n': n,
      'presence_penalty': presencePenalty,
      'seed': seed,
      'stop': stop,
      'stream': stream,
      'suffix': suffix,
      'temperature': temperature,
      'top_p': topP,
      'user': user,
    };
  }
}

// ==========================================
// ENUM: CompletionModels
// ==========================================

/// Available completion models. Mind that the list may not be exhaustive nor up-to-date.
enum CompletionModels {
  @JsonValue('gpt-3.5-turbo-instruct')
  gpt35TurboInstruct,
  @JsonValue('davinci-002')
  davinci002,
  @JsonValue('babbage-002')
  babbage002,
}

// ==========================================
// CLASS: CompletionModel
// ==========================================

/// ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models/overview) for descriptions of them.
@freezed
sealed class CompletionModel with _$CompletionModel {
  const CompletionModel._();

  /// Available completion models. Mind that the list may not be exhaustive nor up-to-date.
  const factory CompletionModel.model(
    CompletionModels value,
  ) = CompletionModelEnumeration;

  /// The ID of the model to use for this request.
  const factory CompletionModel.modelId(
    String value,
  ) = CompletionModelString;

  /// Object construction from a JSON representation
  factory CompletionModel.fromJson(Map<String, dynamic> json) =>
      _$CompletionModelFromJson(json);
}

/// Custom JSON converter for [CompletionModel]
class _CompletionModelConverter
    implements JsonConverter<CompletionModel, Object?> {
  const _CompletionModelConverter();

  @override
  CompletionModel fromJson(Object? data) {
    if (data is String && _$CompletionModelsEnumMap.values.contains(data)) {
      return CompletionModelEnumeration(
        _$CompletionModelsEnumMap.keys.elementAt(
          _$CompletionModelsEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is String) {
      return CompletionModelString(data);
    }
    throw Exception(
      'Unexpected value for CompletionModel: $data',
    );
  }

  @override
  Object? toJson(CompletionModel data) {
    return switch (data) {
      CompletionModelEnumeration(value: final v) =>
        _$CompletionModelsEnumMap[v]!,
      CompletionModelString(value: final v) => v,
    };
  }
}

// ==========================================
// CLASS: CompletionPrompt
// ==========================================

/// The prompt(s) to generate completions for, encoded as a string, array of strings, array of tokens, or array of token arrays.
///
/// Note that <|endoftext|> is the document separator that the model sees during training, so if a prompt is not specified the model will generate as if from the beginning of a new document.
@freezed
sealed class CompletionPrompt with _$CompletionPrompt {
  const CompletionPrompt._();

  /// A list of tokenized prompts.
  const factory CompletionPrompt.listTokens(
    List<List<int>> value,
  ) = CompletionPromptListListInt;

  /// A tokenized prompt.
  const factory CompletionPrompt.tokens(
    List<int> value,
  ) = CompletionPromptListInt;

  /// A list of string prompts.
  const factory CompletionPrompt.listString(
    List<String> value,
  ) = CompletionPromptListString;

  /// A string prompt.
  const factory CompletionPrompt.string(
    String value,
  ) = CompletionPromptString;

  /// Object construction from a JSON representation
  factory CompletionPrompt.fromJson(Map<String, dynamic> json) =>
      _$CompletionPromptFromJson(json);
}

/// Custom JSON converter for [CompletionPrompt]
class _CompletionPromptConverter
    implements JsonConverter<CompletionPrompt, Object?> {
  const _CompletionPromptConverter();

  @override
  CompletionPrompt fromJson(Object? data) {
    if (data is List && data.every((item) => item is List<int>)) {
      return CompletionPromptListListInt(data.cast());
    }
    if (data is List && data.every((item) => item is int)) {
      return CompletionPromptListInt(data.cast());
    }
    if (data is List && data.every((item) => item is String)) {
      return CompletionPromptListString(data.cast());
    }
    if (data is String) {
      return CompletionPromptString(data);
    }
    return CompletionPromptString('<|endoftext|>');
  }

  @override
  Object? toJson(CompletionPrompt data) {
    return switch (data) {
      CompletionPromptListListInt(value: final v) => v,
      CompletionPromptListInt(value: final v) => v,
      CompletionPromptListString(value: final v) => v,
      CompletionPromptString(value: final v) => v,
    };
  }
}

// ==========================================
// CLASS: CompletionStop
// ==========================================

/// Up to 4 sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence.
@freezed
sealed class CompletionStop with _$CompletionStop {
  const CompletionStop._();

  /// A list of string stop sequences.
  const factory CompletionStop.listString(
    List<String> value,
  ) = CompletionStopListString;

  /// A string stop sequence.
  const factory CompletionStop.string(
    String? value,
  ) = CompletionStopString;

  /// Object construction from a JSON representation
  factory CompletionStop.fromJson(Map<String, dynamic> json) =>
      _$CompletionStopFromJson(json);
}

/// Custom JSON converter for [CompletionStop]
class _CompletionStopConverter
    implements JsonConverter<CompletionStop?, Object?> {
  const _CompletionStopConverter();

  @override
  CompletionStop? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is List && data.every((item) => item is String)) {
      return CompletionStopListString(data.cast());
    }
    if (data is String) {
      return CompletionStopString(data);
    }
    throw Exception(
      'Unexpected value for CompletionStop: $data',
    );
  }

  @override
  Object? toJson(CompletionStop? data) {
    return switch (data) {
      CompletionStopListString(value: final v) => v,
      CompletionStopString(value: final v) => v,
      null => null,
    };
  }
}
