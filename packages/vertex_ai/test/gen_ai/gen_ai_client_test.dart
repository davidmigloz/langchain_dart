@TestOn('vm')
library; // Uses dart:io

import 'dart:convert';
import 'dart:io';

import 'package:googleapis_auth/auth_io.dart';
import 'package:test/test.dart';
import 'package:vertex_ai/vertex_ai.dart';

void main() async {
  final client = await _getAuthenticatedClient();
  final vertexAi = VertexAIGenAIClient(
    httpClient: client,
    project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
  );

  group('VertexAIGenAIClient / VertexAITextModelApi tests', () {
    test('Test VertexAITextModelApi call', () async {
      final models = ['text-bison', 'text-bison-32k'];

      for (final model in models) {
        final res = await vertexAi.text.predict(
          model: model,
          prompt:
              'List the numbers from 1 to 9 in order without any spaces or commas.',
        );
        expect(res.predictions.first.content, contains('123456789'));
        expect(res.predictions.first.safetyAttributes.blocked, isFalse);
        expect(res.metadata.token.inputTotalTokens, greaterThan(0));
        expect(res.metadata.token.outputTotalTokens, greaterThan(0));
      }
    });

    test('Test VertexAITextModelApi stop sequence', () async {
      final res = await vertexAi.text.predict(
        prompt:
            'List the numbers from 1 to 9 in order without any spaces or commas.',
        parameters: const VertexAITextModelRequestParams(
          stopSequences: ['4'],
        ),
      );
      expect(res.predictions.first.content, contains('123'));
    });

    test('Test VertexAITextModelApi candidates count', () async {
      final res = await vertexAi.text.predict(
        prompt: 'Suggest a name for a LLM framework for Dart',
        parameters: const VertexAITextModelRequestParams(
          temperature: 1,
          topP: 1,
          candidateCount: 2,
        ),
      );
      expect(res.predictions.length, 2);
    });

    test('Test VertexAITextModelApi count tokens', () async {
      final res = await vertexAi.text.countTokens(
        prompt: 'Suggest a name for a LLM framework for Dart',
      );
      expect(res.totalTokens, 10);
    });
  });

  group('VertexAIGenAIClient / VertexAIChatModelApi tests', () {
    test('Test VertexAIChatModelApi call', () async {
      final models = ['chat-bison', 'chat-bison-32k'];

      for (final model in models) {
        final res = await vertexAi.chat.predict(
          model: model,
          context: 'Only output numeric characters.',
          examples: const [
            VertexAITextChatModelExample(
              input: VertexAITextChatModelMessage(
                author: 'USER',
                content: 'List the numbers from 1 to 3',
              ),
              output: VertexAITextChatModelMessage(
                author: 'AI',
                content: '123',
              ),
            ),
          ],
          messages: const [
            VertexAITextChatModelMessage(
              author: 'USER',
              content: 'List the numbers from 1 to 9',
            ),
          ],
        );
        expect(
          res.predictions.first.candidates.first.content,
          contains('123456789'),
        );
        expect(res.predictions.first.safetyAttributes.first.blocked, isFalse);
        expect(res.metadata.token.inputTotalTokens, greaterThan(0));
        expect(res.metadata.token.outputTotalTokens, greaterThan(0));
      }
    });

    test('Test VertexAIChatModelApi stop sequence', () async {
      final res = await vertexAi.chat.predict(
        messages: const [
          VertexAITextChatModelMessage(
            author: 'USER',
            content: 'List the numbers from 1 to 9 '
                'in order without any spaces or commas.',
          ),
        ],
        parameters: const VertexAITextChatModelRequestParams(
          stopSequences: ['4'],
        ),
      );
      expect(
        res.predictions.first.candidates.first.content,
        contains('123'),
      );
      expect(
        res.predictions.first.candidates.first.content,
        isNot(contains('456789')),
      );
    });

    test('Test VertexAIChatModelApi candidates count', skip: true, () async {
      // It seems that the Vertex AI Chat API ignores the candidateCount
      // parameter at the moment
      final res = await vertexAi.chat.predict(
        messages: const [
          VertexAITextChatModelMessage(
            author: 'USER',
            content: 'Suggest a name for a LLM framework for Dart',
          ),
        ],
        parameters: const VertexAITextChatModelRequestParams(
          temperature: 1,
          candidateCount: 3,
        ),
      );
      expect(res.predictions.length, 3);
    });

    test('Test VertexAIChatModelApi count tokens', () async {
      final res = await vertexAi.chat.countTokens(
        context: 'You are a helpful assistant.',
        messages: const [
          VertexAITextChatModelMessage(
            author: 'USER',
            content: 'Suggest a name for a LLM framework for Dart',
          ),
        ],
      );
      expect(res.totalTokens, 16);
    });
  });

  group('VertexAIGenAIClient / VertexAITextEmbeddingsModelApi tests', () {
    test('Test VertexAITextEmbeddingsModelApi call', () async {
      final models = [
        'textembedding-gecko@latest',
        'textembedding-gecko-multilingual@latest',
      ];

      for (final model in models) {
        final res = await vertexAi.textEmbeddings.predict(
          model: model,
          content: [
            const VertexAITextEmbeddingsModelContent(
              taskType: VertexAITextEmbeddingsModelTaskType.retrievalDocument,
              title: 'Embedding title',
              content: 'Embedding text',
            ),
          ],
        );
        expect(res.predictions.first.values, hasLength(768));
        expect(res.predictions.first.statistics.truncated, isFalse);
        expect(res.predictions.first.statistics.tokenCount, greaterThan(1));
        expect(res.metadata.billableCharacterCount, greaterThan(1));
      }
    });
  });
}

Future<AuthClient> _getAuthenticatedClient() async {
  final serviceAccountCredentials = ServiceAccountCredentials.fromJson(
    json.decode(Platform.environment['VERTEX_AI_SERVICE_ACCOUNT']!),
  );
  return clientViaServiceAccount(
    serviceAccountCredentials,
    [VertexAIGenAIClient.cloudPlatformScope],
  );
}
