import 'dart:io';

import '../chat_models.dart';

abstract class Provider {
  const Provider({
    required this.name,
    required this.displayName,
    required this.defaultModel,
    required this.defaultBaseUrl,
    required this.apiKeyName,
    required this.isRemote,
    this.aliases = const [],
  });

  final String name;
  final List<String> aliases;
  final String displayName;
  final String defaultModel;
  final String defaultBaseUrl;
  final String apiKeyName;
  final bool isRemote;

  BaseChatModel createModel({String? model});

  // Static provider instances
  static final OpenAIProvider openai = OpenAIProvider(
    name: 'openai',
    displayName: 'OpenAI',
    defaultModel: 'gpt-4o-mini',
    defaultBaseUrl: 'https://api.openai.com/v1',
    apiKeyName: 'OPENAI_API_KEY',
    isRemote: true,
  );

  static final OpenAIProvider openrouter = OpenAIProvider(
    name: 'openrouter',
    displayName: 'OpenRouter',
    defaultModel: 'google/gemini-2.5-flash',
    defaultBaseUrl: 'https://openrouter.ai/api/v1',
    apiKeyName: 'OPENROUTER_API_KEY',
    isRemote: true,
  );

  static final OpenAIProvider groq = OpenAIProvider(
    name: 'groq',
    displayName: 'Groq',
    defaultModel: 'llama3-70b-8192',
    defaultBaseUrl: 'https://api.groq.com/openai/v1',
    apiKeyName: 'GROQ_API_KEY',
    isRemote: true,
  );

  static final OpenAIProvider together = OpenAIProvider(
    name: 'together',
    displayName: 'Together AI',
    defaultModel: 'mistralai/Mixtral-8x7B-Instruct-v0.1',
    defaultBaseUrl: 'https://api.together.xyz/v1',
    apiKeyName: 'TOGETHER_API_KEY',
    isRemote: true,
  );

  static final OpenAIProvider fireworks = OpenAIProvider(
    name: 'fireworks',
    displayName: 'Fireworks AI',
    defaultModel: 'accounts/fireworks/models/llama-v3p1-70b-instruct',
    defaultBaseUrl: 'https://api.fireworks.ai/inference/v1',
    apiKeyName: 'FIREWORKS_API_KEY',
    isRemote: true,
  );

  static final OpenAIProvider mistral = OpenAIProvider(
    name: 'mistral',
    displayName: 'Mistral AI',
    defaultModel: 'mistral-small-latest',
    defaultBaseUrl: 'https://api.mistral.ai/v1',
    apiKeyName: 'MISTRAL_API_KEY',
    isRemote: true,
  );

  static final OpenAIProvider cohere = OpenAIProvider(
    name: 'cohere',
    displayName: 'Cohere',
    defaultModel: 'command-r-plus',
    defaultBaseUrl: 'https://api.cohere.ai/compatibility/v1',
    apiKeyName: 'COHERE_API_KEY',
    isRemote: true,
  );

  static final OpenAIProvider lambda = OpenAIProvider(
    name: 'lambda',
    displayName: 'Lambda',
    defaultModel: 'llama3.2-3b-instruct',
    defaultBaseUrl: 'https://api.lambda.ai/v1',
    apiKeyName: 'LAMBDA_API_KEY',
    isRemote: true,
  );

  static final OpenAIProvider nvidia = OpenAIProvider(
    name: 'nvidia',
    displayName: 'NVIDIA NIM',
    defaultModel: 'nvidia/nemotron-mini-4b-instruct',
    defaultBaseUrl: 'https://integrate.api.nvidia.com/v1',
    apiKeyName: 'NVIDIA_API_KEY',
    isRemote: true,
  );

  static final OpenAIProvider geminiOpenAI = OpenAIProvider(
    name: 'gemini-openai',
    displayName: 'Google AI (OpenAI-compatible)',
    defaultModel: 'gemini-2.0-flash',
    defaultBaseUrl: 'https://generativelanguage.googleapis.com/v1beta/openai',
    apiKeyName: 'GEMINI_API_KEY',
    isRemote: true,
  );

  static final GoogleAIProvider google = GoogleAIProvider(
    name: 'google',
    aliases: ['gemini'],
    displayName: 'Google AI',
    defaultModel: 'gemini-2.0-flash',
    defaultBaseUrl: '',
    apiKeyName: 'GEMINI_API_KEY',
    isRemote: true,
  );

  static final OpenAIProvider ollama = OpenAIProvider(
    name: 'ollama',
    displayName: 'Ollama',
    defaultModel: 'gemma3n',
    defaultBaseUrl: 'http://localhost:11434/api',
    apiKeyName: '',
    isRemote: false,
  );

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
    ollama,
  ];

  static Provider forName(String name) => all.firstWhere(
    (p) =>
        p.name.toLowerCase() == name.toLowerCase() ||
        p.aliases.any((a) => a.toLowerCase() == name.toLowerCase()),
  );
}

class OpenAIProvider extends Provider {
  OpenAIProvider({
    required super.name,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    required super.isRemote,
  });

  @override
  BaseChatModel createModel({String? model}) => ChatOpenAI(
    apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
    baseUrl: defaultBaseUrl,
    defaultOptions: ChatOpenAIOptions(model: model ?? defaultModel),
  );
}

class GoogleAIProvider extends Provider {
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
}
