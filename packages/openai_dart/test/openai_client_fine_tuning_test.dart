@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAI Fine-tuning API tests', () {
    late OpenAIClient client;

    setUp(() {
      client = OpenAIClient(
        apiKey: Platform.environment['OPENAI_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test create fine-tuning job', skip: true, () async {
      const request = CreateFineTuningJobRequest(
        model: FineTuningModel.model(FineTuningModels.gpt35Turbo),
        trainingFile: 'file-abc123',
        validationFile: 'file-abc123',
        hyperparameters: FineTuningJobHyperparameters(
          nEpochs: FineTuningNEpochs.mode(FineTuningNEpochsOptions.auto),
        ),
      );
      final res = await client.createFineTuningJob(request: request);
      expect(res.id, isNotEmpty);
      expect(res.createdAt, greaterThan(0));
      expect(res.error, isNull);
      expect(res.object, FineTuningJobObject.fineTuningJob);
      expect(res.fineTunedModel, isNotNull);
    });

    test('Test list fine-tuning jobs', () async {
      final res = await client.listPaginatedFineTuningJobs();
      expect(res.data, isEmpty);
      expect(res.hasMore, false);
      expect(res.object, ListPaginatedFineTuningJobsResponseObject.list);
    });

    test('Test retrieve fine-tuning job', skip: true, () async {
      final res = await client.retrieveFineTuningJob(
        fineTuningJobId: 'ft-AF1WoRqd3aJAHsqc9NY7iL8F',
      );
      expect(res.id, isNotEmpty);
      expect(res.createdAt, greaterThan(0));
      expect(res.error, isNull);
      expect(res.object, FineTuningJobObject.fineTuningJob);
      expect(res.fineTunedModel, isNotNull);
    });

    test('Test cancel fine-tuning jobs', skip: true, () async {
      final res = await client.cancelFineTuningJob(
        fineTuningJobId: 'ft-AF1WoRqd3aJAHsqc9NY7iL8F',
      );
      expect(res.status, FineTuningJobStatus.cancelled);
    });

    test('Test list fine-tuning events', skip: true, () async {
      final res = await client.listFineTuningEvents(
        fineTuningJobId: 'ft-AF1WoRqd3aJAHsqc9NY7iL8F',
      );
      expect(res.data, isEmpty);
      expect(res.object, ListFineTuningJobEventsResponseObject.list);
    });
  });
}
