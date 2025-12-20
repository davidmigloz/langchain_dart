import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:meta/meta.dart';

/// {@template chat_mistral_ai_options}
/// Options to pass into ChatMistralAI.
///
/// You can check the list of available models [here](https://docs.mistral.ai/models).
/// {@endtemplate}
@immutable
class ChatMistralAIOptions extends ChatModelOptions {
  /// {@macro chat_mistral_ai_options}
  const ChatMistralAIOptions({
    super.model,
    this.temperature,
    this.topP,
    this.maxTokens,
    this.safePrompt,
    this.randomSeed,
    super.tools,
    super.toolChoice,
    super.concurrencyLimit,
  });

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

  @override
  ChatMistralAIOptions copyWith({
    final String? model,
    final double? temperature,
    final double? topP,
    final int? maxTokens,
    final bool? safePrompt,
    final int? randomSeed,
    final List<ToolSpec>? tools,
    final ChatToolChoice? toolChoice,
    final int? concurrencyLimit,
  }) {
    return ChatMistralAIOptions(
      model: model ?? this.model,
      temperature: temperature ?? this.temperature,
      topP: topP ?? this.topP,
      maxTokens: maxTokens ?? this.maxTokens,
      safePrompt: safePrompt ?? this.safePrompt,
      randomSeed: randomSeed ?? this.randomSeed,
      tools: tools ?? this.tools,
      toolChoice: toolChoice ?? this.toolChoice,
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );
  }

  @override
  ChatMistralAIOptions merge(covariant ChatMistralAIOptions? other) {
    return copyWith(
      model: other?.model,
      temperature: other?.temperature,
      topP: other?.topP,
      maxTokens: other?.maxTokens,
      safePrompt: other?.safePrompt,
      randomSeed: other?.randomSeed,
      tools: other?.tools,
      toolChoice: other?.toolChoice,
      concurrencyLimit: other?.concurrencyLimit,
    );
  }

  @override
  bool operator ==(covariant final ChatMistralAIOptions other) {
    return model == other.model &&
        temperature == other.temperature &&
        topP == other.topP &&
        maxTokens == other.maxTokens &&
        safePrompt == other.safePrompt &&
        randomSeed == other.randomSeed &&
        tools == other.tools &&
        toolChoice == other.toolChoice &&
        concurrencyLimit == other.concurrencyLimit;
  }

  @override
  int get hashCode {
    return model.hashCode ^
        temperature.hashCode ^
        topP.hashCode ^
        maxTokens.hashCode ^
        safePrompt.hashCode ^
        randomSeed.hashCode ^
        tools.hashCode ^
        toolChoice.hashCode ^
        concurrencyLimit.hashCode;
  }
}
