import 'package:googleai_dart/src/models/batch/batch_stats.dart';
import 'package:test/test.dart';

void main() {
  group('BatchStats', () {
    test('fromJson creates BatchStats with all fields', () {
      final json = {
        'requestCount': '100',
        'successfulRequestCount': '80',
        'failedRequestCount': '15',
        'pendingRequestCount': '5',
      };

      final stats = BatchStats.fromJson(json);

      expect(stats.requestCount, 100);
      expect(stats.successfulRequestCount, 80);
      expect(stats.failedRequestCount, 15);
      expect(stats.pendingRequestCount, 5);
    });

    test('fromJson creates BatchStats with null fields', () {
      final json = <String, dynamic>{};

      final stats = BatchStats.fromJson(json);

      expect(stats.requestCount, isNull);
      expect(stats.successfulRequestCount, isNull);
      expect(stats.failedRequestCount, isNull);
      expect(stats.pendingRequestCount, isNull);
    });

    test('fromJson handles large int64 values', () {
      final json = {
        'requestCount': '9223372036854775807', // Max int64
      };

      final stats = BatchStats.fromJson(json);

      expect(stats.requestCount, 9223372036854775807);
    });

    test('toJson creates JSON with all fields', () {
      const stats = BatchStats(
        requestCount: 100,
        successfulRequestCount: 80,
        failedRequestCount: 15,
        pendingRequestCount: 5,
      );

      final json = stats.toJson();

      expect(json['requestCount'], '100');
      expect(json['successfulRequestCount'], '80');
      expect(json['failedRequestCount'], '15');
      expect(json['pendingRequestCount'], '5');
    });

    test('toJson omits null fields', () {
      const stats = BatchStats();

      final json = stats.toJson();

      expect(json, isEmpty);
    });

    test('toJson includes only non-null fields', () {
      const stats = BatchStats(
        requestCount: 100,
        successfulRequestCount: 80,
      );

      final json = stats.toJson();

      expect(json['requestCount'], '100');
      expect(json['successfulRequestCount'], '80');
      expect(json.containsKey('failedRequestCount'), isFalse);
      expect(json.containsKey('pendingRequestCount'), isFalse);
    });

    test('round-trip conversion preserves values', () {
      const original = BatchStats(
        requestCount: 100,
        successfulRequestCount: 80,
        failedRequestCount: 15,
        pendingRequestCount: 5,
      );

      final json = original.toJson();
      final converted = BatchStats.fromJson(json);

      expect(converted.requestCount, original.requestCount);
      expect(converted.successfulRequestCount, original.successfulRequestCount);
      expect(converted.failedRequestCount, original.failedRequestCount);
      expect(converted.pendingRequestCount, original.pendingRequestCount);
    });

    test('handles zero values correctly', () {
      const stats = BatchStats(
        requestCount: 0,
        successfulRequestCount: 0,
        failedRequestCount: 0,
        pendingRequestCount: 0,
      );

      final json = stats.toJson();
      final converted = BatchStats.fromJson(json);

      expect(converted.requestCount, 0);
      expect(converted.successfulRequestCount, 0);
      expect(converted.failedRequestCount, 0);
      expect(converted.pendingRequestCount, 0);
    });
  });
}
