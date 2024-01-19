import 'package:langchain/langchain.dart';

/// {@template chat_mistral_ai_options}
/// Options to pass into ChatMistralAI.
/// {@endtemplate}
class ChatMistralAIOptions extends ChatModelOptions {
  /// {@macro chat_mistral_ai_options}
  const ChatMistralAIOptions({
    this.model = 'mistral-small',
    this.temperature,
    this.topP,
    this.maxTokens,
    this.safePrompt,
    this.randomSeed,
  });

  /// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels)
  /// API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models)
  /// for model descriptions.
  final String? model;

  /// What sampling temperature to use, between 0.0 and 2.0. Higher values like
  /// 0.8 will make the output more random, while lower values like 0.2 will
  /// make it more focused and deterministic.
  ///
  /// We generally recommend altering this or `top_p` but not both.
  final double? temperature;

  /// Nucleus sampling, where the model considers the results of the tokens
  /// with `top_p` probability mass. So 0.1 means only the tokens comprising
  /// the top 10% probability mass are considered.
  ///
  /// We generally recommend altering this or `temperature` but not both.
  final double? topP;

  /// The maximum number of tokens to generate in the completion.
  ///
  /// The token count of your prompt plus `max_tokens` cannot exceed the
  /// model's context length.
  final int? maxTokens;

  /// Whether to inject a safety prompt before all conversations.
  final bool? safePrompt;

  /// The seed to use for random sampling.
  /// If set, different calls will generate deterministic results.
  final int? randomSeed;

  /// Creates a copy of this [ChatMistralAIOptions] object with the given fields
  /// replaced with the new values.
  ChatMistralAIOptions copyWith({
    final String? model,
    final double? temperature,
    final double? topP,
    final int? maxTokens,
    final bool? safePrompt,
    final int? randomSeed,
  }) {
    return ChatMistralAIOptions(
      model: model ?? this.model,
      temperature: temperature ?? this.temperature,
      topP: topP ?? this.topP,
      maxTokens: maxTokens ?? this.maxTokens,
      safePrompt: safePrompt ?? this.safePrompt,
      randomSeed: randomSeed ?? this.randomSeed,
    );
  }
}
