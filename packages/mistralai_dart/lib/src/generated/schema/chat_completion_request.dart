// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: ChatCompletionRequest
// ==========================================

/// Request class for the chat completion endpoint.
@freezed
abstract class ChatCompletionRequest with _$ChatCompletionRequest {
  const ChatCompletionRequest._();

  /// Factory constructor for ChatCompletionRequest
  const factory ChatCompletionRequest({
    /// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
    @_ChatCompletionModelConverter() required ChatCompletionModel model,

    /// The prompt(s) to generate completions for, encoded as a list of dict with role and content. The first prompt role should be `user` or `system`.
    required List<ChatCompletionMessage> messages,

    /// What sampling temperature to use, between 0.0 and 1.5. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    ///
    /// We generally recommend altering this or `top_p` but not both.
    @JsonKey(includeIfNull: false) double? temperature,

    /// Nucleus sampling, where the model considers the results of the tokens with `top_p` probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    ///
    /// We generally recommend altering this or `temperature` but not both.
    @JsonKey(name: 'top_p', includeIfNull: false) double? topP,

    /// The maximum number of tokens to generate in the completion.
    ///
    /// The token count of your prompt plus `max_tokens` cannot exceed the model's context length.
    @JsonKey(name: 'max_tokens', includeIfNull: false) int? maxTokens,

    /// Whether to stream back partial progress. If set, tokens will be sent as data-only server-sent events as they become available, with the stream terminated by a data: [DONE] message. Otherwise, the server will hold the request open until the timeout or until completion, with the response containing the full result as JSON.
    @JsonKey(includeIfNull: false) bool? stream,

    /// Stop generation if this token is detected, or if the end of the sequence is detected.
    @_ChatCompletionStopConverter()
    @JsonKey(includeIfNull: false)
    ChatCompletionStop? stop,

    /// The seed to use for random sampling. If set, different calls will generate deterministic results.
    @JsonKey(name: 'random_seed', includeIfNull: false) int? randomSeed,

    /// An object specifying the format that the model must output.
    /// Setting to `{ "type": "json_object" }` enables JSON mode, which guarantees the message
    /// the model generates is valid JSON.
    /// Setting to `{ "type": "json_schema", "json_schema": {...} }` enables Structured Outputs
    /// which guarantees the model will match your supplied JSON schema.
    @JsonKey(name: 'response_format', includeIfNull: false)
    ResponseFormat? responseFormat,

    /// A list of tools the model may call. Currently, only functions are supported as a tool.
    /// Use this to provide a list of functions the model may generate JSON inputs for.
    @JsonKey(includeIfNull: false) List<Tool>? tools,

    /// Controls which (if any) tool is called by the model.
    /// `none` means the model will not call any tool and instead generates a message.
    /// `auto` means the model can pick between generating a message or calling one or more tools.
    /// `any` means the model must call one or more tools.
    /// `required` is an alias for `any`.
    /// Specifying a particular tool via `{"type": "function", "function": {"name": "my_function"}}`
    /// forces the model to call that tool.
    @_ChatCompletionToolChoiceConverter()
    @JsonKey(name: 'tool_choice', includeIfNull: false)
    ChatCompletionToolChoice? toolChoice,

    /// Positive values penalize new tokens based on whether they appear in the text so far,
    /// increasing the model's likelihood to talk about new topics.
    @JsonKey(name: 'presence_penalty', includeIfNull: false)
    double? presencePenalty,

    /// Positive values penalize new tokens based on their existing frequency in the text so far,
    /// decreasing the model's likelihood to repeat the same line verbatim.
    @JsonKey(name: 'frequency_penalty', includeIfNull: false)
    double? frequencyPenalty,

    /// Number of completions to return for each request.
    @JsonKey(includeIfNull: false) int? n,

    /// Whether to enable parallel function calling during tool use.
    @JsonKey(name: 'parallel_tool_calls', includeIfNull: false)
    @Default(true)
    bool? parallelToolCalls,

    /// Whether to inject a safety prompt before all conversations.
    @JsonKey(name: 'safe_prompt', includeIfNull: false) bool? safePrompt,

    /// Custom metadata to associate with the request.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,

    /// A prediction object used to provide expected output for the model.
    /// This can help reduce latency by allowing the model to skip generating tokens
    /// that match the prediction.
    @JsonKey(includeIfNull: false) Prediction? prediction,

    /// The prompt mode to use for the request.
    /// Use 'reasoning' to enable reasoning mode for supported models.
    @JsonKey(
      name: 'prompt_mode',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    MistralPromptMode? promptMode,
  }) = _ChatCompletionRequest;

  /// Object construction from a JSON representation
  factory ChatCompletionRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'messages',
    'temperature',
    'top_p',
    'max_tokens',
    'stream',
    'stop',
    'random_seed',
    'response_format',
    'tools',
    'tool_choice',
    'presence_penalty',
    'frequency_penalty',
    'n',
    'parallel_tool_calls',
    'safe_prompt',
    'metadata',
    'prediction',
    'prompt_mode',
  ];

