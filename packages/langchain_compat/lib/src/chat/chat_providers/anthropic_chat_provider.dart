import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import '../../platform/platform.dart';
import '../chat_models/anthropic_chat/anthropic_chat.dart';
import '../chat_models/chat_model.dart';
import '../tools/tool.dart';
import 'chat_provider.dart';
import 'model_chat_kind.dart';
import 'model_info.dart';

/// Provider for Anthropic Claude native API.
class AnthropicChatProvider extends ChatProvider<AnthropicChatOptions> {
  /// Creates a new Anthropic provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'anthropic', 'claude').
  /// [displayName]: Human-readable name for display. [defaultModelName]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  AnthropicChatProvider({
    required super.name,
    required super.aliases,
    required super.displayName,
    required super.defaultModelName,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    required super.caps,
  });

  /// Logger for Anthropic chat provider operations.
  static final Logger _logger = Logger('dartantic.chat.providers.anthropic');

  @override
  ChatModel<AnthropicChatOptions> createModel({
    String? name,
    List<Tool>? tools,
    double? temperature,
    String? systemPrompt,
    AnthropicChatOptions? options,
  }) {
    final modelName = name ?? defaultModelName;
    _logger.info(
      'Creating Anthropic model: '
      '$modelName with ${tools?.length ?? 0} tools, temp: $temperature',
    );

    return AnthropicChatModel(
      name: modelName,
      tools: tools,
      temperature: temperature,
      systemPrompt: systemPrompt,
      apiKey: tryGetEnv(apiKeyName),
      baseUrl: defaultBaseUrl,
      defaultOptions: AnthropicChatOptions(
        temperature: temperature ?? options?.temperature,
        topP: options?.topP,
        topK: options?.topK,
        maxTokens: options?.maxTokens,
        stopSequences: options?.stopSequences,
        userId: options?.userId,
      ),
    );
  }

  @override
  Stream<ModelInfo> listModels() async* {
    final apiKey = getEnv(apiKeyName);
    final url = Uri.parse('https://api.anthropic.com/v1/models');
    final response = await http.get(
      url,
      headers: {'x-api-key': apiKey, 'anthropic-version': '2023-06-01'},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch Anthropic models: ${response.body}');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final modelsList = data['data'] as List?;
    if (modelsList == null) {
      throw Exception('Anthropic API response missing "data" field.');
    }
    for (final m in modelsList.cast<Map<String, dynamic>>()) {
      final id = m['id'] as String? ?? '';
      final displayName = m['display_name'] as String?;
      final kind = id.startsWith('claude') ? ModelKind.chat : ModelKind.other;
      // Only include extra fields not mapped to ModelInfo
      final extra = <String, dynamic>{
        if (m.containsKey('created_at')) 'createdAt': m['created_at'],
        if (m.containsKey('type')) 'type': m['type'],
      };
      yield ModelInfo(
        name: id,
        kinds: {kind},
        displayName: displayName,
        description: null,
        extra: extra,
      );
    }
  }
}
