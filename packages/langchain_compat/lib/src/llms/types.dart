import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../language_models/types.dart';

/// {@template openai_options}
/// Options to pass into the OpenAI LLM.
///
/// Available models:
/// - `gpt-3.5-turbo-instruct`
/// - `davinci-002`
/// - `babbage-002`
/// Mind that the list may be outdated.
/// See https://platform.openai.com/docs/models for the latest list.
/// {@endtemplate}
@immutable
class OpenAIOptions extends LLMOptions {
  /// {@macro openai_options}
  const OpenAIOptions({
    super.model,
    this.bestOf,
    this.frequencyPenalty,
    this.logitBias,
    this.logprobs,
    this.maxTokens,
    this.n,
    this.presencePenalty,
    this.seed,
    this.stop,
    this.suffix,
    this.temperature,
    this.topP,
    this.user,
    super.concurrencyLimit,
  });

  /// Generates best_of completions server-side and returns the "best"
  /// (the one with the highest log probability per token).
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-best_of
  final int? bestOf;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// their existing frequency in the text so far, decreasing the model's
  /// likelihood to repeat the same line verbatim.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-frequency_penalty
  final double? frequencyPenalty;

  /// Modify the likelihood of specified tokens appearing in the completion.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-logit_bias
  final Map<String, int>? logitBias;

  /// Include the log probabilities on the `logprobs` most likely tokens, as
  /// well the chosen tokens. For example, if `logprobs` is 5, the API will
  /// return a list of the 5 most likely tokens. The API will always return the
  /// `logprob` of the sampled token, so there may be up to `logprobs+1`
  /// elements in the response.
  ///
  /// The maximum value for logprobs is 5.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-logprobs
  final int? logprobs;

  /// The maximum number of tokens to generate in the completion.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-max_tokens
  final int? maxTokens;

  /// How many completions to generate for each prompt.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-n
  final int? n;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// whether they appear in the text so far, increasing the model's likelihood
  /// to talk about new topics.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-presence_penalty
  final double? presencePenalty;

  /// If specified, our system will make a best effort to sample
  /// deterministically, such that repeated requests with the same seed and
  /// parameters should return the same result.
  ///
  /// Determinism is not guaranteed, and you should refer to the
  /// `system_fingerprint` response parameter to monitor changes in the backend.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-seed
  final int? seed;

  /// Up to 4 sequences where the API will stop generating further tokens.
  /// The returned text will not contain the stop sequence.
  ///
  /// Ref: https://platform.openai.com/docs/api-reference/completions/create#completions-create-stop
  final List<String>? stop;

  /// The suffix that comes after a completion of inserted text.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-suffix
  final String? suffix;

  /// What sampling temperature to use, between 0 and 2.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-temperature
  final double? temperature;

  /// An alternative to sampling with temperature, called nucleus sampling,
  /// where the model considers the results of the tokens with top_p
  /// probability mass.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-top_p
  final double? topP;

  /// A unique identifier representing your end-user, which can help OpenAI to
  /// monitor and detect abuse.
  ///
  /// If you need to send different users in different requests, you can set
  /// this field in [OpenAIOptions.user] instead.
  ///
  /// Ref: https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids
  final String? user;

  @override
  OpenAIOptions copyWith({
    final String? model,
    final int? bestOf,
    final double? frequencyPenalty,
    final Map<String, int>? logitBias,
    final int? logprobs,
    final int? maxTokens,
    final int? n,
    final double? presencePenalty,
    final int? seed,
    final List<String>? stop,
    final String? suffix,
    final double? temperature,
    final double? topP,
    final String? user,
    final int? concurrencyLimit,
  }) {
    return OpenAIOptions(
      model: model ?? this.model,
      bestOf: bestOf ?? this.bestOf,
      frequencyPenalty: frequencyPenalty ?? this.frequencyPenalty,
      logitBias: logitBias ?? this.logitBias,
      logprobs: logprobs ?? this.logprobs,
      maxTokens: maxTokens ?? this.maxTokens,
      n: n ?? this.n,
      presencePenalty: presencePenalty ?? this.presencePenalty,
      seed: seed ?? this.seed,
      stop: stop ?? this.stop,
      suffix: suffix ?? this.suffix,
      temperature: temperature ?? this.temperature,
      topP: topP ?? this.topP,
      user: user ?? this.user,
      concurrencyLimit: concurrencyLimit ?? super.concurrencyLimit,
    );
  }

  @override
  OpenAIOptions merge(covariant final OpenAIOptions? other) {
    return copyWith(
      model: other?.model,
      bestOf: other?.bestOf,
      frequencyPenalty: other?.frequencyPenalty,
      logitBias: other?.logitBias,
      logprobs: other?.logprobs,
      maxTokens: other?.maxTokens,
      n: other?.n,
      presencePenalty: other?.presencePenalty,
      seed: other?.seed,
      stop: other?.stop,
      suffix: other?.suffix,
      temperature: other?.temperature,
      topP: other?.topP,
      user: other?.user,
      concurrencyLimit: other?.concurrencyLimit,
    );
  }

  @override
  bool operator ==(covariant final OpenAIOptions other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            model == other.model &&
            bestOf == other.bestOf &&
            frequencyPenalty == other.frequencyPenalty &&
            const MapEquality<String, int>().equals(
              logitBias,
              other.logitBias,
            ) &&
            logprobs == other.logprobs &&
            maxTokens == other.maxTokens &&
            n == other.n &&
            presencePenalty == other.presencePenalty &&
            seed == other.seed &&
            const ListEquality<String>().equals(stop, other.stop) &&
            suffix == other.suffix &&
            temperature == other.temperature &&
            topP == other.topP &&
            user == other.user &&
            concurrencyLimit == other.concurrencyLimit;
  }

  @override
  int get hashCode {
    return model.hashCode ^
        bestOf.hashCode ^
        frequencyPenalty.hashCode ^
        const MapEquality<String, int>().hash(logitBias) ^
        logprobs.hashCode ^
        maxTokens.hashCode ^
        n.hashCode ^
        presencePenalty.hashCode ^
        seed.hashCode ^
        const ListEquality<String>().hash(stop) ^
        suffix.hashCode ^
        temperature.hashCode ^
        topP.hashCode ^
        user.hashCode ^
        concurrencyLimit.hashCode;
  }
}

@immutable
class LLMOptions extends LanguageModelOptions {
  /// {@macro llm_options}
  const LLMOptions({super.model, super.concurrencyLimit});
}

/// {@template llm_result}
/// Result returned by the LLM.
/// {@endtemplate}
class LLMResult extends LanguageModelResult<String> {
  /// {@macro llm_result}
  const LLMResult({
    required super.id,
    required super.output,
    required super.finishReason,
    required super.metadata,
    required super.usage,
    super.streaming = false,
  });

  @override
  String get outputAsString => output;

  @override
  LLMResult concat(final LanguageModelResult<String> other) {
    return LLMResult(
      id: other.id,
      output: output + other.output,
      finishReason:
          finishReason != FinishReason.unspecified &&
              other.finishReason == FinishReason.unspecified
          ? finishReason
          : other.finishReason,
      metadata: {...metadata, ...other.metadata},
      usage: usage.concat(other.usage),
      streaming: other.streaming,
    );
  }

  @override
  String toString() {
    return '''
LLMResult{
  id: $id, 
  output: $output,
  finishReason: $finishReason,
  metadata: $metadata,
  usage: $usage,
  streaming: $streaming
}''';
  }
}