  /// Validation constants
  static const temperatureMinValue = 0.0;
  static const temperatureMaxValue = 1.5;
  static const topPMinValue = 0.0;
  static const topPMaxValue = 1.0;
  static const maxTokensMinValue = 0;
  static const presencePenaltyMinValue = -2.0;
  static const presencePenaltyMaxValue = 2.0;
  static const frequencyPenaltyMinValue = -2.0;
  static const frequencyPenaltyMaxValue = 2.0;
  static const nMinValue = 1;

  /// Perform validations on the schema property values
  String? validateSchema() {
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
    if (maxTokens != null && maxTokens! < maxTokensMinValue) {
      return "The value of 'maxTokens' cannot be < $maxTokensMinValue";
    }
    if (presencePenalty != null && presencePenalty! < presencePenaltyMinValue) {
      return "The value of 'presencePenalty' cannot be < $presencePenaltyMinValue";
    }
    if (presencePenalty != null && presencePenalty! > presencePenaltyMaxValue) {
      return "The value of 'presencePenalty' cannot be > $presencePenaltyMaxValue";
    }
    if (frequencyPenalty != null &&
        frequencyPenalty! < frequencyPenaltyMinValue) {
      return "The value of 'frequencyPenalty' cannot be < $frequencyPenaltyMinValue";
    }
    if (frequencyPenalty != null &&
        frequencyPenalty! > frequencyPenaltyMaxValue) {
      return "The value of 'frequencyPenalty' cannot be > $frequencyPenaltyMaxValue";
    }
    if (n != null && n! < nMinValue) {
      return "The value of 'n' cannot be < $nMinValue";
    }
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'messages': messages,
      'temperature': temperature,
      'top_p': topP,
      'max_tokens': maxTokens,
      'stream': stream,
      'stop': stop,
      'random_seed': randomSeed,
      'response_format': responseFormat,
      'tools': tools,
      'tool_choice': toolChoice,
      'presence_penalty': presencePenalty,
      'frequency_penalty': frequencyPenalty,
      'n': n,
      'parallel_tool_calls': parallelToolCalls,
      'safe_prompt': safePrompt,
      'metadata': metadata,
      'prediction': prediction,
      'prompt_mode': promptMode,
    };
  }
}

// ==========================================
// ENUM: ChatCompletionModels
// ==========================================

/// Available chat completion models. Mind that the list may not be exhaustive nor up-to-date.
enum ChatCompletionModels {
  @JsonValue('mistral-large-latest')
  mistralLargeLatest,
  @JsonValue('mistral-small-latest')
  mistralSmallLatest,
  @JsonValue('codestral-latest')
  codestralLatest,
  @JsonValue('ministral-3b-latest')
  ministral3bLatest,
  @JsonValue('ministral-8b-latest')
  ministral8bLatest,
  @JsonValue('open-mistral-nemo')
  openMistralNemo,
  @JsonValue('pixtral-large-latest')
  pixtralLargeLatest,
}

// ==========================================
// CLASS: ChatCompletionModel
// ==========================================

/// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
@freezed
sealed class ChatCompletionModel with _$ChatCompletionModel {
  const ChatCompletionModel._();

  /// Available chat completion models. Mind that the list may not be exhaustive nor up-to-date.
  const factory ChatCompletionModel.model(ChatCompletionModels value) =
      ChatCompletionModelEnumeration;

  /// The ID of the model to use for this request.
  const factory ChatCompletionModel.modelId(String value) =
      ChatCompletionModelString;

  /// Object construction from a JSON representation
  factory ChatCompletionModel.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionModelFromJson(json);
}

