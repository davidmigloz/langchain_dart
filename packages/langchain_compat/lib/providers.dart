import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../chat_models.dart';

/// Provides a unified interface for accessing all major LLM, chat, and
/// embedding providers in LangChain.dart via a single import. This includes
/// OpenAI, GoogleAI, VertexAI, Anthropic, Mistral, Ollama (native and
/// OpenAI-compatible), and more. Each provider is represented as a static field
/// and can be selected by name or alias using [Provider.forName] or iterated
/// via [Provider.all].
///
/// The compat layer ensures all providers are accessible without importing
/// provider-specific packages. All configuration (API keys, base URLs, models)
/// is handled via the provider interface.
abstract class Provider<TOptions extends ChatModelOptions> {
  /// Creates a new provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'openai', 'ollama').
  /// [displayName]: Human-readable name for display. [defaultModel]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  /// [isRemote]: True if the provider is cloud-based, false if local.
  /// [aliases]: Alternative names for lookup.
  const Provider({
    required this.name,
    required this.displayName,
    required this.defaultModel,
    required this.defaultBaseUrl,
    required this.apiKeyName,
    required this.isRemote,
    this.aliases = const [],
  });

  /// The canonical provider name (e.g., 'openai', 'ollama').
  final String name;

  /// Alternative names for lookup (e.g., 'claude' for Anthropic).
  final List<String> aliases;

  /// Human-readable name for display.
  final String displayName;

  /// The default model for this provider.
  final String defaultModel;

  /// The default API endpoint for this provider.
  final String defaultBaseUrl;

  /// The environment variable for the API key (if any).
  final String apiKeyName;

  /// True if the provider is cloud-based, false if local.
  final bool isRemote;

  /// Creates a chat model instance for this provider.
  BaseChatModel<TOptions> createModel({TOptions? options});

  /// OpenAI provider (cloud, OpenAI API).
  static final openai = OpenAIProvider(
    name: 'openai',
    displayName: 'OpenAI',
    defaultModel: 'gpt-4o-mini',
    defaultBaseUrl: 'https://api.openai.com/v1',
    apiKeyName: 'OPENAI_API_KEY',
    isRemote: true,
  );

  /// OpenRouter provider (OpenAI-compatible, multi-model cloud).
  static final openrouter = OpenAIProvider(
    name: 'openrouter',
    displayName: 'OpenRouter',
    defaultModel: 'google/gemini-2.5-flash',
    defaultBaseUrl: 'https://openrouter.ai/api/v1',
    apiKeyName: 'OPENROUTER_API_KEY',
    isRemote: true,
  );

  /// Groq provider (OpenAI-compatible, cloud).
  static final groq = OpenAIProvider(
    name: 'groq',
    displayName: 'Groq',
    defaultModel: 'llama3-70b-8192',
    defaultBaseUrl: 'https://api.groq.com/openai/v1',
    apiKeyName: 'GROQ_API_KEY',
    isRemote: true,
  );

  /// Together AI provider (OpenAI-compatible, cloud).
  static final together = OpenAIProvider(
    name: 'together',
    displayName: 'Together AI',
    defaultModel: 'mistralai/Mixtral-8x7B-Instruct-v0.1',
    defaultBaseUrl: 'https://api.together.xyz/v1',
    apiKeyName: 'TOGETHER_API_KEY',
    isRemote: true,
  );

  /// Fireworks AI provider (OpenAI-compatible, cloud).
  static final fireworks = OpenAIProvider(
    name: 'fireworks',
    displayName: 'Fireworks AI',
    defaultModel: 'accounts/fireworks/models/llama-v3p1-70b-instruct',
    defaultBaseUrl: 'https://api.fireworks.ai/inference/v1',
    apiKeyName: 'FIREWORKS_API_KEY',
    isRemote: true,
  );

  /// Mistral AI provider (OpenAI-compatible, cloud).
  static final mistral = MistralProvider(
    name: 'mistral',
    displayName: 'Mistral AI',
    defaultModel: 'mistral-small',
    defaultBaseUrl: 'https://api.mistral.ai/v1',
    apiKeyName: 'MISTRAL_API_KEY',
    isRemote: true,
  );

