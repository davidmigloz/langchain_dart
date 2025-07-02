import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../chat_models/anthropic/chat_models.dart';
import '../chat_models/base.dart';
import '../tools/base.dart';
import 'model_info.dart';
import 'model_kind.dart';
import 'provider.dart';

/// Provider for Anthropic Claude native API.
class AnthropicProvider extends Provider<ChatAnthropicOptions> {
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
  BaseChatModel<ChatAnthropicOptions> createModel({
    String? model,
    List<ToolSpec>? tools,
    double? temperature,
    ChatAnthropicOptions? options,
  }) => ChatAnthropic(
    model: model ?? defaultModel,
    tools: tools,
    temperature: temperature,
    apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
    baseUrl: defaultBaseUrl,
    defaultOptions: ChatAnthropicOptions(
      temperature: temperature ?? options?.temperature,
      topP: options?.topP,
      topK: options?.topK,
      maxTokens: options?.maxTokens,
      stopSequences: options?.stopSequences,
      userId: options?.userId,
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
