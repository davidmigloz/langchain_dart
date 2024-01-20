// ignore_for_file: avoid_redundant_argument_values
@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

import '../utils/auth.dart';

Future<void> main() async {
  final authHttpClient = await getAuthHttpClient();
  const defaultPublisher = 'google';
  const defaultModel = 'text-bison';

  group('VertexAI tests', () {
    test('Test VertexAI parameters', () async {
      final llm = VertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        location: 'us-central1',
        rootUrl: 'https://us-central1-aiplatform.googleapis.com/',
        defaultOptions: const VertexAIOptions(
          publisher: defaultPublisher,
          model: defaultModel,
          maxOutputTokens: 10,
          temperature: 0.1,
          topP: 0.1,
          topK: 10,
          stopSequences: ['\n'],
          candidateCount: 10,
        ),
      );
      expect(llm.client.project, Platform.environment['VERTEX_AI_PROJECT_ID']);
      expect(llm.client.location, 'us-central1');
      expect(
        llm.defaultOptions,
        const VertexAIOptions(
          publisher: defaultPublisher,
          model: defaultModel,
          maxOutputTokens: 10,
          temperature: 0.1,
          topP: 0.1,
          topK: 10,
          stopSequences: ['\n'],
          candidateCount: 10,
        ),
      );
    });

    test('Test call to VertexAI', () async {
      final llm = VertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
      );
      final output = await llm('Say foo:');
      expect(output, isNotEmpty);
    });

    test('Test generate to VertexAI', () async {
      final llm = VertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const VertexAIOptions(
          publisher: defaultPublisher,
          model: defaultModel,
          maxOutputTokens: 10,
        ),
      );
      final res = await llm.generate('Hello, how are you?');
      expect(res.generations.length, 1);
    });

    test('Test model output contains metadata', () async {
      final llm = VertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const VertexAIOptions(
          publisher: defaultPublisher,
          model: defaultModel,
          maxOutputTokens: 10,
        ),
      );
      final res = await llm.generate('Hello, how are you?');
      expect(res.modelOutput, isNotNull);
      expect(res.modelOutput!['model'], llm.defaultOptions.model);
      expect(res.usage?.promptTokens, isNotNull);
      expect(res.usage?.promptBillableCharacters, isNotNull);
      expect(res.usage?.responseTokens, isNotNull);
      expect(res.usage?.responseBillableCharacters, isNotNull);
    });

    test('Test model stop sequence', () async {
      final llm = VertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const VertexAIOptions(
          publisher: defaultPublisher,
          model: defaultModel,
          stopSequences: ['4'],
        ),
      );
      final res = await llm.generate(
        'List the numbers from 1 to 9 in order without any spaces or commas',
      );
      expect(res.firstOutputAsString, contains('123'));
      expect(res.firstOutputAsString, isNot(contains('456789')));

      // call options should override defaults
      final res2 = await llm.generate(
        'List the numbers from 1 to 9 in order without any spaces or commas',
        options: const VertexAIOptions(
          stopSequences: ['5'],
        ),
      );
      expect(res2.firstOutputAsString, contains('1234'));
      expect(res2.firstOutputAsString, isNot(contains('56789')));
    });

    test('Test model candidates count', skip: true, () async {
      final llm = VertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const VertexAIOptions(
          publisher: defaultPublisher,
          model: defaultModel,
          temperature: 1,
          candidateCount: 3,
        ),
      );
      final res = await llm.generate(
        'Suggest a name for a LLM framework for Dart',
      );
      expect(res.generations.length, 3);

      // call options should override defaults
      final res2 = await llm.generate(
        'Suggest a name for a LLM framework for Python',
        options: const VertexAIOptions(
          temperature: 1,
          candidateCount: 5,
        ),
      );
      expect(res2.generations.length, 5);
    });

    test('Test countTokens', () async {
      final llm = VertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
      );
      const text = 'Hello, how are you?';

      final numTokens = await llm.countTokens(PromptValue.string(text));
      expect(numTokens, 6);
    });
  });
}
