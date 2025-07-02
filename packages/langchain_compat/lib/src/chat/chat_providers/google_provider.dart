import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../tools/base.dart';
import '../chat_models/chat_model.dart';
import '../chat_models/google_chat/google_chat_model.dart';
import '../chat_models/google_chat/google_chat_options.dart';
import 'chat_provider.dart';
import 'model_info.dart';
import 'model_kind.dart';

/// Provider for Google Gemini native API.
class GoogleProvider extends ChatProvider<GoogleChatOptions> {
  /// Creates a new Google AI provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'google', 'gemini').
  /// [displayName]: Human-readable name for display. [defaultModel]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  /// [isRemote]: True if the provider is cloud-based, false if local.
  GoogleProvider({
    required super.name,
    required super.aliases,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    required super.isRemote,
  });

  @override
  ChatModel<GoogleChatOptions> createModel({
    String? model,
    List<ToolSpec>? tools,
    double? temperature,
    GoogleChatOptions? options,
  }) => GoogleChatModel(
    model: model ?? defaultModel,
    tools: tools,
    temperature: temperature,
    apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
    baseUrl: defaultBaseUrl,
    defaultOptions: GoogleChatOptions(
      topP: options?.topP,
      topK: options?.topK,
      candidateCount: options?.candidateCount,
      maxOutputTokens: options?.maxOutputTokens,
      temperature: temperature ?? options?.temperature,
      stopSequences: options?.stopSequences,
      responseMimeType: options?.responseMimeType,
      responseSchema: options?.responseSchema,
      safetySettings: options?.safetySettings,
      enableCodeExecution: options?.enableCodeExecution,
      concurrencyLimit: options?.concurrencyLimit ?? 1000,
    ),
  );

  @override
  Future<Iterable<ModelInfo>> listModels() async {
    final apiKey = apiKeyName.isNotEmpty
        ? Platform.environment[apiKeyName]
        : null;
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('Missing API key for $name');
    }
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models',
    );
    final response = await http.get(url, headers: {'x-goog-api-key': apiKey});
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch Gemini models: ${response.body}');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final models = (data['models'] as List).cast<Map<String, dynamic>>().map((
      m,
    ) {
      final id = m['name'] as String;
      final kinds = <ModelKind>{};
      final desc = m['description'] as String? ?? '';
      // Heuristics for Gemini model kinds
      if (id.contains('embed') || desc.contains('embedding')) {
        kinds.add(ModelKind.embedding);
      }
      if (id.contains('vision') ||
          desc.contains('vision') ||
          id.contains('image')) {
        kinds.add(ModelKind.image);
      }
      if (id.contains('tts') || desc.contains('tts')) kinds.add(ModelKind.tts);
      if (id.contains('audio') || desc.contains('audio')) {
        kinds.add(ModelKind.audio);
      }
      if (id.contains('count-tokens') || desc.contains('count tokens')) {
        kinds.add(ModelKind.countTokens);
      } // Most Gemini models are chat if not otherwise classified
      if (id.contains('gemini') ||
          id.contains('chat') ||
          desc.contains('chat')) {
        kinds.add(ModelKind.chat);
      }
      if (kinds.isEmpty) kinds.add(ModelKind.other);
      assert(kinds.isNotEmpty, 'Model $id returned with empty kinds set');
      return ModelInfo(
        name: id,
        kinds: kinds,
        displayName: m['displayName'] as String?,
        description: desc.isNotEmpty ? desc : null,
        extra:
            {
              ...m,
              if (m.containsKey('inputTokenLimit'))
                'contextWindow': m['inputTokenLimit'],
            }..removeWhere(
              (k, _) => ['name', 'displayName', 'description'].contains(k),
            ),
      );
    });
    return models;
  }
}
