import 'package:googleai_dart/src/models/prediction/predict_long_running_metadata.dart';
import 'package:test/test.dart';

void main() {
  group('PredictLongRunningMetadata', () {
    test('fromJson creates metadata (empty placeholder)', () {
      final json = <String, dynamic>{};

      final metadata = PredictLongRunningMetadata.fromJson(json);

      expect(metadata, isA<PredictLongRunningMetadata>());
    });

    test('fromJson ignores any fields (future compatibility)', () {
      final json = {'futureField': 'value', 'anotherField': 123};

      final metadata = PredictLongRunningMetadata.fromJson(json);

      expect(metadata, isA<PredictLongRunningMetadata>());
    });

    test('toJson returns empty map', () {
      const metadata = PredictLongRunningMetadata();

      final json = metadata.toJson();

      expect(json, isEmpty);
    });

    test('copyWith returns new instance', () {
      const original = PredictLongRunningMetadata();

      final copied = original.copyWith();

      expect(copied, isA<PredictLongRunningMetadata>());
    });

    test('round-trip serialization works', () {
      final original = <String, dynamic>{};

      final metadata = PredictLongRunningMetadata.fromJson(original);
      final serialized = metadata.toJson();

      expect(serialized, isEmpty);
    });
  });
}