  /// Cohere provider (OpenAI-compatible, cloud). Note: streamOptions is
  /// forcibly set to null for compatibility.
  static final cohere = CohereOpenAIProvider(
    name: 'cohere',
    displayName: 'Cohere',
    defaultModel: 'command-r-plus',
    defaultBaseUrl: 'https://api.cohere.ai/compatibility/v1',
    apiKeyName: 'COHERE_API_KEY',
    isRemote: true,
  );

  /// Lambda provider (OpenAI-compatible, cloud).
  static final lambda = OpenAIProvider(
    name: 'lambda',
    displayName: 'Lambda',
    defaultModel: 'llama3.2-3b-instruct',
    defaultBaseUrl: 'https://api.lambda.ai/v1',
    apiKeyName: 'LAMBDA_API_KEY',
    isRemote: true,
  );

  /// NVIDIA NIM provider (OpenAI-compatible, cloud).
  static final nvidia = OpenAIProvider(
    name: 'nvidia',
    displayName: 'NVIDIA NIM',
    defaultModel: 'nvidia/nemotron-mini-4b-instruct',
    defaultBaseUrl: 'https://integrate.api.nvidia.com/v1',
    apiKeyName: 'NVIDIA_API_KEY',
    isRemote: true,
  );

  /// Gemini (OpenAI-compatible) provider (Google AI, OpenAI API).
  static final geminiOpenAI = OpenAIProvider(
    name: 'gemini-openai',
    displayName: 'Google AI (OpenAI-compatible)',
    defaultModel: 'gemini-2.0-flash',
    defaultBaseUrl: 'https://generativelanguage.googleapis.com/v1beta/openai',
    apiKeyName: 'GEMINI_API_KEY',
    isRemote: true,
  );

  /// Google Gemini native provider (uses Gemini API, not OpenAI-compatible).
  static final google = GoogleAIProvider(
    name: 'google',
    aliases: ['gemini', 'googleai', 'google-gla'],
    displayName: 'Google AI',
    defaultModel: 'gemini-2.0-flash',
    defaultBaseUrl: '',
    apiKeyName: 'GEMINI_API_KEY',
    isRemote: true,
  );

  /// Anthropic provider (Claude, native API).
  static final anthropic = AnthropicProvider(
    name: 'anthropic',
    aliases: ['claude'],
    displayName: 'Anthropic',
    defaultModel: ChatAnthropic.defaultModel,
    defaultBaseUrl: 'https://api.anthropic.com/v1',
    apiKeyName: 'ANTHROPIC_API_KEY',
    isRemote: true,
  );

  /// Native Ollama provider (local, uses ChatOllama and /api endpoint). Default
  /// model: gemma3n. No API key required.
  static final ollama = OllamaProvider(
    name: 'ollama',
    displayName: 'Ollama',
    defaultModel: 'llama3.1',
    defaultBaseUrl: 'http://localhost:11434/api',
    apiKeyName: '',
    isRemote: false,
  );

  /// OpenAI-compatible Ollama provider (local, uses /v1 endpoint). Default
  /// model: gemma3n. No API key required.
  static final ollamaOpenAI = OpenAIProvider(
    name: 'ollama-openai',
    displayName: 'Ollama (OpenAI-compatible)',
    defaultModel: 'llama3.1',
    defaultBaseUrl: 'http://localhost:11434/v1',
    apiKeyName: '',
    isRemote: false,
  );

  /// Returns a list of all available providers (static fields above).
  ///
  /// Use this to iterate or display all providers in a UI.
  static List<Provider> get all => [
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
  static Provider forName(String name) => all.firstWhere(
    (p) =>
        p.name.toLowerCase() == name.toLowerCase() ||
        p.aliases.any((a) => a.toLowerCase() == name.toLowerCase()),
  );

  /// Returns all available models for this provider.
  ///
  /// May cache results for the lifetime of the provider instance.
  Future<Iterable<ModelInfo>> listModels();
}

/// The kind of model supported by a provider.
///
/// Used to classify models for listing, filtering, and selection.
/// - [chat]: Chat completion models for conversational AI
/// - [image]: Image generation or vision models
/// - [embedding]: Text embedding models for semantic similarity
/// - [audio]: Audio processing models (speech-to-text, etc.)
/// - [tts]: Text-to-speech models
/// - [countTokens]: Count the number of tokens in a text string
/// - [other]: Other specialized model types
enum ModelKind {
  /// Chat completion models for conversational AI
  chat,

  /// Image generation or vision models
  image,

  /// Text embedding models for semantic similarity
  embedding,

