import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../platform/platform.dart';
import '../chat_models/chat_model.dart';
import '../chat_models/google_chat/google_chat_model.dart';
import '../chat_models/google_chat/google_chat_options.dart';
import '../tools/tool.dart';
import 'chat_provider.dart';
import 'model_chat_kind.dart';
import 'model_info.dart';

/// Provider for Google Gemini native API.
class GoogleChatProvider extends ChatProvider<GoogleChatOptions> {
  /// Creates a new Google AI provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'google', 'gemini').
  /// [displayName]: Human-readable name for display. [defaultModelName]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  GoogleChatProvider({
    required super.name,
    required super.aliases,
    required super.displayName,
    required super.defaultModelName,
    required super.defaultBaseUrl,
    required super.apiKeyName,
  });

  @override
  ChatModel<GoogleChatOptions> createModel({
    String? name,
    List<Tool>? tools,
    double? temperature,
    GoogleChatOptions? options,
  }) => GoogleChatModel(
    name: name ?? defaultModelName,
    tools: tools,
    temperature: temperature,
    apiKey: tryGetEnv(apiKeyName),
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
    ),
  );

  @override
  Stream<ModelInfo> getModels() async* {
    final apiKey = getEnv(apiKeyName);
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models',
    );
    final response = await http.get(url, headers: {'x-goog-api-key': apiKey});
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch Gemini models: ${response.body}');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    for (final m in (data['models'] as List).cast<Map<String, dynamic>>()) {
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
      yield ModelInfo(
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
    }
  }
}
