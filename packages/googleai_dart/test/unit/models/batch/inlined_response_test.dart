import 'package:googleai_dart/src/models/batch/inlined_response.dart';
import 'package:googleai_dart/src/models/batch/status.dart';
import 'package:test/test.dart';

void main() {
  group('InlinedResponse', () {
    test('fromJson creates InlinedResponse with error', () {
      final json = {
        'error': {
          'code': 400,
          'message': 'Bad Request',
        },
        'metadata': {
          'requestId': 'req-123',
        },
      };

      final response = InlinedResponse.fromJson(json);

      expect(response.error, isNotNull);
      expect(response.error!.code, 400);
      expect(response.error!.message, 'Bad Request');
      expect(response.response, isNull);
      expect(response.metadata, isNotNull);
      expect(response.metadata!['requestId'], 'req-123');
    });

    test('fromJson creates InlinedResponse with response', () {
      final json = {
        'response': {
          'candidates': [
            {
              'content': {
                'parts': [
                  {'text': 'Hello!'},
                ],
                'role': 'model',
              },
              'finishReason': 'STOP',
            }
          ],
        },
      };

      final response = InlinedResponse.fromJson(json);

      expect(response.error, isNull);
      expect(response.response, isNotNull);
      expect(response.response!.candidates!.length, 1);
    });

    test('fromJson creates InlinedResponse with neither error nor response',
        () {
      final json = {
        'metadata': {
          'info': 'test',
        },
      };

      final response = InlinedResponse.fromJson(json);

      expect(response.error, isNull);
      expect(response.response, isNull);
      expect(response.metadata, isNotNull);
    });

    test('toJson creates JSON with error', () {
      const response = InlinedResponse(
        error: Status(code: 500, message: 'Internal Error'),
        metadata: {'requestId': 'req-789'},
      );

      final json = response.toJson();

      expect(json['error'], isNotNull);
      expect(json.containsKey('response'), isFalse);
      expect(json['metadata'], isNotNull);
    });

    test('toJson omits null fields', () {
      const response = InlinedResponse();

      final json = response.toJson();

      expect(json, isEmpty);
    });

    test('round-trip conversion with error preserves values', () {
      const original = InlinedResponse(
        error: Status(code: 404, message: 'Not Found'),
        metadata: {'test': 'value'},
      );

      final json = original.toJson();
      final converted = InlinedResponse.fromJson(json);

      expect(converted.error!.code, original.error!.code);
      expect(converted.error!.message, original.error!.message);
      expect(converted.metadata, original.metadata);
    });
  });
}