  /// Audio processing models (speech-to-text, etc.)
  audio,

  /// Text-to-speech models
  tts,

  /// Count the number of tokens in a text string
  countTokens,

  /// Other specialized model types
  other,
}

/// Model metadata for provider model listing.
///
/// Returned by [Provider.listModels] for all providers. Contains the model id,
/// kind, name, description, and any extra metadata.
class ModelInfo {
  /// Creates a new [ModelInfo] instance.
  ///
  /// [name]: The unique name for the model (required). [kinds]: The set of
  /// kinds of model (required, non-empty). [displayName]: The display name of
  /// the model, if available. [description]: A description of the model, if
  /// available. [extra]: Any extra metadata returned by the provider (default:
  /// empty map).
  ModelInfo({
    required this.name,
    required this.kinds,
    this.displayName,
    this.description,
    this.extra = const {},
  }) : assert(kinds.isNotEmpty, 'kinds must not be empty');

  /// The unique name for the model (required).
  final String name;

  /// The set of kinds of model (text, embedding, rerank, etc). Must not be
  /// empty.
  final Set<ModelKind> kinds;

  /// The display name of the model, if available.
  final String? displayName;

  /// A description of the model, if available.
  final String? description;

  /// Any extra metadata returned by the provider.
  final Map<String, dynamic> extra;
}

/// Provider for OpenAI-compatible APIs (OpenAI, Groq, Together, etc.). Handles
/// API key, base URL, and model configuration.
class OpenAIProvider extends Provider<ChatOpenAIOptions> {
  /// Creates a new OpenAI provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'openai', 'groq').
  /// [displayName]: Human-readable name for display. [defaultModel]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  /// [isRemote]: True if the provider is cloud-based, false if local.
  OpenAIProvider({
    required super.name,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    required super.isRemote,
  });

  List<ModelInfo>? _cachedModels;

  @override
  BaseChatModel<ChatOpenAIOptions> createModel({ChatOpenAIOptions? options}) {
    final opts = ChatOpenAIOptions(
      model: options?.model ?? defaultModel,
      temperature: options?.temperature,
      topP: options?.topP,
      n: options?.n,
      maxTokens: options?.maxTokens,
      presencePenalty: options?.presencePenalty,
      frequencyPenalty: options?.frequencyPenalty,
      logitBias: options?.logitBias,
      stop: options?.stop,
      user: options?.user,
      tools: options?.tools,
      toolChoice: options?.toolChoice,
      responseFormat: options?.responseFormat,
      seed: options?.seed,
      parallelToolCalls: options?.parallelToolCalls,
      streamOptions: options?.streamOptions,
      serviceTier: options?.serviceTier,
      concurrencyLimit: options?.concurrencyLimit ?? 1000,
    );
    return ChatOpenAI(
      apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
      baseUrl: defaultBaseUrl,
      defaultOptions: opts,
    );
  }

  @override
  Future<Iterable<ModelInfo>> listModels() async {
    if (_cachedModels != null) return _cachedModels!;
    final apiKey = apiKeyName.isNotEmpty
        ? Platform.environment[apiKeyName]
        : null;
    final url = Uri.parse('$defaultBaseUrl/models');
    final headers = <String, String>{
      if (apiKeyName.isNotEmpty && apiKey != null && apiKey.isNotEmpty)
        'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch models: \\${response.body}');
    }
    final data = jsonDecode(response.body);
    late final Iterable<ModelInfo> models;
    Iterable<ModelInfo> mapModels(Iterable mList) => mList.map((m) {
      // ignore: avoid_dynamic_calls
      final id = m['id'] as String;
      final kinds = <ModelKind>{};
      // ignore: avoid_dynamic_calls
      final object = m['object']?.toString() ?? '';
      // Heuristics for OpenAI model kinds
      if (id.contains('embedding')) kinds.add(ModelKind.embedding);
      if (id.contains('tts')) kinds.add(ModelKind.tts);
      if (id.contains('vision') ||
          id.contains('dall-e') ||
          id.contains('image')) {
        kinds.add(ModelKind.image);
      }
      if (id.contains('audio')) kinds.add(ModelKind.audio);
      if (id.contains('count-tokens')) kinds.add(ModelKind.countTokens);
      // Most models are chat if not otherwise classified
      if (object == 'model' ||
          id.contains('gpt') ||
          id.contains('chat') ||
          id.contains('claude') ||
          id.contains('mixtral') ||
          id.contains('llama') ||
          id.contains('command') ||
          id.contains('sonnet')) {
        kinds.add(ModelKind.chat);
      }
      if (kinds.isEmpty) kinds.add(ModelKind.other);
      assert(kinds.isNotEmpty, 'Model $id returned with empty kinds set');
      return ModelInfo(
        name: id,
        kinds: kinds,
        description: object.isNotEmpty ? object : null,
        extra: {
          ...m,
          // ignore: avoid_dynamic_calls
          if (m.containsKey('context_window'))
            // ignore: avoid_dynamic_calls
            'contextWindow': m['context_window'],
        }..removeWhere((k, _) => ['id', 'object'].contains(k)),
      );
    });
    if (data is List) {
      models = mapModels(data);
    } else if (data is Map<String, dynamic>) {
      final modelsList = data['data'] as List?;
      if (modelsList == null) {
        throw Exception('No models found in response: \\${response.body}');
      }
      models = mapModels(modelsList);
    } else {
      throw Exception('Unexpected models response shape: \\${response.body}');
    }
    _cachedModels = models.toList();
    return _cachedModels!;
  }
}

