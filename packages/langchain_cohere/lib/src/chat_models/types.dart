import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:meta/meta.dart';

/// {@template chat_cohere_options}
/// Options to pass into ChatCohere.
///
/// You can check the list of available models [here](https://docs.cohere.com/docs/models).
/// {@endtemplate}
@immutable
class ChatCohereOptions extends ChatModelOptions {
  /// {@macro chat_cohere_options}
  const ChatCohereOptions({
    super.model,
    this.temperature,
    this.topP,
    this.topK,
    this.maxTokens,
    this.stopSequences,
    this.seed,
    this.frequencyPenalty,
    this.presencePenalty,
    super.tools,
    super.toolChoice,
    super.concurrencyLimit,
  });

  /// What sampling temperature to use, between 0.0 and 1.0. Higher values
  /// will make the output more random, while lower values will make it more
  /// focused and deterministic.
  final double? temperature;

  /// Nucleus sampling, where the model considers the results of the tokens
  /// with `top_p` probability mass (Cohere's `p` parameter, between 0.01 and
  /// 0.99).
  final double? topP;

  /// Only sample from the top K options for each subsequent token (Cohere's
  /// `k` parameter, between 0 and 500).
  final int? topK;

  /// The maximum number of tokens to generate in the completion.
  final int? maxTokens;

  /// Up to 5 strings that the model will use to stop generation.
  final List<String>? stopSequences;

  /// The seed to use for deterministic sampling (best effort).
  final int? seed;

  /// Used to reduce repetitiveness of generated tokens, proportionally to
  /// their frequency so far (between 0.0 and 1.0).
  final double? frequencyPenalty;

  /// Used to reduce repetitiveness of generated tokens, applied equally to
  /// all tokens that have already appeared (between 0.0 and 1.0).
  final double? presencePenalty;

  @override
  ChatCohereOptions copyWith({
    final String? model,
    final double? temperature,
    final double? topP,
    final int? topK,
    final int? maxTokens,
    final List<String>? stopSequences,
    final int? seed,
    final double? frequencyPenalty,
    final double? presencePenalty,
    final List<ToolSpec>? tools,
    final ChatToolChoice? toolChoice,
    final int? concurrencyLimit,
  }) {
    return ChatCohereOptions(
      model: model ?? this.model,
      temperature: temperature ?? this.temperature,
      topP: topP ?? this.topP,
      topK: topK ?? this.topK,
      maxTokens: maxTokens ?? this.maxTokens,
      stopSequences: stopSequences ?? this.stopSequences,
      seed: seed ?? this.seed,
      frequencyPenalty: frequencyPenalty ?? this.frequencyPenalty,
      presencePenalty: presencePenalty ?? this.presencePenalty,
      tools: tools ?? this.tools,
      toolChoice: toolChoice ?? this.toolChoice,
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );
  }

  @override
  ChatCohereOptions merge(covariant ChatCohereOptions? other) {
    return copyWith(
      model: other?.model,
      temperature: other?.temperature,
      topP: other?.topP,
      topK: other?.topK,
      maxTokens: other?.maxTokens,
      stopSequences: other?.stopSequences,
      seed: other?.seed,
      frequencyPenalty: other?.frequencyPenalty,
      presencePenalty: other?.presencePenalty,
      tools: other?.tools,
      toolChoice: other?.toolChoice,
      concurrencyLimit: other?.concurrencyLimit,
    );
  }

  @override
  bool operator ==(covariant final ChatCohereOptions other) {
    return model == other.model &&
        temperature == other.temperature &&
        topP == other.topP &&
        topK == other.topK &&
        maxTokens == other.maxTokens &&
        stopSequences == other.stopSequences &&
        seed == other.seed &&
        frequencyPenalty == other.frequencyPenalty &&
        presencePenalty == other.presencePenalty &&
        tools == other.tools &&
        toolChoice == other.toolChoice &&
        concurrencyLimit == other.concurrencyLimit;
  }

  @override
  int get hashCode {
    return model.hashCode ^
        temperature.hashCode ^
        topP.hashCode ^
        topK.hashCode ^
        maxTokens.hashCode ^
        stopSequences.hashCode ^
        seed.hashCode ^
        frequencyPenalty.hashCode ^
        presencePenalty.hashCode ^
        tools.hashCode ^
        toolChoice.hashCode ^
        concurrencyLimit.hashCode;
  }
}
