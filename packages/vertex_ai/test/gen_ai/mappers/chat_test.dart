import 'package:googleapis/aiplatform/v1.dart';
import 'package:test/test.dart';
import 'package:vertex_ai/src/gen_ai/mappers/mappers.dart';
import 'package:vertex_ai/vertex_ai.dart';

void main() {
  group('VertexAIChatModelGoogleApisMapper tests', () {
    test('VertexAIChatModelGoogleApisMapper.mapRequest', () {
      const request = VertexAITextChatModelRequest(
        context: 'CONTEXT',
        examples: [
          VertexAITextChatModelExample(
            input: VertexAITextChatModelMessage(
              author: 'USER',
              content: 'Hello',
            ),
            output: VertexAITextChatModelMessage(
              author: 'AI',
              content: 'World',
            ),
          ),
        ],
        messages: [
          VertexAITextChatModelMessage(
            author: 'USER',
            content: 'Hello',
          ),
        ],
        params: VertexAITextChatModelRequestParams(
          temperature: 0.1,
          maxOutputTokens: 256,
          topP: 0.1,
          topK: 30,
          stopSequences: ['STOP'],
          candidateCount: 10,
        ),
      );
      final expected = GoogleCloudAiplatformV1PredictRequest(
        instances: [
          {
            'context': 'CONTEXT',
            'examples': [
              {
                'input': {
                  'author': 'USER',
                  'content': 'Hello',
                },
                'output': {
                  'author': 'AI',
                  'content': 'World',
                },
              },
            ],
            'messages': [
              {
                'author': 'USER',
                'content': 'Hello',
              },
            ],
          }
        ],
        parameters: {
          'temperature': 0.1,
          'maxOutputTokens': 256,
          'topP': 0.1,
          'topK': 30,
          'stopSequences': ['STOP'],
          'candidateCount': 10,
        },
      );

      final req = VertexAITextChatModelGoogleApisMapper.mapRequest(request);
      expect(req.instances, expected.instances);
      expect(req.parameters, expected.parameters);
    });

    test('VertexAIChatModelGoogleApisMapper.mapResponse', () {
      final response = GoogleCloudAiplatformV1PredictResponse(
        predictions: [
          {
            'candidates': [
              {
                'author': 'AI',
                'content': 'Hello world!',
              },
              {
                'author': 'AI',
                'content': 'Hello world! v2',
              },
            ],
            'citationMetadata': [
              {
                'citations': [
                  {
                    'startIndex': 13,
                    'endIndex': 158,
                    'url': 'https://example.com',
                    'title': 'Example Title',
                    'license': 'CC BY-SA 4.0',
                    'publicationDate': '2023-02-11',
                  },
                ],
              },
              {
                'citations': [
                  {
                    'startIndex': 0,
                    'endIndex': 1,
                    'url': 'https://example.com',
                    'title': 'Example Title v2',
                    'license': 'CC BY-SA 3.0',
                    'publicationDate': '2021',
                  },
                ],
              },
            ],
            'safetyAttributes': [
              {
                'scores': [
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                ],
                'blocked': false,
                'categories': [
                  'Derogatory',
                  'Toxic',
                  'Violent',
                  'Sexual',
                  'Insult',
                  'Profanity',
                  'Death, Harm & Tragedy',
                  'Firearms & Weapons',
                  'Public Safety',
                  'Health',
                  'Religion & Belief',
                  'Drugs',
                  'War & Conflict',
                  'Politics',
                  'Finance',
                  'Legal',
                ],
              },
              {
                'scores': [
                  0.1,
                ],
                'blocked': false,
                'categories': [
                  'Derogatory',
                ],
              }
            ],
          }
        ],
        metadata: {
          'tokenMetadata': {
            'inputTokenCount': {
              'totalBillableCharacters': 42,
              'totalTokens': 10,
            },
            'outputTokenCount': {
              'totalBillableCharacters': 1025,
              'totalTokens': 256,
            },
          },
        },
      );
      final expected = VertexAITextChatModelResponse(
        predictions: [
          VertexAITextChatModelPrediction(
            candidates: const [
              VertexAITextChatModelMessage(
                author: 'AI',
                content: 'Hello world!',
              ),
              VertexAITextChatModelMessage(
                author: 'AI',
                content: 'Hello world! v2',
              ),
            ],
            citations: [
              [
                VertexAIPredictionCitation(
                  startIndex: 13,
                  endIndex: 158,
                  url: 'https://example.com',
                  title: 'Example Title',
                  license: 'CC BY-SA 4.0',
                  publicationDate: DateTime(2023, 2, 11),
                ),
              ],
              [
                VertexAIPredictionCitation(
                  startIndex: 0,
                  endIndex: 1,
                  url: 'https://example.com',
                  title: 'Example Title v2',
                  license: 'CC BY-SA 3.0',
                  publicationDate: DateTime(2021),
                ),
              ]
            ],
            safetyAttributes: const [
              VertexAIPredictionSafetyAttributes(
                categories: [
                  VertexAIPredictionSafetyAttributesCategory.derogatory,
                  VertexAIPredictionSafetyAttributesCategory.toxic,
                  VertexAIPredictionSafetyAttributesCategory.violent,
                  VertexAIPredictionSafetyAttributesCategory.sexual,
                  VertexAIPredictionSafetyAttributesCategory.insult,
                  VertexAIPredictionSafetyAttributesCategory.profanity,
                  VertexAIPredictionSafetyAttributesCategory
                      .deathHarmAndTragedy,
                  VertexAIPredictionSafetyAttributesCategory.firearmsAndWeapons,
                  VertexAIPredictionSafetyAttributesCategory.publicSafety,
                  VertexAIPredictionSafetyAttributesCategory.health,
                  VertexAIPredictionSafetyAttributesCategory.religionAndBelief,
                  VertexAIPredictionSafetyAttributesCategory.drugs,
                  VertexAIPredictionSafetyAttributesCategory.warAndConflict,
                  VertexAIPredictionSafetyAttributesCategory.politics,
                  VertexAIPredictionSafetyAttributesCategory.finance,
                  VertexAIPredictionSafetyAttributesCategory.legal,
                ],
                scores: [
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                ],
                blocked: false,
              ),
              VertexAIPredictionSafetyAttributes(
                categories: [
                  VertexAIPredictionSafetyAttributesCategory.derogatory,
                ],
                scores: [
                  0.1,
                ],
                blocked: false,
              ),
            ],
          ),
        ],
        metadata: const VertexAITextChatModelResponseMetadata(
          token: VertexAITextChatModelResponseMetadataToken(
            inputTotalTokens: 10,
            inputTotalBillableCharacters: 42,
            outputTotalTokens: 256,
            outputTotalBillableCharacters: 1025,
          ),
        ),
      );

      final res = VertexAITextChatModelGoogleApisMapper.mapResponse(response);
      expect(res, expected);
    });
  });
}
