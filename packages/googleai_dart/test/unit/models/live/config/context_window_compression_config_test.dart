import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('ContextWindowCompressionConfig', () {
    group('fromJson', () {
      test('creates ContextWindowCompressionConfig with all fields', () {
        final json = {
          'triggerTokens': 10000,
          'slidingWindow': {'targetTokens': 5000},
        };

        final config = ContextWindowCompressionConfig.fromJson(json);

        expect(config.triggerTokens, 10000);
        expect(config.slidingWindow, isNotNull);
        expect(config.slidingWindow!.targetTokens, 5000);
      });

      test('creates ContextWindowCompressionConfig with minimal fields', () {
        final json = <String, dynamic>{};
        final config = ContextWindowCompressionConfig.fromJson(json);

        expect(config.triggerTokens, isNull);
        expect(config.slidingWindow, isNull);
      });

      test(
        'creates ContextWindowCompressionConfig with only triggerTokens',
        () {
          final json = {'triggerTokens': 8000};
          final config = ContextWindowCompressionConfig.fromJson(json);

          expect(config.triggerTokens, 8000);
          expect(config.slidingWindow, isNull);
        },
      );

      test(
        'creates ContextWindowCompressionConfig with only slidingWindow',
        () {
          final json = {
            'slidingWindow': {'targetTokens': 3000},
          };
          final config = ContextWindowCompressionConfig.fromJson(json);

          expect(config.triggerTokens, isNull);
          expect(config.slidingWindow, isNotNull);
          expect(config.slidingWindow!.targetTokens, 3000);
        },
      );
    });

    group('toJson', () {
      test('includes all non-null fields', () {
        const config = ContextWindowCompressionConfig(
          triggerTokens: 10000,
          slidingWindow: SlidingWindow(targetTokens: 5000),
        );

        final json = config.toJson();

        expect(json['triggerTokens'], 10000);
        expect(json['slidingWindow'], isNotNull);
        final slidingWindow = json['slidingWindow'] as Map<String, dynamic>;
        expect(slidingWindow['targetTokens'], 5000);
      });

      test('omits null fields', () {
        const config = ContextWindowCompressionConfig();
        final json = config.toJson();

        expect(json, isEmpty);
      });

      test('includes only triggerTokens when specified', () {
        const config = ContextWindowCompressionConfig(triggerTokens: 8000);
        final json = config.toJson();

        expect(json.containsKey('triggerTokens'), true);
        expect(json.containsKey('slidingWindow'), false);
      });
    });

    group('copyWith', () {
      test('with no params returns instance with same values', () {
        const original = ContextWindowCompressionConfig(
          triggerTokens: 10000,
          slidingWindow: SlidingWindow(targetTokens: 5000),
        );
        final copied = original.copyWith();

        expect(copied.triggerTokens, original.triggerTokens);
        expect(
          copied.slidingWindow!.targetTokens,
          original.slidingWindow!.targetTokens,
        );
      });

      test('updates specified fields only', () {
        const original = ContextWindowCompressionConfig(
          triggerTokens: 10000,
          slidingWindow: SlidingWindow(targetTokens: 5000),
        );
        final updated = original.copyWith(triggerTokens: 15000);

        expect(updated.triggerTokens, 15000);
        expect(
          updated.slidingWindow!.targetTokens,
          original.slidingWindow!.targetTokens,
        );
      });

      test('can update both fields', () {
        const original = ContextWindowCompressionConfig();
        final updated = original.copyWith(
          triggerTokens: 20000,
          slidingWindow: const SlidingWindow(targetTokens: 8000),
        );

        expect(updated.triggerTokens, 20000);
        expect(updated.slidingWindow!.targetTokens, 8000);
      });
    });

    test('round-trip conversion preserves data', () {
      const original = ContextWindowCompressionConfig(
        triggerTokens: 10000,
        slidingWindow: SlidingWindow(targetTokens: 5000),
      );

      final json = original.toJson();
      final restored = ContextWindowCompressionConfig.fromJson(json);

      expect(restored.triggerTokens, original.triggerTokens);
      expect(
        restored.slidingWindow!.targetTokens,
        original.slidingWindow!.targetTokens,
      );
    });

    test('toString includes all fields', () {
      const config = ContextWindowCompressionConfig(
        triggerTokens: 10000,
        slidingWindow: SlidingWindow(targetTokens: 5000),
      );
      final str = config.toString();

      expect(str, contains('ContextWindowCompressionConfig'));
      expect(str, contains('triggerTokens'));
      expect(str, contains('slidingWindow'));
    });
  });
}
