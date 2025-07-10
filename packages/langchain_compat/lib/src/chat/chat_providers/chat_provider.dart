import '../../provider_caps.dart';
import '../chat_models/chat_models.dart';
import '../tools/tool.dart';
import 'chat_providers.dart';

/// Provides a unified interface for accessing all major LLM, chat, and
/// embedding providers in LangChain.dart via a single import. This includes
/// OpenAI, GoogleAI, VertexAI, Anthropic, Mistral, Ollama (native and
/// OpenAI-compatible), and more. Each provider is represented as a static field
/// and can be selected by name or alias using [ChatProvider.forName] or
/// iterated via [ChatProvider.all].
///
/// The compat layer ensures all providers are accessible without importing
/// provider-specific packages. All configuration (API keys, base URLs, models)
/// is handled via the provider interface.
abstract class ChatProvider<TOptions extends ChatModelOptions> {
  /// Creates a new provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'openai', 'ollama').
  /// [displayName]: Human-readable name for display. [defaultModelName]: The
  /// default model for this provider (null means use model's own default).
  /// [defaultBaseUrl]: The default API endpoint. [apiKeyName]: The environment
  /// variable for the API key (if any). [aliases]: Alternative names for
  /// lookup.
  const ChatProvider({
    required this.name,
    required this.displayName,
    required this.defaultModelName,
    required this.defaultBaseUrl,
    required this.apiKeyName,
    required this.caps,
    this.aliases = const [],
  });

  /// The canonical provider name (e.g., 'openai', 'ollama').
  final String name;

  /// Alternative names for lookup (e.g., 'claude' for Anthropic).
  final List<String> aliases;

  /// Human-readable name for display.
  final String displayName;

  /// The default model for this provider.
  final String defaultModelName;

  /// The default API endpoint for this provider.
  final String defaultBaseUrl;

  /// The environment variable for the API key (if any).
  final String apiKeyName;

  /// The capabilities of this provider.
  final Set<ProviderCaps> caps;

  /// Returns all available models for this provider.
  ///
  /// Implementations may or may not cache results. If your application requires
  /// caching, you should implement it yourself rather than relying on the
  /// provider.
  Stream<ModelInfo> listModels();

  /// Creates a chat model instance for this provider.
  ChatModel<TOptions> createModel({
    String? name,
    List<Tool>? tools,
    double? temperature,
    String? systemPrompt,
    TOptions? options,
  });

  /// OpenAI provider (cloud, OpenAI API).
  static final openai = OpenAIChatProvider(
    name: 'openai',
    displayName: 'OpenAI',
    defaultModelName: OpenAIChatModel.defaultName,
    defaultBaseUrl: OpenAIChatModel.defaultBaseUrl,
    apiKeyName: OpenAIChatModel.apiKeyName,
    caps: ProviderCaps.allChat,
  );

  /// OpenRouter provider (OpenAI-compatible, multi-model cloud).
  static final openrouter = OpenAIChatProvider(
    name: 'openrouter',
    displayName: 'OpenRouter',
    defaultModelName: 'google/gemini-2.5-flash',
    defaultBaseUrl: 'https://openrouter.ai/api/v1',
    apiKeyName: 'OPENROUTER_API_KEY',
    caps: ProviderCaps.allChat,
  );

  /// Together AI provider (OpenAI-compatible, cloud).
  ///
  /// Note: Tool support is disabled because Together's streaming API returns
  /// tool calls in a custom format with `<|python_tag|>` prefix instead of the
  /// standard OpenAI tool_calls format. Non-streaming API works correctly but
  /// we prioritize consistent behavior across streaming and non-streaming
  /// modes.
  static final together = OpenAIChatProvider(
    name: 'together',
    displayName: 'Together AI',
    defaultModelName: 'meta-llama/Llama-3.2-3B-Instruct-Turbo',
    defaultBaseUrl: 'https://api.together.xyz/v1',
    apiKeyName: 'TOGETHER_API_KEY',
    caps: ProviderCaps.allChatExcept({ProviderCaps.multiToolCalls}),
  );

  /// Fireworks AI provider (OpenAI-compatible, cloud).
  static final fireworks = OpenAIChatProvider(
    name: 'fireworks',
    displayName: 'Fireworks AI',
    defaultModelName: 'accounts/fireworks/models/llama-v3p1-70b-instruct',
    defaultBaseUrl: 'https://api.fireworks.ai/inference/v1',
    apiKeyName: 'FIREWORKS_API_KEY',
    caps: ProviderCaps.allChat,
  );

