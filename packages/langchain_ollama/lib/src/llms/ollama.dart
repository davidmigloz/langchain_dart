import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:ollama_dart/ollama_dart.dart';
import 'package:tiktoken/tiktoken.dart';

import 'models/mappers.dart';
import 'models/models.dart';

/// Wrapper around Ollama Completions API.
///
/// Example:
/// ```dart
/// final llm = Ollama(
///   model: 'llama2',
///   defaultOption: const OllamaOptions(temperature: 1),
/// );
/// final res = await llm('Tell me a joke');
/// ```
///
/// - [Ollama API docs](https://github.com/jmorganca/ollama/blob/main/docs/api.md#generate-a-completion)
///
///
/// #### Custom HTTP client
///
/// You can always provide your own implementation of `http.Client` for further
/// customization:
///
/// ```dart
/// final client = Ollama(
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
/// final client = Ollama(
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
class Ollama extends BaseLLM<OllamaOptions> {
  /// Create a new [Ollama] instance.
  ///
  /// Main configuration options:
  /// - `model`: the base model to use. Since Ollama does not ship with a
  ///   model included, the user must specify an already-installed model which
  ///   the client can fall-back on
  /// - [Ollama.defaultOptions]
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to localhost:11434. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters (e.g. Azure OpenAI API
  ///   required to attach a `version` query parameter to every request).
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  /// - [Ollama.encoding]
  Ollama({
    final String? baseUrl,
    this.model = 'llama2',
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    this.defaultOptions = const OllamaOptions(),
    this.encoding = 'cl100k_base',
  }) : _client = OllamaClient(
          baseUrl: baseUrl,
          headers: headers,
          queryParams: queryParams,
          client: client,
        );

  /// A client for interacting with Ollama API.
  final OllamaClient _client;

  /// The default options to use when calling the completions API.
  final OllamaOptions defaultOptions;

  /// The default model to use when calling the completions API.
  final String model;

  /// The encoding to use by tiktoken when [tokenize] is called.
  final String? encoding;

  @override
  Future<LLMResult> generate(String prompt, {OllamaOptions? options}) async {
    final completion = await _client.generateCompletion(
        request: _generateCompletionRequest(
      prompt,
      options: options,
    ));
    return completion.toLLMResult();
  }

  @override
  Stream<LanguageModelResult<String>> stream(PromptValue input,
      {OllamaOptions? options}) {
    return _client
        .generateCompletionStream(
          request: _generateCompletionRequest(
            input.toString(),
            options: options,
          ),
        )
        .map((final completion) => completion.toLLMResult(
              streaming: true,
            ));
  }

  @override
  Stream<LanguageModelResult<String>> streamFromInputStream(
      Stream<PromptValue> inputStream,
      {OllamaOptions? options}) {
    return inputStream.asyncExpand((final input) {
      return stream(input, options: options);
    });
  }

  /// Creates a [GenerateCompletionRequest] from the given input.
  GenerateCompletionRequest _generateCompletionRequest(
    final String prompt, {
    final bool stream = false,
    final OllamaOptions? options,
  }) {
    return GenerateCompletionRequest(
      prompt: prompt,
      model: options?.model ?? model,
      stream: stream,
      system: options?.system,
      template: options?.template,
      context: options?.context,
      format: ResponseFormatMapper.fromString(options?.format),
      raw: options?.raw,
      options: RequestOptions(
        numKeep: options?.numKeep ?? defaultOptions.numKeep,
        seed: options?.seed ?? defaultOptions.seed,
        numPredict: options?.numPredict ?? defaultOptions.numPredict,
        topK: options?.topK ?? defaultOptions.topK,
        topP: options?.topP ?? defaultOptions.topP,
        tfsZ: options?.tfsZ ?? defaultOptions.tfsZ,
        typicalP: options?.typicalP ?? defaultOptions.typicalP,
        repeatLastN: options?.repeatLastN ?? defaultOptions.repeatLastN,
        temperature: options?.temperature ?? defaultOptions.temperature,
        repeatPenalty: options?.repeatPenalty ?? defaultOptions.repeatPenalty,
        presencePenalty:
            options?.presencePenalty ?? defaultOptions.presencePenalty,
        frequencyPenalty:
            options?.frequencyPenalty ?? defaultOptions.frequencyPenalty,
        mirostat: options?.mirostat ?? defaultOptions.mirostat,
        mirostatTau: options?.mirostatTau ?? defaultOptions.mirostatTau,
        mirostatEta: options?.mirostatEta ?? defaultOptions.mirostatEta,
        penalizeNewline:
            options?.penalizeNewline ?? defaultOptions.penalizeNewline,
        stop: options?.stop ?? defaultOptions.stop,
        numa: options?.numa ?? defaultOptions.numa,
        numCtx: options?.numCtx ?? defaultOptions.numCtx,
        numBatch: options?.numBatch ?? defaultOptions.numBatch,
        numGqa: options?.numGqa ?? defaultOptions.numGqa,
        numGpu: options?.numGpu ?? defaultOptions.numGpu,
        mainGpu: options?.mainGpu ?? defaultOptions.mainGpu,
        lowVram: options?.lowVram ?? defaultOptions.lowVram,
        f16Kv: options?.f16KV ?? defaultOptions.f16KV,
        logitsAll: options?.logitsAll ?? defaultOptions.logitsAll,
        vocabOnly: options?.vocabOnly ?? defaultOptions.vocabOnly,
        useMmap: options?.useMmap ?? defaultOptions.useMmap,
        useMlock: options?.useMlock ?? defaultOptions.useMlock,
        embeddingOnly: options?.embeddingOnly ?? defaultOptions.embeddingOnly,
        ropeFrequencyBase:
            options?.ropeFrequencyBase ?? defaultOptions.ropeFrequencyBase,
        ropeFrequencyScale:
            options?.ropeFrequencyScale ?? defaultOptions.ropeFrequencyScale,
        numThread: options?.numThread ?? defaultOptions.numThread,
      ),
    );
  }

  @override
  String get modelType => 'ollama';

  /// Tokenizes the given prompt using tiktoken with the encoding used by the
  /// [model]. If an encoding model is specified in [encoding] field, that
  /// encoding is used instead.
  ///
  /// - [promptValue] The prompt to tokenize.
  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final OllamaOptions? options,
  }) async {
    final encoding = this.encoding != null
        ? getEncoding(this.encoding!)
        : encodingForModel(options?.model ?? defaultOptions.model);
    return encoding.encode(promptValue.toString());
  }

  /// Closes the client and cleans up any resources associated with it.
  void close() {
    _client.endSession();
  }
}
