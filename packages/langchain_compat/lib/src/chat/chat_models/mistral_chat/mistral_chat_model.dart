import 'package:http/http.dart' as http;
import 'package:mistralai_dart/mistralai_dart.dart';

import '../../../platform/platform.dart';
import '../../chat.dart';
import '../message.dart' as msg;
import 'mistral_message_mappers.dart';

/// Wrapper around [Mistral AI](https://docs.mistral.ai) Chat Completions API.
class MistralChatModel extends ChatModel<MistralChatOptions> {
  /// Creates a [MistralChatModel] instance.
  MistralChatModel({
    String? name,
    super.tools,
    super.temperature,
    MistralChatOptions? defaultOptions,
    String? apiKey,
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    http.Client? client,
  }) : _client = MistralAIClient(
         apiKey: apiKey ?? getEnv(apiKeyName),
         baseUrl: baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client,
       ),
       super(
         name: name ?? defaultName,
         defaultOptions: defaultOptions ?? const MistralChatOptions(),
       ) {
    if (tools != null) {
      // TODO: Mistral doesn't support tools yet, waiting for a fix:
      // https://github.com/davidmigloz/langchain_dart/issues/653
      throw Exception('Tools are not supported by Mistral.');
    }
  }

  /// The default model to use unless another is specified.
  static const defaultName = 'mistral-small';

  /// The default base URL to use unless another is specified.
  static const defaultBaseUrl = 'https://api.mistral.ai/v1';

  /// The environment variable for the API key
  static const apiKeyName = 'MISTRAL_API_KEY';

  final MistralAIClient _client;

  @override
  Stream<ChatResult<msg.Message>> sendStream(
    List<msg.Message> messages, {
    MistralChatOptions? options,
  }) => _client
      .createChatCompletionStream(
        request: createChatCompletionRequest(
          messages,
          modelName: name,
          tools: tools,
          temperature: temperature,
          options: options,
          defaultOptions: defaultOptions,
          stream: true,
        ),
      )
      .map((completion) => completion.toChatResult());

  /// Creates a GenerateCompletionRequest from the given input.
  ChatCompletionRequest createChatCompletionRequest(
    List<msg.Message> messages, {
    required String modelName,
    required MistralChatOptions defaultOptions,
    required bool stream,
    List<Tool>? tools,
    double? temperature,
    MistralChatOptions? options,
  }) => ChatCompletionRequest(
    model: ChatCompletionModel.modelId(modelName),
    messages: messages.toChatCompletionMessages(),
    temperature:
        temperature ?? options?.temperature ?? defaultOptions.temperature,
    topP: options?.topP ?? defaultOptions.topP,
    maxTokens: options?.maxTokens ?? defaultOptions.maxTokens,
    safePrompt: options?.safePrompt ?? defaultOptions.safePrompt,
    randomSeed: options?.randomSeed ?? defaultOptions.randomSeed,
    stream: stream,
  );

  @override
  void dispose() => _client.endSession();
}
