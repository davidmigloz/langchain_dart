import 'package:ollama_dart/ollama_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Ollama Models API tests', skip: true, () {
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

    test('Test create model', () async {
      const String modelName = 'mario';
      const String modelfile =
          'FROM $defaultModel\nSYSTEM You are mario from Super Mario Bros.';

      final res = await client.createModel(
        request: const CreateModelRequest(
          name: modelName,
          modelfile: modelfile,
        ),
      );

      expect(res.status, equals(CreateModelStatus.success));
    });

    test('Test create model stream', () async {
      const String modelName = 'mario-stream';
      const String modelfile =
          'FROM $defaultModel\nSYSTEM You are mario from Super Mario Bros.';

      final stream = client.createModelStream(
        request: const CreateModelRequest(
          name: modelName,
          modelfile: modelfile,
        ),
      );

      int count = 0;
      CreateModelStatus? lastStatus;
      await for (final res in stream) {
        lastStatus = res.status;
        count++;
      }
      expect(count, greaterThan(1));
      expect(lastStatus, equals(CreateModelStatus.success));
    });

    test('Test list models', () async {
      final res = await client.listModels();
      expect(res.models?.any((final m) => m.name == defaultModel), isTrue);
    });

    test('Test show model info', () async {
      final res = await client.showModelInfo(
        request: const ModelInfoRequest(name: defaultModel),
      );
      expect(res.license, isNotEmpty);
      expect(res.modelfile, isNotEmpty);
      expect(res.template, isNotEmpty);
    });

    test('Test copy model', () async {
      const newName = 'model-copy';
      await client.copyModel(
        request: const CopyModelRequest(
          source: defaultModel,
          destination: newName,
        ),
      );
      final res = await client.listModels();
      expect(res.models?.any((final m) => m.name == '$newName:latest'), isTrue);
    });

    test('Test delete model', () async {
      const name = 'model-copy';

      final res1 = await client.listModels();
      expect(res1.models?.any((final m) => m.name == '$name:latest'), isTrue);

      await client.deleteModel(request: const DeleteModelRequest(name: name));

      final res2 = await client.listModels();
      expect(res2.models?.any((final m) => m.name == '$name:latest'), isFalse);
    });

    test('Test pull model', skip: true, () async {
      final res = await client.pullModel(
        request: const PullModelRequest(name: 'yarn-llama2:13b-128k-q4_1'),
      );

      expect(res.status, PullModelStatus.success);
    });

    test('Test pull model stream', skip: true, () async {
      final stream = client.pullModelStream(
        request: const PullModelRequest(name: 'yarn-llama2:13b-128k-q4_1'),
      );

      int count = 0;
      PullModelStatus? lastStatus;
      await for (final res in stream) {
        lastStatus = res.status;
        count++;
      }
      expect(count, greaterThan(1));
      expect(lastStatus, equals(PullModelStatus.success));
    });

    test('Test push model', skip: true, () async {
      final res = await client.pushModel(
        request: const PushModelRequest(name: 'mattw/pygmalion:latest'),
      );

      expect(res.status, PushModelStatus.success);
    });

    test('Test push model stream', skip: true, () async {
      final stream = client.pushModelStream(
        request: const PushModelRequest(name: 'mattw/pygmalion:latest'),
      );

      int count = 0;
      PushModelStatus? lastStatus;
      await for (final res in stream) {
        lastStatus = res.status;
        count++;
      }
      expect(count, greaterThan(1));
      expect(lastStatus, equals(PushModelStatus.success));
    });

    test('Test check blob', skip: true, () async {
      await client.checkBlob(
        name:
            'sha256:29fdb92e57cf0827ded04ae6461b5931d01fa595843f55d36f5b275a52087dd2',
      );
    });

    test('Test create blob', skip: true, () async {
      await client.createBlob(
        name:
            'sha256:29fdb92e57cf0827ded04ae6461b5931d01fa595843f55d36f5b275a52087dd2',
        request: 'file contents',
      );
    });
  });
}
