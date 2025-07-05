import 'package:anthropic_sdk_dart/anthropic_sdk_dart.dart' as a;
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import '../../../platform/platform.dart';
import '../chat_model.dart';
import '../chat_result.dart';
import '../message.dart' as msg;
import 'anthropic_chat_options.dart';
import 'anthropic_message_mappers.dart';

/// Wrapper around [Anthropic Messages
/// API](https://docs.anthropic.com/en/api/messages) (aka Claude API).
class AnthropicChatModel extends ChatModel<AnthropicChatOptions> {
  /// Creates a [AnthropicChatModel] instance.
  AnthropicChatModel({
    String? name,
    super.tools,
    super.temperature,
    AnthropicChatOptions? defaultOptions,
    String? apiKey,
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    http.Client? client,
  }) : _client = a.AnthropicClient(
         apiKey: apiKey ?? getEnv(apiKeyName),
         baseUrl: baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client,
       ),
       super(
         name: name ?? defaultName,
         defaultOptions: defaultOptions ?? const AnthropicChatOptions(),
       ) {
    _logger.info(
      'Creating Anthropic model: ${name ?? defaultName} with '
      '${tools?.length ?? 0} tools, temp: $temperature',
    );
  }

  /// Logger for Anthropic chat model operations.
  static final Logger _logger = Logger('dartantic.chat.models.anthropic');

  /// The default model to use unless another is specified.
  static const defaultName = 'claude-3-5-sonnet-20241022';

  /// The default max tokens to use unless another is specified.
  static const defaultMaxTokens = 1024;

  /// The default base URL to use unless another is specified.
  static const defaultBaseUrl = 'https://api.anthropic.com/v1';

  /// The environment variable for the API key
  static const apiKeyName = 'ANTHROPIC_API_KEY';

  final a.AnthropicClient _client;

  @override
  Stream<ChatResult<msg.Message>> sendStream(
    List<msg.Message> messages, {
    AnthropicChatOptions? options,
  }) {
    _logger.info(
      'Starting Anthropic chat stream with '
      '${messages.length} messages for model: $name',
    );
    var chunkCount = 0;
    return _client
        .createMessageStream(
          request: createMessageRequest(
            messages,
            modelName: name,
            tools: tools,
            temperature: temperature,
            options: options,
            defaultOptions: defaultOptions,
            stream: true,
          ),
        )
        .transform(MessageStreamEventTransformer())
        .map((result) {
          chunkCount++;
          _logger.fine('Received Anthropic stream chunk $chunkCount');
          return result;
        });
  }

  @override
  void dispose() => _client.endSession();
}
