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
class ChatCompletionRequest with _$ChatCompletionRequest {
  const ChatCompletionRequest._();

  /// Factory constructor for ChatCompletionRequest
  const factory ChatCompletionRequest({
    /// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
    @_ChatCompletionModelConverter() required ChatCompletionModel model,

    /// The prompt(s) to generate completions for, encoded as a list of dict with role and content. The first prompt role should be `user` or `system`.
    required List<ChatCompletionMessage> messages,

    /// What sampling temperature to use, between 0.0 and 1.0. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    ///
    /// We generally recommend altering this or `top_p` but not both.
    @JsonKey(includeIfNull: false) @Default(0.7) double? temperature,

    /// Nucleus sampling, where the model considers the results of the tokens with `top_p` probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    ///
    /// We generally recommend altering this or `temperature` but not both.
    @JsonKey(name: 'top_p', includeIfNull: false) @Default(1.0) double? topP,

    /// The maximum number of tokens to generate in the completion.
    ///
    /// The token count of your prompt plus `max_tokens` cannot exceed the model's context length.
    @JsonKey(name: 'max_tokens', includeIfNull: false) int? maxTokens,

    /// Whether to stream back partial progress. If set, tokens will be sent as data-only server-sent events as they become available, with the stream terminated by a data: [DONE] message. Otherwise, the server will hold the request open until the timeout or until completion, with the response containing the full result as JSON.
    @JsonKey(includeIfNull: false) @Default(false) bool? stream,

    /// Whether to inject a safety prompt before all conversations.
    @JsonKey(name: 'safe_prompt', includeIfNull: false)
    @Default(false)
    bool? safePrompt,

    /// The seed to use for random sampling. If set, different calls will generate deterministic results.
    @JsonKey(name: 'random_seed', includeIfNull: false) int? randomSeed,
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
    'safe_prompt',
    'random_seed'
  ];

  /// Validation constants
  static const temperatureDefaultValue = 0.7;
  static const temperatureMinValue = 0.0;
  static const temperatureMaxValue = 1.0;
  static const topPDefaultValue = 1.0;
  static const topPMinValue = 0.0;
  static const topPMaxValue = 1.0;
  static const maxTokensMinValue = 0;

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
      'safe_prompt': safePrompt,
      'random_seed': randomSeed,
    };
  }
}

// ==========================================
// ENUM: ChatCompletionModels
// ==========================================

/// Available chat completion models. Mind that the list may not be exhaustive nor up-to-date.
enum ChatCompletionModels {
  @JsonValue('mistral-medium')
  mistralMedium,
  @JsonValue('mistral-small')
  mistralSmall,
  @JsonValue('mistral-tiny')
  mistralTiny,
}

// ==========================================
// CLASS: ChatCompletionModel
// ==========================================

/// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
@freezed
sealed class ChatCompletionModel with _$ChatCompletionModel {
  const ChatCompletionModel._();

  /// Available chat completion models. Mind that the list may not be exhaustive nor up-to-date.
  const factory ChatCompletionModel.model(
    ChatCompletionModels value,
  ) = ChatCompletionModelEnumeration;

  /// The ID of the model to use for this request.
  const factory ChatCompletionModel.modelId(
    String value,
  ) = ChatCompletionModelString;

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
    throw Exception(
      'Unexpected value for ChatCompletionModel: $data',
    );
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
