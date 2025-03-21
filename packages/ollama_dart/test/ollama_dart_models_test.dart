import 'dart:io';

import 'package:ollama_dart/ollama_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Ollama Models API tests', skip: Platform.environment.containsKey('CI'),
      () {
    late OllamaClient client;
    const defaultModel = 'gemma2';

    setUp(() async {
      client = OllamaClient();
      // Check that the model exists
      final res = await client.listModels();
      expect(
        res.models?.firstWhere((final m) => m.model!.startsWith(defaultModel)),
        isNotNull,
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test create model', () async {
      const modelName = 'mario';
      const modelfile =
          'FROM $defaultModel\nSYSTEM You are mario from Super Mario Bros.';

      final res = await client.createModel(
        request: const CreateModelRequest(
          model: modelName,
          modelfile: modelfile,
        ),
      );

      expect(res.status, equals(CreateModelStatus.success));
    });

    test('Test create model stream', () async {
      const modelName = 'mario-stream';
      const modelfile =
          'FROM $defaultModel\nSYSTEM You are mario from Super Mario Bros.';

      final stream = client.createModelStream(
        request: const CreateModelRequest(
          model: modelName,
          modelfile: modelfile,
        ),
      );

      var count = 0;
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
      expect(
        res.models?.any((final m) => m.model!.startsWith(defaultModel)),
        isTrue,
      );
    });

    test('Test list running models', () async {
      await client.generateCompletion(
        request: const GenerateCompletionRequest(
          model: defaultModel,
          prompt: 'You are a llama',
          options: RequestOptions(numPredict: 1),
        ),
      );

      final res = await client.listRunningModels();
      expect(
        res.models?.any((final m) => m.model!.startsWith(defaultModel)),
        isTrue,
      );
    });

    test('Test show model info', () async {
      final res = await client.showModelInfo(
        request: const ModelInfoRequest(model: defaultModel),
      );
      expect(res.license, isNotEmpty);
      expect(res.modelfile, isNotEmpty);
      expect(res.parameters, isNotEmpty);
      expect(res.template, isNotEmpty);
      expect(res.details?.format, isNotEmpty);
      expect(res.details?.family, isNotEmpty);
      expect(res.details?.families, isNotEmpty);
      expect(res.details?.parameterSize, isNotEmpty);
      expect(res.details?.quantizationLevel, isNotEmpty);
      expect(res.modelInfo?.generalArchitecture, isNotEmpty);
      expect(res.modelInfo?.generalFileType, greaterThan(0));
      expect(res.modelInfo?.generalParameterCount, greaterThan(0));
      expect(res.modelInfo?.generalQuantizationVersion, greaterThan(0));
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
      expect(
        res.models?.any((final m) => m.model == '$newName:latest'),
        isTrue,
      );
    });

    test('Test delete model', () async {
      const name = 'model-copy';

      final res1 = await client.listModels();
      expect(res1.models?.any((final m) => m.model == '$name:latest'), isTrue);

      await client.deleteModel(request: const DeleteModelRequest(model: name));

      final res2 = await client.listModels();
      expect(res2.models?.any((final m) => m.model == '$name:latest'), isFalse);
    });

    test('Test pull model', skip: true, () async {
      final res = await client.pullModel(
        request: const PullModelRequest(model: 'yarn-llama3:13b-128k-q4_1'),
      );

      expect(res.status, PullModelStatus.success);
    });

    test('Test pull model stream', skip: true, () async {
      final stream = client.pullModelStream(
        request: const PullModelRequest(model: 'yarn-llama3:13b-128k-q4_1'),
      );

      var count = 0;
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
        request: const PushModelRequest(model: 'mattw/pygmalion:latest'),
      );

      expect(res.status, equals('success'));
    });

    test('Test push model stream', skip: true, () async {
      final stream = client.pushModelStream(
        request: const PushModelRequest(model: 'mattw/pygmalion:latest'),
      );

      var count = 0;
      String? lastStatus;
      await for (final res in stream) {
        lastStatus = res.status;
        count++;
      }
      expect(count, greaterThan(1));
      expect(lastStatus, equals('success'));
    });

    test('Test check blob', skip: true, () async {
      await client.checkBlob(
        digest:
            'sha256:29fdb92e57cf0827ded04ae6461b5931d01fa595843f55d36f5b275a52087dd2',
      );
    });

    test('Test create blob', skip: true, () async {
      await client.createBlob(
        digest:
            'sha256:29fdb92e57cf0827ded04ae6461b5931d01fa595843f55d36f5b275a52087dd2',
        request: 'file contents',
      );
    });
  });
}
