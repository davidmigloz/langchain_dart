// ignore_for_file: avoid_redundant_argument_values
@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain_core/prompts.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

import '../utils/auth.dart';

void main() {
  final authProvider = getAuthProvider();
  const defaultModel = 'gemini-2.5-flash';

  group('VertexAI tests', () {
    test('Test VertexAI parameters', () {
      final llm = VertexAI(
        authProvider: authProvider,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        location: 'us-central1',
        defaultOptions: const VertexAIOptions(
          model: defaultModel,
          maxOutputTokens: 10,
          temperature: 0.1,
          topP: 0.1,
          topK: 10,
          stopSequences: ['\n'],
          candidateCount: 1,
        ),
      );
      expect(llm.modelType, 'vertex-ai');
      expect(
        llm.defaultOptions,
        const VertexAIOptions(
          model: defaultModel,
          maxOutputTokens: 10,
          temperature: 0.1,
          topP: 0.1,
          topK: 10,
          stopSequences: ['\n'],
          candidateCount: 1,
        ),
      );
    });

    test('Test call to VertexAI', () async {
      final llm = VertexAI(
        authProvider: authProvider,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
      );
      final output = await llm('Say foo:');
      expect(output, isNotEmpty);
    });

    test('Test invoke to VertexAI', () async {
      final llm = VertexAI(
        authProvider: authProvider,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const VertexAIOptions(
          model: defaultModel,
          maxOutputTokens: 100,
          temperature: 0,
        ),
      );
      final res = await llm.invoke(PromptValue.string('Hello, how are you?'));
      expect(res.output, isNotEmpty);
    });

    test('Test model output contains metadata', () async {
      final llm = VertexAI(
        authProvider: authProvider,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const VertexAIOptions(
          model: defaultModel,
          maxOutputTokens: 100,
          temperature: 0,
        ),
      );
      final res = await llm.invoke(PromptValue.string('Hello, how are you?'));
      expect(res.metadata, isNotEmpty);
      expect(res.metadata['model'], llm.defaultOptions.model);
      expect(res.usage.promptTokens, isNotNull);
      expect(res.usage.responseTokens, isNotNull);
      expect(res.usage.totalTokens, isNotNull);
    });

    test('Test model stop sequence', () async {
      final llm = VertexAI(
        authProvider: authProvider,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const VertexAIOptions(
          model: defaultModel,
          stopSequences: ['4'],
          temperature: 0,
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
        options: const VertexAIOptions(stopSequences: ['5']),
      );
      expect(res2.output, contains('1234'));
      expect(res2.output, isNot(contains('56789')));
    });

    test('Test stream to VertexAI', () async {
      final llm = VertexAI(
        authProvider: authProvider,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const VertexAIOptions(
          model: defaultModel,
          temperature: 0,
        ),
      );
      final stream = llm.stream(PromptValue.string('Hello, how are you?'));
      final results = await stream.toList();
      expect(results, isNotEmpty);
      for (final result in results) {
        expect(result.output, isNotEmpty);
      }
    });

    test('Test countTokens', () async {
      final llm = VertexAI(
        authProvider: authProvider,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
      );
      const text = 'Hello, how are you?';

      final numTokens = await llm.countTokens(PromptValue.string(text));
      expect(numTokens, greaterThan(0));
    });
  });
}
