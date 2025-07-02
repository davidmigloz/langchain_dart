import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../chat_models/base.dart';
import '../chat_models/openai/chat_openai.dart';
import '../chat_models/openai/types.dart';
import '../tools/base.dart';
import 'model_info.dart';
import 'model_kind.dart';
import 'provider.dart';

/// Provider for OpenAI-compatible APIs (OpenAI, Groq, Together, etc.). Handles
/// API key, base URL, and model configuration.
class OpenAIProvider extends Provider<ChatOpenAIOptions> {
  /// Creates a new OpenAI provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'openai', 'groq').
  /// [displayName]: Human-readable name for display. [defaultModel]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  /// [isRemote]: True if the provider is cloud-based, false if local.
  OpenAIProvider({
    required super.name,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    required super.isRemote,
  });

  List<ModelInfo>? _cachedModels;

  @override
  BaseChatModel<ChatOpenAIOptions> createModel({
    String? model,
    List<ToolSpec>? tools,
    double? temperature,
    ChatOpenAIOptions? options,
  }) => ChatOpenAI(
    model: model ?? defaultModel,
    tools: tools,
    temperature: temperature,
    apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
    baseUrl: defaultBaseUrl,
    defaultOptions: ChatOpenAIOptions(
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
      concurrencyLimit: options?.concurrencyLimit ?? 1000,
    ),
  );

  @override
  Future<Iterable<ModelInfo>> listModels() async {
    if (_cachedModels != null) return _cachedModels!;
    final apiKey = apiKeyName.isNotEmpty
        ? Platform.environment[apiKeyName]
        : null;
    final url = Uri.parse('$defaultBaseUrl/models');
    final headers = <String, String>{
      if (apiKeyName.isNotEmpty && apiKey != null && apiKey.isNotEmpty)
        'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch models: \\${response.body}');
    }
    final data = jsonDecode(response.body);
    late final Iterable<ModelInfo> models;
    Iterable<ModelInfo> mapModels(Iterable mList) => mList.map((m) {
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
      return ModelInfo(
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
    });
    if (data is List) {
      models = mapModels(data);
    } else if (data is Map<String, dynamic>) {
      final modelsList = data['data'] as List?;
      if (modelsList == null) {
        throw Exception('No models found in response: \\${response.body}');
      }
      models = mapModels(modelsList);
    } else {
      throw Exception('Unexpected models response shape: \\${response.body}');
    }
    _cachedModels = models.toList();
    return _cachedModels!;
  }
}
