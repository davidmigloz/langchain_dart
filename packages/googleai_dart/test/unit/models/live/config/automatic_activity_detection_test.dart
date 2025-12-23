import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('AutomaticActivityDetection', () {
    group('fromJson', () {
      test('creates AutomaticActivityDetection with all fields', () {
        final json = {
          'disabled': false,
          'startOfSpeechSensitivity': 'HIGH',
          'endOfSpeechSensitivity': 'LOW',
          'prefixPaddingMs': 100,
          'silenceDurationMs': 500,
        };

        final config = AutomaticActivityDetection.fromJson(json);

        expect(config.disabled, false);
        expect(config.startOfSpeechSensitivity, StartSensitivity.high);
        expect(config.endOfSpeechSensitivity, EndSensitivity.low);
        expect(config.prefixPaddingMs, 100);
        expect(config.silenceDurationMs, 500);
      });

      test('creates AutomaticActivityDetection with minimal fields', () {
        final json = <String, dynamic>{};
        final config = AutomaticActivityDetection.fromJson(json);

        expect(config.disabled, isNull);
        expect(config.startOfSpeechSensitivity, isNull);
        expect(config.endOfSpeechSensitivity, isNull);
        expect(config.prefixPaddingMs, isNull);
        expect(config.silenceDurationMs, isNull);
      });

      test('creates AutomaticActivityDetection with only disabled', () {
        final json = {'disabled': true};
        final config = AutomaticActivityDetection.fromJson(json);

        expect(config.disabled, true);
        expect(config.startOfSpeechSensitivity, isNull);
      });
    });

    group('toJson', () {
      test('includes all non-null fields', () {
        const config = AutomaticActivityDetection(
          disabled: false,
          startOfSpeechSensitivity: StartSensitivity.high,
          endOfSpeechSensitivity: EndSensitivity.low,
          prefixPaddingMs: 100,
          silenceDurationMs: 500,
        );

        final json = config.toJson();

        expect(json['disabled'], false);
        expect(json['startOfSpeechSensitivity'], 'HIGH');
        expect(json['endOfSpeechSensitivity'], 'LOW');
        expect(json['prefixPaddingMs'], 100);
        expect(json['silenceDurationMs'], 500);
      });

      test('omits null fields', () {
        const config = AutomaticActivityDetection();
        final json = config.toJson();

        expect(json, isEmpty);
      });

      test('includes only specified fields', () {
        const config = AutomaticActivityDetection(
          disabled: true,
          silenceDurationMs: 300,
        );
        final json = config.toJson();

        expect(json.containsKey('disabled'), true);
        expect(json.containsKey('silenceDurationMs'), true);
        expect(json.containsKey('startOfSpeechSensitivity'), false);
        expect(json.containsKey('endOfSpeechSensitivity'), false);
        expect(json.containsKey('prefixPaddingMs'), false);
      });
    });

    group('copyWith', () {
      test('with no params returns instance with same values', () {
        const original = AutomaticActivityDetection(
          disabled: false,
          silenceDurationMs: 500,
        );
        final copied = original.copyWith();

        expect(copied.disabled, original.disabled);
        expect(copied.silenceDurationMs, original.silenceDurationMs);
      });

      test('updates specified fields only', () {
        const original = AutomaticActivityDetection(
          disabled: false,
          silenceDurationMs: 500,
        );
        final updated = original.copyWith(silenceDurationMs: 300);

        expect(updated.disabled, original.disabled);
        expect(updated.silenceDurationMs, 300);
      });

      test('can update multiple fields', () {
        const original = AutomaticActivityDetection();
        final updated = original.copyWith(
          disabled: false,
          startOfSpeechSensitivity: StartSensitivity.high,
          endOfSpeechSensitivity: EndSensitivity.low,
          prefixPaddingMs: 50,
          silenceDurationMs: 400,
        );

        expect(updated.disabled, false);
        expect(updated.startOfSpeechSensitivity, StartSensitivity.high);
        expect(updated.endOfSpeechSensitivity, EndSensitivity.low);
        expect(updated.prefixPaddingMs, 50);
        expect(updated.silenceDurationMs, 400);
      });
    });

    group('factory constructors', () {
      test('enabled creates config with VAD enabled', () {
        final config = AutomaticActivityDetection.enabled(
          silenceDurationMs: 500,
        );

        expect(config.disabled, false);
        expect(config.silenceDurationMs, 500);
      });

      test('enabled with all sensitivity options', () {
        final config = AutomaticActivityDetection.enabled(
          startSensitivity: StartSensitivity.low,
          endSensitivity: EndSensitivity.high,
          prefixPaddingMs: 100,
          silenceDurationMs: 300,
        );

        expect(config.disabled, false);
        expect(config.startOfSpeechSensitivity, StartSensitivity.low);
        expect(config.endOfSpeechSensitivity, EndSensitivity.high);
        expect(config.prefixPaddingMs, 100);
        expect(config.silenceDurationMs, 300);
      });

      test('manual creates config with VAD disabled', () {
        final config = AutomaticActivityDetection.manual();

        expect(config.disabled, true);
        expect(config.silenceDurationMs, isNull);
        expect(config.startOfSpeechSensitivity, isNull);
      });
    });

    test('round-trip conversion preserves data', () {
      const original = AutomaticActivityDetection(
        disabled: false,
        startOfSpeechSensitivity: StartSensitivity.high,
        endOfSpeechSensitivity: EndSensitivity.low,
        prefixPaddingMs: 100,
        silenceDurationMs: 500,
      );

      final json = original.toJson();
      final restored = AutomaticActivityDetection.fromJson(json);

      expect(restored.disabled, original.disabled);
      expect(
        restored.startOfSpeechSensitivity,
        original.startOfSpeechSensitivity,
      );
      expect(restored.endOfSpeechSensitivity, original.endOfSpeechSensitivity);
      expect(restored.prefixPaddingMs, original.prefixPaddingMs);
      expect(restored.silenceDurationMs, original.silenceDurationMs);
    });

    test('toString includes key fields', () {
      const config = AutomaticActivityDetection(
        disabled: false,
        silenceDurationMs: 500,
      );
      final str = config.toString();

      expect(str, contains('AutomaticActivityDetection'));
      expect(str, contains('disabled'));
      expect(str, contains('silenceDurationMs'));
    });
  });
}
