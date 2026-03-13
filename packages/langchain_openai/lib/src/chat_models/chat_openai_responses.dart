import 'package:http/http.dart' as http;
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:openai_dart/openai_dart.dart';

import '../utils/auth.dart';
import 'chat_openai_responses_mappers.dart';
import 'chat_openai_responses_types.dart';

/// Wrapper around [OpenAI Responses API](https://platform.openai.com/docs/api-reference/responses).
///
/// The Responses API is OpenAI's most advanced interface for generating model
/// responses. It supports text and image inputs, and text outputs. It also
/// supports multi-turn conversations via [ChatOpenAIResponsesOptions.previousResponseId].
///
/// Example:
/// ```dart
/// final chatModel = ChatOpenAIResponses(apiKey: '...');
/// final messages = [
///   ChatMessage.system('You are a helpful assistant.'),
///   ChatMessage.humanText('I love programming.'),
/// ];
/// final prompt = PromptValue.chat(messages);
/// final res = await chatModel.invoke(prompt);
/// ```
///
/// ### Call options
///
/// You can configure the parameters that will be used when calling the
/// Responses API in several ways:
///
/// **Default options:**
///
/// Use the [defaultOptions] parameter to set the default options. These
/// options will be used unless you override them when generating completions.
///
/// ```dart
/// final chatModel = ChatOpenAIResponses(
///   apiKey: openaiApiKey,
///   defaultOptions: const ChatOpenAIResponsesOptions(
///     temperature: 0.9,
///     maxOutputTokens: 100,
///   ),
/// );
/// ```
///
/// **Call options:**
///
/// You can override the default options when invoking the model:
///
/// ```dart
/// final res = await chatModel.invoke(
///   prompt,
///   options: const ChatOpenAIResponsesOptions(
///     reasoningEffort: ChatOpenAIResponsesReasoningEffort.high,
///   ),
/// );
/// ```
///
/// ### Multi-turn conversations
///
/// The Responses API supports multi-turn conversations using
/// [ChatOpenAIResponsesOptions.previousResponseId]:
///
/// ```dart
/// final res1 = await chatModel.invoke(prompt1);
/// final responseId = res1.id;
/// final res2 = await chatModel.invoke(
///   prompt2,
///   options: ChatOpenAIResponsesOptions(previousResponseId: responseId),
/// );
/// ```
///
/// ### Authentication
///
/// The OpenAI API uses API keys for authentication. Visit your
/// [API Keys](https://platform.openai.com/account/api-keys) page to retrieve
/// the API key you'll use in your requests.
///
/// #### Organization (optional)
///
/// For users who belong to multiple organizations, you can specify which
/// organization is used for an API request.
///
/// ```dart
/// final client = ChatOpenAIResponses(
///   apiKey: 'OPENAI_API_KEY',
///   organization: 'org-dtDDtkEGoFccn5xaP5W1p3Rr',
/// );
/// ```
///
/// ### Advance
///
/// #### Custom HTTP client
///
/// You can always provide your own implementation of `http.Client` for further
/// customization:
///
/// ```dart
/// final client = ChatOpenAIResponses(
///   apiKey: 'OPENAI_API_KEY',
///   client: MyHttpClient(),
/// );
/// ```
///
/// #### Using a proxy
///
/// You can use your own HTTP proxy by overriding the `baseUrl` and providing
/// your required `headers`:
///
/// ```dart
/// final client = ChatOpenAIResponses(
///   baseUrl: 'https://my-proxy.com',
///   headers: {'x-my-proxy-header': 'value'},
/// );
/// ```
class ChatOpenAIResponses extends BaseChatModel<ChatOpenAIResponsesOptions> {
  /// Create a new [ChatOpenAIResponses] instance.
  ///
  /// Main configuration options:
  /// - `apiKey`: your OpenAI API key. You can find your API key in the
  ///   [OpenAI dashboard](https://platform.openai.com/account/api-keys).
  /// - `organization`: your OpenAI organization ID (if applicable).
  /// - [ChatOpenAIResponses.defaultOptions]
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to OpenAI's API URL. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  ChatOpenAIResponses({
    final String? apiKey,
    final String? organization,
    final String baseUrl = 'https://api.openai.com/v1',
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    super.defaultOptions = const ChatOpenAIResponsesOptions(
      model: defaultModel,
    ),
  }) : _authProvider = MutableApiKeyProvider(apiKey ?? '') {
    _client = OpenAIClient(
      config: OpenAIConfig(
        authProvider: _authProvider,
        organization: organization,
        baseUrl: buildBaseUrl(baseUrl, queryParams) ?? baseUrl,
        defaultHeaders: headers ?? const {},
      ),
      httpClient: client,
    );
  }

  /// The mutable auth provider for API key management.
  final MutableApiKeyProvider _authProvider;

  /// A client for interacting with OpenAI API.
  late final OpenAIClient _client;

  /// Set or replace the API key.
  set apiKey(final String value) => _authProvider.apiKey = value;

  /// Get the API key.
  String get apiKey => _authProvider.apiKey;

  @override
  String get modelType => 'openai-responses';

  /// The default model to use unless another is specified.
  static const defaultModel = 'gpt-5-mini';

  @override
  Future<ChatResult> invoke(
    final PromptValue input, {
    final ChatOpenAIResponsesOptions? options,
  }) async {
    final response = await _client.responses.create(
      createResponseRequest(
        input.toChatMessages(),
        options: options,
        defaultOptions: defaultOptions,
      ),
    );
    return response.toChatResult();
  }

  @override
  Stream<ChatResult> stream(
    final PromptValue input, {
    final ChatOpenAIResponsesOptions? options,
  }) {
    return _client.responses
        .createStreamWithAccumulator(
          createResponseRequest(
            input.toChatMessages(),
            options: options,
            defaultOptions: defaultOptions,
          ),
        )
        .map(
          (final accumulator) => accumulator.toChatResult(),
        );
  }

  /// Lists the available models that can be used with [ChatOpenAIResponses].
  ///
  /// This method fetches all models from the OpenAI API and filters them
  /// to only return chat-capable models.
  ///
  /// Example:
  /// ```dart
  /// final chatModel = ChatOpenAIResponses(apiKey: '...');
  /// final models = await chatModel.listModels();
  /// for (final model in models) {
  ///   print('${model.id} - owned by ${model.ownedBy ?? "unknown"}');
  /// }
  /// ```
  @override
  Future<List<ModelInfo>> listModels() async {
    final response = await _client.models.list();
    return response.data
        .where(_isChatModel)
        .map(
          (final m) =>
              ModelInfo(id: m.id, ownedBy: m.ownedBy, created: m.created),
        )
        .toList();
  }

  /// Returns true if the model is a chat-capable model.
  static bool _isChatModel(final Model model) {
    final id = model.id.toLowerCase();

    // Exclude instruct models (completion API, not chat)
    if (id.contains('instruct')) return false;

    // Match chat model prefixes
    // o[1-9] covers o1, o3, and future o4, o5, etc.
    return id.startsWith('gpt-') ||
        RegExp(r'^o[1-9]').hasMatch(id) ||
        id.startsWith('chatgpt-');
  }

  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final ChatOpenAIResponsesOptions? options,
  }) {
    throw UnsupportedError(
      'ChatOpenAIResponses does not support tokenization.',
    );
  }

  @override
  void close() {
    _client.close();
  }
}
