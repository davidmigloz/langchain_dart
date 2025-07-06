import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';
import 'package:ollama_dart/ollama_dart.dart'
    show GenerateChatCompletionResponse, OllamaClient;
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
    JsonSchema? outputSchema,
  }) {
    _logger.info(
      'Starting Ollama chat stream with ${messages.length} '
      'messages for model: $name',
    );
    final messagesWithDefaults = prepareMessagesWithDefaults(messages);
    var chunkCount = 0;

    // If we have an output schema, we need to use direct HTTP because
    // ollama_dart doesn't support dynamic format objects, only the
    // ResponseFormat enum
    if (outputSchema != null) {
      return _sendStreamWithSchema(
        messagesWithDefaults,
        outputSchema: outputSchema,
        options: options,
      );
    }

    return _client
        .generateChatCompletionStream(
          request: ollama_mappers.generateChatCompletionRequest(
            messagesWithDefaults,
            modelName: name,
            options: options,
            defaultOptions: defaultOptions,
            tools: tools,
            temperature: temperature,
            outputSchema: outputSchema,
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

  /// WORKAROUND: Direct HTTP implementation for JSON schema support
  ///
  /// The ollama_dart package currently only supports ResponseFormat enum (just
  /// "json") but the Ollama API itself supports full JSON schema objects in the
  /// format field. This method bypasses the package limitation by making direct
  /// HTTP requests.
  ///
  /// TODO: Remove this workaround once ollama_dart supports dynamic format
  /// objects GitHub issue:
  /// https://github.com/davidmigloz/langchain_dart/issues/740
  Stream<ChatResult<msg.ChatMessage>> _sendStreamWithSchema(
    List<msg.ChatMessage> messages, {
    required JsonSchema outputSchema,
    OllamaChatOptions? options,
  }) async* {
    _logger.info('Using direct HTTP for Ollama with JSON schema (workaround)');

    // Create base request
    final request = ollama_mappers.generateChatCompletionRequest(
      messages,
      modelName: name,
      options: options,
      defaultOptions: defaultOptions,
      tools: tools,
      temperature: temperature,
      outputSchema: null, // Don't pass schema here, we'll add it manually
      stream: true,
    );

    // Convert to JSON and add the schema as format
    final requestJson = request.toJson();
    requestJson['format'] = outputSchema.schemaMap;

    // Make direct HTTP request
    final httpClient = http.Client();
    try {
      final response = await httpClient.post(
        Uri.parse('http://localhost:11434/api/chat'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestJson),
      );

      if (response.statusCode != 200) {
        throw Exception(
          'Ollama API error: ${response.statusCode} ${response.body}',
        );
      }

      // Parse streaming response
      var chunkCount = 0;
      final lines = response.body.split('\n');
      for (final line in lines) {
        if (line.trim().isEmpty) continue;

        final json = jsonDecode(line);
        final ollamaResponse = GenerateChatCompletionResponse.fromJson(json);
        chunkCount++;
        _logger.fine('Received Ollama schema stream chunk $chunkCount');

        final result = ollama_mappers.ChatResultMapper(
          ollamaResponse,
        ).toChatResult(_uuid.v4());
        yield ChatResult<msg.ChatMessage>(
          id: result.id,
          output: result.output,
          messages: filterSystemMessages(result.messages),
          finishReason: result.finishReason,
          metadata: result.metadata,
          usage: result.usage,
        );
      }
    } finally {
      httpClient.close();
    }
  }

  @override
  void dispose() => _client.endSession();
}
