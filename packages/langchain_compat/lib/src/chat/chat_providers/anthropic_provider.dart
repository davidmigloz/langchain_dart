import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../chat_models/anthropic_chat/anthropic_chat.dart';
import '../chat_models/chat_model.dart';
import '../tools/tool_spec.dart';
import 'chat_provider.dart';
import 'model_info.dart';
import 'model_kind.dart';

/// Provider for Anthropic Claude native API.
class AnthropicProvider extends ChatProvider<AnthropicChatOptions> {
  /// Creates a new Anthropic provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'anthropic', 'claude').
  /// [displayName]: Human-readable name for display. [defaultModel]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  /// [isRemote]: True if the provider is cloud-based, false if local.
  AnthropicProvider({
    required super.name,
    required super.aliases,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    required super.isRemote,
  });

  @override
  ChatModel<AnthropicChatOptions> createModel({
    String? model,
    List<ToolSpec>? tools,
    double? temperature,
    AnthropicChatOptions? options,
  }) => AnthropicChatModel(
    model: model ?? defaultModel,
    tools: tools,
    temperature: temperature,
    apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
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

  @override
  Future<Iterable<ModelInfo>> listModels() async {
    final apiKey = apiKeyName.isNotEmpty
        ? Platform.environment[apiKeyName]
        : null;
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('Missing API key for $name');
    }
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
    final models = modelsList.cast<Map<String, dynamic>>().map((m) {
      final id = m['id'] as String? ?? '';
      final displayName = m['display_name'] as String?;
      final kind = id.startsWith('claude') ? ModelKind.chat : ModelKind.other;
      // Only include extra fields not mapped to ModelInfo
      final extra = <String, dynamic>{
        if (m.containsKey('created_at')) 'createdAt': m['created_at'],
        if (m.containsKey('type')) 'type': m['type'],
      };
      return ModelInfo(
        name: id,
        kinds: {kind},
        displayName: displayName,
        description: null,
        extra: extra,
      );
    }).toList();
    return models;
  }
}
