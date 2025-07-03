import 'package:http/http.dart' as http;
import 'package:openai_dart/openai_dart.dart';
import 'package:uuid/uuid.dart';

import '../chat_models.dart';
import '../tools_and_messages_helper.dart';
import 'openai_chat_options.dart';
import 'openai_mappers.dart';

/// Wrapper around [OpenAI Chat
/// API](https://platform.openai.com/docs/api-reference/chat).
class OpenAIChatModel extends ChatModel<OpenAIChatOptions>
    with ToolsAndMessagesHelper<OpenAIChatOptions> {
  /// Creates a [OpenAIChatModel] instance.
  OpenAIChatModel({
    String? model,
    super.tools,
    super.temperature,
    OpenAIChatOptions? defaultOptions,
    String? apiKey,
    String? organization,
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    http.Client? client,
  }) : _model = _validateModel(model),
       _client = OpenAIClient(
         apiKey: apiKey ?? '',
         organization: organization,
         baseUrl: baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client,
       ),
       super(
         model: _validateModel(model),
         defaultOptions: defaultOptions ?? const OpenAIChatOptions(),
       );

  static String _validateModel(String? model) {
    if (model != null && model.isEmpty) {
      throw ArgumentError(
        "Model cannot be empty. Pass null to use the provider's default model.",
      );
    }
    return model ?? defaultModelName;
  }

  /// A client for interacting with OpenAI API.
  final String _model;
  final OpenAIClient _client;

  /// A UUID generator.
  late final _uuid = const Uuid();

  /// Set or replace the API key.
  set apiKey(String value) => _client.apiKey = value;

  /// Get the API key.
  String get apiKey => _client.apiKey;

  /// The default model to use unless another is specified.
  static const defaultModelName = 'gpt-4o-mini';

  @override
  Stream<ChatResult<AIChatMessage>> rawStream(
    List<ChatMessage> messages, {
    OpenAIChatOptions? options,
  }) => _client
      .createChatCompletionStream(
        request: createChatCompletionRequest(
          messages,
          model: _model,
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
  void close() {
    _client.endSession();
  }

  @override
  String get name => _model;
}
