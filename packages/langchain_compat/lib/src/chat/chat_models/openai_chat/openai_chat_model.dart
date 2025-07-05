import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:openai_dart/openai_dart.dart';
import 'package:uuid/uuid.dart';

import '../../../http/retry_http_client.dart';
import '../../../platform/platform.dart';
import '../chat_models.dart';
import '../message.dart' as msg;
import 'openai_message_mappers.dart';
import 'openai_message_mappers_helpers.dart';

/// Wrapper around [OpenAI Chat
/// API](https://platform.openai.com/docs/api-reference/chat).
class OpenAIChatModel extends ChatModel<OpenAIChatOptions> {
  /// Creates a [OpenAIChatModel] instance.
  OpenAIChatModel({
    String? name,
    super.tools,
    super.temperature,
    OpenAIChatOptions? defaultOptions,
    String? apiKey,
    String? organization,
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    http.Client? client,
  }) : _client = OpenAIClient(
         apiKey: apiKey ?? getEnv(apiKeyName),
         organization: organization,
         baseUrl: baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client != null
             ? RetryHttpClient(inner: client)
             : RetryHttpClient(inner: http.Client()),
       ),
       super(
         name: name ?? defaultName,
         defaultOptions: defaultOptions ?? const OpenAIChatOptions(),
       );

  /// Logger for OpenAI chat model operations.
  static final Logger _logger = Logger('dartantic.chat.models.openai');

  /// The default model to use unless another is specified.
  static const defaultName = 'gpt-4o-mini';

  /// The default base URL to use unless another is specified.
  static const defaultBaseUrl = 'https://api.openai.com/v1';

  /// The environment variable for the API key
  static const apiKeyName = 'OPENAI_API_KEY';

  final OpenAIClient _client;
  final _uuid = const Uuid();

  @override
  Stream<ChatResult<msg.Message>> sendStream(
    List<msg.Message> messages, {
    OpenAIChatOptions? options,
  }) async* {
    _logger.info(
      'Starting OpenAI chat stream with ${messages.length} messages '
      'for model: $name',
    );

    final request = createChatCompletionRequest(
      messages,
      modelName: name,
      tools: tools,
      temperature: temperature,
      options: options,
      defaultOptions: defaultOptions,
      stream: true,
    );

    final accumulatedToolCalls = <StreamingToolCall>[];
    var chunkCount = 0;

    try {
      await for (final completion in _client.createChatCompletionStream(
        request: request,
      )) {
        chunkCount++;
        _logger.fine('Received OpenAI stream chunk $chunkCount');
        final delta = completion.choices.firstOrNull?.delta;
        if (delta == null) continue;

        final message = messageFromOpenAIStreamDelta(
          delta,
          accumulatedToolCalls,
        );

        yield ChatResult<msg.Message>(
          id: completion.id ?? _uuid.v4(),
          output: message,
          messages: [message],
          finishReason: mapFinishReason(
            completion.choices.firstOrNull?.finishReason,
          ),
          metadata: {
            'created': completion.created,
            'model': completion.model,
            'system_fingerprint': completion.systemFingerprint,
          },
          usage: mapUsage(completion.usage),
        );
      }

      _logger.info('OpenAI chat stream completed after $chunkCount chunks');
    } catch (e) {
      _logger.warning('OpenAI chat stream error: $e');
      rethrow;
    }
  }

  @override
  void dispose() => _client.endSession();
}
