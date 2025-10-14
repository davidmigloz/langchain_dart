// ignore_for_file: avoid_redundant_argument_values
@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

import '../../utils/auth.dart';

void main() {
  final authProvider = getAuthProvider();
  const defaultModel = 'gemini-2.5-flash';

  group('ChatVertexAI tests', () {
    test('Test ChatVertexAI parameters', () {
      final llm = ChatVertexAI(
        authProvider: authProvider,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        location: 'us-central1',
        defaultOptions: const ChatVertexAIOptions(
          model: defaultModel,
          maxOutputTokens: 10,
          temperature: 0.1,
          topP: 0.1,
          topK: 10,
          stopSequences: ['\n'],
          candidateCount: 1,
        ),
      );
      expect(llm.modelType, 'vertex-ai-chat');
      expect(
        llm.defaultOptions,
        const ChatVertexAIOptions(
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

    test('Test call to ChatVertexAI', () async {
      final chat = ChatVertexAI(
        authProvider: authProvider,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const ChatVertexAIOptions(
          model: defaultModel,
          temperature: 0,
        ),
      );
      final messages = [
        ChatMessage.humanText('Tell me a joke.'),
      ];
      final res = await chat(messages);
      expect(res.content, isNotEmpty);
    });

    test('Test invoke to ChatVertexAI', () async {
      final chat = ChatVertexAI(
        authProvider: authProvider,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const ChatVertexAIOptions(
          model: defaultModel,
          temperature: 0,
        ),
      );
      final prompt = PromptValue.chat([
        ChatMessage.system('You are a comedian.'),
        ChatMessage.humanText('Tell me a joke.'),
      ]);
      final res = await chat.invoke(prompt);
      expect(res.output.content, isNotEmpty);
    });

    test('Test stream to ChatVertexAI', () async {
      final chat = ChatVertexAI(
        authProvider: authProvider,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const ChatVertexAIOptions(
          model: defaultModel,
          temperature: 0,
        ),
      );
      final prompt = PromptValue.chat([
        ChatMessage.humanText('Tell me a joke.'),
      ]);
      final stream = chat.stream(prompt);
      final results = await stream.toList();
      expect(results, isNotEmpty);
      for (final result in results) {
        expect(result.output.content, isNotEmpty);
      }
    });

    test('Test countTokens', () async {
      final chat = ChatVertexAI(
        authProvider: authProvider,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        defaultOptions: const ChatVertexAIOptions(
          model: defaultModel,
        ),
      );
      final prompt = PromptValue.string('Hello world');
      final tokenCount = await chat.countTokens(prompt);
      expect(tokenCount, greaterThan(0));
    });
  });
}
