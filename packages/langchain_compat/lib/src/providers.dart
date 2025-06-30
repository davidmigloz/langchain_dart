import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:openai_dart/openai_dart.dart';

import '../chat_models.dart';
import 'chat_models/chat_ollama/types.dart';

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
abstract class Provider {
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

  /// Creates a chat model instance for this provider. Optionally override the
  /// model name.
  BaseChatModel createModel({String? model});

  /// Returns all available models for this provider.
  Future<Iterable<ModelInfo>> listModels();

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
  static final cohere = OpenAIProvider(
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
}

/// Model metadata for provider model listing. Information about a model
/// returned by a provider.
class ModelInfo {
  /// Creates a new [ModelInfo] instance.
  const ModelInfo({
    required this.id,
    this.name,
    this.description,
    this.contextWindow,
    this.extra,
  });

  /// The unique identifier for the model (required).
  final String id;

  /// The display name of the model, if available.
  final String? name;

  /// A description of the model, if available.
  final String? description;

  /// The maximum context window (token limit) for the model, if available.
  final int? contextWindow;

  /// Any extra metadata returned by the provider.
  final Map<String, dynamic>? extra;
}

/// Provider for OpenAI-compatible APIs (OpenAI, Groq, Together, etc.). Handles
/// API key, base URL, and model configuration.
class OpenAIProvider extends Provider {
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

  @override
  BaseChatModel createModel({String? model}) {
    // For Cohere, forcibly disable include_usage because their
    // OpenAI-compatible endpoint does not support it and will error if present.
    // This is not user-overridable. For all other OpenAI-compatible providers,
    // the default behavior is used.
    if (name == 'cohere') {
      return ChatOpenAI(
        apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
        baseUrl: defaultBaseUrl,
        // Cohere's OpenAI-compatible endpoint does not support streamOptions.
        // Force streamOptions to null.
        defaultOptions: ChatOpenAIOptions(
          model: model ?? defaultModel,
          streamOptions: null,
        ),
      );
    }
    return ChatOpenAI(
      apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
      baseUrl: defaultBaseUrl,
      defaultOptions: ChatOpenAIOptions(model: model ?? defaultModel),
    );
  }

  @override
  Future<Iterable<ModelInfo>> listModels() async {
    final apiKey = apiKeyName.isNotEmpty
        ? Platform.environment[apiKeyName]
        : null;
    // Make a manual HTTP request to /models first to check the response type.
    final url = Uri.parse('$defaultBaseUrl/models');
    final headers = <String, String>{
      if (apiKeyName.isNotEmpty && apiKey != null && apiKey.isNotEmpty)
        'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch models: ${response.body}');
    }
    final data = jsonDecode(response.body);
    if (data is List) {
      // TogetherAI and similar: top-level list
      return data.map(
        (m) => ModelInfo(
          // ignore: avoid_dynamic_calls
          id: m['id'] as String? ?? '',
          // ignore: avoid_dynamic_calls
          name: m['id'] as String?,
          // ignore: avoid_dynamic_calls
          description: m['object']?.toString(),
          contextWindow: null,
          extra: m as Map<String, dynamic>?,
        ),
      );
    } else if (data is Map<String, dynamic>) {
      // OpenAI: top-level map, use SDK for full compatibility
      if (apiKeyName.isNotEmpty) {
        if (apiKey == null || apiKey.isEmpty) {
          throw Exception('Missing API key for $name');
        }
        final client = OpenAIClient(apiKey: apiKey, baseUrl: defaultBaseUrl);
        final sdkResponse = await client.listModels();
        return sdkResponse.data.map(
          (m) => ModelInfo(
            id: m.id,
            name: m.id, // OpenAI doesn't provide a friendly name
            description: m.object?.toString(),
            contextWindow: null, // Not available in API
            extra: m.toJson(),
          ),
        );
      } else {
        // No API key required, parse manually
        final models = data['data'] as List?;
        if (models == null) {
          throw Exception('No models found in response: ${response.body}');
        }
        return models.map(
          (m) => ModelInfo(
            // ignore: avoid_dynamic_calls
            id: m['id'] as String? ?? '',
            // ignore: avoid_dynamic_calls
            name: m['id'] as String?,
            // ignore: avoid_dynamic_calls
            description: m['object']?.toString(),
            contextWindow: null,
            extra: m as Map<String, dynamic>?,
          ),
        );
      }
    } else {
      throw Exception('Unexpected models response shape: ${response.body}');
    }
  }
}

/// Provider for Google Gemini native API.
class GoogleAIProvider extends Provider {
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

  @override
  BaseChatModel createModel({String? model}) => ChatGoogleGenerativeAI(
    apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
    baseUrl: defaultBaseUrl,
    defaultOptions: ChatGoogleGenerativeAIOptions(model: model ?? defaultModel),
  );

  @override
  Future<Iterable<ModelInfo>> listModels() async {
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
      throw Exception('Failed to fetch Gemini models: ${response.body}');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return (data['models'] as List).cast<Map<String, dynamic>>().map(
      (m) => ModelInfo(
        id: m['name'] as String? ?? '',
        name: m['displayName'] as String?,
        description: m['description'] as String?,
        contextWindow: m['inputTokenLimit'] as int?,
        extra: m,
      ),
    );
  }
}

/// Provider for Anthropic Claude native API.
class AnthropicProvider extends Provider {
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
  BaseChatModel createModel({String? model}) => ChatAnthropic(
    apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
    baseUrl: defaultBaseUrl,
    defaultOptions: ChatAnthropicOptions(model: model ?? defaultModel),
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
    final response = await http.get(url, headers: {'x-api-key': apiKey});
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch Anthropic models: ${response.body}');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return (data['models'] as List).cast<Map<String, dynamic>>().map(
      (m) => ModelInfo(
        id: m['id'] as String? ?? '',
        name: m['name'] as String?,
        description: m['description'] as String?,
        contextWindow: m['context_length'] as int?,
        extra: m,
      ),
    );
  }
}

/// Provider for Mistral AI (OpenAI-compatible).
class MistralProvider extends Provider {
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
  BaseChatModel createModel({String? model}) => ChatMistralAI(
    apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
    baseUrl: defaultBaseUrl,
    defaultOptions: ChatMistralAIOptions(model: model ?? defaultModel),
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
      throw Exception('Failed to fetch Mistral models: ${response.body}');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return (data['data'] as List).cast<Map<String, dynamic>>().map(
      (m) => ModelInfo(
        id: m['id'] as String? ?? '',
        name: m['name'] as String?,
        description: m['description'] as String?,
        contextWindow: m['context_length'] as int?,
        extra: m,
      ),
    );
  }
}

/// Provider for native Ollama API (local, not OpenAI-compatible).
class OllamaProvider extends Provider {
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
  BaseChatModel createModel({String? model}) => ChatOllama(
    baseUrl: defaultBaseUrl,
    defaultOptions: ChatOllamaOptions(model: model ?? defaultModel),
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
      if (nameField is! String) {
        // ignore: avoid_print
        print('Ollama model entry with non-string name: $nameField');
      }
      final detailsField = m['details'];
      final description = detailsField is String ? detailsField : null;
      if (detailsField != null && detailsField is! String) {
        // ignore: avoid_print
        print('Ollama model entry with non-string details: $detailsField');
      }
      return ModelInfo(
        id: id,
        name: name,
        description: description,
        contextWindow: null, // Not available
        extra: m,
      );
    });
  }
}
