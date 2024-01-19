import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:langchain_tiktoken/langchain_tiktoken.dart';
import 'package:mistralai_dart/mistralai_dart.dart';

import 'models/mappers.dart';
import 'models/models.dart';

/// Wrapper around [Mistral AI](https://docs.mistral.ai) Chat Completions API.
///
/// Mistral AI brings the strongest open generative models to the developers,
/// along with efficient ways to deploy and customise them for production.
///
/// Example:
/// ```dart
/// final chatModel = ChatMistralAI(apiKey: '...');
/// final messages = [
///   ChatMessage.system('You are a helpful assistant that translates English to French.'),
///   ChatMessage.humanText('I love programming.'),
/// ];
/// final prompt = PromptValue.chat(messages);
/// final res = await llm.invoke(prompt);
/// ```
///
/// - [Mistral AI API docs](https://docs.mistral.ai)
///
/// ### Setup
///
/// To use `ChatMistralAI` you need to have a Mistral AI account and an API key.
/// You can get one [here](https://console.mistral.ai/users).
///
/// ### Available models
///
/// The following models are available at the moment:
/// - `mistral-tiny`: Mistral 7B Instruct v0.2 (a minor release of Mistral 7B Instruct).
///    It only works in English and obtains 7.6 on MT-Bench.
/// - `mistral-small`: Mixtral 8x7B. It masters English/French/Italian/German/Spanish
///    and code and obtains 8.3 on MT-Bench.
/// - `mistral-medium`: a prototype model, that is currently among the top serviced models
///    available based on standard benchmarks. It masters English/French/Italian/German/Spanish
///    and code and obtains a score of 8.6 on MT-Bench.
///
/// Mind that this list may not be up-to-date.
/// Refer to the [documentation](https://docs.mistral.ai/models) for the updated list.
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
/// final chatModel = ChatMistralAI(
///   defaultOptions: const ChatMistralAIOptions(
///     model: 'mistral-medium',
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
///   options: const ChatMistralAIOptions(randomSeed: 9999),
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
/// final chatModel = ChatMistralAI(apiKey: '...');
/// const outputParser = StringOutputParser();
/// final prompt1 = PromptTemplate.fromTemplate('How are you {name}?');
/// final prompt2 = PromptTemplate.fromTemplate('How old are you {name}?');
/// final chain = Runnable.fromMap({
///   'q1': prompt1 | chatModel.bind(const ChatMistralAIOptions(model: 'mistral-tiny')) | outputParser,
///   'q2': prompt2| chatModel.bind(const ChatMistralAIOptions(model: 'mistral-medium')) | outputParser,
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
/// final client = ChatMistralAI(
///   apiKey: 'MISTRAL_AI_API_KEY',
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
/// final client = ChatMistralAI(
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
class ChatMistralAI extends BaseChatModel<ChatMistralAIOptions> {
  /// Create a new [ChatMistralAI] instance.
  ///
  /// Main configuration options:
  /// - `apiKey`: your Mistral AI API key. You can find your API key in the
  ///   [Mistral AI dashboard](https://console.mistral.ai/users).
  /// - [ChatMistralAI.defaultOptions]
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
  /// - [ChatMistralAI.encoding]
  ChatMistralAI({
    final String? apiKey,
    final String baseUrl = 'https://api.mistral.ai/v1',
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    this.defaultOptions = const ChatMistralAIOptions(
      model: 'mistral-small',
    ),
    this.encoding = 'cl100k_base',
  }) : _client = MistralAIClient(
          apiKey: apiKey,
          baseUrl: baseUrl,
          headers: headers,
          queryParams: queryParams,
          client: client,
        );

  /// A client for interacting with Mistral AI API.
  final MistralAIClient _client;

  /// The default options to use when calling the chat completions API.
  ChatMistralAIOptions defaultOptions;

  /// The encoding to use by tiktoken when [tokenize] is called.
  ///
  /// Mistral does not provide any API to count tokens, so we use tiktoken
  /// to get an estimation of the number of tokens in a prompt.
  String encoding;

  @override
  String get modelType => 'chat-mistralai';

  @override
  Future<ChatResult> generate(
    final List<ChatMessage> messages, {
    final ChatMistralAIOptions? options,
  }) async {
    final completion = await _client.createChatCompletion(
      request: _generateCompletionRequest(messages, options: options),
    );
    return completion.toChatResult();
  }

  @override
  Stream<ChatResult> stream(
    final PromptValue input, {
    final ChatMistralAIOptions? options,
  }) {
    return _client
        .createChatCompletionStream(
          request: _generateCompletionRequest(
            input.toChatMessages(),
            options: options,
          ),
        )
        .map((final completion) => completion.toChatResult());
  }

  @override
  Stream<ChatResult> streamFromInputStream(
    final Stream<PromptValue> inputStream, {
    final ChatMistralAIOptions? options,
  }) {
    return inputStream.asyncExpand((final input) {
      return stream(input, options: options);
    });
  }

  /// Creates a [GenerateCompletionRequest] from the given input.
  ChatCompletionRequest _generateCompletionRequest(
    final List<ChatMessage> messages, {
    final bool stream = false,
    final ChatMistralAIOptions? options,
  }) {
    return ChatCompletionRequest(
      model: ChatCompletionModel.modelId(
        options?.model ?? defaultOptions.model ?? throwNullModelError(),
      ),
      messages: messages.toChatCompletionMessages(),
      temperature: options?.temperature ?? defaultOptions.temperature,
      topP: options?.topP ?? defaultOptions.topP,
      maxTokens: options?.maxTokens ?? defaultOptions.maxTokens,
      safePrompt: options?.safePrompt ?? defaultOptions.safePrompt,
      randomSeed: options?.randomSeed ?? defaultOptions.randomSeed,
      stream: stream,
    );
  }

  /// Tokenizes the given prompt using tiktoken.
  ///
  /// Currently Mistral AI does not provide a tokenizer for the models it supports.
  /// So we use tiktoken and [encoding] model to get an approximation
  /// for counting tokens. Mind that the actual tokens will be totally
  /// different from the ones used by the Ollama model.
  ///
  /// If an encoding model is specified in [encoding] field, that
  /// encoding is used instead.
  ///
  /// - [promptValue] The prompt to tokenize.
  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final ChatMistralAIOptions? options,
  }) async {
    final encoding = getEncoding(this.encoding);
    return encoding.encode(promptValue.toString());
  }

  /// Closes the client and cleans up any resources associated with it.
  void close() {
    _client.endSession();
  }
}
