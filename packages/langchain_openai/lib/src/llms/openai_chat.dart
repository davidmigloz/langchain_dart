import 'package:langchain/langchain.dart';
import 'package:meta/meta.dart';

import '../client/base.dart';
import '../client/models/models.dart';
import '../client/openai_client.dart';

/// Wrapper around OpenAI Chat large language models.
abstract base class BaseOpenAIChat extends BaseLLM {
  BaseOpenAIChat({
    required final String? apiKey,
    required final BaseOpenAIClient? apiClient,
    required this.model,
    required this.maxTokens,
    required this.temperature,
    required this.topP,
    required this.n,
    required this.presencePenalty,
    required this.frequencyPenalty,
    required this.logitBias,
    required this.prefixMessages,
  })  : assert(
          apiKey != null || apiClient != null,
          'Either apiKey or apiClient must be provided.',
        ),
        _client = apiClient ?? OpenAIClient.instanceFor(apiKey: apiKey!);

  final BaseOpenAIClient _client;

  /// ID of the model to use.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-model
  final String model;

  /// The maximum number of tokens to generate in the chat completion.
  /// Defaults to inf.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-max_tokens
  final int? maxTokens;

  /// What sampling temperature to use, between 0 and 2.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-temperature
  final double temperature;

  /// An alternative to sampling with temperature, called nucleus sampling,
  /// where the model considers the results of the tokens with top_p
  /// probability mass.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-top_p
  final double topP;

  /// How many chat completion choices to generate for each input message.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-n
  final int n;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// whether they appear in the text so far, increasing the model's likelihood
  /// to talk about new topics.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-presence_penalty
  final double presencePenalty;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// their existing frequency in the text so far, decreasing the model's
  /// likelihood to repeat the same line verbatim.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-frequency_penalty
  final double frequencyPenalty;

  /// Modify the likelihood of specified tokens appearing in the completion.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-logit_bias
  final Map<String, double>? logitBias;

  /// Series of messages for Chat input.
  final List<OpenAIChatCompletionMessage>? prefixMessages;

  @override
  String get llmType => 'openai-chat';

  @override
  @visibleForOverriding
  Future<LLMResult> generateInternal({
    required final List<String> prompts,
    final List<String>? stop,
  }) async {
    if (prompts.length > 1) {
      throw ArgumentError(
        'OpenAIChat currently only supports single prompt, got $prompts',
      );
    }

    final messages = [
      ...?prefixMessages,
      OpenAIChatCompletionMessage(
        role: OpenAIChatMessageRole.user,
        content: prompts[0],
      ),
    ];

    final completion = await _client.createChatCompletion(
      model: model,
      messages: messages,
      maxTokens: maxTokens,
      temperature: temperature,
      topP: topP,
      n: n,
      stop: stop,
      presencePenalty: presencePenalty,
      frequencyPenalty: frequencyPenalty,
      logitBias: logitBias,
    );
    return _createLLMResult(completion.choices, prompts, completion.usage);
  }

  LLMResult _createLLMResult(
    final List<OpenAIChatCompletionChoice> choices,
    final List<String> prompts,
    final OpenAIChatCompletionUsage? modelUsage,
  ) {
    final generation = [
      Generation(
        text: choices.first.message.content,
        generationInfo: {
          'finish_reason': choices.first.finishReason,
        },
      )
    ];
    final llmOutput = <String, dynamic>{
      'token_usage': modelUsage,
      'model': model,
    };
    return LLMResult(
      generations: [generation],
      llmOutput: llmOutput,
    );
  }
}

/// Wrapper around OpenAI Chat large language models.
final class OpenAIChat extends BaseOpenAIChat {
  OpenAIChat({
    super.apiKey,
    super.apiClient,
    super.model = 'gpt-3.5-turbo',
    super.maxTokens,
    super.temperature = 1,
    super.topP = 1,
    super.n = 1,
    super.presencePenalty = 0,
    super.frequencyPenalty = 0,
    super.logitBias,
    super.prefixMessages,
  });
}
