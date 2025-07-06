import 'package:http/http.dart' as http;
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';
import 'package:mistralai_dart/mistralai_dart.dart';

import '../../../platform/platform.dart';
import '../../chat.dart';
import '../chat_message.dart' as msg;
import 'mistral_message_mappers.dart';

/// Wrapper around [Mistral AI](https://docs.mistral.ai) Chat Completions API.
class MistralChatModel extends ChatModel<MistralChatOptions> {
  /// Creates a [MistralChatModel] instance.
  MistralChatModel({
    String? name,
    super.tools,
    super.temperature,
    super.systemPrompt,
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
    _logger.info(
      'Creating Mistral model: ${name ?? defaultName} '
      'with ${tools?.length ?? 0} tools, temp: $temperature',
    );
    if (tools != null) {
      // TODO: Mistral doesn't support tools yet, waiting for a fix:
      // https://github.com/davidmigloz/langchain_dart/issues/653
      throw Exception('Tools are not supported by Mistral.');
    }
  }
  static final Logger _logger = Logger('dartantic.chat.models.mistral');

  /// The default model to use unless another is specified.
  static const defaultName = 'mistral-small';

  /// The default base URL to use unless another is specified.
  static const defaultBaseUrl = 'https://api.mistral.ai/v1';

  /// The environment variable for the API key
  static const apiKeyName = 'MISTRAL_API_KEY';

  final MistralAIClient _client;

  @override
  Stream<ChatResult<msg.ChatMessage>> sendStream(
    List<msg.ChatMessage> messages, {
    MistralChatOptions? options,
    JsonSchema? outputSchema,
  }) {
    _logger.info(
      'Starting Mistral chat stream with ${messages.length} messages for '
      'model: $name',
    );
    final messagesWithDefaults = prepareMessagesWithDefaults(messages);
    var chunkCount = 0;

    if (outputSchema != null) {
      throw Exception(
        'JSON schema support is not yet implemented for Mistral.',
      );
    }

    return _client
        .createChatCompletionStream(
          request: createChatCompletionRequest(
            messagesWithDefaults,
            modelName: name,
            tools: tools,
            temperature: temperature,
            options: options,
            defaultOptions: defaultOptions,
            stream: true,
          ),
        )
        .map((completion) {
          chunkCount++;
          _logger.fine('Received Mistral stream chunk $chunkCount');
          final result = completion.toChatResult();
          // Filter system messages from the response
          return ChatResult<msg.ChatMessage>(
            id: result.id,
            output: result.output,
            messages: filterSystemMessages(result.messages),
            finishReason: result.finishReason,
            metadata: result.metadata,
            usage: result.usage,
          );
        });
  }

  /// Creates a GenerateCompletionRequest from the given input.
  ChatCompletionRequest createChatCompletionRequest(
    List<msg.ChatMessage> messages, {
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
