import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:openai_dart/openai_dart.dart';
import 'package:tiktoken/tiktoken.dart';

import 'models/mappers.dart';
import 'models/models.dart';

/// Wrapper around [OpenAI Chat API](https://platform.openai.com/docs/api-reference/chat).
///
/// Example:
/// ```dart
/// final chat = ChatOpenAI(apiKey: '...', temperature: 1);
/// final messages = [
///   ChatMessage.system('You are a helpful assistant that translates English to French.'),
///   ChatMessage.human('I love programming.')
/// ];
/// final res = await chat(messages);
/// ```
///
/// - [Completions guide](https://platform.openai.com/docs/guides/gpt/chat-completions-api)
/// - [Completions API docs](https://platform.openai.com/docs/api-reference/chat)
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
/// final client = ChatOpenAI(
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
/// [`socks5_proxy`](https://pub.dev/packages/socks5_proxy) package and a
/// custom `http.Client`.
class ChatOpenAI extends BaseChatModel<ChatOpenAIOptions> {
  /// Create a new [ChatOpenAI] instance.
  ///
  /// Main configuration options:
  /// - `apiKey`: your OpenAI API key. You can find your API key in the
  ///   [OpenAI dashboard](https://platform.openai.com/account/api-keys).
  /// - `organization`: your OpenAI organization ID (if applicable).
  /// - [ChatOpenAI.model]
  /// - [ChatOpenAI.frequencyPenalty]
  /// - [ChatOpenAI.logitBias]
  /// - [ChatOpenAI.maxTokens]
  /// - [ChatOpenAI.n]
  /// - [ChatOpenAI.presencePenalty]
  /// - [ChatOpenAI.responseFormat]
  /// - [ChatOpenAI.seed]
  /// - [ChatOpenAI.temperature]
  /// - [ChatOpenAI.topP]
  /// - [ChatOpenAI.user]
  /// - [ChatOpenAI.encoding]
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to OpenAI's API URL. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  ChatOpenAI({
    final String? apiKey,
    final String? organization,
    final String? baseUrl,
    final Map<String, String>? headers,
    final http.Client? client,
    this.model = 'gpt-3.5-turbo',
    this.frequencyPenalty = 0,
    this.logitBias,
    this.maxTokens,
    this.n = 1,
    this.presencePenalty = 0,
    this.responseFormat,
    this.seed,
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

  /// ID of the model to use (e.g. 'gpt-3.5-turbo').
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-model
  final String model;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// their existing frequency in the text so far, decreasing the model's
  /// likelihood to repeat the same line verbatim.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-frequency_penalty
  final double frequencyPenalty;

  /// Modify the likelihood of specified tokens appearing in the completion.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-logit_bias
  final Map<String, int>? logitBias;

  /// The maximum number of tokens to generate in the chat completion.
  /// Defaults to inf.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-max_tokens
  final int? maxTokens;

  /// How many chat completion choices to generate for each input message.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-n
  final int n;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// whether they appear in the text so far, increasing the model's likelihood
  /// to talk about new topics.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-presence_penalty
  final double presencePenalty;

  /// An object specifying the format that the model must output.
  ///
  /// Setting to [ChatOpenAIResponseFormatType.jsonObject] enables JSON mode,
  /// which guarantees the message the model generates is valid JSON.
  ///
  /// Important: when using JSON mode you must still instruct the model to
  /// produce JSON yourself via some conversation message, for example via your
  /// system message. If you don't do this, the model may generate an unending
  /// stream of whitespace until the generation reaches the token limit, which
  /// may take a lot of time and give the appearance of a "stuck" request.
  /// Also note that the message content may be partial (i.e. cut off) if
  /// `finish_reason="length"`, which indicates the generation exceeded
  /// `max_tokens` or the conversation exceeded the max context length.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-response_format
  final ChatOpenAIResponseFormat? responseFormat;

  /// This feature is in Beta. If specified, our system will make a best effort
  /// to sample deterministically, such that repeated requests with the same
  /// seed and parameters should return the same result. Determinism is not
  /// guaranteed, and you should refer to the system_fingerprint response
  /// parameter to monitor changes in the backend.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-seed
  final int? seed;

  /// What sampling temperature to use, between 0 and 2.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-temperature
  final double temperature;

  /// An alternative to sampling with temperature, called nucleus sampling,
  /// where the model considers the results of the tokens with top_p
  /// probability mass.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-top_p
  final double topP;

  /// A unique identifier representing your end-user, which can help OpenAI to
  /// monitor and detect abuse.
  ///
  /// If you need to send different users in different requests, you can set
  /// this field in [ChatOpenAIOptions] instead.
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
  String get modelType => 'openai-chat';

