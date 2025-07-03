import 'package:http/http.dart' as http;
import 'package:ollama_dart/ollama_dart.dart' show OllamaClient;
import 'package:uuid/uuid.dart';

import '../chat_models.dart';
import '../tools_and_messages_helper.dart';
import 'ollama_mappers.dart' as ollama_mappers;

export 'ollama_chat_options.dart';

/// Wrapper around [Ollama](https://ollama.ai) Chat API that enables to interact
/// with the LLMs in a chat-like fashion.
class OllamaChatModel extends ChatModel<OllamaChatOptions>
    with ToolsAndMessagesHelper<OllamaChatOptions> {
  /// Creates a [OllamaChatModel] instance.
  OllamaChatModel({
    String? model,
    super.tools,
    super.temperature,
    OllamaChatOptions? defaultOptions,
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    http.Client? client,
  }) : _model = _validateModel(model),
       _client = OllamaClient(
         baseUrl: baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client,
       ),
       super(
         model: _validateModel(model),
         defaultOptions: defaultOptions ?? const OllamaChatOptions(),
       );

  static String _validateModel(String? model) {
    if (model != null && model.isEmpty) {
      throw ArgumentError(
        "Model cannot be empty. Pass null to use the provider's default model.",
      );
    }
    return model ?? defaultModelName;
  }

  final String _model;

  /// A client for interacting with Ollama API.
  final OllamaClient _client;

  /// A UUID generator.
  late final _uuid = const Uuid();

  @override
  String get name => _model;

  /// The default model to use unless another is specified.
  ///
  /// Note: llama3.x models have a known issue with spurious content in tool
  /// calling responses, generating unwanted JSON fragments like '",
  /// "parameters": {}}' during streaming. qwen2.5:7b-instruct provides cleaner
  /// tool calling behavior.
  static const defaultModelName = 'qwen2.5:7b-instruct';

  @override
  Stream<ChatResult<AIChatMessage>> rawStream(
    List<ChatMessage> messages, {
    OllamaChatOptions? options,
  }) => _client
      .generateChatCompletionStream(
        request: ollama_mappers.generateChatCompletionRequest(
          messages,
          model: _model,
          options: options,
          defaultOptions: defaultOptions,
          tools: tools,
          temperature: temperature,
          stream: true,
        ),
      )
      .map(
        (completion) => ollama_mappers.ChatResultMapper(
          completion,
        ).toChatResult(_uuid.v4()),
      );

  @override
  void close() => _client.endSession();
}
