import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../chat_models/base.dart';
import '../chat_models/mistralai/chat_mistralai.dart';
import '../chat_models/mistralai/types.dart';
import '../tools/base.dart';
import 'model_info.dart';
import 'model_kind.dart';
import 'provider.dart';

/// Provider for Mistral AI (OpenAI-compatible).
class MistralProvider extends Provider<ChatMistralAIOptions> {
  /// Creates a new Mistral provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'mistral', 'mistralai').
  /// [displayName]: Human-readable name for display. [defaultModel]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  /// [isRemote]: True if the provider is cloud-based, false if local.
  MistralProvider({
    required super.name,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    required super.isRemote,
  });

  @override
  BaseChatModel<ChatMistralAIOptions> createModel({
    String? model,
    List<ToolSpec>? tools,
    double? temperature,
    ChatMistralAIOptions? options,
  }) {
    if (tools != null) {
      // TODO: Mistral doesn't support tools yet, waiting for a fix:
      // https://github.com/davidmigloz/langchain_dart/issues/653
      throw Exception('Tools are not supported by Mistral.');
    }

    return ChatMistralAI(
      model: model ?? defaultModel,
      tools: tools,
      temperature: temperature,
      apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
      baseUrl: defaultBaseUrl,
      defaultOptions: ChatMistralAIOptions(
        temperature: temperature ?? options?.temperature,
        topP: options?.topP,
        maxTokens: options?.maxTokens,
        safePrompt: options?.safePrompt,
        randomSeed: options?.randomSeed,
        concurrencyLimit: options?.concurrencyLimit ?? 1000,
      ),
    );
  }

  @override
  Future<Iterable<ModelInfo>> listModels() async {
    final apiKey = apiKeyName.isNotEmpty
        ? Platform.environment[apiKeyName]
        : null;
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('Missing API key for $name');
    }
    final url = Uri.parse('https://api.mistral.ai/v1/models');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $apiKey'},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch Mistral models: \\${response.body}');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return (data['data'] as List).cast<Map<String, dynamic>>().map((m) {
      final id = m['id'] as String? ?? '';
      final desc = m['description'] as String? ?? '';
      final kinds = <ModelKind>{};
      // Embedding models
      if (id.contains('embed') || desc.contains('embed')) {
        kinds.add(ModelKind.embedding);
      }
      // Magistral: always chat unless embedding
      if (id.contains('magistral') && !kinds.contains(ModelKind.embedding)) {
        kinds.add(ModelKind.chat);
      }
      // Mistral, Mixtral, Codestral: chat unless embedding
      if ((id.contains('mistral') ||
              id.contains('mixtral') ||
              id.contains('codestral')) &&
          !id.contains('embed') &&
          !kinds.contains(ModelKind.embedding)) {
        kinds.add(ModelKind.chat);
      }
      // Moderation and OCR: treat as chat
      if (id.contains('moderation') || id.contains('ocr')) {
        kinds.add(ModelKind.chat);
      }
      // Ministral: not officially documented, mark as other
      if (id.contains('ministral')) {
        kinds.clear();
        kinds.add(ModelKind.other);
      }

      // Pixtral: not officially documented, mark as other
      if (id.contains('pixtral')) {
        kinds.clear();
        kinds.add(ModelKind.other);
      }
      if (kinds.isEmpty) kinds.add(ModelKind.other);
      assert(kinds.isNotEmpty, 'Model $id returned with empty kinds set');
      return ModelInfo(
        name: id,
        kinds: kinds,
        displayName: m['name'] as String?,
        description: desc.isNotEmpty ? desc : null,
        extra: {
          ...m,
          if (m.containsKey('context_length'))
            'contextWindow': m['context_length'],
        }..removeWhere((k, _) => ['id', 'name', 'description'].contains(k)),
      );
    });
  }
}
