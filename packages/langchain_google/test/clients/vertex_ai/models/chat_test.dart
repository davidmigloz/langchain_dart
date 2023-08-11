import 'package:googleapis/aiplatform/v1.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

void main() {
  group('VertexAIChatModel models tests', () {
    test('VertexAIChatModelRequest.toRequest', () {
      const request = VertexAIChatModelRequest(
        context: 'CONTEXT',
        examples: [
          VertexAIChatModelExample(
            input: VertexAIChatModelMessage(
              author: 'USER',
              content: 'Hello',
            ),
            output: VertexAIChatModelMessage(
              author: 'AI',
              content: 'World',
            ),
          ),
        ],
        messages: [
          VertexAIChatModelMessage(
            author: 'USER',
            content: 'Hello',
          ),
        ],
        params: VertexAIModelRequestParams(
          temperature: 0.1,
          maxOutputTokens: 256,
          topP: 0.1,
          topK: 30,
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
        },
      );

      final req = request.toRequest();
      expect(req.instances, expected.instances);
      expect(req.parameters, expected.parameters);
    });

    test('VertexAIChatModelResponse.fromMap', () {
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
      final expected = VertexAIChatModelResponse(
        predictions: [
          VertexAIChatModelPrediction(
            candidates: const [
              VertexAIChatModelMessage(
                author: 'AI',
                content: 'Hello world!',
              ),
              VertexAIChatModelMessage(
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
              )
            ],
          ),
        ],
        metadata: const VertexAIResponseMetadata(
          token: VertexAIResponseMetadataToken(
            inputTotalTokens: 10,
            inputTotalBillableCharacters: 42,
            outputTotalTokens: 256,
            outputTotalCharacters: 1025,
          ),
        ),
      );

      final res = VertexAIChatModelResponse.fromResponse(response);
      expect(res, expected);
    });
  });
}
