// ignore_for_file: avoid_redundant_argument_values
import 'package:googleapis/aiplatform/v1.dart';
import 'package:test/test.dart';
import 'package:vertex_ai/src/matching_engine/mappers/mappers.dart';
import 'package:vertex_ai/vertex_ai.dart';

void main() {
  group('VertexAIOperationGoogleApisMapper tests', () {
    test('VertexAIOperationGoogleApisMapper.mapOperation', () {
      final operation = GoogleLongrunningOperation(
        name: 'projects/PROJECT_NUMBER/locations/LOCATION/indexes/INDEX_ID',
        done: true,
        response: {},
        error: GoogleRpcStatus(
          code: 0,
          details: const [],
          message: 'message',
        ),
        metadata: {},
      );
      const expected = VertexAIOperation(
        name: 'projects/PROJECT_NUMBER/locations/LOCATION/indexes/INDEX_ID',
        done: true,
        response: {},
        error: VertexAIOperationError(
          code: 0,
          details: [],
          message: 'message',
        ),
        metadata: {},
      );

      final res = VertexAIOperationGoogleApisMapper.mapOperation(operation);
      expect(res, expected);
    });
  });
}
