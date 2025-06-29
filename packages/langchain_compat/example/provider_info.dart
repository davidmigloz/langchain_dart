import 'dart:io';

import 'package:langchain_compat/chat_models.dart';

abstract class ProviderInfo {
  const ProviderInfo({
    required this.shortName,
    required this.displayName,
    required this.defaultModel,
    required this.defaultBaseUrl,
    required this.apiKeyEnvVar,
  });

  final String shortName;
  final String displayName;
  final String defaultModel;
  final String defaultBaseUrl;
  final String apiKeyEnvVar;

  BaseChatModel createModel({String? apiKey, String? model, String? baseUrl});
}

class OpenAIProviderInfo extends ProviderInfo {
  const OpenAIProviderInfo({
    required super.shortName,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyEnvVar,
  });

  @override
  BaseChatModel createModel({String? apiKey, String? model, String? baseUrl}) =>
      ChatOpenAI(
        apiKey: apiKey ?? Platform.environment[apiKeyEnvVar] ?? '',
        baseUrl: baseUrl ?? defaultBaseUrl,
        defaultOptions: ChatOpenAIOptions(model: model ?? defaultModel),
      );
}

class GoogleAIProviderInfo extends ProviderInfo {
  const GoogleAIProviderInfo({
    required super.shortName,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyEnvVar,
  });

  @override
  BaseChatModel createModel({String? apiKey, String? model, String? baseUrl}) =>
      ChatGoogleGenerativeAI(
        apiKey: apiKey ?? Platform.environment[apiKeyEnvVar] ?? '',
      );
}

final providers = <String, ProviderInfo>{
  'openai': const OpenAIProviderInfo(
    shortName: 'openai',
    displayName: 'OpenAI',
    defaultModel: 'gpt-4o-mini',
    defaultBaseUrl: 'https://api.openai.com/v1',
    apiKeyEnvVar: 'OPENAI_API_KEY',
  ),
  'openrouter': const OpenAIProviderInfo(
    shortName: 'openrouter',
    displayName: 'OpenRouter',
    defaultModel: 'google/gemini-2.5-flash',
    defaultBaseUrl: 'https://openrouter.ai/api/v1',
    apiKeyEnvVar: 'OPENROUTER_API_KEY',
  ),
  'groq': const OpenAIProviderInfo(
    shortName: 'groq',
    displayName: 'Groq',
    defaultModel: 'llama3-70b-8192',
    defaultBaseUrl: 'https://api.groq.com/openai/v1',
    apiKeyEnvVar: 'GROQ_API_KEY',
  ),
  'together': const OpenAIProviderInfo(
    shortName: 'together',
    displayName: 'Together AI',
    defaultModel: 'mistralai/Mixtral-8x7B-Instruct-v0.1',
    defaultBaseUrl: 'https://api.together.xyz/v1',
    apiKeyEnvVar: 'TOGETHER_API_KEY',
  ),
  'fireworks': const OpenAIProviderInfo(
    shortName: 'fireworks',
    displayName: 'Fireworks AI',
    defaultModel: 'accounts/fireworks/models/llama-v3p1-70b-instruct',
    defaultBaseUrl: 'https://api.fireworks.ai/inference/v1',
    apiKeyEnvVar: 'FIREWORKS_API_KEY',
  ),
  'mistral': const OpenAIProviderInfo(
    shortName: 'mistral',
    displayName: 'Mistral AI',
    defaultModel: 'mistral-small-latest',
    defaultBaseUrl: 'https://api.mistral.ai/v1',
    apiKeyEnvVar: 'MISTRAL_API_KEY',
  ),
  'cohere': const OpenAIProviderInfo(
    shortName: 'cohere',
    displayName: 'Cohere',
    defaultModel: 'command-r-plus',
    defaultBaseUrl: 'https://api.cohere.ai/v1',
    apiKeyEnvVar: 'COHERE_API_KEY',
  ),
  'lambda': const OpenAIProviderInfo(
    shortName: 'lambda',
    displayName: 'Lambda',
    defaultModel: 'luminous-base',
    defaultBaseUrl: 'https://api.lambda.ai/v1',
    apiKeyEnvVar: 'LAMBDA_API_KEY',
  ),
  'vercel': const OpenAIProviderInfo(
    shortName: 'vercel',
    displayName: 'Vercel AI Gateway',
    defaultModel: 'gpt-3.5-turbo',
    defaultBaseUrl: 'https://ai.vercel.com/v1',
    apiKeyEnvVar: 'VERCEL_API_KEY',
  ),
  'nvidia': const OpenAIProviderInfo(
    shortName: 'nvidia',
    displayName: 'NVIDIA NIM',
    defaultModel: 'llama-2-70b-chat',
    defaultBaseUrl: 'https://integrate.api.nvidia.com/v1',
    apiKeyEnvVar: 'NVIDIA_API_KEY',
  ),
  'gemini-openai': const OpenAIProviderInfo(
    shortName: 'gemini-openai',
    displayName: 'Gemini (Google AI, OpenAI-compatible)',
    defaultModel: 'gemini-2.0-flash',
    defaultBaseUrl: 'https://generativelanguage.googleapis.com/v1beta/openai',
    apiKeyEnvVar: 'GEMINI_API_KEY',
  ),
  'gemini-native': const GoogleAIProviderInfo(
    shortName: 'gemini-native',
    displayName: 'Gemini (Google AI, native)',
    defaultModel: 'gemini-1.5-flash',
    defaultBaseUrl: '',
    apiKeyEnvVar: 'GEMINI_API_KEY',
  ),
  'deepseek': const OpenAIProviderInfo(
    shortName: 'deepseek',
    displayName: 'DeepSeek',
    defaultModel: 'deepseek-chat',
    defaultBaseUrl: 'https://api.deepseek.com/v1',
    apiKeyEnvVar: 'DEEPSEEK_API_KEY',
  ),
};
