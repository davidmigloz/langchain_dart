import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('SlidingWindow', () {
    group('fromJson', () {
      test('creates SlidingWindow with targetTokens', () {
        final json = {'targetTokens': 5000};
        final window = SlidingWindow.fromJson(json);

        expect(window.targetTokens, 5000);
      });

      test('creates SlidingWindow with minimal fields', () {
        final json = <String, dynamic>{};
        final window = SlidingWindow.fromJson(json);

        expect(window.targetTokens, isNull);
      });
    });

    group('toJson', () {
      test('includes targetTokens when set', () {
        const window = SlidingWindow(targetTokens: 3000);
        final json = window.toJson();

        expect(json['targetTokens'], 3000);
      });

      test('omits null fields', () {
        const window = SlidingWindow();
        final json = window.toJson();

        expect(json, isEmpty);
      });
    });

    group('copyWith', () {
      test('with no params returns instance with same values', () {
        const original = SlidingWindow(targetTokens: 5000);
        final copied = original.copyWith();

        expect(copied.targetTokens, original.targetTokens);
      });

      test('updates targetTokens', () {
        const original = SlidingWindow(targetTokens: 5000);
        final updated = original.copyWith(targetTokens: 8000);

        expect(updated.targetTokens, 8000);
      });
    });

    test('round-trip conversion preserves data', () {
      const original = SlidingWindow(targetTokens: 10000);
      final json = original.toJson();
      final restored = SlidingWindow.fromJson(json);

      expect(restored.targetTokens, original.targetTokens);
    });

    test('toString includes targetTokens', () {
      const window = SlidingWindow(targetTokens: 5000);
      final str = window.toString();

      expect(str, contains('SlidingWindow'));
      expect(str, contains('targetTokens'));
      expect(str, contains('5000'));
    });
  });
}
