import 'package:dart_openai/dart_openai.dart' as c;

import 'base.dart';
import 'mappers/mappers.dart';
import 'models/models.dart';

/// OpenAIClient is a wrapper around the OpenAI API.
///
/// OpenAI API docs: https://platform.openai.com/docs/api-reference
final class OpenAIClient implements BaseOpenAIClient {
  OpenAIClient._(this._client);

  static OpenAIClient? _instance;
  final c.OpenAI _client;

  /// Returns the singleton instance of [OpenAIClient].
  ///
  /// - [apiKey] The API key used to authenticate the requests. You can get
  ///   your API key from the
  ///   [OpenAI dashboard](https://platform.openai.com/account/api-keys).
  /// - [apiBaseUrl] Base url of the OpenAI API.
  ///   By default it is set to `https://api.openai.com`.
  /// - [organization] For users who belong to multiple organizations, you can
  ///   specify which organization is used.
  ///   Eg. `org-dtDDtkEGoFccn5xaP5W1p3Rr`
  factory OpenAIClient.instanceFor({
    required final String apiKey,
    final String? apiBaseUrl,
    final String? organization,
  }) {
    c.OpenAI.apiKey = apiKey;
    if (apiBaseUrl?.isNotEmpty ?? false) {
      c.OpenAI.baseUrl = apiBaseUrl!;
    }
    if (organization?.isNotEmpty ?? false) {
      c.OpenAI.organization = organization;
    }
    _instance ??= OpenAIClient._(c.OpenAI.instance);
    return _instance!;
  }

  @override
  Future<OpenAICompletion> createCompletion({
    required final String model,
    required final List<String> prompts,
    final String? suffix,
    final int? maxTokens,
    final double? temperature,
    final double? topP,
    final int? n,
    final int? logprobs,
    final bool? echo,
    final List<String>? stop,
    final double? presencePenalty,
    final double? frequencyPenalty,
    final int? bestOf,
    final Map<String, dynamic>? logitBias,
    final String? user,
  }) async {
    final completion = await _client.completion.create(
      model: model,
      prompt: prompts,
      suffix: suffix,
      maxTokens: maxTokens,
      temperature: temperature,
      topP: topP,
      n: n,
      logprobs: logprobs,
      echo: echo,
      stop: stop?.firstOrNull,
      presencePenalty: presencePenalty,
      frequencyPenalty: frequencyPenalty,
      bestOf: bestOf,
      logitBias: logitBias,
      user: user,
    );
    return completion.toModel();
  }

  @override
  Future<OpenAIChatCompletion> createChatCompletion({
    required final String model,
    required final List<OpenAIChatCompletionMessage> messages,
    final int? maxTokens,
    final double? temperature,
    final double? topP,
    final int? n,
    final int? logprobs,
    final List<String>? stop,
    final double? presencePenalty,
    final double? frequencyPenalty,
    final Map<String, dynamic>? logitBias,
    final String? user,
  }) async {
    final chat = await _client.chat.create(
      model: model,
      messages: messages.map((final m) => m.toDto()).toList(growable: false),
      temperature: temperature,
      topP: topP,
      n: n,
      // TODO to investigate why it does not accept a List<String>
      stop: stop?.firstOrNull,
      maxTokens: maxTokens,
      presencePenalty: presencePenalty,
      frequencyPenalty: frequencyPenalty,
      logitBias: logitBias,
      user: user,
    );
    return chat.toModel();
  }
}
