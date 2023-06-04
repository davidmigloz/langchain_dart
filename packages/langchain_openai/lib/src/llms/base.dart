import 'package:langchain/langchain.dart';
import 'package:meta/meta.dart';

import '../client/base.dart';
import '../client/models/models.dart';
import '../client/openai_client.dart';

/// Wrapper around OpenAI large language models.
base class BaseOpenAI extends BaseLLM {
  BaseOpenAI({
    final String? apiKey,
    final BaseOpenAIClient? apiClient,
    this.model = 'text-davinci-003',
    this.maxTokens = 256,
    this.temperature = 0.7,
    this.topP = 1,
    this.n = 1,
    this.presencePenalty = 0,
    this.frequencyPenalty = 0,
    this.bestOf = 1,
    this.logitBias,
  })  : assert(
          apiKey != null || apiClient != null,
          'Either apiKey or apiClient must be provided.',
        ),
        _client = apiClient ?? OpenAIClient.instanceFor(apiKey: apiKey!);

  final BaseOpenAIClient _client;

  /// ID of the model to use.
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
  String get llmType => 'openai';

  @override
  @visibleForOverriding
  Future<LLMResult> generateInternal({
    required final List<String> prompts,
    final List<String>? stop,
  }) async {
    final completion = await _client.createCompletion(
      model: model,
      prompts: prompts,
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
    return _createLLMResult(completion.choices, prompts, completion.usage);
  }

  LLMResult _createLLMResult(
    final List<OpenAICompletionModelChoice> choices,
    final List<String> prompts,
    final OpenAICompletionModelUsage? modelUsage,
  ) {
    final generations = <List<Generation>>[];
    for (int i = 0; i < prompts.length; i++) {
      final subChoices = choices.sublist(i * n, (i + 1) * n);
      final generationList = subChoices.map((final choice) {
        return Generation(
          text: choice.text,
          generationInfo: {
            'finish_reason': choice.finishReason,
            'logprobs': choice.logprobs,
          },
        );
      }).toList(growable: false);
      generations.add(generationList);
    }
    final llmOutput = <String, dynamic>{
      'token_usage': modelUsage,
      'model': model,
    };
    return LLMResult(generations: generations, llmOutput: llmOutput);
  }
}
