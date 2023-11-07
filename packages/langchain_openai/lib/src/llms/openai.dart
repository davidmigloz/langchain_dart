import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:openai_dart/openai_dart.dart';
import 'package:tiktoken/tiktoken.dart';

import 'models/mappers.dart';
import 'models/models.dart';

/// Wrapper around OpenAI Completions API.
///
/// Example:
/// ```dart
/// final llm = OpenAI(apiKey: '...', temperature: 1);
/// final res = await llm('Tell me a joke');
/// ```
///
/// - [Completions guide](https://platform.openai.com/docs/guides/gpt/completions-api)
/// - [Completions API docs](https://platform.openai.com/docs/api-reference/completions)
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
  /// - [OpenAI.model]
  /// - [OpenAI.bestOf]
  /// - [OpenAI.frequencyPenalty]
  /// - [OpenAI.logitBias]
  /// - [OpenAI.logprobs]
  /// - [OpenAI.maxTokens]
  /// - [OpenAI.n]
  /// - [OpenAI.presencePenalty]
  /// - [OpenAI.suffix]
  /// - [OpenAI.temperature]
  /// - [OpenAI.topP]
  /// - [OpenAI.user]
  /// - [OpenAI.encoding]
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to OpenAI's API URL. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  OpenAI({
    final String? apiKey,
    final String? organization,
    final String? baseUrl,
    final Map<String, String>? headers,
    final http.Client? client,
    this.model = 'text-davinci-003',
    this.bestOf = 1,
    this.frequencyPenalty = 0,
    this.logitBias,
    this.logprobs,
    this.maxTokens = 256,
    this.n = 1,
    this.presencePenalty = 0,
    this.seed,
    this.suffix,
    this.temperature = 1,
    this.topP = 1,
    this.user,
    this.encoding,
  }) : _client = OpenAIClient(
          apiKey: apiKey ?? '',
          organization: organization,
          baseUrl: baseUrl,
          headers: headers,
          client: client,
        );

  /// A client for interacting with OpenAI API.
  final OpenAIClient _client;

  /// ID of the model to use (e.g. 'text-davinci-003').
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-model
  final String model;

  /// Generates best_of completions server-side and returns the "best"
  /// (the one with the highest log probability per token).
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-best_of
  final int bestOf;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// their existing frequency in the text so far, decreasing the model's
  /// likelihood to repeat the same line verbatim.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-frequency_penalty
  final double frequencyPenalty;

  /// Modify the likelihood of specified tokens appearing in the completion.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-logit_bias
  final Map<String, int>? logitBias;

  /// Include the log probabilities on the `logprobs` most likely tokens, as
  /// well the chosen tokens. For example, if `logprobs` is 5, the API will
  /// return a list of the 5 most likely tokens. The API will always return the
  /// `logprob` of the sampled token, so there may be up to `logprobs+1`
  /// elements in the response.
  ///
  /// The maximum value for logprobs is 5.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-logprobs
  final int? logprobs;

  /// The maximum number of tokens to generate in the completion.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-max_tokens
  final int? maxTokens;

  /// How many completions to generate for each prompt.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-n
  final int n;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// whether they appear in the text so far, increasing the model's likelihood
  /// to talk about new topics.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-presence_penalty
  final double presencePenalty;

  /// If specified, our system will make a best effort to sample
  /// deterministically, such that repeated requests with the same seed and
  /// parameters should return the same result.
  ///
  /// Determinism is not guaranteed, and you should refer to the
  /// `system_fingerprint` response parameter to monitor changes in the backend.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-seed
  final int? seed;

  /// The suffix that comes after a completion of inserted text.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-suffix
  final String? suffix;

  /// What sampling temperature to use, between 0 and 2.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-temperature
  final double temperature;

  /// An alternative to sampling with temperature, called nucleus sampling,
  /// where the model considers the results of the tokens with top_p
  /// probability mass.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-top_p
  final double topP;

  /// A unique identifier representing your end-user, which can help OpenAI to
  /// monitor and detect abuse.
  ///
  /// If you need to send different users in different requests, you can set
  /// this field in [OpenAIOptions.user] instead.
  ///
  /// Ref: https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids
  final String? user;

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
  /// - `cl100k_base` (used by gpt-4, gpt-3.5-turbo, text-embedding-ada-002).
  /// - `p50k_base` (used by codex models, text-davinci-002, text-davinci-003).
  /// - `r50k_base` (used by gpt-3 models like davinci).
  ///
  /// For an exhaustive list check:
  /// https://github.com/mvitlov/tiktoken/blob/master/lib/tiktoken.dart
  final String? encoding;

  @override
  String get modelType => 'openai';

  @override
  Future<LLMResult> generate(
    final String prompt, {
    final OpenAIOptions? options,
  }) async {
    final completion = await _client.createCompletion(
      request: CreateCompletionRequest(
        model: CompletionModel.string(model),
        prompt: CompletionPrompt.string(prompt),
        bestOf: bestOf,
        frequencyPenalty: frequencyPenalty,
        logitBias: logitBias,
        logprobs: logprobs,
        maxTokens: maxTokens,
        n: n,
        presencePenalty: presencePenalty,
        seed: seed,
        stop: options?.stop != null
            ? CompletionStop.arrayString(options!.stop!)
            : null,
        suffix: suffix,
        temperature: temperature,
        topP: topP,
        user: options?.user ?? user,
      ),
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
          request: CreateCompletionRequest(
            model: CompletionModel.string(model),
            prompt: CompletionPrompt.string(input.toString()),
            bestOf: bestOf,
            frequencyPenalty: frequencyPenalty,
            logitBias: logitBias,
            logprobs: logprobs,
            maxTokens: maxTokens,
            n: n,
            presencePenalty: presencePenalty,
            stop: options?.stop != null
                ? CompletionStop.arrayString(options!.stop!)
                : null,
            suffix: suffix,
            temperature: temperature,
            topP: topP,
            user: options?.user ?? user,
          ),
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

  /// Tokenizes the given prompt using tiktoken with the encoding used by the
  /// [model]. If an encoding model is specified in [encoding] field, that
  /// encoding is used instead.
  ///
  /// - [promptValue] The prompt to tokenize.
  @override
  Future<List<int>> tokenize(final PromptValue promptValue) async {
    final encoding = this.encoding != null
        ? getEncoding(this.encoding!)
        : encodingForModel(model);
    return encoding.encode(promptValue.toString());
  }
}
