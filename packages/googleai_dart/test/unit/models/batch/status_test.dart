import 'package:googleai_dart/src/models/batch/status.dart';
import 'package:test/test.dart';

void main() {
  group('Status', () {
    test('fromJson creates Status with all fields', () {
      final json = {
        'code': 404,
        'message': 'Not Found',
        'details': [
          {
            '@type': 'type.googleapis.com/google.rpc.ErrorInfo',
            'reason': 'TEST',
          }
        ],
      };

      final status = Status.fromJson(json);

      expect(status.code, 404);
      expect(status.message, 'Not Found');
      expect(status.details, isNotNull);
      expect(status.details!.length, 1);
      expect(status.details![0]['reason'], 'TEST');
    });

    test('fromJson creates Status with minimal fields', () {
      final json = <String, dynamic>{};

      final status = Status.fromJson(json);

      expect(status.code, isNull);
      expect(status.message, isNull);
      expect(status.details, isNull);
    });

    test('fromJson handles only code', () {
      final json = {'code': 500};

      final status = Status.fromJson(json);

      expect(status.code, 500);
      expect(status.message, isNull);
      expect(status.details, isNull);
    });

    test('toJson creates JSON with all fields', () {
      const status = Status(
        code: 404,
        message: 'Not Found',
        details: [
          {
            '@type': 'type.googleapis.com/google.rpc.ErrorInfo',
            'reason': 'TEST',
          }
        ],
      );

      final json = status.toJson();

      expect(json['code'], 404);
      expect(json['message'], 'Not Found');
      expect(json['details'], isNotNull);
      expect(json['details'], isA<List<dynamic>>());
    });

    test('toJson omits null fields', () {
      const status = Status();

      final json = status.toJson();

      expect(json, isEmpty);
    });

    test('round-trip conversion preserves values', () {
      const original = Status(
        code: 503,
        message: 'Service Unavailable',
        details: [
          {'reason': 'OVERLOADED'},
        ],
      );

      final json = original.toJson();
      final converted = Status.fromJson(json);

      expect(converted.code, original.code);
      expect(converted.message, original.message);
      expect(converted.details, original.details);
    });
  });
}
