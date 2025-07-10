import 'package:http/http.dart' as http;
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';
import 'package:openai_dart/openai_dart.dart';
import 'package:uuid/uuid.dart';

import '../../../http/retry_http_client.dart';
import '../../../language_models/language_models.dart';
import '../../../platform/platform.dart';
import '../chat_message.dart' as msg;
import '../chat_models.dart';
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
    super.systemPrompt,
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
       ) {
    // Validate that providers with known tool limitations don't use tools
    if (tools != null && tools!.isNotEmpty) {
      final normalizedBaseUrl = baseUrl?.toLowerCase() ?? '';

      // Together AI doesn't support OpenAI-style tool calls in streaming mode
      if (normalizedBaseUrl.contains('together.xyz')) {
        throw ArgumentError(
          'Together AI does not support OpenAI-compatible tool calls. '
          'Their streaming API returns tools in a custom format with '
          '<|python_tag|> prefix instead of standard tool_calls.',
        );
      }
    }
  }

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
  Stream<ChatResult<msg.ChatMessage>> sendStream(
    List<msg.ChatMessage> messages, {
    OpenAIChatOptions? options,
    JsonSchema? outputSchema,
  }) async* {
    _logger.info(
      'Starting OpenAI chat stream with ${messages.length} messages '
      'for model: $name',
    );

    final messagesWithDefaults = prepareMessagesWithDefaults(messages);
    final request = createChatCompletionRequest(
      messagesWithDefaults,
      modelName: name,
      tools: tools,
      temperature: temperature,
      options: options,
      defaultOptions: defaultOptions,
      outputSchema: outputSchema,
      stream: true,
    );

    final accumulatedToolCalls = <StreamingToolCall>[];
    final accumulatedTextBuffer = StringBuffer();
    var chunkCount = 0;
    var lastResult = ChatResult<msg.ChatMessage>(
      id: _uuid.v4(),
      output: const msg.ChatMessage(role: msg.MessageRole.model, parts: []),
      finishReason: FinishReason.unspecified,
      metadata: const {},
      usage: const LanguageModelUsage(),
    );

    try {
      await for (final completion in _client.createChatCompletionStream(
        request: request,
      )) {
        chunkCount++;
        _logger.fine('Received OpenAI stream chunk $chunkCount');
        final delta = completion.choices.firstOrNull?.delta;
        if (delta == null) continue;

        // Get the message with any text content (tool calls are only
        // accumulated)
        final message = messageFromOpenAIStreamDelta(
          delta,
          accumulatedToolCalls,
        );

        // Store the latest completion info for the final result
        lastResult = ChatResult<msg.ChatMessage>(
          id: completion.id ?? _uuid.v4(),
          output: message,
          messages: filterSystemMessages([message]),
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

        // If there's text content, stream it immediately
        if (message.parts.isNotEmpty) {
          // Accumulate text for the final message
          for (final part in message.parts) {
            if (part is msg.TextPart) {
              accumulatedTextBuffer.write(part.text);
            }
          }

          // Yield the text-only message for streaming
          yield lastResult;
        }
      }

      // After streaming completes, create and yield the final message with all
      // tools
      if (accumulatedToolCalls.isNotEmpty) {
        final completeMessage = createCompleteMessageWithTools(
          accumulatedToolCalls,
          accumulatedText: accumulatedTextBuffer.toString(),
        );

        yield ChatResult<msg.ChatMessage>(
          id: lastResult.id,
          output: completeMessage,
          messages: filterSystemMessages([completeMessage]),
          finishReason: lastResult.finishReason,
          metadata: lastResult.metadata,
          usage: lastResult.usage,
        );
      } else if (accumulatedTextBuffer.isEmpty) {
        // If we have neither text nor tools, yield an empty message to signal
        // completion
        yield lastResult;
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
