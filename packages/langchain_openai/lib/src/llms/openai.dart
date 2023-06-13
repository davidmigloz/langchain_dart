import 'package:langchain/langchain.dart';

import '../client/base.dart';
import '../client/openai_client.dart';
import 'mappers.dart';

/// {@template base_openai}
/// Wrapper around OpenAI large language models.
/// {@endtemplate}
abstract base class BaseOpenAI extends BaseLLM {
  /// {@macro base_openai}
  BaseOpenAI({
    required final String? apiKey,
    required final BaseOpenAIClient? apiClient,
    required this.model,
    required this.maxTokens,
    required this.temperature,
    required this.topP,
    required this.n,
    required this.presencePenalty,
    required this.frequencyPenalty,
    required this.bestOf,
    required this.logitBias,
  })  : assert(
          apiKey != null || apiClient != null,
          'Either apiKey or apiClient must be provided.',
        ),
        _client = apiClient ?? OpenAIClient.instanceFor(apiKey: apiKey!);

  final BaseOpenAIClient _client;

  /// ID of the model to use (e.g. 'text-davinci-003').
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions/create-model
  final String model;

  /// The maximum number of tokens to generate in the completion.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions/create-max_tokens
  final int maxTokens;

  /// What sampling temperature to use, between 0 and 2.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions/create-temperature
  final double temperature;

  /// An alternative to sampling with temperature, called nucleus sampling,
  /// where the model considers the results of the tokens with top_p
  /// probability mass.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions/create-top_p
  final double topP;

  /// How many completions to generate for each prompt.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions/create-n
  final int n;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// whether they appear in the text so far, increasing the model's likelihood
  /// to talk about new topics.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions/create-presence_penalty
  final double presencePenalty;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// their existing frequency in the text so far, decreasing the model's
  /// likelihood to repeat the same line verbatim.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions/create-frequency_penalty
  final double frequencyPenalty;

  /// Generates best_of completions server-side and returns the "best"
  /// (the one with the highest log probability per token).
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions/create-best_of
  final int bestOf;

  /// Modify the likelihood of specified tokens appearing in the completion.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions/create-logit_bias
  final Map<String, double>? logitBias;

  @override
  String get modelType => 'openai';

  @override
  Future<LLMResult> generate(
    final String prompt, {
    final List<String>? stop,
  }) async {
    final completion = await _client.createCompletion(
      model: model,
      prompts: [prompt],
      maxTokens: maxTokens,
      temperature: temperature,
      topP: topP,
      n: n,
      stop: stop,
      presencePenalty: presencePenalty,
      frequencyPenalty: frequencyPenalty,
      bestOf: bestOf,
      logitBias: logitBias,
    );
    return completion.toChatResult();
  }
}

/// {@template openai}
/// Wrapper around [OpenAI Completions API](https://platform.openai.com/docs/api-reference/completions).
///
/// Example:
/// ```dart
/// final llm = OpenAI(apiKey: '...', temperature: 1);
/// ```
/// {@endtemplate}
final class OpenAI extends BaseOpenAI {
  /// {@macro openai}
  OpenAI({
    super.apiKey,
    super.apiClient,
    super.model = 'text-davinci-003',
    super.maxTokens = 256,
    super.temperature = 1,
    super.topP = 1,
    super.n = 1,
    super.presencePenalty = 0,
    super.frequencyPenalty = 0,
    super.bestOf = 1,
    super.logitBias,
  });
}
