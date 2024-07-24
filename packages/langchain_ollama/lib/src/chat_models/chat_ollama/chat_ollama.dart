import 'package:http/http.dart' as http;
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_tiktoken/langchain_tiktoken.dart';
import 'package:ollama_dart/ollama_dart.dart';
import 'package:uuid/uuid.dart';

import 'mappers.dart';
import 'types.dart';

/// Wrapper around [Ollama](https://ollama.ai) Chat API that enables
/// to interact with the LLMs in a chat-like fashion.
///
/// Ollama allows you to run open-source large language models,
/// such as Llama 3.1, Gemma 2 or LLaVA, locally.
///
/// For a complete list of supported models and model variants, see the
/// [Ollama model library](https://ollama.ai/library).
///
/// Example:
/// ```dart
/// final chatModel = ChatOllama();
/// final messages = [
///   ChatMessage.system('You are a helpful assistant that translates English to French.'),
///   ChatMessage.humanText('I love programming.'),
/// ];
/// final prompt = PromptValue.chat(messages);
/// final res = await llm.invoke(prompt);
/// ```
///
/// - [Ollama API docs](https://github.com/jmorganca/ollama/blob/main/docs/api.md#generate-a-completion)
///
/// If you need to use tools, consider using the [ChatOllamaTools] instead.
///
/// ### Setup
///
/// 1. Download and install [Ollama](https://ollama.ai)
/// 2. Fetch a model via `ollama pull <model family>`
///   * e.g., for Llama 3: `ollama pull llama3.1`
///
/// ### Ollama base URL
///
/// By default, [ChatOllama] uses 'http://localhost:11434/api' as base URL
/// (default Ollama API URL). But if you are running Ollama on a different
/// one, you can override it using the [baseUrl] parameter.
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
/// final chatModel = ChatOllama(
///   defaultOptions: const ChatOllamaOptions(
///     model: 'llama3',
///     temperature: 0,
///     format: 'json',
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
///   options: const ChatOllamaOptions(seed: 9999),
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
/// final chatModel = ChatOllama();
/// const outputParser = StringOutputParser();
/// final prompt1 = PromptTemplate.fromTemplate('How are you {name}?');
/// final prompt2 = PromptTemplate.fromTemplate('How old are you {name}?');
/// final chain = Runnable.fromMap({
///   'q1': prompt1 | chatModel.bind(const ChatOllamaOptions(model: 'llama3')) | outputParser,
///   'q2': prompt2| chatModel.bind(const ChatOllamaOptions(model: 'mistral')) | outputParser,
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
/// final client = ChatOllama(
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
/// final client = ChatOllama(
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
class ChatOllama extends BaseChatModel<ChatOllamaOptions> {
  /// Create a new [ChatOllama] instance.
  ///
  /// Main configuration options:
  /// - `baseUrl`: the base URL of Ollama API.
  /// - [ChatOllama.defaultOptions]
  ///
  /// Advance configuration options:
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  /// - [ChatOllama.encoding]
  ChatOllama({
    final String baseUrl = 'http://localhost:11434/api',
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    super.defaultOptions = const ChatOllamaOptions(
      model: 'llama3',
    ),
    this.encoding = 'cl100k_base',
  }) : _client = OllamaClient(
          baseUrl: baseUrl,
          headers: headers,
          queryParams: queryParams,
          client: client,
        );

  /// A client for interacting with Ollama API.
  final OllamaClient _client;

  /// The encoding to use by tiktoken when [tokenize] is called.
  ///
  /// Ollama does not provide any API to count tokens, so we use tiktoken
  /// to get an estimation of the number of tokens in a prompt.
  String encoding;

  /// A UUID generator.
  late final Uuid _uuid = const Uuid();

  @override
  String get modelType => 'chat-ollama';

  /// The default model to use unless another is specified.
  static const defaultModel = 'llama3';

  @override
  Future<ChatResult> invoke(
    final PromptValue input, {
    final ChatOllamaOptions? options,
  }) async {
    final id = _uuid.v4();
    final completion = await _client.generateChatCompletion(
      request: generateChatCompletionRequest(
        input.toChatMessages(),
        options: options,
        defaultOptions: defaultOptions,
      ),
    );
    return completion.toChatResult(id);
  }

  @override
  Stream<ChatResult> stream(
    final PromptValue input, {
    final ChatOllamaOptions? options,
  }) {
    final id = _uuid.v4();
    return _client
        .generateChatCompletionStream(
          request: generateChatCompletionRequest(
            input.toChatMessages(),
            options: options,
            defaultOptions: defaultOptions,
            stream: true,
          ),
        )
        .map(
          (final completion) => completion.toChatResult(id, streaming: true),
        );
  }

  /// Tokenizes the given prompt using tiktoken.
  ///
  /// Currently Ollama does not provide a tokenizer for the models it supports.
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
    final ChatOllamaOptions? options,
  }) async {
    final encoding = getEncoding(this.encoding);
    return encoding.encode(promptValue.toString());
  }

  @override
  void close() {
    _client.endSession();
  }
}