/// Provider for Google Gemini native API.
class GoogleAIProvider extends Provider<ChatGoogleGenerativeAIOptions> {
  /// Creates a new Google AI provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'google', 'gemini').
  /// [displayName]: Human-readable name for display. [defaultModel]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  /// [isRemote]: True if the provider is cloud-based, false if local.
  GoogleAIProvider({
    required super.name,
    required super.aliases,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    required super.isRemote,
  });

  List<ModelInfo>? _cachedModels;

  @override
  BaseChatModel<ChatGoogleGenerativeAIOptions> createModel({
    ChatGoogleGenerativeAIOptions? options,
  }) => ChatGoogleGenerativeAI(
    apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
    baseUrl: defaultBaseUrl,
    defaultOptions: ChatGoogleGenerativeAIOptions(
      model: options?.model ?? defaultModel,
      topP: options?.topP,
      topK: options?.topK,
      candidateCount: options?.candidateCount,
      maxOutputTokens: options?.maxOutputTokens,
      temperature: options?.temperature,
      stopSequences: options?.stopSequences,
      responseMimeType: options?.responseMimeType,
      responseSchema: options?.responseSchema,
      safetySettings: options?.safetySettings,
      enableCodeExecution: options?.enableCodeExecution,
      tools: options?.tools,
      toolChoice: options?.toolChoice,
      concurrencyLimit: options?.concurrencyLimit ?? 1000,
    ),
  );