/// Custom JSON converter for [ChatCompletionModel]
class _ChatCompletionModelConverter
    implements JsonConverter<ChatCompletionModel, Object?> {
  const _ChatCompletionModelConverter();

  @override
  ChatCompletionModel fromJson(Object? data) {
    if (data is String && _$ChatCompletionModelsEnumMap.values.contains(data)) {
      return ChatCompletionModelEnumeration(
        _$ChatCompletionModelsEnumMap.keys.elementAt(
          _$ChatCompletionModelsEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is String) {
      return ChatCompletionModelString(data);
    }
    throw Exception('Unexpected value for ChatCompletionModel: $data');
  }

  @override
  Object? toJson(ChatCompletionModel data) {
    return switch (data) {
      ChatCompletionModelEnumeration(value: final v) =>
        _$ChatCompletionModelsEnumMap[v]!,
      ChatCompletionModelString(value: final v) => v,
    };
  }
}

// ==========================================
// CLASS: ChatCompletionStop
// ==========================================

/// Stop generation if this token is detected, or if the end of the sequence is detected.
@freezed
sealed class ChatCompletionStop with _$ChatCompletionStop {
  const ChatCompletionStop._();

  /// A list of stop strings.
  const factory ChatCompletionStop.listString(List<String> value) =
      ChatCompletionStopListString;

  /// A single stop string.
  const factory ChatCompletionStop.string(String value) =
      ChatCompletionStopString;

  /// Object construction from a JSON representation
  factory ChatCompletionStop.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionStopFromJson(json);
}

/// Custom JSON converter for [ChatCompletionStop]
class _ChatCompletionStopConverter
    implements JsonConverter<ChatCompletionStop?, Object?> {
  const _ChatCompletionStopConverter();

  @override
  ChatCompletionStop? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is List && data.every((item) => item is String)) {
      return ChatCompletionStopListString(data.cast());
    }
    if (data is String) {
      return ChatCompletionStopString(data);
    }
    throw Exception('Unexpected value for ChatCompletionStop: $data');
  }

  @override
  Object? toJson(ChatCompletionStop? data) {
    return switch (data) {
      ChatCompletionStopListString(value: final v) => v,
      ChatCompletionStopString(value: final v) => v,
      null => null,
    };
  }
}

// ==========================================
// ENUM: ChatCompletionToolChoiceOption
// ==========================================

/// Controls which (if any) tool is called by the model.
enum ChatCompletionToolChoiceOption {
  @JsonValue('none')
  none,
  @JsonValue('auto')
  auto,
  @JsonValue('any')
  any,
  @JsonValue('required')
  required,
}

// ==========================================
// CLASS: ChatCompletionToolChoice
// ==========================================

/// Controls which (if any) tool is called by the model.
/// `none` means the model will not call any tool and instead generates a message.
/// `auto` means the model can pick between generating a message or calling one or more tools.
/// `any` means the model must call one or more tools.
/// `required` is an alias for `any`.
/// Specifying a particular tool via `{"type": "function", "function": {"name": "my_function"}}`
/// forces the model to call that tool.
@freezed
sealed class ChatCompletionToolChoice with _$ChatCompletionToolChoice {
  const ChatCompletionToolChoice._();

  /// Controls which (if any) tool is called by the model.
  const factory ChatCompletionToolChoice.enumeration(
    ChatCompletionToolChoiceOption value,
  ) = ChatCompletionToolChoiceEnumeration;

  /// No Description
  const factory ChatCompletionToolChoice.toolChoiceTool(ToolChoiceTool value) =
      ChatCompletionToolChoiceToolChoiceTool;

  /// Object construction from a JSON representation
  factory ChatCompletionToolChoice.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionToolChoiceFromJson(json);
}

/// Custom JSON converter for [ChatCompletionToolChoice]
class _ChatCompletionToolChoiceConverter
    implements JsonConverter<ChatCompletionToolChoice?, Object?> {
  const _ChatCompletionToolChoiceConverter();

  @override
  ChatCompletionToolChoice? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$ChatCompletionToolChoiceOptionEnumMap.values.contains(data)) {
      return ChatCompletionToolChoiceEnumeration(
        _$ChatCompletionToolChoiceOptionEnumMap.keys.elementAt(
          _$ChatCompletionToolChoiceOptionEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is Map<String, dynamic>) {
      try {
        return ChatCompletionToolChoiceToolChoiceTool(
          ToolChoiceTool.fromJson(data),
        );
      } catch (e) {}
    }
    throw Exception('Unexpected value for ChatCompletionToolChoice: $data');
  }

  @override
  Object? toJson(ChatCompletionToolChoice? data) {
    return switch (data) {
      ChatCompletionToolChoiceEnumeration(value: final v) =>
        _$ChatCompletionToolChoiceOptionEnumMap[v]!,
      ChatCompletionToolChoiceToolChoiceTool(value: final v) => v.toJson(),
      null => null,
    };
  }
}
