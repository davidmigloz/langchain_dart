import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import '../../platform/platform.dart';
import '../chat_models/chat_model.dart';
import '../chat_models/openai_chat/openai_chat_model.dart';
import '../chat_models/openai_chat/openai_chat_options.dart';
import '../tools/tool.dart';
import 'chat_provider.dart';
import 'model_chat_kind.dart';
import 'model_info.dart';

/// Provider for OpenAI-compatible APIs (OpenAI, Groq, Together, etc.). Handles
/// API key, base URL, and model configuration.
class OpenAIChatProvider extends ChatProvider<OpenAIChatOptions> {
  /// Creates a new OpenAI provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'openai', 'groq').
  /// [displayName]: Human-readable name for display. [defaultModelName]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  OpenAIChatProvider({
    required super.name,
    required super.displayName,
    required super.defaultModelName,
    required super.defaultBaseUrl,
    required super.apiKeyName,
  });

  /// Logger for OpenAI chat provider operations.
  static final Logger _logger = Logger('dartantic.chat.providers.openai');

  @override
  ChatModel<OpenAIChatOptions> createModel({
    String? name,
    List<Tool>? tools,
    double? temperature,
    String? systemPrompt,
    OpenAIChatOptions? options,
  }) {
    final modelName = name ?? defaultModelName;
    _logger.info(
      'Creating OpenAI model: $modelName with ${tools?.length ?? 0} tools, '
      'temp: $temperature',
    );

    return OpenAIChatModel(
      name: modelName,
      tools: tools,
      temperature: temperature,
      systemPrompt: systemPrompt,
      apiKey: tryGetEnv(apiKeyName),
      baseUrl: defaultBaseUrl,
      defaultOptions: OpenAIChatOptions(
        temperature: temperature ?? options?.temperature,
        topP: options?.topP,
        n: options?.n,
        maxTokens: options?.maxTokens,
        presencePenalty: options?.presencePenalty,
        frequencyPenalty: options?.frequencyPenalty,
        logitBias: options?.logitBias,
        stop: options?.stop,
        user: options?.user,
        responseFormat: options?.responseFormat,
        seed: options?.seed,
        parallelToolCalls: options?.parallelToolCalls,
        streamOptions: options?.streamOptions,
        serviceTier: options?.serviceTier,
      ),
    );
  }

  @override
  Stream<ModelInfo> getModels() async* {
    _logger.info('Fetching models from OpenAI API: $defaultBaseUrl/models');

    final apiKey = apiKeyName.isNotEmpty ? getEnv(apiKeyName) : '';
    final url = Uri.parse('$defaultBaseUrl/models');
    final headers = <String, String>{
      if (apiKeyName.isNotEmpty && apiKey.isNotEmpty)
        'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode != 200) {
        _logger.warning(
          'Failed to fetch models: HTTP ${response.statusCode}, '
          'body: ${response.body}',
        );
        throw Exception('Failed to fetch models: ${response.body}');
      }

      final data = jsonDecode(response.body);

      Stream<ModelInfo> mapModels(Iterable mList) async* {
        for (final m in mList) {
          // ignore: avoid_dynamic_calls
          final id = m['id'] as String;
          final kinds = <ModelKind>{};
          // ignore: avoid_dynamic_calls
          final object = m['object']?.toString() ?? '';
          // Heuristics for OpenAI model kinds
          if (id.contains('embedding')) kinds.add(ModelKind.embedding);
          if (id.contains('tts')) kinds.add(ModelKind.tts);
          if (id.contains('vision') ||
              id.contains('dall-e') ||
              id.contains('image')) {
            kinds.add(ModelKind.image);
          }
          if (id.contains('audio')) kinds.add(ModelKind.audio);
          if (id.contains('count-tokens')) kinds.add(ModelKind.countTokens);
          // Most models are chat if not otherwise classified
          if (object == 'model' ||
              id.contains('gpt') ||
              id.contains('chat') ||
              id.contains('claude') ||
              id.contains('mixtral') ||
              id.contains('llama') ||
              id.contains('command') ||
              id.contains('sonnet')) {
            kinds.add(ModelKind.chat);
          }
          if (kinds.isEmpty) kinds.add(ModelKind.other);
          assert(kinds.isNotEmpty, 'Model $id returned with empty kinds set');
          yield ModelInfo(
            name: id,
            kinds: kinds,
            description: object.isNotEmpty ? object : null,
            extra: {
              ...m,
              // ignore: avoid_dynamic_calls
              if (m.containsKey('context_window'))
                // ignore: avoid_dynamic_calls
                'contextWindow': m['context_window'],
            }..removeWhere((k, _) => ['id', 'object'].contains(k)),
          );
        }
      }

      var modelCount = 0;
      if (data is List) {
        modelCount = data.length;
        yield* mapModels(data);
      } else if (data is Map<String, dynamic>) {
        final modelsList = data['data'] as List?;
        if (modelsList == null) {
          throw Exception('No models found in response: ${response.body}');
        }
        modelCount = modelsList.length;
        yield* mapModels(modelsList);
      } else {
        throw Exception('Unexpected models response shape: ${response.body}');
      }

      _logger.info('Successfully fetched $modelCount models from OpenAI API');
    } catch (e) {
      _logger.warning('Error fetching models from OpenAI API: $e');
      rethrow;
    }
  }
}