  @override
  Future<ChatResult> generate(
    final List<ChatMessage> messages, {
    final ChatOpenAIOptions? options,
  }) async {
    final messagesDtos = messages.toChatCompletionMessages();
    final functionsDtos = options?.functions?.toFunctionObjects();
    final functionCall = options?.functionCall?.toChatCompletionFunctionCall();
    final resFormat = responseFormat?.toChatCompletionResponseFormat();

    final completion = await _client.createChatCompletion(
      request: CreateChatCompletionRequest(
        model: ChatCompletionModel.string(model),
        messages: messagesDtos,
        functions: functionsDtos,
        functionCall: functionCall,
        frequencyPenalty: frequencyPenalty,
        logitBias: logitBias,
        maxTokens: maxTokens,
        n: n,
        presencePenalty: presencePenalty,
        responseFormat: resFormat,
        seed: seed,
        stop: options?.stop != null
            ? ChatCompletionStop.arrayString(options!.stop!)
            : null,
        temperature: temperature,
        topP: topP,
        user: options?.user ?? user,
      ),
    );
    return completion.toChatResult();
  }

  @override
  Stream<ChatResult> stream(
    final PromptValue input, {
    final ChatOpenAIOptions? options,
  }) {
    final messagesDtos = input.toChatMessages().toChatCompletionMessages();
    final functionsDtos = options?.functions?.toFunctionObjects();
    final functionCall = options?.functionCall?.toChatCompletionFunctionCall();

    return _client
        .createChatCompletionStream(
          request: CreateChatCompletionRequest(
            model: ChatCompletionModel.string(model),
            messages: messagesDtos,
            functions: functionsDtos,
            functionCall: functionCall,
            frequencyPenalty: frequencyPenalty,
            logitBias: logitBias,
            maxTokens: maxTokens,
            n: n,
            presencePenalty: presencePenalty,
            stop: options?.stop != null
                ? ChatCompletionStop.arrayString(options!.stop!)
                : null,
            temperature: temperature,
            topP: topP,
            user: options?.user ?? user,
          ),
        )
        .map((final completion) => completion.toChatResult());
  }

  @override
  Stream<ChatResult> streamFromInputStream(
    final Stream<PromptValue> inputStream, {
    final ChatOpenAIOptions? options,
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
    return _getTiktoken().encode(promptValue.toString());
  }

  @override
  Future<int> countTokens(final PromptValue promptValue) async {
    final tiktoken = _getTiktoken();
    final messages = promptValue.toChatMessages();

    // Ref: https://github.com/openai/openai-cookbook/blob/main/examples/How_to_count_tokens_with_tiktoken.ipynb
    final int tokensPerMessage;
    final int tokensPerName;

    switch (model) {
      case 'gpt-3.5-turbo-0613':
      case 'gpt-3.5-turbo-16k-0613':
      case 'gpt-4-0314':
      case 'gpt-4-32k-0314':
      case 'gpt-4-0613':
      case 'gpt-4-32k-0613':
        tokensPerMessage = 3;
        tokensPerName = 1;
      case 'gpt-3.5-turbo-0301':
        // Every message follows <|start|>{role/name}\n{content}<|end|>\n
        tokensPerMessage = 4;
        // If there's a name, the role is omitted
        tokensPerName = -1;
      default:
        if (model.startsWith('gpt-3.5-turbo') || model.startsWith('gpt-4')) {
          // Returning num tokens assuming gpt-3.5-turbo-0613
          tokensPerMessage = 3;
          tokensPerName = 1;
        } else {
          throw UnimplementedError(
            'countTokens not supported for model $model',
          );
        }
    }

    int numTokens = 0;
    for (final message in messages) {
      numTokens += tokensPerMessage;
      numTokens += tiktoken.encode(message.content).length;
      numTokens += switch (message) {
        final SystemChatMessage _ => tiktoken.encode('system').length,
        final HumanChatMessage _ => tiktoken.encode('user').length,
        final AIChatMessage msg => tiktoken.encode('assistant').length +
            (msg.functionCall != null
                ? tiktoken.encode(msg.functionCall!.name).length +
                    tiktoken
                        .encode(msg.functionCall!.arguments.toString())
                        .length
                : 0),
        final FunctionChatMessage msg =>
          tiktoken.encode(msg.name).length + tokensPerName,
        final CustomChatMessage msg => tiktoken.encode(msg.role).length,
      };
    }

    // every reply is primed with <im_start>assistant
    return numTokens + 3;
  }

  /// Returns the tiktoken model to use for the given model.
  Tiktoken _getTiktoken() {
    return encoding != null ? getEncoding(encoding!) : encodingForModel(model);
  }
}
