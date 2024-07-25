// ignore_for_file: public_member_api_docs

enum Provider {
  googleAI(
    name: 'GoogleAI',
    defaultModel: 'gemini-1.5-pro',
    defaultBaseUrl: 'https://generativelanguage.googleapis.com/v1beta',
    isRemote: true,
  ),
  mistral(
    name: 'Mistral',
    defaultModel: 'mistral-small',
    defaultBaseUrl: 'https://api.mistral.ai/v1',
    isRemote: true,
  ),
  openAI(
    name: 'OpenAI',
    defaultModel: 'gpt-4o',
    defaultBaseUrl: 'https://api.openai.com/v1',
    isRemote: true,
  ),
  ollama(
    name: 'Ollama',
    defaultModel: 'llama3.1',
    defaultBaseUrl: 'http://localhost:11434/api',
    isRemote: false,
  );

  const Provider({
    required this.name,
    required this.defaultModel,
    required this.defaultBaseUrl,
    required this.isRemote,
  });

  final String name;
  final String defaultModel;
  final String defaultBaseUrl;
  final bool isRemote;
}
