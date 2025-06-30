import 'dart:io';

import '../chat_models.dart';

typedef ProviderFactory = Provider Function(ProviderInfo info);

enum ProviderInfo {
  openai(
    name: 'openai',
    displayName: 'OpenAI',
    defaultModel: 'gpt-4o-mini',
    defaultBaseUrl: 'https://api.openai.com/v1',
    apiKeyName: 'OPENAI_API_KEY',
    isRemote: true,
    factory: _openaiFactory,
  ),
  openrouter(
    name: 'openrouter',
    displayName: 'OpenRouter',
    defaultModel: 'google/gemini-2.5-flash',
    defaultBaseUrl: 'https://openrouter.ai/api/v1',
    apiKeyName: 'OPENROUTER_API_KEY',
    isRemote: true,
    factory: _openaiFactory,
  ),
  groq(
    name: 'groq',
    displayName: 'Groq',
    defaultModel: 'llama3-70b-8192',
    defaultBaseUrl: 'https://api.groq.com/openai/v1',
    apiKeyName: 'GROQ_API_KEY',
    isRemote: true,
    factory: _openaiFactory,
  ),
  together(
    name: 'together',
    displayName: 'Together AI',
    defaultModel: 'mistralai/Mixtral-8x7B-Instruct-v0.1',
    defaultBaseUrl: 'https://api.together.xyz/v1',
    apiKeyName: 'TOGETHER_API_KEY',
    isRemote: true,
    factory: _openaiFactory,
  ),
  fireworks(
    name: 'fireworks',
    displayName: 'Fireworks AI',
    defaultModel: 'accounts/fireworks/models/llama-v3p1-70b-instruct',
    defaultBaseUrl: 'https://api.fireworks.ai/inference/v1',
    apiKeyName: 'FIREWORKS_API_KEY',
    isRemote: true,
    factory: _openaiFactory,
  ),
  mistral(
    name: 'mistral',
    displayName: 'Mistral AI',
    defaultModel: 'mistral-small-latest',
    defaultBaseUrl: 'https://api.mistral.ai/v1',
    apiKeyName: 'MISTRAL_API_KEY',
    isRemote: true,
    factory: _openaiFactory,
  ),
  cohere(
    name: 'cohere',
    displayName: 'Cohere',
    defaultModel: 'command-r-plus',
    defaultBaseUrl: 'https://api.cohere.ai/compatibility/v1',
    apiKeyName: 'COHERE_API_KEY',
    isRemote: true,
    factory: _openaiFactory,
  ),
  lambda(
    name: 'lambda',
    displayName: 'Lambda',
    defaultModel: 'llama3.2-3b-instruct',
    defaultBaseUrl: 'https://api.lambda.ai/v1',
    apiKeyName: 'LAMBDA_API_KEY',
    isRemote: true,
    factory: _openaiFactory,
  ),
  nvidia(
    name: 'nvidia',
    displayName: 'NVIDIA NIM',
    defaultModel: 'nvidia/nemotron-mini-4b-instruct',
    defaultBaseUrl: 'https://integrate.api.nvidia.com/v1',
    apiKeyName: 'NVIDIA_API_KEY',
    isRemote: true,
    factory: _openaiFactory,
  ),
  geminiOpenAI(
    name: 'gemini-openai',
    displayName: 'Google AI (OpenAI-compatible)',
    defaultModel: 'gemini-2.0-flash',
    defaultBaseUrl: 'https://generativelanguage.googleapis.com/v1beta/openai',
    apiKeyName: 'GEMINI_API_KEY',
    isRemote: true,
    factory: _openaiFactory,
  ),
  google(
    name: 'google',
    displayName: 'Google AI',
    defaultModel: 'gemini-2.0-flash',
    defaultBaseUrl: '',
    apiKeyName: 'GEMINI_API_KEY',
    isRemote: true,
    factory: _googleFactory,
  ),
  ollama(
    name: 'ollama',
    displayName: 'Ollama',
    defaultModel: 'gemma3n',
    defaultBaseUrl: 'http://localhost:11434/api',
    apiKeyName: '',
    isRemote: false,
    factory: _openaiFactory,
  );

  const ProviderInfo({
    required this.name,
    required this.displayName,
    required this.defaultModel,
    required this.defaultBaseUrl,
    required this.apiKeyName,
    required this.isRemote,
    required this.factory,
  });

  final String name;
  final String displayName;
  final String defaultModel;
  final String defaultBaseUrl;
  final String apiKeyName;
  final bool isRemote;
  final ProviderFactory factory;

  static Provider _openaiFactory(ProviderInfo info) => OpenAIProvider(
    name: info.name,
    displayName: info.displayName,
    defaultModelName: info.defaultModel,
    baseUrl: info.defaultBaseUrl,
    apiKeyName: info.apiKeyName,
  );

  static GoogleAIProvider _googleFactory(ProviderInfo info) => GoogleAIProvider(
    name: info.name,
    displayName: info.displayName,
    defaultModelName: info.defaultModel,
    baseUrl: info.defaultBaseUrl,
    apiKeyName: info.apiKeyName,
  );
}

abstract class Provider {
  String get name;
  String get displayName;

  BaseChatModel createModel({String? model});

  static Iterable<Provider> get all =>
      ProviderInfo.values.map((i) => i.factory(i));

  static Provider forInfo(ProviderInfo info) => info.factory(info);
}

class OpenAIProvider extends Provider {
  OpenAIProvider({
    required this.name,
    required this.displayName,
    this.defaultModelName,
    this.baseUrl,
    this.apiKeyName,
  });

  @override
  final String name;

  @override
  final String displayName;

  final String? defaultModelName;
  final String? baseUrl;
  final String? apiKeyName;

  @override
  BaseChatModel createModel({String? model}) => ChatOpenAI(
    apiKey: apiKeyName != null ? Platform.environment[apiKeyName] : null,
    baseUrl: baseUrl,
    defaultOptions: ChatOpenAIOptions(model: model ?? defaultModelName),
  );
}

class GoogleAIProvider extends Provider {
  GoogleAIProvider({
    required this.name,
    required this.displayName,
    this.defaultModelName,
    this.baseUrl,
    this.apiKeyName,
  });

  @override
  final String name;
  @override
  final String displayName;

  final String? defaultModelName;
  final String? baseUrl;
  final String? apiKeyName;

  @override
  BaseChatModel createModel({String? model}) => ChatGoogleGenerativeAI(
    apiKey: apiKeyName != null ? Platform.environment[apiKeyName] : null,
    baseUrl: baseUrl,
    defaultOptions: ChatGoogleGenerativeAIOptions(
      model: model ?? defaultModelName,
    ),
  );
}
