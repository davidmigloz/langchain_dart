// ignore_for_file: avoid_redundant_argument_values
@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

import '../utils/auth.dart';

void main() async {
  final authHttpClient = await getAuthHttpClient();
  group('ChatVertexAI tests', () {
    test('Test ChatVertexAI parameters', () async {
      final llm = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        location: 'us-central1',
        rootUrl: 'https://us-central1-aiplatform.googleapis.com/',
        publisher: 'google',
        model: 'text-bison@001',
        defaultOptions: const ChatVertexAIOptions(
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
      expect(llm.publisher, 'google');
      expect(llm.model, 'text-bison@001');
      expect(
        llm.defaultOptions,
        const ChatVertexAIOptions(
          maxOutputTokens: 10,
          temperature: 0.1,
          topP: 0.1,
          topK: 10,
          stopSequences: ['\n'],
          candidateCount: 10,
        ),
      );
    });

    test('Test call to ChatVertexAI', () async {
      final chat = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const ChatVertexAIOptions(maxOutputTokens: 10),
      );
      final res = await chat([ChatMessage.human('Hello')]);
      expect(res.content, isNotEmpty);
    });

    test('Test generate to ChatVertexAI', () async {
      final chat = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const ChatVertexAIOptions(maxOutputTokens: 10),
      );
      final res = await chat.generate(
        [
          ChatMessage.human('Hello, how are you?'),
          ChatMessage.ai('I am fine, thank you.'),
          ChatMessage.human('Good, what is your name?'),
        ],
      );
      expect(res.generations.first.output.content, isNotEmpty);
    });

    test('Test model output contains metadata', () async {
      final chat = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const ChatVertexAIOptions(maxOutputTokens: 10),
      );
      final res = await chat.generate(
        [ChatMessage.human('Hello, how are you?')],
      );
      expect(res.modelOutput, isNotNull);
      expect(res.modelOutput!['model'], chat.model);
      expect(res.usage?.promptTokens, isNotNull);
      expect(res.usage?.promptBillableCharacters, isNotNull);
      expect(res.usage?.responseTokens, isNotNull);
      expect(res.usage?.responseBillableCharacters, isNotNull);
    });

    test('Test ChatVertexAI wrapper with system message', () async {
      final chat = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const ChatVertexAIOptions(maxOutputTokens: 10),
      );
      final systemMessage =
          ChatMessage.system('You are to chat with the user.');
      final humanMessage =
          ChatMessage.human('write an ordered list of five items');
      final res = await chat([systemMessage, humanMessage]);
      expect(res.content, isNotEmpty);
    });

    test('Test model stop sequence', () async {
      final chat = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const ChatVertexAIOptions(
          stopSequences: ['4'],
        ),
      );
      final res = await chat.generate([
        ChatMessage.human(
          'List the numbers from 1 to 9 in order without any spaces or commas',
        ),
      ]);
      expect(res.firstOutputAsString, contains('123'));
      expect(res.firstOutputAsString, isNot(contains('456789')));

      // call options should override defaults
      final res2 = await chat.generate(
        [
          ChatMessage.human(
            'List the numbers from 1 to 9 in order without any spaces or commas',
          ),
        ],
        options: const ChatVertexAIOptions(
          stopSequences: ['5'],
        ),
      );
      expect(res2.firstOutputAsString, contains('1234'));
      expect(res2.firstOutputAsString, isNot(contains('56789')));
    });

    test('Test model candidates count', skip: true, () async {
      // It seems that the Vertex AI Chat API ignores the candidateCount
      // parameter at the moment
      final chat = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const ChatVertexAIOptions(
          temperature: 1,
          candidateCount: 3,
        ),
      );
      final res = await chat.generate(
        [ChatMessage.human('Suggest a name for a LLM framework for Dart')],
      );
      expect(res.generations.length, 3);

      // call options should override defaults
      final res2 = await chat.generate(
        [ChatMessage.human('Suggest a name for a LLM framework for Dart')],
        options: const ChatVertexAIOptions(
          temperature: 1,
          candidateCount: 5,
        ),
      );
      expect(res2.generations.length, 5);
    });

    test('Test tokenize', () async {
      final chat = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
      );
      const text = 'Hello, how are you?';

      final tokens = await chat.tokenize(PromptValue.string(text));
      expect(tokens, [15496, 11, 703, 389, 345, 30]);
    });

    test('Test countTokens string', () async {
      final chat = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
      );
      final prompt = PromptValue.string('Hello, how are you?');

      final numTokens = await chat.countTokens(prompt);
      final generation = await chat.generatePrompt(prompt);
      expect(numTokens, generation.usage!.promptTokens);
    });

    test('Test countTokens messages', () async {
      final chat = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const ChatVertexAIOptions(
          maxOutputTokens: 1,
          temperature: 0,
        ),
      );

      final messages = [
        ChatMessage.system(
          'You are a helpful, pattern-following assistant that translates '
          'corporate jargon into plain English.',
        ),
        ChatMessage.human(
          "This late pivot means we don't have time to boil the ocean for the "
          'client deliverable.',
        ),
      ];

      final numTokens = await chat.countTokens(PromptValue.chat(messages));
      expect(numTokens, 42);
    });
  });
}
