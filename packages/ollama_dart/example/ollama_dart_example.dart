// ignore_for_file: avoid_print
import 'package:ollama_dart/ollama_dart.dart';

Future<void> main() async {
  final client = OllamaClient();

  // Completions
  await _generateCompletion(client);
  await _generateCompletionStream(client);

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
