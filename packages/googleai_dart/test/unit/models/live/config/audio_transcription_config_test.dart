import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('AudioTranscriptionConfig', () {
    group('fromJson', () {
      test('creates AudioTranscriptionConfig with enabled true', () {
        final json = {'enabled': true};
        final config = AudioTranscriptionConfig.fromJson(json);

        expect(config.enabled, true);
      });

      test('creates AudioTranscriptionConfig with enabled false', () {
        final json = {'enabled': false};
        final config = AudioTranscriptionConfig.fromJson(json);

        expect(config.enabled, false);
      });

      test('creates AudioTranscriptionConfig with minimal fields', () {
        final json = <String, dynamic>{};
        final config = AudioTranscriptionConfig.fromJson(json);

        expect(config.enabled, isNull);
      });
    });

    group('toJson', () {
      test('includes enabled when true', () {
        const config = AudioTranscriptionConfig(enabled: true);
        final json = config.toJson();

        expect(json['enabled'], true);
      });

      test('includes enabled when false', () {
        const config = AudioTranscriptionConfig(enabled: false);
        final json = config.toJson();

        expect(json['enabled'], false);
      });

      test('omits null fields', () {
        const config = AudioTranscriptionConfig();
        final json = config.toJson();

        expect(json, isEmpty);
      });
    });

    group('copyWith', () {
      test('with no params returns instance with same values', () {
        const original = AudioTranscriptionConfig(enabled: true);
        final copied = original.copyWith();

        expect(copied.enabled, original.enabled);
      });

      test('updates enabled', () {
        const original = AudioTranscriptionConfig(enabled: true);
        final updated = original.copyWith(enabled: false);

        expect(updated.enabled, false);
      });
    });

    group('factory constructors', () {
      test('enabled creates config with enabled true', () {
        final config = AudioTranscriptionConfig.enabled();

        expect(config.enabled, true);
      });

      test('disabled creates config with enabled false', () {
        final config = AudioTranscriptionConfig.disabled();

        expect(config.enabled, false);
      });
    });

    test('round-trip conversion preserves data', () {
      const original = AudioTranscriptionConfig(enabled: true);
      final json = original.toJson();
      final restored = AudioTranscriptionConfig.fromJson(json);

      expect(restored.enabled, original.enabled);
    });

    test('toString includes enabled', () {
      const config = AudioTranscriptionConfig(enabled: true);
      final str = config.toString();

      expect(str, contains('AudioTranscriptionConfig'));
      expect(str, contains('enabled'));
      expect(str, contains('true'));
    });
  });
}
