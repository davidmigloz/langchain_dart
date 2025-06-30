import 'package:http/http.dart' as http;
import 'package:langchain_tiktoken/langchain_tiktoken.dart';

import '../../../chat_models.dart';
import '../../../prompts.dart';
import '../../anthropic_sdk_dart/anthropic_sdk_dart.dart' as a;
import '../../runnables/runnable.dart' show Runnable;
import '../../runnables/runnables.dart' show Runnable;
import './mappers.dart';

/// Wrapper around [Anthropic Messages API](https://docs.anthropic.com/en/api/messages)
/// (aka Claude API).
///
/// Example:
/// ```dart
/// final chatModel = ChatAnthropic(apiKey: '...');
/// final messages = [
///   ChatMessage.system(
///     'You are a helpful assistant that translates English to French.',
///   ),
///   ChatMessage.humanText('I love programming.'),
/// ];
/// final prompt = PromptValue.chat(messages);
/// final res = await llm.invoke(prompt);
/// ```
///
/// - Docs: https://docs.anthropic.com
///
/// ### Authentication
///
/// The Anthropic API uses API keys for authentication. Visit your
/// [API Keys](https://console.anthropic.com/settings/keys) page to retrieve
/// the API key you'll use in your requests.
///
/// ### Available models
///
/// The following models are available:
/// - `claude-3-5-sonnet-20240620`
/// - `claude-3-haiku-20240307`
/// - `claude-3-opus-20240229`
/// - `claude-3-sonnet-20240229`
/// - `claude-2.0`
/// - `claude-2.1`
///
/// Mind that the list may not be up-to-date.
/// See https://docs.anthropic.com/en/docs/about-claude/models for the updated list.
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
/// final chatModel = ChatAnthropic(
///   apiKey: anthropicApiKey,
///   defaultOptions: const ChatAnthropicOptions(
///     temperature: 0.9,
///     maxTokens: 100,
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
///   options: const ChatAnthropicOptions(temperature: 0.5),
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
/// final chatModel = ChatAnthropic(apiKey: anthropicApiKey);
/// const outputParser = StringOutputParser();
/// final prompt1 = PromptTemplate.fromTemplate('How are you {name}?');
/// final prompt2 = PromptTemplate.fromTemplate('How old are you {name}?');
/// final chain = Runnable.fromMap({
///   'q1': prompt1 |
///     chatModel.bind(
///       const ChatAnthropicOptions(model: 'claude-3-5-sonnet-20241022'),
///     ) |
///     outputParser,
///   'q2': prompt2 |
///     chatModel.bind(
///       const ChatAnthropicOptions(model: 'claude-3-sonnet-20240229'),
///     ) |
///     outputParser,
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
/// final client = ChatAnthropic(
///   apiKey: 'ANTHROPIC_API_KEY',
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
/// final client = ChatAnthropic(
///   baseUrl: 'https://my-proxy.com',
///   headers: {'x-my-proxy-header': 'value'},
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
class ChatAnthropic extends BaseChatModel<ChatAnthropicOptions> {
  /// Create a new [ChatAnthropic] instance.
  ///
  /// Main configuration options:
  /// - `apiKey`: your Anthropic API key. You can find your API key in the
  ///   [Anthropic dashboard](https://console.anthropic.com/settings/keys).
  /// - [ChatAnthropic.encoding]
  /// - [ChatAnthropic.defaultOptions]
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to Anthropic's API URL. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  ChatAnthropic({
    String? apiKey,
    String baseUrl = 'https://api.anthropic.com/v1',
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    http.Client? client,
    super.defaultOptions = const ChatAnthropicOptions(
      model: defaultModel,
      maxTokens: defaultMaxTokens,
    ),
    this.encoding = 'cl100k_base',
  }) : _client = a.AnthropicClient(
         apiKey: apiKey ?? '',
         baseUrl: baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client,
       );

  /// A client for interacting with Anthropic API.
  final a.AnthropicClient _client;

  /// The encoding to use by tiktoken when [tokenize] is called.
  ///
  /// Anthropic does not provide any API to count tokens, so we use tiktoken
  /// to get an estimation of the number of tokens in a prompt.
  String encoding;

  @override
  String get modelType => 'anthropic-chat';

  /// The default model to use unless another is specified.
  static const defaultModel = 'claude-3-5-sonnet-20241022';

  /// The default max tokens to use unless another is specified.
  static const defaultMaxTokens = 1024;

  @override
  Future<ChatResult> invoke(
    PromptValue input, {
    ChatAnthropicOptions? options,
  }) async {
    final completion = await _client.createMessage(
      request: createMessageRequest(
        input.toChatMessages(),
        options: options,
        defaultOptions: defaultOptions,
      ),
    );
    return completion.toChatResult();
  }

  @override
  Stream<ChatResult> stream(
    PromptValue input, {
    ChatAnthropicOptions? options,
  }) => _client
      .createMessageStream(
        request: createMessageRequest(
          input.toChatMessages(),
          options: options,
          defaultOptions: defaultOptions,
          stream: true,
        ),
      )
      .transform(MessageStreamEventTransformer());

  /// Tokenizes the given prompt using tiktoken.
  ///
  /// Currently Anthropic does not provide a tokenizer for the models it
  /// supports. So we use tiktoken and [encoding] model to get an approximation
  /// for counting tokens. Mind that the actual tokens will be totally different
  /// from the ones used by the Anthropic model.
  ///
  /// If an encoding model is specified in [encoding] field, that encoding is
  /// used instead.
  ///
  /// - [promptValue] The prompt to tokenize.
  @override
  Future<List<int>> tokenize(
    PromptValue promptValue, {
    ChatAnthropicOptions? options,
  }) async {
    final encoding = getEncoding(this.encoding);
    return encoding.encode(promptValue.toString());
  }

  @override
  void close() {
    _client.endSession();
  }

  @override
  String get name => defaultOptions.model ?? defaultModel;
}
