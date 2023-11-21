import 'package:ollama_dart/ollama_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Ollama Generate Embeddings API tests', skip: true, () {
    late OllamaClient client;
    const defaultModel = 'llama2:latest';

    setUp(() async {
      client = OllamaClient();
      // Check that the model exists
      final res = await client.listModels();
      expect(
        res.models?.firstWhere((final m) => m.name == defaultModel),
        isNotNull,
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test call embeddings API', () async {
      const testPrompt = 'Here is an article about llamas...';

      final response = await client.generateEmbedding(
        request: const GenerateEmbeddingRequest(
          model: defaultModel,
          prompt: testPrompt,
        ),
      );
      expect(response.embedding, isNotEmpty);
    });
  });
}
