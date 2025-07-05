import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:ollama_dart/ollama_dart.dart' show OllamaClient;
import 'package:uuid/uuid.dart';

import '../chat_message.dart' as msg;
import '../chat_models.dart';
import 'ollama_message_mappers.dart' as ollama_mappers;

export 'ollama_chat_options.dart';

/// Wrapper around [Ollama](https://ollama.ai) Chat API that enables to interact
/// with the LLMs in a chat-like fashion.
class OllamaChatModel extends ChatModel<OllamaChatOptions> {
  /// Creates a [OllamaChatModel] instance.
  OllamaChatModel({
    String? name,
    super.tools,
    super.temperature,
    super.systemPrompt,
    OllamaChatOptions? defaultOptions,
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    http.Client? client,
  }) : _client = OllamaClient(
         baseUrl: baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client,
       ),
       super(
         name: name ?? defaultName,
         defaultOptions: defaultOptions ?? const OllamaChatOptions(),
       ) {
    _logger.info(
      'Creating Ollama model: ${name ?? defaultName} '
      'with ${tools?.length ?? 0} tools, temp: $temperature',
    );
  }
  static final Logger _logger = Logger('dartantic.chat.models.ollama');

  /// The default model to use unless another is specified.
  ///
  /// Note: llama3.x models have a known issue with spurious content in tool
  /// calling responses, generating unwanted JSON fragments like '",
  /// "parameters": {}}' during streaming. qwen2.5:7b-instruct provides cleaner
  /// tool calling behavior.
  static const defaultName = 'qwen2.5:7b-instruct';

  /// The default base URL to use unless another is specified.
  static const defaultBaseUrl = 'http://localhost:11434/api';

  final OllamaClient _client;
  late final _uuid = const Uuid();

  @override
  Stream<ChatResult<msg.ChatMessage>> sendStream(
    List<msg.ChatMessage> messages, {
    OllamaChatOptions? options,
  }) {
    _logger.info(
      'Starting Ollama chat stream with ${messages.length} '
      'messages for model: $name',
    );
    final messagesWithDefaults = prepareMessagesWithDefaults(messages);
    var chunkCount = 0;
    return _client
        .generateChatCompletionStream(
          request: ollama_mappers.generateChatCompletionRequest(
            messagesWithDefaults,
            modelName: name,
            options: options,
            defaultOptions: defaultOptions,
            tools: tools,
            temperature: temperature,
            stream: true,
          ),
        )
        .map((completion) {
          chunkCount++;
          _logger.fine('Received Ollama stream chunk $chunkCount');
          final result = ollama_mappers.ChatResultMapper(
            completion,
          ).toChatResult(_uuid.v4());
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

  @override
  void dispose() => _client.endSession();
}