  @override
  Future<Iterable<ModelInfo>> listModels() async {
    if (_cachedModels != null) return _cachedModels!;
    final apiKey = apiKeyName.isNotEmpty
        ? Platform.environment[apiKeyName]
        : null;
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('Missing API key for $name');
    }
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models',
    );
    final response = await http.get(url, headers: {'x-goog-api-key': apiKey});
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch Gemini models: \\${response.body}');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final models = (data['models'] as List).cast<Map<String, dynamic>>().map((
      m,
    ) {
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
      return ModelInfo(
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
    });
    _cachedModels = models.toList();
    return _cachedModels!;
  }
}

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

  List<ModelInfo>? _cachedModels;

  @override
  BaseChatModel<ChatAnthropicOptions> createModel({
    ChatAnthropicOptions? options,
  }) => ChatAnthropic(
    apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
    baseUrl: defaultBaseUrl,
    defaultOptions: ChatAnthropicOptions(
      model: options?.model ?? defaultModel,
      temperature: options?.temperature,
      topP: options?.topP,
      topK: options?.topK,
      maxTokens: options?.maxTokens,
      stopSequences: options?.stopSequences,
      userId: options?.userId,
      tools: options?.tools,
      toolChoice: options?.toolChoice,
      concurrencyLimit: options?.concurrencyLimit ?? 1000,
    ),
  );

  /// Returns all available models for this provider from the Anthropic API.
  ///
  /// Calls the Anthropic models endpoint, parses the response, and returns a
  /// complete, accurate, and richly-typed list of models, including all
  /// relevant metadata. Results are cached for the lifetime of the provider
  /// instance. Throws if the API call fails or the response is malformed.
  @override
  Future<Iterable<ModelInfo>> listModels() async {
    if (_cachedModels != null) return _cachedModels!;
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
    _cachedModels = models;
    return _cachedModels!;
  }
}

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
    ChatMistralAIOptions? options,
  }) => ChatMistralAI(
    apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
    baseUrl: defaultBaseUrl,
    defaultOptions: ChatMistralAIOptions(
      model: options?.model ?? defaultModel,
      temperature: options?.temperature,
      topP: options?.topP,
      maxTokens: options?.maxTokens,
      safePrompt: options?.safePrompt,
      randomSeed: options?.randomSeed,
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

/// Provider for native Ollama API (local, not OpenAI-compatible).
class OllamaProvider extends Provider<ChatOllamaOptions> {
  /// Creates a new Ollama provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'ollama', 'ollama-openai').
  /// [displayName]: Human-readable name for display. [defaultModel]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  /// [isRemote]: True if the provider is cloud-based, false if local.
  OllamaProvider({
    required super.name,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    required super.isRemote,
  });

  @override
  BaseChatModel<ChatOllamaOptions> createModel({ChatOllamaOptions? options}) =>
      ChatOllama(
        baseUrl: defaultBaseUrl,
        defaultOptions: ChatOllamaOptions(
          model: options?.model ?? defaultModel,
          format: options?.format,
          keepAlive: options?.keepAlive,
          numKeep: options?.numKeep,
          seed: options?.seed,
          numPredict: options?.numPredict,
          topK: options?.topK,
          topP: options?.topP,
          minP: options?.minP,
          tfsZ: options?.tfsZ,
          typicalP: options?.typicalP,
          repeatLastN: options?.repeatLastN,
          temperature: options?.temperature,
          repeatPenalty: options?.repeatPenalty,
          presencePenalty: options?.presencePenalty,
          frequencyPenalty: options?.frequencyPenalty,
          mirostat: options?.mirostat,
          mirostatTau: options?.mirostatTau,
          mirostatEta: options?.mirostatEta,
          penalizeNewline: options?.penalizeNewline,
          stop: options?.stop,
          numa: options?.numa,
          numCtx: options?.numCtx,
          numBatch: options?.numBatch,
          numGpu: options?.numGpu,
          mainGpu: options?.mainGpu,
          lowVram: options?.lowVram,
          f16KV: options?.f16KV,
          logitsAll: options?.logitsAll,
          vocabOnly: options?.vocabOnly,
          useMmap: options?.useMmap,
          useMlock: options?.useMlock,
          numThread: options?.numThread,
          tools: options?.tools,
          toolChoice: options?.toolChoice,
          concurrencyLimit: options?.concurrencyLimit ?? 1000,
        ),
      );

  @override
  Future<Iterable<ModelInfo>> listModels() async {
    final url = Uri.parse('$defaultBaseUrl/tags');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch Ollama models: ${response.body}');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    // Defensive: ensure 'name' is a String, fallback to '' if not.
    return (data['models'] as List).cast<Map<String, dynamic>>().map((m) {
      final nameField = m['name'];
      final id = nameField is String ? nameField : '';
      final name = nameField is String ? nameField : null;
      final detailsField = m['details'];
      final description = detailsField is String ? detailsField : null;
      return ModelInfo(
        name: id,
        kinds: {ModelKind.chat},
        displayName: name,
        description: description,
        extra: {...m}..removeWhere((k, _) => ['name', 'details'].contains(k)),
      );
    });
  }
}

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
  BaseChatModel<ChatCohereOptions> createModel({ChatCohereOptions? options}) {
    final opts = ChatCohereOptions(
      model: options?.model ?? defaultModel,
      frequencyPenalty: options?.frequencyPenalty,
      logitBias: options?.logitBias,
      maxTokens: options?.maxTokens,
      n: options?.n,
      presencePenalty: options?.presencePenalty,
      responseFormat: options?.responseFormat,
      seed: options?.seed,
      stop: options?.stop,
      temperature: options?.temperature,
      topP: options?.topP,
      tools: options?.tools,
      toolChoice: options?.toolChoice,
      parallelToolCalls: options?.parallelToolCalls,
      serviceTier: options?.serviceTier,
      user: options?.user,
      concurrencyLimit: options?.concurrencyLimit ?? 1000,
      streamOptions: null, // Cohere requires streamOptions to be null
    );
    return ChatCohere(
      apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
      baseUrl: defaultBaseUrl,
      defaultOptions: opts,
    );
  }
}
