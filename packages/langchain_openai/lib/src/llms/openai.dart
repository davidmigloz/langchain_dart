import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:langchain_tiktoken/langchain_tiktoken.dart';
import 'package:openai_dart/openai_dart.dart';

import 'models/mappers.dart';
import 'models/models.dart';

/// Wrapper around [OpenAI Completions API](https://platform.openai.com/docs/api-reference/completions).
///
/// Example:
/// ```dart
/// final llm = OpenAI(apiKey: '...');
/// final prompt = PromptValue.string('Tell me a joke');
/// final res = await llm.invoke(prompt);
/// ```
///
/// - [Completions guide](https://platform.openai.com/docs/guides/gpt/completions-api)
/// - [Completions API docs](https://platform.openai.com/docs/api-reference/completions)
///
/// ### Call options
///
/// You can configure the parameters that will be used when calling the
/// completions API in several ways:
///
/// **Default options:**
///
/// Use the [defaultOptions] parameter to set the default options. These
/// options will be used unless you override them when generating completions.
///
/// ```dart
/// final llm = OpenAI(
///   apiKey: openaiApiKey,
///   defaultOptions: const OpenAIOptions(
///     temperature: 0.9,
///     maxTokens: 100,
///   ),
/// );
/// final prompt = PromptValue.string('Hello world!');
/// final result = await openai.invoke(prompt);
/// ```
///
/// **Call options:**
///
/// You can override the default options when invoking the model:
///
/// ```dart
/// final res = await llm.invoke(
///   prompt,
///   options: const OpenAIOptions(seed: 9999),
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
/// final llm = OpenAI(apiKey: openaiApiKey);
/// const outputParser = StringOutputParser();
/// final prompt1 = PromptTemplate.fromTemplate('How are you {name}?');
/// final prompt2 = PromptTemplate.fromTemplate('How old are you {name}?');
/// final chain = Runnable.fromMap({
///   'q1': prompt1 | llm.bind(const OpenAIOptions(model: 'gpt-3.5-turbo-instruct')) | outputParser,
///   'q2': prompt2| llm.bind(const OpenAIOptions(model: 'text-davinci-003')) | outputParser,
/// });
/// final res = await chain.invoke({'name': 'David'});
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
/// organization is used for an API request. Usage from these API requests will
/// count against the specified organization's subscription quota.
///
/// ```dart
/// final client = OpenAI(
///   apiKey: 'OPENAI_API_KEY',
///   organization: 'org-dtDDtkEGoFccn5xaP5W1p3Rr',
/// );
/// ```
///
/// ### Advance
///
/// #### Azure OpenAI Service
///
/// OpenAI's models are also available as an [Azure service](https://learn.microsoft.com/en-us/azure/ai-services/openai/overview).
///
/// Although the Azure OpenAI API is similar to the official OpenAI API, there
/// are subtle differences between them. This client is intended to be used
/// with the official OpenAI API, but most of the functionality should work
/// with the Azure OpenAI API as well.
///
/// If you want to use this client with the Azure OpenAI API (at your own risk),
/// you can do so by instantiating the client as follows:
///
/// ```dart
/// final client = OpenAI(
///   baseUrl: 'https://YOUR_RESOURCE_NAME.openai.azure.com/openai/deployments/YOUR_DEPLOYMENT_NAME',
///   headers: { 'api-key': 'YOUR_API_KEY' },
///   queryParams: { 'api-version': 'API_VERSION' },
/// );
/// ```
///
/// - `YOUR_RESOURCE_NAME`: This value can be found in the Keys & Endpoint
///    section when examining your resource from the Azure portal.
/// - `YOUR_DEPLOYMENT_NAME`: This value will correspond to the custom name
///    you chose for your deployment when you deployed a model. This value can be found under Resource Management > Deployments in the Azure portal.
/// - `YOUR_API_KEY`: This value can be found in the Keys & Endpoint section
///    when examining your resource from the Azure portal.
/// - `API_VERSION`: The Azure OpenAI API version to use (e.g. `2023-05-15`).
///    Try to use the [latest version available](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/cognitiveservices/data-plane/AzureOpenAI/inference),
///    it will probably be the closest to the official OpenAI API.
///
/// #### Custom HTTP client
///
/// You can always provide your own implementation of `http.Client` for further
/// customization:
///
/// ```dart
/// final client = OpenAI(
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
/// final client = OpenAI(
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
class OpenAI extends BaseLLM<OpenAIOptions> {
  /// Create a new [OpenAI] instance.
  ///
  /// Main configuration options:
  /// - `apiKey`: your OpenAI API key. You can find your API key in the
  ///   [OpenAI dashboard](https://platform.openai.com/account/api-keys).
  /// - `organization`: your OpenAI organization ID (if applicable).
  /// - [OpenAI.encoding]
  /// - [OpenAI.defaultOptions]
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to OpenAI's API URL. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters (e.g. Azure OpenAI API
  ///   required to attach a `version` query parameter to every request).
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  OpenAI({
    final String? apiKey,
    final String? organization,
    final String? baseUrl,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    this.defaultOptions = const OpenAIOptions(
      model: 'gpt-3.5-turbo-instruct',
      maxTokens: 256,
    ),
    this.encoding,
  }) : _client = OpenAIClient(
          apiKey: apiKey ?? '',
          organization: organization,
          baseUrl: baseUrl,
          headers: headers,
          queryParams: queryParams,
          client: client,
        );

