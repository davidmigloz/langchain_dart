import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import '../../platform/platform.dart';
import '../chat_models/chat_model.dart';
import '../chat_models/mistral_chat/mistral_chat_model.dart';
import '../chat_models/mistral_chat/mistral_chat_options.dart';
import '../tools/tool.dart';
import 'chat_provider.dart';
import 'model_chat_kind.dart';
import 'model_info.dart';

/// Provider for Mistral AI (OpenAI-compatible).
class MistralChatProvider extends ChatProvider<MistralChatOptions> {
  /// Creates a new Mistral provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'mistral', 'mistralai').
  /// [displayName]: Human-readable name for display. [defaultModelName]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  MistralChatProvider({
    required super.name,
    required super.displayName,
    required super.defaultModelName,
    required super.defaultBaseUrl,
    required super.apiKeyName,
  });

  /// Logger for Mistral chat provider operations.
  static final Logger _logger = Logger('dartantic.chat.providers.mistral');

  @override
  ChatModel<MistralChatOptions> createModel({
    String? name,
    List<Tool>? tools,
    double? temperature,
    String? systemPrompt,
    MistralChatOptions? options,
  }) {
    final modelName = name ?? defaultModelName;
    _logger.info(
      'Creating Mistral model: $modelName with ${tools?.length ?? 0} tools, '
      'temp: $temperature',
    );
    return MistralChatModel(
      name: name ?? defaultModelName,
      tools: tools,
      temperature: temperature,
      systemPrompt: systemPrompt,
      apiKey: tryGetEnv(apiKeyName),
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
  Stream<ModelInfo> getModels() async* {
    final apiKey = getEnv(apiKeyName);
    final url = Uri.parse('https://api.mistral.ai/v1/models');
    _logger.info('Fetching models from Mistral API: $url');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $apiKey'},
    );
    if (response.statusCode != 200) {
      _logger.warning(
        'Failed to fetch models: HTTP ${response.statusCode}, '
        'body: ${response.body}',
      );
      throw Exception('Failed to fetch Mistral models: ${response.body}');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final modelCount = (data['data'] as List).length;
    _logger.info('Successfully fetched $modelCount models from Mistral API');
    for (final m in (data['data'] as List).cast<Map<String, dynamic>>()) {
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
      yield ModelInfo(
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
    }
  }
}
