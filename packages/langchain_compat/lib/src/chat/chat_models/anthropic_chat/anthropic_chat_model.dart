import 'package:anthropic_sdk_dart/anthropic_sdk_dart.dart' as a;
import 'package:http/http.dart' as http;

import '../chat_message.dart';
import '../chat_model.dart';
import '../chat_result.dart';
import '../tools_and_messages_helper.dart';
import 'anthropic_chat_options.dart';
import 'anthropic_mappers.dart';

/// Wrapper around [Anthropic Messages
/// API](https://docs.anthropic.com/en/api/messages) (aka Claude API).
class AnthropicChatModel extends ChatModel<AnthropicChatOptions>
    with ToolsAndMessagesHelper<AnthropicChatOptions> {
  /// Creates a [AnthropicChatModel] instance.
  AnthropicChatModel({
    String? model,
    super.tools,
    super.temperature,
    AnthropicChatOptions? defaultOptions,
    String? apiKey,
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    http.Client? client,
  }) : _model = _validateModel(model),
       _client = a.AnthropicClient(
         apiKey: apiKey ?? '',
         baseUrl: baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client,
       ),
       super(
         model: _validateModel(model),
         defaultOptions: defaultOptions ?? const AnthropicChatOptions(),
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

  /// A client for interacting with Anthropic API.
  final a.AnthropicClient _client;

  /// The default model to use unless another is specified.
  static const defaultModelName = 'claude-3-5-sonnet-20241022';

  /// The default max tokens to use unless another is specified.
  static const defaultMaxTokens = 1024;

  @override
  Stream<ChatResult<AIChatMessage>> rawStream(
    List<ChatMessage> messages, {
    AnthropicChatOptions? options,
  }) => _client
      .createMessageStream(
        request: createMessageRequest(
          messages,
          model: _model,
          tools: tools,
          temperature: temperature,
          options: options,
          defaultOptions: defaultOptions,
          stream: true,
        ),
      )
      .transform(MessageStreamEventTransformer());

  @override
  void close() {
    _client.endSession();
  }

  @override
  String get name => _model;
}
