import 'package:googleai_dart/googleai_dart.dart';
import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:uuid/uuid.dart';

import 'models/mappers.dart';
import 'models/models.dart';

/// Wrapper around [Google AI for Developers](https://ai.google.dev/) API
/// (aka Gemini API).
///
/// Example:
/// ```dart
/// final chatModel = ChatGoogleGenerativeAI(apiKey: '...');
/// final messages = [
///   ChatMessage.humanText('Tell me a joke.'),
/// ];
/// final prompt = PromptValue.chat(messages);
/// final res = await llm.invoke(prompt);
/// ```
///
/// - [Google AI API docs](https://ai.google.dev/docs)
///
/// ### Setup
///
/// To use `ChatGoogleGenerativeAI` you need to have an API key.
/// You can get one [here](https://makersuite.google.com/app/apikey).
///
/// ### Available models
///
/// The following models are available at the moment:
/// - `gemini-pro`: text -> text model
/// - `gemini-pro-vision`: text / image -> text model
///
/// Mind that this list may not be up-to-date.
/// Refer to the [documentation](https://ai.google.dev/models) for the updated list.
///
/// ### Call options
///
/// You can configure the parameters that will be used when calling the
/// chat completions API in several ways:
///
/// **Default options:**
///
/// Use the [defaultOptions] parameter to set the default options. These
/// options will be used unless you override them when generating completions.
///
/// ```dart
/// final chatModel = ChatGoogleGenerativeAI(
///   defaultOptions: const ChatGoogleGenerativeAIOptions(
///     model: 'gemini-pro-vision',
///     temperature: 0,
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
///   options: const ChatGoogleGenerativeAIOptions(temperature: 1),
/// );
/// ```
///
/// **Bind:**
///
/// You can also change the options in a [Runnable] pipeline using the bind
/// method.
///
/// In this example, we are using two totally different models for each
/// question:
///
/// ```dart
/// final chatModel = ChatGoogleGenerativeAI(apiKey: '...');
/// const outputParser = StringOutputParser();
/// final prompt1 = PromptTemplate.fromTemplate('How are you {name}?');
/// final prompt2 = PromptTemplate.fromTemplate('How old are you {name}?');
/// final chain = Runnable.fromMap({
///   'q1': prompt1 | chatModel.bind(const ChatGoogleGenerativeAIOptions(model: 'gemini-pro')) | outputParser,
///   'q2': prompt2 | chatModel.bind(const ChatGoogleGenerativeAIOptions(model: 'gemini-pro-vision')) | outputParser,
/// });
/// final res = await chain.invoke({'name': 'David'});
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
/// final client = ChatGoogleGenerativeAI(
///   apiKey: 'GOOGLE_AI_API_KEY',
///   client: MyHttpClient(),
/// );
/// ```
///
/// #### Using a proxy
///
/// ##### HTTP proxy
///
/// You can use your own HTTP proxy by overriding the `baseUrl` and providing
/// your required `headers`:
///
/// ```dart
/// final client = ChatGoogleGenerativeAI(
///   baseUrl: 'https://my-proxy.com',
///   headers: {'x-my-proxy-header': 'value'},
///   queryParams: {'x-my-proxy-query-param': 'value'},
/// );
/// ```
///
/// If you need further customization, you can always provide your own
/// `http.Client`.
///
/// ##### SOCKS5 proxy
///
/// To use a SOCKS5 proxy, you can use the
/// [`socks5_proxy`](https://pub.dev/packages/socks5_proxy) package and a
/// custom `http.Client`.
class ChatGoogleGenerativeAI
    extends BaseChatModel<ChatGoogleGenerativeAIOptions> {
  /// Create a new [ChatGoogleGenerativeAI] instance.
  ///
  /// Main configuration options:
  /// - `apiKey`: your Google AI API key. You can find your API key in the
  ///   [Google AI Studio dashboard](https://makersuite.google.com/app/apikey).
  /// - [ChatGoogleGenerativeAI.defaultOptions]
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to Mistral AI's API URL. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  ChatGoogleGenerativeAI({
    final String? apiKey,
    final String? baseUrl,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    this.defaultOptions = const ChatGoogleGenerativeAIOptions(
      model: 'gemini-pro',
    ),
  }) : _client = GoogleAIClient(
          apiKey: apiKey,
          baseUrl: baseUrl,
          headers: headers,
          queryParams: queryParams,
          client: client,
        );

  /// A client for interacting with Google AI API.
  final GoogleAIClient _client;

  /// The default options to use when calling the chat completions API.
  ChatGoogleGenerativeAIOptions defaultOptions;

  /// A UUID generator.
  late final Uuid _uuid = const Uuid();

  @override
  String get modelType => 'chat-google-generative-ai';

  @override
  Future<ChatResult> generate(
    final List<ChatMessage> messages, {
    final ChatGoogleGenerativeAIOptions? options,
  }) async {
    final id = _uuid.v4();
    final model =
        options?.model ?? defaultOptions.model ?? throwNullModelError();
    final completion = await _client.generateContent(
      modelId: model,
      request: _generateCompletionRequest(messages, options: options),
    );
    return completion.toChatResult(id, model);
  }

  @override
  Stream<ChatResult> stream(
    final PromptValue input, {
    final ChatGoogleGenerativeAIOptions? options,
  }) {
    throw UnimplementedError('Streaming is not supported yet');
  }

  @override
  Stream<ChatResult> streamFromInputStream(
    final Stream<PromptValue> inputStream, {
    final ChatGoogleGenerativeAIOptions? options,
  }) {
    return inputStream.asyncExpand((final input) {
      return stream(input, options: options);
    });
  }

  /// Creates a [GenerateContentRequest] from the given input.
  GenerateContentRequest _generateCompletionRequest(
    final List<ChatMessage> messages, {
    final ChatGoogleGenerativeAIOptions? options,
  }) {
    return GenerateContentRequest(
      contents: messages.toContentList(),
      generationConfig: GenerationConfig(
        topP: options?.topP ?? defaultOptions.topP,
        topK: options?.topK ?? defaultOptions.topK,
        candidateCount:
            options?.candidateCount ?? defaultOptions.candidateCount,
        maxOutputTokens:
            options?.maxOutputTokens ?? defaultOptions.maxOutputTokens,
        temperature: options?.temperature ?? defaultOptions.temperature,
        stopSequences: options?.stopSequences ?? defaultOptions.stopSequences,
      ),
      safetySettings: (options?.safetySettings ?? defaultOptions.safetySettings)
          ?.toSafetySettings(),
    );
  }

  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final ChatGoogleGenerativeAIOptions? options,
  }) async {
    throw UnsupportedError(
      'Google AI does not expose a tokenizer, only counting tokens is supported.',
    );
  }

  @override
  Future<int> countTokens(
    final PromptValue promptValue, {
    final ChatGoogleGenerativeAIOptions? options,
  }) async {
    final tokens = await _client.countTokens(
      modelId: options?.model ?? defaultOptions.model ?? throwNullModelError(),
      request: CountTokensRequest(
        contents: promptValue.toChatMessages().toContentList(),
      ),
    );
    return tokens.totalTokens ?? 0;
  }

  /// Closes the client and cleans up any resources associated with it.
  void close() {
    _client.endSession();
  }
}
