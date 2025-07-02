import '../chat_models/chat_model.dart';
import '../chat_models/chat_model_options.dart';
import '../tools/tool_spec.dart';
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
  /// [displayName]: Human-readable name for display. [defaultModel]: The
  /// default model for this provider (null means use model's own default).
  /// [defaultBaseUrl]: The default API endpoint. [apiKeyName]: The environment
  /// variable for the API key (if any). [aliases]: Alternative names for
  /// lookup.
  const ChatProvider({
    required this.name,
    required this.displayName,
    required this.defaultModel,
    required this.defaultBaseUrl,
    required this.apiKeyName,
    this.aliases = const [],
  });

  /// The canonical provider name (e.g., 'openai', 'ollama').
  final String name;

  /// Alternative names for lookup (e.g., 'claude' for Anthropic).
  final List<String> aliases;

  /// Human-readable name for display.
  final String displayName;

  /// The default model for this provider (null means use model's own default).
  final String? defaultModel;

  /// The default API endpoint for this provider.
  final String defaultBaseUrl;

  /// The environment variable for the API key (if any).
  final String apiKeyName;

  /// Creates a chat model instance for this provider.
  ChatModel<TOptions> createModel({
    String? model,
    List<ToolSpec>? tools,
    double? temperature,
    TOptions? options,
  });

  /// OpenAI provider (cloud, OpenAI API).
  static final openai = OpenAIProvider(
    name: 'openai',
    displayName: 'OpenAI',
    defaultModel: null, // use ChatOpenAI.defaultModelName
    defaultBaseUrl: 'https://api.openai.com/v1',
    apiKeyName: 'OPENAI_API_KEY',
  );

  /// OpenRouter provider (OpenAI-compatible, multi-model cloud).
  static final openrouter = OpenAIProvider(
    name: 'openrouter',
    displayName: 'OpenRouter',
    defaultModel: 'google/gemini-2.5-flash',
    defaultBaseUrl: 'https://openrouter.ai/api/v1',
    apiKeyName: 'OPENROUTER_API_KEY',
  );

  /// Groq provider (OpenAI-compatible, cloud).
  static final groq = OpenAIProvider(
    name: 'groq',
    displayName: 'Groq',
    defaultModel: 'llama3-70b-8192',
    defaultBaseUrl: 'https://api.groq.com/openai/v1',
    apiKeyName: 'GROQ_API_KEY',
  );

  /// Together AI provider (OpenAI-compatible, cloud).
  static final together = OpenAIProvider(
    name: 'together',
    displayName: 'Together AI',
    defaultModel: 'mistralai/Mixtral-8x7B-Instruct-v0.1',
    defaultBaseUrl: 'https://api.together.xyz/v1',
    apiKeyName: 'TOGETHER_API_KEY',
  );

  /// Fireworks AI provider (OpenAI-compatible, cloud).
  static final fireworks = OpenAIProvider(
    name: 'fireworks',
    displayName: 'Fireworks AI',
    defaultModel: 'accounts/fireworks/models/llama-v3p1-70b-instruct',
    defaultBaseUrl: 'https://api.fireworks.ai/inference/v1',
    apiKeyName: 'FIREWORKS_API_KEY',
  );

  /// Mistral AI provider (native API, cloud).
  static final mistral = MistralProvider(
    name: 'mistral',
    displayName: 'Mistral AI',
    defaultModel: null, // use ChatMistralAI.defaultModelName
    defaultBaseUrl: 'https://api.mistral.ai/v1',
    apiKeyName: 'MISTRAL_API_KEY',
  );

  /// Cohere provider (OpenAI-compatible, cloud). Note: streamOptions is
  /// forcibly set to null for compatibility.
  static final cohere = CohereOpenAIProvider(
    name: 'cohere',
    displayName: 'Cohere',
    defaultModel: 'command-r-plus',
    defaultBaseUrl: 'https://api.cohere.ai/compatibility/v1',
    apiKeyName: 'COHERE_API_KEY',
  );

  /// Lambda provider (OpenAI-compatible, cloud).
  static final lambda = OpenAIProvider(
    name: 'lambda',
    displayName: 'Lambda',
    defaultModel: 'llama3.2-3b-instruct',
    defaultBaseUrl: 'https://api.lambda.ai/v1',
    apiKeyName: 'LAMBDA_API_KEY',
  );

  /// NVIDIA NIM provider (OpenAI-compatible, cloud).
  static final nvidia = OpenAIProvider(
    name: 'nvidia',
    displayName: 'NVIDIA NIM',
    defaultModel: 'nvidia/nemotron-mini-4b-instruct',
    defaultBaseUrl: 'https://integrate.api.nvidia.com/v1',
    apiKeyName: 'NVIDIA_API_KEY',
  );

  /// Gemini (OpenAI-compatible) provider (Google AI, OpenAI API).
  static final geminiOpenAI = OpenAIProvider(
    name: 'gemini-openai',
    displayName: 'Google AI (OpenAI-compatible)',
    defaultModel: 'gemini-2.0-flash',
    defaultBaseUrl: 'https://generativelanguage.googleapis.com/v1beta/openai',
    apiKeyName: 'GEMINI_API_KEY',
  );

  /// Google Gemini native provider (uses Gemini API, not OpenAI-compatible).
  static final google = GoogleProvider(
    name: 'google',
    aliases: ['gemini', 'googleai', 'google-gla'],
    displayName: 'Google AI',
    defaultModel: null, // use ChatGoogleGenerativeAI.defaultModelName
    defaultBaseUrl: '',
    apiKeyName: 'GEMINI_API_KEY',
  );

  /// Anthropic provider (Claude, native API).
  static final anthropic = AnthropicProvider(
    name: 'anthropic',
    aliases: ['claude'],
    displayName: 'Anthropic',
    defaultModel: null, // use ChatAnthropic.defaultModelName
    defaultBaseUrl: 'https://api.anthropic.com/v1',
    apiKeyName: 'ANTHROPIC_API_KEY',
  );

  /// Native Ollama provider (local, uses ChatOllama and /api endpoint). No API
  /// key required.
  static final ollama = OllamaProvider(
    name: 'ollama',
    displayName: 'Ollama',
    defaultModel: null, // use ChatOllama.defaultModelName
    defaultBaseUrl: 'http://localhost:11434/api',
    apiKeyName: '',
  );

  /// OpenAI-compatible Ollama provider (local, uses /v1 endpoint). No API key
  /// required.
  static final ollamaOpenAI = OpenAIProvider(
    name: 'ollama-openai',
    displayName: 'Ollama (OpenAI-compatible)',
    defaultModel: 'llama3.1',
    defaultBaseUrl: 'http://localhost:11434/v1',
    apiKeyName: '',
  );

  /// Returns a list of all available providers (static fields above).
  ///
  /// Use this to iterate or display all providers in a UI.
  static List<ChatProvider> get all => [
    openai,
    openrouter,
    groq,
    together,
    fireworks,
    mistral,
    cohere,
    lambda,
    nvidia,
    geminiOpenAI,
    google,
    anthropic,
    ollama,
    ollamaOpenAI,
  ];

  /// Looks up a provider by name or alias (case-insensitive). Throws if not
  /// found.
  static ChatProvider forName(String name) => all.firstWhere(
    (p) =>
        p.name.toLowerCase() == name.toLowerCase() ||
        p.aliases.any((a) => a.toLowerCase() == name.toLowerCase()),
  );

  /// Returns all available models for this provider.
  ///
  /// Implementations may or may not cache results. If your application requires
  /// caching, you should implement it yourself rather than relying on the
  /// provider.
  Future<Iterable<ModelInfo>> listModels();
}
