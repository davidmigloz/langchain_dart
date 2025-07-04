import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:openai_dart/openai_dart.dart';
import 'package:uuid/uuid.dart';

import '../chat_models.dart';
import 'openai_chat_mappers.dart';
import 'openai_chat_options.dart';

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
         apiKey: apiKey ?? Platform.environment[apiKeyName]!,
         organization: organization,
         baseUrl: baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client,
       ),
       super(
         name: name ?? defaultName,
         defaultOptions: defaultOptions ?? const OpenAIChatOptions(),
       );

  /// The default model to use unless another is specified.
  static const defaultName = 'gpt-4o-mini';

  /// The default base URL to use unless another is specified.
  static const defaultBaseUrl = 'https://api.openai.com/v1';

  /// The environment variable for the API key
  static const apiKeyName = 'OPENAI_API_KEY';

  final OpenAIClient _client;
  final _uuid = const Uuid();

  @override
  Stream<ChatResult<AIChatMessage>> sendStream(
    List<ChatMessage> messages, {
    OpenAIChatOptions? options,
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
      .map(
        (completion) => completion.toChatResult(completion.id ?? _uuid.v4()),
      );

  @override
  void dispose() => _client.endSession();
}
