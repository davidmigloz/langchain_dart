import 'package:http/http.dart' as http;
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_tiktoken/langchain_tiktoken.dart';

import '../client/client.dart';
import 'mappers.dart';
import 'types.dart';

/// Wrapper around the [Cohere](https://docs.cohere.com) v2 Chat API.
///
/// Cohere builds enterprise-grade frontier models (the Command family)
/// optimized for retrieval-augmented generation and tool use.
///
/// Example:
/// ```dart
/// final chatModel = ChatCohere(apiKey: '...');
/// final messages = [
///   ChatMessage.system('You are a helpful assistant that translates English to French.'),
///   ChatMessage.humanText('I love programming.'),
/// ];
/// final prompt = PromptValue.chat(messages);
/// final res = await chatModel.invoke(prompt);
/// ```
///
/// - [Cohere Chat API docs](https://docs.cohere.com/reference/chat)
///
/// ### Setup
///
/// To use `ChatCohere` you need to have a Cohere account and an API key.
/// You can get one [here](https://dashboard.cohere.com/api-keys).
///
/// ### Available models
///
/// The following models are available at the moment:
/// - `command-a-03-2025`: Cohere's most performant model to date, excelling at
///    tool use, agents, RAG and multilingual use cases.
/// - `command-r-plus-08-2024`: a high-quality model optimized for complex RAG
///    workflows and multi-step tool use.
/// - `command-r-08-2024`: a smaller, faster model balancing quality and cost.
/// - `command-r7b-12-2024`: the smallest model of the R family, ideal for
///    high-throughput use cases.
///
/// Mind that this list may not be up-to-date.
/// Refer to the [documentation](https://docs.cohere.com/docs/models) for the updated list.
///
/// ### Call options
///
/// You can configure the parameters that will be used when calling the
/// chat API in several ways:
///
/// **Default options:**
///
/// Use the [defaultOptions] parameter to set the default options. These
/// options will be used unless you override them when generating completions.
///
/// ```dart
/// final chatModel = ChatCohere(
///   defaultOptions: const ChatCohereOptions(
///     model: 'command-a-03-2025',
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
///   options: const ChatCohereOptions(seed: 9999),
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
/// final chatModel = ChatCohere(apiKey: '...');
/// const outputParser = StringOutputParser();
/// final prompt1 = PromptTemplate.fromTemplate('How are you {name}?');
/// final prompt2 = PromptTemplate.fromTemplate('How old are you {name}?');
/// final chain = Runnable.fromMap({
///   'q1': prompt1 | chatModel.bind(const ChatCohereOptions(model: 'command-r7b-12-2024')) | outputParser,
///   'q2': prompt2| chatModel.bind(const ChatCohereOptions(model: 'command-a-03-2025')) | outputParser,
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
/// final client = ChatCohere(
///   apiKey: 'COHERE_API_KEY',
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
/// final client = ChatCohere(
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
class ChatCohere extends BaseChatModel<ChatCohereOptions> {
  /// Create a new [ChatCohere] instance.
  ///
  /// Main configuration options:
  /// - `apiKey`: your Cohere API key. You can find your API key in the
  ///   [Cohere dashboard](https://dashboard.cohere.com/api-keys).
  /// - [ChatCohere.defaultOptions]
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to Cohere's API URL. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  /// - [ChatCohere.encoding]
  ChatCohere({
    final String? apiKey,
    final String baseUrl = 'https://api.cohere.com',
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    super.defaultOptions = const ChatCohereOptions(model: defaultModel),
    this.encoding = 'cl100k_base',
  }) : _client = CohereClient(
         apiKey: apiKey,
         baseUrl: baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client,
       );

  /// A client for interacting with the Cohere API.
  final CohereClient _client;

  /// The encoding to use by tiktoken when [tokenize] is called.
  ///
  /// Cohere does not provide any tokenizer that runs locally, so we use
  /// tiktoken to get an estimation of the number of tokens in a prompt.
  String encoding;

  @override
  String get modelType => 'chat-cohere';

  /// The default model to use unless another is specified.
  static const defaultModel = 'command-r-plus-08-2024';

  @override
  Future<ChatResult> invoke(
    final PromptValue input, {
    final ChatCohereOptions? options,
  }) async {
    final model = options?.model ?? defaultOptions.model ?? defaultModel;
    final response = await _client.chat(
      request: _generateChatRequest(
        input.toChatMessages(),
        model: model,
        options: options,
      ),
    );
    return response.toChatResult(model: model);
  }