  /// Mistral AI provider (native API, cloud).
  static final mistral = MistralChatProvider(
    name: 'mistral',
    displayName: 'Mistral AI',
    defaultModelName: MistralChatModel.defaultName,
    defaultBaseUrl: MistralChatModel.defaultBaseUrl,
    apiKeyName: MistralChatModel.apiKeyName,
    caps: ProviderCaps.allChatExcept({
      ProviderCaps.multiToolCalls,
      ProviderCaps.typedOutput,
    }),
  );

  /// Cohere provider (OpenAI-compatible, cloud). Note: streamOptions is
  /// forcibly set to null for compatibility.
  static final cohere = CohereChatProvider(
    name: 'cohere',
    displayName: 'Cohere',
    defaultModelName: 'command-r-plus',
    defaultBaseUrl: 'https://api.cohere.ai/compatibility/v1',
    apiKeyName: 'COHERE_API_KEY',
    caps: ProviderCaps.allChat,
  );

  /// Lambda provider (OpenAI-compatible, cloud).
  static final lambda = OpenAIChatProvider(
    name: 'lambda',
    displayName: 'Lambda',
    defaultModelName: 'llama3.2-3b-instruct',
    defaultBaseUrl: 'https://api.lambda.ai/v1',
    apiKeyName: 'LAMBDA_API_KEY',
    caps: ProviderCaps.allChatExcept({ProviderCaps.multiToolCalls}),
  );

  /// Gemini (OpenAI-compatible) provider (Google AI, OpenAI API).
  static final googleOpenAI = OpenAIChatProvider(
    name: 'google-openai',
    displayName: 'Google AI (OpenAI-compatible)',
    defaultModelName: GoogleChatModel.defaultName,
    defaultBaseUrl: 'https://generativelanguage.googleapis.com/v1beta/openai',
    apiKeyName: GoogleChatModel.apiKeyName,
    caps: ProviderCaps.allChat,
  );

  /// Google Gemini native provider (uses Gemini API, not OpenAI-compatible).
  static final google = GoogleChatProvider(
    name: 'google',
    aliases: ['gemini', 'googleai', 'google-gla'],
    displayName: 'Google AI',
    defaultModelName: GoogleChatModel.defaultName,
    defaultBaseUrl: GoogleChatModel.defaultBaseUrl,
    apiKeyName: GoogleChatModel.apiKeyName,
    caps: ProviderCaps.allChat,
  );

  /// Anthropic provider (Claude, native API).
  static final anthropic = AnthropicChatProvider(
    name: 'anthropic',
    aliases: ['claude'],
    displayName: 'Anthropic',
    defaultModelName: AnthropicChatModel.defaultName,
    defaultBaseUrl: AnthropicChatModel.defaultBaseUrl,
    apiKeyName: AnthropicChatModel.apiKeyName,
    caps: ProviderCaps.allChat,
  );

  /// Native Ollama provider (local, uses ChatOllama and /api endpoint). No API
  /// key required.
  static final ollama = OllamaChatProvider(
    name: 'ollama',
    displayName: 'Ollama',
    defaultModelName: OllamaChatModel.defaultName,
    defaultBaseUrl: OllamaChatModel.defaultBaseUrl,
    apiKeyName: '',
    caps: ProviderCaps.allChat,
  );

  /// OpenAI-compatible Ollama provider (local, uses /v1 endpoint). No API key
  /// required.
  static final ollamaOpenAI = OpenAIChatProvider(
    name: 'ollama-openai',
    displayName: 'Ollama (OpenAI-compatible)',
    defaultModelName: 'llama3.1',
    defaultBaseUrl: 'http://localhost:11434/v1',
    apiKeyName: '',
    caps: ProviderCaps.allChat,
  );

  /// Returns a list of all available providers (static fields above).
  ///
  /// Use this to iterate or display all providers in a UI.
  static List<ChatProvider> get all => [
    openai,
    openrouter,
    together,
    fireworks,
    mistral,
    cohere,
    lambda,
    google,
    googleOpenAI,
    anthropic,
    ollama,
    ollamaOpenAI,
  ];

  /// Returns all providers that have the specified capabilities.
  static List<ChatProvider> allWith(Set<ProviderCaps> caps) =>
      all.where((p) => p.caps.containsAll(caps)).toList();

  /// Looks up a provider by name or alias (case-insensitive). Throws if not
  /// found.
  static ChatProvider forName(String name) => all.firstWhere(
    (p) =>
        p.name.toLowerCase() == name.toLowerCase() ||
        p.aliases.any((a) => a.toLowerCase() == name.toLowerCase()),
  );
}