  /// A client for interacting with OpenAI API.
  final OpenAIClient _client;

  /// The default options to use when calling the completions API.
  OpenAIOptions defaultOptions;

  /// The encoding to use by tiktoken when [tokenize] is called.
  ///
  /// By default, when [encoding] is not set, it is derived from the [model].
  /// However, there are some cases where you may want to use this wrapper
  /// class with a [model] not supported by tiktoken (e.g. when using Azure
  /// embeddings or when using one of the many model providers that expose an
  /// OpenAI-like API but with different models). In those cases, tiktoken won't
  /// be able to derive the encoding to use, so you have to explicitly specify
  /// it using this field.
  ///
  /// Supported encodings:
  /// - `cl100k_base` (used by gpt-4, gpt-3.5-turbo, text-embedding-3-small).
  ///
  /// For an exhaustive list check:
  /// https://github.com/mvitlov/tiktoken/blob/master/lib/tiktoken.dart
  String? encoding;

  /// Set or replace the API key.
  set apiKey(final String value) => _client.apiKey = value;

  /// Get the API key.
  String get apiKey => _client.apiKey;

  @override
  String get modelType => 'openai';

  @override
  Future<LLMResult> generate(
    final String prompt, {
    final OpenAIOptions? options,
  }) async {
    final completion = await _client.createCompletion(
      request: _createCompletionRequest(prompt, options: options),
    );
    return completion.toLLMResult();
  }

  @override
  Stream<LLMResult> stream(
    final PromptValue input, {
    final OpenAIOptions? options,
  }) {
    return _client
        .createCompletionStream(
          request: _createCompletionRequest(input.toString(), options: options),
        )
        .map((final completion) => completion.toLLMResult(streaming: true));
  }

  @override
  Stream<LLMResult> streamFromInputStream(
    final Stream<PromptValue> inputStream, {
    final OpenAIOptions? options,
  }) {
    return inputStream.asyncExpand((final input) {
      return stream(input, options: options);
    });
  }

  /// Creates a [CreateCompletionRequest] from the given input.
  CreateCompletionRequest _createCompletionRequest(
    final String prompt, {
    final OpenAIOptions? options,
  }) {
    return CreateCompletionRequest(
      model: CompletionModel.modelId(
        options?.model ?? defaultOptions.model ?? throwNullModelError(),
      ),
      prompt: CompletionPrompt.string(prompt),
      bestOf: options?.bestOf ?? defaultOptions.bestOf,
      frequencyPenalty:
          options?.frequencyPenalty ?? defaultOptions.frequencyPenalty,
      logitBias: options?.logitBias ?? defaultOptions.logitBias,
      logprobs: options?.logprobs ?? defaultOptions.logprobs,
      maxTokens: options?.maxTokens ?? defaultOptions.maxTokens,
      n: options?.n ?? defaultOptions.n,
      presencePenalty:
          options?.presencePenalty ?? defaultOptions.presencePenalty,
      seed: options?.seed ?? defaultOptions.seed,
      stop: (options?.stop ?? defaultOptions.stop) != null
          ? CompletionStop.listString(options?.stop ?? defaultOptions.stop!)
          : null,
      suffix: options?.suffix ?? defaultOptions.suffix,
      temperature: options?.temperature ?? defaultOptions.temperature,
      topP: options?.topP ?? defaultOptions.topP,
      user: options?.user ?? defaultOptions.user,
    );
  }

  /// Tokenizes the given prompt using tiktoken with the encoding used by the
  /// [model]. If an encoding model is specified in [encoding] field, that
  /// encoding is used instead.
  ///
  /// - [promptValue] The prompt to tokenize.
  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final OpenAIOptions? options,
  }) async {
    final encoding = this.encoding != null
        ? getEncoding(this.encoding!)
        : encodingForModel(
            options?.model ?? defaultOptions.model ?? throwNullModelError(),
          );
    return encoding.encode(promptValue.toString());
  }

  /// Closes the client and cleans up any resources associated with it.
  void close() {
    _client.endSession();
  }
}
