import 'package:http/http.dart' as http;
import 'package:mistralai_dart/mistralai_dart.dart';

import '../../chat.dart';
import '../tools_and_messages_helper.dart';
import 'mistral_mappers.dart';

/// Wrapper around [Mistral AI](https://docs.mistral.ai) Chat Completions API.
class MistralChatModel extends ChatModel<MistralChatOptions>
    with ToolsAndMessagesHelper<MistralChatOptions> {
  /// Creates a [MistralChatModel] instance.
  MistralChatModel({
    String? model,
    super.tools,
    super.temperature,
    MistralChatOptions? defaultOptions,
    String? apiKey,
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    http.Client? client,
  }) : _model = _validateModel(model),
       _client = MistralAIClient(
         apiKey: apiKey ?? '',
         baseUrl: baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client,
       ),
       super(
         model: _validateModel(model),
         defaultOptions: defaultOptions ?? const MistralChatOptions(),
       ) {
    if (tools != null) {
      // TODO: Mistral doesn't support tools yet, waiting for a fix:
      // https://github.com/davidmigloz/langchain_dart/issues/653
      throw Exception('Tools are not supported by Mistral.');
    }
  }

  static String _validateModel(String? model) {
    if (model != null && model.isEmpty) {
      throw ArgumentError(
        "Model cannot be empty. Pass null to use the provider's default model.",
      );
    }
    return model ?? defaultModelName;
  }

  final String _model;

  /// A client for interacting with Mistral AI API.
  final MistralAIClient _client;

  /// The default model to use unless another is specified.
  static const defaultModelName = 'mistral-small';

  @override
  String get name => _model;

  @override
  Stream<ChatResult> rawStream(
    List<ChatMessage> messages, {
    MistralChatOptions? options,
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
      .map((completion) => completion.toChatResult());

  /// Creates a GenerateCompletionRequest from the given input.
  ChatCompletionRequest createChatCompletionRequest(
    List<ChatMessage> messages, {
    required String model,
    required MistralChatOptions defaultOptions,
    List<ToolSpec>? tools,
    double? temperature,
    MistralChatOptions? options,
    bool stream = false,
  }) => ChatCompletionRequest(
    model: ChatCompletionModel.modelId(model),
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
  void close() {
    _client.endSession();
  }
}
