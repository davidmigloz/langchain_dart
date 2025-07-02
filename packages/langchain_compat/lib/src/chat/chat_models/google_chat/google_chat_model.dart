import 'package:google_generative_ai/google_generative_ai.dart'
    show GenerativeModel;
import 'package:google_generative_ai/google_generative_ai.dart' as gai;
import 'package:googleai_dart/googleai_dart.dart' show GenerateContentRequest;
import 'package:http/http.dart' as http;
import 'package:http/retry.dart' show RetryClient;
import 'package:uuid/uuid.dart';

import '../../../prompts/types.dart';
import '../../../runnables/runnable.dart' show Runnable;
import '../../../utils/https_client/http_client.dart';
import '../chat_models.dart';
import 'google_chat_mappers.dart';

/// Wrapper around [Google AI for Developers](https://ai.google.dev/) API
/// (aka Gemini API).
///
/// Example:
/// ```dart
/// final chatModel = ChatGoogleGenerativeAI(apiKey: '...');
/// final messages = [
///   ChatMessage.humanText('Tell me a joke.'),
/// ];
/// final prompt = PromptValue.chat(messages);
/// final res = await llm.invoke(prompt);
/// ```
///
/// - [Google AI API docs](https://ai.google.dev/docs)
///
/// ### Setup
///
/// To use `ChatGoogleGenerativeAI` you need to have an API key.
/// You can get one [here](https://aistudio.google.com/app/apikey).
///
/// ### Available models
///
/// The following models are available:
/// - `gemini-1.5-flash`:
///   * text / image / audio -> text model
///   * Max input token: 1048576
///   * Max output tokens: 8192
/// - `gemini-1.5-pro`:
///   * text / image / audio -> text model
///   * Max input token: 2097152
///   * Max output tokens: 8192
/// - `gemini-1.0-pro` (or `gemini-pro`):
///   * text -> text model
///   * Max input token: 32760
///   * Max output tokens: 8192
/// - `aqa`:
///   * text -> text model
///   * Max input token: 7168
///   * Max output tokens: 1024
///
/// Mind that this list may not be up-to-date.
/// Refer to the [documentation](https://ai.google.dev/gemini-api/docs/models/gemini)
/// for the updated list.
///
/// #### Tuned models
///
/// You can specify a tuned model by setting the `model` parameter to
/// `tunedModels/{your-model-name}`. For example:
///
/// ```dart
/// final chatModel = ChatGoogleGenerativeAI(
///   defaultOptions: ChatGoogleGenerativeAIOptions(
///     model: 'tunedModels/my-tuned-model',
///   ),
/// );
/// ```
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
/// final chatModel = ChatGoogleGenerativeAI(
///   defaultOptions: ChatGoogleGenerativeAIOptions(
///     model: 'gemini-pro-vision',
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
///   options: const ChatGoogleGenerativeAIOptions(temperature: 1),
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
/// final chatModel = ChatGoogleGenerativeAI(apiKey: '...');
/// const outputParser = StringOutputParser();
/// final prompt1 = PromptTemplate.fromTemplate('How are you {name}?');
/// final prompt2 = PromptTemplate.fromTemplate('How old are you {name}?');
/// final chain = Runnable.fromMap({
///   'q1': prompt1 |
///     chatModel.bind(const ChatGoogleGenerativeAIOptions(
///       model: 'gemini-pro',
///     )) |
///     outputParser,
///   'q2': prompt2 |
///     chatModel.bind(const ChatGoogleGenerativeAIOptions(
///       model: 'gemini-pro-vision',
///     )) |
///     outputParser,
/// });
/// final res = await chain.invoke({'name': 'David'});
/// ```
///
/// ### Tool calling
///
/// [GoogleChatModel] supports tool calling.
///
/// Check the [docs](https://langchaindart.dev/#/modules/model_io/models/chat_models/how_to/tools)
/// for more information on how to use tools.
///
/// Example:
/// ```dart
/// const tool = ToolSpec(
///   name: 'get_current_weather',
///   description: 'Get the current weather in a given location',
///   inputJsonSchema: {
///     'type': 'object',
///     'properties': {
///       'location': {
///         'type': 'string',
///         'description': 'The city and state, e.g. San Francisco, CA',
///       },
///     },
///     'required': ['location'],
///   },
/// );
/// final chatModel = ChatGoogleGenerativeAI(
///   defaultOptions: ChatGoogleGenerativeAIOptions(
///     model: 'gemini-1.5-pro-latest',
///     temperature: 0,
///     tools: [tool],
///   ),
/// );
/// final res = await model.invoke(
///   PromptValue.string(
///     "What's the weather like in Boston and Madrid right now in celsius?",
///   ),
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
/// final client = ChatGoogleGenerativeAI(
///   apiKey: 'GOOGLE_AI_API_KEY',
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
/// final client = ChatGoogleGenerativeAI(
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
class GoogleChatModel extends ChatModel<GoogleChatOptions> {
  /// Creates a [GoogleChatModel] instance.
  GoogleChatModel({
    String? model,
    super.tools,
    super.temperature,
    GoogleChatOptions? defaultOptions,
    String? apiKey,
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    http.Client? client,
  }) : _model = _validateModel(model),
       _apiKey = apiKey ?? '',
       _httpClient = CustomHttpClient(
         baseHttpClient: client ?? RetryClient(http.Client(), retries: 3),
         baseUrl: Uri.parse(
           baseUrl ?? 'https://generativelanguage.googleapis.com/v1beta',
         ),
         headers: {'x-goog-api-key': apiKey ?? '', ...?headers},
         queryParams: queryParams ?? const {},
       ),
       super(
         model: _validateModel(model),
         defaultOptions: defaultOptions ?? const GoogleChatOptions(),
       ) {
    _googleAiClient = _createGoogleAiClient(
      _model,
      apiKey: apiKey ?? '',
      httpClient: _httpClient,
    );
  }

