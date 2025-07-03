import 'package:google_generative_ai/google_generative_ai.dart'
    show GenerativeModel;
import 'package:google_generative_ai/google_generative_ai.dart' as gai;
import 'package:googleai_dart/googleai_dart.dart' show GenerateContentRequest;
import 'package:http/http.dart' as http;
import 'package:http/retry.dart' show RetryClient;
import 'package:uuid/uuid.dart';

import '../../../custom_http_client.dart';
import '../chat_models.dart';
import '../tools_and_messages_helper.dart';
import 'google_chat_mappers.dart';

/// Wrapper around [Google AI for Developers](https://ai.google.dev/) API
/// (aka Gemini API).
class GoogleChatModel extends ChatModel<GoogleChatOptions> 
    with ToolsAndMessagesHelper<GoogleChatOptions> {
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

  /// The default model to use unless another is specified.
  static const defaultModelName = 'gemini-2.0-flash';

  @override
  Stream<ChatResult> rawStream(
    List<ChatMessage> messages, {
    GoogleChatOptions? options,
  }) {
    final id = _uuid.v4();
    final (model, prompt, safetySettings, generationConfig, tools, toolConfig) =
        _generateCompletionRequest(messages, options: options);
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
