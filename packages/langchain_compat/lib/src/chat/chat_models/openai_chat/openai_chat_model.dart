import 'package:http/http.dart' as http;
import 'package:openai_dart/openai_dart.dart';
import 'package:uuid/uuid.dart';

import '../../../prompts/types.dart';
import '../../../runnables/runnable.dart' show Runnable;
import '../chat_models.dart';
import 'openai_chat_options.dart';
import 'openai_mappers.dart';

/// Wrapper around [OpenAI Chat
/// API](https://platform.openai.com/docs/api-reference/chat).
///
/// Example:
/// ```dart
/// final chatModel = ChatOpenAI(apiKey: '...');
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
/// - [Completions
///   guide](https://platform.openai.com/docs/guides/gpt/chat-completions-api)
/// - [Completions API
///   docs](https://platform.openai.com/docs/api-reference/chat)
///
/// You can also use this wrapper to consume OpenAI-compatible APIs like
/// [TogetherAI](https://www.together.ai/),
/// [Anyscale](https://www.anyscale.com/), [OpenRouter](https://openrouter.ai),
/// [One API](https://github.com/songquanpeng/one-api),
/// [Groq](https://groq.com/), [Llamafile](https://llamafile.ai/),
/// [GPT4All](https://gpt4all.io/),
/// [FastChat](https://github.com/lm-sys/FastChat), etc.
///
/// ### Call options
///
/// You can configure the parameters that will be used when calling the chat
/// completions API in several ways:
///
/// **Default options:**
///
/// Use the [defaultOptions] parameter to set the default options. These options
/// will be used unless you override them when generating completions.
///
/// ```dart
/// final chatModel = ChatOpenAI(
///   apiKey: openaiApiKey,
///   defaultOptions: const ChatOpenAIOptions(
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
///   options: const ChatOpenAIOptions(seed: 9999),
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
/// final chatModel = ChatOpenAI(apiKey: openaiApiKey,);
/// const outputParser = StringOutputParser();
/// final prompt1 = PromptTemplate.fromTemplate('How are you {name}?');
/// final prompt2 = PromptTemplate.fromTemplate('How old are you {name}?');
/// final chain = Runnable.fromMap({
///   'q1': prompt1 |
///       chatModel.bind(const ChatOpenAIOptions(model: 'gpt-4')) |
///       outputParser,
///   'q2': prompt2 |
///       chatModel.bind(const ChatOpenAIOptions(model: 'gpt-4o-mini')) |
///       outputParser,
/// });
/// final res = await chain.invoke({'name': 'David'});
/// ```
///
/// ### Authentication
///
/// The OpenAI API uses API keys for authentication. Visit your [API
/// Keys](https://platform.openai.com/account/api-keys) page to retrieve the API
/// key you'll use in your requests.
///
/// #### Organization (optional)
///
/// For users who belong to multiple organizations, you can specify which
/// organization is used for an API request. Usage from these API requests will
/// count against the specified organization's subscription quota.
///
/// ```dart
/// final client = ChatOpenAI(
///   apiKey: 'OPENAI_API_KEY',
///   organization: 'org-dtDDtkEGoFccn5xaP5W1p3Rr',
/// );
/// ```
///
/// ### Advance
///
/// #### Azure OpenAI Service
///
/// OpenAI's models are also available as an [Azure
/// service](https://learn.microsoft.com/en-us/azure/ai-services/openai/overview).
///
/// Although the Azure OpenAI API is similar to the official OpenAI API, there
/// are subtle differences between them. This client is intended to be used with
/// the official OpenAI API, but most of the functionality should work with the
/// Azure OpenAI API as well.
///
/// If you want to use this client with the Azure OpenAI API (at your own risk),
/// you can do so by instantiating the client as follows:
///
/// ```dart
/// final client = ChatOpenAI(
///   baseUrl: 'https://YOUR_RESOURCE_NAME.openai.azure.com/openai/deployments/YOUR_DEPLOYMENT_NAME',
///   headers: { 'api-key': 'YOUR_API_KEY' },
///   queryParams: { 'api-version': 'API_VERSION' },
/// );
/// ```
///
/// - `YOUR_RESOURCE_NAME`: This value can be found in the Keys & Endpoint
///    section when examining your resource from the Azure portal.
/// - `YOUR_DEPLOYMENT_NAME`: This value will correspond to the custom name you
///    chose for your deployment when you deployed a model. This value can be
///    found under Resource Management > Deployments in the Azure portal.
/// - `YOUR_API_KEY`: This value can be found in the Keys & Endpoint section
///    when examining your resource from the Azure portal.
/// - `API_VERSION`: The Azure OpenAI API version to use (e.g. `2023-05-15`).
///    Try to use the [latest version
///    available](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/cognitiveservices/data-plane/AzureOpenAI/inference),
///    it will probably be the closest to the official OpenAI API.
///
/// #### Custom HTTP client
///
/// You can always provide your own implementation of `http.Client` for further
/// customization:
///
/// ```dart
/// final client = ChatOpenAI(
///   apiKey: 'OPENAI_API_KEY',
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
/// final client = ChatOpenAI(
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
/// [`socks5_proxy`](https://pub.dev/packages/socks5_proxy) package and a custom
/// `http.Client`.
class OpenAIChatModel extends ChatModel<OpenAIChatOptions> {
  /// Creates a [OpenAIChatModel] instance.
  OpenAIChatModel({
    String? model,
    super.tools,
    super.temperature,
    OpenAIChatOptions? defaultOptions,
    String? apiKey,
    String? organization,
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    http.Client? client,
  }) : _model = _validateModel(model),
       _client = OpenAIClient(
         apiKey: apiKey ?? '',
         organization: organization,
         baseUrl: baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client,
       ),
       super(
         model: _validateModel(model),
         defaultOptions: defaultOptions ?? const OpenAIChatOptions(),
       );

  static String _validateModel(String? model) {
    if (model != null && model.isEmpty) {
      throw ArgumentError(
        "Model cannot be empty. Pass null to use the provider's default model.",
      );
    }
    return model ?? defaultModelName;
  }

  /// A client for interacting with OpenAI API.
  final String _model;
  final OpenAIClient _client;

  /// A UUID generator.
  late final _uuid = const Uuid();

  /// Set or replace the API key.
  set apiKey(String value) => _client.apiKey = value;

  /// Get the API key.
  String get apiKey => _client.apiKey;

  @override
  String get modelType => 'openai-chat';

  /// The default model to use unless another is specified.
  static const defaultModelName = 'gpt-4o-mini';

  @override
  Future<ChatResult> invoke(
    PromptValue input, {
    OpenAIChatOptions? options,
  }) async {
    final completion = await _client.createChatCompletion(
      request: createChatCompletionRequest(
        input.toChatMessages(),
        model: _model,
        tools: tools,
        temperature: temperature,
        options: options,
        defaultOptions: defaultOptions,
      ),
    );
    return completion.toChatResult(completion.id ?? _uuid.v4());
  }

  @override
  Stream<ChatResult> stream(PromptValue input, {OpenAIChatOptions? options}) =>
      _client
          .createChatCompletionStream(
            request: createChatCompletionRequest(
              input.toChatMessages(),
              model: _model,
              tools: tools,
              temperature: temperature,
              options: options,
              defaultOptions: defaultOptions,
              stream: true,
            ),
          )
          .map(
            (completion) =>
                completion.toChatResult(completion.id ?? _uuid.v4()),
          );

  @override
  void close() {
    _client.endSession();
  }

  @override
  String get name => _model;
}
