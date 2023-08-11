import 'package:googleapis/aiplatform/v1.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

void main() {
  group('VertexAITextModel models tests', () {
    test('VertexAITextModelRequest.toRequest', () {
      const request = VertexAITextModelRequest(
        prompt: 'PROMPT',
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
            'prompt': 'PROMPT',
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

    test('VertexAITextModelResponse.fromMap', () {
      final response = GoogleCloudAiplatformV1PredictResponse(
        predictions: [
          {
            'content': 'RESPONSE',
            'citationMetadata': {
              'citations': [
                {
                  'startIndex': 13,
                  'endIndex': 158,
                  'url': 'https://example.com',
                  'title': 'Example Title',
                  'license': 'CC BY-SA 4.0',
                  'publicationDate': '2023-02-11',
                },
              ]
            },
            'safetyAttributes': {
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
      final expected = VertexAITextModelResponse(
        predictions: [
          VertexAITextModelPrediction(
            content: 'RESPONSE',
            citations: [
              VertexAIPredictionCitation(
                startIndex: 13,
                endIndex: 158,
                url: 'https://example.com',
                title: 'Example Title',
                license: 'CC BY-SA 4.0',
                publicationDate: DateTime(2023, 2, 11),
              ),
            ],
            safetyAttributes: const VertexAIPredictionSafetyAttributes(
              categories: [
                VertexAIPredictionSafetyAttributesCategory.derogatory,
                VertexAIPredictionSafetyAttributesCategory.toxic,
                VertexAIPredictionSafetyAttributesCategory.violent,
                VertexAIPredictionSafetyAttributesCategory.sexual,
                VertexAIPredictionSafetyAttributesCategory.insult,
                VertexAIPredictionSafetyAttributesCategory.profanity,
                VertexAIPredictionSafetyAttributesCategory.deathHarmAndTragedy,
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

      final res = VertexAITextModelResponse.fromResponse(response);
      expect(res, expected);
    });
  });
}
