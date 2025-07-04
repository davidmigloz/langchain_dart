import 'package:google_generative_ai/google_generative_ai.dart'
    show GenerativeModel;
import 'package:google_generative_ai/google_generative_ai.dart' as gai;
import 'package:googleai_dart/googleai_dart.dart' show GenerateContentRequest;
import 'package:http/http.dart' as http;
import 'package:http/retry.dart' show RetryClient;
import 'package:uuid/uuid.dart';

import '../../../custom_http_client.dart';
import '../../../platform/platform.dart';
import '../chat_models.dart';
import '../message.dart' as msg;
import 'google_message_mappers.dart';

/// Wrapper around [Google AI for Developers](https://ai.google.dev/) API
/// (aka Gemini API).
class GoogleChatModel extends ChatModel<GoogleChatOptions> {
  /// Creates a [GoogleChatModel] instance.
  GoogleChatModel({
    String? name,
    super.tools,
    super.temperature,
    GoogleChatOptions? defaultOptions,
    String? apiKey,
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    http.Client? client,
  }) : _apiKey = apiKey ?? '',
       _httpClient = CustomHttpClient(
         baseHttpClient: client ?? RetryClient(http.Client(), retries: 3),
         baseUrl: Uri.parse(baseUrl ?? defaultBaseUrl),
         headers: {'x-goog-api-key': apiKey ?? '', ...?headers},
         queryParams: queryParams ?? const {},
       ),
       super(
         name: name ?? defaultName,
         defaultOptions: defaultOptions ?? const GoogleChatOptions(),
       ) {
    _googleAiClient = _createGoogleAiClient(
      modelName: name ?? defaultName,
      apiKey: apiKey ?? getEnv(apiKeyName),
      httpClient: _httpClient,
    );
  }

  /// The default model to use unless another is specified.
  static const defaultName = 'gemini-2.0-flash';

  /// The environment variable for the API key
  static const apiKeyName = 'GEMINI_API_KEY';

  /// The default base URL to use unless another is specified.
  static const defaultBaseUrl =
      'https://generativelanguage.googleapis.com/v1beta';

  final String _apiKey;
  final CustomHttpClient _httpClient;
  late gai.GenerativeModel _googleAiClient;
  late final _uuid = const Uuid();
  String? _currentSystemInstruction;

  @override
  Stream<ChatResult<msg.Message>> sendStream(
    List<msg.Message> messages, {
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
    List<msg.Message> messages, {
    GoogleChatOptions? options,
  }) {
    _updateClientIfNeeded(messages, options);

    return (
      name,
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
  void dispose() => _httpClient.close();

  /// Create a new [gai.GenerativeModel] instance.
  GenerativeModel _createGoogleAiClient({
    required String modelName,
    String? apiKey,
    CustomHttpClient? httpClient,
    String? systemInstruction,
  }) => GenerativeModel(
    model: modelName,
    apiKey: apiKey ?? _apiKey,
    httpClient: httpClient ?? _httpClient,
    systemInstruction: systemInstruction != null
        ? gai.Content.system(systemInstruction)
        : null,
  );

  /// Recreate the [gai.GenerativeModel] instance.
  void _recreateGoogleAiClient({
    required String modelName,
    String? systemInstruction,
  }) {
    _googleAiClient = _createGoogleAiClient(
      modelName: modelName,
      systemInstruction: systemInstruction,
    );
  }

  /// Updates the model in [_googleAiClient] if needed.
  void _updateClientIfNeeded(
    List<msg.Message> messages,
    GoogleChatOptions? options,
  ) {
    final systemInstruction = messages.firstOrNull?.role == msg.MessageRole.system
        ? messages.firstOrNull?.parts.whereType<msg.TextPart>().map((p) => p.text).join('\n')
        : null;

    var recreate = false;
    if (systemInstruction != _currentSystemInstruction) {
      _currentSystemInstruction = systemInstruction;
      recreate = true;
    }
    if (recreate) {
      _recreateGoogleAiClient(
        modelName: name,
        systemInstruction: systemInstruction,
      );
    }
  }
}
