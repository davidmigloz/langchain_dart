import 'dart:io';
import '../chat_models/base.dart';
import '../chat_models/cohere/types.dart';
import '../tools/base.dart';
import 'openai_provider.dart';

/// Provider for Cohere OpenAI-compatible API.
class CohereOpenAIProvider extends OpenAIProvider {
  /// Creates a new Cohere OpenAI provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'cohere', 'cohere-openai').
  /// [displayName]: Human-readable name for display. [defaultModel]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  /// [isRemote]: True if the provider is cloud-based, false if local.
  CohereOpenAIProvider({
    required super.name,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    required super.isRemote,
  });

  @override
  BaseChatModel<ChatCohereOptions> createModel({
    String? model,
    List<ToolSpec>? tools,
    double? temperature,
    ChatCohereOptions? options,
  }) {
    final modelToUse = model ?? defaultModel;
    final opts = ChatCohereOptions(
      frequencyPenalty: options?.frequencyPenalty,
      logitBias: options?.logitBias,
      maxTokens: options?.maxTokens,
      n: options?.n,
      presencePenalty: options?.presencePenalty,
      responseFormat: options?.responseFormat,
      seed: options?.seed,
      stop: options?.stop,
      temperature: temperature ?? options?.temperature,
      topP: options?.topP,
      parallelToolCalls: options?.parallelToolCalls,
      serviceTier: options?.serviceTier,
      user: options?.user,
      concurrencyLimit: options?.concurrencyLimit ?? 1000,
      streamOptions: null, // Cohere requires streamOptions to be null
    );
    return ChatCohere(
      model: modelToUse,
      tools: tools,
      temperature: temperature,
      apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
      baseUrl: defaultBaseUrl,
      defaultOptions: opts,
    );
  }
}
