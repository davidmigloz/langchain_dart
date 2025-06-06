// ignore_for_file: avoid_redundant_argument_values
@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

import '../../utils/auth.dart';

void main() async {
  final authHttpClient = await getAuthHttpClient();
  const defaultPublisher = 'google';
  const defaultModel = 'chat-bison';

  group('ChatVertexAI tests', () {
    test('Test ChatVertexAI parameters', () {
      final llm = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        location: 'us-central1',
        rootUrl: 'https://us-central1-aiplatform.googleapis.com/',
        defaultOptions: const ChatVertexAIOptions(
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
        const ChatVertexAIOptions(
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

    test('Test call to ChatVertexAI', () async {
      final chat = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const ChatVertexAIOptions(
          publisher: defaultPublisher,
          model: 'chat-bison',
          maxOutputTokens: 10,
        ),
      );
      final res = await chat([ChatMessage.humanText('Hello')]);
      expect(res.content, isNotEmpty);
    });

    test('Test invoke to ChatVertexAI', () async {
      final chat = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const ChatVertexAIOptions(
          publisher: defaultPublisher,
          model: 'chat-bison',
          maxOutputTokens: 10,
        ),
      );
      final res = await chat.invoke(
        PromptValue.chat([
          ChatMessage.humanText('Hello, how are you?'),
          ChatMessage.ai('I am fine, thank you.'),
          ChatMessage.humanText('Good, what is your name?'),
        ]),
      );
      expect(res.output.content, isNotEmpty);
    });

    test('Test model output contains metadata', () async {
      final chat = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const ChatVertexAIOptions(
          publisher: defaultPublisher,
          model: 'chat-bison',
          maxOutputTokens: 10,
        ),
      );
      final res = await chat.invoke(
        PromptValue.chat([ChatMessage.humanText('Hello, how are you?')]),
      );
      expect(res.metadata, isNotEmpty);
      expect(res.metadata['model'], chat.defaultOptions.model);
      expect(res.usage.promptTokens, isNotNull);
      expect(res.usage.promptBillableCharacters, isNotNull);
      expect(res.usage.responseTokens, isNotNull);
      expect(res.usage.responseBillableCharacters, isNotNull);
    });

    test('Test ChatVertexAI wrapper with system message', () async {
      final chat = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const ChatVertexAIOptions(
          publisher: defaultPublisher,
          model: 'chat-bison',
          maxOutputTokens: 10,
        ),
      );
      final systemMessage =
          ChatMessage.system('You are to chat with the user.');
      final humanMessage =
          ChatMessage.humanText('write an ordered list of five items');
      final res = await chat([systemMessage, humanMessage]);
      expect(res.content, isNotEmpty);
    });

    test('Test model stop sequence', () async {
      final chat = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
      );
      final res = await chat.invoke(
        PromptValue.chat([
          ChatMessage.humanText(
            'List the numbers from 1 to 9 in order without any spaces or commas',
          ),
        ]),
        options: const ChatVertexAIOptions(stopSequences: ['4']),
      );
      expect(res.output.content, contains('123'));
      expect(res.output.content, isNot(contains('456789')));

      // call options should override defaults
      final res2 = await chat.invoke(
        PromptValue.chat([
          ChatMessage.humanText(
            'List the numbers from 1 to 9 in order without any spaces or commas',
          ),
        ]),
        options: const ChatVertexAIOptions(
          stopSequences: ['5'],
        ),
      );
      expect(res2.output.content, contains('1234'));
      expect(res2.output.content, isNot(contains('56789')));
    });

    test('Test countTokens string', () async {
      final chat = ChatVertexAI(
        httpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
      );
      final prompt = PromptValue.string('Hello, how are you?');

      final numTokens = await chat.countTokens(prompt);
      final generation = await chat.invoke(prompt);
      expect(numTokens, generation.usage.promptTokens);
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
        ChatMessage.humanText(
          "This late pivot means we don't have time to boil the ocean for the "
          'client deliverable.',
        ),
      ];

      final numTokens = await chat.countTokens(PromptValue.chat(messages));
      expect(numTokens, 37);
    });
  });
}
