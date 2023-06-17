import 'package:langchain/langchain.dart';

import '../client/base.dart';
import '../client/openai_client.dart';
import 'mappers.dart';
import 'models/models.dart';

/// {@template base_chat_openai}
/// Wrapper around OpenAI Chat large language models.
/// {@endtemplate}
abstract base class BaseChatOpenAI extends BaseChatModel<ChatOpenAIOptions> {
  /// {@macro base_chat_openai}
  BaseChatOpenAI({
    required final String? apiKey,
    required final BaseOpenAIClient? apiClient,
    required this.model,
    required this.temperature,
    required this.topP,
    required this.n,
    required this.maxTokens,
    required this.presencePenalty,
    required this.frequencyPenalty,
    required this.logitBias,
  })  : assert(
          apiKey != null || apiClient != null,
          'Either apiKey or apiClient must be provided.',
        ),
        _client = apiClient ?? OpenAIClient.instanceFor(apiKey: apiKey!);

  /// API client to use.
  final BaseOpenAIClient _client;

  /// ID of the model to use (e.g. 'gpt-3.5-turbo').
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-model
  final String model;

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

  /// The maximum number of tokens to generate in the chat completion.
  /// Defaults to inf.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-max_tokens
  final int? maxTokens;

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

  @override
  String get modelType => 'openai-chat';

  @override
  Future<ChatResult> generate(
    final List<ChatMessage> messages, {
    final ChatOpenAIOptions? options,
  }) async {
    final messagesDtos = messages
        .map((final m) => m.toOpenAIChatMessage())
        .toList(growable: false);

    final completion = await _client.createChatCompletion(
      model: model,
      messages: messagesDtos,
      functions: options?.functions
          ?.map((final f) => f.toOpenAIFunction())
          .toList(growable: false),
      functionCall: options?.functionCall?.toOpenAIFunctionCall(),
      maxTokens: maxTokens,
      temperature: temperature,
      topP: topP,
      n: n,
      stop: options?.stop,
      presencePenalty: presencePenalty,
      frequencyPenalty: frequencyPenalty,
      logitBias: logitBias,
    );

    return completion.toChatResult(model);
  }
}

/// {@template chat_openai}
/// Wrapper around [OpenAI Chat API](https://platform.openai.com/docs/api-reference/chat).
///
/// Example:
/// ```dart
/// final chat = ChatOpenAI(apiKey: '...', temperature: 1);
/// ```
/// {@endtemplate}
final class ChatOpenAI extends BaseChatOpenAI {
  /// {@macro chat_openai}
  ChatOpenAI({
    super.apiKey,
    super.apiClient,
    super.model = 'gpt-3.5-turbo',
    super.temperature = 0.7,
    super.topP = 1,
    super.n = 1,
    super.maxTokens,
    super.presencePenalty = 0,
    super.frequencyPenalty = 0,
    super.logitBias,
  });
}