  static String _validateModel(String? model) {
    if (model != null && model.isEmpty) {
      throw ArgumentError(
        "Model cannot be empty. Pass null to use the provider's default model.",
      );
    }
    return model ?? defaultModelName;
  }

  final String _model;

  /// The API key to use for authentication.
  final String _apiKey;

  /// The HTTP client to use.
  final CustomHttpClient _httpClient;

  /// A client for interacting with Google AI API.
  late gai.GenerativeModel _googleAiClient;

  /// A UUID generator.
  late final _uuid = const Uuid();

  /// The current system instruction set in [_googleAiClient];
  String? _currentSystemInstruction;

  @override
  String get modelType => 'chat-google-generative-ai';

  /// The default model to use unless another is specified.
  static const defaultModelName = 'gemini-2.0-flash';

  @override
  Future<ChatResult> invoke(
    PromptValue input, {
    GoogleChatOptions? options,
  }) async {
    final id = _uuid.v4();
    final (model, prompt, safetySettings, generationConfig, tools, toolConfig) =
        _generateCompletionRequest(input.toChatMessages(), options: options);
    final completion = await _googleAiClient.generateContent(
      prompt,
      safetySettings: safetySettings,
      generationConfig: generationConfig,
      tools: tools,
      toolConfig: toolConfig,
    );
    return completion.toChatResult(id, model);
  }

  @override
  Stream<ChatResult> stream(PromptValue input, {GoogleChatOptions? options}) {
    final id = _uuid.v4();
    final (model, prompt, safetySettings, generationConfig, tools, toolConfig) =
        _generateCompletionRequest(input.toChatMessages(), options: options);
    return _googleAiClient
        .generateContentStream(
          prompt,
          safetySettings: safetySettings,
          generationConfig: generationConfig,
          tools: tools,
          toolConfig: toolConfig,
        )
        .map((completion) => completion.toChatResult(id, model));
  }

  /// Creates a [GenerateContentRequest] from the given input.
  (
    String model,
    Iterable<gai.Content> prompt,
    List<gai.SafetySetting>? safetySettings,
    gai.GenerationConfig? generationConfig,
    List<gai.Tool>? tools,
    gai.ToolConfig? toolConfig,
  )
  _generateCompletionRequest(
    List<ChatMessage> messages, {
    GoogleChatOptions? options,
  }) {
    _updateClientIfNeeded(messages, options);

    return (
      _model,
      messages.toContentList(),
      (options?.safetySettings ?? defaultOptions.safetySettings)
          ?.toSafetySettings(),
      gai.GenerationConfig(
        candidateCount:
            options?.candidateCount ?? defaultOptions.candidateCount,
        stopSequences:
            options?.stopSequences ?? defaultOptions.stopSequences ?? const [],
        maxOutputTokens:
            options?.maxOutputTokens ?? defaultOptions.maxOutputTokens,
        temperature:
            temperature ?? options?.temperature ?? defaultOptions.temperature,
        topP: options?.topP ?? defaultOptions.topP,
        topK: options?.topK ?? defaultOptions.topK,
        responseMimeType:
            options?.responseMimeType ?? defaultOptions.responseMimeType,
        responseSchema:
            (options?.responseSchema ?? defaultOptions.responseSchema)
                ?.toSchema(),
      ),
      (tools ?? const []).toToolList(
        enableCodeExecution:
            options?.enableCodeExecution ??
            defaultOptions.enableCodeExecution ??
            false,
      ),
      null, // toolChoice not supported in new API
    );
  }

  @override
  void close() {
    _httpClient.close();
  }

  /// Create a new [gai.GenerativeModel] instance.
  GenerativeModel _createGoogleAiClient(
    String model, {
    String? apiKey,
    CustomHttpClient? httpClient,
    String? systemInstruction,
  }) => GenerativeModel(
    model: model,
    apiKey: apiKey ?? _apiKey,
    httpClient: httpClient ?? _httpClient,
    systemInstruction: systemInstruction != null
        ? gai.Content.system(systemInstruction)
        : null,
  );

  /// Recreate the [gai.GenerativeModel] instance.
  void _recreateGoogleAiClient(String model, String? systemInstruction) {
    _googleAiClient = _createGoogleAiClient(
      model,
      systemInstruction: systemInstruction,
    );
  }

  /// Updates the model in [_googleAiClient] if needed.
  void _updateClientIfNeeded(
    List<ChatMessage> messages,
    GoogleChatOptions? options,
  ) {
    final model = _model;

    final systemInstruction = messages.firstOrNull is SystemChatMessage
        ? messages.firstOrNull?.contentAsString
        : null;

    var recreate = false;
    if (model != _model) {
      recreate = true;
    }
    if (systemInstruction != _currentSystemInstruction) {
      _currentSystemInstruction = systemInstruction;
      recreate = true;
    }
    if (recreate) {
      _recreateGoogleAiClient(model, systemInstruction);
    }
  }

  @override
  String get name => _model;
}
