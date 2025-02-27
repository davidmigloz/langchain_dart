// ignore_for_file: avoid_redundant_argument_values
@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain_core/prompts.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

import '../utils/auth.dart';

Future<void> main() async {
  final authHttpClient = await getAuthHttpClient();
  const defaultPublisher = 'google';
  const defaultModel = 'text-bison';

  group('VertexAI tests', () {
    test('Test VertexAI parameters', ()  {
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

    test('Test invoke to VertexAI', () async {
      final llm = VertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const VertexAIOptions(
          publisher: defaultPublisher,
          model: defaultModel,
          maxOutputTokens: 10,
        ),
      );
      final res = await llm.invoke(
        PromptValue.string('Hello, how are you?'),
      );
      expect(res.output, isNotEmpty);
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
      final res = await llm.invoke(
        PromptValue.string('Hello, how are you?'),
      );
      expect(res.metadata, isNotEmpty);
      expect(res.metadata['model'], llm.defaultOptions.model);
      expect(res.usage.promptTokens, isNotNull);
      expect(res.usage.promptBillableCharacters, isNotNull);
      expect(res.usage.responseTokens, isNotNull);
      expect(res.usage.responseBillableCharacters, isNotNull);
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
      final res = await llm.invoke(
        PromptValue.string(
          'List the numbers from 1 to 9 in order without any spaces or commas',
        ),
      );
      expect(res.output, contains('123'));
      expect(res.output, isNot(contains('456789')));

      // call options should override defaults
      final res2 = await llm.invoke(
        PromptValue.string(
          'List the numbers from 1 to 9 in order without any spaces or commas',
        ),
        options: const VertexAIOptions(
          stopSequences: ['5'],
        ),
      );
      expect(res2.output, contains('1234'));
      expect(res2.output, isNot(contains('56789')));
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
