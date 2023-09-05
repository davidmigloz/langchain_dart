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
    authHttpClient: client,
    project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
  );

  group('VertexAIGenAIClient tests', () {
    test('Test VertexAITextModelApi', () async {
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
          candidateCount: 3,
        ),
      );
      expect(res.predictions.length, 3);
    });

    test('Test VertexAIChatModelApi', () async {
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

    test('Test VertexAITextEmbeddingsModelApi', () async {
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
