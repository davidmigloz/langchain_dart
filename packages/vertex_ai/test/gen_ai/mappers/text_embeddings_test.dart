import 'package:googleapis/aiplatform/v1.dart';
import 'package:test/test.dart';
import 'package:vertex_ai/src/gen_ai/mappers/mappers.dart';
import 'package:vertex_ai/vertex_ai.dart';

void main() {
  group('VertexAITextEmbeddingsModelGoogleApisMapper tests', () {
    test('VertexAITextEmbeddingsModelGoogleApisMapper.mapRequest', () {
      const request = VertexAITextEmbeddingsModelRequest(
        content: [
          'CONTENT 1',
          'CONTENT 2',
          'CONTENT 3',
          'CONTENT 4',
          'CONTENT 5',
        ],
      );
      final expected = GoogleCloudAiplatformV1PredictRequest(
        instances: [
          {'content': 'CONTENT 1'},
          {'content': 'CONTENT 2'},
          {'content': 'CONTENT 3'},
          {'content': 'CONTENT 4'},
          {'content': 'CONTENT 5'},
        ],
      );

      final req =
          VertexAITextEmbeddingsModelGoogleApisMapper.mapRequest(request);
      expect(req.instances, expected.instances);
      expect(req.parameters, expected.parameters);
    });

    test('VertexAITextEmbeddingsModelGoogleApisMapper.mapResponse', () {
      final response = GoogleCloudAiplatformV1PredictResponse(
        predictions: [
          {
            'embeddings': {
              'values': [0.1, 0.2, 0.3],
              'statistics': {
                'truncated': false,
                'token_count': 17,
              },
            },
          },
          {
            'embeddings': {
              'values': [0.3, 0.2, 0.1],
              'statistics': {
                'truncated': false,
                'token_count': 5,
              },
            },
          },
        ],
        metadata: {
          'billableCharacterCount': 274,
        },
      );
      const expected = VertexAITextEmbeddingsModelResponse(
        predictions: [
          VertexAITextEmbeddingsModelPrediction(
            values: [0.1, 0.2, 0.3],
            statistics: VertexAITextEmbeddingsModelResponseStatistics(
              truncated: false,
              tokenCount: 17,
            ),
          ),
          VertexAITextEmbeddingsModelPrediction(
            values: [0.3, 0.2, 0.1],
            statistics: VertexAITextEmbeddingsModelResponseStatistics(
              truncated: false,
              tokenCount: 5,
            ),
          ),
        ],
        metadata: VertexAITextEmbeddingsModelResponseMetadata(
          billableCharacterCount: 274,
        ),
      );

      final res =
          VertexAITextEmbeddingsModelGoogleApisMapper.mapResponse(response);
      expect(res, expected);
    });
  });
}
