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
  group('VertexAI tests', () {
    test('Test VertexAI parameters', () async {
      final llm = VertexAI(
        authHttpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        location: 'us-central1',
        rootUrl: 'https://us-central1-aiplatform.googleapis.com/',
        publisher: 'google',
        model: 'text-bison@001',
        maxOutputTokens: 10,
        temperature: 0.1,
        topP: 0.1,
        topK: 10,
      );
      expect(llm.client.project, Platform.environment['VERTEX_AI_PROJECT_ID']);
      expect(llm.client.location, 'us-central1');
      expect(llm.publisher, 'google');
      expect(llm.model, 'text-bison@001');
      expect(llm.maxOutputTokens, 10);
      expect(llm.temperature, 0.1);
      expect(llm.topP, 0.1);
      expect(llm.topK, 10);
    });

    test('Test call to VertexAI', () async {
      final llm = VertexAI(
        authHttpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
      );
      final output = await llm('Say foo:');
      expect(output, isNotEmpty);
    });

    test('Test generate to VertexAI', () async {
      final llm = VertexAI(
        authHttpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        maxOutputTokens: 10,
      );
      final res = await llm.generate('Hello, how are you?');
      expect(res.generations.length, 1);
    });

    test('Test model output contains metadata', () async {
      final llm = VertexAI(
        authHttpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        maxOutputTokens: 10,
      );
      final res = await llm.generate('Hello, how are you?');
      expect(res.modelOutput, isNotNull);
      expect(res.modelOutput!['model'], llm.model);
      expect(res.usage?.promptTokens, isNotNull);
      expect(res.usage?.promptBillableCharacters, isNotNull);
      expect(res.usage?.responseTokens, isNotNull);
      expect(res.usage?.responseBillableCharacters, isNotNull);
    });

    test('Test tokenize', () async {
      final llm = VertexAI(
        authHttpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
      );
      const text = 'Hello, how are you?';

      final tokens = await llm.tokenize(PromptValue.string(text));
      expect(tokens, [15496, 11, 703, 389, 345, 30]);
    });

    test('Test countTokens', () async {
      final llm = VertexAI(
        authHttpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
      );
      const text = 'Hello, how are you?';

      final numTokens = await llm.countTokens(PromptValue.string(text));
      expect(numTokens, 6);
    });
  });
}
