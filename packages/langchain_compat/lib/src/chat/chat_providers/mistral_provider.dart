import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../chat_models/chat_model.dart';
import '../chat_models/mistral_chat/mistral_chat_model.dart';
import '../chat_models/mistral_chat/mistral_chat_options.dart';
import '../tools/tool_spec.dart';
import 'chat_provider.dart';
import 'model_info.dart';
import 'model_kind.dart';

/// Provider for Mistral AI (OpenAI-compatible).
class MistralProvider extends ChatProvider<MistralChatOptions> {
  /// Creates a new Mistral provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'mistral', 'mistralai').
  /// [displayName]: Human-readable name for display. [defaultModel]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  MistralProvider({
    required super.name,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
  });

  @override
  ChatModel<MistralChatOptions> createModel({
    String? model,
    List<ToolSpec>? tools,
    double? temperature,
    MistralChatOptions? options,
  }) {
    if (tools != null) {
      // TODO: Mistral doesn't support tools yet, waiting for a fix:
      // https://github.com/davidmigloz/langchain_dart/issues/653
      throw Exception('Tools are not supported by Mistral.');
    }

    return MistralChatModel(
      model: model ?? defaultModel,
      tools: tools,
      temperature: temperature,
      apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
      baseUrl: defaultBaseUrl,
      defaultOptions: MistralChatOptions(
        temperature: temperature ?? options?.temperature,
        topP: options?.topP,
        maxTokens: options?.maxTokens,
        safePrompt: options?.safePrompt,
        randomSeed: options?.randomSeed,
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
