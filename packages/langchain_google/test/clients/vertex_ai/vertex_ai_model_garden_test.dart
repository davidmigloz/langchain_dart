@TestOn('vm')
library; // Uses dart:io

import 'dart:convert';
import 'dart:io';

import 'package:googleapis/aiplatform/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

void main() async {
  final client = await _getAuthenticatedClient();
  final vertex = VertexAIModelGardenClient(
    client: client,
    project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
  );

  group('VertexAI tests', () {
    test('Test VertexAITextModelApi', () async {
      final res = await vertex.text.predict(
        prompt:
            'List the numbers from 1 to 9 in order without any spaces or commas.',
      );
      expect(res.predictions.first.content, contains('123456789'));
      expect(res.predictions.first.safetyAttributes.blocked, isFalse);
      expect(res.metadata.token.inputTotalTokens, greaterThan(0));
      expect(res.metadata.token.outputTotalTokens, greaterThan(0));
    });

    test('Test VertexAIChatModelApi', () async {
      final res = await vertex.chat.predict(
        context: 'Only output numeric characters.',
        examples: const [
          VertexAIChatModelExample(
            input: VertexAIChatModelMessage(
              author: 'USER',
              content: 'List the numbers from 1 to 3',
            ),
            output: VertexAIChatModelMessage(
              author: 'AI',
              content: '123',
            ),
          ),
        ],
        messages: const [
          VertexAIChatModelMessage(
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
    });

    test('Test VertexAITextEmbeddingsModelApi', () async {
      final res = await vertex.textEmbeddings.predict(
        content: ['Embedding text'],
      );
      expect(res.predictions.first.values, hasLength(768));
      expect(res.predictions.first.statistics.truncated, isFalse);
      expect(res.predictions.first.statistics.tokenCount, greaterThan(1));
      expect(res.metadata.billableCharacterCount, greaterThan(1));
    });
  });
}

Future<http.Client> _getAuthenticatedClient() async {
  final serviceAccountCredentials = ServiceAccountCredentials.fromJson(
    json.decode(Platform.environment['VERTEX_AI_SERVICE_ACCOUNT']!),
  );
  return clientViaServiceAccount(
    serviceAccountCredentials,
    [AiplatformApi.cloudPlatformScope],
  );
}
