import 'package:anthropic_sdk_dart/anthropic_sdk_dart.dart' as a;
import 'package:http/http.dart' as http;
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';

import '../../../language_models/finish_reason.dart';
import '../../../language_models/language_model_usage.dart';
import '../../../platform/platform.dart';
import '../chat_message.dart' as msg;
import '../chat_model.dart';
import '../chat_result.dart';
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
    super.systemPrompt,
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
  Stream<ChatResult<msg.ChatMessage>> sendStream(
    List<msg.ChatMessage> messages, {
    AnthropicChatOptions? options,
    JsonSchema? outputSchema,
  }) async* {
    _logger.info(
      'Starting Anthropic chat stream with '
      '${messages.length} messages for model: $name',
    );
    final messagesWithDefaults = prepareMessagesWithDefaults(messages);

    // Stream prefilled content first (Anthropic's streaming API omits it)
    //
    // Anthropic recommends prefilling for structured output:
    // https://docs.anthropic.com/en/docs/test-and-evaluate/strengthen-guardrails/increase-consistency
    //
    // However, when using streaming, the prefilled content is not included in
    // the streaming events (confirmed via direct API testing). We work around
    // this by streaming the prefilled content as the first chunk, allowing
    // the Agent to accumulate it naturally with the subsequent chunks.
    if (outputSchema != null) {
      yield const ChatResult<msg.ChatMessage>(
        id: 'prefilled',
        output: msg.ChatMessage(
          role: msg.MessageRole.model,
          parts: [msg.TextPart('{')],
        ),
        messages: [
          msg.ChatMessage(
            role: msg.MessageRole.model,
            parts: [msg.TextPart('{')],
          ),
        ],
        finishReason: FinishReason.unspecified,
        metadata: {'anthropic_prefilled': true},
        usage: LanguageModelUsage(),
      );
    }

    var chunkCount = 0;
    await for (final result
        in _client
            .createMessageStream(
              request: createMessageRequest(
                messagesWithDefaults,
                modelName: name,
                tools: tools,
                temperature: temperature,
                options: options,
                defaultOptions: defaultOptions,
                outputSchema: outputSchema,
                stream: true,
              ),
            )
            .transform(MessageStreamEventTransformer())) {
      chunkCount++;
      _logger.fine('Received Anthropic stream chunk $chunkCount');
      // Filter system messages from the response
      yield ChatResult<msg.ChatMessage>(
        id: result.id,
        output: result.output,
        messages: filterSystemMessages(result.messages),
        finishReason: result.finishReason,
        metadata: result.metadata,
        usage: result.usage,
      );
    }
  }

  @override
  void dispose() => _client.endSession();
}
