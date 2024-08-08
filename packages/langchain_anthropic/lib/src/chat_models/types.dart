import 'package:collection/collection.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:meta/meta.dart';

/// {@template chat_anthropic_options}
/// Options to pass into the Anthropic Chat Model.
///
/// Available models:
/// - `claude-3-5-sonnet-20240620`
/// - `claude-3-haiku-20240307`
/// - `claude-3-opus-20240229`
/// - `claude-3-sonnet-20240229`
/// - `claude-2.0`
/// - `claude-2.1`
///
/// Mind that the list may be outdated.
/// See https://docs.anthropic.com/en/docs/about-claude/models for the latest list.
/// {@endtemplate}
@immutable
class ChatAnthropicOptions extends ChatModelOptions {
  /// {@macro chat_anthropic_options}
  const ChatAnthropicOptions({
    super.model,
    this.maxTokens,
    this.stopSequences,
    this.temperature,
    this.topK,
    this.topP,
    this.userId,
    super.tools,
    super.toolChoice,
    super.concurrencyLimit,
  });

  /// The maximum number of tokens to generate before stopping.
  ///
  /// Note that our models may stop _before_ reaching this maximum. This parameter
  /// only specifies the absolute maximum number of tokens to generate.
  ///
  /// Different models have different maximum values for this parameter. See
  /// [models](https://docs.anthropic.com/en/docs/models-overview) for details.
  final int? maxTokens;

  /// Custom text sequences that will cause the model to stop generating.
  ///
  /// Anthropic models will normally stop when they have naturally completed
  /// their turn. If you want the model to stop generating when it encounters
  /// custom strings of text, you can use the `stopSequences` parameter.
  final List<String>? stopSequences;

  /// Amount of randomness injected into the response.
  ///
  /// Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
  /// for analytical / multiple choice, and closer to `1.0` for creative and
  /// generative tasks.
  ///
  /// Note that even with `temperature` of `0.0`, the results will not be fully
  /// deterministic.
  final double? temperature;

  /// Only sample from the top K options for each subsequent token.
  ///
  /// Used to remove "long tail" low probability responses.
  /// [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  final int? topK;

  /// Use nucleus sampling.
  ///
  /// In nucleus sampling, we compute the cumulative distribution over all the options
  /// for each subsequent token in decreasing probability order and cut it off once it
  /// reaches a particular probability specified by `top_p`. You should either alter
  /// `temperature` or `top_p`, but not both.
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  final double? topP;

  /// An external identifier for the user who is associated with the request.
  ///
  /// This should be a uuid, hash value, or other opaque identifier. Anthropic may use
  /// this id to help detect abuse. Do not include any identifying information such as
  /// name, email address, or phone number.
  final String? userId;

  @override
  ChatAnthropicOptions copyWith({
    final String? model,
    final int? maxTokens,
    final List<String>? stopSequences,
    final double? temperature,
    final int? topK,
    final double? topP,
    final String? userId,
    final List<ToolSpec>? tools,
    final ChatToolChoice? toolChoice,
    final int? concurrencyLimit,
  }) {
    return ChatAnthropicOptions(
      model: model ?? this.model,
      maxTokens: maxTokens ?? this.maxTokens,
      stopSequences: stopSequences ?? this.stopSequences,
      temperature: temperature ?? this.temperature,
      topK: topK ?? this.topK,
      topP: topP ?? this.topP,
      userId: userId ?? this.userId,
      tools: tools ?? this.tools,
      toolChoice: toolChoice ?? this.toolChoice,
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );
  }

  @override
  ChatAnthropicOptions merge(covariant final ChatAnthropicOptions? other) {
    return copyWith(
      model: other?.model,
      maxTokens: other?.maxTokens,
      stopSequences: other?.stopSequences,
      temperature: other?.temperature,
      topK: other?.topK,
      topP: other?.topP,
      userId: other?.userId,
      tools: other?.tools,
      toolChoice: other?.toolChoice,
      concurrencyLimit: other?.concurrencyLimit,
    );
  }

  @override
  bool operator ==(covariant final ChatAnthropicOptions other) {
    return model == other.model &&
        maxTokens == other.maxTokens &&
        const ListEquality<String>()
            .equals(stopSequences, other.stopSequences) &&
        temperature == other.temperature &&
        topK == other.topK &&
        topP == other.topP &&
        userId == other.userId &&
        const ListEquality<ToolSpec>().equals(tools, other.tools) &&
        toolChoice == other.toolChoice &&
        concurrencyLimit == other.concurrencyLimit;
  }

  @override
  int get hashCode {
    return model.hashCode ^
        maxTokens.hashCode ^
        const ListEquality<String>().hash(stopSequences) ^
        temperature.hashCode ^
        topK.hashCode ^
        topP.hashCode ^
        userId.hashCode ^
        const ListEquality<ToolSpec>().hash(tools) ^
        toolChoice.hashCode ^
        concurrencyLimit.hashCode;
  }
}
