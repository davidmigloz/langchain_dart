import 'package:http/http.dart' as http;
import 'package:langchain_tiktoken/langchain_tiktoken.dart';
import 'package:ollama_dart/ollama_dart.dart' show OllamaClient;
import 'package:uuid/uuid.dart';

import '../../prompts/types.dart';
import '../../runnables/runnable.dart' show Runnable;
import '../../runnables/runnables.dart' show Runnable;
import '../base.dart';
import '../types.dart';
import './types.dart';
import 'mappers.dart' as ollama_mappers;

export 'types.dart';

/// Wrapper around [Ollama](https://ollama.ai) Chat API that enables
/// to interact with the LLMs in a chat-like fashion.
///
/// Ollama allows you to run open-source large language models,
/// such as Llama 3.2, Gemma 2 or LLaVA, locally.
///
/// For a complete list of supported models and model variants, see the
/// [Ollama model library](https://ollama.ai/library).
///
/// Example:
/// ```dart
/// final chatModel = ChatOllama();
/// final messages = [
///   ChatMessage.system(
///     'You are a helpful assistant that translates English to French.'
///   ),
///   ChatMessage.humanText('I love programming.'),
/// ];
/// final prompt = PromptValue.chat(messages);
/// final res = await llm.invoke(prompt);
/// ```
///
/// - [Ollama API docs](https://github.com/jmorganca/ollama/blob/main/docs/api.md#generate-a-completion)
///
/// ### Setup
///
/// 1. Download and install [Ollama](https://ollama.ai)
/// 2. Fetch a model via `ollama pull <model family>`
///   * e.g., for Llama 3: `ollama pull llama3.2`
///
/// ### Ollama base URL
///
/// By default, [ChatOllama] uses 'http://localhost:11434/api' as base URL
/// (default Ollama API URL). But if you are running Ollama on a different
/// one, you can override it using the baseUrl parameter.
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
///     model: 'llama3.2',
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
///   'q1': prompt1 |
///       chatModel.bind(const ChatOllamaOptions(model: 'llama3.2')) |
///       outputParser,
///   'q2': prompt2 |
///       chatModel.bind(const ChatOllamaOptions(model: 'mistral')) |
///       outputParser,
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
  /// Creates a [ChatOllama] instance.
  ChatOllama({
    String? model,
    super.tools,
    super.temperature,
    ChatOllamaOptions? defaultOptions,
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
         defaultOptions: defaultOptions ?? const ChatOllamaOptions(),
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

  /// The encoding to use by tiktoken when [tokenize] is called.
  ///
  /// Ollama does not provide any API to count tokens, so we use tiktoken
  /// to get an estimation of the number of tokens in a prompt.
  String encoding = 'cl100k_base';

  /// A UUID generator.
  late final _uuid = const Uuid();

  @override
  String get modelType => 'chat-ollama';

  @override
  String get name => _model;

  /// The default model to use unless another is specified.
  static const defaultModelName = 'llama3.1';

  @override
  Future<ChatResult> invoke(
    PromptValue input, {
    ChatOllamaOptions? options,
  }) async {
    final completion = await _client.generateChatCompletion(
      request: ollama_mappers.generateChatCompletionRequest(
        input.toChatMessages(),
        model: _model,
        options: options,
        defaultOptions: defaultOptions,
        tools: tools,
        temperature: temperature,
      ),
    );
    final id = _uuid.v4();
    return ollama_mappers.ChatResultMapper(completion).toChatResult(id);
  }

  @override
  Stream<ChatResult> stream(PromptValue input, {ChatOllamaOptions? options}) =>
      _client
          .generateChatCompletionStream(
            request: ollama_mappers.generateChatCompletionRequest(
              input.toChatMessages(),
              model: _model,
              options: options,
              defaultOptions: defaultOptions,
              tools: tools,
              temperature: temperature,
              stream: true,
            ),
          )
          .map((completion) {
            final id = _uuid.v4();
            return ollama_mappers.ChatResultMapper(
              completion,
            ).toChatResult(id, streaming: true);
          });

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
    PromptValue promptValue, {
    ChatOllamaOptions? options,
  }) async {
    final encoding = getEncoding(this.encoding);
    return encoding.encode(promptValue.toString());
  }

  @override
  void close() {
    _client.endSession();
  }
}