  @override
  Stream<ChatResult> stream(
    final PromptValue input, {
    final ChatCohereOptions? options,
  }) async* {
    final model = options?.model ?? defaultOptions.model ?? defaultModel;
    final events = _client.chatStream(
      request: _generateChatRequest(
        input.toChatMessages(),
        model: model,
        stream: true,
        options: options,
      ),
    );

    var id = '';
    final toolPlan = StringBuffer();
    await for (final event in events) {
      switch (event.type) {
        case 'message-start':
          id = event.id ?? '';
        case 'tool-plan-delta':
          // Accumulate Cohere's tool-planning text so it can be surfaced in
          // the terminal `message-end` metadata, matching the non-streaming
          // `invoke()` path (see mappers.dart `toChatResult`).
          toolPlan.write(event.toolPlanDelta ?? '');
        case 'content-delta':
          yield ChatResult(
            id: id,
            output: AIChatMessage(
              content: [
                AIChatMessageTextBlock(
                  text: event.textDelta ?? '',
                  // The shared [index] merges consecutive text deltas into a
                  // single visible text block when concatenating the stream.
                  index: event.index,
                ),
              ],
            ),
            finishReason: FinishReason.unspecified,
            metadata: {'model': model},
            usage: const LanguageModelUsage(),
            streaming: true,
          );
        case 'tool-call-start':
          yield ChatResult(
            id: id,
            output: AIChatMessage(
              content: [
                AIChatMessageToolCall(
                  id: event.toolCallId ?? '',
                  name: event.toolCallName ?? '',
                  argumentsRaw: event.toolCallArgumentsDelta ?? '',
                  arguments: const {},
                  index: event.index,
                ),
              ],
            ),
            finishReason: FinishReason.unspecified,
            metadata: {'model': model},
            usage: const LanguageModelUsage(),
            streaming: true,
          );
        case 'tool-call-delta':
          yield ChatResult(
            id: id,
            output: AIChatMessage(
              content: [
                AIChatMessageToolCall(
                  // The id and name are empty; the shared [index] merges this
                  // delta into the tool call opened by the matching
                  // `tool-call-start` event when concatenating the stream.
                  id: '',
                  name: '',
                  argumentsRaw: event.toolCallArgumentsDelta ?? '',
                  arguments: const {},
                  index: event.index,
                ),
              ],
            ),
            finishReason: FinishReason.unspecified,
            metadata: {'model': model},
            usage: const LanguageModelUsage(),
            streaming: true,
          );
        case 'message-end':
          yield ChatResult(
            id: id,
            output: const AIChatMessage(content: []),
            finishReason: mapCohereFinishReason(event.finishReason),
            metadata: {
              'model': model,
              if (toolPlan.isNotEmpty) 'tool_plan': toolPlan.toString(),
            },
            usage:
                event.usage?.toLanguageModelUsage() ??
                const LanguageModelUsage(),
            streaming: true,
          );
        default:
          // content-start, content-end, tool-call-end, citation events, etc.
          // carry no payload relevant to this integration.
          continue;
      }
    }
  }

  /// Creates a [CohereChatRequest] from the given input.
  CohereChatRequest _generateChatRequest(
    final List<ChatMessage> messages, {
    required final String model,
    final bool stream = false,
    final ChatCohereOptions? options,
  }) {
    final tools = options?.tools ?? defaultOptions.tools;
    final toolChoice = options?.toolChoice ?? defaultOptions.toolChoice;

    return CohereChatRequest(
      model: model,
      messages: messages.toCohereMessages(),
      temperature: options?.temperature ?? defaultOptions.temperature,
      p: options?.topP ?? defaultOptions.topP,
      k: options?.topK ?? defaultOptions.topK,
      maxTokens: options?.maxTokens ?? defaultOptions.maxTokens,
      stopSequences: options?.stopSequences ?? defaultOptions.stopSequences,
      seed: options?.seed ?? defaultOptions.seed,
      frequencyPenalty:
          options?.frequencyPenalty ?? defaultOptions.frequencyPenalty,
      presencePenalty:
          options?.presencePenalty ?? defaultOptions.presencePenalty,
      tools: tools?.toCohereTools(),
      toolChoice: toolChoice?.toCohereToolChoice(),
      stream: stream,
    );
  }

  /// Tokenizes the given prompt using tiktoken.
  ///
  /// Currently Cohere does not provide a tokenizer that runs locally.
  /// So we use tiktoken and [encoding] model to get an approximation
  /// for counting tokens. Mind that the actual tokens will be totally
  /// different from the ones used by the Cohere model.
  ///
  /// If an encoding model is specified in [encoding] field, that
  /// encoding is used instead.
  ///
  /// - [promptValue] The prompt to tokenize.
  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final ChatCohereOptions? options,
  }) async {
    final encoding = getEncoding(this.encoding);
    return encoding.encode(promptValue.toString());
  }

  @override
  void close() {
    _client.close();
  }
}
