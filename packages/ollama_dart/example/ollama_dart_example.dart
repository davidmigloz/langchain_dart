// ignore_for_file: avoid_print
import 'package:ollama_dart/ollama_dart.dart';

Future<void> main() async {
  final client = OllamaClient();

  // Completions
  await _generateCompletion(client);
  await _generateCompletionWithImage(client);
  await _generateCompletionStream(client);
  await _generateChatCompletion(client);
  await _generateChatCompletionWithHistory(client);
  await _generateChatCompletionStream(client);

  // Embeddings
  await _generateEmbedding(client);

  // Models
  await _createModel(client);
  await _createModelStream(client);
  await _listModels(client);
  await _showModelInfo(client);
  await _pullModel(client);
  await _pullModelStream(client);
  await _pushModel(client);
  await _pushModelStream(client);
  await _checkBlob(client);

  client.endSession();
}

Future<void> _generateCompletion(final OllamaClient client) async {
  final generated = await client.generateCompletion(
    request: const GenerateCompletionRequest(
      model: 'mistral:latest',
      prompt: 'Why is the sky blue?',
    ),
  );
  print(generated.response);
}

Future<void> _generateCompletionWithImage(final OllamaClient client) async {
  final generated = await client.generateCompletion(
    request: const GenerateCompletionRequest(
      model: 'llava:latest',
      prompt: "What's in the image?",
      images: [
        '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',
      ],
    ),
  );
  print(generated.response);
}

Future<void> _generateCompletionStream(final OllamaClient client) async {
  final stream = client.generateCompletionStream(
    request: const GenerateCompletionRequest(
      model: 'mistral:latest',
      prompt: 'Why is the sky blue?',
    ),
  );
  String text = '';
  await for (final res in stream) {
    text += res.response?.trim() ?? '';
  }
  print(text);
}

Future<void> _generateChatCompletion(final OllamaClient client) async {
  final generated = await client.generateChatCompletion(
    request: const GenerateChatCompletionRequest(
      model: 'llama2:latest',
      messages: [
        Message(
          role: MessageRole.system,
          content: 'why is the sky blue?',
        ),
        Message(
          role: MessageRole.user,
          content: 'due to rayleigh scattering.',
        ),
        Message(
          role: MessageRole.user,
          content: 'how is that different than mie scattering?',
        ),
      ],
    ),
  );
  print(generated.message?.content);
}

Future<void> _generateChatCompletionWithHistory(
  final OllamaClient client,
) async {
  final generated = await client.generateChatCompletion(
    request: const GenerateChatCompletionRequest(
      model: 'llama2:latest',
      messages: [
        Message(
          role: MessageRole.user,
          content: 'You are a helpful assistant.',
        ),
        Message(
          role: MessageRole.assistant,
          content: 'Why is the sky blue?',
        ),
        Message(
          role: MessageRole.user,
          content: 'You are a helpful assistant.',
        ),
      ],
    ),
  );
  print(generated.message?.content);
}

Future<void> _generateChatCompletionStream(final OllamaClient client) async {
  final stream = client.generateChatCompletionStream(
    request: const GenerateChatCompletionRequest(
      model: 'llama2:latest',
      messages: [
        Message(
          role: MessageRole.system,
          content: 'You are a helpful assistant.',
        ),
        Message(
          role: MessageRole.user,
          content: 'Why is the sky blue?',
        ),
      ],
    ),
  );
  String text = '';
  await for (final res in stream) {
    text += (res.message?.content ?? '').trim();
  }
  print(text);
}

Future<void> _generateEmbedding(final OllamaClient client) async {
  final generated = await client.generateEmbedding(
    request: const GenerateEmbeddingRequest(
      model: 'mistral:latest',
      prompt: 'Why is the sky blue?',
    ),
  );
  print(generated.embedding);
}

Future<void> _createModel(final OllamaClient client) async {
  final res = await client.createModel(
    request: const CreateModelRequest(
      name: 'mario',
      modelfile:
          'FROM mistral:latest\nSYSTEM You are mario from Super Mario Bros.',
    ),
  );
  print(res.status);
}

Future<void> _createModelStream(final OllamaClient client) async {
  final stream = client.createModelStream(
    request: const CreateModelRequest(
      name: 'mario',
      modelfile:
          'FROM mistral:latest\nSYSTEM You are mario from Super Mario Bros.',
    ),
  );
  await for (final res in stream) {
    print(res.status);
  }
}

Future<void> _listModels(final OllamaClient client) async {
  final res = await client.listModels();
  print(res.models);
}

Future<void> _showModelInfo(final OllamaClient client) async {
  final res = await client.showModelInfo(
    request: const ModelInfoRequest(name: 'mistral:latest'),
  );
  print(res);
}

Future<void> _pullModel(final OllamaClient client) async {
  final res = await client.pullModel(
    request: const PullModelRequest(name: 'yarn-llama2:13b-128k-q4_1'),
  );
  print(res.status);
}

Future<void> _pullModelStream(final OllamaClient client) async {
  final stream = client.pullModelStream(
    request: const PullModelRequest(name: 'yarn-llama2:13b-128k-q4_1'),
  );
  await for (final res in stream) {
    print(res.status);
  }
}

Future<void> _pushModel(final OllamaClient client) async {
  final res = await client.pushModel(
    request: const PushModelRequest(name: 'mattw/pygmalion:latest'),
  );
  print(res.status);
}

Future<void> _pushModelStream(final OllamaClient client) async {
  final stream = client.pushModelStream(
    request: const PushModelRequest(name: 'mattw/pygmalion:latest'),
  );
  await for (final res in stream) {
    print(res.status);
  }
}

Future<void> _checkBlob(final OllamaClient client) async {
  await client.checkBlob(
    name:
        'sha256:29fdb92e57cf0827ded04ae6461b5931d01fa595843f55d36f5b275a52087dd2',
  );
}
