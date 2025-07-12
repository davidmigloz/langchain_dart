import 'package:google_generative_ai/google_generative_ai.dart'
    show GenerativeModel;
import 'package:google_generative_ai/google_generative_ai.dart' as gai;
import 'package:googleai_dart/googleai_dart.dart' show GenerateContentRequest;
import 'package:http/http.dart' as http;
import 'package:http/retry.dart' show RetryClient;
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

import '../../../custom_http_client.dart';
import '../../../platform/platform.dart';
import '../../tools/tool.dart';
import '../../tools/tool_constants.dart';
import '../chat_message.dart' as msg;
import '../chat_models.dart';
import 'google_message_mappers.dart';

/// Wrapper around [Google AI for Developers](https://ai.google.dev/) API
/// (aka Gemini API).
class GoogleChatModel extends ChatModel<GoogleChatOptions> {
  /// Creates a [GoogleChatModel] instance.
  GoogleChatModel({
    String? name,
    List<Tool>? tools,
    super.temperature,
    super.systemPrompt,
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
         // Filter out return_result tool as Google has native typed output
         // support
         tools: tools?.where((t) => t.name != kReturnResultToolName).toList(),
       ) {
    _logger.info(
      'Creating Google model: ${name ?? defaultName} '
      'with ${super.tools?.length ?? 0} tools, temp: $temperature',
    );
    _googleAiClient = _createGoogleAiClient(
      modelName: name ?? defaultName,
      apiKey: apiKey ?? getEnv(apiKeyName),
      httpClient: _httpClient,
    );
  }

  /// Logger for Google chat model operations.
  static final Logger _logger = Logger('dartantic.chat.models.google');

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
  Stream<ChatResult<msg.ChatMessage>> sendStream(
    List<msg.ChatMessage> messages, {
    GoogleChatOptions? options,
    JsonSchema? outputSchema,
  }) {
    _logger.info(
      'Starting Google chat stream with ${messages.length} '
      'messages for model: $name',
    );
    final id = _uuid.v4();
    final messagesWithDefaults = prepareMessagesWithDefaults(messages);
    final (
      model,
      prompt,
      safetySettings,
      generationConfig,
      tools,
      toolConfig,
    ) = _generateCompletionRequest(
      messagesWithDefaults,
      options: options,
      outputSchema: outputSchema,
    );
    var chunkCount = 0;
    return _googleAiClient
        .generateContentStream(
          prompt,
          safetySettings: safetySettings,
          generationConfig: generationConfig,
          tools: tools,
          toolConfig: toolConfig,
        )
        .map((completion) {
          chunkCount++;
          _logger.fine('Received Google stream chunk $chunkCount');
          final result = completion.toChatResult(id, model);
          // Filter system messages from the response
          return ChatResult<msg.ChatMessage>(
            id: result.id,
            output: result.output,
            messages: filterSystemMessages(result.messages),
            finishReason: result.finishReason,
            metadata: result.metadata,
            usage: result.usage,
          );
        });
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
    List<msg.ChatMessage> messages, {
    GoogleChatOptions? options,
    JsonSchema? outputSchema,
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
        responseMimeType: outputSchema != null
            ? 'application/json'
            : options?.responseMimeType ?? defaultOptions.responseMimeType,
        responseSchema:
            _createGoogleSchema(outputSchema) ??
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

  /// Creates Google Schema from JsonSchema
  gai.Schema? _createGoogleSchema(JsonSchema? outputSchema) {
    if (outputSchema == null) return null;

    return _convertSchemaToGoogle(
      Map<String, dynamic>.from(outputSchema.schemaMap ?? {}),
    );
  }

  /// Converts a schema map to Google's Schema format
  gai.Schema _convertSchemaToGoogle(Map<String, dynamic> schemaMap) {
    final type = schemaMap['type'] as String?;
    final description = schemaMap['description'] as String?;
    final nullable = schemaMap['nullable'] as bool? ?? false;

    switch (type) {
      case 'string':
        final enumValues = schemaMap['enum'] as List<dynamic>?;
        if (enumValues != null) {
          return gai.Schema.enumString(
            enumValues: enumValues.cast<String>(),
            description: description,
            nullable: nullable,
          );
        } else {
          return gai.Schema.string(
            description: description,
            nullable: nullable,
          );
        }
      case 'number':
        return gai.Schema.number(description: description, nullable: nullable);
      case 'integer':
        return gai.Schema.integer(description: description, nullable: nullable);
      case 'boolean':
        return gai.Schema.boolean(description: description, nullable: nullable);
      case 'array':
        final items = schemaMap['items'] as Map<String, dynamic>?;
        return gai.Schema.array(
          items: items != null
              ? _convertSchemaToGoogle(Map<String, dynamic>.from(items))
              : gai.Schema.string(),
          description: description,
          nullable: nullable,
        );
      case 'object':
        final properties = schemaMap['properties'] as Map<String, dynamic>?;
        final convertedProperties = <String, gai.Schema>{};
        if (properties != null) {
          for (final entry in properties.entries) {
            convertedProperties[entry.key] = _convertSchemaToGoogle(
              Map<String, dynamic>.from(entry.value as Map<String, dynamic>),
            );
          }
        }
        return gai.Schema.object(
          properties: convertedProperties,
          description: description,
          nullable: nullable,
        );
      default:
        return gai.Schema.string(description: description, nullable: nullable);
    }
  }

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
    List<msg.ChatMessage> messages,
    GoogleChatOptions? options,
  ) {
    final systemInstruction =
        messages.firstOrNull?.role == msg.MessageRole.system
        ? messages.firstOrNull?.parts
              .whereType<msg.TextPart>()
              .map((p) => p.text)
              .join('\n')
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
