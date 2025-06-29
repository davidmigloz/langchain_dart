import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:langchain_tiktoken/langchain_tiktoken.dart';
import 'package:openai_dart/openai_dart.dart';

import '../prompts/prompts.dart';
import '../runnables/runnable.dart' show Runnable;
import '../runnables/runnables.dart' show Runnable;
import '../utils/utils.dart';
import 'base.dart';
import 'mappers.dart';
import 'types.dart';

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
    OpenAIOptions? defaultOptions,
    this.encoding,
  }) : _client = OpenAIClient(
         apiKey: apiKey ?? '',
         organization: organization,
         baseUrl: baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client,
       ),
       super(defaultOptions: defaultOptions ?? OpenAI.defaultOpenAIOptions);

  /// A client for interacting with OpenAI API.
  final OpenAIClient _client;

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

  /// The default model to use unless another is specified.
  static const defaultModel = 'gpt-3.5-turbo-instruct';

  /// The default options for this model.
  static const OpenAIOptions defaultOpenAIOptions = OpenAIOptions(
    model: defaultModel,
    maxTokens: defaultMaxTokens,
    concurrencyLimit: defaultConcurrencyLimit,
  );

  /// The default max tokens to use unless another is specified.
  static const defaultMaxTokens = 256;

  /// The default concurrency limit to use unless another is specified.
  static const defaultConcurrencyLimit = 20;

  @override
  Future<LLMResult> invoke(
    final PromptValue input, {
    final OpenAIOptions? options,
  }) async {
    final completion = await _client.createCompletion(
      request: _createCompletionRequest([input.toString()], options: options),
    );
    return completion.toLLMResults().first;
  }

  @override
  Future<List<LLMResult>> batch(
    final List<PromptValue> inputs, {
    final List<OpenAIOptions>? options,
  }) async {
    assert(
      options == null || options.length == 1 || options.length == inputs.length,
    );

    // If the user provided different options for each input, we can't batch
    // them in a single call. We have to call the API for each input, which
    // is the default behavior of batch
    if (options != null &&
        options.length > 1 &&
        options.any((final element) => element != options.first)) {
      return super.batch(inputs, options: options);
    }

    // Otherwise, we can batch the calls to the API
    final finalOptions = options?.first ?? defaultOpenAIOptions;
    final concurrencyLimit = min(
      finalOptions.concurrencyLimit,
      defaultConcurrencyLimit,
    );

    var index = 0;
    final results = <LLMResult>[];
    for (final chunk in chunkList(inputs, chunkSize: concurrencyLimit)) {
      final completion = await _client.createCompletion(
        request: _createCompletionRequest(
          chunk.map((final input) => input.toString()).toList(growable: false),
          options: options?.length == 1 ? options![0] : options?[index++],
        ),
      );
      final chunkResults = completion.toLLMResults();
      results.addAll(chunkResults);
    }
    return results;
  }

  @override
  Stream<LLMResult> stream(
    final PromptValue input, {
    final OpenAIOptions? options,
  }) => _client
        .createCompletionStream(
          request: _createCompletionRequest(
            [input.toString()],
            options: options,
            stream: true,
          ),
        )
        .map(
          (final completion) => completion.toLLMResults(streaming: true).first,
        );

  /// Creates a [CreateCompletionRequest] from the given input.
  CreateCompletionRequest _createCompletionRequest(
    final List<String> prompts, {
    final OpenAIOptions? options,
    final bool stream = false,
  }) => CreateCompletionRequest(
      model: CompletionModel.modelId(
        options?.model ?? defaultOpenAIOptions.model ?? defaultModel,
      ),
      prompt: CompletionPrompt.listString(prompts),
      bestOf: options?.bestOf ?? defaultOpenAIOptions.bestOf,
      frequencyPenalty:
          options?.frequencyPenalty ?? defaultOpenAIOptions.frequencyPenalty,
      logitBias: options?.logitBias ?? defaultOpenAIOptions.logitBias,
      logprobs: options?.logprobs ?? defaultOpenAIOptions.logprobs,
      maxTokens:
          options?.maxTokens ??
          defaultOpenAIOptions.maxTokens ??
          defaultMaxTokens,
      n: options?.n ?? defaultOpenAIOptions.n,
      presencePenalty:
          options?.presencePenalty ?? defaultOpenAIOptions.presencePenalty,
      seed: options?.seed ?? defaultOpenAIOptions.seed,
      stop: (options?.stop ?? defaultOpenAIOptions.stop) != null
          ? CompletionStop.listString(
              options?.stop ?? defaultOpenAIOptions.stop!,
            )
          : null,
      suffix: options?.suffix ?? defaultOpenAIOptions.suffix,
      temperature: options?.temperature ?? defaultOpenAIOptions.temperature,
      topP: options?.topP ?? defaultOpenAIOptions.topP,
      user: options?.user ?? defaultOpenAIOptions.user,
      streamOptions: stream
          ? const ChatCompletionStreamOptions(includeUsage: true)
          : null,
    );

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
            options?.model ?? defaultOpenAIOptions.model ?? defaultModel,
          );
    return encoding.encode(promptValue.toString());
  }

  @override
  void close() {
    _client.endSession();
  }
}
